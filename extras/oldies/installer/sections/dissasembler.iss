; BDASM
[Components]
Name: "dissasembler\bdasm"; Description: "BDASM"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Dissasembler\BDASM\*"; DestDir: "{#MyAppToolsFolder}\Dissasembler\BDASM"; Components: "dissasembler\bdasm"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\BDASM"; Filename: "{#MyAppToolsFolder}\Dissasembler\BDASM\bdasm.exe"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\BDASM"; Components: "dissasembler\bdasm";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Dissasembler\BDASM"; Filename: "{#MyAppToolsFolder}\Dissasembler\BDASM\bdasm.exe"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\BDASM"; Components: "dissasembler\bdasm";    



; OllyDbg 1.10
[Components]
Name: "dissasembler\ollydbg110"; Description: "OllyDbg 1.10"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Dissasembler\OllyDbg 1.10\*"; DestDir: "{#MyAppToolsFolder}\Dissasembler\OllyDbg 1.10"; Components: "dissasembler\ollydbg110"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\OllyDbg 1.10"; Filename: "{#MyAppToolsFolder}\Dissasembler\OllyDbg 1.10\OLLYDBG.EXE"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\OllyDbg 1.10"; Components: "dissasembler\ollydbg110";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Dissasembler\OllyDbg 1.10"; Filename: "{#MyAppToolsFolder}\Dissasembler\OllyDbg 1.10\OLLYDBG.EXE"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\OllyDbg 1.10"; Components: "dissasembler\ollydbg110";    



; w32Dasm
[Components]
Name: "dissasembler\w32dasm"; Description: "w32Dasm"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Dissasembler\w32Dasm\*"; DestDir: "{#MyAppToolsFolder}\Dissasembler\w32Dasm"; Components: "dissasembler\w32dasm"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\w32Dasm"; Filename: "{#MyAppToolsFolder}\Dissasembler\w32Dasm\[HiEndsoft] w32Dasm - 8.93\W32DSM89.EXE"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\w32Dasm\[HiEndsoft] w32Dasm - 8.93"; Components: "dissasembler\w32dasm";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Dissasembler\w32Dasm"; Filename: "{#MyAppToolsFolder}\Dissasembler\w32Dasm\[HiEndsoft] w32Dasm - 8.93\W32DSM89.EXE"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\w32Dasm\[HiEndsoft] w32Dasm - 8.93"; Components: "dissasembler\w32dasm";    


