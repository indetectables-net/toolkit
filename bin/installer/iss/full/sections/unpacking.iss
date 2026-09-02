; Main section
[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\desktop.ini"; DestDir: "{#MyAppBinsFolder}\sendto\sendto\UnPacking"; Components: "unpacking"; Attribs: hidden system; Flags: ignoreversion; 
Source: "{#MySrcDir}\toolkit\UnPacking\folder.ico"; DestDir: "{#MyAppBinsFolder}\sendto\sendto\UnPacking"; Components: "unpacking"; Attribs: hidden; Flags: ignoreversion; 

[Run]
Filename: "{sys}\attrib.exe"; Parameters: "+r ""{#MyAppBinsFolder}\sendto\sendto\UnPacking"""; Components: "unpacking"; Flags: runhidden; 



; de4dotEx
[Components]
Name: "unpacking\de4dotex"; Description: "de4dotEx"; Types: full;

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\de4dotEx\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\de4dotEx"; Components: "unpacking\de4dotex"; Flags: ignoreversion recursesubdirs createallsubdirs;

[Icons]
Name: "{group}\de4dotEx x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\de4dotEx"; Components: "unpacking\de4dotex"; Parameters: "/K ""{#MyAppToolsFolder}\UnPacking\de4dotEx\de4dot-x64.exe"""; IconFilename: "{#MyAppToolsFolder}\UnPacking\de4dotEx\de4dot-x64.exe"; Check: Is64BitInstallMode;
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\de4dotEx x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\de4dotEx"; Components: "unpacking\de4dotex"; Parameters: "/K ""{#MyAppToolsFolder}\UnPacking\de4dotEx\de4dot-x64.exe"""; IconFilename: "{#MyAppToolsFolder}\UnPacking\de4dotEx\de4dot-x64.exe"; Check: Is64BitInstallMode;

[Icons]
Name: "{group}\de4dotEx"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\de4dotEx"; Components: "unpacking\de4dotex"; Parameters: "/K ""{#MyAppToolsFolder}\UnPacking\de4dotEx\de4dot.exe"""; IconFilename: "{#MyAppToolsFolder}\UnPacking\de4dotEx\de4dot.exe"; Check: not Is64BitInstallMode;
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\de4dotEx"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\de4dotEx"; Components: "unpacking\de4dotex"; Parameters: "/K ""{#MyAppToolsFolder}\UnPacking\de4dotEx\de4dot.exe"""; IconFilename: "{#MyAppToolsFolder}\UnPacking\de4dotEx\de4dot.exe"; Check: not Is64BitInstallMode;



; Magic Extractor
[Components]
Name: "unpacking\magicextractor"; Description: "Magic Extractor"; Types: full compact;

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\Magic Extractor\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\Magic Extractor"; Components: "unpacking\magicextractor"; Flags: ignoreversion recursesubdirs createallsubdirs;

[Icons]
Name: "{group}\Magic Extractor"; Filename: "{#MyAppToolsFolder}\UnPacking\Magic Extractor\magic-extractor-gui.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\Magic Extractor"; Components: "unpacking\magicextractor";
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\Magic Extractor"; Filename: "{#MyAppToolsFolder}\UnPacking\Magic Extractor\magic-extractor-gui.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\Magic Extractor"; Components: "unpacking\magicextractor";

[Icons]
Name: "{group}\Magic Extractor CLI"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\Magic Extractor"; Components: "unpacking\magicextractor"; Parameters: "/K ""{#MyAppToolsFolder}\UnPacking\Magic Extractor\magic-extractor.exe"""; IconFilename: "{#MyAppToolsFolder}\UnPacking\Magic Extractor\magic-extractor.exe";
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\Magic Extractor CLI"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\Magic Extractor"; Components: "unpacking\magicextractor"; Parameters: "/K ""{#MyAppToolsFolder}\UnPacking\Magic Extractor\magic-extractor.exe"""; IconFilename: "{#MyAppToolsFolder}\UnPacking\Magic Extractor\magic-extractor.exe";



; QUnpack
[Components]
Name: "unpacking\qunpack"; Description: "QUnpack"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\QUnpack\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\QUnpack"; Components: "unpacking\qunpack"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\QUnpack"; Filename: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack32\Explorer.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack32"; Components: "unpacking\qunpack";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\QUnpack"; Filename: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack32\Explorer.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack32"; Components: "unpacking\qunpack";    



[Icons]
Name: "{group}\QUnpack x64"; Filename: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack64\Explorer.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack64"; Components: "unpacking\qunpack";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\QUnpack x64"; Filename: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack64\Explorer.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\QUnpack\QUnpack - 4.3\QUnpack64"; Components: "unpacking\qunpack";   Check: Is64BitInstallMode; 







; UniExtract
[Components]
Name: "unpacking\uniextract"; Description: "UniExtract"; Types: full;

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\UniExtract\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\UniExtract"; Components: "unpacking\uniextract"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\UniExtract"; Filename: "{#MyAppToolsFolder}\UnPacking\UniExtract\UniExtract.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\UniExtract"; Components: "unpacking\uniextract";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\UniExtract"; Filename: "{#MyAppToolsFolder}\UnPacking\UniExtract\UniExtract.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\UniExtract"; Components: "unpacking\uniextract";    



; XVolkolak
[Components]
Name: "unpacking\xvolkolak"; Description: "XVolkolak"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\UnPacking\XVolkolak\*"; DestDir: "{#MyAppToolsFolder}\UnPacking\XVolkolak"; Components: "unpacking\xvolkolak"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\XVolkolak"; Filename: "{#MyAppToolsFolder}\UnPacking\XVolkolak\xvlk.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\XVolkolak"; Components: "unpacking\xvolkolak";    
Name: "{#MyAppBinsFolder}\sendto\sendto\UnPacking\XVolkolak"; Filename: "{#MyAppToolsFolder}\UnPacking\XVolkolak\xvlk.exe"; WorkingDir: "{#MyAppToolsFolder}\UnPacking\XVolkolak"; Components: "unpacking\xvolkolak";    


