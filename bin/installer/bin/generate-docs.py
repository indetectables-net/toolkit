# -*- coding: utf-8  -*-
#
# Copyright (C) 2022 DSR! <xchwarze@gmail.com>
# SPDX-License-Identifier: LGPL-3.0-or-later
# More info at: https://github.com/indetectables-net/toolkit
# pip install pywin32 colorama

import argparse
import pathlib
import os
import win32api
import configparser
import colorama


def get_file_properties(file_name):
    prop_names = ('Comments', 'InternalName', 'ProductName',
                  'CompanyName', 'LegalCopyright', 'ProductVersion',
                  'FileDescription', 'LegalTrademarks', 'PrivateBuild',
                  'FileVersion', 'OriginalFilename', 'SpecialBuild')

    props = {'FixedFileInfo': None, 'StringFileInfo': None, 'FileVersion': None}

    try:
        # backslash as parm returns dictionary of numeric info corresponding to VS_FIXEDFILEINFO struc
        fixed_info = win32api.GetFileVersionInfo(file_name, '\\')
        props['FixedFileInfo'] = fixed_info
        props['FileVersion'] = "%d.%d.%d.%d" % (fixed_info['FileVersionMS'] / 65536,
                                                fixed_info['FileVersionMS'] % 65536,
                                                fixed_info['FileVersionLS'] / 65536,
                                                fixed_info['FileVersionLS'] % 65536)

        # \VarFileInfo\Translation returns list of available (language, codepage)
        # pairs that can be used to retreive string info. We are using only the first pair.
        lang, codepage = win32api.GetFileVersionInfo(file_name, '\\VarFileInfo\\Translation')[0]

        # any other must be of the form \StringfileInfo\%04X%04X\parm_name, middle
        # two are language/codepage pair returned from above

        str_info = {}
        for propName in prop_names:
            str_info_path = u'\\StringFileInfo\\%04X%04X\\%s' % (lang, codepage, propName)
            str_info[propName] = win32api.GetFileVersionInfo(file_name, str_info_path)

        props['StringFileInfo'] = str_info
    except:
        pass

    return props


