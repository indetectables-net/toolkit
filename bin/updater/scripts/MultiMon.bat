@ECHO OFF
SET "TOOL_NAME=%~1"
SET "UNPACK_DIR=%~2"
SET "DOWNLOAD_VER=%~3"
SET "BIN_DIR=%UNPACK_DIR%\..\..\bin"

echo Make MultiMon Portable
cd "%UNPACK_DIR%"
"%BIN_DIR%/innounp.exe" -e "MultiMonHome.exe"
IF ERRORLEVEL 1 (
    ECHO Extraction failed!
    EXIT /B 1
)

del "install_script.iss"
del "MultiMonHome.exe"
