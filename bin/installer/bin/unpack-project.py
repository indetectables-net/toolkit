# -*- coding: utf-8 -*-
#
# Copyright (C) 2022 DSR! <xchwarze@gmail.com>
# SPDX-License-Identifier: LGPL-3.0-or-later
# More info at: https://github.com/indetectables-net/toolkit
# pip install py7zr colorama

import argparse
import pathlib
import os
import shutil
import py7zr
import colorama

class UnpackProject:
    def __init__(self):
        self.base_path = ''
        self.valid_folders = [
            'analysis', 'decompilers', 'dissasembler', 'hex editor', 'monitor',
            'nfomaker', 'other', 'reverse', 'rootkits detector', 'unpacking'
        ]
        self.disable_unpack = [
            # decompilers
            'graywolf - 1.83.7z',

            # dissasembler
            '[++] w32dasm - 8.93.7z', '[10] w32dasm - 8.93.7z', '[original] w32dasm - 8.93.7z',
            '[bradpach] w32dasm - 8.93.7z',

            # other
            'imprec - 1.7e.7z',

            # patcher
            'at4re patcher - 0.6.3.7z', 'skins.7z',

            # unpacking
            'qunpack - 2.2.7z', 'qunpack - 3.4.7z', 'qunpack - src.7z',
            'vmunpacker - 1.2.7z', 'vmunpacker - 1.3.7z',
        ]

    # helpers
    def absolute_to_local_path(self, path):
        """Convert an absolute path to a local path relative to the base path."""
        return str(path).replace(f'{str(self.base_path)}\\', '')

    # script steps
    def iterate_sections(self, folder_path):
        """Iterate through sections in the given folder path."""
        self.base_path = folder_path
        for item in pathlib.Path(folder_path).iterdir():
            # Check that the folder is valid for analysis
            if item.is_dir() and (item.name.lower() in self.valid_folders):
                print(colorama.Fore.WHITE + f'[*] Analyzing folder: {item.name}')
                self.iterate_folder(item)
                print("\n")

    def iterate_folder(self, folder_path):
        """Iterate through folders and process each tool."""
        for item in pathlib.Path(folder_path).iterdir():
            if item.is_dir():
                print(colorama.Fore.YELLOW + f'[+] Process: {item.name}')
                self.iterate_tool(item)

    def iterate_tool(self, folder_path):
        """Process each tool in the folder."""
        # Unpack
        for item in folder_path.glob('*.7z'):
            self.iterate_tool_unpack(item, folder_path)

        # Iterate sub folders
        for item in pathlib.Path(folder_path).iterdir():
            if item.is_dir():
                print(colorama.Fore.MAGENTA + f'   [!] Iterate sub folder: "{item}"')
                self.iterate_tool(item)

    def iterate_tool_unpack(self, file_path, folder_path):
        """Unpack the 7z file and remove the original archive."""
        if file_path.name.lower() not in self.disable_unpack:
            if len(os.listdir(folder_path)) > 1:
                # In addition to creating the new directory, change the path of the folder_path
                folder_path = pathlib.Path(folder_path).joinpath(file_path.stem)
                pathlib.Path(folder_path).mkdir(exist_ok=True)

            with py7zr.SevenZipFile(file_path, 'r') as compressed:
                compressed.extractall(folder_path)

            file_path.unlink()

    def main(self):
        """Main entry point for the script."""
        colorama.init(autoreset=True)

        parser = argparse.ArgumentParser(
            usage='%(prog)s [ARGUMENTS]',
        )
        parser.add_argument(
            '-f',
            '--folder',
            dest='toolkit_folder',
            help='Path to toolkit folder',
            type=pathlib.Path,
            required=True,
        )

        arguments = parser.parse_args()
        toolkit_folder = arguments.toolkit_folder
        if not toolkit_folder.is_dir():
            print(colorama.Fore.RED + 'toolkit_folder is not a valid folder')
            return 0

        self.iterate_sections(toolkit_folder)


# Entry point
if __name__ == '__main__':
    UnpackProject().main()
