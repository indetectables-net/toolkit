; HxD
[Components]
Name: "hexeditor\hxd"; Description: "HxD"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\HEX Editor\HxD\*"; DestDir: "{#MyAppToolsFolder}\HEX Editor\HxD"; Components: "hexeditor\hxd"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\HxD"; Filename: "{#MyAppToolsFolder}\HEX Editor\HxD\HxD32.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\HxD"; Components: "hexeditor\hxd";   Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\HEX Editor\HxD"; Filename: "{#MyAppToolsFolder}\HEX Editor\HxD\HxD32.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\HxD"; Components: "hexeditor\hxd";   Check: not Is64BitInstallMode; 

[Icons]
Name: "{group}\HxD x64"; Filename: "{#MyAppToolsFolder}\HEX Editor\HxD\HxD64.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\HxD"; Components: "hexeditor\hxd";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\HEX Editor\HxD x64"; Filename: "{#MyAppToolsFolder}\HEX Editor\HxD\HxD64.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\HxD"; Components: "hexeditor\hxd";   Check: Is64BitInstallMode; 



; ImHex
[Components]
Name: "hexeditor\imhex"; Description: "ImHex"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\HEX Editor\ImHex\*"; DestDir: "{#MyAppToolsFolder}\HEX Editor\ImHex"; Components: "hexeditor\imhex"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\ImHex x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\ImHex"; Components: "hexeditor\imhex"; Parameters: "/K ""{#MyAppToolsFolder}\HEX Editor\ImHex\imhex-gui.exe"""; IconFilename: "{#MyAppToolsFolder}\HEX Editor\ImHex\imhex-gui.exe"; Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\HEX Editor\ImHex x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\ImHex"; Components: "hexeditor\imhex"; Parameters: "/K ""{#MyAppToolsFolder}\HEX Editor\ImHex\imhex-gui.exe"""; IconFilename: "{#MyAppToolsFolder}\HEX Editor\ImHex\imhex-gui.exe"; Check: Is64BitInstallMode; 



; REHex
[Components]
Name: "hexeditor\rehex"; Description: "REHex"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\HEX Editor\REHex\*"; DestDir: "{#MyAppToolsFolder}\HEX Editor\REHex"; Components: "hexeditor\rehex"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\REHex x64"; Filename: "{#MyAppToolsFolder}\HEX Editor\REHex\rehex.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\REHex"; Components: "hexeditor\rehex";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\HEX Editor\REHex x64"; Filename: "{#MyAppToolsFolder}\HEX Editor\REHex\rehex.exe"; WorkingDir: "{#MyAppToolsFolder}\HEX Editor\REHex"; Components: "hexeditor\rehex";   Check: Is64BitInstallMode; 


