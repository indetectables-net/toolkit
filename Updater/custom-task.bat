@echo off
::cd /D D:\code\indetectables\toolkit\Updater\
cd /D "%~dp0"
echo %cd%
updater.exe > last-run.log
