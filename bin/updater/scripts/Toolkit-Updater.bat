@ECHO OFF
echo Update all Universal Update stuff and restart...

:: Kill updater process to be able to update all the files
taskkill /IM updater.exe /F

:: Backup user tools.ini
mv tools.ini tools.ini.old

:: Update files
xcopy /Y /C updates\main\toolkit-updater-main .
xcopy /Y /C updates\main\toolkit-updater-main\bin bin 
xcopy /Y /C updates\main\toolkit-updater-main\scripts scripts

:: Configure installed tools
bin\auto-config-ini.exe /FOLDER=..\updater /TYPE=clean

:: Sync tools versions
bin\auto-config-ini.exe /FOLDER=..\updater /TYPE=sync
del tools.ini.old

:: Restart updater
cmd /c updater.exe
