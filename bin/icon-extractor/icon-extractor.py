# -*- coding: utf-8  -*-
#
# Copyright (C) 2022 DSR! <xchwarze@gmail.com>
# Released under the terms of the MIT License
# Developed for Python 3.6+
# pip install py7zr colorama

import argparse
import pathlib
import os
import re
import py7zr
import subprocess
import colorama


class IconExtractor:
    def __init__(self):
        self.base_path = ''
        self.section_name = ''
        self.tool_name = ''
        self.fix_tool_exe_list = {
            # fix to support main executable
            '[dotnet] dnspyex': ['dnspy.exe'],
            'ollydbg 1.10': ['ollydbg.exe'],
            'winhex': ['winhex.exe'],
            'astrogrep': ['astrogrep.exe'],
            'rl!depacker': ['rl!depacker.exe'],

            # support also the x64 versions
            'hxd': ['hxd32.exe'],
            'api monitor': ['apimonitor-x86.exe'],
            'autoruns': ['autoruns.exe'],
            'process explorer': ['procexp.exe'],
            'process hacker 2': ['processhacker.exe'],
            'process hacker 3': ['processhacker.exe'],
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
        valid_folders = [
            'analysis', 'decompilers', 'dissasembler', 'hex editor',
            'monitor', 'other', 'rootkits detector', 'unpacking'
        ]
        self.base_path = folder_path
        for item in pathlib.Path(folder_path).iterdir():
            if item.is_dir() & (item.name.lower() in valid_folders):
                self.section_name = item.name
                self.iterate_folder(item)

    def iterate_folder(self, folder_path):
        # TODO create section sub folder
        for item in pathlib.Path(folder_path).iterdir():
            if item.is_dir():
                print(colorama.Fore.YELLOW + f'[+] Process: {item.name}')
                self.tool_name = item.name
                self.iterate_tool(item)

    def iterate_tool(self, folder_path, is_sub_folder = False):
        # unpack
        for item in folder_path.glob('*.7z'):
            self.iterate_tool_unpack(item, folder_path)

        # generate executable info
        tool_exe_total = self.iterate_tool_exe(folder_path)
        tool_jar_total = self.iterate_tool_jar(folder_path)

        # iterate sub folders
        for item in pathlib.Path(folder_path).iterdir():
            if item.is_dir() & (tool_exe_total == 0) & (tool_jar_total == 0):
                print(colorama.Fore.MAGENTA + f'   [!] Iterate sub folder: "{item}"')
                self.iterate_tool(item, True)

    def iterate_tool_unpack(self, file_path, folder_path):
        if file_path.name.lower() not in self.disable_unpack:
            if len(os.listdir(folder_path)) > 1:
                # In addition to creating the new directory, change the path of the folder_path
                folder_path = pathlib.Path(folder_path).joinpath(file_path.stem)
                pathlib.Path(folder_path).mkdir(exist_ok=True)

            with py7zr.SevenZipFile(file_path, 'r') as compressed:
                compressed.extractall(folder_path)

            file_path.unlink()

    def iterate_tool_exe(self, folder_path):
        is_first_set = False
        exe_list_len = len(list(folder_path.glob('*.exe')))
        for item in folder_path.glob('*.exe'):
            if exe_list_len > 1:
                if self.tool_name.lower() in self.fix_tool_exe_list.keys():
                    if item.name.lower() in self.fix_tool_exe_list[self.tool_name.lower()]:
                        self.iterate_tool_exe_gen(item)

                elif not is_first_set:
                    print(colorama.Fore.MAGENTA + f'   [!!!] Find multiple exes. Grabbing the first!')
                    is_first_set = True
                    self.iterate_tool_exe_gen(item)

            else:
                self.iterate_tool_exe_gen(item)

        return exe_list_len

    def iterate_tool_exe_gen(self, exe_path):
        # TODO save program icon
        print(colorama.Fore.GREEN + f'   [*] Adding: "{str(pathlib.Path(exe_path).name)}"')
        tool_exe_path = str(exe_path)
        subprocess.run(
            #%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe
            "powershell.exe" .
            " -ExecutionPolicy Bypass" .
            " \"{$binPath}\Extract-Icon.ps1\"" .
            " -Path \"'{$fileinfo->getPathname()}'\"" .
            " -Destination \"'{$outputPath}'\"" .
            " -verbose",
        )

    def iterate_tool_jar(self, folder_path):
        jar_list = list(folder_path.glob('*.jar'))

        # for now there is always 1
        if len(jar_list) == 0:
            return 0

        self.iterate_tool_jar_gen(jar_list[0])

        return len(jar_list)

    def iterate_tool_jar_gen(self, jar_path):
        # TODO
        # print(colorama.Fore.GREEN + f'   [*] Adding: "{str(pathlib.Path(jar_path).name)}"')
        # tool_jar_path = srt(jar_path)
        print(colorama.Fore.RED + f'   [!!!] Add manually this icon: "{str(pathlib.Path(jar_path).name)}"')

    def main(self):
        colorama.init(autoreset=True)

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

        # TODO create main ouput dir
        self.iterate_sections(toolkit_folder)


# se fini
if __name__ == '__main__':
    GenerateInstall().main()
