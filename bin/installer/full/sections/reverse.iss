; ASM Calculator
[Components]
Name: "reverse\asmcalculator"; Description: "ASM Calculator"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\ASM Calculator\*"; DestDir: "{#MyAppToolsFolder}\Reverse\ASM Calculator"; Components: "reverse\asmcalculator"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\ASM Calculator"; Filename: "{#MyAppToolsFolder}\Reverse\ASM Calculator\calc32.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\ASM Calculator"; Components: "reverse\asmcalculator";   Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\ASM Calculator"; Filename: "{#MyAppToolsFolder}\Reverse\ASM Calculator\calc32.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\ASM Calculator"; Components: "reverse\asmcalculator";   Check: not Is64BitInstallMode; 

[Icons]
Name: "{group}\ASM Calculator"; Filename: "{#MyAppToolsFolder}\Reverse\ASM Calculator\conv32.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\ASM Calculator"; Components: "reverse\asmcalculator";   Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\ASM Calculator"; Filename: "{#MyAppToolsFolder}\Reverse\ASM Calculator\conv32.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\ASM Calculator"; Components: "reverse\asmcalculator";   Check: not Is64BitInstallMode; 



; AT4RE Patcher
[Components]
Name: "reverse\at4repatcher"; Description: "AT4RE Patcher"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\AT4RE Patcher\*"; DestDir: "{#MyAppToolsFolder}\Reverse\AT4RE Patcher"; Components: "reverse\at4repatcher"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\AT4RE Patcher"; Filename: "{#MyAppToolsFolder}\Reverse\AT4RE Patcher\AT4RE Patcher - 0.7.6\AT4RE Patcher.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\AT4RE Patcher\AT4RE Patcher - 0.7.6"; Components: "reverse\at4repatcher";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\AT4RE Patcher"; Filename: "{#MyAppToolsFolder}\Reverse\AT4RE Patcher\AT4RE Patcher - 0.7.6\AT4RE Patcher.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\AT4RE Patcher\AT4RE Patcher - 0.7.6"; Components: "reverse\at4repatcher";    



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
Name: "{group}\DLest"; Filename: "{#MyAppToolsFolder}\Reverse\DLest\dlest32.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\DLest"; Components: "reverse\dlest";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\DLest"; Filename: "{#MyAppToolsFolder}\Reverse\DLest\dlest32.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\DLest"; Components: "reverse\dlest";    

[Icons]
Name: "{group}\DLest x64"; Filename: "{#MyAppToolsFolder}\Reverse\DLest\dlest64.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\DLest"; Components: "reverse\dlest";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\DLest x64"; Filename: "{#MyAppToolsFolder}\Reverse\DLest\dlest64.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\DLest"; Components: "reverse\dlest";   Check: Is64BitInstallMode; 



; dUP
[Components]
Name: "reverse\dup"; Description: "dUP"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\dUP\*"; DestDir: "{#MyAppToolsFolder}\Reverse\dUP"; Components: "reverse\dup"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\dUP"; Filename: "{#MyAppToolsFolder}\Reverse\dUP\dUP - 2.26.1\dup2.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\dUP\dUP - 2.26.1"; Components: "reverse\dup";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\dUP"; Filename: "{#MyAppToolsFolder}\Reverse\dUP\dUP - 2.26.1\dup2.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\dUP\dUP - 2.26.1"; Components: "reverse\dup";    



; ExtremeDumper
[Components]
Name: "reverse\extremedumper"; Description: "ExtremeDumper"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\ExtremeDumper\*"; DestDir: "{#MyAppToolsFolder}\Reverse\ExtremeDumper"; Components: "reverse\extremedumper"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\ExtremeDumper"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\ExtremeDumper"; Components: "reverse\extremedumper"; Parameters: "/K ""{#MyAppToolsFolder}\Reverse\ExtremeDumper\ExtremeDumper-x86.exe"""; IconFilename: "{#MyAppToolsFolder}\Reverse\ExtremeDumper\ExtremeDumper-x86.exe";  
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\ExtremeDumper"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\ExtremeDumper"; Components: "reverse\extremedumper"; Parameters: "/K ""{#MyAppToolsFolder}\Reverse\ExtremeDumper\ExtremeDumper-x86.exe"""; IconFilename: "{#MyAppToolsFolder}\Reverse\ExtremeDumper\ExtremeDumper-x86.exe";  

[Icons]
Name: "{group}\ExtremeDumper"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\ExtremeDumper"; Components: "reverse\extremedumper"; Parameters: "/K ""{#MyAppToolsFolder}\Reverse\ExtremeDumper\ExtremeDumper.exe"""; IconFilename: "{#MyAppToolsFolder}\Reverse\ExtremeDumper\ExtremeDumper.exe";  
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\ExtremeDumper"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\ExtremeDumper"; Components: "reverse\extremedumper"; Parameters: "/K ""{#MyAppToolsFolder}\Reverse\ExtremeDumper\ExtremeDumper.exe"""; IconFilename: "{#MyAppToolsFolder}\Reverse\ExtremeDumper\ExtremeDumper.exe";  



; GetSymbol
[Components]
Name: "reverse\getsymbol"; Description: "GetSymbol"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\GetSymbol\*"; DestDir: "{#MyAppToolsFolder}\Reverse\GetSymbol"; Components: "reverse\getsymbol"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\GetSymbol x64"; Filename: "{#MyAppToolsFolder}\Reverse\GetSymbol\GetSymbol.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\GetSymbol"; Components: "reverse\getsymbol";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\GetSymbol x64"; Filename: "{#MyAppToolsFolder}\Reverse\GetSymbol\GetSymbol.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\GetSymbol"; Components: "reverse\getsymbol";   Check: Is64BitInstallMode; 



; Keygener Assistant
[Components]
Name: "reverse\keygenerassistant"; Description: "Keygener Assistant"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\Keygener Assistant\*"; DestDir: "{#MyAppToolsFolder}\Reverse\Keygener Assistant"; Components: "reverse\keygenerassistant"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\Keygener Assistant"; Filename: "{#MyAppToolsFolder}\Reverse\Keygener Assistant\keyAssistant.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\Keygener Assistant"; Components: "reverse\keygenerassistant";   Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\Keygener Assistant"; Filename: "{#MyAppToolsFolder}\Reverse\Keygener Assistant\keyAssistant.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\Keygener Assistant"; Components: "reverse\keygenerassistant";   Check: not Is64BitInstallMode; 



; Process-Dump
[Components]
Name: "reverse\processdump"; Description: "Process-Dump"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\Process-Dump\*"; DestDir: "{#MyAppToolsFolder}\Reverse\Process-Dump"; Components: "reverse\processdump"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\Process-Dump"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\Process-Dump"; Components: "reverse\processdump"; Parameters: "/K ""{#MyAppToolsFolder}\Reverse\Process-Dump\pd32.exe"""; IconFilename: "{#MyAppToolsFolder}\Reverse\Process-Dump\pd32.exe";  
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\Process-Dump"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\Process-Dump"; Components: "reverse\processdump"; Parameters: "/K ""{#MyAppToolsFolder}\Reverse\Process-Dump\pd32.exe"""; IconFilename: "{#MyAppToolsFolder}\Reverse\Process-Dump\pd32.exe";  



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



; Threadtear
[Components]
Name: "reverse\threadtear"; Description: "Threadtear"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\Threadtear\*"; DestDir: "{#MyAppToolsFolder}\Reverse\Threadtear"; Components: "reverse\threadtear"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\Threadtear"; Filename: "{#MyAppToolsFolder}\Reverse\Threadtear\threadtear-gui-all.jar"; WorkingDir: "{#MyAppToolsFolder}\Reverse\Threadtear"; Components: "reverse\threadtear"; IconFilename: "{#MyAppToolsIconsFolder}\threadtear.ico";
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\Threadtear"; Filename: "{#MyAppToolsFolder}\Reverse\Threadtear\threadtear-gui-all.jar"; WorkingDir: "{#MyAppToolsFolder}\Reverse\Threadtear"; Components: "reverse\threadtear"; IconFilename: "{#MyAppToolsIconsFolder}\threadtear.ico";



; uPPP
[Components]
Name: "reverse\uppp"; Description: "uPPP"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\uPPP\*"; DestDir: "{#MyAppToolsFolder}\Reverse\uPPP"; Components: "reverse\uppp"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\uPPP"; Filename: "{#MyAppToolsFolder}\Reverse\uPPP\uPPP.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\uPPP"; Components: "reverse\uppp";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\uPPP"; Filename: "{#MyAppToolsFolder}\Reverse\uPPP\uPPP.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\uPPP"; Components: "reverse\uppp";    



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



; XOpCodeCalc
[Components]
Name: "reverse\xopcodecalc"; Description: "XOpCodeCalc"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\XOpCodeCalc\*"; DestDir: "{#MyAppToolsFolder}\Reverse\XOpCodeCalc"; Components: "reverse\xopcodecalc"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\XOpCodeCalc x64"; Filename: "{#MyAppToolsFolder}\Reverse\XOpCodeCalc\xocalc.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\XOpCodeCalc"; Components: "reverse\xopcodecalc";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\XOpCodeCalc x64"; Filename: "{#MyAppToolsFolder}\Reverse\XOpCodeCalc\xocalc.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\XOpCodeCalc"; Components: "reverse\xopcodecalc";   Check: Is64BitInstallMode; 


