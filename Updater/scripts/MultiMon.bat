@ECHO OFF
echo "Make MultiMon Portable"
cd "updates/MultiMonHome"
"../../bin/innounp.exe" -e "MultiMonHome.exe"
del "install_script.iss"
del "MultiMonHome.exe"
