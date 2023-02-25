; general options
name "auto-config-ini"
Icon "appicon.ico"
SilentInstall silent
OutFile "auto-config-ini.exe"
RequestExecutionLevel user
SetCompressor /SOLID lzma
CRCCheck on

!include FileFunc.nsh
!include LogicLib.nsh
!include GetSectionNamesFunc.nsh

var RAW_PARAMS
var CONFIG_PATH
var OLD_CONFIG_PATH
var UPDATE_FOLDER_PATH
var CHECK_TYPE

; exe info
VIProductVersion "2.0.0.0"
VIAddVersionKey /LANG=1033 "FileVersion" "2.0.0.0"
VIAddVersionKey /LANG=1033 "ProductName" "auto-config-ini"
VIAddVersionKey /LANG=1033 "FileDescription" "Indetectables Toolkit updater auto config tools.ini"
VIAddVersionKey /LANG=1033 "LegalCopyright" "2023"

Function .onInit
  ; read exe params
  ${GetParameters} $RAW_PARAMS
  ${GetOptions} $RAW_PARAMS "/FOLDER=" $UPDATE_FOLDER_PATH
  ${GetOptions} $RAW_PARAMS "/TYPE=" $CHECK_TYPE

  ; error control
  ${If} $UPDATE_FOLDER_PATH == ""
    MessageBox MB_ICONEXCLAMATION "Missing default params:$\r \
      /FOLDER=[updater folder path]$\r \
      /TYPE=[clean|sync|toolkit]"
    Abort
  ${EndIf}

  ; set variables
  StrCpy $CONFIG_PATH "$UPDATE_FOLDER_PATH\tools.ini"
  StrCpy $OLD_CONFIG_PATH "$UPDATE_FOLDER_PATH\tools.ini.old"
  
  ; check tools.ini exist
  IfFileExists "$CONFIG_PATH" +3 0
  MessageBox MB_ICONEXCLAMATION "File tools.ini not found!"
  Abort

  ; check tools.ini.old exist
  ${If} $CHECK_TYPE == "sync"
    IfFileExists "$OLD_CONFIG_PATH" +3 0
    MessageBox MB_ICONEXCLAMATION "File tools.ini.old not found!"
    Abort
  ${EndIf}
FunctionEnd

; script default action
Section ""
  ; debug
  ;MessageBox MB_OK "$CHECK_TYPE"
  ;MessageBox MB_OK "$CONFIG_PATH"

  ${If} $CHECK_TYPE == "sync"
    Call ConfigSectionSync
    ${GetSectionNames} "$CONFIG_PATH" "ReadSectionSyncCallback"
  ${ElseIf} $CHECK_TYPE == "toolkit"
    Call ConfigToolkitDefault
  ${Else}
    ${GetSectionNames} "$CONFIG_PATH" "ReadSectionCleanCallback"
  ${EndIf}
SectionEnd

; Synchronizes the updater configuration with the one the user had on their machine
Function ConfigSectionSync
  ; sync "disable_clean" from old file to new
  ReadINIStr $R0 "$OLD_CONFIG_PATH" "UpdaterConfig" "disable_clean"
  WriteINIStr "$CONFIG_PATH" "UpdaterConfig" "disable_clean" "$R0"

  ; sync "disable_repack" from old file to new
  ReadINIStr $R0 "$OLD_CONFIG_PATH" "UpdaterConfig" "disable_repack"
  WriteINIStr "$CONFIG_PATH" "UpdaterConfig" "disable_repack" "$R0"

  ; sync "disable_progress" from old file to new
  ReadINIStr $R0 "$OLD_CONFIG_PATH" "UpdaterConfig" "disable_progress"
  WriteINIStr "$CONFIG_PATH" "UpdaterConfig" "disable_progress" "$R0"

  ; sync "save_format_type" from old file to new
  ReadINIStr $R0 "$OLD_CONFIG_PATH" "UpdaterConfig" "save_format_type"
  WriteINIStr "$CONFIG_PATH" "UpdaterConfig" "save_format_type" "$R0"

  ; sync "use_github_api" from old file to new
  ReadINIStr $R0 "$OLD_CONFIG_PATH" "UpdaterConfig" "use_github_api"
  WriteINIStr "$CONFIG_PATH" "UpdaterConfig" "use_github_api" "$R0"
FunctionEnd

; Set the default updater configuration within the toolkit
Function ConfigToolkitDefault
  ; this is the correct updater configuration for use in the toolkit
  WriteINIStr "$CONFIG_PATH" "UpdaterConfig" "disable_clean" "True"
  WriteINIStr "$CONFIG_PATH" "UpdaterConfig" "disable_repack" "True"
FunctionEnd

; Callback to synchronize the state of the tools
Function ReadSectionSyncCallback
  ; analyze all except the updater config and updater self updater
  ${If} $9 != "UpdaterConfig"
  ${AndIf} $9 != "UpdaterAutoUpdater"

    ; sync "local_version" from old file to new
    ReadINIStr $R0 "$OLD_CONFIG_PATH" "$9" "local_version"
    WriteINIStr "$CONFIG_PATH" "$9" "local_version" "$R0"

    ; sync "merge" from old file to new
    ReadINIStr $R0 "$OLD_CONFIG_PATH" "$9" "merge"
    ${If} $R0 != ""
      WriteINIStr "$CONFIG_PATH" "$9" "merge" "$R0"
    ${EndIf}

  ${EndIf}
 
  ; move on to the next
  Push $0
FunctionEnd

; Callback to eliminate the tools that are not installed in the system
Function ReadSectionCleanCallback
  ; analyze all except the updater config and updater self updater
  ${If} $9 != "UpdaterConfig"
  ${AndIf} $9 != "UpdaterAutoUpdater"

    ; check if tool path exist in the system
    ReadINIStr $R0 "$CONFIG_PATH" "$9" "folder"
    IfFileExists "$UPDATE_FOLDER_PATH\$R0" +2 0
    DeleteINISec "$CONFIG_PATH" "$9"

  ${EndIf}
 
  ; move on to the next
  Push $0
FunctionEnd
