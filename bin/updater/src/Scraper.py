import re
import requests
import urllib.parse
import binascii
import colorama
import logging


class Scraper:
    """
    Handles all scraping tasks for the Updater.
    """

    def __init__(self, force_download, use_github_api, user_agent):
        """
        Initialize the Scraper with necessary configurations.

        :param use_github_api: Boolean to determine if GitHub API should be used
        :param user_agent: User agent string for HTTP requests
        """
        self.user_agent = user_agent
        self.force_download = force_download
        self.use_github_api = use_github_api
        self.tool_name = ""
        self.tool_config = {}
        self.github_version_check = 'https://github.com/{0}/releases.atom'
        self.github_files = 'https://github.com/{0}/releases/expanded_assets/{1}'
        self.github_api_files = 'https://api.github.com/repos/{0}/releases/latest'
        self.re_github_version = '\/releases\/tag\/(\S+)"'
        self.re_github_download = '"(.*?/{0})"'

    def tool_setup(self, tool_name, tool_config):
        """
        Initialize tool-specific settings.

        :param tool_name: Name of the tool
        :param tool_config: Configuration object for the specific tool
        """
        self.tool_name = tool_name
        self.tool_config = tool_config

    def web_get_request(self, url, headers=None):
        """
        Performs a GET request to a given URL.

        :param url: The URL to perform the GET request to
        :param headers: Optional dictionary containing HTTP headers. If not provided, the default User-Agent is used.
        :return: Response object from the GET request
        :raises Exception: If an error occurs during the request
        """
        if headers is None:
            headers = {'User-Agent': self.user_agent}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()
            return response
        except Exception as exception:
            raise Exception(colorama.Fore.RED + f'{self.tool_name}: Error {exception}')

    #################
    # Scraper methods
    #################
    def scrape_web(self):
        """
        Scrape web for version and download URL based on tool_config.

        :return: Dictionary containing 'download_version' and 'download_url'
        """
        update_url = self.tool_config.get('update_url', None)
        re_version = self.tool_config.get('re_version', None)
        re_download = self.tool_config.get('re_download', None)

        # load html
        url = self.tool_config.get('url', None)
        html_response = self.web_get_request(url)
        logging.debug(f'{self.tool_name}: HTML content fetched, starting regex matching.')

        # regex shit
        download_version = self.check_version_from_web(html_response.text, re_version)
        download_url = self.get_download_url_from_web(html_response.text, url, update_url, re_download)
        logging.debug(f'{self.tool_name}: Regex matching done.')

        return {
            'download_version': download_version,
            'download_url': download_url,
        }

    def scrape_github(self):
        """
        Scrape GitHub for version and download URL based on tool_config.

        :return: Dictionary containing 'download_version' and 'download_url'
        """
        if self.use_github_api:
            return self.scrape_github_api()

        github_repo = self.tool_config.get('url', None)

        # load html
        version_url = self.github_version_check.format(github_repo)
        version_html_response = self.web_get_request(version_url)
        logging.debug(f'{self.tool_name}: Version HTML fetched, starting regex matching for version.')

        download_version = self.check_version_from_web(version_html_response.text, self.re_github_version)
        logging.debug(f'{self.tool_name}: Regex matching for version done.')

        # load second html
        update_url = self.tool_config.get('update_url', None)
        if not update_url:
            logging.debug(f'{self.tool_name}: update_url not set. I try to generate it.')
            download_url = self.github_files.format(github_repo, download_version)
            download_html_response = self.web_get_request(download_url)

            re_download = self.re_github_download.format(self.tool_config.get('re_download', None))
            update_url = self.get_download_url_from_web(download_html_response.text, version_url, '', re_download)

        return {
            'download_version': download_version,
            'download_url': update_url,
        }

    def scrape_github_api(self):
        """
        Scrape GitHub API for version and download URL based on tool_config.

        :return: Dictionary containing 'download_version' and 'download_url'
        """
        logging.debug(f'{self.tool_name}: Consuming GitHub via Api')
        github_repo = self.tool_config.get('url', None)
        repo_url = self.github_api_files.format(github_repo)

        # load json
        headers = {'Authorization': f'token {self.use_github_api}'}
        api_response = self.web_get_request(repo_url, headers)
        json_response = api_response.json()
        logging.debug(f'{self.tool_name}: JSON fetched, extracting version and download URL.')

        update_url = self.tool_config.get('update_url', None)
        if not update_url:
            logging.debug(f'{self.tool_name}: update_url not set. I try to generate it.')
            update_url = self.get_download_url_from_github(json_response)

        download_version = self.check_version_from_github(json_response)
        logging.debug(f'{self.tool_name}: Version and download URL extracted.')

        # regex shit
        return {
            'download_version': download_version,
            'download_url': update_url,
        }

    def scrape_http(self):
        """
        Scrape HTTP headers for version based on tool_config.

        :return: Dictionary containing 'download_version' and 'download_url'
        """
        # get http response
        update_url = self.tool_config.get('update_url', None)
        headers = {'User-Agent': self.user_agent}

        try:
            http_response = requests.head(update_url, headers=headers)
            http_response.raise_for_status()
            logging.debug(f'{self.tool_name}: HTTP headers fetched, extracting version.')
        except Exception as exception:
            raise Exception(colorama.Fore.RED + f'{self.tool_name}: Error {exception}')

        download_version = self.check_version_from_http(http_response.headers)
        logging.debug(f'{self.tool_name}: Version extracted.')

        return {
            'download_version': download_version,
            'download_url': update_url,
        }

    #################
    # Check methods
    #################
    def check_version_from_web(self, html, re_version):
        """
        Check version from web HTML content.

        :param html: HTML content
        :param re_version: Regex pattern for version
        :return: Version string
        """
        local_version = self.tool_config.get('local_version', '0')
        html_regex_version = re.findall(re_version, html)

        if not html_regex_version:
            raise Exception(colorama.Fore.RED + f'{self.tool_name}: re_version regex not match ({re_version})')

        if not self.force_download and local_version == html_regex_version[0]:
            raise Exception(f'{self.tool_name}: {local_version} is the latest version')

        logging.info(f'{self.tool_name}: updated from {local_version} --> {html_regex_version[0]}')

        return html_regex_version[0]

    def check_version_from_http(self, headers):
        """
        Check version from HTTP headers.

        :param headers: HTTP headers
        :return: Version string
        """
        local_version = self.tool_config.get('local_version', '0')

        remote_version = None
        if 'last-modified' in headers:
            logging.info(f'{self.tool_name}: using "last-modified" as version number...')
            input_bytes = headers['last-modified'].encode()
            remote_version = str(binascii.crc32(input_bytes))
        elif 'content-length' in headers:
            logging.info(f'{self.tool_name}: using "content-length" as version number...')
            input_bytes = headers['content-length'].encode()
            remote_version = str(binascii.crc32(input_bytes))
        else:
            raise Exception(colorama.Fore.RED +
                            f'{self.tool_name}: no header is found with which to determine if there is an update')

        if not self.force_download and local_version == remote_version:
            raise Exception(f'{self.tool_name}: {local_version} is the latest version')

        logging.info(f'{self.tool_name}: updated from {local_version} --> {remote_version}')

        return remote_version

    def check_version_from_github(self, json):
        """
        Check version from GitHub API JSON response.

        :param json: JSON response from GitHub API
        :return: Version string
        """
        local_version = self.tool_config.get('local_version', '0')

        if not self.force_download and local_version == json['tag_name']:
            raise Exception(f'{self.tool_name}: {local_version} is the latest version')

        logging.info(f'{self.tool_name}: updated from {local_version} --> {json["tag_name"]}')

        return json['tag_name']

    #################
    # Check methods
    #################
    def get_download_url_from_web(self, html, html_url, update_url, re_download):
        """
        Get download URL from a web page using regex.

        :param html: HTML content of the web page
        :param html_url: Original URL of the web page
        :param update_url: Base URL for download
        :param re_download: Regex pattern to find the download URL
        :return: Download URL found or None
        """
        # case 2: if update_url is not set, scrape the link from html
        if re_download:
            html_regex_download = re.findall(re_download, html)
            if not html_regex_download:
                raise Exception(colorama.Fore.RED + f'{self.tool_name}: re_download regex not match ({re_download})')

            # check if valid url
            download_url_parse = urllib.parse.urlparse(html_regex_download[0])

            # case 3: if update_url and re_download is set.... generate download link
            if update_url:
                update_url = f'{update_url}{html_regex_download[0]}'
            elif download_url_parse.scheme == '':
                html_url_parse_fix = urllib.parse.urlparse(html_url)
                update_url = f'{html_url_parse_fix.scheme}://{html_url_parse_fix.netloc}/{html_regex_download[0]}'
            else:
                update_url = html_regex_download[0]

        # case 1: if update_url is set... download it!
        if not update_url:
            raise Exception(colorama.Fore.RED + f'{self.tool_name}: update_url not generated!')

        return update_url

    def get_download_url_from_github(self, json):
        """
        Get download URL from GitHub API JSON response.

        :param json: JSON response from GitHub API
        :return: Download URL found or None
        """
        re_download = self.tool_config.get('re_download', None)
        if not re_download:
            raise Exception(colorama.Fore.RED + f'{self.tool_name}: re_download regex not set')

        update_url = None
        for attachment in json['assets']:
            html_regex_download = re.findall(re_download, attachment['browser_download_url'])
            if html_regex_download:
                update_url = attachment['browser_download_url']
                break

        if not update_url:
            raise Exception(colorama.Fore.RED + f'{self.tool_name}: re_download regex not match ({re_download})')

        return update_url

    #################
    # Scrape step
    #################
    def scrape_step(self):
        """
        Execute a specific script for a given tool based on tool_config.

        :return: Dictionary containing 'download_version' and 'download_url'
        """
        from_url = self.tool_config.get('from', 'web')
        if from_url == 'github':
            return self.scrape_github()
        elif from_url == 'http':
            return self.scrape_http()

        return self.scrape_web()
