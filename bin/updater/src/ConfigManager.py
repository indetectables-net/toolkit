import configparser
import colorama


class ConfigManager:
    """
    Manages configuration settings, including getting and setting values,
    as well as updating the local version of a tool.
    """

    def __init__(self, config_file_name):
        """
        Initialize with the name of the config file.

        :param config_file_name: Name of the configuration file
        """
        self.config = configparser.ConfigParser()
        self.config_file_name = config_file_name
        self.config.read(self.config_file_name)

    def get_config(self, section, key, fallback=None):
        """
        Get a configuration value.

        :param section: Section in the config file
        :param key: Key in the section
        :param fallback: Fallback value if key is not found
        :return: Value of the configuration key
        """
        return self.config.get(section, key, fallback=fallback)

    def set_config(self, section, key, value):
        """
        Set a configuration value.

        :param section: Section in the config file
        :param key: Key in the section
        :param value: Value to set
        """
        if not self.config.has_section(section):
            self.config.add_section(section)

        self.config.set(section, key, value)
        self.save_config()

    def get_tool_config(self, name):
        """
        Retrieve the configuration for a specific tool.

        :param name: Name of the tool
        :return: Dictionary containing the tool's configuration
        """
        if name in self.config.sections():
            return dict(self.config.items(name))

        raise Exception(colorama.Fore.RED + f'No entries were found for {name}')

    def get_boolean(self, section, option, fallback=None):
        """
        Get a boolean configuration value.

        :param section: Section in the config file
        :param option: Option in the section
        :param fallback: Fallback value if option is not found
        :return: Boolean value of the configuration option
        """
        return self.config.getboolean(section, option, fallback=fallback)

    def get_sections(self):
        """
        Get all sections in the configuration file.

        :return: List of section names
        """
        return self.config.sections()

    def update_local_version(self, name, version):
        """
        Update the local version of a tool in the configuration file.

        :param name: Name of the tool
        :param version: New version to update
        """
        self.set_config(name, 'local_version', version)

    def save_config(self):
        """
        Save the current configuration to file.
        """
        with open(self.config_file_name, 'w') as config_file:
            self.config.write(config_file)
