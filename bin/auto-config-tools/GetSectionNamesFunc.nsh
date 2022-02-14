; Version 1.0
; https://nsis.sourceforge.io/Get_all_section_names_of_INI_file

!define GetSectionNames `!insertmacro GetSectionNamesCall`
 
!macro GetSectionNamesCall _FILE _FUNC
    Push $0
    Push `${_FILE}`
    GetFunctionAddress $0 `${_FUNC}`
    Push `$0`
    Call GetSectionNames
    Pop $0
!macroend
 
Function GetSectionNames
    Exch $1
    Exch
    Exch $0
    Exch
    Push $2
    Push $3
    Push $4
    Push $5
    Push $8
    Push $9
 
    System::Call *(&t1024)i.r2
        StrCpy $3 $2
 
        System::Call "kernel32::GetPrivateProfileSectionNames(i, i, t)i (r3, 1024, r0).r4"
 
    enumok:
        System::Call 'kernel32::lstrlen(t)i (i r3).r5' ; (t) is here to trigger A/W detection
    StrCmp $5 '0' enumex
 
    System::Call '*$3(&t1024 .r9)'
 
    Push $0
    Push $1
    Push $2
    Push $3
    Push $4
    Push $5
    Push $8
    Call $1
    Pop $9
    Pop $8
    Pop $5
    Pop $4
    Pop $3
    Pop $2
    Pop $1
    Pop $0
        StrCmp $9 'StopGetSectionNames' enumex
 
    enumnext:
!if "${NSIS_CHAR_SIZE}" > 1
    IntOp $5 $5 * ${NSIS_CHAR_SIZE}
    IntOp $5 $5 + ${NSIS_CHAR_SIZE}
!else
    IntOp $5 $5 + 1
!endif
    IntOp $3 $3 + $5
    goto enumok
 
    enumex:
    System::Free $2
 
    Pop $9
    Pop $8
    Pop $5
    Pop $4
    Pop $3
    Pop $2
    Pop $1
    Pop $0
FunctionEnd
