; Magicmida
[Components]
Name: "unpacking\magicmida"; Description: "Magicmida"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\Magicmida\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\Magicmida"; Components: "unpacking\magicmida"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\Magicmida"; Filename: "{#MyAppToolsFolder}\UnPacking\Magicmida\Magicmida.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\Magicmida"; Components: "unpacking\magicmida";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\Magicmida"; Filename: "{#MyAppToolsFolder}\UnPacking\Magicmida\Magicmida.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\Magicmida"; Components: "unpacking\magicmida";    



; NoVmp
[Components]
Name: "unpacking\novmp"; Description: "NoVmp"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\NoVmp\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\NoVmp"; Components: "unpacking\novmp"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\NoVmp x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\NoVmp"; Components: "unpacking\novmp"; Parameters: "/K ""{#MyAppToolsFolder}\UnPacking\NoVmp\NoVmp.exe"""; IconFilename: "{#MyAppToolsFolder}\UnPacking\NoVmp\NoVmp.exe"; Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\NoVmp x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\NoVmp"; Components: "unpacking\novmp"; Parameters: "/K ""{#MyAppToolsFolder}\UnPacking\NoVmp\NoVmp.exe"""; IconFilename: "{#MyAppToolsFolder}\UnPacking\NoVmp\NoVmp.exe"; Check: Is64BitInstallMode; 



; VMUnprotect
[Components]
Name: "unpacking\vmunprotect"; Description: "VMUnprotect"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\VMUnprotect\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\VMUnprotect"; Components: "unpacking\vmunprotect"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\VMUnprotect"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\VMUnprotect"; Components: "unpacking\vmunprotect"; Parameters: "/K ""{#MyAppToolsFolder}\UnPacking\VMUnprotect\VMUnprotect.exe"""; IconFilename: "{#MyAppToolsFolder}\UnPacking\VMUnprotect\VMUnprotect.exe";  
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\VMUnprotect"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\VMUnprotect"; Components: "unpacking\vmunprotect"; Parameters: "/K ""{#MyAppToolsFolder}\UnPacking\VMUnprotect\VMUnprotect.exe"""; IconFilename: "{#MyAppToolsFolder}\UnPacking\VMUnprotect\VMUnprotect.exe";  



; VMUnprotectDumper
[Components]
Name: "unpacking\vmunprotectdumper"; Description: "VMUnprotectDumper"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\VMUnprotectDumper\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\VMUnprotectDumper"; Components: "unpacking\vmunprotectdumper"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\VMUnprotectDumper"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\VMUnprotectDumper"; Components: "unpacking\vmunprotectdumper"; Parameters: "/K ""{#MyAppToolsFolder}\UnPacking\VMUnprotectDumper\VMUnprotect.Dumper.exe"""; IconFilename: "{#MyAppToolsFolder}\UnPacking\VMUnprotectDumper\VMUnprotect.Dumper.exe";  
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\VMUnprotectDumper"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\VMUnprotectDumper"; Components: "unpacking\vmunprotectdumper"; Parameters: "/K ""{#MyAppToolsFolder}\UnPacking\VMUnprotectDumper\VMUnprotect.Dumper.exe"""; IconFilename: "{#MyAppToolsFolder}\UnPacking\VMUnprotectDumper\VMUnprotect.Dumper.exe";  


