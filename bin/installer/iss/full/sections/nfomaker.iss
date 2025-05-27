; Ascii Generator 2
[Components]
Name: "nfomaker\asciigenerator2"; Description: "Ascii Generator 2"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\NFOMaker\Ascii Generator 2\*"; DestDir: "{#MyAppToolsFolder}\NFOMaker\Ascii Generator 2"; Components: "nfomaker\asciigenerator2"; Flags: ignoreversion recursesubdirs createallsubdirs; 



[Icons]
Name: "{group}\Ascii Generator 2"; Filename: "{#MyAppToolsFolder}\NFOMaker\Ascii Generator 2\Ascgen2.exe"; WorkingDir: "{#MyAppToolsFolder}\NFOMaker\Ascii Generator 2"; Components: "nfomaker\asciigenerator2";    
Name: "{#MyAppBinsFolder}\sendto\sendto\NFOMaker\Ascii Generator 2"; Filename: "{#MyAppToolsFolder}\NFOMaker\Ascii Generator 2\Ascgen2.exe"; WorkingDir: "{#MyAppToolsFolder}\NFOMaker\Ascii Generator 2"; Components: "nfomaker\asciigenerator2";    



; Cool Beans NFO Creator
[Components]
Name: "nfomaker\coolbeansnfocreator"; Description: "Cool Beans NFO Creator"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\NFOMaker\Cool Beans NFO Creator\*"; DestDir: "{#MyAppToolsFolder}\NFOMaker\Cool Beans NFO Creator"; Components: "nfomaker\coolbeansnfocreator"; Flags: ignoreversion recursesubdirs createallsubdirs; 



[Icons]
Name: "{group}\Cool Beans NFO Creator"; Filename: "{#MyAppToolsFolder}\NFOMaker\Cool Beans NFO Creator\coolnfo.exe"; WorkingDir: "{#MyAppToolsFolder}\NFOMaker\Cool Beans NFO Creator"; Components: "nfomaker\coolbeansnfocreator";    
Name: "{#MyAppBinsFolder}\sendto\sendto\NFOMaker\Cool Beans NFO Creator"; Filename: "{#MyAppToolsFolder}\NFOMaker\Cool Beans NFO Creator\coolnfo.exe"; WorkingDir: "{#MyAppToolsFolder}\NFOMaker\Cool Beans NFO Creator"; Components: "nfomaker\coolbeansnfocreator";    



; NFO Maker
[Components]
Name: "nfomaker\nfomaker"; Description: "NFO Maker"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\NFOMaker\NFO Maker\*"; DestDir: "{#MyAppToolsFolder}\NFOMaker\NFO Maker"; Components: "nfomaker\nfomaker"; Flags: ignoreversion recursesubdirs createallsubdirs; 



[Icons]
Name: "{group}\NFO Maker"; Filename: "{#MyAppToolsFolder}\NFOMaker\NFO Maker\nfomaker.exe"; WorkingDir: "{#MyAppToolsFolder}\NFOMaker\NFO Maker"; Components: "nfomaker\nfomaker";    
Name: "{#MyAppBinsFolder}\sendto\sendto\NFOMaker\NFO Maker"; Filename: "{#MyAppToolsFolder}\NFOMaker\NFO Maker\nfomaker.exe"; WorkingDir: "{#MyAppToolsFolder}\NFOMaker\NFO Maker"; Components: "nfomaker\nfomaker";    



[Files]
Source: "{#MySrcDir}\toolkit\NFOMaker\desktop.ini"; DestDir: "{#MyAppToolsFolder}\NFOMaker"; Components: "nfomaker"; Flags: ignoreversion; 
Source: "{#MySrcDir}\toolkit\NFOMaker\folder.ico"; DestDir: "{#MyAppToolsFolder}\NFOMaker"; Components: "nfomaker"; Flags: ignoreversion; 

[Run]
Filename: "{sys}\attrib.exe"; Parameters: "+s +h ""{#MyAppToolsFolder}\toolkit\NFOMaker\desktop.ini"""; Components: "nfomaker"; Flags: runhidden; 
Filename: "{sys}\attrib.exe"; Parameters: "+r ""{#MyAppToolsFolder}\toolkit\NFOMaker"""; Components: "nfomaker"; Flags: runhidden; 
