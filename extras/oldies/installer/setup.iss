; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Indetectables Toolkit Extras: Oldies"
#define MyAppNameOriginal "Indetectables Toolkit"
#define MyAppVersion "RELEASE"
#define MyAppPublisher "Indetectables"
#define MyAppURL "https://www.indetectables.net/"
#define MyAppToolsFolder "{app}\toolkit"
#define MyAppBinsFolder "{app}\bin"
#define MySrcDir "C:\code\toolkit\extras\oldies"
#define MyOutputDir "C:\code"

[Setup]
AppId={{84730513-20DE-412B-9887-88BA21E59D15}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
VersionInfoVersion={#MyAppVersion}
AppVerName={#MyAppName} - {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={sd}\{#MyAppNameOriginal}
DefaultGroupName={#MyAppNameOriginal}
PrivilegesRequired=admin
;PrivilegesRequiredOverridesAllowed=dialog
OutputBaseFilename=extras-{#MyAppVersion}-oldies
Compression=lzma2/max
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=x64
SetupIconFile="{#MySrcDir}\installer\icon.ico"
OutputDir={#MyOutputDir}
Uninstallable=no
DirExistsWarning=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "catalan"; MessagesFile: "compiler:Languages\Catalan.isl"
Name: "portuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[CustomMessages]
english.FolderValidationError=The toolkit was not found in the selected folder. You must install it before you can continue.
spanish.FolderValidationError=No se ha encontrado el kit de herramientas en la carpeta seleccionada. Debe instalarlo antes de continuar.
catalan.FolderValidationError=El conjunt d'eines no s'ha trobat a la carpeta seleccionada. Heu d'instal·lar-lo abans de poder continuar.
portuguese.FolderValidationError=O conjunto de ferramentas não foi encontrado na pasta seleccionada. Deve ser instalado antes de poder continuar.

[Components]
Name: "analysis"; Description: "Analysis tools"; Types: full;
#include "sections\analysis.iss"

[Components]
Name: "decompilers"; Description: "Decompilers"; Types: full;
#include "sections\decompilers.iss"

[Components]
Name: "dissasembler"; Description: "Dissasembler"; Types: full;
#include "sections\dissasembler.iss"

[Components]
Name: "other"; Description: "Other tools"; Types: full;
#include "sections\other.iss"

[Components]
Name: "reverse"; Description: "Reverse"; Types: full;
#include "sections\reverse.iss"

[Components]
Name: "unpacking"; Description: "UnPacking"; Types: full;
#include "sections\unpacking.iss"


[code]
function NextButtonClick(PageId: Integer): Boolean;
begin
    Result := True;
    if (PageId = wpSelectDir) and not FileExists(ExpandConstant('{app}\CHANGELOG.md')) then begin
        MsgBox(ExpandConstant('{cm:FolderValidationError}'), mbError, MB_OK);
        Result := False;
        exit;
    end;
end;
