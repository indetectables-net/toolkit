; Updater
[Components]
Name: "updater\main"; Description: "Updater"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\bin\updater\*"; DestDir: "{#MyAppBinsFolder}\updater"; Components: "updater\main"; Flags: ignoreversion recursesubdirs createallsubdirs;
Source: "{#MySrcDir}\bin\auto-config-tools\*"; DestDir: "{#MyAppBinsFolder}\auto-config-tools"; Components: "updater\main"; Flags: ignoreversion recursesubdirs createallsubdirs;
Source: "{#MySrcDir}\bin\hstart\*"; Destdir: "{#MyAppBinsFolder}\hstart\"; Components: "updater\main"; Flags: ignoreversion recursesubdirs createallsubdirs;

[Icons]
Name: "{group}\{#MyAppName}\Toolkit Updater"; Filename: "{#MyAppBinsFolder}\updater\updater.exe"; WorkingDir: "{#MyAppBinsFolder}\updater"; Components: "updater\main";
Name: "{userdesktop}\{#MyAppName}\Toolkit Updater"; Filename: "{#MyAppBinsFolder}\updater\updater.exe"; WorkingDir: "{#MyAppBinsFolder}\updater"; Components: "updater\main";

; Fix default update config
[INI]
Filename: {#MyAppBinsFolder}\updater\tools.ini; Section: Updater; Key: disable_clean; String: True; Components: "updater\main"; 
Filename: {#MyAppBinsFolder}\updater\tools.ini; Section: Updater; Key: disable_repack; String: True; Components: "updater\main"; 

; Clean dont selected tools in tools.ini
[Run]
Filename: "{#MyAppBinsFolder}\auto-config-tools\auto-config-tools.exe"; Parameters: "/FOLDER={#MyAppBinsFolder}\updater"; Components: "updater\main"; Flags: runhidden;



; Add Task Schedule
[Components]
Name: "updater\task"; Description: "Add Updater Task Schedule"; Types: full compact; 

[Run]
Filename: "{sys}\schtasks.exe"; Parameters: "/Delete /TN IndetectablesToolkit_Updater /F"; Components: "updater\task"; Flags: runhidden; 
Filename: "{sys}\schtasks.exe"; Parameters: "/CREATE /SC WEEKLY /TN IndetectablesToolkit_Updater /TR ""'{#MyAppBinsFolder}\hstart\hstart.exe' /NOCONSOLE '{#MyAppBinsFolder}\updater\updater.exe'"""; Components: "updater\task"; Flags: runhidden;

[UninstallRun]
Filename: "{#MyAppBinsFolder}\hstart\hstart.exe"; Parameters: "/ELEVATE ""{sys}\schtasks.exe /Delete /TN IndetectablesToolkit_Updater /F"""; Components: "updater\task"; Flags: runhidden; 



; Execute updater on install finish
[Components]
Name: "updater\update"; Description: ""; Types: full compact; 

[Run]
Filename: "{#MyAppBinsFolder}\updater\updater.exe"; Components: "updater\update"; Description: "Execute updater on install finish"; Flags: postinstall nowait skipifsilent;
