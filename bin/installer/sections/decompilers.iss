; [ANDROID] JADX
[Components]
Name: "decompilers\androidjadx"; Description: "[ANDROID] JADX"; Types: full compact; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[ANDROID] JADX\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[ANDROID] JADX"; Components: "decompilers\androidjadx"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[ANDROID] JADX"; Filename: "{#MyAppToolsFolder}\Decompilers\[ANDROID] JADX\jadx-gui.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[ANDROID] JADX"; Components: "decompilers\androidjadx";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[ANDROID] JADX"; Filename: "{#MyAppToolsFolder}\Decompilers\[ANDROID] JADX\jadx-gui.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[ANDROID] JADX"; Components: "decompilers\androidjadx";    



; [AUTOIT] Exe2Aut
[Components]
Name: "decompilers\autoitexe2aut"; Description: "[AUTOIT] Exe2Aut"; Types: full; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[AUTOIT] Exe2Aut\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] Exe2Aut"; Components: "decompilers\autoitexe2aut"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[AUTOIT] Exe2Aut"; Filename: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] Exe2Aut\Exe2Aut.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] Exe2Aut"; Components: "decompilers\autoitexe2aut";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[AUTOIT] Exe2Aut"; Filename: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] Exe2Aut\Exe2Aut.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] Exe2Aut"; Components: "decompilers\autoitexe2aut";    



; [AUTOIT] MyAutToExe
[Components]
Name: "decompilers\autoitmyauttoexe"; Description: "[AUTOIT] MyAutToExe"; Types: full; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[AUTOIT] MyAutToExe\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] MyAutToExe"; Components: "decompilers\autoitmyauttoexe"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[AUTOIT] MyAutToExe"; Filename: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] MyAutToExe\myAutToExe.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] MyAutToExe"; Components: "decompilers\autoitmyauttoexe";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[AUTOIT] MyAutToExe"; Filename: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] MyAutToExe\myAutToExe.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[AUTOIT] MyAutToExe"; Components: "decompilers\autoitmyauttoexe";    



