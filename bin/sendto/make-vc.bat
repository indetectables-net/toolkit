@echo off
setlocal ENABLEDELAYEDEXPANSION
pushd %~dp0

set appname=sendto+
set arch=
for /f "usebackq delims=" %%i in (`"cl.exe 2>&1"`) do (
    if "!arch!"=="" (
        set arch=%%i
        set arch=!arch:~-2!
    )
)

cl.exe /MD /Os /DUNICODE /D_UNICODE /Fe%appname%_x%arch%.exe %appname%.c Ole32.lib shell32.lib user32.lib Comdlg32.lib Shlwapi.lib gdi32.lib gdiplus.lib bufferoverflowU.lib

popd
