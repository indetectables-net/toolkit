; De4Dot
[Components]
Name: "unpacking\de4dot"; Description: "De4Dot"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\De4Dot\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\De4Dot"; Components: "unpacking\de4dot"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\De4Dot x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\De4Dot"; Components: "unpacking\de4dot"; Parameters: "/K ""{#MyAppToolsFolder}\UnPacking\De4Dot\de4dot-x64.exe"""; IconFilename: "{#MyAppToolsFolder}\UnPacking\De4Dot\de4dot-x64.exe"; Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\De4Dot x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\De4Dot"; Components: "unpacking\de4dot"; Parameters: "/K ""{#MyAppToolsFolder}\UnPacking\De4Dot\de4dot-x64.exe"""; IconFilename: "{#MyAppToolsFolder}\UnPacking\De4Dot\de4dot-x64.exe"; Check: Is64BitInstallMode; 

[Icons]
Name: "{group}\{#MyAppName}\De4Dot"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\De4Dot"; Components: "unpacking\de4dot"; Parameters: "/K ""{#MyAppToolsFolder}\UnPacking\De4Dot\de4dot.exe"""; IconFilename: "{#MyAppToolsFolder}\UnPacking\De4Dot\de4dot.exe"; Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\De4Dot"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\De4Dot"; Components: "unpacking\de4dot"; Parameters: "/K ""{#MyAppToolsFolder}\UnPacking\De4Dot\de4dot.exe"""; IconFilename: "{#MyAppToolsFolder}\UnPacking\De4Dot\de4dot.exe"; Check: not Is64BitInstallMode; 



; QUnpack
[Components]
Name: "unpacking\qunpack"; Description: "QUnpack"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\QUnpack\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\QUnpack"; Components: "unpacking\qunpack"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\QUnpack"; Filename: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack32\Explorer.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack32"; Components: "unpacking\qunpack";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\QUnpack"; Filename: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack32\Explorer.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack32"; Components: "unpacking\qunpack";    

[Icons]
Name: "{group}\{#MyAppName}\QUnpack x64"; Filename: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack64\Explorer.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack64"; Components: "unpacking\qunpack";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\QUnpack x64"; Filename: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack64\Explorer.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack64"; Components: "unpacking\qunpack";   Check: Is64BitInstallMode; 



; UniExtract
[Components]
Name: "unpacking\uniextract"; Description: "UniExtract"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\UniExtract\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\UniExtract"; Components: "unpacking\uniextract"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\UniExtract"; Filename: "{#MyAppToolsFolder}\UnPacking\UniExtract\UniExtract.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\UniExtract"; Components: "unpacking\uniextract";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\UniExtract"; Filename: "{#MyAppToolsFolder}\UnPacking\UniExtract\UniExtract.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\UniExtract"; Components: "unpacking\uniextract";    



; XVolkolak
[Components]
Name: "unpacking\xvolkolak"; Description: "XVolkolak"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\XVolkolak\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\XVolkolak"; Components: "unpacking\xvolkolak"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\XVolkolak"; Filename: "{#MyAppToolsFolder}\UnPacking\XVolkolak\xvlk.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\XVolkolak"; Components: "unpacking\xvolkolak";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\XVolkolak"; Filename: "{#MyAppToolsFolder}\UnPacking\XVolkolak\xvlk.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\XVolkolak"; Components: "unpacking\xvolkolak";    