; [DELPHI] Dede
[Components]
Name: "decompilers\delphidede"; Description: "[DELPHI] Dede"; Types: full; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[DELPHI] Dede\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[DELPHI] Dede"; Components: "decompilers\delphidede"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[DELPHI] Dede"; Filename: "{#MyAppToolsFolder}\Decompilers\[DELPHI] Dede\DeDe.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DELPHI] Dede"; Components: "decompilers\delphidede";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[DELPHI] Dede"; Filename: "{#MyAppToolsFolder}\Decompilers\[DELPHI] Dede\DeDe.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DELPHI] Dede"; Components: "decompilers\delphidede";    



; [DELPHI] IDR
[Components]
Name: "decompilers\delphiidr"; Description: "[DELPHI] IDR"; Types: full; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[DELPHI] IDR\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[DELPHI] IDR"; Components: "decompilers\delphiidr"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[DELPHI] IDR"; Filename: "{#MyAppToolsFolder}\Decompilers\[DELPHI] IDR\Idr.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DELPHI] IDR"; Components: "decompilers\delphiidr";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[DELPHI] IDR"; Filename: "{#MyAppToolsFolder}\Decompilers\[DELPHI] IDR\Idr.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DELPHI] IDR"; Components: "decompilers\delphiidr";    



; [DOTNET] dnSpyEx
[Components]
Name: "decompilers\dotnetdnspyex"; Description: "[DOTNET] dnSpyEx"; Types: full; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[DOTNET] dnSpyEx\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] dnSpyEx"; Components: "decompilers\dotnetdnspyex"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[DOTNET] dnSpyEx x64"; Filename: "{#MyAppToolsFolder}\Decompilers\[DOTNET] dnSpyEx\dnSpy.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] dnSpyEx"; Components: "decompilers\dotnetdnspyex";   Check: Is64BitInstallMode; 
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[DOTNET] dnSpyEx x64"; Filename: "{#MyAppToolsFolder}\Decompilers\[DOTNET] dnSpyEx\dnSpy.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] dnSpyEx"; Components: "decompilers\dotnetdnspyex";   Check: Is64BitInstallMode; 



; [DOTNET] GrayWolf
[Components]
Name: "decompilers\dotnetgraywolf"; Description: "[DOTNET] GrayWolf"; Types: full; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[DOTNET] GrayWolf\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] GrayWolf"; Components: "decompilers\dotnetgraywolf"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[DOTNET] GrayWolf"; Filename: "{#MyAppToolsFolder}\Decompilers\[DOTNET] GrayWolf\GrayWolf - 1.88\GrayWolf_188.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] GrayWolf\GrayWolf - 1.88"; Components: "decompilers\dotnetgraywolf";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[DOTNET] GrayWolf"; Filename: "{#MyAppToolsFolder}\Decompilers\[DOTNET] GrayWolf\GrayWolf - 1.88\GrayWolf_188.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] GrayWolf\GrayWolf - 1.88"; Components: "decompilers\dotnetgraywolf";    



; [DOTNET] ILSpy
[Components]
Name: "decompilers\dotnetilspy"; Description: "[DOTNET] ILSpy"; Types: full compact; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[DOTNET] ILSpy\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] ILSpy"; Components: "decompilers\dotnetilspy"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[DOTNET] ILSpy"; Filename: "{#MyAppToolsFolder}\Decompilers\[DOTNET] ILSpy\ILSpy.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] ILSpy"; Components: "decompilers\dotnetilspy";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[DOTNET] ILSpy"; Filename: "{#MyAppToolsFolder}\Decompilers\[DOTNET] ILSpy\ILSpy.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[DOTNET] ILSpy"; Components: "decompilers\dotnetilspy";    



; [JAVA] JD-GUI
[Components]
Name: "decompilers\javajdgui"; Description: "[JAVA] JD-GUI"; Types: full compact; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[JAVA] JD-GUI\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] JD-GUI"; Components: "decompilers\javajdgui"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[JAVA] JD-GUI"; Filename: "{#MyAppToolsFolder}\Decompilers\[JAVA] JD-GUI\jd-gui.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] JD-GUI"; Components: "decompilers\javajdgui";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[JAVA] JD-GUI"; Filename: "{#MyAppToolsFolder}\Decompilers\[JAVA] JD-GUI\jd-gui.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] JD-GUI"; Components: "decompilers\javajdgui";    



; [JAVA] Recaf
[Components]
Name: "decompilers\javarecaf"; Description: "[JAVA] Recaf"; Types: full compact; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[JAVA] Recaf\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] Recaf"; Components: "decompilers\javarecaf"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[JAVA] Recaf"; Filename: "{#MyAppToolsFolder}\Decompilers\[JAVA] Recaf\recaf-J8-jar-with-dependencies.jar"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] Recaf"; Components: "decompilers\javarecaf"; IconFilename: "{#MyAppToolsIconsFolder}\recaf.ico";
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[JAVA] Recaf"; Filename: "{#MyAppToolsFolder}\Decompilers\[JAVA] Recaf\recaf-J8-jar-with-dependencies.jar"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[JAVA] Recaf"; Components: "decompilers\javarecaf"; IconFilename: "{#MyAppToolsIconsFolder}\recaf.ico";



; [PYTHON] PyInstxtractor
[Components]
Name: "decompilers\pythonpyinstxtractor"; Description: "[PYTHON] PyInstxtractor"; Types: full; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[PYTHON] PyInstxtractor\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[PYTHON] PyInstxtractor"; Components: "decompilers\pythonpyinstxtractor"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[PYTHON] PyInstxtractor"; Filename: "{sys}\cmd.exe"; Parameters: "/K python ""{#MyAppToolsFolder}\Decompilers\[PYTHON] PyInstxtractor\pyinstxtractor.py"""; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[PYTHON] PyInstxtractor"; Components: "decompilers\pythonpyinstxtractor"; IconFilename: "{#MyAppToolsIconsFolder}\pyinstxtractor.ico";
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[PYTHON] PyInstxtractor"; Filename: "{sys}\cmd.exe"; Parameters: "/K python ""{#MyAppToolsFolder}\Decompilers\[PYTHON] PyInstxtractor\pyinstxtractor.py"""; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[PYTHON] PyInstxtractor"; Components: "decompilers\pythonpyinstxtractor"; IconFilename: "{#MyAppToolsIconsFolder}\pyinstxtractor.ico";



; [VB] VB Decompiler
[Components]
Name: "decompilers\vbvbdecompiler"; Description: "[VB] VB Decompiler"; Types: full; Flags: fixed; 

[Files]
Source: "{#MySrcDir}\toolkit\Decompilers\[VB] VB Decompiler\*"; DestDir: "{#MyAppToolsFolder}\Decompilers\[VB] VB Decompiler"; Components: "decompilers\vbvbdecompiler"; Flags: ignoreversion recursesubdirs createallsubdirs; 

[Icons]
Name: "{group}\{#MyAppName}\[VB] VB Decompiler"; Filename: "{#MyAppToolsFolder}\Decompilers\[VB] VB Decompiler\VB Decompiler.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[VB] VB Decompiler"; Components: "decompilers\vbvbdecompiler";    
Name: "{#MyAppBinsFolder}\sendto\sendto\Decompilers\[VB] VB Decompiler"; Filename: "{#MyAppToolsFolder}\Decompilers\[VB] VB Decompiler\VB Decompiler.exe"; WorkingDir: "{#MyAppToolsFolder}\Decompilers\[VB] VB Decompiler"; Components: "decompilers\vbvbdecompiler";    


