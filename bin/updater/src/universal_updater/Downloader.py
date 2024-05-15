import requests
from tqdm import tqdm
import pathlib
import colorama
import logging


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

    def get_filename_from_url(self, url):
        """
        Extract the filename from a given URL.

        :param url: URL string
        :return: Extracted filename as a string
        """
        fragment_removed = url.split('#')[0]  # keep to left of first "#"
        query_string_removed = fragment_removed.split('?')[0]
        scheme_removed = query_string_removed.split('://')[-1].split(':')[-1]

        if scheme_removed.find('/') == -1:
            return ''

        return pathlib.Path(scheme_removed).name

    def download_file(self, url, dest_path, progress_bar_desc):
        """
        Download a file from a given URL.

        :param url: URL of the file to download
        :param dest_path: Destination path to save the file
        :param progress_bar_desc: Description for the progress bar
        """
        headers = {'User-Agent': self.user_agent}
        response = requests.get(url, headers=headers, stream=True)
        response.raise_for_status()

        total_length = int(response.headers.get('content-length', 0))
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

    def download_from_web(self, tool_name, download_url):
        """
        Perform a download step for a given tool.

        :param tool_name: Name of the tool
        :param download_url: URL from which to download the tool
        :return: Path where the file has been saved
        """
        file_name = self.get_filename_from_url(download_url)
        file_path = pathlib.Path(self.update_folder_path).joinpath(file_name)

        logging.info(f'{tool_name}: downloading update "{file_name}"')

        try:
            self.download_file(
                url=download_url,
                dest_path=file_path,
                progress_bar_desc=tool_name,
            )
        except Exception as exception:
            logging.error(f'{tool_name}: download url {download_url}')
            raise Exception(colorama.Fore.RED + f'{tool_name}: Error {exception}')

        return file_path
