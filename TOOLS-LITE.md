# Tools in lite edition

1. [Analysis](#analysis)
1. [Decompilers](#decompilers)
1. [Dissasembler](#dissasembler)
1. [Hex editor](#hex-editor)
1. [Monitor](#monitor)
1. [Other](#other)
1. [Reverse](#reverse)
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

### PEiD (with plugins and databases) *Available using the extra called: Oldies*
***Web:*** https://web.archive.org/web/20110924071419/http://www.peid.info/ <br/>
***Developer:*** snaker <br/>
***Description:*** PEiD (short for PE iDentifier) is a well-known professional, extensible packer/cryptor/compiler detecting tool. It’s so powerful that it can detect the types/signatures of almost any PE file packing tools (at present, the number has been more than 600 kinds) <br/>

### PEStudio
***Web:*** https://www.winitor.com/download <br/>
***Developer:*** winitor <br/>
***Description:*** The goal of pestudio is to spot artifacts of executable files in order to ease and accelerate Malware Initial Assessment. The tool is used by Computer Emergency Response Teams (CERT), Security Operations Centers (SOC) and Digital-Forensic Labs worldwide. <br/>

### ProtectionID *Available using the extra called: Oldies*
***Web:*** https://web.archive.org/web/20210331144912/https://protectionid.net/ <br/>
***Developer:*** CDKiller & TippeX <br/>
***Description:*** PiD Team's Protection ID started as a PC game protection detector, and quickly became a swiss-army knife to detect packers & .NET protections. <br/>

### XELFViewer
***Web:*** https://github.com/horsicq/XELFViewer <br/>
***Developer:*** Hors <br/>
***Description:*** This is an ELF file viewer/editor for Windows, Linux and MacOS. <br/>


## Decompilers

### [ANDROID] JADX
***Web:*** https://github.com/skylot/jadx <br/>
***Developer:*** skylot <br/>
***Description:*** Dex to Java decompiler: command line and GUI tools for producing Java source code from Android Dex and Apk files <br/>

### [DELPHI] Dede *Available using the extra called: Oldies*
***Web:*** https://code.google.com/archive/p/dedex/ <br/>
***Developer:*** DaFixer <br/>
***Description:*** DeDe is a very fast program that can analize executables compiled with Delphi 3,4,5,6, C++Builder and Kylix and give you all dfm files on the target, every published method in well-commented Assembler, and lots of other information.- <br/>

### [DOTNET] GrayWolf *Available using the extra called: Oldies*
***Web:*** https://web.archive.org/web/20181114171712/http://www.digitalbodyguard.com/graywolf.html <br/>
***Developer:*** DigitalBodyGuard <br/>
***Description:*** GrayWolf is a reverse engineering tool focused on .NET Framework Applications. It can de-obfuscate binaries, live-edit IL, add payloads, edit attributes, and copy strong names signing on EXE/DLL. <br/>

### [DOTNET] ILSpy
***Web:*** https://github.com/icsharpcode/ILSpy <br/>
***Developer:*** ic#code <br/>
***Description:*** ILSpy is the open-source .NET assembly browser and decompiler. <br/>

### [JAVA] JD-GUI
***Web:*** https://github.com/java-decompiler/jd-gui <br/>
***Developer:*** the Java Decompiler dev team <br/>
***Description:*** This is a standalone graphical utility that displays Java sources from CLASS files. <br/>

### [JAVA] Recaf
***Web:*** https://github.com/Col-E/Recaf <br/>
***Developer:*** Matt Coley (Col-E) <br/>
***Description:*** An easy to use modern Java bytecode editor that abstracts away the complexities of Java programs. Recaf abstracts away constant pool, stack frames, wide instructions, and more. <br/>

### [PYTHON] PyInstxtractor
***Web:*** https://github.com/extremecoders-re/pyinstxtractor <br/>
***Developer:*** extremecoders-re <br/>
***Description:*** Python script to extract the contents of a PyInstaller generated Windows executable file. The contents of the pyz file (usually pyc files) present inside the executable are also extracted. The header of the pyc files are automatically fixed so that a Python bytecode decompiler will recognize it. <br/>


## Dissasembler

### BDASM *Available using the extra called: Oldies*
***Web:*** www.bsasm.com (closed) <br/>
***Developer:*** Manuel Jiménez <br/>
***Description:*** BDASM is a multi-cpu, multi format file disassembler for Windows. Currently it supports ELF, X-Box, PE and raw binary files. The CPU support includes the Intel x86 16/32bits processor family up to SSE2 instructions, and PowerPc 603,604 32bits CPUs. <br/>

### Ghidra *Available using the extra called: Ghidra*
***Web:*** https://ghidra-sre.org/ <br/>
***Developer:*** NSA <br/>
***Description:*** Ghidra is a software reverse engineering (SRE) framework created and maintained by the National Security Agency Research Directorate. This framework includes a suite of full-featured, high-end software analysis tools that enable users to analyze compiled code on a variety of platforms. <br/>

### OllyDbg 1.10 (with plugins and scripts) *Available using the extra called: Oldies*
***Web:*** https://www.ollydbg.de <br/>
***Developer:*** Oleh Yuschuk <br/>
***Description:*** OllyDbg is an x86 debugger that emphasizes binary code analysis, which is useful when source code is not available. It traces registers, recognizes procedures, API calls, switches, tables, constants and strings, as well as locates routines from object files and libraries. It has a user friendly interface, and its functionality can be extended by third-party plugins. <br/>

### w32Dasm (with all versions) *Available using the extra called: Oldies*
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
***Description:*** HxD is a carefully designed and fast hex editor which, additionally to raw disk editing and modifying of main memory (RAM), handles files of any size.
The easy to use interface offers features such as searching and replacing, exporting, checksums/digests, insertion of byte patterns, a file shredder, concatenation or splitting of files, statistics and much more. <br/>

### ImHex
***Web:*** https://github.com/WerWolv/ImHex <br/>
***Developer:*** WerWolv <br/>
***Description:*** ImHex is a Hex Editor, a tool to display, decode and analyze binary data to reverse engineer their format, extract informations or patch values in them.
What makes ImHex special is that it has many advanced features that can often only be found in paid applications. Such features are a completely custom binary template and pattern language to decode and highlight structures in the data, a graphical node-based data processor to pre-process values before they're displayed, a disassembler, diffing support, bookmarks and much much more. <br/>


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

### Procmon
***Web:*** https://docs.microsoft.com/en-us/sysinternals/downloads/procmon <br/>
***Developer:*** Sysinternals <br/>
***Description:*** Process Monitor is an advanced monitoring tool for Windows that shows real-time file system, Registry and process/thread activity. It combines the features of two legacy Sysinternals utilities, Filemon and Regmon, and adds an extensive list of enhancements. <br/>

### RegistryChangesView
***Web:*** https://www.nirsoft.net/utils/registry_changes_view.html <br/>
***Developer:*** NirSoft <br/>
***Description:***  RegistryChangesView is a tool for Windows that allows you to take a snapshot of Windows Registry and later compare it with another Registry snapshots, with the current Registry or with Registry files stored in a shadow copy created by Windows. When comparing 2 Registry snapshots, you can see the exact changes made in the Registry between the 2 snapshots, and optionally export the Registry changes into a standard .reg file of RegEdit. <br/>

### System Informer (Process Hacker 3)
***Web:*** https://systeminformer.sourceforge.io <br/>
***Developer:*** System Informer <br/>
***Description:*** A free, powerful, multi-purpose tool that helps you monitor system resources, debug software and detect malware. <br/>

### TCPView
***Web:*** https://docs.microsoft.com/en-us/sysinternals/downloads/tcpview <br/>
***Developer:*** Sysinternals <br/>
***Description:*** TCPView is a Windows program that will show you detailed listings of all TCP and UDP endpoints on your system, including the local and remote addresses and state of TCP connections. <br/>


## Other

### APK Studio
***Web:*** https://github.com/vaibhavpandeyvpz/apkstudio <br/>
***Developer:*** Vaibhav Pandey -aka- VPZ <br/>
***Description:*** Open-source, cross-platform Qt based IDE for reverse-engineering Android application packages. <br/>

### AVFucker *Available using the extra called: Oldies*
***Web:*** www.indetectables.net <br/>
***Developer:*** Sr Sombrero <br/>
***Description:*** AVFucker is a tool that helps you evade Antivirus using the “replace byte signature” technique. <br/>

### FLOSS
***Web:*** https://github.com/fireeye/flare-floss <br/>
***Developer:*** mandiant <br/>
***Description:*** The FLARE Obfuscated String Solver (FLOSS, formerly FireEye Labs Obfuscated String Solver) uses advanced static analysis techniques to automatically deobfuscate strings from malware binaries. You can use it just like strings.exe to enhance basic static analysis of unknown binaries. <br/>

### HashMyFiles
***Web:*** https://www.nirsoft.net/utils/hash_my_files.html <br/>
***Developer:*** NirSoft <br/>
***Description:*** HashMyFiles is small utility that allows you to calculate the MD5 and SHA1 hashes of one or more files in your system. You can easily copy the MD5/SHA1 hashes list into the clipboard, or save them into text/html/xml file.  <br/>

### Indetectables Offset Locator *Available using the extra called: Oldies*
***Web:*** https://www.indetectables.net/viewtopic.php?t=29725 <br/>
***Developer:*** Mingo, Yorll & Metal <br/>
***Description:*** This is a classic, great tool to clean AV signatures in executables. <br/>

### RawCap
***Web:*** https://www.netresec.com/?page=RawCap <br/>
***Developer:*** Netresec <br/>
***Description:***  RawCap is a free command line network sniffer for Windows that uses raw sockets. Can sniff most interface types, including WiFi, WWAN (Mobile Broadband) and PPP interfaces. <br/>

### Resource Hacker
***Web:*** http://www.angusj.com/resourcehacker <br/>
***Developer:*** Angus Johnson <br/>
***Description:*** Resource Hacker is a resource editor for 32bit and 64bit Windows applications. It's both a resource compiler aand a decompiler, enabling viewing and editing resources in executables. <br/>

### RunAsDate
***Web:*** https://www.nirsoft.net/utils/run_as_date.html <br/>
***Developer:*** NirSoft <br/>
***Description:*** RunAsDate is a small utility that allows you to run a program in the date and time that you specify. This utility doesn't change the current system date and time of your computer, but it only injects the date/time that you specify into the desired application. <br/>

### ShowString *Available using the extra called: Oldies*
***Web:*** Unknown <br/>
***Developer:*** figugegl <br/>
***Description:*** This little tool shows all ASCII and UNICODE strings in a file. You can edit, copy, paste, sort, search and much more. <br/>

### Strings
***Web:*** https://docs.microsoft.com/en-us/sysinternals/downloads/strings <br/>
***Developer:*** Sysinternals <br/>
***Description:*** Search for ANSI and Unicode strings in binary images. <br/>

### VirusTotal Uploader
***Web:*** https://github.com/SamuelTulach/VirusTotalUploader <br/>
***Developer:*** Samuel Tulach <br/>
***Description:*** VirusTotal file uploader <br/>


## Reverse

### CryptoTester
***Web:*** https://github.com/Demonslay335/CryptoTester <br/>
***Developer:*** Michael Gillespie <br/>
***Description:*** A utility for playing with cryptography, geared towards ransomware analysis. <br/>

### DLest
***Web:*** https://github.com/DarkCoderSc/DLest <br/>
***Developer:*** DarkCoderSc (Jean-Pierre LESUEUR) <br/>
***Description:*** This powerful Microsoft Windows application is specifically designed to assist developers and malware analysts with the analysis and manipulation of exported functions in Portable Executable (PE) files, particularly DLLs. With DLest, you can easily enumerate exported functions using a variety of methods, including drag and drop, opening a folder, or recursively scanning a folder with regular expression filtering to only include PE files with specific export function names. <br/>

### ExtremeDumper
***Web:*** https://github.com/wwh1004/ExtremeDumper <br/>
***Developer:*** wwh1004 <br/>
***Description:*** .NET Assembly Dumper <br/>

### GetSymbol
***Web:*** https://github.com/dbgsymbol/getsymbol <br/>
***Developer:*** @Paul091_ <br/>
***Description:*** Simple tool to download debugging symbols from Microsoft, Google, Mozilla and Citrix symbol servers for reverse engineers compatible with Windows 8.1, 10 and 11. <br/>

### ImpREC (with plugins) *Available using the extra called: Oldies*
***Web:*** Unknown <br/>
***Developer:*** MackT/uCF <br/>
***Description:*** ImpRec is a very handy tool that can be used to repair/reconstruct the import table for packed programs. <br/>

### Keygener Assistant
***Web:*** https://www.at4re.net/f/thread-47.html <br/>
***Developer:*** Mr Paradox & dj-siba <br/>
***Description:*** Convert, analyze, encrypt and process characters to and from an abundance of encodings and formats with this fully-featured calculator and processor. <br/>

### Process Dump
***Web:*** http://split-code.com/processdump.html <br/>
***Developer:*** Split-Code <br/>
***Description:*** Process Dump is a Windows reverse-engineering tool to dump malware memory components back to disk for analysis. It uses an aggressive import reconstruction approach to make analysis easier, and supports 32 and 64 bit modules. <br/>

### Scylla
***Web:*** https://github.com/NtQuery/Scylla <br/>
***Developer:*** The NtQuery team <br/>
***Description:*** Great tool for the purpose of rebuilding an Import Table. This is an alternative to ImpRec. <br/>

### WinAPI Search
***Web:*** https://dennisbabkin.com/winapisearch/ <br/>
***Developer:*** Dennis Babkin <br/>
***Description:*** WinAPI Search app was designed primarily for Windows developers, researchers and malware reverse engineers. Its original goal was to provide a utility to search for Win32 functions by name, but this app later grew to include additional functionality. <br/>

### x64dbg Plugin Manager
***Web:*** https://github.com/horsicq/x64dbg-Plugin-Manager <br/>
***Developer:*** Hors <br/>
***Description:*** Plugin manager for x64dbg. <br/>


## UnPacking

### De4Dot
***Web:*** https://github.com/de4dot/de4dot <br/>
***Developer:*** de4dot <br/>
***Description:*** de4dot is an open source .NET deobfuscator and unpacker written in C#. It will try its best to restore a packed and obfuscated assembly to almost the original assembly.
Most of the obfuscation can be completely restored (eg. string encryption), but symbol renaming is impossible to restore since the original names aren't (usually) part of the obfuscated assembly.<br/>

### GUnPacker *Available using the extra called: Oldies*
***Web:*** Unknown <br/>
***Developer:*** Unknown <br/>
***Description:*** This tool is a generic unpacker. It has two main functionalities: (A) OEP positioning, and (B) the dumped code and data can be used to repair the follow-up of a PE header.
From Chinese developers. Competitor of Quick Unpack. <br/>

### NETUnpack *Available using the extra called: Oldies*
***Web:*** https://ntcore.com/?page_id=353 <br/>
***Developer:*** Erik Pistelli (NTCore) <br/>
***Description:*** This is a program to dump .NET packed applications. Of course no serious .NET protection relies on packing. In fact, this software shows how easily you can unpack a protected assemly. <br/>

### QUnpack
***Web:*** http://qunpack.ahteam.org <br/>
***Developer:*** Archer & FEUERRADER <br/>
***Description:*** The program is intended for a dynamic unpacking of binders, crypters, packers and protectors.
QuickUnpack tries to bypass all possible scramblers/obfuscators and restores redirected import. From the version 1 the opportunity of unpacking dll is added. From the version 2 the attach process feature added which allows to use QuickUnpack as a dumper and import recoverer. Scripts are also supported from version 2 which allows unpacking of more complicated protections. Version 3 brought x64 support and hardware virtualization debugging engine. This makes QuickUnpack a unique software product which has no similar analogues in the world! <br/>

### RL!dePacker (with unpack SDK) *Available using the extra called: Oldies*
***Web:*** http://www.reversinglabs.com <br/>
***Developer:*** Ap0x <br/>
***Description:*** Reversing Labs RL!dePacker has a build in option to detect OEP. However this option does not work with VB (always use FindOEP! function with VB applications and Force to manual OEP?) and some packers. So if RL!dePacker can not unpack the file use FindOEP! function to detect correct OEP, but use it only as a second resort since it can be jammed! <br/>
Generic unpacker can unpack ONLY packers that do not use IAT redirection, that don’t steal APIs and which fill out IAT table in correct order. All ordinals that can be converted to API names are converted, others are inserted into IAT as ordinals! <br/>

### UniExtract 2
***Web:*** https://github.com/Bioruebe/UniExtract2 <br/>
***Developer:*** Bioruebe <br/>
***Description:*** Universal Extractor 2 is a tool designed to extract files from any type of extractable file. <br/>
Unlike most archiving programs, UniExtract is not limited to **standard archives** such as `.zip` and `.rar`. It can also deal with **application installers**, **disk images** and even **game archives** and other **multimedia files**. An overview of supported file types can be found [here](https://github.com/Bioruebe/UniExtract2/blob/master/docs/FORMATS.md)

### VMUnpacker (with all versions) *Available using the extra called: Oldies*
***Web:*** https://web.archive.org/web/20080318210939/http://dswlab.com/d3.html <br/>
***Developer:*** dswlab <br/>
***Description:*** This tool uses the technology of Virtual Machines. It can unpack various known & unknown shells. It is suitable for unpacking the shelled Trojan horse in virus analysis, and because all codes are run under the VM, they will not take any danger to your system. <br/>

### XVolkolak
***Web:*** https://horsicq.github.io/ <br/>
***Developer:*** Hors <br/>
***Description:*** XVolkolak is an unpacker emulator. Unlike programs of this type, it does not use DebugAPI and other features of the operating system. Everything is emulated. You can safely unpack malware for further investigation without the risk of damaging the system.
All machine instructions are not executed on a real processor, so unpacking occurs regardless of the processor type and the operating system. <br/>
