; 4n4lDetector
[Components]
Name: "analysis\4n4ldetector"; Description: "4n4lDetector"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\4n4lDetector\*"; DestDir: "{#MyAppToolsFolder}\Analysis\4n4lDetector"; Components: "analysis\4n4ldetector"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\4n4lDetector"; Filename: "{#MyAppToolsFolder}\Analysis\4n4lDetector\4N4LDetector.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\4n4lDetector"; Components: "analysis\4n4ldetector";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\4n4lDetector"; Filename: "{#MyAppToolsFolder}\Analysis\4n4lDetector\4N4LDetector.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\4n4lDetector"; Components: "analysis\4n4ldetector";    



; CAPA
[Components]
Name: "analysis\capa"; Description: "CAPA"; Types: full typical; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\CAPA\*"; DestDir: "{#MyAppToolsFolder}\Analysis\CAPA"; Components: "analysis\capa"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\CAPA x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\CAPA"; Components: "analysis\capa"; Parameters: "/K ""{#MyAppToolsFolder}\Analysis\CAPA\capa.exe"""; IconFilename: "{#MyAppToolsFolder}\Analysis\CAPA\capa.exe"; Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\CAPA x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\CAPA"; Components: "analysis\capa"; Parameters: "/K ""{#MyAppToolsFolder}\Analysis\CAPA\capa.exe"""; IconFilename: "{#MyAppToolsFolder}\Analysis\CAPA\capa.exe"; Check: Is64BitInstallMode; 



; DIE
[Components]
Name: "analysis\die"; Description: "DIE"; Types: full compact typical; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\DIE\*"; DestDir: "{#MyAppToolsFolder}\Analysis\DIE"; Components: "analysis\die"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\DIE"; Filename: "{#MyAppToolsFolder}\Analysis\DIE\die.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\DIE"; Components: "analysis\die";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\DIE"; Filename: "{#MyAppToolsFolder}\Analysis\DIE\die.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\DIE"; Components: "analysis\die";    



; ExeExplorer
[Components]
Name: "analysis\exeexplorer"; Description: "ExeExplorer"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\ExeExplorer\*"; DestDir: "{#MyAppToolsFolder}\Analysis\ExeExplorer"; Components: "analysis\exeexplorer"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\ExeExplorer"; Filename: "{#MyAppToolsFolder}\Analysis\ExeExplorer\EXE.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\ExeExplorer"; Components: "analysis\exeexplorer";   Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\ExeExplorer"; Filename: "{#MyAppToolsFolder}\Analysis\ExeExplorer\EXE.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\ExeExplorer"; Components: "analysis\exeexplorer";   Check: not Is64BitInstallMode; 



; ExeinfoPe
[Components]
Name: "analysis\exeinfope"; Description: "ExeinfoPe"; Types: full compact typical; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\ExeinfoPe\*"; DestDir: "{#MyAppToolsFolder}\Analysis\ExeinfoPe"; Components: "analysis\exeinfope"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\ExeinfoPe"; Filename: "{#MyAppToolsFolder}\Analysis\ExeinfoPe\exeinfope.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\ExeinfoPe"; Components: "analysis\exeinfope";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\ExeinfoPe"; Filename: "{#MyAppToolsFolder}\Analysis\ExeinfoPe\exeinfope.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\ExeinfoPe"; Components: "analysis\exeinfope";    



; PE-Bear
[Components]
Name: "analysis\pebear"; Description: "PE-Bear"; Types: full typical; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\PE-Bear\*"; DestDir: "{#MyAppToolsFolder}\Analysis\PE-Bear"; Components: "analysis\pebear"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\PE-Bear x64"; Filename: "{#MyAppToolsFolder}\Analysis\PE-Bear\PE-bear.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\PE-Bear"; Components: "analysis\pebear";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\PE-Bear x64"; Filename: "{#MyAppToolsFolder}\Analysis\PE-Bear\PE-bear.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\PE-Bear"; Components: "analysis\pebear";   Check: Is64BitInstallMode; 



; PEiD
[Components]
Name: "analysis\peid"; Description: "PEiD"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\PEiD\*"; DestDir: "{#MyAppToolsFolder}\Analysis\PEiD"; Components: "analysis\peid"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\PEiD"; Filename: "{#MyAppToolsFolder}\Analysis\PEiD\PEiD.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\PEiD"; Components: "analysis\peid";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\PEiD"; Filename: "{#MyAppToolsFolder}\Analysis\PEiD\PEiD.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\PEiD"; Components: "analysis\peid";    



; PEStudio
[Components]
Name: "analysis\pestudio"; Description: "PEStudio"; Types: full compact typical; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\PEStudio\*"; DestDir: "{#MyAppToolsFolder}\Analysis\PEStudio"; Components: "analysis\pestudio"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\PEStudio x64"; Filename: "{#MyAppToolsFolder}\Analysis\PEStudio\pestudio.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\PEStudio"; Components: "analysis\pestudio";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\PEStudio x64"; Filename: "{#MyAppToolsFolder}\Analysis\PEStudio\pestudio.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\PEStudio"; Components: "analysis\pestudio";   Check: Is64BitInstallMode; 



; ProtectionID
[Components]
Name: "analysis\protectionid"; Description: "ProtectionID"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\ProtectionID\*"; DestDir: "{#MyAppToolsFolder}\Analysis\ProtectionID"; Components: "analysis\protectionid"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\ProtectionID"; Filename: "{#MyAppToolsFolder}\Analysis\ProtectionID\Protection_ID.eXe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\ProtectionID"; Components: "analysis\protectionid";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\ProtectionID"; Filename: "{#MyAppToolsFolder}\Analysis\ProtectionID\Protection_ID.eXe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\ProtectionID"; Components: "analysis\protectionid";    



; XAPKDetector
[Components]
Name: "analysis\xapkdetector"; Description: "XAPKDetector"; Types: full typical; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\XAPKDetector\*"; DestDir: "{#MyAppToolsFolder}\Analysis\XAPKDetector"; Components: "analysis\xapkdetector"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\XAPKDetector"; Filename: "{#MyAppToolsFolder}\Analysis\XAPKDetector\xapkd.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\XAPKDetector"; Components: "analysis\xapkdetector";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\XAPKDetector"; Filename: "{#MyAppToolsFolder}\Analysis\XAPKDetector\xapkd.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\XAPKDetector"; Components: "analysis\xapkdetector";    



; XELFViewer
[Components]
Name: "analysis\xelfviewer"; Description: "XELFViewer"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\XELFViewer\*"; DestDir: "{#MyAppToolsFolder}\Analysis\XELFViewer"; Components: "analysis\xelfviewer"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\XELFViewer"; Filename: "{#MyAppToolsFolder}\Analysis\XELFViewer\xelfviewer.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\XELFViewer"; Components: "analysis\xelfviewer";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\XELFViewer"; Filename: "{#MyAppToolsFolder}\Analysis\XELFViewer\xelfviewer.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\XELFViewer"; Components: "analysis\xelfviewer";    



; XPEViewer
[Components]
Name: "analysis\xpeviewer"; Description: "XPEViewer"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\XPEViewer\*"; DestDir: "{#MyAppToolsFolder}\Analysis\XPEViewer"; Components: "analysis\xpeviewer"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\XPEViewer"; Filename: "{#MyAppToolsFolder}\Analysis\XPEViewer\xpeviewer.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\XPEViewer"; Components: "analysis\xpeviewer";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\XPEViewer"; Filename: "{#MyAppToolsFolder}\Analysis\XPEViewer\xpeviewer.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\XPEViewer"; Components: "analysis\xpeviewer";    


