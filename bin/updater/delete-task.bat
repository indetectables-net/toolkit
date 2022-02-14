@ECHO OFF

echo Delete auto updater custom task
echo read more in README.md
echo.
echo Execute in elevated command prompt!
echo -------------------------------------------------
echo.

SCHTASKS /DELETE /TN "IndetectablesToolkit_Updater"
pause
