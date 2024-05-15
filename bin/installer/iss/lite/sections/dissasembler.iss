; x64dbg
[Components]
Name: "dissasembler\x64dbg"; Description: "x64dbg"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Dissasembler\x64dbg\*"; DestDir: "{#MyAppToolsFolder}\Dissasembler\x64dbg"; Components: "dissasembler\x64dbg"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\x64dbg"; Filename: "{#MyAppToolsFolder}\Dissasembler\x64dbg\x96dbg.exe"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\x64dbg"; Components: "dissasembler\x64dbg";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Dissasembler\x64dbg"; Filename: "{#MyAppToolsFolder}\Dissasembler\x64dbg\x96dbg.exe"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\x64dbg"; Components: "dissasembler\x64dbg";    


