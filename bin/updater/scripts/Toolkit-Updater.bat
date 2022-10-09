@ECHO OFF
echo Update all Universal Update stuff and restart...
taskkill /IM updater.exe /F
xcopy /Y /C updates\main\toolkit-updater-main .
xcopy /Y /C updates\main\toolkit-updater-main\bin bin 
xcopy /Y /C updates\main\toolkit-updater-main\scripts scripts
cmd /c updater.exe
