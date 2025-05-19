@ECHO OFF
SET "TOOL_NAME=%~1"
SET "UNPACK_DIR=%~2"
SET "DOWNLOAD_VER=%~3"

echo Fix x64dbg folder structure
cd "%UNPACK_DIR%"

SET src_folder=release
SET tar_folder=.

for /f %%a IN ('dir "%src_folder%" /b') do move "%src_folder%\%%a" "%tar_folder%\"
