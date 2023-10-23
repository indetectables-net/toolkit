; Add SendTo+ to sendTo folder
[Components]
Name: "extras\sendto"; Description: "Add toolkit menu to ""Send To"""; Types: full compact; 

[Icons]
; x64
Name: "{userappdata}\Microsoft\Windows\SendTo\{#MyAppNameOriginal}"; Filename: "{#MyAppBinsFolder}\sendto\sendto_x64.exe"; WorkingDir: "{#MyAppBinsFolder}\sendto\"; IconFilename: "{#MyAppToolsIconsFolder}\toolkit.ico"; Components: "extras\sendto"; Check: Is64BitInstallMode;

; x32
Name: "{userappdata}\Microsoft\Windows\SendTo\{#MyAppNameOriginal}"; Filename: "{#MyAppBinsFolder}\sendto\sendto_x86.exe"; WorkingDir: "{#MyAppBinsFolder}\sendto\"; IconFilename: "{#MyAppToolsIconsFolder}\toolkit.ico"; Components: "extras\sendto"; Check: not Is64BitInstallMode;



; Add SendTo+ to context menu
; from https://www.online-tech-tips.com/computer-tips/windows-right-click-context-menu/
[Components]
Name: "extras\contextmenu"; Description: "Add toolkit menu to context menu"; Types: full compact; 

; this code need to run with admin priv!
[Registry]
Root: "HKCR"; Subkey: "*\shell\IndetectablesToolkit"; ValueType: none; ValueName: ""; ValueData: ""; Components: "extras\contextmenu"; Flags: uninsdeletekey;
Root: "HKCR"; Subkey: "*\shell\IndetectablesToolkit"; ValueType: string; ValueName: ""; ValueData: "Indetectables Toolkit"; Components: "extras\contextmenu"; Flags: uninsdeletekey;
Root: "HKCR"; Subkey: "*\shell\IndetectablesToolkit"; ValueType: string; ValueName: "Icon"; ValueData: "{#MyAppToolsIconsFolder}\toolkit.ico"; Components: "extras\contextmenu"; Flags: uninsdeletekey;
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
Filename: "{#MyAppBinsFolder}\choco\installChocolatey.cmd"; Components: "extras\choco or extras\javajre or extras\python or extras\openhashtab or extras\winmerge"; Flags: shellexec waituntilterminated;


; Install Java JRE
[Components]
Name: "extras\javajre"; Description: "Install Java Oracle JRE 8 (via Chocolatey)"; ExtraDiskSpaceRequired: 220200960; Types: full compact; 

[Run]
Filename: "{sd}\ProgramData\chocolatey\bin\choco.exe"; Parameters: "install -y jre8"; Components: "extras\javajre"; Flags: shellexec waituntilterminated;


; Install Python
[Components]
Name: "extras\python"; Description: "Install Python 3 (via Chocolatey)"; ExtraDiskSpaceRequired: 104857600; Types: full; 

[Run]
Filename: "{sd}\ProgramData\chocolatey\bin\choco.exe"; Parameters: "install -y python"; Components: "extras\python"; Flags: shellexec waituntilterminated;


; Install OpenHashTab
[Components]
Name: "extras\openhashtab"; Description: "Install OpenHashTab (via Chocolatey)"; ExtraDiskSpaceRequired: 6291456; Types: full; 

[Run]
Filename: "{sd}\ProgramData\chocolatey\bin\choco.exe"; Parameters: "install -y openhashtab"; Components: "extras\openhashtab"; Flags: shellexec waituntilterminated;


; Install WinMerge
[Components]
Name: "extras\winmerge"; Description: "Install WinMerge (via Chocolatey)"; ExtraDiskSpaceRequired: 24117248; Types: full; 

[Run]
Filename: "{sd}\ProgramData\chocolatey\bin\choco.exe"; Parameters: "install -y winmerge"; Components: "extras\winmerge"; Flags: shellexec waituntilterminated;


; Install Windows Terminal
[Components]
Name: "extras\terminal"; Description: "Install new Windows Terminal (via Chocolatey)"; ExtraDiskSpaceRequired: 31457280; Types: full; 

[Run]
Filename: "{sd}\ProgramData\chocolatey\bin\choco.exe"; Parameters: "install -y microsoft-windows-terminal"; Components: "extras\terminal"; Flags: shellexec waituntilterminated;


; Install Visual C++ Redistributable packages
[Components]
Name: "extras\vcredist"; Description: "Install Visual C++ Redist 2008, 2013, 2015-2022 (via Chocolatey)"; ExtraDiskSpaceRequired: 52428800; Types: full; 

[Run]
Filename: "{sd}\ProgramData\chocolatey\bin\choco.exe"; Parameters: "install -y vcredist2008 vcredist2013 vcredist140"; Components: "extras\vcredist"; Flags: shellexec waituntilterminated;
