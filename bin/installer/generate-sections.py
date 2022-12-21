# -*- coding: utf-8  -*-
#
# Copyright (C) 2022 DSR! <xchwarze@gmail.com>
# Released under the terms of the MIT License
# Developed for Python 3.6+
# pip install py7zr pefile colorama

import argparse
import pathlib
import os
import re
import shutil
import py7zr
import pefile
import colorama


def get_pe_info(file_path):
    IMAGE_FILE_MACHINE_AMD64 = 34404
    IMAGE_SUBSYSTEM_WINDOWS_CUI = 3

    try:
        pe = pefile.PE(file_path, fast_load=True)

        return {
            # https://docs.microsoft.com/en-us/windows/win32/debug/pe-format#machine-types
            'is_x64': pe.FILE_HEADER.Machine == IMAGE_FILE_MACHINE_AMD64,

            # https://docs.microsoft.com/en-us/windows/win32/debug/pe-format#windows-subsystem
            'is_cli': pe.OPTIONAL_HEADER.Subsystem == IMAGE_SUBSYSTEM_WINDOWS_CUI,
        }
    except:
        return False


def component_name(name):
    return re.sub('[^a-zA-Z0-9]', '', name).lower()


class GenerateInstall:
    def __init__(self):
        self.base_path = ''
        self.section_name = ''
        self.tool_name = ''
        self.section_list = []
        self.cli_list = []
        self.fix_tool_exe_list = {
            # fix to support main executable
            '[dotnet] dnspyex': ['dnspy.exe'],
            'ollydbg 1.10': ['ollydbg.exe'],
            'astrogrep': ['astrogrep.exe'],
            'rl!depacker': ['rl!depacker.exe'],

            # support also the x64 versions
            '[autoit] unautoit': ['unautoit-windows-i686.exe', 'unautoit-windows-amd64.exe'],
            'hxd': ['hxd32.exe', 'hxd64.exe'],
            'api monitor': ['apimonitor-x86.exe', 'apimonitor-x64.exe'],
            'autoruns': ['autoruns.exe', 'autoruns64.exe'],
            'process explorer': ['procexp.exe', 'procexp64.exe'],
            'system informer': ['systeminformer.exe'],
            'procmon': ['procmon.exe', 'procmon64.exe'],
            'regshot': ['regshot-x86-ansi.exe', 'regshot-x64-ansi.exe'],
            'sysanalyzer': ['sysanalyzer.exe', 'hxd64.exe'],
            'tcpview': ['tcpview.exe', 'tcpview64.exe'],
            'process-dump': ['pd32.exe', 'pd64.exe'],
            'scylla': ['scylla_x86.exe', 'scylla_x64.exe'],
            'strings': ['strings.exe', 'strings64.exe'],
            'de4dot': ['de4dot.exe', 'de4dot-x64.exe'],
            'netunpack': ['netunpack.exe', 'netunpack-64.exe'],
        }
        self.fix_tool_exe_link_creation = [
            # analysis
            'die', 'xapkdetector',

            # dissasembler
            'immunity debugger', 'ollydbg 1.10',

            # other
            'apkeasytool', 'astrogrep', 'indetectables offset locator', 'x64dbgpluginmanager',

            # patcher
            'at4re patcher', 'dup',

            # unpacking
            'netunpack', 'qunpack', 'uniextract',
        ]
        self.compact_tool_list = [
            # analysis
            'capa', 'die', 'exeinfope', 'pestudio', 'xapkdetector',

            # decompilers
            '[android] jadx', '[dotnet] ilspy', '[java] jd-gui', '[java] recaf',

            # dissasembler
            'x64dbg',

            # hex editor
            'hxd', 'imhex',

            # monitor
            'api monitor', 'process explorer', 'system informer', 'procmon', 'tcpview',

            # other
            'apkstudio', 'floss', 'hashcalc', 'resource hacker', 'scylla', 'virustotaluploader', 'x64dbgpluginmanager',

            # rootkits detector
            'gmer', 'sysinspector',

            # unpacking
            'qunpack', 'rl!depacker', 'uniextract', 'xvolkolak',
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
        return str(path).replace(f'{str(self.base_path)}\\', '')

    def get_tool_icon(self):
        tool_name_list = self.tool_name.split()
        name = tool_name_list[1].lower() if self.tool_name[0] == '[' else self.tool_name.lower()

        return f'{{#MyAppToolsIconsFolder}}\\{name}.ico'

    def iss_types(self):
        types = 'full'

        if self.tool_name.lower() in self.compact_tool_list:
            types += ' compact'
        
        return types

    # script steps
    def iterate_sections(self, folder_path):
        valid_folders = [
            'analysis', 'decompilers', 'dissasembler', 'hex editor', 'monitor',
            'nfomaker', 'other', 'patcher', 'rootkits detector', 'unpacking'
        ]
        self.base_path = folder_path
        for item in pathlib.Path(folder_path).iterdir():
            if item.is_dir() & (item.name.lower() in valid_folders):
                self.section_name = item.name
                self.section_list = []
                self.iterate_folder(item)

                section_name = item.name.lower().replace(' ', '-')
                with open(f'sections\\{section_name}.iss', 'w') as file:
                    file.writelines('\n'.join(self.section_list))

    def iterate_folder(self, folder_path):
        for item in pathlib.Path(folder_path).iterdir():
            if item.is_dir():
                print(colorama.Fore.YELLOW + f'[+] Process: {item.name}')
                self.tool_name = item.name

                self.iterate_tool(item)
                self.section_list.append('')
                self.section_list.append('')

    def iterate_tool(self, folder_path, is_sub_folder=False):
        # unpack
        for item in folder_path.glob('*.7z'):
            self.iterate_tool_unpack(item, folder_path)

        # main data
        if not is_sub_folder:
            self.section_list.append(f'; {self.tool_name}')
            self.section_list.append('[Components]')
            self.section_list.append(
                f'Name: "{component_name(self.section_name)}\\{component_name(self.tool_name)}"; '
                f'Description: "{self.tool_name}"; '
                f'Types: {self.iss_types()}; '
            )
            self.section_list.append('')

            self.section_list.append('[Files]')
            self.section_list.append(
                f'Source: "{{#MySrcDir}}\\toolkit\\{self.absolute_to_local_path(folder_path.absolute())}\\*"; '
                f'DestDir: "{{#MyAppToolsFolder}}\\{self.section_name}\\{self.tool_name}"; '
                f'Components: "{component_name(self.section_name)}\\{component_name(self.tool_name)}"; '
                'Flags: ignoreversion recursesubdirs createallsubdirs; '
            )
            self.section_list.append('')

        # generate tool info
        tool_exe_total = self.iterate_tool_exe(folder_path)
        tool_jar_total = self.iterate_tool_jar(folder_path)
        tool_py_total = self.iterate_tool_py(folder_path)

        # iterate sub folders
        for item in pathlib.Path(folder_path).iterdir():
            if item.is_dir() & (tool_exe_total == 0) & (tool_jar_total == 0) & (tool_py_total == 0):
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
        force_link_creation = self.tool_name.lower() in self.fix_tool_exe_link_creation
        exe_list_len = len(list(folder_path.glob('*.exe')))
        for item in folder_path.glob('*.exe'):
            if exe_list_len > 1:
                if self.tool_name.lower() in self.fix_tool_exe_list.keys():
                    if item.name.lower() in self.fix_tool_exe_list[self.tool_name.lower()]:
                        self.iterate_tool_exe_gen(item, force_link_creation)

                elif not is_first_set:
                    print(colorama.Fore.MAGENTA + f'   [!!!] Find multiple exes. Grabbing the first!')
                    is_first_set = True
                    self.iterate_tool_exe_gen(item, force_link_creation)

            else:
                self.iterate_tool_exe_gen(item, True)

        return exe_list_len

    def iterate_tool_exe_gen(self, exe_path, force_link_creation = False):
        print(colorama.Fore.GREEN + f'   [*] Adding: "{str(pathlib.Path(exe_path).name)}"')
        working_dir = str(pathlib.Path(exe_path).parent)
        pe_data = get_pe_info(exe_path)

        # iss variables
        iss_name = f'{self.tool_name} x64' if pe_data['is_x64'] else self.tool_name
        iss_filename = f'{{#MyAppToolsFolder}}\\{self.absolute_to_local_path(exe_path)}'
        iss_working_dir = f'{{#MyAppToolsFolder}}\\{self.absolute_to_local_path(working_dir)}'
        iss_components = f'{component_name(self.section_name)}\\{component_name(self.tool_name)}'
        iss_parameters = f'Parameters: "/K ""{iss_filename}""";' if pe_data['is_cli'] else ''
        iss_icon = f'IconFilename: "{iss_filename}";' if pe_data['is_cli'] else ''
        iss_check = 'Check: Is64BitInstallMode;' if pe_data['is_x64'] else 'Check: not Is64BitInstallMode;'

        if force_link_creation:
            print(colorama.Fore.MAGENTA + f'      [!] force link creation')
            iss_check = 'Check: Is64BitInstallMode;' if pe_data['is_x64'] else ''

        if pe_data['is_x64']:
            print(colorama.Fore.MAGENTA + f'      [!] x64 exe')

        if pe_data['is_cli']:
            print(colorama.Fore.MAGENTA + f'      [!] CLI exe')
            iss_filename = f'{{sys}}\\cmd.exe'
            self.cli_list_append(
                iss_components,
                f'\\{self.absolute_to_local_path(working_dir)}',
            )

        self.section_list.append('[Icons]')
        self.section_list.append(
            f'Name: "{{group}}\\{{#MyAppName}}\\{iss_name}"; '
            f'Filename: "{iss_filename}"; '
            f'WorkingDir: "{iss_working_dir}"; '
            f'Components: "{iss_components}"; '
            f'{iss_parameters} '
            f'{iss_icon} '
            f'{iss_check} '
        )
        self.section_list.append(
            f'Name: "{{#MyAppBinsFolder}}\\sendto\\sendto\\{self.section_name}\\{iss_name}"; '
            f'Filename: "{iss_filename}"; '
            f'WorkingDir: "{iss_working_dir}"; '
            f'Components: "{iss_components}"; '
            f'{iss_parameters} '
            f'{iss_icon} '
            f'{iss_check} '
        )
        self.section_list.append('')

    def cli_list_append(self, component, working_dir):
        for item in self.cli_list:
            if item['component'] == component:
                return False

        self.cli_list.append({
            'component': component,
            'working_dir': working_dir,
        })

    def iterate_tool_jar(self, folder_path):
        jar_list = list(folder_path.glob('*.jar'))

        # for now there is always 1
        if len(jar_list) == 0:
            return 0

        self.iterate_tool_jar_gen(jar_list[0])

        return len(jar_list)

    def iterate_tool_jar_gen(self, jar_path):
        print(colorama.Fore.GREEN + f'   [*] Adding jar: "{str(pathlib.Path(jar_path).name)}"')
        tool_jar_path = self.absolute_to_local_path(jar_path)
        working_dir = str(pathlib.Path(jar_path).parent)

        self.section_list.append('[Icons]')
        self.section_list.append(
            f'Name: "{{group}}\\{{#MyAppName}}\\{self.tool_name}"; '
            # f'Filename: "java -jar {{#MyAppToolsFolder}}\\{tool_jar_path}"; '
            f'Filename: "{{#MyAppToolsFolder}}\\{tool_jar_path}"; '
            f'WorkingDir: "{{#MyAppToolsFolder}}\\{self.absolute_to_local_path(working_dir)}"; '
            f'Components: "{component_name(self.section_name)}\\{component_name(self.tool_name)}"; '
            f'IconFilename: "{self.get_tool_icon()}";'
        )
        self.section_list.append(
            f'Name: "{{#MyAppBinsFolder}}\\sendto\\sendto\\{self.section_name}\\{self.tool_name}"; '
            # f'Filename: "java -jar {{#MyAppToolsFolder}}\\{tool_jar_path}"; '
            f'Filename: "{{#MyAppToolsFolder}}\\{tool_jar_path}"; '
            f'WorkingDir: "{{#MyAppToolsFolder}}\\{self.absolute_to_local_path(working_dir)}"; '
            f'Components: "{component_name(self.section_name)}\\{component_name(self.tool_name)}"; '
            f'IconFilename: "{self.get_tool_icon()}";'
        )
        self.section_list.append('')

    def iterate_tool_py(self, folder_path):
        py_list = list(folder_path.glob('*.py'))

        # for now there is always 1
        if len(py_list) == 0:
            return 0

        self.iterate_tool_py_gen(py_list[0])

        return len(py_list)

    def iterate_tool_py_gen(self, py_path):
        print(colorama.Fore.GREEN + f'   [*] Adding py: "{str(pathlib.Path(py_path).name)}"')
        tool_py_path = self.absolute_to_local_path(py_path)
        working_dir = str(pathlib.Path(py_path).parent)

        self.section_list.append('[Icons]')
        self.section_list.append(
            f'Name: "{{group}}\\{{#MyAppName}}\\{self.tool_name}"; '
            f'Filename: "{{sys}}\\cmd.exe"; '
            f'Parameters: "/K python ""{{#MyAppToolsFolder}}\\{tool_py_path}"""; '
            f'WorkingDir: "{{#MyAppToolsFolder}}\\{self.absolute_to_local_path(working_dir)}"; '
            f'Components: "{component_name(self.section_name)}\\{component_name(self.tool_name)}"; '
            f'IconFilename: "{self.get_tool_icon()}";'
        )
        self.section_list.append(
            f'Name: "{{#MyAppBinsFolder}}\\sendto\\sendto\\{self.section_name}\\{self.tool_name}"; '
            f'Filename: "{{sys}}\\cmd.exe"; '
            f'Parameters: "/K python ""{{#MyAppToolsFolder}}\\{tool_py_path}"""; '
            f'WorkingDir: "{{#MyAppToolsFolder}}\\{self.absolute_to_local_path(working_dir)}"; '
            f'Components: "{component_name(self.section_name)}\\{component_name(self.tool_name)}"; '
            f'IconFilename: "{self.get_tool_icon()}";'
        )
        self.section_list.append('')

    def cli_env_extra_code(self):
        print('')
        print(colorama.Fore.YELLOW + f'[+] Generate cli register code')

        lines_list = []
        lines_list.append('{')
        lines_list.append(';;;;; AUTOGENERATED!')
        lines_list.append(';;;;;;;;;;;;;;;;;;;;;;;;;')
        lines_list.append('}')

        # install hook
        lines_list.append('procedure CurStepChanged(CurStep: TSetupStep);')
        lines_list.append('begin')
        lines_list.append('    if CurStep = ssPostInstall then')
        lines_list.append('    begin')

        for item in self.cli_list:
            lines_list.append(f'        if WizardIsComponentSelected(\'{item["component"]}\') then EnvAddPath(ExpandConstant(\'{{#MyAppToolsFolder}}\') + \'{item["working_dir"]}\');')

        lines_list.append('    end')
        lines_list.append('end;')
        lines_list.append('')

        # uninstall hook
        lines_list.append('procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);')
        lines_list.append('begin')
        lines_list.append('    if CurUninstallStep = usPostUninstall then')
        lines_list.append('    begin')

        for item in self.cli_list:
            lines_list.append(f'        EnvRemovePath(ExpandConstant(\'{{#MyAppToolsFolder}}\') + \'{item["working_dir"]}\');')

        lines_list.append('    end')
        lines_list.append('end;')
        lines_list.append('')

        # save
        shutil.copy('sections\\cli.iss.base', 'sections\\cli.iss') 
        with open('sections\\cli.iss', 'a') as file:
            file.writelines('\n'.join(lines_list))

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

        self.iterate_sections(toolkit_folder)
        self.cli_env_extra_code()


# se fini
if __name__ == '__main__':
    GenerateInstall().main()
