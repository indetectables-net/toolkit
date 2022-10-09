@ECHO OFF

cd "..\..\..\"

:: Analysis
RMDIR "toolkit\Analysis\4n4lDetector" /S /Q
RMDIR "toolkit\Analysis\ExeExplorer" /S /Q
RMDIR "toolkit\Analysis\PE-Bear" /S /Q
RMDIR "toolkit\Analysis\PEiD" /S /Q
RMDIR "toolkit\Analysis\ProtectionID" /S /Q
RMDIR "toolkit\Analysis\XELFViewer" /S /Q

:: Decompilers
RMDIR "toolkit\Decompilers\[AUTOIT] Exe2Aut" /S /Q
RMDIR "toolkit\Decompilers\[AUTOIT] MyAutToExe" /S /Q
RMDIR "toolkit\Decompilers\[AUTOIT] UnAutoIt" /S /Q
RMDIR "toolkit\Decompilers\[DELPHI] Dede" /S /Q
RMDIR "toolkit\Decompilers\[DOTNET] GrayWolf" /S /Q
RMDIR "toolkit\Decompilers\[DOTNET] dnSpyEx" /S /Q
RMDIR "toolkit\Decompilers\[VB] VB Decompiler" /S /Q

:: Dissasembler
RMDIR "toolkit\Dissasembler\BDASM" /S /Q
RMDIR "toolkit\Dissasembler\Immunity Debugger" /S /Q
RMDIR "toolkit\Dissasembler\OllyDbg 1.10" /S /Q
RMDIR "toolkit\Dissasembler\w32Dasm" /S /Q

:: HEX Editor
RMDIR "toolkit\HEX Editor\REHex" /S /Q

:: Monitor
RMDIR "toolkit\Monitor\HollowsHunter" /S /Q
RMDIR "toolkit\Monitor\RegShot" /S /Q
RMDIR "toolkit\Monitor\SysAnalyzer" /S /Q

:: NFOMaker
RMDIR "toolkit\NFOMaker" /S /Q

:: Other
RMDIR "toolkit\Other\APKEasyTool" /S /Q
RMDIR "toolkit\Other\AVFucker" /S /Q
RMDIR "toolkit\Other\AstroGrep" /S /Q
RMDIR "toolkit\Other\ImpREC" /S /Q
RMDIR "toolkit\Other\Indetectables Offset Locator" /S /Q
RMDIR "toolkit\Other\ProcDOT" /S /Q
RMDIR "toolkit\Other\ShowString" /S /Q

:: Rootkits Detector
RMDIR "toolkit\Rootkits Detector" /S /Q

:: UnPacking
RMDIR "toolkit\UnPacking\GUnPacker" /S /Q
RMDIR "toolkit\UnPacking\NETUnpack" /S /Q
RMDIR "toolkit\UnPacking\QUnpack" /S /Q
RMDIR "toolkit\UnPacking\RL!dePacker" /S /Q
RMDIR "toolkit\UnPacking\VMUnpacker" /S /Q

pause
