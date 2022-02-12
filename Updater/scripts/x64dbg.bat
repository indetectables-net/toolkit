@ECHO OFF
echo Fix x64dbg folder structure
cd "updates\download"

SET src_folder=release
SET tar_folder=.

for /f %%a IN ('dir "%src_folder%" /b') do move "%src_folder%\%%a" "%tar_folder%\"
