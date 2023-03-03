@ECHO OFF

cd "..\..\"
del *.html

:: i know this sucks but it works 
cmd /c npx marked --gfm -i CHANGELOG.md -o CHANGELOG.html
cmd /c npx marked --gfm -i README.zh_CN.md -o README.zh_CN.html
cmd /c npx marked --gfm -i README.ES.md -o README.ES.html
cmd /c npx marked --gfm -i README.md -o README.html
cmd /c npx marked --gfm -i TOOLS.md -o TOOLS.html
cmd /c npx marked --gfm -i TOOLS-LITE.md -o TOOLS.html

pause
