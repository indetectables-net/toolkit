; Main section
[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\desktop.ini"; DestDir: "{#MyAppToolsFolder}\Decompilers"; Components: "decompilers"; Flags: ignoreversion; 
Source: "{#MySrcDir}\toolkit\Decompilers\folder.ico"; DestDir: "{#MyAppToolsFolder}\Decompilers"; Components: "decompilers"; Flags: ignoreversion; 

[Run]
Filename: "{sys}\attrib.exe"; Parameters: "+s +h ""{#MyAppToolsFolder}\toolkit\Decompilers\desktop.ini"""; Components: "decompilers"; Flags: runhidden; 
Filename: "{sys}\attrib.exe"; Parameters: "+r ""{#MyAppToolsFolder}\toolkit\Decompilers"""; Components: "decompilers"; Flags: runhidden; 

; [ANDROID] JADX
[Components]
Name: "decompilers\androidjadx"; Description: "[ANDROID] JADX"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[ANDROID] JADX\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[ANDROID] JADX"; Components: "decompilers\androidjadx"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\[ANDROID] JADX"; Filename: "{#MyAppToolsFolder}\Decompilers\[ANDROID] JADX\jadx-gui.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[ANDROID] JADX"; Components: "decompilers\androidjadx";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[ANDROID] JADX"; Filename: "{#MyAppToolsFolder}\Decompilers\[ANDROID] JADX\jadx-gui.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[ANDROID] JADX"; Components: "decompilers\androidjadx";    



; [DOTNET] ILSpy
[Components]
Name: "decompilers\dotnetilspy"; Description: "[DOTNET] ILSpy"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[DOTNET] ILSpy\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] ILSpy"; Components: "decompilers\dotnetilspy"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\[DOTNET] ILSpy"; Filename: "{#MyAppToolsFolder}\Decompilers\[DOTNET] ILSpy\ILSpy.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] ILSpy"; Components: "decompilers\dotnetilspy";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[DOTNET] ILSpy"; Filename: "{#MyAppToolsFolder}\Decompilers\[DOTNET] ILSpy\ILSpy.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] ILSpy"; Components: "decompilers\dotnetilspy";    



; [JAVA] JD-GUI
[Components]
Name: "decompilers\javajdgui"; Description: "[JAVA] JD-GUI"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[JAVA] JD-GUI\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] JD-GUI"; Components: "decompilers\javajdgui"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\[JAVA] JD-GUI"; Filename: "{#MyAppToolsFolder}\Decompilers\[JAVA] JD-GUI\jd-gui.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] JD-GUI"; Components: "decompilers\javajdgui";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[JAVA] JD-GUI"; Filename: "{#MyAppToolsFolder}\Decompilers\[JAVA] JD-GUI\jd-gui.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] JD-GUI"; Components: "decompilers\javajdgui";    



; [JAVA] Recaf
[Components]
Name: "decompilers\javarecaf"; Description: "[JAVA] Recaf"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[JAVA] Recaf\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] Recaf"; Components: "decompilers\javarecaf"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\[JAVA] Recaf"; Filename: "{#MyAppToolsFolder}\Decompilers\[JAVA] Recaf\recaf-J8-jar-with-dependencies.jar"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] Recaf"; Components: "decompilers\javarecaf"; IconFilename: "{#MyAppToolsIconsFolder}\recaf.ico";
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[JAVA] Recaf"; Filename: "{#MyAppToolsFolder}\Decompilers\[JAVA] Recaf\recaf-J8-jar-with-dependencies.jar"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] Recaf"; Components: "decompilers\javarecaf"; IconFilename: "{#MyAppToolsIconsFolder}\recaf.ico";



; [PYTHON] PyInstxtractor
[Components]
Name: "decompilers\pythonpyinstxtractor"; Description: "[PYTHON] PyInstxtractor"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[PYTHON] PyInstxtractor\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[PYTHON] PyInstxtractor"; Components: "decompilers\pythonpyinstxtractor"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\[PYTHON] PyInstxtractor"; Filename: "{sys}\cmd.exe"; Parameters: "/K python ""{#MyAppToolsFolder}\Decompilers\[PYTHON] PyInstxtractor\pyinstxtractor.py"""; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[PYTHON] PyInstxtractor"; Components: "decompilers\pythonpyinstxtractor"; IconFilename: "{#MyAppToolsIconsFolder}\pyinstxtractor.ico";
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[PYTHON] PyInstxtractor"; Filename: "{sys}\cmd.exe"; Parameters: "/K python ""{#MyAppToolsFolder}\Decompilers\[PYTHON] PyInstxtractor\pyinstxtractor.py"""; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[PYTHON] PyInstxtractor"; Components: "decompilers\pythonpyinstxtractor"; IconFilename: "{#MyAppToolsIconsFolder}\pyinstxtractor.ico";



; [PYTHON] Python Decompyle++
[Components]
Name: "decompilers\pythonpythondecompyle"; Description: "[PYTHON] Python Decompyle++"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[PYTHON] Python Decompyle++\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[PYTHON] Python Decompyle++"; Components: "decompilers\pythonpythondecompyle"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\[PYTHON] Python Decompyle++"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[PYTHON] Python Decompyle++"; Components: "decompilers\pythonpythondecompyle"; Parameters: "/K ""{#MyAppToolsFolder}\Decompilers\[PYTHON] Python Decompyle++\pycdas.exe"""; IconFilename: "{#MyAppToolsFolder}\Decompilers\[PYTHON] Python Decompyle++\pycdas.exe";  
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[PYTHON] Python Decompyle++"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[PYTHON] Python Decompyle++"; Components: "decompilers\pythonpythondecompyle"; Parameters: "/K ""{#MyAppToolsFolder}\Decompilers\[PYTHON] Python Decompyle++\pycdas.exe"""; IconFilename: "{#MyAppToolsFolder}\Decompilers\[PYTHON] Python Decompyle++\pycdas.exe";  


