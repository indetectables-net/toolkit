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



; GUnPacker
[Components]
Name: "unpacking\gunpacker"; Description: "GUnPacker"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\GUnPacker\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\GUnPacker"; Components: "unpacking\gunpacker"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\GUnPacker"; Filename: "{#MyAppToolsFolder}\UnPacking\GUnPacker\GUnPacker v0.5.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\GUnPacker"; Components: "unpacking\gunpacker";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\GUnPacker"; Filename: "{#MyAppToolsFolder}\UnPacking\GUnPacker\GUnPacker v0.5.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\GUnPacker"; Components: "unpacking\gunpacker";    



; NETUnpack
[Components]
Name: "unpacking\netunpack"; Description: "NETUnpack"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\NETUnpack\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\NETUnpack"; Components: "unpacking\netunpack"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\NETUnpack x64"; Filename: "{#MyAppToolsFolder}\UnPacking\NETUnpack\NETUnpack-64.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\NETUnpack"; Components: "unpacking\netunpack";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\NETUnpack x64"; Filename: "{#MyAppToolsFolder}\UnPacking\NETUnpack\NETUnpack-64.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\NETUnpack"; Components: "unpacking\netunpack";   Check: Is64BitInstallMode; 

[Icons]
Name: "{group}\{#MyAppName}\NETUnpack"; Filename: "{#MyAppToolsFolder}\UnPacking\NETUnpack\NETUnpack.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\NETUnpack"; Components: "unpacking\netunpack";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\NETUnpack"; Filename: "{#MyAppToolsFolder}\UnPacking\NETUnpack\NETUnpack.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\NETUnpack"; Components: "unpacking\netunpack";    



; QUnpack
[Components]
Name: "unpacking\qunpack"; Description: "QUnpack"; Types: full compact typical; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\QUnpack\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\QUnpack"; Components: "unpacking\qunpack"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\QUnpack"; Filename: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack32\Explorer.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack32"; Components: "unpacking\qunpack";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\QUnpack"; Filename: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack32\Explorer.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack32"; Components: "unpacking\qunpack";    

[Icons]
Name: "{group}\{#MyAppName}\QUnpack x64"; Filename: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack64\Explorer.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack64"; Components: "unpacking\qunpack";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\QUnpack x64"; Filename: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack64\Explorer.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack64"; Components: "unpacking\qunpack";   Check: Is64BitInstallMode; 



; RL!dePacker
[Components]
Name: "unpacking\rldepacker"; Description: "RL!dePacker"; Types: full compact typical; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\RL!dePacker\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\RL!dePacker"; Components: "unpacking\rldepacker"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\RL!dePacker"; Filename: "{#MyAppToolsFolder}\UnPacking\RL!dePacker\RL!dePacker.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\RL!dePacker"; Components: "unpacking\rldepacker";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\RL!dePacker"; Filename: "{#MyAppToolsFolder}\UnPacking\RL!dePacker\RL!dePacker.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\RL!dePacker"; Components: "unpacking\rldepacker";    



; UniExtract
[Components]
Name: "unpacking\uniextract"; Description: "UniExtract"; Types: full compact typical; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\UniExtract\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\UniExtract"; Components: "unpacking\uniextract"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\UniExtract"; Filename: "{#MyAppToolsFolder}\UnPacking\UniExtract\UniExtract.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\UniExtract"; Components: "unpacking\uniextract";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\UniExtract"; Filename: "{#MyAppToolsFolder}\UnPacking\UniExtract\UniExtract.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\UniExtract"; Components: "unpacking\uniextract";    



; VMUnpacker
[Components]
Name: "unpacking\vmunpacker"; Description: "VMUnpacker"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\VMUnpacker\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\VMUnpacker"; Components: "unpacking\vmunpacker"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\VMUnpacker"; Filename: "{#MyAppToolsFolder}\UnPacking\VMUnpacker\VMUnpacker - 1.6\VMUnpacker.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\VMUnpacker\VMUnpacker - 1.6"; Components: "unpacking\vmunpacker";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\VMUnpacker"; Filename: "{#MyAppToolsFolder}\UnPacking\VMUnpacker\VMUnpacker - 1.6\VMUnpacker.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\VMUnpacker\VMUnpacker - 1.6"; Components: "unpacking\vmunpacker";    



; XVolkolak
[Components]
Name: "unpacking\xvolkolak"; Description: "XVolkolak"; Types: full compact typical; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\XVolkolak\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\XVolkolak"; Components: "unpacking\xvolkolak"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\XVolkolak"; Filename: "{#MyAppToolsFolder}\UnPacking\XVolkolak\xvlk.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\XVolkolak"; Components: "unpacking\xvolkolak";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\XVolkolak"; Filename: "{#MyAppToolsFolder}\UnPacking\XVolkolak\xvlk.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\XVolkolak"; Components: "unpacking\xvolkolak";    


