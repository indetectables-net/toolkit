; HxD
[Components]
Name: "hexeditor\hxd"; Description: "HxD"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\HEX Editor\HxD\*"; DestDir: "{#MyAppToolsFolder}\HEX Editor\HxD"; Components: "hexeditor\hxd"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\HxD"; Filename: "{#MyAppToolsFolder}\HEX Editor\HxD\HxD32.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\HxD"; Components: "hexeditor\hxd";   
Name: "{#MyAppBinsFolder}\sendto\sendto\HEX Editor\HxD"; Filename: "{#MyAppToolsFolder}\HEX Editor\HxD\HxD32.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\HxD"; Components: "hexeditor\hxd";   

[Icons]
Name: "{group}\{#MyAppName}\HxD x64"; Filename: "{#MyAppToolsFolder}\HEX Editor\HxD\HxD64.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\HxD"; Components: "hexeditor\hxd"; Check: Is64BitInstallMode;  
Name: "{#MyAppBinsFolder}\sendto\sendto\HEX Editor\HxD x64"; Filename: "{#MyAppToolsFolder}\HEX Editor\HxD\HxD64.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\HxD"; Components: "hexeditor\hxd"; Check: Is64BitInstallMode;  



; ImHex
[Components]
Name: "hexeditor\imhex"; Description: "ImHex"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\HEX Editor\ImHex\*"; DestDir: "{#MyAppToolsFolder}\HEX Editor\ImHex"; Components: "hexeditor\imhex"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\ImHex x64"; Filename: "{#MyAppToolsFolder}\HEX Editor\ImHex\imhex.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\ImHex"; Components: "hexeditor\imhex"; Check: Is64BitInstallMode;  
Name: "{#MyAppBinsFolder}\sendto\sendto\HEX Editor\ImHex x64"; Filename: "{#MyAppToolsFolder}\HEX Editor\ImHex\imhex.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\ImHex"; Components: "hexeditor\imhex"; Check: Is64BitInstallMode;  



; REHex
[Components]
Name: "hexeditor\rehex"; Description: "REHex"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\HEX Editor\REHex\*"; DestDir: "{#MyAppToolsFolder}\HEX Editor\REHex"; Components: "hexeditor\rehex"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\REHex x64"; Filename: "{#MyAppToolsFolder}\HEX Editor\REHex\rehex.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\REHex"; Components: "hexeditor\rehex"; Check: Is64BitInstallMode;  
Name: "{#MyAppBinsFolder}\sendto\sendto\HEX Editor\REHex x64"; Filename: "{#MyAppToolsFolder}\HEX Editor\REHex\rehex.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\REHex"; Components: "hexeditor\rehex"; Check: Is64BitInstallMode;  



; WinHex
[Components]
Name: "hexeditor\winhex"; Description: "WinHex"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\HEX Editor\WinHex\*"; DestDir: "{#MyAppToolsFolder}\HEX Editor\WinHex"; Components: "hexeditor\winhex"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\WinHex"; Filename: "{#MyAppToolsFolder}\HEX Editor\WinHex\winhex.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\WinHex"; Components: "hexeditor\winhex";   
Name: "{#MyAppBinsFolder}\sendto\sendto\HEX Editor\WinHex"; Filename: "{#MyAppToolsFolder}\HEX Editor\WinHex\winhex.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\WinHex"; Components: "hexeditor\winhex";   


