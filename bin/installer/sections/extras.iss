; Add SendTo+ to sendTo folder
[Components]
Name: "extras\sendto"; Description: "Add toolkit menu to ""Send To"""; Types: full compact; 

[Icons]
; x64
Name: "{userappdata}\Microsoft\Windows\SendTo\{#MyAppName}"; Filename: "{#MyAppBinsFolder}\sendto\sendto_x64.exe"; WorkingDir: "{#MyAppBinsFolder}\sendto\"; IconFilename: "{#MyAppBinsFolder}\sendto\toolkit.ico"; Components: "extras\sendto"; Check: Is64BitInstallMode;

; x32
Name: "{userappdata}\Microsoft\Windows\SendTo\{#MyAppName}"; Filename: "{#MyAppBinsFolder}\sendto\sendto_x86.exe"; WorkingDir: "{#MyAppBinsFolder}\sendto\"; IconFilename: "{#MyAppBinsFolder}\sendto\toolkit.ico"; Components: "extras\sendto"; Check: not Is64BitInstallMode;



; Add SendTo+ to context menu
; from https://www.online-tech-tips.com/computer-tips/windows-right-click-context-menu/
[Components]
Name: "extras\contextmenu"; Description: "Add toolkit menu to context menu"; Types: full compact; 

; this code need to run with admin priv!
[Registry]
Root: "HKCR"; Subkey: "*\shell\IndetectablesToolkit"; ValueType: none; ValueName: ""; ValueData: ""; Components: "extras\contextmenu"; Flags: uninsdeletekey;
Root: "HKCR"; Subkey: "*\shell\IndetectablesToolkit"; ValueType: string; ValueName: ""; ValueData: "Indetectables Toolkit"; Components: "extras\contextmenu"; Flags: uninsdeletekey;
Root: "HKCR"; Subkey: "*\shell\IndetectablesToolkit"; ValueType: string; ValueName: "Icon"; ValueData: "{#MyAppBinsFolder}\sendto\toolkit.ico"; Components: "extras\contextmenu"; Flags: uninsdeletekey;
;Root: "HKCR"; Subkey: "*\shell\IndetectablesToolkit"; ValueType: string; ValueName: "SeparatorBefore"; ValueData: ""; Components: "extras\contextmenu"; Flags: uninsdeletekey;
;Root: "HKCR"; Subkey: "*\shell\IndetectablesToolkit"; ValueType: string; ValueName: "SeparatorAfter"; ValueData: ""; Components: "extras\contextmenu"; Flags: uninsdeletekey;

; x64
Root: "HKCR"; Subkey: "*\shell\IndetectablesToolkit\command"; ValueType: string; ValueName: ""; ValueData: """{#MyAppBinsFolder}\hstart\hstart64.exe"" /SHELL /D=""{#MyAppBinsFolder}\sendto"" """"{#MyAppBinsFolder}\sendto\sendto_x64.exe"" ""%1"""""; Components: "extras\contextmenu"; Flags: uninsdeletekey; Check: Is64BitInstallMode;

; x32
Root: "HKCR"; Subkey: "*\shell\IndetectablesToolkit\command"; ValueType: string; ValueName: ""; ValueData: """{#MyAppBinsFolder}\hstart\hstart.exe"" /SHELL /D=""{#MyAppBinsFolder}\sendto"" """"{#MyAppBinsFolder}\sendto\sendto_x86.exe"" ""%1"""""; Components: "extras\contextmenu"; Flags: uninsdeletekey; Check: not Is64BitInstallMode;



;;;;;;;;;;;;;;;;;;;;;;;;
; Chocolatey packages
;;;;;;;;;;;;;;;;;;;;;;;;

; Install Choco
[Components]
Name: "extras\choco"; Description: "Install Chocolatey package manager"; ExtraDiskSpaceRequired: 16777216; Types: full compact; 

[Files]
Source: "{#MySrcDir}\bin\choco\*"; DestDir: "{#MyAppBinsFolder}\choco"; Components: "extras\choco"; Flags: ignoreversion recursesubdirs createallsubdirs;

[Run]
Filename: "{#MyAppBinsFolder}\choco\installChocolatey.cmd"; Components: "extras\choco or extras\javase or extras\python or decompilers\ghidra"; Flags: shellexec waituntilterminated;



; Install Java
[Components]
Name: "extras\javase"; Description: "Install Java 8 Runtime Environment (via Chocolatey)"; ExtraDiskSpaceRequired: 220200960; Types: full compact; 

[Run]
Filename: "{sd}\ProgramData\chocolatey\bin\choco.exe"; Parameters: "install -y jre8"; Components: "extras\javase"; Flags: shellexec waituntilterminated;



; Install Python
[Components]
Name: "extras\python"; Description: "Install Python 3.x (via Chocolatey)"; ExtraDiskSpaceRequired: 104857600; Types: full compact; 

[Run]
Filename: "{sd}\ProgramData\chocolatey\bin\choco.exe"; Parameters: "install -y python"; Components: "extras\python"; Flags: shellexec waituntilterminated;

