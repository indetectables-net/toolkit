import subprocess
import colorama
import logging


class ScriptExecutor:
    """
    Class responsible for executing scripts during the update process.
    """

    def __init__(self):
        """
        Initialize ScriptExecutor.
        """
        self.tool_name = ""
        self.tool_config = {}
        self.valid_types = ['post_unpack', 'pre_update', 'post_update']

    def tool_setup(self, tool_name, tool_config):
        """
        Initialize tool-specific settings.

        :param tool_name: Name of the tool
        :param tool_config: Configuration object for the specific tool
        """
        self.tool_name = tool_name
        self.tool_config = tool_config

    def execute_script(self, script_type):
        """
        Execute a specific script for a given tool.

        :param script_type: Type of script to execute ('pre_update', 'post_update', 'post_unpack')
        """
        if script_type in self.valid_types and script_type in self.tool_config:
            script = self.tool_config[script_type]
            logging.info(f'{self.tool_name}: exec {script_type} "{script}"')
            logging.info(colorama.Fore.BLUE + '------------------------------')
            subprocess.run(script)
            logging.info(colorama.Fore.BLUE + '------------------------------')

    def execute_global_script(self, processing_info):
        """
        Execute a global script.

        :param processing_info: Dictionary containing processing information
        """
        if 'global_post_update' in self.tool_config:
            script = self.tool_config['global_post_update']
            logging.info(f'{self.tool_name}: exec global script "{script}"')
            subprocess.run([
                script,
                processing_info['tool_name'],
                processing_info['tool_folder'],
                processing_info['save_compress_name'],
            ])
