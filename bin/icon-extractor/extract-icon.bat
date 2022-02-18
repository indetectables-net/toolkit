@ECHO OFF

cd /D "%~dp0"
powershell.exe -ExecutionPolicy Bypass "%cd%\extract-icon.ps1" -Path "%1" -Destination "%2" -verbose
