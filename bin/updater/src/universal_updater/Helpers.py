import pathlib
import shutil
from urllib.parse import urlparse


class Helpers:

    @staticmethod
    def cleanup_folder(path):
        """
        Clean up a folder by deleting all its contents.
        """
        for file in pathlib.Path(path).iterdir():
            if file.is_dir():
                shutil.rmtree(file)
            else:
                file.unlink()

    @staticmethod
    def is_valid_url(url: str) -> bool:
        """
        Return True if URL has a valid HTTP/S scheme and network location.
        """
        parts = urlparse(url)
        return parts.scheme in ("http", "https") and bool(parts.netloc)

    @staticmethod
    def get_filename_from_url(url: str) -> str:
        """
        Extract the filename from a URL, stripping fragments and queries.
        """
        fragment_removed = url.split('#')[0]  # keep to left of first "#"
        query_string_removed = fragment_removed.split('?')[0]
        scheme_removed = query_string_removed.split('://')[-1].split(':')[-1]

        if scheme_removed.find('/') == -1:
            return ''

        return pathlib.Path(scheme_removed).name
