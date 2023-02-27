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
Name: "other\apkstudio"; Description: "ApkStudio"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\ApkStudio\*"; DestDir: "{#MyAppToolsFolder}\Other\ApkStudio"; Components: "other\apkstudio"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\ApkStudio x64"; Filename: "{#MyAppToolsFolder}\Other\ApkStudio\ApkStudio.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ApkStudio"; Components: "other\apkstudio";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\ApkStudio x64"; Filename: "{#MyAppToolsFolder}\Other\ApkStudio\ApkStudio.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ApkStudio"; Components: "other\apkstudio";   Check: Is64BitInstallMode; 



; AstroGrep
[Components]
Name: "other\astrogrep"; Description: "AstroGrep"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\AstroGrep\*"; DestDir: "{#MyAppToolsFolder}\Other\AstroGrep"; Components: "other\astrogrep"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\AstroGrep"; Filename: "{#MyAppToolsFolder}\Other\AstroGrep\AstroGrep.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\AstroGrep"; Components: "other\astrogrep";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\AstroGrep"; Filename: "{#MyAppToolsFolder}\Other\AstroGrep\AstroGrep.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\AstroGrep"; Components: "other\astrogrep";    



; FLOSS
[Components]
Name: "other\floss"; Description: "FLOSS"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\FLOSS\*"; DestDir: "{#MyAppToolsFolder}\Other\FLOSS"; Components: "other\floss"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\FLOSS x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\FLOSS"; Components: "other\floss"; Parameters: "/K ""{#MyAppToolsFolder}\Other\FLOSS\floss.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\FLOSS\floss.exe"; Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\FLOSS x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\FLOSS"; Components: "other\floss"; Parameters: "/K ""{#MyAppToolsFolder}\Other\FLOSS\floss.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\FLOSS\floss.exe"; Check: Is64BitInstallMode; 



; HashMyFiles
[Components]
Name: "other\hashmyfiles"; Description: "HashMyFiles"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\HashMyFiles\*"; DestDir: "{#MyAppToolsFolder}\Other\HashMyFiles"; Components: "other\hashmyfiles"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\HashMyFiles"; Filename: "{#MyAppToolsFolder}\Other\HashMyFiles\HashMyFiles.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\HashMyFiles"; Components: "other\hashmyfiles";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\HashMyFiles"; Filename: "{#MyAppToolsFolder}\Other\HashMyFiles\HashMyFiles.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\HashMyFiles"; Components: "other\hashmyfiles";    



; ProcDOT
[Components]
Name: "other\procdot"; Description: "ProcDOT"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\ProcDOT\*"; DestDir: "{#MyAppToolsFolder}\Other\ProcDOT"; Components: "other\procdot"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\ProcDOT"; Filename: "{#MyAppToolsFolder}\Other\ProcDOT\win32\procdot.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ProcDOT\win32"; Components: "other\procdot";   Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\ProcDOT"; Filename: "{#MyAppToolsFolder}\Other\ProcDOT\win32\procdot.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ProcDOT\win32"; Components: "other\procdot";   Check: not Is64BitInstallMode; 

[Icons]
Name: "{group}\{#MyAppName}\ProcDOT x64"; Filename: "{#MyAppToolsFolder}\Other\ProcDOT\win64\procdot.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ProcDOT\win64"; Components: "other\procdot";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\ProcDOT x64"; Filename: "{#MyAppToolsFolder}\Other\ProcDOT\win64\procdot.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ProcDOT\win64"; Components: "other\procdot";   Check: Is64BitInstallMode; 



; RawCap
[Components]
Name: "other\rawcap"; Description: "RawCap"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\RawCap\*"; DestDir: "{#MyAppToolsFolder}\Other\RawCap"; Components: "other\rawcap"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\RawCap"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\RawCap"; Components: "other\rawcap"; Parameters: "/K ""{#MyAppToolsFolder}\Other\RawCap\RawCap.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\RawCap\RawCap.exe";  
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\RawCap"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\RawCap"; Components: "other\rawcap"; Parameters: "/K ""{#MyAppToolsFolder}\Other\RawCap\RawCap.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\RawCap\RawCap.exe";  



; Resource Hacker
[Components]
Name: "other\resourcehacker"; Description: "Resource Hacker"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\Resource Hacker\*"; DestDir: "{#MyAppToolsFolder}\Other\Resource Hacker"; Components: "other\resourcehacker"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\Resource Hacker"; Filename: "{#MyAppToolsFolder}\Other\Resource Hacker\ResourceHacker.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Resource Hacker"; Components: "other\resourcehacker";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\Resource Hacker"; Filename: "{#MyAppToolsFolder}\Other\Resource Hacker\ResourceHacker.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Resource Hacker"; Components: "other\resourcehacker";    



; RunAsDate
[Components]
Name: "other\runasdate"; Description: "RunAsDate"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\RunAsDate\*"; DestDir: "{#MyAppToolsFolder}\Other\RunAsDate"; Components: "other\runasdate"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\RunAsDate"; Filename: "{#MyAppToolsFolder}\Other\RunAsDate\RunAsDate.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\RunAsDate"; Components: "other\runasdate";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\RunAsDate"; Filename: "{#MyAppToolsFolder}\Other\RunAsDate\RunAsDate.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\RunAsDate"; Components: "other\runasdate";    



; Strings
[Components]
Name: "other\strings"; Description: "Strings"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\Strings\*"; DestDir: "{#MyAppToolsFolder}\Other\Strings"; Components: "other\strings"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\Strings"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Strings"; Components: "other\strings"; Parameters: "/K ""{#MyAppToolsFolder}\Other\Strings\strings.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\Strings\strings.exe"; Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\Strings"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Strings"; Components: "other\strings"; Parameters: "/K ""{#MyAppToolsFolder}\Other\Strings\strings.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\Strings\strings.exe"; Check: not Is64BitInstallMode; 

[Icons]
Name: "{group}\{#MyAppName}\Strings x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Strings"; Components: "other\strings"; Parameters: "/K ""{#MyAppToolsFolder}\Other\Strings\strings64.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\Strings\strings64.exe"; Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\Strings x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Strings"; Components: "other\strings"; Parameters: "/K ""{#MyAppToolsFolder}\Other\Strings\strings64.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\Strings\strings64.exe"; Check: Is64BitInstallMode; 



; VirusTotalUploader
[Components]
Name: "other\virustotaluploader"; Description: "VirusTotalUploader"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\VirusTotalUploader\*"; DestDir: "{#MyAppToolsFolder}\Other\VirusTotalUploader"; Components: "other\virustotaluploader"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\VirusTotalUploader"; Filename: "{#MyAppToolsFolder}\Other\VirusTotalUploader\uploader.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\VirusTotalUploader"; Components: "other\virustotaluploader";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\VirusTotalUploader"; Filename: "{#MyAppToolsFolder}\Other\VirusTotalUploader\uploader.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\VirusTotalUploader"; Components: "other\virustotaluploader";    


