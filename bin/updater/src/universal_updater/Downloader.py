import requests
from tqdm import tqdm
import pathlib
import colorama
import logging

from universal_updater.Helpers import Helpers


class Downloader:
    """Handles file downloads."""

    def __init__(self, user_agent, disable_progress, update_folder_path):
        """
        Initialize with optional user_agent, disable_progress flag, and update_folder_path.

        :param user_agent: User agent string for HTTP requests
        :param disable_progress: Flag to disable progress bar
        :param update_folder_path: Path to the folder where updates will be saved
        """
        self.user_agent = user_agent
        self.disable_progress = disable_progress
        self.update_folder_path = update_folder_path
        self.tool_name = ""

    def download_file(self, url, progress_bar_desc):
        """
        Download a file from a given URL.

        :param url: URL of the file to download
        :param progress_bar_desc: Description for the progress bar
        :return: Path where the file has been saved
        """
        headers = {'User-Agent': self.user_agent}
        response = requests.get(url, headers=headers, stream=True)
        response.raise_for_status()

        # grab data from response
        total_length = int(response.headers.get('content-length', 0))
        filename = Helpers.get_filename_from_url(response.url)

        # try to get filename from Content-Disposition header
        content_disposition = response.headers.get('content-disposition', '')
        if 'filename=' in content_disposition:
            logging.debug(f'Using name from content-disposition: {content_disposition}')
            filename = content_disposition.split('filename=')[-1].strip('"; ')

        dest_path = pathlib.Path(self.update_folder_path).joinpath(filename)
        with open(dest_path, 'wb') as handle, tqdm(
                disable=self.disable_progress,
                colour='green',
                ncols=100,
                desc=progress_bar_desc,
                total=total_length,
                unit='iB',
                unit_scale=True,
                unit_divisor=1024,
        ) as bar:
            for block in response.iter_content(1024):
                size = handle.write(block)
                bar.update(size)

        bar.close()
        return dest_path

    def download_from_web(self, tool_name, download_url):
        """
        Perform a download step for a given tool.

        :param tool_name: Name of the tool
        :param download_url: URL from which to download the tool
        :return: Path where the file has been saved
        """
        self.tool_name = tool_name
        file_name = Helpers.get_filename_from_url(download_url)
        logging.info(f'{self.tool_name}: downloading update "{file_name}"')

        try:
            file_path = self.download_file(
                url=download_url,
                progress_bar_desc=tool_name,
            )
        except Exception as exception:
            logging.error(f'{self.tool_name}: download url {download_url}')
            raise Exception(colorama.Fore.RED + f'{self.tool_name}: Error {exception}')

        return file_path
