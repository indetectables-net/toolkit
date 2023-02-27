; PEiD
[Components]
Name: "analysis\peid"; Description: "PEiD"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\PEiD\*"; DestDir: "{#MyAppToolsFolder}\Analysis\PEiD"; Components: "analysis\peid"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\PEiD"; Filename: "{#MyAppToolsFolder}\Analysis\PEiD\PEiD.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\PEiD"; Components: "analysis\peid";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\PEiD"; Filename: "{#MyAppToolsFolder}\Analysis\PEiD\PEiD.exe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\PEiD"; Components: "analysis\peid";    



; ProtectionID
[Components]
Name: "analysis\protectionid"; Description: "ProtectionID"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Analysis\ProtectionID\*"; DestDir: "{#MyAppToolsFolder}\Analysis\ProtectionID"; Components: "analysis\protectionid"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\ProtectionID"; Filename: "{#MyAppToolsFolder}\Analysis\ProtectionID\Protection_ID.eXe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\ProtectionID"; Components: "analysis\protectionid";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Analysis\ProtectionID"; Filename: "{#MyAppToolsFolder}\Analysis\ProtectionID\Protection_ID.eXe"; WorkingDir: "{#MyAppToolsFolder}\Analysis\ProtectionID"; Components: "analysis\protectionid";    


