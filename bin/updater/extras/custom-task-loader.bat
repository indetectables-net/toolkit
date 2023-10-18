@echo off

::cd /D D:\code\indetectables\toolkit\Updater\
cd /D "%~dp0"

echo Executing Indetectables Toolkit Updater
echo %cd%
updater.exe > last-run.log
