# -*- coding: utf-8  -*-
#
# Copyright (C) 2021 DSR! <xchwarze@gmail.com>
# Released under the terms of the MIT License
# Developed for Python 3.6+
# pip install requests py7zr

import argparse
import configparser
import requests
import re
import os
import shutil
import pathlib
import zipfile
import py7zr
import time


# Helpers functions
def get_filename_from_url(url):
    fragment_removed = url.split('#')[0]  # keep to left of first #
    query_string_removed = fragment_removed.split('?')[0]
    scheme_removed = query_string_removed.split('://')[-1].split(':')[-1]

    if scheme_removed.find('/') == -1:
        return ''

    return os.path.basename(scheme_removed)


def cleanup_folder(path):
    for file in os.listdir(path):
        full_path = os.path.join(path, file)
        if os.path.isdir(full_path):
            shutil.rmtree(full_path)
        else:
            os.remove(full_path)


def download(url, download_file_path):
    file_response = requests.get(url, allow_redirects=True, stream=True)
    file_response.raise_for_status()

    # for debug redirects
    #print('DEBUG: download url "{0}"'.format(file_response.url))

    with open(download_file_path, 'wb') as handle:
        for block in file_response.iter_content(1024):
            handle.write(block)


def unpack(file_path, file_ext, unpack_path, file_pass):
    if file_ext == '.zip':
        if file_pass:
            file_pass = bytes(file_pass, 'utf-8')

        with zipfile.ZipFile(file_path, 'r') as compressed:
            compressed.extractall(unpack_path, pwd=file_pass)

    elif file_ext == '.7z':
        with py7zr.SevenZipFile(file_path, 'r', password=file_pass) as compressed:
            compressed.extractall(unpack_path)

    else:
        pathlib.Path(unpack_path).mkdir(exist_ok=True)
        shutil.copy(file_path, unpack_path)


# Steps
def handle_updates(update_list, force_download, no_repack, no_clean):
    # create folder if dont exist
    if not os.path.exists(updates_path):
        os.mkdir(updates_path)

    for ini_name in update_list:
        try:
            update_tool(ini_name, force_download, no_repack, no_clean)
        except Exception as exception:
            print(exception)

    cleanup_folder(updates_path)


def update_tool(name, force_download, no_repack, no_clean):
    # generate download url
    from_url = config.get(name, 'from')
    download_url = config.get(name, 'url')
    if from_url == 'github':
        download_url = '{0}/releases/latest'.format(download_url)

    # load html
    html_response = requests.get(download_url)
    html_response.raise_for_status()

    # regex shit
    latest_version = check_version(name, html_response.text, force_download)
    update_download_url = get_download_url(name, html_response.text, from_url)

    # download
    download_file_name = get_filename_from_url(update_download_url)
    download_file_path = os.path.join(updates_path, download_file_name)
    print('{0}: downloading update "{1}"'.format(name, download_file_name))
    cleanup_folder(updates_path)
    download(update_download_url, download_file_path)
    file_info = os.path.splitext(download_file_path)

    # processing file
    print('{0}: processing file'.format(name))
    update_file_pass = config.get(name, 'update_file_pass', fallback=None)
    unpack_path = os.path.join(updates_path, file_info[0])
    unpack(download_file_path, file_info[1], unpack_path, update_file_pass)
    repack(name, unpack_path, latest_version, no_repack, no_clean)

    # update local version data
    config.set(name, 'local_version', latest_version)
    with open('tools.ini', 'w') as configfile:
        config.write(configfile)

    print('{0}: update complete'.format(name))


def check_version(name, html, force_download):
    # https://api.github.com/repos/horsicq/DIE-engine/releases/latest
    # python -c 'import json,sys;obj=json.load(sys.stdin);print obj["assets"][0]["browser_download_url"];'
    local_version = config.get(name, 'local_version')
    re_version = config.get(name, 're_version')
    html_regex_version = re.findall(re_version, html)

    if not html_regex_version:
        raise Exception('{0}: re_version not match'.format(name))

    if not force_download and local_version == html_regex_version[0]:
        raise Exception('{0}: {1} is the latest version'.format(name, local_version))

    print('{0}: updated from {1} --> {2}'.format(name, local_version, html_regex_version[0]))

    return html_regex_version[0]


