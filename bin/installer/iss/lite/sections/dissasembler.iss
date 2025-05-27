; Main section
[Files]
Source: "{#MySrcDir}\toolkit\Dissasembler\desktop.ini"; DestDir: "{#MyAppBinsFolder}\sendto\sendto\Dissasembler"; Components: "dissasembler"; Attribs: hidden system; Flags: ignoreversion; 
Source: "{#MySrcDir}\toolkit\Dissasembler\folder.ico"; DestDir: "{#MyAppBinsFolder}\sendto\sendto\Dissasembler"; Components: "dissasembler"; Attribs: hidden; Flags: ignoreversion; 

[Run]
Filename: "{sys}\attrib.exe"; Parameters: "+r ""{#MyAppBinsFolder}\sendto\sendto\Dissasembler"""; Components: "dissasembler"; Flags: runhidden; 



; x64dbg
[Components]
Name: "dissasembler\x64dbg"; Description: "x64dbg"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Dissasembler\x64dbg\*"; DestDir: "{#MyAppToolsFolder}\Dissasembler\x64dbg"; Components: "dissasembler\x64dbg"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\x64dbg"; Filename: "{#MyAppToolsFolder}\Dissasembler\x64dbg\x96dbg.exe"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\x64dbg"; Components: "dissasembler\x64dbg";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Dissasembler\x64dbg"; Filename: "{#MyAppToolsFolder}\Dissasembler\x64dbg\x96dbg.exe"; WorkingDir: "{#MyAppToolsFolder}\Dissasembler\x64dbg"; Components: "dissasembler\x64dbg";    


