@ECHO OFF

cd "..\..\"
del *.html

:: i know this sucks but it works 
cmd /c npx marked --gfm -i CHANGELOG.md -o CHANGELOG.html
cmd /c npx marked --gfm -i README.ES.md -o README.ES.html
cmd /c npx marked --gfm -i README.md -o README.html
cmd /c npx marked --gfm -i TOOLS.md -o TOOLS.html

pause
