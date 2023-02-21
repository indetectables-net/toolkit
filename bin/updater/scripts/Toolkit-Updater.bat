@ECHO OFF
echo Update all Universal Update stuff and restart...

:: I kill the process to be able to update all the files
taskkill /IM updater.exe /F

:: Update files
xcopy /Y /C updates\main\toolkit-updater-main .
xcopy /Y /C updates\main\toolkit-updater-main\bin bin 
xcopy /Y /C updates\main\toolkit-updater-main\scripts scripts
xcopy /Y /C updates\main\toolkit-updater-main\migrations migrations

:: Configure installed tools
..\auto-config-tools\auto-config-tools.exe /FOLDER=..\updater

:: Restart updater
cmd /c updater.exe
