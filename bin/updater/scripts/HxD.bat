@ECHO OFF
SET "TOOL_NAME=%~1"
SET "UNPACK_DIR=%~2"
SET "DOWNLOAD_VER=%~3"

echo Make HxD Portable
cd "%UNPACK_DIR%"
"../../bin/innounp.exe" -e "HxDPortableSetup.exe" "*,3.exe" "license.txt" "readme.txt"
move "HxD32,3.exe" "HxD32.exe"
move "HxD64,3.exe" "HxD64.exe"
del "HxDPortableSetup.exe"
