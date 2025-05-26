[Files]
Source: "{#MySrcDir}\toolkit\Reverse\desktop.ini"; DestDir: "{#MyAppToolsFolder}\Reverse"; Components: "reverse"; Flags: ignoreversion; 
Source: "{#MySrcDir}\toolkit\Reverse\folder.ico"; DestDir: "{#MyAppToolsFolder}\Reverse"; Components: "reverse"; Flags: ignoreversion; 

[Run]
Filename: "attrib.exe"; Parameters: "+s +h ""{#MyAppToolsFolder}\toolkit\Reverse\desktop.ini"""; Components: "reverse"; Flags: runhidden; 



; ASM Calculator
[Components]
Name: "reverse\asmcalculator"; Description: "ASM Calculator"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\ASM Calculator\*"; DestDir: "{#MyAppToolsFolder}\Reverse\ASM Calculator"; Components: "reverse\asmcalculator"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\ASM Calculator"; Filename: "{#MyAppToolsFolder}\Reverse\ASM Calculator\calc32.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\ASM Calculator"; Components: "reverse\asmcalculator";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\ASM Calculator"; Filename: "{#MyAppToolsFolder}\Reverse\ASM Calculator\calc32.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\ASM Calculator"; Components: "reverse\asmcalculator";    



; CryptoTester
[Components]
Name: "reverse\cryptotester"; Description: "CryptoTester"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\CryptoTester\*"; DestDir: "{#MyAppToolsFolder}\Reverse\CryptoTester"; Components: "reverse\cryptotester"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\CryptoTester"; Filename: "{#MyAppToolsFolder}\Reverse\CryptoTester\CryptoTester.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\CryptoTester"; Components: "reverse\cryptotester";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\CryptoTester"; Filename: "{#MyAppToolsFolder}\Reverse\CryptoTester\CryptoTester.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\CryptoTester"; Components: "reverse\cryptotester";    



; DLest
[Components]
Name: "reverse\dlest"; Description: "DLest"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\DLest\*"; DestDir: "{#MyAppToolsFolder}\Reverse\DLest"; Components: "reverse\dlest"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\DLest"; Filename: "{#MyAppToolsFolder}\Reverse\DLest\DLest32.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\DLest"; Components: "reverse\dlest";   Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\DLest"; Filename: "{#MyAppToolsFolder}\Reverse\DLest\DLest32.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\DLest"; Components: "reverse\dlest";   Check: not Is64BitInstallMode; 

[Icons]
Name: "{group}\DLest x64"; Filename: "{#MyAppToolsFolder}\Reverse\DLest\DLest64.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\DLest"; Components: "reverse\dlest";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\DLest x64"; Filename: "{#MyAppToolsFolder}\Reverse\DLest\DLest64.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\DLest"; Components: "reverse\dlest";   Check: Is64BitInstallMode; 



; ExtremeDumper
[Components]
Name: "reverse\extremedumper"; Description: "ExtremeDumper"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\ExtremeDumper\*"; DestDir: "{#MyAppToolsFolder}\Reverse\ExtremeDumper"; Components: "reverse\extremedumper"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\ExtremeDumper"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\ExtremeDumper"; Components: "reverse\extremedumper"; Parameters: "/K ""{#MyAppToolsFolder}\Reverse\ExtremeDumper\ExtremeDumper-x86.exe"""; IconFilename: "{#MyAppToolsFolder}\Reverse\ExtremeDumper\ExtremeDumper-x86.exe"; Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\ExtremeDumper"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\ExtremeDumper"; Components: "reverse\extremedumper"; Parameters: "/K ""{#MyAppToolsFolder}\Reverse\ExtremeDumper\ExtremeDumper-x86.exe"""; IconFilename: "{#MyAppToolsFolder}\Reverse\ExtremeDumper\ExtremeDumper-x86.exe"; Check: not Is64BitInstallMode; 

[Icons]
Name: "{group}\ExtremeDumper"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\ExtremeDumper"; Components: "reverse\extremedumper"; Parameters: "/K ""{#MyAppToolsFolder}\Reverse\ExtremeDumper\ExtremeDumper.exe"""; IconFilename: "{#MyAppToolsFolder}\Reverse\ExtremeDumper\ExtremeDumper.exe"; Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\ExtremeDumper"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\ExtremeDumper"; Components: "reverse\extremedumper"; Parameters: "/K ""{#MyAppToolsFolder}\Reverse\ExtremeDumper\ExtremeDumper.exe"""; IconFilename: "{#MyAppToolsFolder}\Reverse\ExtremeDumper\ExtremeDumper.exe"; Check: not Is64BitInstallMode; 



; Keygener Assistant
[Components]
Name: "reverse\keygenerassistant"; Description: "Keygener Assistant"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\Keygener Assistant\*"; DestDir: "{#MyAppToolsFolder}\Reverse\Keygener Assistant"; Components: "reverse\keygenerassistant"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\Keygener Assistant"; Filename: "{#MyAppToolsFolder}\Reverse\Keygener Assistant\keyAssistant.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\Keygener Assistant"; Components: "reverse\keygenerassistant";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\Keygener Assistant"; Filename: "{#MyAppToolsFolder}\Reverse\Keygener Assistant\keyAssistant.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\Keygener Assistant"; Components: "reverse\keygenerassistant";    



; Process-Dump
[Components]
Name: "reverse\processdump"; Description: "Process-Dump"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\Process-Dump\*"; DestDir: "{#MyAppToolsFolder}\Reverse\Process-Dump"; Components: "reverse\processdump"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\Process-Dump"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\Process-Dump"; Components: "reverse\processdump"; Parameters: "/K ""{#MyAppToolsFolder}\Reverse\Process-Dump\pd32.exe"""; IconFilename: "{#MyAppToolsFolder}\Reverse\Process-Dump\pd32.exe"; Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\Process-Dump"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\Process-Dump"; Components: "reverse\processdump"; Parameters: "/K ""{#MyAppToolsFolder}\Reverse\Process-Dump\pd32.exe"""; IconFilename: "{#MyAppToolsFolder}\Reverse\Process-Dump\pd32.exe"; Check: not Is64BitInstallMode; 



; Scylla
[Components]
Name: "reverse\scylla"; Description: "Scylla"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\Scylla\*"; DestDir: "{#MyAppToolsFolder}\Reverse\Scylla"; Components: "reverse\scylla"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\Scylla x64"; Filename: "{#MyAppToolsFolder}\Reverse\Scylla\Scylla_x64.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\Scylla"; Components: "reverse\scylla";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\Scylla x64"; Filename: "{#MyAppToolsFolder}\Reverse\Scylla\Scylla_x64.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\Scylla"; Components: "reverse\scylla";   Check: Is64BitInstallMode; 

[Icons]
Name: "{group}\Scylla"; Filename: "{#MyAppToolsFolder}\Reverse\Scylla\Scylla_x86.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\Scylla"; Components: "reverse\scylla";   Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\Scylla"; Filename: "{#MyAppToolsFolder}\Reverse\Scylla\Scylla_x86.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\Scylla"; Components: "reverse\scylla";   Check: not Is64BitInstallMode; 



; WinAPI Search
[Components]
Name: "reverse\winapisearch"; Description: "WinAPI Search"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\WinAPI Search\*"; DestDir: "{#MyAppToolsFolder}\Reverse\WinAPI Search"; Components: "reverse\winapisearch"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\WinAPI Search"; Filename: "{#MyAppToolsFolder}\Reverse\WinAPI Search\WinApiSearch32.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\WinAPI Search"; Components: "reverse\winapisearch";   Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\WinAPI Search"; Filename: "{#MyAppToolsFolder}\Reverse\WinAPI Search\WinApiSearch32.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\WinAPI Search"; Components: "reverse\winapisearch";   Check: not Is64BitInstallMode; 

[Icons]
Name: "{group}\WinAPI Search x64"; Filename: "{#MyAppToolsFolder}\Reverse\WinAPI Search\WinApiSearch64.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\WinAPI Search"; Components: "reverse\winapisearch";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\WinAPI Search x64"; Filename: "{#MyAppToolsFolder}\Reverse\WinAPI Search\WinApiSearch64.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\WinAPI Search"; Components: "reverse\winapisearch";   Check: Is64BitInstallMode; 



; x64dbgPluginManager
[Components]
Name: "reverse\x64dbgpluginmanager"; Description: "x64dbgPluginManager"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\x64dbgPluginManager\*"; DestDir: "{#MyAppToolsFolder}\Reverse\x64dbgPluginManager"; Components: "reverse\x64dbgpluginmanager"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\x64dbgPluginManager"; Filename: "{#MyAppToolsFolder}\Reverse\x64dbgPluginManager\x64plgmnr.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\x64dbgPluginManager"; Components: "reverse\x64dbgpluginmanager";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\x64dbgPluginManager"; Filename: "{#MyAppToolsFolder}\Reverse\x64dbgPluginManager\x64plgmnr.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\x64dbgPluginManager"; Components: "reverse\x64dbgpluginmanager";    


