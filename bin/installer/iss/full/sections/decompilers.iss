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



; [AUTOIT] Exe2Aut
[Components]
Name: "decompilers\autoitexe2aut"; Description: "[AUTOIT] Exe2Aut"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[AUTOIT] Exe2Aut\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] Exe2Aut"; Components: "decompilers\autoitexe2aut"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\[AUTOIT] Exe2Aut"; Filename: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] Exe2Aut\Exe2Aut.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] Exe2Aut"; Components: "decompilers\autoitexe2aut";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[AUTOIT] Exe2Aut"; Filename: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] Exe2Aut\Exe2Aut.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] Exe2Aut"; Components: "decompilers\autoitexe2aut";    



; [AUTOIT] MyAutToExe
[Components]
Name: "decompilers\autoitmyauttoexe"; Description: "[AUTOIT] MyAutToExe"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[AUTOIT] MyAutToExe\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] MyAutToExe"; Components: "decompilers\autoitmyauttoexe"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\[AUTOIT] MyAutToExe"; Filename: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] MyAutToExe\myAutToExe.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] MyAutToExe"; Components: "decompilers\autoitmyauttoexe";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[AUTOIT] MyAutToExe"; Filename: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] MyAutToExe\myAutToExe.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] MyAutToExe"; Components: "decompilers\autoitmyauttoexe";    



; [AUTOIT] UnAutoIt
[Components]
Name: "decompilers\autoitunautoit"; Description: "[AUTOIT] UnAutoIt"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[AUTOIT] UnAutoIt\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] UnAutoIt"; Components: "decompilers\autoitunautoit"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\[AUTOIT] UnAutoIt x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] UnAutoIt"; Components: "decompilers\autoitunautoit"; Parameters: "/K ""{#MyAppToolsFolder}\Decompilers\[AUTOIT] UnAutoIt\UnAutoIt-windows-amd64.exe"""; IconFilename: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] UnAutoIt\UnAutoIt-windows-amd64.exe"; Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[AUTOIT] UnAutoIt x64"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] UnAutoIt"; Components: "decompilers\autoitunautoit"; Parameters: "/K ""{#MyAppToolsFolder}\Decompilers\[AUTOIT] UnAutoIt\UnAutoIt-windows-amd64.exe"""; IconFilename: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] UnAutoIt\UnAutoIt-windows-amd64.exe"; Check: Is64BitInstallMode; 

[Icons]
Name: "{group}\[AUTOIT] UnAutoIt"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] UnAutoIt"; Components: "decompilers\autoitunautoit"; Parameters: "/K ""{#MyAppToolsFolder}\Decompilers\[AUTOIT] UnAutoIt\UnAutoIt-windows-i686.exe"""; IconFilename: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] UnAutoIt\UnAutoIt-windows-i686.exe"; Check: not Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[AUTOIT] UnAutoIt"; Filename: "{sys}\cmd.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] UnAutoIt"; Components: "decompilers\autoitunautoit"; Parameters: "/K ""{#MyAppToolsFolder}\Decompilers\[AUTOIT] UnAutoIt\UnAutoIt-windows-i686.exe"""; IconFilename: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] UnAutoIt\UnAutoIt-windows-i686.exe"; Check: not Is64BitInstallMode; 



; [DELPHI] IDR
[Components]
Name: "decompilers\delphiidr"; Description: "[DELPHI] IDR"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[DELPHI] IDR\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[DELPHI] IDR"; Components: "decompilers\delphiidr"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\[DELPHI] IDR"; Filename: "{#MyAppToolsFolder}\Decompilers\[DELPHI] IDR\Idr.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DELPHI] IDR"; Components: "decompilers\delphiidr";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[DELPHI] IDR"; Filename: "{#MyAppToolsFolder}\Decompilers\[DELPHI] IDR\Idr.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DELPHI] IDR"; Components: "decompilers\delphiidr";    



; [DOTNET] dnSpyEx
[Components]
Name: "decompilers\dotnetdnspyex"; Description: "[DOTNET] dnSpyEx"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[DOTNET] dnSpyEx\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] dnSpyEx"; Components: "decompilers\dotnetdnspyex"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\[DOTNET] dnSpyEx x64"; Filename: "{#MyAppToolsFolder}\Decompilers\[DOTNET] dnSpyEx\dnSpy.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] dnSpyEx"; Components: "decompilers\dotnetdnspyex";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[DOTNET] dnSpyEx x64"; Filename: "{#MyAppToolsFolder}\Decompilers\[DOTNET] dnSpyEx\dnSpy.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] dnSpyEx"; Components: "decompilers\dotnetdnspyex";   Check: Is64BitInstallMode; 



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



; [VB] VB Decompiler
[Components]
Name: "decompilers\vbvbdecompiler"; Description: "[VB] VB Decompiler"; Types: full; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[VB] VB Decompiler\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[VB] VB Decompiler"; Components: "decompilers\vbvbdecompiler"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\[VB] VB Decompiler"; Filename: "{#MyAppToolsFolder}\Decompilers\[VB] VB Decompiler\VB Decompiler.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[VB] VB Decompiler"; Components: "decompilers\vbvbdecompiler";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[VB] VB Decompiler"; Filename: "{#MyAppToolsFolder}\Decompilers\[VB] VB Decompiler\VB Decompiler.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[VB] VB Decompiler"; Components: "decompilers\vbvbdecompiler";    


