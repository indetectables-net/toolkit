; Updater
[Components]
Name: "updater\main"; Description: "Updater"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\bin\updater\*"; DestDir: "{#MyAppBinsFolder}\updater"; Components: "updater\main"; Flags: ignoreversion recursesubdirs createallsubdirs;
Source: "{#MySrcDir}\bin\auto-config-tools\*"; DestDir: "{#MyAppBinsFolder}\auto-config-tools"; Components: "updater\main"; Flags: ignoreversion recursesubdirs createallsubdirs;

[Icons]
Name: "{group}\{#MyAppName}\Toolkit Updater"; Filename: "{#MyAppBinsFolder}\updater\updater.exe"; WorkingDir: "{#MyAppBinsFolder}\updater"; Components: "updater\main"; 
Name: "{userdesktop}\{#MyAppName}\Toolkit Updater"; Filename: "{#MyAppBinsFolder}\updater\updater.exe"; WorkingDir: "{#MyAppBinsFolder}\updater"; Components: "updater\main"; 

; Fix default update config
[INI]
Filename: {#MyAppBinsFolder}\updater\tools.ini; Section: Updater; Key: disable_clean; String: True
Filename: {#MyAppBinsFolder}\updater\tools.ini; Section: Updater; Key: disable_repack; String: True

; Clean dont selected tools in tools.ini
[Run]
Filename: "{#MyAppBinsFolder}\auto-config-tools\auto-config-tools.exe"; Parameters: "/FOLDER={#MyAppBinsFolder}\updater"; Flags: runhidden;



; Add Task Schedule
[Components]
Name: "updater\task"; Description: "Add Updater Task Schedule"; Types: full compact; 

[Run]
Filename: "{sys}\schtasks.exe"; Parameters: "/CREATE /SC WEEKLY /TN 'IndetectablesToolkit_Updater' /TR '{#MyAppBinsFolder}\updater\hstart.exe /NOCONSOLE {#MyAppBinsFolder}\updater\updater.exe'"; Flags: runhidden;

[UninstallRun]
Filename: "{sys}\schtasks.exe"; Parameters: "/Delete /TN 'IndetectablesToolkit_Updater' /F"; Flags: runhidden
