# Tools

1. [Analysis](#analysis)
1. [Decompilers](#decompilers)
1. [Dissasembler](#dissasembler)
1. [Hex editor](#hex-editor)
1. [Monitor](#monitor)
1. [Other](#other)
1. [Rootkits detector](#rootkits-detector)
1. [Unpacking](#unpacking)


## Analysis

### CAPA
***Web:*** https://github.com/fireeye/capa <br/>
***Developer:*** mandiant - www.mandiant.com <br/>
***Description:*** Capa detects capabilities in executable files. Run this tool against a PE, ELF, or shellcode file and it tells you what it thinks the program can do. For example, it might suggest that the file is a backdoor, is capable of installing services, or relies on HTTP to communicate. <br/>

### DIE
***Web:*** https://github.com/horsicq/DIE-engine <br/>
***Developer:*** Hors <br/>
***Description:*** Detect It Easy, or abbreviated "DIE" is a program for determining types of files. DIE-Engine is a Graphical User Interface for DIE.  <br/>

### ExeinfoPe
***Web:*** https://github.com/ExeinfoASL/ASL <br/>
***Developer:*** ASL - http://www.exeinfo.byethost18.com <br/>
***Description:*** ExEinfo PE detects packers, obfuscators, compilers & protectors in binary files. <br/>

### PE-Bear
***Web:*** https://github.com/hasherezade/pe-bear-releases <br/>
***Developer:*** hasherezade <br/>
***Description:*** PE-bear is a freeware reversing tool for PE files. Its objective is to deliver fast and flexible “first view” for malware analysts, stable and capable to handle malformed PE files. <br/>

### PEiD
***Web:*** https://appnee.com/peid/ (closed) <br/>
***Developer:*** snaker <br/>
***Description:*** PEiD (short for PE iDentifier) is a well-known professional, extensible packer/cryptor/compiler detecting tool. It’s so powerful that it can detect the types/signatures of almost any PE file packing tools (at present, the number has been more than 600 kinds) <br/>

### PEStudio
***Web:*** https://www.winitor.com/download <br/>
***Developer:*** winitor <br/>
***Description:*** The goal of pestudio is to spot artifacts of executable files in order to ease and accelerate Malware Initial Assessment. The tool is used by Computer Emergency Response Teams (CERT), Security Operations Centers (SOC) and Digital-Forensic Labs worldwide. <br/>

### ProtectionID
***Web:*** The official site is down forever. You can check the Wayback Machine here: https://web.archive.org/web/20210331144912/https://protectionid.net/ <br/>
***Developer:*** CDKiller & TippeX <br/>
***Description:*** PiD Team's Protection ID started as a PC game protection detector, and quickly became a swiss-army knife to detect packers & .NET protections.<br/>

### XAPKDetector
***Web:*** https://github.com/horsicq/XAPKDetector <br/>
***Developer:*** Hors <br/>
***Description:*** This tool shows information about build tools, libraries and protection of APK/DEX files. Has heuristic capabilities, and runs in Win/MacOS/Linux. <br/>

### XELFViewer
***Web:*** https://github.com/horsicq/XELFViewer <br/>
***Developer:*** Hors <br/>
***Description:*** This is an ELF file viewer/editor for Windows, Linux and MacOS. <br/>

### XPEViewer
***Web:*** https://github.com/horsicq/XPEViewer <br/>
***Developer:*** Hors <br/>
***Description:*** This tool is a PE file viewer/editor for Windows, Linux and MacOS. <br/>


## Decompilers

### [ANDROID] JADX
***Web:*** https://github.com/skylot/jadx <br/>
***Developer:*** skylot <br/>
***Description:*** Dex to Java decompiler: command line and GUI tools for producing Java source code from Android Dex and Apk files <br/>

### [AUTOIT] Exe2Aut
***Web:*** www.exe2aut.com <br/>
***Developer:*** ??? <br/>
***Description:*** Exe2Aut is designed to be the easiest to use and most versatile
decompiler for compiled AutoIt3 scripts one could think of. Exe2Aut is even capable of decompiling
executables that have been packed and protected using AutoIt3Camo, Themida, Armadillo, Safengine and so forth due to its low level nature. <br/>

### [AUTOIT] MyAutToExe
***Web:*** https://files.planet-dl.org/Cw2k/MyAutToExe/index.html <br/>
***Developer:*** CW2K@gmx.de <br/>
***Description:*** Decompiles 'compiled' AutoIT Exe files. <br/>

### [DELPHI] Dede - Delphi Decompiler
***Web:*** https://github.com/Hanvdm/dedex <br/>
***Developer:*** DaFixer (https://github.com/Hanvdm)<br/>
***Description:*** DeDe is a very fast program that can analize executables compiled with Delphi 3,4,5,6, C++Builder and Kylix and give you all dfm files on the target, every published method in well-commented Assembler, and lots of other information.- <br/>

### [DELPHI] IDR - Interactive Delphi Reconstructor
***Web:*** https://github.com/crypto2011/IDR <br/>
***Developer:*** crypto2011 <br/>
***Description:*** IDR is a decompiler of executable files (EXE) and dynamic libraries (DLL), written in Delphi and executed in Windows32 environment, with the final aim of being capable to restore the most part of initial Delphi source codes from the compiled file. <br/>

### [DOTNET] dnSpyEx
***Web:*** https://github.com/dnSpyEx/dnSpy <br/>
***Developer:*** dnSpy team <br/>
***Description:*** dnSpy is a debugger and .NET assembly editor. You can use it to edit and debug assemblies even if you don't have any source code available. <br/>

### [DOTNET] GrayWolf
***Web:*** Currently offline <br/>
***Developer:*** DigitalBodyGuard <br/>
***Description:*** GrayWolf is a reverse engineering tool focused on .NET Framework Applications. It can de-obfuscate binaries, live-edit IL, add payloads, edit attributes, and copy strong names signing on EXE/DLL. <br/>

### [DOTNET] ILSpy
***Web:*** https://github.com/icsharpcode/ILSpy <br/>
***Developer:*** ic#code (https://github.com/icsharpcode) <br/>
***Description:*** ILSpy is the open-source .NET assembly browser and decompiler. <br/>

### [JAVA] JD-GUI
***Web:*** https://github.com/java-decompiler/jd-gui <br/>
***Developer:*** the Java Decompiler dev team (https://github.com/java-decompiler) <br/>
***Description:*** This is a standalone graphical utility that displays Java sources from CLASS files. <br/>

### [JAVA] Recaf
***Web:*** https://github.com/Col-E/Recaf <br/>
***Developer:*** Matt Coley "Col-E" (https://github.com/Col-E) <br/>
***Description:*** An easy to use modern Java bytecode editor that abstracts away the complexities of Java programs. Recaf abstracts away constant pool, stack frames, wide instructions, and more. <br/>

### [PYTHON] PyInstxtractor
***Web:*** https://github.com/extremecoders-re/pyinstxtractor <br/>
***Developer:*** https://github.com/extremecoders-re <br/>
***Description:*** is a Python script to extract the contents of a PyInstaller generated Windows executable file. The contents of the pyz file (usually pyc files) present inside the executable are also extracted. The header of the pyc files are automatically fixed so that a Python bytecode decompiler will recognize it. <br/>

[//]: # (TODO)
### [VB] P-Code-ExDec
***Web:*** ??? <br/>
***Developer:*** ??? <br/>
***Description:*** ??? <br/>

## Dissasembler

### BDASM
***Web:*** www.bsasm.com (closed) <br/>
***Developer:*** Manuel Jiménez <br/>
***Description:*** BDASM is a multi-cpu, multi format file disassembler for Windows. Currently it supports ELF, X-Box, PE and raw binary files. The CPU support includes the Intel x86 16/32bits processor family up to SSE2 instructions, and PowerPc 603,604 32bits CPUs. <br/>

### Cutter
***Web:*** https://github.com/rizinorg/cutter <br/>
***Developer:*** https://rizin.re <br/>
***Description:*** Cutter is a free and open-source reverse engineering platform powered by Rizin (fork of the radare2 reverse engineering framework). It aims at being an advanced and customizable reverse engineering platform while keeping the user experience in mind. Cutter is created by reverse engineers for reverse engineers. <br/>

### Immunity Debugger
***Web:*** https://www.immunityinc.com/products/debugger/ <br/>
***Developer:*** Immunity <br/>
***Description:*** Immunity Debugger is a powerful new way to write exploits, analyze malware, and reverse engineer binary files. It builds on a solid user interface with function graphing, the industry's first heap analysis tool built specifically for heap creation, and a large and well supported Python API for easy extensibility. <br/>

### OllyDbg 1.10
***Web:*** https://www.ollydbg.de <br/>
***Developer:*** Oleh Yuschuk <br/>
***Description:*** OllyDbg is an x86 debugger that emphasizes binary code analysis, which is useful when source code is not available. It traces registers, recognizes procedures, API calls, switches, tables, constants and strings, as well as locates routines from object files and libraries. It has a user friendly interface, and its functionality can be extended by third-party plugins. <br/>

### w32Dasm
***Web:*** http://members.home.net/w32dasm/ (closed) <br/>
***Developer:*** URSoftware <br/>
***Description:*** W32DASM is a disassembler: a tool made to translate machine language back into assembly language. It's ideal for those interested in reverse engineering, who want to take code apart and find out how it works. 
Although W32DASM is ancient since hasn't received updates for a very long time (it's officially discontinued), it works without any trouble on Windows 10. <br/>

### x64dbg
***Web:*** www.x64dbg.com <br/>
***Developer:*** Duncan Ogilvie (mrexodia) <br/>
***Description:*** An open-source binary debugger for Windows, aimed at malware analysis and reverse engineering of executables you do not have the source code for. There are many features available and a comprehensive plugin system to add your own. <br/>


## HEX Editor

### HxD
***Web:*** https://mh-nexus.de/en/hxd <br/>
***Developer:*** Maël Hörz <br/>
***Description:*** HxD is a carefully designed and fast hex editor which, additionally to raw disk editing and modifying of main memory (RAM), handles files of any size. <br/>

### ImHex
***Web:*** https://github.com/WerWolv/ImHex <br/>
***Developer:*** WerWolv <br/>
***Description:*** A Hex Editor for Reverse Engineers, Programmers and people who value their retinas when working at 3 AM. <br/>

### REHex
***Web:*** https://github.com/solemnwarning/rehex <br/>
***Developer:*** solemnwarning <br/>
***Description:*** A cross-platform (Windows, Linux, Mac) hex editor for reverse engineering, and everything else. <br/>

### WinHex
***Web:*** https://x-ways.net/winhex <br/>
***Developer:*** X-Ways Software Technology AG <br/>
***Description:*** WinHex is in its core a universal hexadecimal editor, particularly helpful in the realm of computer forensics, data recovery, low-level data processing, and IT security. An advanced tool for everyday and emergency use: inspect and edit all kinds of files, recover deleted files or lost data. <br/>


## Monitor

### Api Monitor
***Web:*** http://www.rohitab.com/apimonitor <br/>
***Developer:*** Rohitab <br/>
***Description:*** This fine tool lets you monitor and control API calls made by applications and services. Its a powerful tool for seeing how applications and services work or for tracking down problems that you have in your own applications. <br/>

### Autoruns
***Web:*** https://docs.microsoft.com/en-us/sysinternals/downloads/autoruns <br/>
***Developer:*** Sysinternals <br/>
***Description:*** This utility, which has the most comprehensive knowledge of auto-starting locations of any startup monitor, shows you what programs are configured to run during system bootup or login, and when you start various built-in Windows applications like Internet Explorer, Explorer and media players. <br/>

### CurrPorts
***Web:*** https://www.nirsoft.net/utils/cports.html <br/>
***Developer:*** NirSoft <br/>
***Description:*** CurrPorts is network monitoring software that displays the list of all currently opened TCP/IP and UDP ports on your local computer. For each port in the list, information about the process that opened the port is also displayed, including the process name, full path of the process, version information of the process (product name, file description, and so on), the time that the process was created, and the user that created it. <br/>

### HollowsHunter
***Web:*** https://github.com/hasherezade/hollows_hunter <br/>
***Developer:*** hasherezade <br/>
***Description:*** Scans all running processes. Recognizes and dumps a variety of potentially malicious implants (replaced/implanted PEs, shellcodes, hooks, in-memory patches). <br/>

### MultiMon
***Web:*** https://www.resplendence.com/multimon_whatsnew <br/>
***Developer:*** Resplendence Software Projects Sp. <br/>
***Description:*** MultiMon is an advanced multifunctional system monitoring tool for Windows which displays detailed output of a wide range of activities in real-time. The system monitor displays process and thread creation as well as binary image loading. The file system monitor displays activity from the perspective of the file system. The registry monitor shows registry activity in real time. <br/>

### PE-sieve
***Web:*** https://github.com/hasherezade/pe-sieve <br/>
***Developer:*** hasherezade <br/>
***Description:*** PE-sieve is a tool that helps to detect malware running on the system, as well as to collect the potentially malicious material for further analysis. Recognizes and dumps variety of implants within the scanned process: replaced/injected PEs, shellcodes, hooks, and other in-memory patches. Detects inline hooks, Process Hollowing, Process Doppelgänging, Reflective DLL Injection, etc. <br/>

### Portmon
***Web:*** https://docs.microsoft.com/en-us/sysinternals/downloads/portmon <br/>
***Developer:*** SysInternals <br/>
***Description:*** Portmon is a utility that monitors and displays all serial and parallel port activity on a system. It has advanced filtering and search capabilities that make it a powerful tool for exploring the way Windows works, seeing how applications use ports, or tracking down problems in system or application configurations. <br/>

### Process Explorer
***Web:*** https://docs.microsoft.com/en-us/sysinternals/downloads/process-explorer <br/>
***Developer:*** Sysinternals <br/>
***Description:*** Ever wondered which program has a particular file or directory open? Now you can find out. Process Explorer shows you information about which handles and DLLs processes have opened or loaded. <br/>

### Process Hacker 3
***Web:*** https://processhacker.sourceforge.io <br/>
***Developer:*** Process Hacker <br/>
***Description:*** A free, powerful, multi-purpose tool that helps you monitor system resources, debug software and detect malware. <br/>

### Procmon
***Web:*** https://docs.microsoft.com/en-us/sysinternals/downloads/procmon <br/>
***Developer:*** Sysinternals <br/>
***Description:*** Process Monitor is an advanced monitoring tool for Windows that shows real-time file system, Registry and process/thread activity. It combines the features of two legacy Sysinternals utilities, Filemon and Regmon, and adds an extensive list of enhancements. <br/>

### RegShot
***Web:*** https://github.com/Seabreg/Regshot <br/>
***Developer:*** Seabreg <br/>
***Description:*** Regshot is a small, free and open-source registry compare utility that allows you to quickly
take a snapshot of your registry and then compare it with a second one - done after doing
system changes or installing a new software product. <br/>

### SysAnalyzer
***Web:*** https://github.com/dzzie/SysAnalyzer <br/>
***Developer:*** dzzie <br/>
***Description:*** SysAnalyzer is an application that was designed to give malcode analysts an 
automated tool to quickly collect, compare, and report on the actions a 
binary took while running on the system. <br/>

### TCPView
***Web:*** https://docs.microsoft.com/en-us/sysinternals/downloads/tcpview <br/>
***Developer:*** Sysinternals <br/>
***Description:*** TCPView is a Windows program that will show you detailed listings of all TCP and UDP endpoints on your system, including the local and remote addresses and state of TCP connections. <br/>


## Other

### APKEasyTool
***Web:*** https://forum.xda-developers.com/t/tool-windows-apk-easy-tool-v1-59-2-2021-04-03.3333960/ <br/>
***Developer:*** Evildog1 <br/>
***Description:*** Apk Easy Tool is a lightweight GUI application that enables you to manage, sign, compile and decompile the APK files for the apps you are working on. <br/>

### ApkStudio
***Web:*** https://github.com/vaibhavpandeyvpz/apkstudio <br/>
***Developer:*** Vaibhav Pandey -aka- VPZ <br/>
***Description:*** Open-source, cross-platform Qt based IDE for reverse-engineering Android application packages. <br/>

[//]: # (TODO)
### ASCII Art Generator
***Web:*** ??? <br/>
***Developer:*** ASCII Art Generator <br/>
***Description:*** ASCII Art Generator <br/>

### AstroGrep
***Web:*** https://sourceforge.net/projects/astrogrep <br/>
***Developer:*** AstroComma Inc. <br/>
***Description:*** AstroGrep is a Microsoft Windows GUI File Searching (grep) utility. Its features include regular expressions, versatile printing options, stores most recent used paths and has a "context" feature which is very nice for looking at source code. <br/>

### AVFucker
***Web:*** https://marcoramilli.com/2010/01/02/avfucker-new-version/ <br/>
***Developer:*** Marco Ramilli <br/>
***Description:*** AVFucker is a tool that helps you evade Antivirus using the “replace byte signature” techniques. <br/>

### Cool Beans NFO Creator
***Web:*** https://www.coolbeans.ws/nfocreator.shtml <br/>
***Developer:*** Cool Beans Software <br/>
***Description:*** Cool Beans NFO Creator is a small program that generates detailed .nfo text files based on nearly fifty user-input fields. <br/>

### FLOSS
***Web:*** https://github.com/fireeye/flare-floss <br/>
***Developer:*** mandiant <br/>
***Description:*** The FLARE Obfuscated String Solver (FLOSS, formerly FireEye Labs Obfuscated String Solver) uses advanced static analysis techniques to automatically deobfuscate strings from malware binaries. You can use it just like strings.exe to enhance basic static analysis of unknown binaries. <br/>

### HashMyFiles
***Web:*** https://www.nirsoft.net/utils/hash_my_files.html <br/>
***Developer:*** NirSoft <br/>
***Description:*** HashMyFiles is small utility that allows you to calculate the MD5 and SHA1 hashes of one or more files in your system. You can easily copy the MD5/SHA1 hashes list into the clipboard, or save them into text/html/xml file.  <br/>

### ImpREC
***Web:*** Offline since forever - use https://www.aldeid.com/wiki/ImpREC <br/>
***Developer:*** MackT/uCF <br/>
***Description:*** ImpRec is a very handy tool that can be used to repair/reconstruct the import table for packed programs.  <br/>

### Indetectables Offset Locator
***Web:*** https://www.indetectables.net/viewtopic.php?t=29725&sid=d42f7cab211096f4f52fef67efc9b538 <br/>
***Developer:*** Mingo, yorll, metal <br/>
***Description:*** This is a classic, great tool to clean AV signatures in executables. <br/>

[//]: # (This is a comment.)
### NFO Maker
***Web:*** ??? <br/>
***Developer:*** The Millenium Group <br/>
***Description:*** ??? <br/>

### ProcDOT
***Web:*** https://www.procdot.com/downloadprocdotbinaries.htm <br/>
***Developer:*** CERT.at <br/>
***Description:*** ProcDOT aids malware analysis via visual means, by correlating ProcMon and PCAP data and showing it as an interactive, animated graph. It also detects and shows Thread Injection, smartly follows algorithms, filters out noise, and correlates network events with the involved processes. <br/>

### Process-Dump
***Web:*** http://split-code.com/processdump.html <br/>
***Developer:*** Split-Code <br/>
***Description:*** Process Dump is a Windows reverse-engineering tool to dump malware memory components back to disk for analysis. It uses an aggressive import reconstruction approach to make analysis easier, and supports 32 and 64 bit modules. <br/>

### Resource Hacker
***Web:*** http://www.angusj.com/resourcehacker <br/>
***Developer:*** Angus Johnson <br/>
***Description:*** Resource Hacker is a resource editor for 32bit and 64bit Windows applications. It's both a resource compiler aand a decompiler, enabling viewing and editing resources in executables. <br/>

### Scylla
***Web:*** https://github.com/NtQuery/Scylla <br/>
***Developer:*** The NtQuery team <br/>
***Description:*** Great tool for the purpose of rebuilding an Import Table. This is an alternative to ImpRec. <br/>

[//]: # (TODO)
### ShowString
***Web:*** ??? <br/>
***Developer:*** ??? <br/>
***Description:*** ??? <br/>

### Strings
***Web:*** https://docs.microsoft.com/en-us/sysinternals/downloads/strings <br/>
***Developer:*** Sysinternals <br/>
***Description:*** Search for ANSI and Unicode strings in binary images. <br/>

### Threadtear
***Web:*** https://github.com/GraxCode/threadtear <br/>
***Developer:*** GraxCode <br/>
***Description:*** Threadtear is a multifunctional deobfuscation tool for java. Android application support is coming soon (Currently working on a dalvik to java converter). Suitable for easier code analysis without worrying too much about obfuscation. <br/>

### VirusTotalUploader
***Web:*** https://github.com/SamuelTulach/VirusTotalUploader <br/>
***Developer:*** Samuel Tulach <br/>
***Description:*** VirusTotal file uploader <br/>

### XOpCodeCalc
***Web:*** https://github.com/horsicq/XOpcodeCalc <br/>
***Developer:*** Hors <br/>
***Description:*** This tool is an x86/64 Opcode calculator. The program works on macOS, Linux and Windows. <br/>


## Rootkits Detector

### GMER
***Web:*** http://www.gmer.net <br/>
***Developer:*** The GMER dev team. <br/>
***Description:*** GMER is an application that detects and removes rootkits. <br/>

### Sysinspector
***Web:*** https://www.eset.com/int/support/sysinspector/ <br/>
***Developer:*** ESET <br/>
***Description:*** SET SysInspector scans your operating system and captures details such as running processes, registry content, startup items and network connections. ESET SysInspector is a convenient utility for the toolbox of every IT expert and first responder. <br/>

### Windows Kernel Explorer
***Web:*** https://github.com/AxtMueller/Windows-Kernel-Explorer <br/>
***Developer:*** AxtMueller <br/>
***Description:*** Windows Kernel Explorer (you can simply call it as "WKE") is a free but powerful kernel research tool. It supports from Windows XP to Windows 11. Compared with WIN64AST and PCHunter, WKE can run on the latest Windows 11 without updating binary files. <br/>


## UnPacking

### De4Dot
***Web:*** https://github.com/de4dot/de4dot <br/>
***Developer:*** de4dot <br/>
***Description:*** de4dot is an open source .NET deobfuscator and unpacker written in C#. It will try its best to restore a packed and obfuscated assembly to almost the original assembly. <br/>

### GUnPacker
***Web:*** http://qunpack.ahteam.org/?p=327 (russian) <br/>
***Developer:*** AHTeam <br/>
***Description:*** This tool is a generic unpacker. It has two main functionalities: (A) OEP positioning, and (B) the dumped code and data can be used to repair the follow-up of a PE header. <br/>

### NETUnpack
***Web:*** https://ntcore.com <br/>
***Developer:*** NTCore <br/>
***Description:*** This is a program to dump .NET packed applications. Of course no serious .NET protection relies on packing. In fact, this software shows how easily you can unpack a protected assemly. <br/>

### QUnpack
***Web:*** http://qunpack.ahteam.org (russian) <br/>
***Developer:*** Archer <br/>
***Description:*** Yet another generic unpacker. This one, dated from 2010, comes with the source code.  <br/>

### RL!dePacker
***Web:*** Offline as of now - see developer website, or better yet, google a bit. <br/>
***Developer:*** Ap0x <br/>
***Description:*** RL!dePacker is a renowned, generic unpacker. <br/>

### UniExtract
***Web:*** https://github.com/Bioruebe/UniExtract2 <br/>
***Developer:*** Bioruebe <br/>
***Description:*** Universal Extractor 2 is a tool designed to extract files from any type of extractable file. <br/>

### VM Unpacker
***Web:*** http://www.leechermods.com/2010/01/vmunpacker-16-latest-version.html (unofficial) <br/>
***Developer:*** YingCracker <br/>
***Description:*** This tool uses the technology of Virtual Machines. It can unpack various known & unknown shells. It is suitable for unpacking the shelled Trojan horse in virus analysis, and because all codes are run under the VM, they will not take any danger to your system. <br/>

### XVolkolak
***Web:*** http://n10info.blogspot.com/2018/07/xvolkolak-021.html <br/>
***Developer:*** Hors (https://github.com/horsicq) <br/>
***Description:*** XVolkolak is an unpacker emulator. <br/>
