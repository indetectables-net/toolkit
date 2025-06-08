@ECHO OFF

echo Register VBDEC program dlls
echo ----------------------------------------
echo.

1>nul 2>nul reg query HKU\S-1-5-19 || (
	echo You must run the command prompt as administrator to install.
	ping 127.0.0.1 > NUL 2>&1
	exit /b 1
)


cd "%~dp0"

:: from {sys}
regsvr32 /s sys\richtx32.ocx
regsvr32 /s sys\MSCOMCTL.OCX
regsvr32 /s sys\msscript.ocx
regsvr32 /s sys\TLBINF32.DLL

:: from {app}
regsvr32 /s scivb2.ocx
regsvr32 /s hexed.ocx
regsvr32 /s IDAClientLib2.dll
regsvr32 /s decLib.dll
regsvr32 /s procLib2.dll
regsvr32 /s spSubclass.dll

:: {data}
tregsvr.exe -q -t data\VB6.OLB
tregsvr.exe -q -t data\VB32.OLB
