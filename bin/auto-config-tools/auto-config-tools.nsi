; general options
name "auto-config-tools"
Icon "appicon.ico"
SilentInstall silent
OutFile "auto-config-tools.exe"
RequestExecutionLevel user
SetCompressor /SOLID lzma
CRCCheck on

!include FileFunc.nsh
!include LogicLib.nsh
!include GetSectionNamesFunc.nsh

var RAW_PARAMS
var CONFIG_PATH
var UPDATE_FOLDER_PATH

; exe info
VIProductVersion "1.1.0.0"
VIAddVersionKey /LANG=1033 "ProductName" "auto-config-tools"
VIAddVersionKey /LANG=1033 "FileDescription" "Indetectables Toolkit updater auto config tools.ini"
VIAddVersionKey /LANG=1033 "LegalCopyright" "2023"

Function .onInit
  ; read exe params
  ${GetParameters} $RAW_PARAMS
  ${GetOptions} $RAW_PARAMS "/FOLDER=" $UPDATE_FOLDER_PATH

  ; error control
  ${If} $UPDATE_FOLDER_PATH == ""
    MessageBox MB_ICONEXCLAMATION "Missing default params:$\r \
      /FOLDER=updater_folder_path"
    Abort
  ${EndIf}

  StrCpy $CONFIG_PATH "$UPDATE_FOLDER_PATH\tools.ini"
  IfFileExists "$CONFIG_PATH" +3 0
  MessageBox MB_ICONEXCLAMATION "Config file read error!"
  Abort
FunctionEnd

; script
Section ""
  ; debug
  ;MessageBox MB_OK "$CONFIG_PATH"

  ${GetSectionNames} "$CONFIG_PATH" "ReadSectionCallback"
SectionEnd

Function ReadSectionCallback
  ; analyze all except the updater config 
  ${If} $9 != "UpdaterConfig"
    ReadINIStr $0 "$CONFIG_PATH" "$9" folder
    ;MessageBox MB_OK "$0"

    IfFileExists "$UPDATE_FOLDER_PATH\$0" +2 0
    DeleteINISec "$CONFIG_PATH" "$9"
  ${EndIf}
 
  ; move on to the next
  Push $0
FunctionEnd
