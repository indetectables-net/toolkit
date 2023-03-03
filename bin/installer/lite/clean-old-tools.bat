@ECHO OFF

cd "..\..\..\"

:: Analysis
RMDIR "toolkit\Analysis\4n4lDetector" /S /Q
RMDIR "toolkit\Analysis\XAPKDetector" /S /Q
RMDIR "toolkit\Analysis\XPEViewer" /S /Q

:: Decompilers
RMDIR "toolkit\Decompilers\[AUTOIT] Exe2Aut" /S /Q
RMDIR "toolkit\Decompilers\[AUTOIT] MyAutToExe" /S /Q
RMDIR "toolkit\Decompilers\[AUTOIT] UnAutoIt" /S /Q
RMDIR "toolkit\Decompilers\[DELPHI] IDR" /S /Q
RMDIR "toolkit\Decompilers\[DOTNET] dnSpyEx" /S /Q
RMDIR "toolkit\Decompilers\[VB] VB Decompiler" /S /Q

:: Dissasembler
RMDIR "toolkit\Dissasembler\Cutter" /S /Q

:: HEX Editor
RMDIR "toolkit\HEX Editor\REHex" /S /Q

:: Monitor
RMDIR "toolkit\Monitor\HollowsHunter" /S /Q
RMDIR "toolkit\Monitor\MultiMon" /S /Q
RMDIR "toolkit\Monitor\RegShot" /S /Q
RMDIR "toolkit\Monitor\SysAnalyzer" /S /Q

:: NFOMaker
RMDIR "toolkit\NFOMaker" /S /Q

:: Other
RMDIR "toolkit\Other\APKEasyTool" /S /Q
RMDIR "toolkit\Other\AstroGrep" /S /Q
RMDIR "toolkit\Other\ProcDOT" /S /Q

:: Reverse
RMDIR "toolkit\Reverse\AT4RE Patcher" /S /Q
RMDIR "toolkit\Reverse\dUP" /S /Q
RMDIR "toolkit\Reverse\uPPP" /S /Q
RMDIR "toolkit\Reverse\Threadtear" /S /Q
RMDIR "toolkit\Reverse\XOpCodeCalc" /S /Q

:: Rootkits Detector
RMDIR "toolkit\Rootkits Detector" /S /Q

pause
