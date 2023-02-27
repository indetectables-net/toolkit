; GUnPacker
[Components]
Name: "unpacking\gunpacker"; Description: "GUnPacker"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\GUnPacker\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\GUnPacker"; Components: "unpacking\gunpacker"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\GUnPacker"; Filename: "{#MyAppToolsFolder}\UnPacking\GUnPacker\GUnPacker v0.5.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\GUnPacker"; Components: "unpacking\gunpacker";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\GUnPacker"; Filename: "{#MyAppToolsFolder}\UnPacking\GUnPacker\GUnPacker v0.5.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\GUnPacker"; Components: "unpacking\gunpacker";    



; NETUnpack
[Components]
Name: "unpacking\netunpack"; Description: "NETUnpack"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\NETUnpack\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\NETUnpack"; Components: "unpacking\netunpack"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\NETUnpack x64"; Filename: "{#MyAppToolsFolder}\UnPacking\NETUnpack\NETUnpack-64.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\NETUnpack"; Components: "unpacking\netunpack";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\NETUnpack x64"; Filename: "{#MyAppToolsFolder}\UnPacking\NETUnpack\NETUnpack-64.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\NETUnpack"; Components: "unpacking\netunpack";   Check: Is64BitInstallMode; 

[Icons]
Name: "{group}\NETUnpack"; Filename: "{#MyAppToolsFolder}\UnPacking\NETUnpack\NETUnpack.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\NETUnpack"; Components: "unpacking\netunpack";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\NETUnpack"; Filename: "{#MyAppToolsFolder}\UnPacking\NETUnpack\NETUnpack.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\NETUnpack"; Components: "unpacking\netunpack";    



; RL!dePacker
[Components]
Name: "unpacking\rldepacker"; Description: "RL!dePacker"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\RL!dePacker\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\RL!dePacker"; Components: "unpacking\rldepacker"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\RL!dePacker"; Filename: "{#MyAppToolsFolder}\UnPacking\RL!dePacker\RL!dePacker.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\RL!dePacker"; Components: "unpacking\rldepacker";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\RL!dePacker"; Filename: "{#MyAppToolsFolder}\UnPacking\RL!dePacker\RL!dePacker.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\RL!dePacker"; Components: "unpacking\rldepacker";    



; VMUnpacker
[Components]
Name: "unpacking\vmunpacker"; Description: "VMUnpacker"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\VMUnpacker\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\VMUnpacker"; Components: "unpacking\vmunpacker"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\VMUnpacker"; Filename: "{#MyAppToolsFolder}\UnPacking\VMUnpacker\VMUnpacker - 1.6\VMUnpacker.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\VMUnpacker\VMUnpacker - 1.6"; Components: "unpacking\vmunpacker";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\VMUnpacker"; Filename: "{#MyAppToolsFolder}\UnPacking\VMUnpacker\VMUnpacker - 1.6\VMUnpacker.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\VMUnpacker\VMUnpacker - 1.6"; Components: "unpacking\vmunpacker";    


