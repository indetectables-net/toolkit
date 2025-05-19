@ECHO OFF
SET "TOOL_NAME=%~1"
SET "UNPACK_DIR=%~2"
SET "DOWNLOAD_VER=%~3"

echo Make MultiMon Portable
cd "%UNPACK_DIR%"
"../../bin/innounp.exe" -e "MultiMonHome.exe"
del "install_script.iss"
del "MultiMonHome.exe"
