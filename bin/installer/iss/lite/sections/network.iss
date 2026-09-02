; Main section
[Files]
Source: "{#MySrcDir}\toolkit\Network\desktop.ini"; DestDir: "{#MyAppBinsFolder}\sendto\sendto\Network"; Components: "network"; Attribs: hidden system; Flags: ignoreversion;
Source: "{#MySrcDir}\toolkit\Network\folder.ico"; DestDir: "{#MyAppBinsFolder}\sendto\sendto\Network"; Components: "network"; Attribs: hidden; Flags: ignoreversion;

[Run]
Filename: "{sys}\attrib.exe"; Parameters: "+r ""{#MyAppBinsFolder}\sendto\sendto\Network"""; Components: "network"; Flags: runhidden;



; CurrPorts
[Components]
Name: "network\currports"; Description: "CurrPorts"; Types: full;

[Files]
Source: "{#MySrcDir}\toolkit\Network\CurrPorts\*"; DestDir: "{#MyAppToolsFolder}\Network\CurrPorts"; Components: "network\currports"; Flags: ignoreversion recursesubdirs createallsubdirs;

[Icons]
Name: "{group}\CurrPorts"; Filename: "{#MyAppToolsFolder}\Network\CurrPorts\cports.exe"; WorkingDir: "{#MyAppToolsFolder}\Network\CurrPorts"; Components: "network\currports";
Name: "{#MyAppBinsFolder}\sendto\sendto\Network\CurrPorts"; Filename: "{#MyAppToolsFolder}\Network\CurrPorts\cports.exe"; WorkingDir: "{#MyAppToolsFolder}\Network\CurrPorts"; Components: "network\currports";



; Fiddler
[Components]
Name: "network\fiddler"; Description: "Fiddler"; Types: full;

[Files]
Source: "{#MySrcDir}\toolkit\Network\Fiddler\*"; DestDir: "{#MyAppToolsFolder}\Network\Fiddler"; Components: "network\fiddler"; Flags: ignoreversion recursesubdirs createallsubdirs;

[Icons]
Name: "{group}\Fiddler"; Filename: "{#MyAppToolsFolder}\Network\Fiddler\Fiddler.exe"; WorkingDir: "{#MyAppToolsFolder}\Network\Fiddler"; Components: "network\fiddler";
Name: "{#MyAppBinsFolder}\sendto\sendto\Network\Fiddler"; Filename: "{#MyAppToolsFolder}\Network\Fiddler\Fiddler.exe"; WorkingDir: "{#MyAppToolsFolder}\Network\Fiddler"; Components: "network\fiddler";



; RawCap
[Components]
Name: "network\rawcap"; Description: "RawCap"; Types: full compact;

[Files]
Source: "{#MySrcDir}\toolkit\Network\RawCap\*"; DestDir: "{#MyAppToolsFolder}\Network\RawCap"; Components: "network\rawcap"; Flags: ignoreversion recursesubdirs createallsubdirs;

[Icons]
Name: "{group}\RawCap"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Network\RawCap"; Components: "network\rawcap"; Parameters: "/K ""{#MyAppToolsFolder}\Network\RawCap\RawCap.exe"""; IconFilename: "{#MyAppToolsFolder}\Network\RawCap\RawCap.exe";
Name: "{#MyAppBinsFolder}\sendto\sendto\Network\RawCap"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Network\RawCap"; Components: "network\rawcap"; Parameters: "/K ""{#MyAppToolsFolder}\Network\RawCap\RawCap.exe"""; IconFilename: "{#MyAppToolsFolder}\Network\RawCap\RawCap.exe";



; TCPView
[Components]
Name: "network\tcpview"; Description: "TCPView"; Types: full compact;

[Files]
Source: "{#MySrcDir}\toolkit\Network\TCPView\*"; DestDir: "{#MyAppToolsFolder}\Network\TCPView"; Components: "network\tcpview"; Flags: ignoreversion recursesubdirs createallsubdirs;

[Icons]
Name: "{group}\TCPView"; Filename: "{#MyAppToolsFolder}\Network\TCPView\tcpview.exe"; WorkingDir: "{#MyAppToolsFolder}\Network\TCPView"; Components: "network\tcpview";   Check: not Is64BitInstallMode;
Name: "{#MyAppBinsFolder}\sendto\sendto\Network\TCPView"; Filename: "{#MyAppToolsFolder}\Network\TCPView\tcpview.exe"; WorkingDir: "{#MyAppToolsFolder}\Network\TCPView"; Components: "network\tcpview";   Check: not Is64BitInstallMode;

[Icons]
Name: "{group}\TCPView x64"; Filename: "{#MyAppToolsFolder}\Network\TCPView\tcpview64.exe"; WorkingDir: "{#MyAppToolsFolder}\Network\TCPView"; Components: "network\tcpview";   Check: Is64BitInstallMode;
Name: "{#MyAppBinsFolder}\sendto\sendto\Network\TCPView x64"; Filename: "{#MyAppToolsFolder}\Network\TCPView\tcpview64.exe"; WorkingDir: "{#MyAppToolsFolder}\Network\TCPView"; Components: "network\tcpview";   Check: Is64BitInstallMode;

