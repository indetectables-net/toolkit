# -*- coding: utf-8  -*-
#
# Copyright (C) 2021 DSR! <xchwarze@gmail.com>
# Released under the terms of the MIT License
# Developed for Python 3.6+
# pip install requests py7zr rarfile colorama tqdm

import argparse
import configparser
import requests
import re
import os
import shutil
import pathlib
import zipfile
import py7zr
import rarfile
import subprocess
import signal
import sys
import colorama
import tqdm
import urllib


# Helpers functions
def get_filename_from_url(url):
    fragment_removed = url.split('#')[0]  # keep to left of first #
    query_string_removed = fragment_removed.split('?')[0]
    scheme_removed = query_string_removed.split('://')[-1].split(':')[-1]

    if scheme_removed.find('/') == -1:
        return ''

    return pathlib.Path(scheme_removed).name


def cleanup_folder(path):
    for file in pathlib.Path(path).iterdir():
        if file.is_dir():
            shutil.rmtree(file)
        else:
            file.unlink()


def download(url, file_path, progress_bar_desc, disable_progress_bar=False):
    file_response = requests.get(url, allow_redirects=True, stream=True)
    file_response.raise_for_status()

    # for debug redirects
    # print('DEBUG: download url "{0}"'.format(file_response.url))

    total_length = int(file_response.headers.get('content-length', 0))
    with open(file_path, 'wb') as handle, tqdm.tqdm(
            disable=disable_progress_bar,
            colour='green',
            ncols=100,
            desc=progress_bar_desc,
            total=total_length,
            unit='iB',
            unit_scale=True,
            unit_divisor=1024,
    ) as bar:
        for block in file_response.iter_content(1024):
            size = handle.write(block)
            bar.update(size)

    bar.close()


def unpack(file_path, file_ext, unpack_path, file_pass):
    if file_ext == '.zip':
        if file_pass:
            file_pass = bytes(file_pass, 'utf-8')

        with zipfile.ZipFile(file_path, 'r') as compressed:
            compressed.extractall(unpack_path, pwd=file_pass)

    elif file_ext == '.rar':
        # downlad first "UnRAR for Windows" from https://www.rarlab.com/rar_add.htm
        # https://www.rarlab.com/rar/unrarw32.exe
        with rarfile.RarFile(file_path, 'r') as compressed:
            compressed.extractall(unpack_path, pwd=file_pass)

    elif file_ext == '.7z':
        with py7zr.SevenZipFile(file_path, 'r', password=file_pass) as compressed:
            compressed.extractall(unpack_path)

    else:
        pathlib.Path(unpack_path).mkdir(exist_ok=True)
        shutil.copy(file_path, unpack_path)


def save_config_to_file(config, config_file_name):
    with open(config_file_name, 'w') as config_file:
        config.write(config_file)


