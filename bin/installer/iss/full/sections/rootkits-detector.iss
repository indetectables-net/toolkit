; Main section
[Files]
Source: "{#MySrcDir}\toolkit\Rootkits Detector\desktop.ini"; DestDir: "{#MyAppBinsFolder}\sendto\sendto\Rootkits Detector"; Components: "rootkitsdetector"; Attribs: hidden system; Flags: ignoreversion; 
Source: "{#MySrcDir}\toolkit\Rootkits Detector\folder.ico"; DestDir: "{#MyAppBinsFolder}\sendto\sendto\Rootkits Detector"; Components: "rootkitsdetector"; Attribs: hidden; Flags: ignoreversion; 

[Run]
Filename: "{sys}\attrib.exe"; Parameters: "+r ""{#MyAppBinsFolder}\sendto\sendto\Rootkits Detector"""; Components: "rootkitsdetector"; Flags: runhidden; 



; DeepTaskScan
[Components]
Name: "rootkitsdetector\deeptaskscan"; Description: "DeepTaskScan"; Types: full;

[Files]
Source: "{#MySrcDir}\toolkit\Rootkits Detector\DeepTaskScan\*"; DestDir: "{#MyAppToolsFolder}\Rootkits Detector\DeepTaskScan"; Components: "rootkitsdetector\deeptaskscan"; Flags: ignoreversion recursesubdirs createallsubdirs;

[Icons]
Name: "{group}\DeepTaskScan"; Filename: "{#MyAppToolsFolder}\Rootkits Detector\DeepTaskScan\DeepTaskScan64.exe"; WorkingDir: "{#MyAppToolsFolder}\Rootkits Detector\DeepTaskScan"; Components: "rootkitsdetector\deeptaskscan";
Name: "{#MyAppBinsFolder}\sendto\sendto\Rootkits Detector\DeepTaskScan"; Filename: "{#MyAppToolsFolder}\Rootkits Detector\DeepTaskScan\DeepTaskScan64.exe"; WorkingDir: "{#MyAppToolsFolder}\Rootkits Detector\DeepTaskScan"; Components: "rootkitsdetector\deeptaskscan";



; GMER
[Components]
Name: "rootkitsdetector\gmer"; Description: "GMER"; Types: full compact;

[Files]
Source: "{#MySrcDir}\toolkit\Rootkits Detector\GMER\*"; DestDir: "{#MyAppToolsFolder}\Rootkits Detector\GMER"; Components: "rootkitsdetector\gmer"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\GMER"; Filename: "{#MyAppToolsFolder}\Rootkits Detector\GMER\gmer.exe"; WorkingDir: "{#MyAppToolsFolder}\Rootkits Detector\GMER"; Components: "rootkitsdetector\gmer";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Rootkits Detector\GMER"; Filename: "{#MyAppToolsFolder}\Rootkits Detector\GMER\gmer.exe"; WorkingDir: "{#MyAppToolsFolder}\Rootkits Detector\GMER"; Components: "rootkitsdetector\gmer";    



; Sysinspector
[Components]
Name: "rootkitsdetector\sysinspector"; Description: "Sysinspector"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Rootkits Detector\Sysinspector\*"; DestDir: "{#MyAppToolsFolder}\Rootkits Detector\Sysinspector"; Components: "rootkitsdetector\sysinspector"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\Sysinspector x64"; Filename: "{#MyAppToolsFolder}\Rootkits Detector\Sysinspector\sysinspector_nt64.exe"; WorkingDir: "{#MyAppToolsFolder}\Rootkits Detector\Sysinspector"; Components: "rootkitsdetector\sysinspector";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Rootkits Detector\Sysinspector x64"; Filename: "{#MyAppToolsFolder}\Rootkits Detector\Sysinspector\sysinspector_nt64.exe"; WorkingDir: "{#MyAppToolsFolder}\Rootkits Detector\Sysinspector"; Components: "rootkitsdetector\sysinspector";   Check: Is64BitInstallMode; 



; Windows Kernel Explorer
[Components]
Name: "rootkitsdetector\windowskernelexplorer"; Description: "Windows Kernel Explorer"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Rootkits Detector\Windows Kernel Explorer\*"; DestDir: "{#MyAppToolsFolder}\Rootkits Detector\Windows Kernel Explorer"; Components: "rootkitsdetector\windowskernelexplorer"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\Windows Kernel Explorer x64"; Filename: "{#MyAppToolsFolder}\Rootkits Detector\Windows Kernel Explorer\WKE64.exe"; WorkingDir: "{#MyAppToolsFolder}\Rootkits Detector\Windows Kernel Explorer"; Components: "rootkitsdetector\windowskernelexplorer";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Rootkits Detector\Windows Kernel Explorer x64"; Filename: "{#MyAppToolsFolder}\Rootkits Detector\Windows Kernel Explorer\WKE64.exe"; WorkingDir: "{#MyAppToolsFolder}\Rootkits Detector\Windows Kernel Explorer"; Components: "rootkitsdetector\windowskernelexplorer";   Check: Is64BitInstallMode;



; WMISubscriptionsView
[Components]
Name: "rootkitsdetector\wmisubscriptionsview"; Description: "WMISubscriptionsView"; Types: full;

[Files]
Source: "{#MySrcDir}\toolkit\Rootkits Detector\WMISubscriptionsView\*"; DestDir: "{#MyAppToolsFolder}\Rootkits Detector\WMISubscriptionsView"; Components: "rootkitsdetector\wmisubscriptionsview"; Flags: ignoreversion recursesubdirs createallsubdirs;

[Icons]
Name: "{group}\WMISubscriptionsView"; Filename: "{#MyAppToolsFolder}\Rootkits Detector\WMISubscriptionsView\WMISubscriptionsView.exe"; WorkingDir: "{#MyAppToolsFolder}\Rootkits Detector\WMISubscriptionsView"; Components: "rootkitsdetector\wmisubscriptionsview";
Name: "{#MyAppBinsFolder}\sendto\sendto\Rootkits Detector\WMISubscriptionsView"; Filename: "{#MyAppToolsFolder}\Rootkits Detector\WMISubscriptionsView\WMISubscriptionsView.exe"; WorkingDir: "{#MyAppToolsFolder}\Rootkits Detector\WMISubscriptionsView"; Components: "rootkitsdetector\wmisubscriptionsview";


