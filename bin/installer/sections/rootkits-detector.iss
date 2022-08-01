; GMER
[Components]
Name: "rootkitsdetector\gmer"; Description: "GMER"; Types: full compact; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Rootkits Detector\GMER\*"; DestDir: "{#MyAppToolsFolder}\Rootkits Detector\GMER"; Components: "rootkitsdetector\gmer"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\GMER"; Filename: "{#MyAppToolsFolder}\Rootkits Detector\GMER\gmer.exe"; WorkingDir: "{#MyAppToolsFolder}\Rootkits Detector\GMER"; Components: "rootkitsdetector\gmer";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Rootkits Detector\GMER"; Filename: "{#MyAppToolsFolder}\Rootkits Detector\GMER\gmer.exe"; WorkingDir: "{#MyAppToolsFolder}\Rootkits Detector\GMER"; Components: "rootkitsdetector\gmer";    



; Sysinspector
[Components]
Name: "rootkitsdetector\sysinspector"; Description: "Sysinspector"; Types: full compact; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Rootkits Detector\Sysinspector\*"; DestDir: "{#MyAppToolsFolder}\Rootkits Detector\Sysinspector"; Components: "rootkitsdetector\sysinspector"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\Sysinspector x64"; Filename: "{#MyAppToolsFolder}\Rootkits Detector\Sysinspector\sysinspector_nt64_enu.exe"; WorkingDir: "{#MyAppToolsFolder}\Rootkits Detector\Sysinspector"; Components: "rootkitsdetector\sysinspector";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Rootkits Detector\Sysinspector x64"; Filename: "{#MyAppToolsFolder}\Rootkits Detector\Sysinspector\sysinspector_nt64_enu.exe"; WorkingDir: "{#MyAppToolsFolder}\Rootkits Detector\Sysinspector"; Components: "rootkitsdetector\sysinspector";   Check: Is64BitInstallMode; 



; Windows Kernel Explorer
[Components]
Name: "rootkitsdetector\windowskernelexplorer"; Description: "Windows Kernel Explorer"; Types: full; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Rootkits Detector\Windows Kernel Explorer\*"; DestDir: "{#MyAppToolsFolder}\Rootkits Detector\Windows Kernel Explorer"; Components: "rootkitsdetector\windowskernelexplorer"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\Windows Kernel Explorer x64"; Filename: "{#MyAppToolsFolder}\Rootkits Detector\Windows Kernel Explorer\WKE64.exe"; WorkingDir: "{#MyAppToolsFolder}\Rootkits Detector\Windows Kernel Explorer"; Components: "rootkitsdetector\windowskernelexplorer";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Rootkits Detector\Windows Kernel Explorer x64"; Filename: "{#MyAppToolsFolder}\Rootkits Detector\Windows Kernel Explorer\WKE64.exe"; WorkingDir: "{#MyAppToolsFolder}\Rootkits Detector\Windows Kernel Explorer"; Components: "rootkitsdetector\windowskernelexplorer";   Check: Is64BitInstallMode; 


