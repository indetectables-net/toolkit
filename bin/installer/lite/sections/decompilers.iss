; [ANDROID] JADX
[Components]
Name: "decompilers\androidjadx"; Description: "[ANDROID] JADX"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[ANDROID] JADX\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[ANDROID] JADX"; Components: "decompilers\androidjadx"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[ANDROID] JADX"; Filename: "{#MyAppToolsFolder}\Decompilers\[ANDROID] JADX\jadx-gui.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[ANDROID] JADX"; Components: "decompilers\androidjadx";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[ANDROID] JADX"; Filename: "{#MyAppToolsFolder}\Decompilers\[ANDROID] JADX\jadx-gui.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[ANDROID] JADX"; Components: "decompilers\androidjadx";    



; [DELPHI] IDR
[Components]
Name: "decompilers\delphiidr"; Description: "[DELPHI] IDR"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[DELPHI] IDR\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[DELPHI] IDR"; Components: "decompilers\delphiidr"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[DELPHI] IDR"; Filename: "{#MyAppToolsFolder}\Decompilers\[DELPHI] IDR\Idr.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DELPHI] IDR"; Components: "decompilers\delphiidr";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[DELPHI] IDR"; Filename: "{#MyAppToolsFolder}\Decompilers\[DELPHI] IDR\Idr.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DELPHI] IDR"; Components: "decompilers\delphiidr";    



; [DOTNET] ILSpy
[Components]
Name: "decompilers\dotnetilspy"; Description: "[DOTNET] ILSpy"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[DOTNET] ILSpy\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] ILSpy"; Components: "decompilers\dotnetilspy"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[DOTNET] ILSpy x64"; Filename: "{#MyAppToolsFolder}\Decompilers\[DOTNET] ILSpy\ILSpy.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] ILSpy"; Components: "decompilers\dotnetilspy";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[DOTNET] ILSpy x64"; Filename: "{#MyAppToolsFolder}\Decompilers\[DOTNET] ILSpy\ILSpy.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] ILSpy"; Components: "decompilers\dotnetilspy";   Check: Is64BitInstallMode; 



; [JAVA] JD-GUI
[Components]
Name: "decompilers\javajdgui"; Description: "[JAVA] JD-GUI"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[JAVA] JD-GUI\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] JD-GUI"; Components: "decompilers\javajdgui"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[JAVA] JD-GUI"; Filename: "{#MyAppToolsFolder}\Decompilers\[JAVA] JD-GUI\jd-gui.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] JD-GUI"; Components: "decompilers\javajdgui";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[JAVA] JD-GUI"; Filename: "{#MyAppToolsFolder}\Decompilers\[JAVA] JD-GUI\jd-gui.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] JD-GUI"; Components: "decompilers\javajdgui";    



; [JAVA] Recaf
[Components]
Name: "decompilers\javarecaf"; Description: "[JAVA] Recaf"; Types: full compact; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[JAVA] Recaf\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] Recaf"; Components: "decompilers\javarecaf"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[JAVA] Recaf"; Filename: "{#MyAppToolsFolder}\Decompilers\[JAVA] Recaf\recaf-J8-jar-with-dependencies.jar"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] Recaf"; Components: "decompilers\javarecaf"; IconFilename: "{#MyAppToolsIconsFolder}\recaf.ico";
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[JAVA] Recaf"; Filename: "{#MyAppToolsFolder}\Decompilers\[JAVA] Recaf\recaf-J8-jar-with-dependencies.jar"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] Recaf"; Components: "decompilers\javarecaf"; IconFilename: "{#MyAppToolsIconsFolder}\recaf.ico";



; [PYTHON] PyInstxtractor
[Components]
Name: "decompilers\pythonpyinstxtractor"; Description: "[PYTHON] PyInstxtractor"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[PYTHON] PyInstxtractor\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[PYTHON] PyInstxtractor"; Components: "decompilers\pythonpyinstxtractor"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[PYTHON] PyInstxtractor"; Filename: "{sys}\cmd.exe"; Parameters: "/K python ""{#MyAppToolsFolder}\Decompilers\[PYTHON] PyInstxtractor\pyinstxtractor.py"""; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[PYTHON] PyInstxtractor"; Components: "decompilers\pythonpyinstxtractor"; IconFilename: "{#MyAppToolsIconsFolder}\pyinstxtractor.ico";
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[PYTHON] PyInstxtractor"; Filename: "{sys}\cmd.exe"; Parameters: "/K python ""{#MyAppToolsFolder}\Decompilers\[PYTHON] PyInstxtractor\pyinstxtractor.py"""; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[PYTHON] PyInstxtractor"; Components: "decompilers\pythonpyinstxtractor"; IconFilename: "{#MyAppToolsIconsFolder}\pyinstxtractor.ico";


