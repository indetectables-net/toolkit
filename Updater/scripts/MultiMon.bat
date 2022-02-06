@ECHO OFF
cd "updates/MultiMonHome"
"../../bin/innounp.exe" -e "MultiMonHome.exe"
del "install_script.iss"
del "MultiMonHome.exe"
