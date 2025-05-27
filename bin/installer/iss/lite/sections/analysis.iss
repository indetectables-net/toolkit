; CAPA
[Components]
Name: "analysis\capa"; Description: "CAPA"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\CAPA\*"; DestDir: "{#MyAppToolsFolder}\Analysis\CAPA"; Components: "analysis\capa"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\CAPA x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\CAPA"; Components: "analysis\capa"; Parameters: "/K ""{#MyAppToolsFolder}\Analysis\CAPA\capa.exe"""; IconFilename: "{#MyAppToolsFolder}\Analysis\CAPA\capa.exe"; Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\CAPA x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\CAPA"; Components: "analysis\capa"; Parameters: "/K ""{#MyAppToolsFolder}\Analysis\CAPA\capa.exe"""; IconFilename: "{#MyAppToolsFolder}\Analysis\CAPA\capa.exe"; Check: Is64BitInstallMode; 



; DIE
[Components]
Name: "analysis\die"; Description: "DIE"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\DIE\*"; DestDir: "{#MyAppToolsFolder}\Analysis\DIE"; Components: "analysis\die"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\DIE"; Filename: "{#MyAppToolsFolder}\Analysis\DIE\die.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\DIE"; Components: "analysis\die";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\DIE"; Filename: "{#MyAppToolsFolder}\Analysis\DIE\die.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\DIE"; Components: "analysis\die";    



; ExeinfoPe
[Components]
Name: "analysis\exeinfope"; Description: "ExeinfoPe"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\ExeinfoPe\*"; DestDir: "{#MyAppToolsFolder}\Analysis\ExeinfoPe"; Components: "analysis\exeinfope"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\ExeinfoPe"; Filename: "{#MyAppToolsFolder}\Analysis\ExeinfoPe\exeinfope.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\ExeinfoPe"; Components: "analysis\exeinfope";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\ExeinfoPe"; Filename: "{#MyAppToolsFolder}\Analysis\ExeinfoPe\exeinfope.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\ExeinfoPe"; Components: "analysis\exeinfope";    



; PE-Bear
[Components]
Name: "analysis\pebear"; Description: "PE-Bear"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\PE-Bear\*"; DestDir: "{#MyAppToolsFolder}\Analysis\PE-Bear"; Components: "analysis\pebear"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\PE-Bear"; Filename: "{#MyAppToolsFolder}\Analysis\PE-Bear\PE-bear.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\PE-Bear"; Components: "analysis\pebear";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\PE-Bear"; Filename: "{#MyAppToolsFolder}\Analysis\PE-Bear\PE-bear.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\PE-Bear"; Components: "analysis\pebear";    



; PEStudio
[Components]
Name: "analysis\pestudio"; Description: "PEStudio"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\PEStudio\*"; DestDir: "{#MyAppToolsFolder}\Analysis\PEStudio"; Components: "analysis\pestudio"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\PEStudio x64"; Filename: "{#MyAppToolsFolder}\Analysis\PEStudio\pestudio.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\PEStudio"; Components: "analysis\pestudio";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\PEStudio x64"; Filename: "{#MyAppToolsFolder}\Analysis\PEStudio\pestudio.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\PEStudio"; Components: "analysis\pestudio";   Check: Is64BitInstallMode; 



; XELFViewer
[Components]
Name: "analysis\xelfviewer"; Description: "XELFViewer"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\XELFViewer\*"; DestDir: "{#MyAppToolsFolder}\Analysis\XELFViewer"; Components: "analysis\xelfviewer"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\XELFViewer"; Filename: "{#MyAppToolsFolder}\Analysis\XELFViewer\xelfviewer.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\XELFViewer"; Components: "analysis\xelfviewer";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\XELFViewer"; Filename: "{#MyAppToolsFolder}\Analysis\XELFViewer\xelfviewer.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\XELFViewer"; Components: "analysis\xelfviewer";    



[Files]
Source: "{#MySrcDir}\toolkit\Analysis\desktop.ini"; DestDir: "{#MyAppToolsFolder}\Analysis"; Components: "analysis"; Flags: ignoreversion; 
Source: "{#MySrcDir}\toolkit\Analysis\folder.ico"; DestDir: "{#MyAppToolsFolder}\Analysis"; Components: "analysis"; Flags: ignoreversion; 

[Run]
Filename: "{sys}\attrib.exe"; Parameters: "+s +h ""{#MyAppToolsFolder}\toolkit\Analysis\desktop.ini"""; Components: "analysis"; Flags: runhidden; 
Filename: "{sys}\attrib.exe"; Parameters: "+r ""{#MyAppToolsFolder}\toolkit\Analysis"""; Components: "analysis"; Flags: runhidden; 
