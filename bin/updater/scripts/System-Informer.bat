@ECHO OFF
SET "TOOL_NAME=%~1"
SET "UNPACK_DIR=%~2"
SET "DOWNLOAD_VER=%~3"

echo Delete System Informer arm64 folder
cd "%UNPACK_DIR%"
rmdir /s /q arm64
