; APKEasyTool
[Components]
Name: "other\apkeasytool"; Description: "APKEasyTool"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\APKEasyTool\*"; DestDir: "{#MyAppToolsFolder}\Other\APKEasyTool"; Components: "other\apkeasytool"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\APKEasyTool"; Filename: "{#MyAppToolsFolder}\Other\APKEasyTool\apkeasytool.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\APKEasyTool"; Components: "other\apkeasytool";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\APKEasyTool"; Filename: "{#MyAppToolsFolder}\Other\APKEasyTool\apkeasytool.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\APKEasyTool"; Components: "other\apkeasytool";    



; ApkStudio
[Components]
Name: "other\apkstudio"; Description: "ApkStudio"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\ApkStudio\*"; DestDir: "{#MyAppToolsFolder}\Other\ApkStudio"; Components: "other\apkstudio"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\ApkStudio x64"; Filename: "{#MyAppToolsFolder}\Other\ApkStudio\ApkStudio.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ApkStudio"; Components: "other\apkstudio";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\ApkStudio x64"; Filename: "{#MyAppToolsFolder}\Other\ApkStudio\ApkStudio.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ApkStudio"; Components: "other\apkstudio";   Check: Is64BitInstallMode; 



; ASCII Art Generator
[Components]
Name: "other\asciiartgenerator"; Description: "ASCII Art Generator"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\ASCII Art Generator\*"; DestDir: "{#MyAppToolsFolder}\Other\ASCII Art Generator"; Components: "other\asciiartgenerator"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\ASCII Art Generator"; Filename: "{#MyAppToolsFolder}\Other\ASCII Art Generator\AAG.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ASCII Art Generator"; Components: "other\asciiartgenerator";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\ASCII Art Generator"; Filename: "{#MyAppToolsFolder}\Other\ASCII Art Generator\AAG.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ASCII Art Generator"; Components: "other\asciiartgenerator";    



; AstroGrep
[Components]
Name: "other\astrogrep"; Description: "AstroGrep"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\AstroGrep\*"; DestDir: "{#MyAppToolsFolder}\Other\AstroGrep"; Components: "other\astrogrep"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\AstroGrep"; Filename: "{#MyAppToolsFolder}\Other\AstroGrep\AstroGrep.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\AstroGrep"; Components: "other\astrogrep";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\AstroGrep"; Filename: "{#MyAppToolsFolder}\Other\AstroGrep\AstroGrep.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\AstroGrep"; Components: "other\astrogrep";    



; AVFucker
[Components]
Name: "other\avfucker"; Description: "AVFucker"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\AVFucker\*"; DestDir: "{#MyAppToolsFolder}\Other\AVFucker"; Components: "other\avfucker"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\AVFucker"; Filename: "{#MyAppToolsFolder}\Other\AVFucker\AVFucker.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\AVFucker"; Components: "other\avfucker";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\AVFucker"; Filename: "{#MyAppToolsFolder}\Other\AVFucker\AVFucker.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\AVFucker"; Components: "other\avfucker";    



; Cool Beans NFO Creator
[Components]
Name: "other\coolbeansnfocreator"; Description: "Cool Beans NFO Creator"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\Cool Beans NFO Creator\*"; DestDir: "{#MyAppToolsFolder}\Other\Cool Beans NFO Creator"; Components: "other\coolbeansnfocreator"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\Cool Beans NFO Creator"; Filename: "{#MyAppToolsFolder}\Other\Cool Beans NFO Creator\coolnfo.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Cool Beans NFO Creator"; Components: "other\coolbeansnfocreator";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\Cool Beans NFO Creator"; Filename: "{#MyAppToolsFolder}\Other\Cool Beans NFO Creator\coolnfo.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Cool Beans NFO Creator"; Components: "other\coolbeansnfocreator";    



; FLOSS
[Components]
Name: "other\floss"; Description: "FLOSS"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\FLOSS\*"; DestDir: "{#MyAppToolsFolder}\Other\FLOSS"; Components: "other\floss"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\FLOSS x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\FLOSS"; Components: "other\floss"; Parameters: "/K ""{#MyAppToolsFolder}\Other\FLOSS\floss.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\FLOSS\floss.exe"; Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\FLOSS x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\FLOSS"; Components: "other\floss"; Parameters: "/K ""{#MyAppToolsFolder}\Other\FLOSS\floss.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\FLOSS\floss.exe"; Check: Is64BitInstallMode; 



; HashMyFiles
[Components]
Name: "other\hashmyfiles"; Description: "HashMyFiles"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\HashMyFiles\*"; DestDir: "{#MyAppToolsFolder}\Other\HashMyFiles"; Components: "other\hashmyfiles"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\HashMyFiles"; Filename: "{#MyAppToolsFolder}\Other\HashMyFiles\HashMyFiles.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\HashMyFiles"; Components: "other\hashmyfiles";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\HashMyFiles"; Filename: "{#MyAppToolsFolder}\Other\HashMyFiles\HashMyFiles.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\HashMyFiles"; Components: "other\hashmyfiles";    



; ImpREC
[Components]
Name: "other\imprec"; Description: "ImpREC"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\ImpREC\*"; DestDir: "{#MyAppToolsFolder}\Other\ImpREC"; Components: "other\imprec"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\ImpREC"; Filename: "{#MyAppToolsFolder}\Other\ImpREC\ImportREC.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ImpREC"; Components: "other\imprec";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\ImpREC"; Filename: "{#MyAppToolsFolder}\Other\ImpREC\ImportREC.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ImpREC"; Components: "other\imprec";    



; Indetectables Offset Locator
[Components]
Name: "other\indetectablesoffsetlocator"; Description: "Indetectables Offset Locator"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\Indetectables Offset Locator\*"; DestDir: "{#MyAppToolsFolder}\Other\Indetectables Offset Locator"; Components: "other\indetectablesoffsetlocator"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\Indetectables Offset Locator"; Filename: "{#MyAppToolsFolder}\Other\Indetectables Offset Locator\Indetectables Offset Locator.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Indetectables Offset Locator"; Components: "other\indetectablesoffsetlocator";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\Indetectables Offset Locator"; Filename: "{#MyAppToolsFolder}\Other\Indetectables Offset Locator\Indetectables Offset Locator.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Indetectables Offset Locator"; Components: "other\indetectablesoffsetlocator";    



; NFO Maker
[Components]
Name: "other\nfomaker"; Description: "NFO Maker"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\NFO Maker\*"; DestDir: "{#MyAppToolsFolder}\Other\NFO Maker"; Components: "other\nfomaker"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\NFO Maker"; Filename: "{#MyAppToolsFolder}\Other\NFO Maker\nfomaker.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\NFO Maker"; Components: "other\nfomaker";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\NFO Maker"; Filename: "{#MyAppToolsFolder}\Other\NFO Maker\nfomaker.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\NFO Maker"; Components: "other\nfomaker";    



; ProcDOT
[Components]
Name: "other\procdot"; Description: "ProcDOT"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\ProcDOT\*"; DestDir: "{#MyAppToolsFolder}\Other\ProcDOT"; Components: "other\procdot"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\ProcDOT"; Filename: "{#MyAppToolsFolder}\Other\ProcDOT\win32\procdot.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ProcDOT\win32"; Components: "other\procdot";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\ProcDOT"; Filename: "{#MyAppToolsFolder}\Other\ProcDOT\win32\procdot.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ProcDOT\win32"; Components: "other\procdot";    

[Icons]
Name: "{group}\{#MyAppName}\ProcDOT x64"; Filename: "{#MyAppToolsFolder}\Other\ProcDOT\win64\procdot.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ProcDOT\win64"; Components: "other\procdot";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\ProcDOT x64"; Filename: "{#MyAppToolsFolder}\Other\ProcDOT\win64\procdot.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ProcDOT\win64"; Components: "other\procdot";   Check: Is64BitInstallMode; 



; Process-Dump
[Components]
Name: "other\processdump"; Description: "Process-Dump"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\Process-Dump\*"; DestDir: "{#MyAppToolsFolder}\Other\Process-Dump"; Components: "other\processdump"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\Process-Dump"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Process-Dump"; Components: "other\processdump"; Parameters: "/K ""{#MyAppToolsFolder}\Other\Process-Dump\pd32.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\Process-Dump\pd32.exe";  
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\Process-Dump"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Process-Dump"; Components: "other\processdump"; Parameters: "/K ""{#MyAppToolsFolder}\Other\Process-Dump\pd32.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\Process-Dump\pd32.exe";  

[Icons]
Name: "{group}\{#MyAppName}\Process-Dump x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Process-Dump"; Components: "other\processdump"; Parameters: "/K ""{#MyAppToolsFolder}\Other\Process-Dump\pd64.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\Process-Dump\pd64.exe"; Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\Process-Dump x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Process-Dump"; Components: "other\processdump"; Parameters: "/K ""{#MyAppToolsFolder}\Other\Process-Dump\pd64.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\Process-Dump\pd64.exe"; Check: Is64BitInstallMode; 



; Resource Hacker
[Components]
Name: "other\resourcehacker"; Description: "Resource Hacker"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\Resource Hacker\*"; DestDir: "{#MyAppToolsFolder}\Other\Resource Hacker"; Components: "other\resourcehacker"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\Resource Hacker"; Filename: "{#MyAppToolsFolder}\Other\Resource Hacker\ResourceHacker.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Resource Hacker"; Components: "other\resourcehacker";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\Resource Hacker"; Filename: "{#MyAppToolsFolder}\Other\Resource Hacker\ResourceHacker.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Resource Hacker"; Components: "other\resourcehacker";    



; Scylla
[Components]
Name: "other\scylla"; Description: "Scylla"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\Scylla\*"; DestDir: "{#MyAppToolsFolder}\Other\Scylla"; Components: "other\scylla"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\Scylla x64"; Filename: "{#MyAppToolsFolder}\Other\Scylla\Scylla_x64.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Scylla"; Components: "other\scylla";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\Scylla x64"; Filename: "{#MyAppToolsFolder}\Other\Scylla\Scylla_x64.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Scylla"; Components: "other\scylla";   Check: Is64BitInstallMode; 

[Icons]
Name: "{group}\{#MyAppName}\Scylla"; Filename: "{#MyAppToolsFolder}\Other\Scylla\Scylla_x86.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Scylla"; Components: "other\scylla";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\Scylla"; Filename: "{#MyAppToolsFolder}\Other\Scylla\Scylla_x86.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Scylla"; Components: "other\scylla";    



; ShowString
[Components]
Name: "other\showstring"; Description: "ShowString"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\ShowString\*"; DestDir: "{#MyAppToolsFolder}\Other\ShowString"; Components: "other\showstring"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\ShowString"; Filename: "{#MyAppToolsFolder}\Other\ShowString\ShowString.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ShowString"; Components: "other\showstring";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\ShowString"; Filename: "{#MyAppToolsFolder}\Other\ShowString\ShowString.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ShowString"; Components: "other\showstring";    



; Strings
[Components]
Name: "other\strings"; Description: "Strings"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\Strings\*"; DestDir: "{#MyAppToolsFolder}\Other\Strings"; Components: "other\strings"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\Strings"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Strings"; Components: "other\strings"; Parameters: "/K ""{#MyAppToolsFolder}\Other\Strings\strings.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\Strings\strings.exe";  
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\Strings"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Strings"; Components: "other\strings"; Parameters: "/K ""{#MyAppToolsFolder}\Other\Strings\strings.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\Strings\strings.exe";  

[Icons]
Name: "{group}\{#MyAppName}\Strings x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Strings"; Components: "other\strings"; Parameters: "/K ""{#MyAppToolsFolder}\Other\Strings\strings64.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\Strings\strings64.exe"; Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\Strings x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Strings"; Components: "other\strings"; Parameters: "/K ""{#MyAppToolsFolder}\Other\Strings\strings64.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\Strings\strings64.exe"; Check: Is64BitInstallMode; 



; Threadtear
[Components]
Name: "other\threadtear"; Description: "Threadtear"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\Threadtear\*"; DestDir: "{#MyAppToolsFolder}\Other\Threadtear"; Components: "other\threadtear"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\Threadtear"; Filename: "{#MyAppToolsFolder}\Other\Threadtear\threadtear-gui-all.jar"; WorkingDir: "{#MyAppToolsFolder}\Other\Threadtear"; Components: "other\threadtear"; IconFilename: "{#MyAppToolsIconsFolder}\threadtear.ico";
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\Threadtear"; Filename: "{#MyAppToolsFolder}\Other\Threadtear\threadtear-gui-all.jar"; WorkingDir: "{#MyAppToolsFolder}\Other\Threadtear"; Components: "other\threadtear"; IconFilename: "{#MyAppToolsIconsFolder}\threadtear.ico";



; VirusTotalUploader
[Components]
Name: "other\virustotaluploader"; Description: "VirusTotalUploader"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\VirusTotalUploader\*"; DestDir: "{#MyAppToolsFolder}\Other\VirusTotalUploader"; Components: "other\virustotaluploader"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\VirusTotalUploader"; Filename: "{#MyAppToolsFolder}\Other\VirusTotalUploader\uploader.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\VirusTotalUploader"; Components: "other\virustotaluploader";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\VirusTotalUploader"; Filename: "{#MyAppToolsFolder}\Other\VirusTotalUploader\uploader.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\VirusTotalUploader"; Components: "other\virustotaluploader";    



; XOpCodeCalc
[Components]
Name: "other\xopcodecalc"; Description: "XOpCodeCalc"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\XOpCodeCalc\*"; DestDir: "{#MyAppToolsFolder}\Other\XOpCodeCalc"; Components: "other\xopcodecalc"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\XOpCodeCalc x64"; Filename: "{#MyAppToolsFolder}\Other\XOpCodeCalc\xocalc.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\XOpCodeCalc"; Components: "other\xopcodecalc";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\XOpCodeCalc x64"; Filename: "{#MyAppToolsFolder}\Other\XOpCodeCalc\xocalc.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\XOpCodeCalc"; Components: "other\xopcodecalc";   Check: Is64BitInstallMode; 


