English | [Español](README.ES.md)

# Universal Tool Updater

This tool is designed to help with the tedious process of keeping the tools that we use to work daily up to date.

This is the inevitable complement to the [toolkit](https://github.com/indetectables-net/toolkit) of the site.

![](assets/demo.gif)

## Installation

You can clone the repo with [git](https://git-scm.com/download/win) or just download it from download.

```bash
git clone https://github.com/xchwarze/universal-tool-updater
```

## Setting

To add tools you have to edit the file `tools.ini`.

By default, it is configured as an example so that the user quickly understands how the tool is used.

```ini
[DIE]
folder = Analysis\DIE
url = horsicq/DIE-engine
from = github
re_download = die_win64_portable_(?:\S+).zip

[Portmon]
folder = Monitor\Portmon
url = https://raw.githubusercontent.com/MicrosoftDocs/sysinternals/main/sysinternals/downloads/portmon.md
update_url = https://download.sysinternals.com/files/PortMon.zip
from = web
re_version = # Portmon v(\d+\.\d+)
```

The values used for configuration are:

| Name               | Mandatory | Description                                                                                                    |
|--------------------|-----------|----------------------------------------------------------------------------------------------------------------|
| `folder`           | YES       | Folder where the tool will be saved. If it does not exist, it will be created.                                 |
| `url`              | YES       | Web page used as the primary source for version check and/or regex scraping.                                   |
| `from`             | NO        | Strategy to use: `web`, `github` or `http`. Default is `web`.                                                  |
| `local_version`    | NO        | Currently installed version. Updated after each successful run.                                                |
| `re_version`       | NO        | Regex to extract the new version string from the HTML at `url`.                                                |
| `re_download`      | NO        | Regex to extract the download link from HTML. Should capture either a full URL or a relative path.             |
| `update_url`       | NO        | Base URL or direct download link. Used when `re_download` yields a relative path or when no regex is provided. |
| `update_file_pass` | NO        | Password to unzip the downloaded archive.                                                                      |
| `merge`            | NO        | If set, merge the freshly downloaded files into the existing folder.                                           |
| `pre_update`       | NO        | Script or command to run before performing the update.                                                         |
| `post_update`      | NO        | Script or command to run immediately after the update download completes.                                      |
| `post_unpack`      | NO        | Script or command to run after unpacking the downloaded archive.                                               |


## Strategy for download

1. **If `re_download` is set**  
   a. Try to extract link from the initial `url` HTML.  
   b. If you get a match and it’s a valid absolute URL → use it.  
   c. If you get a match but it’s a relative path →  
      - If `update_url` is defined, prepend it.  
      - Otherwise, build from the original page’s scheme+netloc.  
   d. If no match on the initial HTML and `update_url` is defined → fetch `update_url` once, retry the same regex.  
   e. If still no match → raise an error.

2. **Else if only `update_url` is set**  
   Use `update_url` directly as the download link.

3. **HTTP mode (`from = http`)**  
   - Sends a **HEAD** request to `update_url`.  
   - Extracts a version fingerprint by hashing either the `Last-Modified` or `Content-Length` header.  
   - If the hash differs from `local_version` (or `force_download`), uses `update_url` as the download link.  
   - If the headers match and `force_download` is false, no update is performed.

4. **Otherwise**  
   Error out: neither `re_download` nor `update_url` provided, so no download link can be determined.


## Command-line Parameters

The updater provides a flexible set of parameters to control its behavior:

| Parameter                                                          | Description                                                                                |
|--------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| `-h, --help`                                                       | Show this help message and exit.                                                           |
| `-v, --version`                                                    | Display the program's version number and exit.                                             |
| `-u [UPDATE ...], --update [UPDATE ...]`                           | Specify a list of tools to update. Defaults to updating all tools if not provided.         |
| `-dsu, --disable-self-update`                                      | Disable automatic self-update of this script.                                              |
| `-dfc, --disable-folder-clean`                                     | Skip cleaning the tool's folder during updates.                                            |
| `-dr, --disable-repack`                                            | Prevent repacking of tools after the update process.                                       |
| `-dic, --disable-install-check`                                    | Skip checking if the tools are properly installed.                                         |
| `-dpb, --disable-progress-bar`                                     | Disable the download progress bar for updates.                                             |
| `-sft {full,version,name}, --save-format-type {full,version,name}` | Specify the save format type for compressed updates: `full`, `version`, or `name`.         |
| `-f, --force`                                                      | Force the download of updates, even if they appear up to date.                             |
| `-uga USE_GITHUB_API, --use-github-api USE_GITHUB_API`             | Use the GitHub API for updates, specifying the token to authenticate.                      |
| `-udp, --update-default-params`                                    | Update the default parameters stored in the configuration.                                 |
| `-dmc, --disable-mutex-check`                                      | Allow multiple instances of the script to run simultaneously by disabling the mutex check. |
| `-d, --debug`                                                      | Enable detailed debug output for troubleshooting.                                          |

## Examples

The tool supports various commands and combinations. These are the most used. 

* Update a particular tool

```bash
updater.exe --update "Process Hacker 3"
```

* Force Update of a tool

```bash
updater.exe --force --update DIE
```

* Update without compressing or cleaning the folder

```bash
updater.exe --disable-folder-clean --disable-repack
```

## Use with GitHub Api

GitHub download are performed by default scraping data, but for a more robust operation it is recommended to do it using the GitHub api.
To do this, follow these steps:

1. Generate our token from https://github.com/settings/tokens by clicking on Generate new token.
2. Run the updater with the following commands 

```bash
updater.exe --update-default-params --use-github-api your_github_token
```

## Use with scheduled tasks

* Add updater tool to scheduled task. You can read more here 
"[Create scheduled tasks with CLI](https://www.windowscentral.com/how-create-task-using-task-scheduler-command-prompt)", 
"[How to create an automated task](https://www.windowscentral.com/how-create-automated-task-using-task-scheduler-windows-10)" and 
"[Prevent command window appearing](https://pureinfotech.com/prevent-command-window-appearing-scheduled-tasks-windows-10/)"

```bash
# execute in elevated command prompt
SCHTASKS /CREATE /SC DAILY /TN "ToolkitUpdater" /TR "D:\code\toolkit\Updater\custom-task.bat" /ST 14:00
```

* Delete scheduled task

```bash
# execute in elevated command prompt
SCHTASKS /DELETE /TN "ToolkitUpdater"
```

## Compile to exe

```bash
pip install pyinstaller
pyinstaller --onefile UpdateManager.py --icon=../assets/appicon.ico
```