# Main Updater class
class Updater:
    def __init__(
            self, config, config_file_name, force_download, disable_repack, disable_clean,
            disable_install_check, disable_progress, save_format_type, use_github_api,
    ):
        self.name = ''
        self.config = config
        self.config_file_name = config_file_name
        self.force_download = force_download
        self.disable_repack = disable_repack
        self.disable_clean = disable_clean
        self.disable_install_check = disable_install_check
        self.disable_progress = disable_progress
        self.save_format_type = save_format_type
        self.script_path = os.fsdecode(os.getcwdb())
        self.update_folder_path = pathlib.Path(self.script_path).joinpath('updates')
        self.use_github_api = use_github_api
        self.re_github_version = '\/releases\/tag\/(\S+)"'
        self.re_github_download = '"(.*?/{0})"'

    def _check_version_from_web(self, html, re_version):
        local_version = self.config.get(self.name, 'local_version', fallback='0')
        html_regex_version = re.findall(re_version, html)

        if not html_regex_version:
            raise Exception(colorama.Fore.RED + '{0}: re_version regex not match'.format(self.name))

        if not self.force_download and local_version == html_regex_version[0]:
            raise Exception('{0}: {1} is the latest version'.format(self.name, local_version))

        print('{0}: updated from {1} --> {2}'.format(self.name, local_version, html_regex_version[0]))

        return html_regex_version[0]

    def _get_download_url_from_web(self, html, html_url, update_url, re_download):
        # case 2: if update_url is not set, scrape the link from html
        if re_download:
            html_regex_download = re.findall(re_download, html)
            if not html_regex_download:
                raise Exception(colorama.Fore.RED + '{0}: re_download regex not match'.format(self.name))

            # check if valid url
            download_url_parse = urllib.parse.urlparse(html_regex_download[0])

            # case 3: if update_url and re_download is set.... generate download link
            if update_url:
                update_url = '{0}{1}'.format(update_url, html_regex_download[0])
            elif download_url_parse.scheme == '':
                html_url_parse_fix = urllib.parse.urlparse(html_url)
                update_url = '{0}://{1}/{2}'.format(html_url_parse_fix.scheme, html_url_parse_fix.netloc, html_regex_download[0])
            else:
                update_url = html_regex_download[0]

        # case 1: if update_url is set... download it!
        if not update_url:
            raise Exception(colorama.Fore.RED + '{0}: update_url not generated!'.format(self.name))

        return update_url

    def _scrape_web(self, url, update_url, re_version, re_download):
        # load html
        html_response = requests.get(url)
        html_response.raise_for_status()

        # regex shit
        return {
            'download_version': self._check_version_from_web(html_response.text, re_version),
            'download_url': self._get_download_url_from_web(html_response.text, url, update_url, re_download),
        }

    def _check_version_from_github(self, json):
        local_version = self.config.get(self.name, 'local_version', fallback='0')

        if not self.force_download and local_version == json['tag_name']:
            raise Exception('{0}: {1} is the latest version'.format(self.name, local_version))

        print('{0}: updated from {1} --> {2}'.format(self.name, local_version, json['tag_name']))

        return json['tag_name']

    def _get_download_url_from_github(self, json, re_download):
        if not re_download:
            raise Exception(colorama.Fore.RED + '{0}: re_download regex not set'.format(self.name))

        update_url = None
        for attachment in json['assets']:
            html_regex_download = re.findall(re_download, attachment['browser_download_url'])
            if html_regex_download:
                update_url = attachment['browser_download_url']
                break

        if not update_url:
            raise Exception(colorama.Fore.RED + '{0}: re_download regex not match'.format(self.name))

        return update_url

    def _scrape_github(self, repo_path, re_download):
        if self.use_github_api:
            return self._scrape_github_api(repo_path, re_download)

        repo_url = 'https://github.com/{0}/releases/latest'.format(repo_path)
        #repo_url = 'https://github.com/{0}/releases.atom'.format(repo_path)
        re_download = self.re_github_download.format(re_download)

        return self._scrape_web(repo_url, '', self.re_github_version, re_download)

    def _scrape_github_api(self, repo_path, re_download):
        repo_url = 'https://api.github.com/repos/{0}/releases/latest'.format(repo_path)

        # load json
        html_response = requests.get(repo_url, headers={'Authorization': f'token {self.use_github_api}'})
        html_response.raise_for_status()
        json_response = html_response.json()

        # regex shit
        return {
            'download_version': self._check_version_from_github(json_response),
            'download_url': self._get_download_url_from_github(json_response, re_download),
        }

    def _unpack(self, file_path):
        file_ext = pathlib.Path(file_path).suffix
        update_folder = str(file_path).replace(file_ext, '')

        update_file_pass = self.config.get(self.name, 'update_file_pass', fallback=None)
        unpack_path = pathlib.Path(self.update_folder_path).joinpath(update_folder)
        unpack(file_path, file_ext, unpack_path, update_file_pass)

        # dirty hack for correct compress inside compress...
        folder_list = os.listdir(unpack_path)
        folder_sample = pathlib.Path(unpack_path).joinpath(folder_list[0])
        file_ext = pathlib.Path(folder_sample).suffix
        if len(folder_list) == 1 & (file_ext in ['.zip', '.rar', '.7z']):
            unpack(folder_sample, file_ext, unpack_path, None)
            os.remove(folder_sample)

        return unpack_path

    def _save(self, use_merge, tool_folder_path, tool_unpack_path):
        print('{0}: saving to folder {1}'.format(self.name, tool_folder_path))

        if not self.disable_clean and not use_merge:
            cleanup_folder(tool_folder_path)

        shutil.copytree(tool_unpack_path, tool_folder_path, copy_function=shutil.copy, dirs_exist_ok=True)

        return {
            'tool_name': self.name,
            'tool_folder': str(tool_folder_path),
            'save_compress_name': '',
        }

    def _repack_save_compress_name(self, name, version):
        pack_name = '{0} - {1}.7z'.format(name, version)
        if self.save_format_type == 'version':
            pack_name = '{0}.7z'.format(version)
        elif self.save_format_type == 'name':
            pack_name = '{0}.7z'.format(name)

        return pack_name

    def _repack_merge(self, tool_folder_path, tool_unpack_path):
        # checks and preparation
        old_version = self.config.get(self.name, 'local_version', fallback='0')
        old_compress_name = self._repack_save_compress_name(self.name, old_version)
        old_tool_compress_path = tool_folder_path.joinpath(old_compress_name)
        if not old_tool_compress_path.exists():
            return False

        print('{0}: merging with "{1}"'.format(self.name, old_compress_name))

        # unpack old version
        old_tool_unpack_folder = str(old_compress_name).replace('.7z', '')
        old_tool_unpack_path = pathlib.Path(self.update_folder_path).joinpath(old_tool_unpack_folder)
        unpack(old_tool_compress_path, '.7z', old_tool_unpack_path, None)

        # merge
        shutil.copytree(tool_unpack_path, old_tool_unpack_path, copy_function=shutil.copy, dirs_exist_ok=True)
        shutil.rmtree(tool_unpack_path)
        shutil.move(old_tool_unpack_path, tool_unpack_path, copy_function=shutil.copy)

    def _repack(self, use_merge, tool_folder_path, tool_unpack_path, unpack_folder_path, version):
        if use_merge:
            self._repack_merge(tool_folder_path, tool_unpack_path)

        print('{0}: saving to folder {1}'.format(self.name, tool_folder_path))

        if not self.disable_clean:
            cleanup_folder(tool_folder_path)

        save_compress_name = self._repack_save_compress_name(self.name, version)
        tool_repack_path = pathlib.Path(pathlib.Path(unpack_folder_path).parent).joinpath(save_compress_name)

        with py7zr.SevenZipFile(tool_repack_path, 'w') as archive:
            archive.writeall(tool_unpack_path, arcname='')

        shutil.copy(tool_repack_path, tool_folder_path)

        return {
            'tool_name': self.name,
            'tool_folder': str(tool_folder_path),
            'save_compress_name': save_compress_name,
        }

    def _tool_install_path(self):
        tool_folder_path = self.config.get(self.name, 'folder')
        if not pathlib.Path(tool_folder_path).is_absolute():
            tool_folder_path = pathlib.Path.resolve(
                pathlib.Path(self.script_path).joinpath(tool_folder_path)
            )

        return tool_folder_path

    def _processing_tool(self, tool_unpack_path):
        # dirty hack for correct folders structure
        folder_list = os.listdir(tool_unpack_path)
        folder_sample = pathlib.Path(tool_unpack_path).joinpath(folder_list[0])
        if len(folder_list) == 1 & os.path.isdir(folder_sample):
            tool_unpack_path = folder_sample

        # tool folder
        tool_folder_path = self._tool_install_path()
        pathlib.Path(tool_folder_path).mkdir(parents=True, exist_ok=True)

        return {
            'folder_path': tool_folder_path,
            'unpack_path': tool_unpack_path,
        }

    def _bump_version(self, latest_version):
        self.config.set(self.name, 'local_version', latest_version)
        save_config_to_file(self.config, self.config_file_name)

    def _exec_update_script(self, script_type):
        script = self.config.get(self.name, script_type, fallback=None)
        if script:
            print('{0}: exec {1} "{2}"'.format(self.name, script_type, script))
            print(colorama.Fore.BLUE + '------------------------------')
            subprocess.run(script)
            print(colorama.Fore.BLUE + '------------------------------')

    def _exec_global_update_script(self, processing_info):
        script = self.config.get('Updater', 'global_post_update', fallback=None)
        if script:
            print('{0}: exec global script "{1}"'.format(self.name, script))
            subprocess.run([
                script,
                processing_info['tool_name'],
                processing_info['tool_folder'],
                processing_info['save_compress_name'],
            ])

    def _scrape_step(self):
        tool_url = self.config.get(self.name, 'url', fallback=None)
        update_url = self.config.get(self.name, 'update_url', fallback=None)
        re_download = self.config.get(self.name, 're_download', fallback=None)
        re_version = self.config.get(self.name, 're_version', fallback=None)

        # case for don't process "Updater" tool
        if not tool_url:
            raise Exception()

        from_url = self.config.get(self.name, 'from', fallback='web')
        if from_url == 'github':
            return self._scrape_github(tool_url, re_download)

        return self._scrape_web(tool_url, update_url, re_version, re_download)

    def _download_step(self, download_url):
        # create updates folder if don't exist
        if not pathlib.Path.exists(self.update_folder_path):
            pathlib.Path.mkdir(self.update_folder_path)

        # download
        self.cleanup_update_folder()
        file_name = get_filename_from_url(download_url)
        file_path = pathlib.Path(self.update_folder_path).joinpath(file_name)

        print('{0}: downloading update "{1}"'.format(self.name, file_name))

        try:
            download(
                url=download_url,
                file_path=file_path,
                progress_bar_desc=self.name,
                disable_progress_bar=self.disable_progress,
            )
        except Exception as exception:
            print(colorama.Fore.RED + '{0}: download url {1}'.format(self.name, download_url))
            raise Exception(colorama.Fore.RED + '{0}: Error {1}'.format(self.name, exception))

        return file_path

    def _processing_step(self, file_path, download_version):
        unpack_folder_path = self._unpack(file_path)
        self._exec_update_script('post_unpack')

        use_merge = self.config.get(self.name, 'merge', fallback=None)
        tool = self._processing_tool(unpack_folder_path)
        if self.disable_repack:
            return self._save(
                use_merge=use_merge,
                tool_folder_path=tool['folder_path'],
                tool_unpack_path=tool['unpack_path'],
            )
        else:
            return self._repack(
                use_merge=use_merge,
                tool_folder_path=tool['folder_path'],
                tool_unpack_path=tool['unpack_path'],
                unpack_folder_path=unpack_folder_path,
                version=download_version,
            )

    def _check_tool_installed(self):
        tool_folder_path = self._tool_install_path()
        if not tool_folder_path.exists() and not self.disable_install_check:
            raise Exception('{0}: The program was not found'.format(self.name))

    def update(self, name):
        self.name = name

        # check if installed
        self._check_tool_installed()

        # execute custom pre update script
        self._exec_update_script('pre_update')

        # generate download url
        scrape_data = self._scrape_step()

        # download
        update_file_path = self._download_step(scrape_data['download_url'])

        # processing file
        processing_info = self._processing_step(update_file_path, scrape_data['download_version'])

        # update complete
        self._bump_version(scrape_data['download_version'])
        self._exec_update_script('post_update')
        self._exec_global_update_script(processing_info)
        print('{0}: update complete'.format(self.name))

    def cleanup_update_folder(self):
        cleanup_folder(self.update_folder_path)


