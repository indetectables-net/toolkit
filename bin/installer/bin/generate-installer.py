# -*- coding: utf-8 -*-
#
# Copyright (C) 2022 DSR! <xchwarze@gmail.com>
# SPDX-License-Identifier: LGPL-3.0-or-later
# More info at: https://github.com/indetectables-net/toolkit
# pip install pefile colorama

import argparse
import pathlib
import re
import shutil
import pefile
import colorama

def get_pe_info(file_path):
    """Retrieve PE information about the given file."""
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
    except pefile.PEFormatError as e:
        print(colorama.Fore.RED + f'Error processing {file_path}: {e}')
        return False

def component_name(name):
    """Normalize the component name by removing non-alphanumeric characters and converting to lowercase."""
    return re.sub('[^a-zA-Z0-9]', '', name).lower()


class GenerateInstaller:
    def __init__(self):
        self.base_path = ''
        self.section_name = ''
        self.tool_name = ''
        self.tool_iss_component = ''
        self.section_list = []
        self.cli_list = []
        self.valid_folders = [
            'analysis', 'decompilers', 'dissasembler', 'hex editor', 'monitor',
            'nfomaker', 'other', 'reverse', 'rootkits detector', 'unpacking'
        ]
        self.correct_tool_exe_list = {
            # fix to support main executable
            '[dotnet] dnspyex': ['dnspy.exe'],
            'ollydbg 1.10': ['ollydbg.exe'],
            'astrogrep': ['astrogrep.exe'],
            'rl!depacker': ['rl!depacker.exe'],
            'sysanalyzer': ['sysanalyzer.exe'],
            'system informer': ['systeminformer.exe'],
            'keygener assistant': ['keyassistant.exe'],
            'asm calculator': ['calc32.exe'],

            # support also the x64 versions
            '[autoit] unautoit': ['unautoit-windows-i686.exe', 'unautoit-windows-amd64.exe'],
            'hxd': ['hxd32.exe', 'hxd64.exe'],
            'api monitor': ['apimonitor-x86.exe', 'apimonitor-x64.exe'],
            'autoruns': ['autoruns.exe', 'autoruns64.exe'],
            'process explorer': ['procexp.exe', 'procexp64.exe'],
            'procmon': ['procmon.exe', 'procmon64.exe'],
            'regshot': ['regshot-x86-ansi.exe', 'regshot-x64-ansi.exe'],
            'tcpview': ['tcpview.exe', 'tcpview64.exe'],
            'process-dump': ['pd32.exe', 'pd64.exe'],
            'scylla': ['scylla_x86.exe', 'scylla_x64.exe'],
            'strings': ['strings.exe', 'strings64.exe'],
            'dlest': ['dlest32.exe', 'dlest64.exe'],
            'extremedumper': ['extremedumper-x86.exe', 'extremedumper.exe'],
            'winapi search': ['winapisearch32.exe', 'winapisearch64.exe'],
            'de4dot': ['de4dot.exe', 'de4dot-x64.exe'],
            'netunpack': ['netunpack.exe', 'netunpack-64.exe'],
            'all dlls dependencies': ['alldlldeps32.exe', 'alldlldeps64.exe'],
        }
        self.force_architecture_check_list = [
            '[autoit] unautoit',
            'hxd',
            'api monitor',
            'autoruns',
            'process explorer',
            'procmon',
            'regshot',
            'tcpview',
            'process-dump',
            'scylla',
            'strings',
            'dlest',
            'extremedumper',
            'winapi search',
            'de4dot',
            'netunpack',
            'system informer',
            'all dlls dependencies',
            'procdot'
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
            'api monitor', 'pe-sieve', 'process explorer', 'system informer', 'procmon', 'tcpview',

            # other
            'apkstudio', 'floss', 'hashmyfiles', 'rawcap', 'resource hacker', 'virustotaluploader',

            # reverse
            'asm calculator', 'cryptotester', 'getsymbol', 'scylla', 'winapi search', 'x64dbgpluginmanager',

            # rootkits detector
            'gmer', 'sysinspector',

            # unpacking
            'uniextract', 'xvolkolak',
        ]

    # helpers
    def absolute_to_local_path(self, path):
        """Convert an absolute path to a local path relative to the base path."""
        return str(path).replace(f'{str(self.base_path)}\\', '')

    def get_tool_icon(self):
        """Get the icon filename for the current tool."""
        tool_name_list = self.tool_name.split()
        name = tool_name_list[1].lower() if self.tool_name[0] == '[' else self.tool_name.lower()

        return f'{{#MyAppToolsIconsFolder}}\\{name}.ico'

    def iss_types(self):
        """Determine the types of installation for the current tool."""
        types = 'full'
        if self.tool_name.lower() in self.compact_tool_list:
            types += ' compact'

        return types

    # script steps
    def iterate_sections(self, folder_path, output_path):
        """Iterate through sections in the given folder path and generate ISS files."""
        self.base_path = folder_path

        for item in pathlib.Path(folder_path).iterdir():
            # check that the folder is valid for analysis
            if item.is_dir() and item.name.lower() in self.valid_folders:
                print(colorama.Fore.WHITE + f'[*] Analyzing folder: {item.name}')
                self.section_name = item.name
                self.section_list = []
                self.iterate_folder(item)

                # generate the iss file with everything I processed
                section_name = item.name.lower().replace(' ', '-')
                with open(f'{output_path}\\sections\\{section_name}.iss', 'w') as file:
                    file.writelines('\n'.join(self.section_list))

                # I add a few line breaks to indicate in the summary that I have finished analyzing a section
                print("\n")

    def iterate_folder(self, folder_path):
        """Iterate through folders and process each tool."""
        # add folder desktop.ini support
        self.generate_folder_icon(folder_path)

        # iterate sub folders
        for item in pathlib.Path(folder_path).iterdir():
            if item.is_dir():
                print(colorama.Fore.YELLOW + f'[+] Process: {item.name}')
                self.tool_name = item.name
                self.tool_iss_component = f'{component_name(self.section_name)}\\{component_name(item.name)}'

                self.iterate_tool(item)
                self.section_list.append('')
                self.section_list.append('')

    def generate_folder_icon(self, folder_path):
        """Generate desktop.ini setup."""
        folder_path_name = self.absolute_to_local_path(folder_path.absolute())
        iss_component = component_name(self.section_name)
        iss_source = f'{{#MySrcDir}}\\toolkit\\{self.absolute_to_local_path(folder_path.absolute())}'
        iss_dest = f'{{#MyAppToolsFolder}}\\{self.section_name}'

        self.section_list.append('[Files]')
        self.section_list.append(
            f'Source: "{iss_source}\\desktop.ini"; '
            f'DestDir: "{iss_dest}"; '
            f'Components: "{iss_component}"; '
            'Flags: ignoreversion; '
        )
        self.section_list.append(
            f'Source: "{iss_source}\\folder.ico"; '
            f'DestDir: "{iss_dest}"; '
            f'Components: "{iss_component}"; '
            'Flags: ignoreversion; '
        )
        self.section_list.append('')


        self.section_list.append('[Run]')
        self.section_list.append(
            'Filename: "attrib.exe"; '
            f'Parameters: "+s +h ""{{#MyAppToolsFolder}}\\toolkit\\{folder_path_name}\\desktop.ini"""; '
            f'Components: "{iss_component}"; '
            'Flags: runhidden; '
        )
        self.section_list.append('')
        self.section_list.append('')
        self.section_list.append('')

    def iterate_tool(self, folder_path, is_sub_folder=False):
        """Process each tool in the folder."""
        if not is_sub_folder:
            self.section_list.append(f'; {self.tool_name}')
            self.section_list.append('[Components]')
            self.section_list.append(
                f'Name: "{self.tool_iss_component}"; '
                f'Description: "{self.tool_name}"; '
                f'Types: {self.iss_types()}; '
            )
            self.section_list.append('')

            self.section_list.append('[Files]')
            self.section_list.append(
                f'Source: "{{#MySrcDir}}\\toolkit\\{self.absolute_to_local_path(folder_path.absolute())}\\*"; '
                f'DestDir: "{{#MyAppToolsFolder}}\\{self.section_name}\\{self.tool_name}"; '
                f'Components: "{self.tool_iss_component}"; '
                'Flags: ignoreversion recursesubdirs createallsubdirs; '
            )
            self.section_list.append('')

        # generate tool info
        tool_exe_total = self.iterate_tool_exe(folder_path)
        tool_jar_total = self.iterate_tool_jar(folder_path)
        tool_py_total = self.iterate_tool_py(folder_path)

        # iterate sub folders
        for item in pathlib.Path(folder_path).iterdir():
            if item.is_dir() and tool_exe_total == 0 and tool_jar_total == 0 and tool_py_total == 0:
                print(colorama.Fore.MAGENTA + f'   [!] Iterate sub folder: "{item}"')
                self.iterate_tool(item, True)

    def iterate_tool_exe(self, folder_path):
        """Process executable files in the folder."""
        is_first_set = False
        force_architecture_check = self.tool_name.lower() in self.force_architecture_check_list
        exe_list_len = len(list(folder_path.glob('*.exe')))
        for item in folder_path.glob('*.exe'):
            if exe_list_len > 1:
                if self.tool_name.lower() in self.correct_tool_exe_list.keys():
                    if item.name.lower() in self.correct_tool_exe_list[self.tool_name.lower()]:
                        self.iterate_tool_exe_gen(item, force_architecture_check)

                elif not is_first_set:
                    print(colorama.Fore.MAGENTA + f'   [!!!] Find multiple exes. Grabbing the first!')
                    is_first_set = True
                    self.iterate_tool_exe_gen(item, force_architecture_check)

            else:
                self.iterate_tool_exe_gen(item, force_architecture_check)

        return exe_list_len

    def iterate_tool_exe_gen(self, exe_path, force_architecture_check=False):
        """Generate ISS entries for the executable."""
        print(colorama.Fore.GREEN + f'   [*] Adding: "{str(pathlib.Path(exe_path).name)}"')
        working_dir = str(pathlib.Path(exe_path).parent)
        pe_data = get_pe_info(exe_path)

        # iss variables
        iss_name = f'{self.tool_name} x64' if pe_data['is_x64'] else self.tool_name
        iss_filename = f'{{#MyAppToolsFolder}}\\{self.absolute_to_local_path(exe_path)}'
        iss_working_dir = f'{{#MyAppToolsFolder}}\\{self.absolute_to_local_path(working_dir)}'
        iss_parameters = f'Parameters: "/K ""{iss_filename}""";' if pe_data['is_cli'] else ''
        iss_icon = f'IconFilename: "{iss_filename}";' if pe_data['is_cli'] else ''
        iss_check = 'Check: Is64BitInstallMode;' if pe_data['is_x64'] else ''

        if force_architecture_check:
            print(colorama.Fore.MAGENTA + f'      [!] force architecture check')
            iss_check = 'Check: Is64BitInstallMode;' if pe_data['is_x64'] else 'Check: not Is64BitInstallMode;'

        if pe_data['is_x64']:
            print(colorama.Fore.MAGENTA + f'      [!] x64 exe')

        if pe_data['is_cli']:
            print(colorama.Fore.MAGENTA + f'      [!] CLI exe')
            iss_filename = f'{{sys}}\\cmd.exe'
            self.cli_list_append(
                self.tool_iss_component,
                f'\\{self.absolute_to_local_path(working_dir)}',
            )

        self.section_list.append('[Icons]')
        self.section_list.append(
            f'Name: "{{group}}\\{iss_name}"; '
            f'Filename: "{iss_filename}"; '
            f'WorkingDir: "{iss_working_dir}"; '
            f'Components: "{self.tool_iss_component}"; '
            f'{iss_parameters} '
            f'{iss_icon} '
            f'{iss_check} '
        )
        self.section_list.append(
            f'Name: "{{#MyAppBinsFolder}}\\sendto\\sendto\\{self.section_name}\\{iss_name}"; '
            f'Filename: "{iss_filename}"; '
            f'WorkingDir: "{iss_working_dir}"; '
            f'Components: "{self.tool_iss_component}"; '
            f'{iss_parameters} '
            f'{iss_icon} '
            f'{iss_check} '
        )
        self.section_list.append('')

    def cli_list_append(self, component, working_dir):
        """Append a CLI component to the list if not already present."""
        if any(item['component'] == component for item in self.cli_list):
            return

        self.cli_list.append({
            'component': component,
            'working_dir': working_dir,
        })

    def iterate_tool_jar(self, folder_path):
        """Process JAR files in the folder."""
        jar_list = list(folder_path.glob('*.jar'))

        # for now there is always 1
        if len(jar_list) == 0:
            return 0

        self.iterate_tool_jar_gen(jar_list[0])

        return len(jar_list)

    def iterate_tool_jar_gen(self, jar_path):
        """Generate ISS entries for the JAR file."""
        print(colorama.Fore.GREEN + f'   [*] Adding jar: "{str(pathlib.Path(jar_path).name)}"')
        tool_jar_path = self.absolute_to_local_path(jar_path)
        working_dir = str(pathlib.Path(jar_path).parent)
        iss_working_dir = f'{{#MyAppToolsFolder}}\\{self.absolute_to_local_path(working_dir)}'

        self.section_list.append('[Icons]')
        self.section_list.append(
            f'Name: "{{group}}\\{self.tool_name}"; '
            # f'Filename: "java -jar {{#MyAppToolsFolder}}\\{tool_jar_path}"; '
            f'Filename: "{{#MyAppToolsFolder}}\\{tool_jar_path}"; '
            f'WorkingDir: "{iss_working_dir}"; '
            f'Components: "{self.tool_iss_component}"; '
            f'IconFilename: "{self.get_tool_icon()}";'
        )
        self.section_list.append(
            f'Name: "{{#MyAppBinsFolder}}\\sendto\\sendto\\{self.section_name}\\{self.tool_name}"; '
            # f'Filename: "java -jar {{#MyAppToolsFolder}}\\{tool_jar_path}"; '
            f'Filename: "{{#MyAppToolsFolder}}\\{tool_jar_path}"; '
            f'WorkingDir: "{iss_working_dir}"; '
            f'Components: "{self.tool_iss_component}"; '
            f'IconFilename: "{self.get_tool_icon()}";'
        )
        self.section_list.append('')

    def iterate_tool_py(self, folder_path):
        """Process Python files in the folder."""
        py_list = list(folder_path.glob('*.py'))

        # for now there is always 1
        if len(py_list) == 0:
            return 0

        self.iterate_tool_py_gen(py_list[0])

        return len(py_list)

    def iterate_tool_py_gen(self, py_path):
        """Generate ISS entries for the Python file."""
        print(colorama.Fore.GREEN + f'   [*] Adding py: "{str(pathlib.Path(py_path).name)}"')
        tool_py_path = self.absolute_to_local_path(py_path)
        working_dir = str(pathlib.Path(py_path).parent)
        iss_working_dir = f'{{#MyAppToolsFolder}}\\{self.absolute_to_local_path(working_dir)}'

        self.section_list.append('[Icons]')
        self.section_list.append(
            f'Name: "{{group}}\\{self.tool_name}"; '
            f'Filename: "{{sys}}\\cmd.exe"; '
            f'Parameters: "/K python ""{{#MyAppToolsFolder}}\\{tool_py_path}"""; '
            f'WorkingDir: "{iss_working_dir}"; '
            f'Components: "{self.tool_iss_component}"; '
            f'IconFilename: "{self.get_tool_icon()}";'
        )
        self.section_list.append(
            f'Name: "{{#MyAppBinsFolder}}\\sendto\\sendto\\{self.section_name}\\{self.tool_name}"; '
            f'Filename: "{{sys}}\\cmd.exe"; '
            f'Parameters: "/K python ""{{#MyAppToolsFolder}}\\{tool_py_path}"""; '
            f'WorkingDir: "{iss_working_dir}"; '
            f'Components: "{self.tool_iss_component}"; '
            f'IconFilename: "{self.get_tool_icon()}";'
        )
        self.section_list.append('')

    def cli_env_extra_code(self, output_path):
        """Generate additional CLI environment code for ISS."""
        # first check if any cli executable used
        if not self.cli_list:
            return

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
        shutil.copy('cli.iss.base', f'{output_path}\\sections\\cli.iss')
        with open(f'{output_path}\\sections\\cli.iss', 'a') as file:
            file.writelines('\n'.join(lines_list))

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
        parser.add_argument(
            '-o',
            '--output',
            dest='output_iss_folder',
            help='Path to output folder',
            type=pathlib.Path,
            required=True,
        )

        arguments = parser.parse_args()
        toolkit_folder = arguments.toolkit_folder
        output_iss_folder = arguments.output_iss_folder
        if not toolkit_folder.is_dir():
            print(colorama.Fore.RED + 'toolkit_folder is not a valid folder')
            return 0

        if not output_iss_folder.is_dir():
            print(colorama.Fore.RED + 'output_iss_folder is not a valid folder')
            return 0

        self.iterate_sections(toolkit_folder, output_iss_folder)
        self.cli_env_extra_code(output_iss_folder)


# se fini
if __name__ == '__main__':
    GenerateInstaller().main()
