@ECHO OFF
SET "TOOL_NAME=%~1"
SET "UNPACK_DIR=%~2"
SET "DOWNLOAD_VER=%~3"

echo Fix Threadtear main exe name
cd "%UNPACK_DIR%"
move threadtear-gui-*-all.jar threadtear-gui-all.jar
