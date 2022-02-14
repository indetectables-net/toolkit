!include FileFunc.nsh
!include LogicLib.nsh

var RAW_PARAMS
var PACK_PARAM
var EXE_PARAM
var FOLDER_NAME
var OUTPUT_PATH

; general options
name "loader"
Icon "appicon.ico"
SilentInstall silent
OutFile "loader.exe"
RequestExecutionLevel user
SetCompressor /SOLID lzma
CRCCheck on

; exe info
VIProductVersion "1.0.0.0"
VIAddVersionKey /LANG=1033 "ProductName" "loader"
VIAddVersionKey /LANG=1033 "FileDescription" "7z file loader"
VIAddVersionKey /LANG=1033 "FileVersion" "1.0.0.0"
VIAddVersionKey /LANG=1033 "LegalCopyright" "2021"

Function .onInit
  ; read exe params
  ${GetParameters} $RAW_PARAMS
  ${GetOptions} $RAW_PARAMS "/PACK=" $PACK_PARAM
  ${GetOptions} $RAW_PARAMS "/EXE=" $EXE_PARAM
  ${GetOptions} $RAW_PARAMS "/OUTPUT=" $OUTPUT_PATH

  ; error control
  ${If} $PACK_PARAM == ""
    MessageBox MB_ICONEXCLAMATION "Missing default params:$\r \
      /PACK=7z_path.7z$\r \
      /EXE=exe_to_run.exe$\r \
      /OUTPUT=overwrite_default_path"
    Abort
  ${EndIf}

  ; generate temp folder name
  ; install first https://nsis.sourceforge.io/Crypto_plug-in
  ${If} $OUTPUT_PATH == ""
    Crypto::HashData "SHA1" $PACK_PARAM
    Pop $FOLDER_NAME
    StrCpy $OUTPUT_PATH "$TEMP\loader-$FOLDER_NAME"
  ${EndIf}
FunctionEnd

; script
Section ""
  ; create dir
  SetOutPath "$OUTPUT_PATH"
  SetOverwrite on
  
  ; debug
  ;MessageBox MB_OK "$PACK_PARAM"
  ;MessageBox MB_OK "$OUTPUT_PATH\$EXE_PARAM"

  ; unpack
  ; install first https://nsis.sourceforge.io/Nsis7z_plug-in
  Nsis7z::Extract "$PACK_PARAM"

  ${If} $EXE_PARAM != ""
    ; exec...
    Execwait "$OUTPUT_PATH\$EXE_PARAM"

    ; cleanup
    SetOutPath "$TEMP"
    RMDir /r "$OUTPUT_PATH"
  ${EndIf}
SectionEnd
