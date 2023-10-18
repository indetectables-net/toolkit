import pathlib
import shutil


class Helpers:

    @staticmethod
    def cleanup_folder(path):
        """
        Clean up a folder by deleting all its contents.

        :param path: Path to the folder to be cleaned
        """
        for file in pathlib.Path(path).iterdir():
            if file.is_dir():
                shutil.rmtree(file)
            else:
                file.unlink()
