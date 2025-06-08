@ECHO OFF
SET "TOOL_NAME=%~1"
SET "UNPACK_DIR=%~2"
SET "DOWNLOAD_VER=%~3"
SET "BIN_DIR=%UNPACK_DIR%\..\..\bin"

echo Update VBDEC
cd "%UNPACK_DIR%"

:: unpack
echo.
"%BIN_DIR%\innounp.exe" -x -y "VBDEC_Setup.exe"
IF ERRORLEVEL 1 (
    ECHO Extraction failed!
    EXIT /B 1
)

:: clean
echo.
echo Clean files...
xcopy {app}\*.* /E /I /H /Y
xcopy {sys}\*.* /E /I /H /Y
del /F /Q "VBDEC_Setup.exe"
rmdir /S /Q {app}
move {sys} sys

:: copy register script
echo.
echo Remember to run the "VBDEC-register.bat" script before starting the program for the first time!
