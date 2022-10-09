; CAPA
[Components]
Name: "analysis\capa"; Description: "CAPA"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\CAPA\*"; DestDir: "{#MyAppToolsFolder}\Analysis\CAPA"; Components: "analysis\capa"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\CAPA x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\CAPA"; Components: "analysis\capa"; Parameters: "/K ""{#MyAppToolsFolder}\Analysis\CAPA\capa.exe"""; IconFilename: "{#MyAppToolsFolder}\Analysis\CAPA\capa.exe"; Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\CAPA x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\CAPA"; Components: "analysis\capa"; Parameters: "/K ""{#MyAppToolsFolder}\Analysis\CAPA\capa.exe"""; IconFilename: "{#MyAppToolsFolder}\Analysis\CAPA\capa.exe"; Check: Is64BitInstallMode; 



; DIE
[Components]
Name: "analysis\die"; Description: "DIE"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\DIE\*"; DestDir: "{#MyAppToolsFolder}\Analysis\DIE"; Components: "analysis\die"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\DIE"; Filename: "{#MyAppToolsFolder}\Analysis\DIE\die.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\DIE"; Components: "analysis\die";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\DIE"; Filename: "{#MyAppToolsFolder}\Analysis\DIE\die.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\DIE"; Components: "analysis\die";    



; ExeinfoPe
[Components]
Name: "analysis\exeinfope"; Description: "ExeinfoPe"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\ExeinfoPe\*"; DestDir: "{#MyAppToolsFolder}\Analysis\ExeinfoPe"; Components: "analysis\exeinfope"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\ExeinfoPe"; Filename: "{#MyAppToolsFolder}\Analysis\ExeinfoPe\exeinfope.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\ExeinfoPe"; Components: "analysis\exeinfope";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\ExeinfoPe"; Filename: "{#MyAppToolsFolder}\Analysis\ExeinfoPe\exeinfope.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\ExeinfoPe"; Components: "analysis\exeinfope";    



; PEStudio
[Components]
Name: "analysis\pestudio"; Description: "PEStudio"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\PEStudio\*"; DestDir: "{#MyAppToolsFolder}\Analysis\PEStudio"; Components: "analysis\pestudio"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\PEStudio x64"; Filename: "{#MyAppToolsFolder}\Analysis\PEStudio\pestudio.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\PEStudio"; Components: "analysis\pestudio";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\PEStudio x64"; Filename: "{#MyAppToolsFolder}\Analysis\PEStudio\pestudio.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\PEStudio"; Components: "analysis\pestudio";   Check: Is64BitInstallMode; 



; XAPKDetector
[Components]
Name: "analysis\xapkdetector"; Description: "XAPKDetector"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\XAPKDetector\*"; DestDir: "{#MyAppToolsFolder}\Analysis\XAPKDetector"; Components: "analysis\xapkdetector"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\XAPKDetector"; Filename: "{#MyAppToolsFolder}\Analysis\XAPKDetector\xapkd.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\XAPKDetector"; Components: "analysis\xapkdetector";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\XAPKDetector"; Filename: "{#MyAppToolsFolder}\Analysis\XAPKDetector\xapkd.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\XAPKDetector"; Components: "analysis\xapkdetector";    



; XPEViewer
[Components]
Name: "analysis\xpeviewer"; Description: "XPEViewer"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\XPEViewer\*"; DestDir: "{#MyAppToolsFolder}\Analysis\XPEViewer"; Components: "analysis\xpeviewer"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\XPEViewer"; Filename: "{#MyAppToolsFolder}\Analysis\XPEViewer\xpeviewer.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\XPEViewer"; Components: "analysis\xpeviewer";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\XPEViewer"; Filename: "{#MyAppToolsFolder}\Analysis\XPEViewer\xpeviewer.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\XPEViewer"; Components: "analysis\xpeviewer";    


