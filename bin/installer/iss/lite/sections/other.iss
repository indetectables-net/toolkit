; Main section
[Files]
Source: "{#MySrcDir}\toolkit\Other\desktop.ini"; DestDir: "{#MyAppBinsFolder}\sendto\sendto\Other"; Components: "other"; Flags: ignoreversion; 
Source: "{#MySrcDir}\toolkit\Other\folder.ico"; DestDir: "{#MyAppBinsFolder}\sendto\sendto\Other"; Components: "other"; Flags: ignoreversion; 

[Run]
Filename: "{sys}\attrib.exe"; Parameters: "+s +h ""{#MyAppBinsFolder}\sendto\sendto\Other\desktop.ini"""; Components: "other"; Flags: runhidden; 
Filename: "{sys}\attrib.exe"; Parameters: "+r ""{#MyAppBinsFolder}\sendto\sendto\Other"""; Components: "other"; Flags: runhidden; 



; ApkStudio
[Components]
Name: "other\apkstudio"; Description: "ApkStudio"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\ApkStudio\*"; DestDir: "{#MyAppToolsFolder}\Other\ApkStudio"; Components: "other\apkstudio"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\ApkStudio x64"; Filename: "{#MyAppToolsFolder}\Other\ApkStudio\ApkStudio.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ApkStudio"; Components: "other\apkstudio";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\ApkStudio x64"; Filename: "{#MyAppToolsFolder}\Other\ApkStudio\ApkStudio.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\ApkStudio"; Components: "other\apkstudio";   Check: Is64BitInstallMode; 



; FLOSS
[Components]
Name: "other\floss"; Description: "FLOSS"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\FLOSS\*"; DestDir: "{#MyAppToolsFolder}\Other\FLOSS"; Components: "other\floss"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\FLOSS x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\FLOSS"; Components: "other\floss"; Parameters: "/K ""{#MyAppToolsFolder}\Other\FLOSS\floss.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\FLOSS\floss.exe"; Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\FLOSS x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\FLOSS"; Components: "other\floss"; Parameters: "/K ""{#MyAppToolsFolder}\Other\FLOSS\floss.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\FLOSS\floss.exe"; Check: Is64BitInstallMode; 



; HashMyFiles
[Components]
Name: "other\hashmyfiles"; Description: "HashMyFiles"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\HashMyFiles\*"; DestDir: "{#MyAppToolsFolder}\Other\HashMyFiles"; Components: "other\hashmyfiles"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\HashMyFiles"; Filename: "{#MyAppToolsFolder}\Other\HashMyFiles\HashMyFiles.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\HashMyFiles"; Components: "other\hashmyfiles";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\HashMyFiles"; Filename: "{#MyAppToolsFolder}\Other\HashMyFiles\HashMyFiles.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\HashMyFiles"; Components: "other\hashmyfiles";    



; MalUnpack
[Components]
Name: "other\malunpack"; Description: "MalUnpack"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\MalUnpack\*"; DestDir: "{#MyAppToolsFolder}\Other\MalUnpack"; Components: "other\malunpack"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\MalUnpack x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\MalUnpack"; Components: "other\malunpack"; Parameters: "/K ""{#MyAppToolsFolder}\Other\MalUnpack\mal_unpack.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\MalUnpack\mal_unpack.exe"; Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\MalUnpack x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\MalUnpack"; Components: "other\malunpack"; Parameters: "/K ""{#MyAppToolsFolder}\Other\MalUnpack\mal_unpack.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\MalUnpack\mal_unpack.exe"; Check: Is64BitInstallMode; 



; RawCap
[Components]
Name: "other\rawcap"; Description: "RawCap"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\RawCap\*"; DestDir: "{#MyAppToolsFolder}\Other\RawCap"; Components: "other\rawcap"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\RawCap"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\RawCap"; Components: "other\rawcap"; Parameters: "/K ""{#MyAppToolsFolder}\Other\RawCap\RawCap.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\RawCap\RawCap.exe";  
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\RawCap"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\RawCap"; Components: "other\rawcap"; Parameters: "/K ""{#MyAppToolsFolder}\Other\RawCap\RawCap.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\RawCap\RawCap.exe";  



; Resource Hacker
[Components]
Name: "other\resourcehacker"; Description: "Resource Hacker"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\Resource Hacker\*"; DestDir: "{#MyAppToolsFolder}\Other\Resource Hacker"; Components: "other\resourcehacker"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\Resource Hacker"; Filename: "{#MyAppToolsFolder}\Other\Resource Hacker\ResourceHacker.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Resource Hacker"; Components: "other\resourcehacker";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\Resource Hacker"; Filename: "{#MyAppToolsFolder}\Other\Resource Hacker\ResourceHacker.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Resource Hacker"; Components: "other\resourcehacker";    



; RunAsDate
[Components]
Name: "other\runasdate"; Description: "RunAsDate"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\RunAsDate\*"; DestDir: "{#MyAppToolsFolder}\Other\RunAsDate"; Components: "other\runasdate"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\RunAsDate"; Filename: "{#MyAppToolsFolder}\Other\RunAsDate\RunAsDate.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\RunAsDate"; Components: "other\runasdate";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\RunAsDate"; Filename: "{#MyAppToolsFolder}\Other\RunAsDate\RunAsDate.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\RunAsDate"; Components: "other\runasdate";    



; Strings
[Components]
Name: "other\strings"; Description: "Strings"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\Strings\*"; DestDir: "{#MyAppToolsFolder}\Other\Strings"; Components: "other\strings"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\Strings"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Strings"; Components: "other\strings"; Parameters: "/K ""{#MyAppToolsFolder}\Other\Strings\strings.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\Strings\strings.exe"; Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\Strings"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Strings"; Components: "other\strings"; Parameters: "/K ""{#MyAppToolsFolder}\Other\Strings\strings.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\Strings\strings.exe"; Check: not Is64BitInstallMode; 

[Icons]
Name: "{group}\Strings x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Strings"; Components: "other\strings"; Parameters: "/K ""{#MyAppToolsFolder}\Other\Strings\strings64.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\Strings\strings64.exe"; Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\Strings x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\Strings"; Components: "other\strings"; Parameters: "/K ""{#MyAppToolsFolder}\Other\Strings\strings64.exe"""; IconFilename: "{#MyAppToolsFolder}\Other\Strings\strings64.exe"; Check: Is64BitInstallMode; 



; VirusTotalUploader
[Components]
Name: "other\virustotaluploader"; Description: "VirusTotalUploader"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\VirusTotalUploader\*"; DestDir: "{#MyAppToolsFolder}\Other\VirusTotalUploader"; Components: "other\virustotaluploader"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\VirusTotalUploader"; Filename: "{#MyAppToolsFolder}\Other\VirusTotalUploader\uploader.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\VirusTotalUploader"; Components: "other\virustotaluploader";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\VirusTotalUploader"; Filename: "{#MyAppToolsFolder}\Other\VirusTotalUploader\uploader.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\VirusTotalUploader"; Components: "other\virustotaluploader";    



; WinObjEx64
[Components]
Name: "other\winobjex64"; Description: "WinObjEx64"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Other\WinObjEx64\*"; DestDir: "{#MyAppToolsFolder}\Other\WinObjEx64"; Components: "other\winobjex64"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\WinObjEx64 x64"; Filename: "{#MyAppToolsFolder}\Other\WinObjEx64\WinObjEx64.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\WinObjEx64"; Components: "other\winobjex64";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Other\WinObjEx64 x64"; Filename: "{#MyAppToolsFolder}\Other\WinObjEx64\WinObjEx64.exe"; WorkingDir: "{#MyAppToolsFolder}\Other\WinObjEx64"; Components: "other\winobjex64";   Check: Is64BitInstallMode; 