def get_download_url(name, html, from_url):
    # case 1: if update_url is set... download it!
    update_download_url = config.get(name, 'update_url', fallback=None)
    re_download = config.get(name, 're_download', fallback=None)

    # case 2: if update_url is not set, scrape the link from html (ex: nirsoft)
    if not update_download_url:
        html_regex_download = re.findall(re_download, html)
        if not html_regex_download:
            raise Exception('{0}: re_download not match'.format(name))

        # fix github url
        update_download_url = html_regex_download[0]
        if from_url == 'github':
            update_download_url = 'https://github.com{0}'.format(update_download_url)

    # case 3: if update_url and re_download is set.... generate download link (ex: sourceforge)
    # anyway sourceforge response real download url when 302 redirect loop end
    elif re_download:
        html_regex_download = re.findall(re_download, html)
        if not html_regex_download:
            raise Exception('{0}: re_download not match'.format(name))

        update_download_url = '{0}{1}'.format(update_download_url, html_regex_download[0])

    if not update_download_url:
        raise Exception('{0}: update_download_url not generated!'.format(name))

    return update_download_url


def repack(name, unpack_path, version, no_repack, no_clean):
    # prepare
    tool_folder_name = config.get(name, 'folder')
    tool_folder_path = os.path.join(os.path.dirname(current_path), tool_folder_name)
    pathlib.Path(tool_folder_path).mkdir(parents=True, exist_ok=True)

    tool_name = '{0} - {1}.7z'.format(name, version)
    tmp_tool_path = os.path.join(os.path.dirname(unpack_path), tool_name)

    # dirty hack for correct folders structure
    folder_list = os.listdir(unpack_path)
    folder_sample = os.path.join(unpack_path, folder_list[0])
    if len(folder_list) == 1 & os.path.isdir(folder_sample):
        unpack_path = folder_sample

    # update tool
    if not no_clean:
        cleanup_folder(tool_folder_path)

    if no_repack:
        shutil.copytree(unpack_path, tool_folder_path, copy_function=shutil.copy, dirs_exist_ok=True)
    else:
        with py7zr.SevenZipFile(tmp_tool_path, 'w') as archive:
            archive.writeall(unpack_path, arcname='')

        shutil.copy(tmp_tool_path, tool_folder_path)


# Implementation
def print_banner():
    print("""
    ____          __     __            __        __    __         
   /  _/___  ____/ /__  / /____  _____/ /_____ _/ /_  / /__  _____
   / // __ \/ __  / _ \/ __/ _ \/ ___/ __/ __ `/ __ \/ / _ \/ ___/
 _/ // / / / /_/ /  __/ /_/  __/ /__/ /_/ /_/ / /_/ / /  __(__  ) 
/___/_/ /_/\__,_/\___/\__/\___/\___/\__/\__,_/_.___/_/\___/____/  

Universal Tool Updater - by DSR!
""")

def init_argparse():
    parser = argparse.ArgumentParser(
        usage="%(prog)s [ARGUMENTS]",
    )
    parser.add_argument(
        "-v",
        "--version",
        action="version",
        version="version 1.1.0-master"
    )
    parser.add_argument(
        "-u",
        "--update",
        dest='update',
        help="update tools (default: all)",
        nargs="*"
    )
    parser.add_argument(
        "-dfc",
        "--disable-folder-clean",
        dest='disable_folder_clean',
        help="disable tool folder clean (default: no_disable_folder_clean)",
        action=argparse.BooleanOptionalAction
    )
    parser.add_argument(
        "-dr",
        "--disable-repack",
        dest='disable_repack',
        help="disable tool repack (default: no_disable_repack)",
        action=argparse.BooleanOptionalAction
    )
    parser.add_argument(
        "-f",
        "--force",
        dest='force',
        help="force download (default: no_force)",
        action=argparse.BooleanOptionalAction
    )

    return parser


def main():
    print_banner()

    parser = init_argparse()
    args = parser.parse_args()
    update_list = args.update
    if not args.update:
        update_list = config.sections()

    handle_updates(
        update_list = update_list,
        force_download = args.force,
        no_repack = args.disable_repack,
        no_clean = args.disable_folder_clean
    )
    time.sleep(3)


# se fini
current_path = os.fsdecode(os.getcwdb())
updates_path = os.path.join(current_path, 'updates')
config = configparser.ConfigParser()
config.read('tools.ini')
main()
