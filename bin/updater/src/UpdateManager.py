import argparse
import signal
import sys
import os
import colorama
import logging

from universal_updater.Updater import Updater
from universal_updater.ConfigManager import ConfigManager
from universal_updater.ColoredFormatter import ColoredFormatter


class UpdateManager:
    """
    Manages the application setup, including argument parsing and update handling.
    """

    def __init__(self):
        """
        Initialize the UpdateManager with a ConfigManager instance and command-line arguments.
        """
        self.version = '2.1.1'
        self.config_file_name = 'tools.ini'
        self.config_section_defaults = 'UpdaterConfig'
        self.config_section_self_update = 'UpdaterAutoUpdater'
        self.arguments = {}
        self.config_manager = ConfigManager(self.config_file_name)
        colorama.init(autoreset=True)

    def print_banner(self):
        """
        Prints the banner for the update process.
        """
        print(colorama.Fore.YELLOW + f"""
     ____          __     __            __        __    __         
    /  _/___  ____/ /__  / /____  _____/ /_____ _/ /_  / /__  _____
    / // __ \/ __  / _ \/ __/ _ \/ ___/ __/ __ `/ __ \/ / _ \/ ___/
  _/ // / / / /_/ /  __/ /_/  __/ /__/ /_/ /_/ / /_/ / /  __(__  ) 
 /___/_/ /_/\__,_/\___/\__/\___/\___/\__/\__,_/_.___/_/\___/____/  
    
 Universal Tool Updater - by DSR!
 Web: https://github.com/xchwarze/universal-tool-updater
 Version: {self.version}
        """)

    def exit_handler(self, signal, frame):
        """
        Handles signals like SIGINT for graceful exit.

        :param signal: Signal type
        :param frame: Current stack frame
        """
        print(colorama.Fore.YELLOW + 'SIGINT or CTRL-C detected. Exiting gracefully')
        sys.exit(0)

    def get_argparse_default(self, option, default, is_bool=True):
        """
        Retrieves the default value for a given argparse option from the configuration.

        :param option: The name of the argparse option
        :param default: The default value to return if the option is not found in the configuration
        :param is_bool: Flag indicating if the option is a boolean
        :return: The default value for the argparse option
        """
        if is_bool:
            # return value.lower() in ('true', '1', 'yes', 'on')
            return self.config_manager.get_boolean(self.config_section_defaults, option, fallback=default)

        return self.config_manager.get_config(self.config_section_defaults, option, fallback=default)

    def parse_arguments(self):
        """
        Parses command-line arguments and updates the internal state.
        """
        parser = argparse.ArgumentParser(usage='%(prog)s [ARGUMENTS]')
        parser.add_argument(
            '-v',
            '--version',
            action='version',
            version=f'Version: {self.version}'
        )
        parser.add_argument(
            '-u',
            '--update',
            dest='update',
            help='list of tools (default: all)',
            nargs='*'
        )
        parser.add_argument(
            '-dsu',
            '--disable-self-update',
            dest='disable_self_update',
            help='disable self update of this script',
            action=argparse.BooleanOptionalAction,
            default=False
        )
        parser.add_argument(
            '-dfc',
            '--disable-folder-clean',
            dest='disable_clean',
            help='disable tool folder clean',
            action=argparse.BooleanOptionalAction,
            default=self.get_argparse_default('disable_clean', True)
        )
        parser.add_argument(
            '-dr',
            '--disable-repack',
            dest='disable_repack',
            help='disable tool repack',
            action=argparse.BooleanOptionalAction,
            default=self.get_argparse_default('disable_repack', True)
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
        parser.add_argument(
            '-d',
            '--debug',
            dest='debug',
            help='enable debug output',
            action=argparse.BooleanOptionalAction,
            default=False
        )

        self.arguments = parser.parse_args()

    def update_default_params(self):
        """
        Updates default parameters in the configuration based on command-line arguments.
        """
        if not self.arguments.update_default_params:
            return False

        self.config_manager.set_config(self.config_section_defaults, 'disable_clean', str(self.arguments.disable_clean))
        self.config_manager.set_config(self.config_section_defaults, 'disable_repack', str(self.arguments.disable_repack))
        self.config_manager.set_config(self.config_section_defaults, 'disable_install_check',
                                       str(self.arguments.disable_install_check))
        self.config_manager.set_config(self.config_section_defaults, 'disable_progress', str(self.arguments.disable_progress))
        self.config_manager.set_config(self.config_section_defaults, 'save_format_type', self.arguments.save_format_type)
        self.config_manager.set_config(self.config_section_defaults, 'use_github_api', self.arguments.use_github_api)

        logging.info(colorama.Fore.GREEN + 'Update default params successful')

    def set_logging_level(self):
        """
        Sets the logging level based on the 'debug' argument.
        If 'debug' is True, sets the logging level to DEBUG.
        Otherwise, sets the logging level to INFO.
        """
        logger = logging.getLogger()
        if self.arguments.debug:
            logger.setLevel(logging.DEBUG)
        else:
            logger.setLevel(logging.INFO)

        for old_handler in logger.handlers:
            logger.removeHandler(old_handler)

        #formatter = ColoredFormatter('%(asctime)s - %(levelname)s - %(message)s')
        formatter = ColoredFormatter('%(message)s')
        handler = logging.StreamHandler()
        handler.setFormatter(formatter)
        logger.addHandler(handler)

    def change_current_directory(self):
        """
        Changes the current directory to the directory where the script is located.
        This fixes "FileNotFoundError" in exe builds.
        """
        current_dir = os.path.dirname(sys.argv[0])
        if current_dir:
            os.chdir(current_dir)

    def generate_update_list(self):
        """
        Generates the list of tools to be updated.

        :return: List of tools to update
        """
        update_list = self.arguments.update
        if not update_list:
            update_list = self.config_manager.get_sections()

            # delete config data of this script
            if self.config_section_defaults in update_list:
                update_list.remove(self.config_section_defaults)

            # delete self updater config
            if self.config_section_self_update in update_list:
                update_list.remove(self.config_section_self_update)

        return update_list

    def handle_auto_update(self):
        """
        Handles the auto-update logic for the script itself.
        """
        updater = Updater(
            config_manager=self.config_manager,
        )
        if self.config_section_self_update in self.config_manager.get_sections() and \
                not self.arguments.disable_self_update:
            try:
                updater.update(self.config_section_self_update)
            except Exception as exception:
                logging.info(exception)

    def handle_tool_updates(self, updater, update_list):
        """
        Handles the update process for each tool in the update list.

        :param updater: An instance of the Updater class responsible for updating tools
        :param update_list: List of tools to update
        """
        for tool in update_list:
            try:
                updater.update(tool)
            except Exception as exception:
                logging.info(exception)

    def handle_updates(self):
        """
        Orchestrates the update process based on the configuration.
        """
        self.handle_auto_update()

        updater = Updater(
            config_manager=self.config_manager,

            # To convert from Namespace to Dict I have to use vars()
            updater_setup=vars(self.arguments),
        )
        update_list = self.generate_update_list()
        self.handle_tool_updates(updater, update_list)
        updater.cleanup_update_folder()

    def main(self):
        """
        Main entry point for the UpdateManager.
        """
        signal.signal(signal.SIGINT, self.exit_handler)
        self.change_current_directory()
        self.print_banner()
        self.parse_arguments()
        self.set_logging_level()
        self.update_default_params()
        self.handle_updates()


# Entry point for the script
if __name__ == '__main__':
    # Initialize and run the main method of UpdateManager
    UpdateManager().main()
