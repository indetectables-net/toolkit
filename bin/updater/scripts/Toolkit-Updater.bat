@ECHO OFF
echo Update all Universal Update stuff and restart...

:: I kill the process to be able to update all the files
taskkill /IM updater.exe /F

:: Update files
xcopy /Y /C updates\main\toolkit-updater-main .
xcopy /Y /C updates\main\toolkit-updater-main\bin bin 
xcopy /Y /C updates\main\toolkit-updater-main\scripts scripts

:: Run migrations
bin\hpatchz.exe -f tools.ini migrations\2022.12.1.diff tools.ini

:: Restrat updater
cmd /c updater.exe
