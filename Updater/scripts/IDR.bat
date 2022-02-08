@ECHO OFF
cd "updates\master\IDR-master"
del *.cpp
del *.dfm
del *.h
del *.rc
del *.res
del *.manifest
move bin\Idr.exe Idr.exe