# Implementation
class Setup:
    def __init__(self):
        self.version = '1.6.1'
        self.arguments = {}
        self.config = configparser.ConfigParser()
        self.default_config = {}
        self.config_file_name = 'tools.ini'

    def print_banner(self):
        print(colorama.Fore.YELLOW + """
     ____          __     __            __        __    __         
    /  _/___  ____/ /__  / /____  _____/ /_____ _/ /_  / /__  _____
    / // __ \/ __  / _ \/ __/ _ \/ ___/ __/ __ `/ __ \/ / _ \/ ___/
  _/ // / / / /_/ /  __/ /_/  __/ /__/ /_/ /_/ / /_/ / /  __(__  ) 
 /___/_/ /_/\__,_/\___/\__/\___/\___/\__/\__,_/_.___/_/\___/____/  
    
 Universal Tool Updater - by DSR!
 https://github.com/xchwarze/universal-tool-updater
    """)

    def exit_handler(self, signal, frame):
        print(colorama.Fore.YELLOW + 'SIGINT or CTRL-C detected. Exiting gracefully')
        sys.exit(0)

    def get_argparse_default(self, option, default, is_bool=True):
        if is_bool:
            #return value.lower() in ('true', '1', 'yes', 'on')
            return self.config.getboolean('Updater', option, fallback=default)

        return self.config.get('Updater', option, fallback=default)

    def init_argparse(self):
        parser = argparse.ArgumentParser(
            usage='%(prog)s [ARGUMENTS]',
        )
        parser.add_argument(
            '-v',
            '--version',
            action='version',
            version='Version: {0}'.format(self.version)
        )
        parser.add_argument(
            '-u',
            '--update',
            dest='update',
            help='update tools (default: all)',
            nargs='*'
        )
        parser.add_argument(
            '-dfc',
            '--disable-folder-clean',
            dest='disable_clean',
            help='disable tool folder clean',
            action=argparse.BooleanOptionalAction,
            default=self.get_argparse_default('disable_clean', False)
        )
        parser.add_argument(
            '-dr',
            '--disable-repack',
            dest='disable_repack',
            help='disable tool repack',
            action=argparse.BooleanOptionalAction,
            default=self.get_argparse_default('disable_repack', False)
        )
        parser.add_argument(
            '-dic',
            '--disable-install-check',
            dest='disable_install_check',
            help='disable tool install check',
            action=argparse.BooleanOptionalAction,
            default=self.get_argparse_default('disable_install_check', False)
        )
        parser.add_argument(
            '-dpb',
            '--disable-progress-bar',
            dest='disable_progress',
            help='disable download progress bar',
            action=argparse.BooleanOptionalAction,
            default=self.get_argparse_default('disable_progress', False)
        )
        parser.add_argument(
            '-sft',
            '--save-format-type',
            dest='save_format_type',
            help='compress save format name',
            choices=['full', 'version', 'name'],
            default=self.get_argparse_default('save_format_type', 'full', False)
        )
        parser.add_argument(
            '-f',
            '--force',
            dest='force_download',
            help='force download',
            action=argparse.BooleanOptionalAction,
            default=False
        )
        parser.add_argument(
            '-uga',
            '--use-github-api',
            dest='use_github_api',
            help='use github api with this token',
            default=self.get_argparse_default('use_github_api', '', False)
        )
        parser.add_argument(
            '-udp',
            '--update-default-params',
            dest='update_default_params',
            help='update default params',
            action=argparse.BooleanOptionalAction,
            default=False
        )

        self.arguments = parser.parse_args()

    def update_default_params(self):
        if not self.arguments.update_default_params:
            return False

        self.config.set('Updater', 'disable_clean', str(self.arguments.disable_clean))
        self.config.set('Updater', 'disable_repack', str(self.arguments.disable_repack))
        self.config.set('Updater', 'disable_install_check', str(self.arguments.disable_install_check))
        self.config.set('Updater', 'disable_progress', str(self.arguments.disable_progress))
        self.config.set('Updater', 'save_format_type', self.arguments.save_format_type)
        self.config.set('Updater', 'use_github_api', self.arguments.use_github_api)

        save_config_to_file(self.config, self.config_file_name)
        print(colorama.Fore.GREEN + 'Update default params successful')

    def handle_updates(self):
        update_list = self.arguments.update
        if not update_list:
            update_list = self.config.sections()

            # 'Updater' is the config data of this script
            if 'Updater' in update_list:
                update_list.remove('Updater')

        updater = Updater(
            config=self.config,
            config_file_name=self.config_file_name,
            force_download=self.arguments.force_download,
            disable_repack=self.arguments.disable_repack,
            disable_clean=self.arguments.disable_clean,
            disable_install_check=self.arguments.disable_install_check,
            disable_progress=self.arguments.disable_progress,
            save_format_type=self.arguments.save_format_type,
            use_github_api=self.arguments.use_github_api,
        )

        for ini_name in update_list:
            try:
                updater.update(ini_name)
            except Exception as exception:
                print(exception)

        updater.cleanup_update_folder()

    def main(self):
        colorama.init(autoreset=True)
        signal.signal(signal.SIGINT, self.exit_handler)

        # Fix updates "FileNotFoundError" in exe build
        current_dir = os.path.dirname(sys.argv[0])
        if current_dir:
            os.chdir(current_dir)

        self.print_banner()

        self.config.read(self.config_file_name)
        self.init_argparse()
        self.update_default_params()

        self.handle_updates()


# se fini
if __name__ == '__main__':
    Setup().main()
