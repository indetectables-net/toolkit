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
url = https://docs.microsoft.com/en-us/sysinternals/downloads/portmon
update_url = https://download.sysinternals.com/files/PortMon.zip
re_version = <h1 [^>]*>Portmon for Windows v(.*?)</h1>
```

The values used for configuration are:

| Name               | Mandatory | Description                                                                                    |
|--------------------|-----------|------------------------------------------------------------------------------------------------|
| `folder`           | `YES`     | Folder where the tool will be saved. If it does not exist, it will be created.                 |
| `url`              | `YES`     | Web that will be used to perform the checks with the regex.                                    |
| `from`             | `NO`      | Indicates the strategy used for the update. Currently supported values are: `web`, `github` or `http`. |
| `local_version`    | `NO`      | Currently downloaded version. This value will be updated with each update.                     |
| `re_version`       | `NO`      | Regex used to check for new versions on the web used in `url`.                                 |
| `re_download`      | `NO`      | Regex used to get the download link on the web used in `url`.                                  |
| `update_url`       | `NO`      | Update download URL. See "Strategy for download" for more info.                                |
| `update_file_pass` | `NO`      | Use this password to unzip the update.                                                         |
| `merge`            | `NO`      | Merge new version with local.                                                                  |
| `pre_update`       | `NO`      | The entered script will be executed before the update process.                                 |
| `post_update`      | `NO`      | The entered script will be executed after the update process.                                  |
| `post_unpack`      | `NO`      | The entered script will be executed after unpack the update file.                              |

## Strategy for download

Combining the use of `update_url` and `re_download` the following download strategies are achieved:

1. Using only `update_url` it downloads directly without any extra processing.
2. Using only `re_download` you get the download link on the web from `url`.
3. When using both parameters, the result of `re_download` is concatenated with `update_url`.
This is useful for fixing GitHub or Sourceforge download links.
4. A new version detection method is also available that instead of regex uses the http headers with which the server responds.

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
pyinstaller --onefile updater.py --icon=assets/appicon.ico
```
