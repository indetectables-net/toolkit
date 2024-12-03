import os
import pathlib
import colorama
import logging

from universal_updater.Scraper import Scraper
from universal_updater.Downloader import Downloader
from universal_updater.Packer import Packer
from universal_updater.FileManager import FileManager
from universal_updater.ScriptExecutor import ScriptExecutor
from universal_updater.Helpers import Helpers


class Updater:
    """
    Manages the update process for a tool. The class is responsible for
    scraping the latest version, downloading updates, unpacking, and saving or
    repacking the tool. It also handles pre-update and post-update scripts.
    """

    def __init__(self, config_manager, updater_setup = {}):
        """
        Initialize the Updater class with various configurations.

        :param config_manager: Configuration manager instance
        :param updater_setup: Dictionary containing various flags and settings for the updater.
            Possible keys are:
            - force_download: Flag to force download
            - disable_repack: Flag to disable repacking
            - disable_clean: Flag to disable cleaning
            - disable_install_check: Flag to disable installation check
            - disable_progress: Flag to disable progress bar
            - save_format_type: Format type for saving (default "full")
            - use_github_api: Flag to use GitHub API. The value is the token to use the api.
        """
        self.tool_name = ""
        self.tool_config = {}
        self.script_path = os.fsdecode(os.getcwdb())
        self.update_folder_path = pathlib.Path(self.script_path).joinpath('updates')
        self.request_user_agent = 'curl/7.84.0'
        self.config_manager = config_manager
        self.disable_install_check = updater_setup.get('disable_install_check', False)
        self.disable_repack = updater_setup.get('disable_repack', False)
        self.scraper = Scraper(
            force_download=updater_setup.get('force_download', False),
            use_github_api=updater_setup.get('use_github_api', ''),
            user_agent=self.request_user_agent,
        )
        self.downloader = Downloader(
            disable_progress=updater_setup.get('disable_progress', False),
            user_agent=self.request_user_agent,
            update_folder_path=self.update_folder_path,
        )
        self.packer = Packer(
            save_format_type=updater_setup.get('save_format_type', 'full'),
            disable_clean=updater_setup.get('disable_clean', False),
            update_folder_path=self.update_folder_path,
        )
        self.file_manager = FileManager(
            disable_clean=updater_setup.get('disable_clean', False),
            script_path=self.script_path,
        )
        self.script_executor = ScriptExecutor()

    def check_tool_installed(self):
        """
        Check if the tool is installed. Raise an exception if not found.
        """
        tool_folder_path = self.file_manager.get_tool_install_path()
        if not tool_folder_path.exists() and not self.disable_install_check:
            raise Exception(colorama.Fore.YELLOW + f'{self.tool_name}: The program was not found')

    def pre_update(self):
        """
        Execute pre-update checks and scripts.
        """
        self.check_tool_installed()
        self.script_executor.execute_script('pre_update')

    def post_update(self, processing_info):
        """
        Execute post-update scripts.

        :param processing_info: Information about the processing step
        """
        self.script_executor.execute_script('post_update')
        self.script_executor.execute_global_script(processing_info)

    def download_step(self, download_url):
        """
        Download the tool from the given URL.

        :param download_url: URL to download the tool from
        :return: Path to the downloaded file
        """
        # create updates folder if don't exist
        if not pathlib.Path.exists(self.update_folder_path):
            pathlib.Path.mkdir(self.update_folder_path)

        # download
        self.cleanup_update_folder()
        return self.downloader.download_from_web(self.tool_name, download_url)

    def processing_tool_step(self, file_path, download_version):
        """
        Process the downloaded tool.

        :param file_path: Path to the downloaded file
        :param download_version: Version of the downloaded tool
        :return: Dictionary containing processing information
        """
        # unpack logic
        unpack_folder_path = self.packer.unpack_step(file_path)
        self.script_executor.execute_script('post_unpack')

        # save or repack logic
        disable_repack = self.tool_config.get('disable_repack', None)
        tool_path = self.file_manager.processing_tool_path(unpack_folder_path)
        if self.disable_repack or disable_repack:
            return self.file_manager.save(
                tool_folder_path=tool_path['folder_path'],
                tool_unpack_path=tool_path['unpack_path'],
            )

        return self.packer.repack_step(
            tool_folder_path=tool_path['folder_path'],
            tool_unpack_path=tool_path['unpack_path'],
            unpack_folder_path=unpack_folder_path,
            version=download_version,
        )

    def cleanup_update_folder(self):
        """
        Clean up the update folder.
        """
        if pathlib.Path.exists(self.update_folder_path):
            Helpers.cleanup_folder(self.update_folder_path)

    def update(self, tool_name):
        """
        Perform the update process for a given tool.

        :param tool_name: Name of the tool to update
        :return: bool: True if the update completes successfully, False if no update is needed.
        :raises Exception: If any step in the update process fails.
        """
        # tool data setup
        self.tool_name = tool_name
        self.tool_config = self.config_manager.get_tool_config(tool_name)
        self.scraper.tool_setup(self.tool_name, self.tool_config)
        self.packer.tool_setup(self.tool_name, self.tool_config)
        self.file_manager.tool_setup(self.tool_name, self.tool_config)
        self.script_executor.tool_setup(self.tool_name, self.tool_config)

        # execute checks and scripts
        self.pre_update()

        # generate version and download data
        scrape_data = self.scraper.scrape_step()
        if scrape_data is False:
            return False

        # download and process file
        update_file_path = self.download_step(scrape_data['download_url'])
        processing_info = self.processing_tool_step(update_file_path, scrape_data['download_version'])

        # update complete
        self.config_manager.update_local_version(self.tool_name, scrape_data['download_version'])
        self.post_update(processing_info)

        logging.info(f'{self.tool_name}: update complete')
        return True
