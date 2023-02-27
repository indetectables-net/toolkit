; ImpREC
[Components]
Name: "reverse\imprec"; Description: "ImpREC"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Reverse\ImpREC\*"; DestDir: "{#MyAppToolsFolder}\Reverse\ImpREC"; Components: "reverse\imprec"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\ImpREC"; Filename: "{#MyAppToolsFolder}\Reverse\ImpREC\ImpREC - 1.7f\ImportREC.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\ImpREC\ImpREC - 1.7f"; Components: "reverse\imprec";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Reverse\ImpREC"; Filename: "{#MyAppToolsFolder}\Reverse\ImpREC\ImpREC - 1.7f\ImportREC.exe"; WorkingDir: "{#MyAppToolsFolder}\Reverse\ImpREC\ImpREC - 1.7f"; Components: "reverse\imprec";    


