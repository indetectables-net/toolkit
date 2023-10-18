import colorama
import logging


class ColoredFormatter(logging.Formatter):
    COLORS = {
        'DEBUG': colorama.Fore.CYAN,
        # 'INFO': colorama.Fore.GREEN,
        'WARNING': colorama.Fore.YELLOW,
        'ERROR': colorama.Fore.RED,
        'CRITICAL': colorama.Fore.RED + colorama.Back.YELLOW,
    }

    def format(self, record):
        log_message = super().format(record)
        return self.COLORS.get(record.levelname, '') + log_message + colorama.Style.RESET_ALL
