# Changelog

This document provides detailed updates on the changes, improvements, and occasional removals that have been made to our tools and systems. Each entry in the changelog is meticulously documented to ensure that you can track the progression of changes, understand the evolution of our software, and access specific version information quickly and accurately.

---

## 🏷️ [extras/vbdec] 2025.6 - Jun 1, 2025

### 🆕 Added

- Add vbdec to updater and SendTo Recomposed menu


## 🏷️ 2025.6 - Jun 1, 2025

### 🔧 Changed

- Update tools (01/06/2025)
- Bump SendTo Recomposed to 1.1.1


## 🏷️ 2025.5 - May 25, 2025

### 🆕 Added

- Add Choco GUI [^1]

### 🔧 Changed

- Use [SendTo Recomposed](https://github.com/xchwarze/sendto-recomposed) in the Windows right-click menu for files. [^1]
- Update tools (20/05/2025)
- Bump Universal Updater to 2.4.0
- Fixes in tools updater regexs


## 🏷️ 2024.7 - Jul 12, 2024

### 🆕 Added

- Add All Dlls Dependencies
- Add Python Decompyle++

### 🔧 Changed

- Update tools (12/07/2024)
- Bump Universal Updater to 2.2.0
- Refactor and cleanup in all project


## 🏷️ 2023.11 - Nov 14, 2023

### 🆕 Added

- Add new Windows Terminal [^1]
- Add Visual C++ Redist 2008, 2013 and 2015-2022 [^1]

### 🔧 Changed

- Update tools (13/11/2023)
- Bump Universal Updater to 2.1.0

### ❌ Removed

- Drop GetSymbol: Malware found in 2.0.3 version https://news.ycombinator.com/item?id=37423091


## 🏷️ 2023.8 - Aug 1, 2023

### 🆕 Added

- Add ASM Calculator
- Add APK Tool GUI
- Add APK Editor Studio
- Add WinObjEx64
- Add MalUnpack

### 🔧 Changed

- Update tools (30/07/2023)
- Bump Universal Updater to 1.8.1
- Fix PE-Bear url update
- Fix IDR updater implementation

### ❌ Removed

- Drop Apk Easy Tool: Development discontinued https://xdaforums.com/t/closed-discontinued-windows-apk-easy-tool-v1-60-2022-06-23.3333960/


## 🏷️ [extras/unpacking] 2023.3 - Mar 9, 2023

### 🆕 Added

- Add Magicmida
- Add NoVmp
- Add VMUnprotect
- Add VMUnprotectDumper


## 🏷️ [extras/ghidra] 2023.3 - Mar 6, 2023

### 🔧 Changed

- Update installer code


## 🏷️ 2023.3 - Mar 3, 2023

### 🆕 Added

- Add OpenHashTab [^1]
- Add WinMerge [^1]
- Add auto-config-ini.exe (based on auto-config-tools.exe)
- Add WinAPI Search
- Add ExtremeDumper
- Add RegistryChangesView
- Add RunAsDate
- Add Keygener Assistant
- Add CryptoTester
- New Toolkit Extra: Oldies
- New Toolkit Extra: Unpacking

### 🔧 Changed

- Update tools (01/03/2023)
- Bump Universal Updater to 1.8.0
- Extract all old tools to new package
- New Reverse catalog created to improve the ordering of tools
- Improvements in the installer code
- Fix ImHex re_download regex
- Fix VirusTotalUploader re_download regex
- Update Process-Dump download server
- Improvements in self updater of tools.ini 
- Add SysAnalyzer to updater
- Add RawCap to updater

### ❌ Removed

- Drop Immunity Debugger: Has not received any updates in years.
- Drop ExeExplorer: The toolkit already has several tools with the same functionalities.


## 🏷️ 2023.1 - Jan 5, 2023

### 🔧 Changed

- Update auto-config-tools config name section


## 🏷️ 2022.12.1 - Dec 29, 2022

### 🔧 Changed

- Fix updater config


## 🏷️ 2022.12 - Dec 27, 2022

### 🆕 Added

- Add GetSymbol
- Add DLest

### 🔧 Changed

- Update tools (27/12/2022)
- Bump Universal Updater to 1.7.2
- Rename "Process Hacker" to new name "System Informer"
- Fix System Informer urls
- Fix IDR updater script
- Add IDR KB for: 6, 7, 2005, 2006 and 2007
- Add merge param to updater for: IDR, x64dbg, Cutter, Ghidra, HxD, REHex, ImHex, ApkStudio and APKEasyTool


## 🏷️ 2022.10 - Oct 8, 2022

### 🔧 Changed

- Update tools (08/10/2022)
- Bump Universal Updater to 1.7.1
- Add Universal Updater implementation to separate repo for use in updater


## 🏷️ 2022.9 - Sep 4, 2022

### 🆕 Added

- Add UnAutoIt
- Add RawCap

### 🔧 Changed

- Update tools (03/09/2022)
- Exec updater on finish install


## 🏷️ 2022.7 - Jul 15, 2022

### 🆕 Added

- Add x64dbgPluginManager

### 🔧 Changed

- Update tools (25/07/2022)
- Fix updater config for: PEStudio, Cutter and ImHex


## 🏷️ 2022.3 - May 11, 2022

### 🆕 Added

- Add 4n4lDetector
- Add EXE Explorer
- New Toolkit Extra: Ghidra

### 🔧 Changed

- Update updater script
- Update tools (11/05/2022)
- Changes in installer code
- Other minor changes


## 🏷️ 2022.3 - Mar 2, 2022

### 🆕 Added

- Add w32Dasm 8.93 HiEndsoft version
- Add HashCalc again
- Add Ascii Generator 2
- Add VB Decompiler
- Add AT4RE Patcher
- Add dUP
- Add uPPP

### 🔧 Changed

- Clean ShowString folder
- Clean RL!dePacker folder
- Update ImpREC to 1.7f
- Update tools (28/02/2022)
- Fix Sysinspector version

### ❌ Removed

- Drop WinHex: The other tools in this section can already do the same things as this one and are free of charge.
- Drop ASCII Art Generator: Replaced by Ascii Generator 2
- Drop P-Code-ExDec: Replaced by VB Decompiler


## 🏷️ 2022.2 - Feb 17, 2022

### 🆕 Added

- Add SendTo+
- Add Updater auto-config-tools exe
- Add Updater Task Schedule example
- Add Chocolatey package manager [^1]
- Add Java 8 Runtime Environment [^1]
- Add Python [^1]
- Add Installer generator code
- Add HashMyFiles
- Add Threadtear
- Add Hollows Hunter 
- Add dnSpyEx
- Add Cutter
- Add PE-sieve

### 🔧 Changed

- Fix x64dbg install
- Fix IDR install
- Fix Recaf download name
- Fix JADX download name
- Fix w32Dasm uncompress structure
- Fix update via last commit regex
- Delete NFO-Tools sub folder
- Change project structure
- Update tools (05/02/2022)
- Fix Process Hacker 3 regex
- Fix APKEasyTool updater config
- Update updater to latest version (v1.5.1)
- Add MultiMon to updater

### ❌ Removed

- Drop RDG Packer Detector: Replaced by DIE
- Drop HashCalc: Replaced by HashMyFiles
- Drop Process Hacker 2: Replaced by Process Hacker 3
- Drop dnSpy: Replaced by dnSpyEx


## 🏷️ 2021.10 - Oct 23, 2021

### 🆕 Added

- Add VirusTotalUploader

### 🔧 Changed

- Update updater to latest version from https://github.com/xchwarze/universal-tool-updater
- Add PyInstxtractor to updater
- Add IDR to updater
- Update tools (22/10/2021)
- Fix Process Hacker 3 regex
- Add HxD updater post_unpack script
- Fix GitHub regex

### ❌ Removed

- Drop JAD support: Replaced by Recaf
- Drop Stud PE support: Replaced by ExeinfoPe
- Drop Flasm: Nobody programs in SWF anymore


## 🏷️ 2021.5 - May 24, 2021

### 🆕 Added

- Add ProcDOT
- Add CAPA
- Add ApkStudio
- Add HashCalc
- Add Process Dump
- Add AstroGrep
- Add Scylla

### 🔧 Changed

- Update updater for support file password
- Add 6 tools to updater
- Fixed x64dbg updater url (use sourceforge 302 response url)
- Add command line support in updater
- Update tools (24/05/2021)


## 🏷️ 2021.3 - Mar 31, 2021

### 🆕 Added

- Add Exe2Aut
- Add MyAutToExe
- Add De4Dot
- Add Recaf
- Add PE-Bear
- Add PEStudio
- Add Resource Hacker
- Add FLOSS
- Add REHex
- Add ImHex
- Add Api Monitor
- Add PyInstxtractor
- Compile updater.py (pyinstaller --onefile updater.py)

### 🔧 Changed

- Update tools
- Add 9 tools to updater
- Fix updater FileNotFoundError
- Change QUnpack version


## 🏷️ 2021.2 - Feb 10, 2021

### 🆕 Added

- Add updater script (24/57)

### 🔧 Changed

- Migrate to 7zip


## 🏷️ 2020.10 - Oct 16, 2020

### 🆕 Added

- Add XELFViewer

### 🔧 Changed

- Update tools


## 🏷️ 2020.7 - Jul 13, 2020

### 🆕 Added

- Add 9 tools

### 🔧 Changed

- Update tools


## 🏷️ 2020.5 - May 17, 2020

### 🆕 Added

- Add x64dbg dissasembler
- Add jadx for android decompile

### 🔧 Changed

- Update tools


## 🏷️ 2020.2 - Feb 17, 2020

### 🆕 Added

- First public version
- 42 tools



## Notes:

[^1]: Only available in the installer and is an optional component.
