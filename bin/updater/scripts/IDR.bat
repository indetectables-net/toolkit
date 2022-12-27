@ECHO OFF
echo Fix IDR folder structure

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

move bin\Idr.exe Idr.exe
move bin\dis.dll dis.dll
move bin\Icons.dll Icons.dll

rmdir /s /q bin
rmdir /s /q obj
rmdir /s /q Plugins
