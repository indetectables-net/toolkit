; Api Monitor
[Components]
Name: "monitor\apimonitor"; Description: "Api Monitor"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Monitor\Api Monitor\*"; DestDir: "{#MyAppToolsFolder}\Monitor\Api Monitor"; Components: "monitor\apimonitor"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\Api Monitor x64"; Filename: "{#MyAppToolsFolder}\Monitor\Api Monitor\apimonitor-x64.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Api Monitor"; Components: "monitor\apimonitor";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Monitor\Api Monitor x64"; Filename: "{#MyAppToolsFolder}\Monitor\Api Monitor\apimonitor-x64.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Api Monitor"; Components: "monitor\apimonitor";   Check: Is64BitInstallMode; 

[Icons]
Name: "{group}\Api Monitor"; Filename: "{#MyAppToolsFolder}\Monitor\Api Monitor\apimonitor-x86.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Api Monitor"; Components: "monitor\apimonitor";   Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Monitor\Api Monitor"; Filename: "{#MyAppToolsFolder}\Monitor\Api Monitor\apimonitor-x86.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Api Monitor"; Components: "monitor\apimonitor";   Check: not Is64BitInstallMode; 



; Autoruns
[Components]
Name: "monitor\autoruns"; Description: "Autoruns"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Monitor\Autoruns\*"; DestDir: "{#MyAppToolsFolder}\Monitor\Autoruns"; Components: "monitor\autoruns"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\Autoruns"; Filename: "{#MyAppToolsFolder}\Monitor\Autoruns\Autoruns.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Autoruns"; Components: "monitor\autoruns";   Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Monitor\Autoruns"; Filename: "{#MyAppToolsFolder}\Monitor\Autoruns\Autoruns.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Autoruns"; Components: "monitor\autoruns";   Check: not Is64BitInstallMode; 

[Icons]
Name: "{group}\Autoruns x64"; Filename: "{#MyAppToolsFolder}\Monitor\Autoruns\Autoruns64.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Autoruns"; Components: "monitor\autoruns";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Monitor\Autoruns x64"; Filename: "{#MyAppToolsFolder}\Monitor\Autoruns\Autoruns64.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Autoruns"; Components: "monitor\autoruns";   Check: Is64BitInstallMode; 



; CurrPorts
[Components]
Name: "monitor\currports"; Description: "CurrPorts"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Monitor\CurrPorts\*"; DestDir: "{#MyAppToolsFolder}\Monitor\CurrPorts"; Components: "monitor\currports"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\CurrPorts"; Filename: "{#MyAppToolsFolder}\Monitor\CurrPorts\cports.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\CurrPorts"; Components: "monitor\currports";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Monitor\CurrPorts"; Filename: "{#MyAppToolsFolder}\Monitor\CurrPorts\cports.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\CurrPorts"; Components: "monitor\currports";    



; PE-sieve
[Components]
Name: "monitor\pesieve"; Description: "PE-sieve"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Monitor\PE-sieve\*"; DestDir: "{#MyAppToolsFolder}\Monitor\PE-sieve"; Components: "monitor\pesieve"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\PE-sieve x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\PE-sieve"; Components: "monitor\pesieve"; Parameters: "/K ""{#MyAppToolsFolder}\Monitor\PE-sieve\pe-sieve.exe"""; IconFilename: "{#MyAppToolsFolder}\Monitor\PE-sieve\pe-sieve.exe"; Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Monitor\PE-sieve x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\PE-sieve"; Components: "monitor\pesieve"; Parameters: "/K ""{#MyAppToolsFolder}\Monitor\PE-sieve\pe-sieve.exe"""; IconFilename: "{#MyAppToolsFolder}\Monitor\PE-sieve\pe-sieve.exe"; Check: Is64BitInstallMode; 



; Portmon
[Components]
Name: "monitor\portmon"; Description: "Portmon"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Monitor\Portmon\*"; DestDir: "{#MyAppToolsFolder}\Monitor\Portmon"; Components: "monitor\portmon"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\Portmon"; Filename: "{#MyAppToolsFolder}\Monitor\Portmon\portmon.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Portmon"; Components: "monitor\portmon";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Monitor\Portmon"; Filename: "{#MyAppToolsFolder}\Monitor\Portmon\portmon.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Portmon"; Components: "monitor\portmon";    



; Process Explorer
[Components]
Name: "monitor\processexplorer"; Description: "Process Explorer"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Monitor\Process Explorer\*"; DestDir: "{#MyAppToolsFolder}\Monitor\Process Explorer"; Components: "monitor\processexplorer"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\Process Explorer"; Filename: "{#MyAppToolsFolder}\Monitor\Process Explorer\procexp.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Process Explorer"; Components: "monitor\processexplorer";   Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Monitor\Process Explorer"; Filename: "{#MyAppToolsFolder}\Monitor\Process Explorer\procexp.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Process Explorer"; Components: "monitor\processexplorer";   Check: not Is64BitInstallMode; 

[Icons]
Name: "{group}\Process Explorer x64"; Filename: "{#MyAppToolsFolder}\Monitor\Process Explorer\procexp64.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Process Explorer"; Components: "monitor\processexplorer";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Monitor\Process Explorer x64"; Filename: "{#MyAppToolsFolder}\Monitor\Process Explorer\procexp64.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Process Explorer"; Components: "monitor\processexplorer";   Check: Is64BitInstallMode; 



; Procmon
[Components]
Name: "monitor\procmon"; Description: "Procmon"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Monitor\Procmon\*"; DestDir: "{#MyAppToolsFolder}\Monitor\Procmon"; Components: "monitor\procmon"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\Procmon"; Filename: "{#MyAppToolsFolder}\Monitor\Procmon\Procmon.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Procmon"; Components: "monitor\procmon";   Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Monitor\Procmon"; Filename: "{#MyAppToolsFolder}\Monitor\Procmon\Procmon.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Procmon"; Components: "monitor\procmon";   Check: not Is64BitInstallMode; 

[Icons]
Name: "{group}\Procmon x64"; Filename: "{#MyAppToolsFolder}\Monitor\Procmon\Procmon64.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Procmon"; Components: "monitor\procmon";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Monitor\Procmon x64"; Filename: "{#MyAppToolsFolder}\Monitor\Procmon\Procmon64.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\Procmon"; Components: "monitor\procmon";   Check: Is64BitInstallMode; 



; RegistryChangesView
[Components]
Name: "monitor\registrychangesview"; Description: "RegistryChangesView"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Monitor\RegistryChangesView\*"; DestDir: "{#MyAppToolsFolder}\Monitor\RegistryChangesView"; Components: "monitor\registrychangesview"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\RegistryChangesView"; Filename: "{#MyAppToolsFolder}\Monitor\RegistryChangesView\RegistryChangesView.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\RegistryChangesView"; Components: "monitor\registrychangesview";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Monitor\RegistryChangesView"; Filename: "{#MyAppToolsFolder}\Monitor\RegistryChangesView\RegistryChangesView.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\RegistryChangesView"; Components: "monitor\registrychangesview";    



; System Informer
[Components]
Name: "monitor\systeminformer"; Description: "System Informer"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Monitor\System Informer\*"; DestDir: "{#MyAppToolsFolder}\Monitor\System Informer"; Components: "monitor\systeminformer"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\System Informer x64"; Filename: "{#MyAppToolsFolder}\Monitor\System Informer\amd64\SystemInformer.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\System Informer\amd64"; Components: "monitor\systeminformer";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Monitor\System Informer x64"; Filename: "{#MyAppToolsFolder}\Monitor\System Informer\amd64\SystemInformer.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\System Informer\amd64"; Components: "monitor\systeminformer";   Check: Is64BitInstallMode; 

[Icons]
Name: "{group}\System Informer"; Filename: "{#MyAppToolsFolder}\Monitor\System Informer\i386\SystemInformer.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\System Informer\i386"; Components: "monitor\systeminformer";   Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Monitor\System Informer"; Filename: "{#MyAppToolsFolder}\Monitor\System Informer\i386\SystemInformer.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\System Informer\i386"; Components: "monitor\systeminformer";   Check: not Is64BitInstallMode; 



; TCPView
[Components]
Name: "monitor\tcpview"; Description: "TCPView"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Monitor\TCPView\*"; DestDir: "{#MyAppToolsFolder}\Monitor\TCPView"; Components: "monitor\tcpview"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\TCPView"; Filename: "{#MyAppToolsFolder}\Monitor\TCPView\tcpview.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\TCPView"; Components: "monitor\tcpview";   Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Monitor\TCPView"; Filename: "{#MyAppToolsFolder}\Monitor\TCPView\tcpview.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\TCPView"; Components: "monitor\tcpview";   Check: not Is64BitInstallMode; 

[Icons]
Name: "{group}\TCPView x64"; Filename: "{#MyAppToolsFolder}\Monitor\TCPView\tcpview64.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\TCPView"; Components: "monitor\tcpview";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Monitor\TCPView x64"; Filename: "{#MyAppToolsFolder}\Monitor\TCPView\tcpview64.exe"; WorkingDir: "{#MyAppToolsFolder}\Monitor\TCPView"; Components: "monitor\tcpview";   Check: Is64BitInstallMode; 


