@ECHO OFF
echo Make HxD Portable
cd "updates/HxDPortableSetup"
"../../bin/innounp.exe" -e "HxDPortableSetup.exe" "*,3.exe" "license.txt" "readme.txt"
move "HxD32,3.exe" "HxD32.exe"
move "HxD64,3.exe" "HxD64.exe"
del "HxDPortableSetup.exe"
