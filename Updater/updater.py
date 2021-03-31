# -*- coding: utf-8  -*-
#
# Copyright (C) 2021 DSR! <xchwarze@gmail.com>
# Released under the terms of the MIT License
# Developed for Python 3.6+
# pip install requests py7zr

import configparser
import requests
import re
import os
import shutil
import pathlib
import zipfile
import py7zr


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


# Steps
def handle_updates():
    # create folder if dont exist
    if not os.path.exists(updates_path):
        os.mkdir(updates_path)

    for ini_name in config.sections():
        try:
            update_tool(ini_name)
        except Exception as exception:
            print(exception)

    cleanup_folder(updates_path)


def update_tool(name):
    # generate download url
    from_url = config.get(name, 'from')
    download_url = config.get(name, 'url')
    if from_url == 'github':
        download_url = '{0}/releases/latest'.format(download_url)

    # load html
    html_response = requests.get(download_url)
    html_response.raise_for_status()

    # regex shit
    latest_version = check_version(name, html_response.text)
    update_download_url = get_download_url(name, html_response.text, from_url)

    # download
    cleanup_folder(updates_path)
    file_path = download(name, update_download_url, updates_path)
    file_info = os.path.splitext(file_path)

    # processing file
    print('{0}: processing file'.format(name))
    unpack_path = os.path.join(updates_path, file_info[0])
    update_file_pass = config.get(name, 'update_file_pass', fallback=None)
    unpack(file_path, file_info[1], unpack_path, update_file_pass)
    repack(name, unpack_path, latest_version)

    # end!
    print('{0}: update complete'.format(name))


def check_version(name, html):
    # https://api.github.com/repos/horsicq/DIE-engine/releases/latest
    # python -c 'import json,sys;obj=json.load(sys.stdin);print obj["assets"][0]["browser_download_url"];'
    local_version = config.get(name, 'local_version')
    re_version = config.get(name, 're_version')
    html_regex_version = re.findall(re_version, html)

    if not html_regex_version:
        raise Exception('{0}: re_version not match'.format(name))

    if local_version == html_regex_version[0]:
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
    elif re_download:
        html_regex_download = re.findall(re_download, html)
        if not html_regex_download:
            raise Exception('{0}: re_download not match'.format(name))

        update_download_url = '{0}{1}'.format(update_download_url, html_regex_download[0])

    if not update_download_url:
        raise Exception('{0}: update_download_url not generated!'.format(name))

    return update_download_url


def download(name, url, download_path):
    # prepare
    file_name = get_filename_from_url(url)
    file_path = os.path.join(download_path, file_name)
    print('{0}: downloading update "{1}"'.format(name, file_name))

    # download
    file_response = requests.get(url, stream=True)
    file_response.raise_for_status()

    with open(file_path, 'wb') as handle:
        for block in file_response.iter_content(1024):
            handle.write(block)

    return file_path


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
        shutil.copy2(file_path, unpack_path)


def repack(name, unpack_path, version):
    # prepare
    tool_folder_name = config.get(name, 'folder')
    tool_folder_path = os.path.join(os.path.dirname(current_path), tool_folder_name)
    tool_name = '{0} - {1}.7z'.format(name, version)
    tmp_tool_path = os.path.join(os.path.dirname(unpack_path), tool_name)

    # dirty hack for correct folders structure
    folder_list = os.listdir(unpack_path)
    folder_sample = os.path.join(unpack_path, folder_list[0])
    if len(folder_list) == 1 & os.path.isdir(folder_sample):
        unpack_path = folder_sample

    # update tool
    with py7zr.SevenZipFile(tmp_tool_path, 'w') as archive:
        archive.writeall(unpack_path, arcname='')

    pathlib.Path(tool_folder_path).mkdir(parents=True, exist_ok=True)
    cleanup_folder(tool_folder_path)
    shutil.copy2(tmp_tool_path, tool_folder_path)

    # update local version data
    config.set(name, 'local_version', version)
    with open('tools.ini', 'w') as configfile:
        config.write(configfile)


# se fini
current_path = os.fsdecode(os.getcwdb())
updates_path = os.path.join(current_path, 'updates')
config = configparser.ConfigParser()
config.read('tools.ini')
handle_updates()
