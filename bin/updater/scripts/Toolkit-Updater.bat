@ECHO OFF
SET "TOOL_NAME=%~1"
SET "UNPACK_DIR=%~2"
SET "DOWNLOAD_VER=%~3"

echo Update all Universal Update stuff and restart...

:: Kill updater process to be able to update all the files
taskkill /IM updater.exe /F

:: Clean updater mutex
del mutex.lock

:: Backup user tools.ini
move tools.ini tools.ini.old

:: Update files
xcopy /Y /C "%UNPACK_DIR%\toolkit-updater-main" .
xcopy /Y /C "%UNPACK_DIR%\toolkit-updater-main\bin" bin 
xcopy /Y /C "%UNPACK_DIR%\toolkit-updater-main\scripts" scripts

:: Configure installed tools
bin\auto-config-ini.exe /FOLDER=..\updater /TYPE=clean

:: Set updater default config
bin\auto-config-ini.exe /FOLDER=..\updater /TYPE=toolkit

:: Sync tools versions
bin\auto-config-ini.exe /FOLDER=..\updater /TYPE=sync
del tools.ini.old

:: Restart updater
cmd /c updater.exe