class DocsGenerator:
    def __init__(self):
        self.script_path = os.getcwd()
        self.updater_config = configparser.ConfigParser()
        self.section_name = ''
        self.section_list = []
        self.tool_name = ''
        self.tool_processed = 0
        self.valid_folders = [
            'analysis', 'decompilers', 'dissasembler', 'hex editor', 'monitor',
            'nfomaker', 'other', 'patcher', 'rootkits detector', 'unpacking'
        ]
        self.fix_tool_exe_list = {
            # fix to support main executable
            '[dotnet] dnspyex': ['dnspy.exe'],
            'ollydbg 1.10': ['ollydbg.exe'],
            'astrogrep': ['astrogrep.exe'],
            'rl!depacker': ['rl!depacker.exe'],
            'hxd': ['hxd32.exe'],
            'api monitor': ['apimonitor-x86.exe'],
            'autoruns': ['autoruns.exe'],
            'process explorer': ['procexp.exe'],
            'system informer': ['systeminformer.exe'],
            'procmon': ['procmon.exe', 'procmon64.exe'],
            'regshot': ['regshot-x86-ansi.exe'],
            'sysanalyzer': ['sysanalyzer.exe'],
            'tcpview': ['tcpview.exe'],
            'process-dump': ['pd32.exe'],
            'scylla': ['scylla_x86.exe'],
            'strings': ['strings.exe'],
            'de4dot': ['de4dot.exe'],
            'netunpack': ['netunpack.exe'],
        }

    # script steps
    def iterate_sections(self, folder_path):
        for item in pathlib.Path(folder_path).iterdir():
            if item.is_dir() & (item.name.lower() in self.valid_folders):
                self.section_name = item.name

                self.section_list.append(f'## {self.section_name}')
                self.section_list.append('')

                self.iterate_folder(item)
                self.section_list.append('')

    def iterate_folder(self, folder_path):
        for item in pathlib.Path(folder_path).iterdir():
            if item.is_dir():
                print(colorama.Fore.YELLOW + f'[+] Process: {item.name}')
                self.tool_name = item.name
                self.tool_processed = 0

                self.iterate_tool(item)

                if self.tool_processed == 0:
                    self.section_list.append(f'***Web:*** {self.get_updater_url()} <br/>')
                    self.section_list.append(f'***Developer:*** ??? <br/>')
                    self.section_list.append(f'***Description:*** ??? <br/>')

                self.section_list.append('')

    def iterate_tool(self, folder_path, is_sub_folder=False):
        if not is_sub_folder:
            self.section_list.append(f'### {self.tool_name}')

        # generate executable info
        tool_exe_total = self.iterate_tool_exe(folder_path)
        tool_jar_total = self.iterate_tool_jar(folder_path)

        # iterate sub folders
        for item in pathlib.Path(folder_path).iterdir():
            if item.is_dir() & (tool_exe_total == 0) & (tool_jar_total == 0):
                print(colorama.Fore.MAGENTA + f'   [!] Iterate sub folder: "{item}"')
                self.iterate_tool(item, True)

    def iterate_tool_exe(self, folder_path):
        exe_list_len = len(list(folder_path.glob('*.exe')))
        if self.tool_processed > 0:
            return exe_list_len

        for item in folder_path.glob('*.exe'):
            if exe_list_len > 1:
                if self.tool_name.lower() in self.fix_tool_exe_list.keys():
                    if item.name.lower() in self.fix_tool_exe_list[self.tool_name.lower()]:
                        self.iterate_tool_exe_gen(item)

                elif self.tool_processed == 0:
                    print(colorama.Fore.MAGENTA + f'   [!!!] Find multiple exes. Grabbing the first!')
                    self.iterate_tool_exe_gen(item)

            else:
                self.iterate_tool_exe_gen(item)

        return exe_list_len

    def iterate_tool_exe_gen(self, exe_path):
        print(colorama.Fore.GREEN + f'   [*] Adding: "{str(pathlib.Path(exe_path).name)}"')

        self.tool_processed += 1
        tool_exe_path = str(exe_path)
        info = get_file_properties(tool_exe_path)

        developer = '???'
        description = '???'
        if info and info['StringFileInfo']:
            # print(info['StringFileInfo'])
            # 'ProductName': info['StringFileInfo']['ProductName'],
            # 'ProductVersion': info['StringFileInfo']['ProductVersion'],
            developer = info['StringFileInfo']['CompanyName'] if info['StringFileInfo']['CompanyName'] else '???'
            description = info['StringFileInfo']['FileDescription'] if info['StringFileInfo']['FileDescription'] else '???'

        self.section_list.append(f'***Web:*** {self.get_updater_url()} <br/>')
        self.section_list.append(f'***Developer:*** {developer} <br/>')
        self.section_list.append(f'***Description:*** {description} <br/>')

    def get_updater_url(self):
        tool_name_list = self.tool_name.split()
        tool_name = tool_name_list[1] if self.tool_name[0] == '[' else self.tool_name

        tool_url = self.updater_config.get(tool_name, 'url', fallback=None)
        updater_type = self.updater_config.get(tool_name, 'from', fallback='web')
        if updater_type == 'github':
            return f'https://github.com/{tool_url}'

        if tool_url:
            return tool_url

        return '???'

    def iterate_tool_jar(self, folder_path):
        jar_list = list(folder_path.glob('*.jar'))

        # for now there is always 1
        if len(jar_list) == 0:
            return 0

        self.iterate_tool_jar_gen(jar_list[0])

        return len(jar_list)

    def iterate_tool_jar_gen(self, jar_path):
        print(colorama.Fore.GREEN + f'   [*] Adding: "{str(pathlib.Path(jar_path).name)}"')

        self.tool_processed += 1
        self.section_list.append(f'***Web:*** {self.get_updater_url()} <br/>')
        self.section_list.append(f'***Developer:*** ??? <br/>')
        self.section_list.append(f'***Description:*** ??? <br/>')

    def main(self):
        colorama.init(autoreset=True)
        os.chdir(self.script_path)

        parser = argparse.ArgumentParser(
            usage='%(prog)s [ARGUMENTS]',
        )
        parser.add_argument(
            '-f',
            '--folder',
            dest='toolkit_folder',
            help='path to toolkit folder',
            type=pathlib.Path,
            required=True,
        )

        arguments = parser.parse_args()
        toolkit_folder = arguments.toolkit_folder
        if not toolkit_folder.is_dir():
            print(colorama.Fore.RED + 'toolkit_folder is not a valid folder')
            return 0

        # load updater config
        self.updater_config.read(f'{str(toolkit_folder)}\\..\\bin\\updater\\tools.ini')

        # process tools
        self.iterate_sections(toolkit_folder)

        # generate output
        with open(f'{self.script_path}\\Tools.md', 'w') as file:
            # header
            file.write('# Tools\n\n')

            # index
            for item in self.valid_folders:
                file.write(f'1. [{item.capitalize()}](#{item.lower()})\n')

            # data
            file.write('\n\n')
            file.writelines('\n'.join(self.section_list))


# se fini
if __name__ == '__main__':
    DocsGenerator().main()
