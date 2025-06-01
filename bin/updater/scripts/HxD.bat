@ECHO OFF
SET "TOOL_NAME=%~1"
SET "UNPACK_DIR=%~2"
SET "DOWNLOAD_VER=%~3"
SET "BIN_DIR=%UNPACK_DIR%\..\..\bin"

echo Make HxD Portable
cd "%UNPACK_DIR%"
"%BIN_DIR%/innounp.exe" -e "HxDPortableSetup.exe" "*,3.exe" "license.txt" "readme.txt"
IF ERRORLEVEL 1 (
    ECHO Extraction failed!
    EXIT /B 1
)

move "HxD32,3.exe" "HxD32.exe"
move "HxD64,3.exe" "HxD64.exe"
del "HxDPortableSetup.exe"
