; BDASM
[Components]
Name: "dissasembler\bdasm"; Description: "BDASM"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Dissasembler\BDASM\*"; DestDir: "{#MyAppToolsFolder}\Dissasembler\BDASM"; Components: "dissasembler\bdasm"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\BDASM"; Filename: "{#MyAppToolsFolder}\Dissasembler\BDASM\bdasm.exe"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\BDASM"; Components: "dissasembler\bdasm"; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Dissasembler\BDASM"; Filename: "{#MyAppToolsFolder}\Dissasembler\BDASM\bdasm.exe"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\BDASM"; Components: "dissasembler\bdasm"; 



; Cutter
[Components]
Name: "dissasembler\cutter"; Description: "Cutter"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Dissasembler\Cutter\*"; DestDir: "{#MyAppToolsFolder}\Dissasembler\Cutter"; Components: "dissasembler\cutter"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\Cutter x64"; Filename: "{#MyAppToolsFolder}\Dissasembler\Cutter\cutter.exe"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\Cutter"; Components: "dissasembler\cutter"; Check: Is64BitInstallMode;
Name: "{#MyAppBinsFolder}\sendto\sendto\Dissasembler\Cutter x64"; Filename: "{#MyAppToolsFolder}\Dissasembler\Cutter\cutter.exe"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\Cutter"; Components: "dissasembler\cutter"; Check: Is64BitInstallMode;



; Immunity Debugger
[Components]
Name: "dissasembler\immunitydebugger"; Description: "Immunity Debugger"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Dissasembler\Immunity Debugger\*"; DestDir: "{#MyAppToolsFolder}\Dissasembler\Immunity Debugger"; Components: "dissasembler\immunitydebugger"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\Immunity Debugger"; Filename: "{#MyAppToolsFolder}\Dissasembler\Immunity Debugger\ImmunityDebugger.exe"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\Immunity Debugger"; Components: "dissasembler\immunitydebugger"; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Dissasembler\Immunity Debugger"; Filename: "{#MyAppToolsFolder}\Dissasembler\Immunity Debugger\ImmunityDebugger.exe"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\Immunity Debugger"; Components: "dissasembler\immunitydebugger"; 



; OllyDbg 1.10
[Components]
Name: "dissasembler\ollydbg110"; Description: "OllyDbg 1.10"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Dissasembler\OllyDbg 1.10\*"; DestDir: "{#MyAppToolsFolder}\Dissasembler\OllyDbg 1.10"; Components: "dissasembler\ollydbg110"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\OllyDbg 1.10"; Filename: "{#MyAppToolsFolder}\Dissasembler\OllyDbg 1.10\OLLYDBG.EXE"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\OllyDbg 1.10"; Components: "dissasembler\ollydbg110"; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Dissasembler\OllyDbg 1.10"; Filename: "{#MyAppToolsFolder}\Dissasembler\OllyDbg 1.10\OLLYDBG.EXE"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\OllyDbg 1.10"; Components: "dissasembler\ollydbg110"; 



; w32Dasm
[Components]
Name: "dissasembler\w32dasm"; Description: "w32Dasm"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Dissasembler\w32Dasm\*"; DestDir: "{#MyAppToolsFolder}\Dissasembler\w32Dasm"; Components: "dissasembler\w32dasm"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\w32Dasm"; Filename: "{#MyAppToolsFolder}\Dissasembler\w32Dasm\[bradpach] w32Dasm - 8.93\W32DSM89.EXE"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\w32Dasm\[bradpach] w32Dasm - 8.93"; Components: "dissasembler\w32dasm"; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Dissasembler\w32Dasm"; Filename: "{#MyAppToolsFolder}\Dissasembler\w32Dasm\[bradpach] w32Dasm - 8.93\W32DSM89.EXE"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\w32Dasm\[bradpach] w32Dasm - 8.93"; Components: "dissasembler\w32dasm"; 



; x64dbg
[Components]
Name: "dissasembler\x64dbg"; Description: "x64dbg"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Dissasembler\x64dbg\*"; DestDir: "{#MyAppToolsFolder}\Dissasembler\x64dbg"; Components: "dissasembler\x64dbg"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\x64dbg"; Filename: "{#MyAppToolsFolder}\Dissasembler\x64dbg\x96dbg.exe"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\x64dbg"; Components: "dissasembler\x64dbg"; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Dissasembler\x64dbg"; Filename: "{#MyAppToolsFolder}\Dissasembler\x64dbg\x96dbg.exe"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\x64dbg"; Components: "dissasembler\x64dbg"; 


