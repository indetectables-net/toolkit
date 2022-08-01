; AT4RE Patcher
[Components]
Name: "patcher\at4repatcher"; Description: "AT4RE Patcher"; Types: full; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Patcher\AT4RE Patcher\*"; DestDir: "{#MyAppToolsFolder}\Patcher\AT4RE Patcher"; Components: "patcher\at4repatcher"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\AT4RE Patcher"; Filename: "{#MyAppToolsFolder}\Patcher\AT4RE Patcher\AT4RE Patcher - 0.7.6\AT4RE Patcher.exe"; WorkingDir: "{#MyAppToolsFolder}\Patcher\AT4RE Patcher\AT4RE Patcher - 0.7.6"; Components: "patcher\at4repatcher";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Patcher\AT4RE Patcher"; Filename: "{#MyAppToolsFolder}\Patcher\AT4RE Patcher\AT4RE Patcher - 0.7.6\AT4RE Patcher.exe"; WorkingDir: "{#MyAppToolsFolder}\Patcher\AT4RE Patcher\AT4RE Patcher - 0.7.6"; Components: "patcher\at4repatcher";    



; dUP
[Components]
Name: "patcher\dup"; Description: "dUP"; Types: full; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Patcher\dUP\*"; DestDir: "{#MyAppToolsFolder}\Patcher\dUP"; Components: "patcher\dup"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\dUP"; Filename: "{#MyAppToolsFolder}\Patcher\dUP\dUP - 2.26.1\dup2.exe"; WorkingDir: "{#MyAppToolsFolder}\Patcher\dUP\dUP - 2.26.1"; Components: "patcher\dup";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Patcher\dUP"; Filename: "{#MyAppToolsFolder}\Patcher\dUP\dUP - 2.26.1\dup2.exe"; WorkingDir: "{#MyAppToolsFolder}\Patcher\dUP\dUP - 2.26.1"; Components: "patcher\dup";    



; uPPP
[Components]
Name: "patcher\uppp"; Description: "uPPP"; Types: full; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Patcher\uPPP\*"; DestDir: "{#MyAppToolsFolder}\Patcher\uPPP"; Components: "patcher\uppp"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\uPPP"; Filename: "{#MyAppToolsFolder}\Patcher\uPPP\uPPP.exe"; WorkingDir: "{#MyAppToolsFolder}\Patcher\uPPP"; Components: "patcher\uppp";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Patcher\uPPP"; Filename: "{#MyAppToolsFolder}\Patcher\uPPP\uPPP.exe"; WorkingDir: "{#MyAppToolsFolder}\Patcher\uPPP"; Components: "patcher\uppp";    


