@ECHO OFF
echo Fix IDR folder structure and files
echo.
echo Warning: 
echo The complete list of "Knowledge bases" weighs more than one gigabyte!
echo so I decided to leave in the pack only the most common ones to use
echo if you need to use all of them install them from the repo!
echo.

cd "updates\master\IDR-master"

del *.cpp
del *.dfm
del *.h
del *.rc
del *.res
del *.manifest
del *.dll
del *.ini
del *.txt
del *.png
del *.jpg
del .gitignore
del *.7z

move bin\Idr.exe Idr.exe
move bin\dis.dll dis.dll
move bin\Icons.dll Icons.dll

rmdir /s /q bin
rmdir /s /q obj
rmdir /s /q Plugins
