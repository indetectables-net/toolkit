/* cl.exe /MD /Os /DUNICODE /D_UNICODE sendto+.c Ole32.lib shell32.lib user32.lib Comdlg32.lib Shlwapi.lib
tcc sendto+.c -DUNICODE -D_UNICODE -DMINGW_HAS_SECURE_API -DINITGUID -lshell32 -lole32 -lshlwapi -lComdlg32 -lgdi32 -lgdiplus

https://msdn.microsoft.com/en-us/library/cc144093.aspx
https://msdn.microsoft.com/en-us/library/windows/desktop/bb776914.aspx
https://msdn.microsoft.com/en-us/library/windows/desktop/bb776885.aspx
GetCurrentDirectory()

64-bit
Wow64EnableWow64FsRedirection() only for system32;
lnk file with parameters need 64-bit version!
*/

#define STRICT

#ifndef UNICODE
#define T_MAX_PATH MAX_PATH
#else
#define T_MAX_PATH 32767
#endif

#include <tchar.h>

#include <windows.h>

#include <windowsx.h>
#include <shlobj.h>
#include <shlwapi.h>
#include <commdlg.h>

// tcc, any other compiler support wWinMain() and '__argc/__targv'
// shlguid.h
DEFINE_GUID(IID_IDropTarget, 0x00000122, 0x0000, 0x0000, 0xc0,0x00, 0x00,0x00,0x00,0x00,0x00,0x46);
DEFINE_GUID(IID_IDataObject, 0x0000010e, 0x0000, 0x0000, 0xc0,0x00, 0x00,0x00,0x00,0x00,0x00,0x46);

#define WINGDIPAPI __stdcall
#define GDIPCONST const

typedef enum GpStatus {
    Ok = 0,
    GenericError = 1,
    InvalidParameter = 2,
    OutOfMemory = 3,
    ObjectBusy = 4,
    InsufficientBuffer = 5,
    NotImplemented = 6,
    Win32Error = 7,
    WrongState = 8,
    Aborted = 9,
    FileNotFound = 10,
    ValueOverflow = 11,
    AccessDenied = 12,
    UnknownImageFormat = 13,
    FontFamilyNotFound = 14,
    FontStyleNotFound = 15,
    NotTrueTypeFont = 16,
    UnsupportedGdiplusVersion = 17,
    GdiplusNotInitialized = 18,
    PropertyNotFound = 19,
    PropertyNotSupported = 20,
    ProfileNotFound = 21
} GpStatus;

typedef DWORD ARGB;
typedef void GpBitmap;
typedef void *DebugEventProc;
typedef GpStatus (WINGDIPAPI *NotificationHookProc)(ULONG_PTR *token);
typedef VOID (WINGDIPAPI *NotificationUnhookProc)(ULONG_PTR token);

typedef struct GdiplusStartupInput {
    UINT32 GdiplusVersion;
    DebugEventProc DebugEventCallback;
    BOOL SuppressBackgroundThread;
    BOOL SuppressExternalCodecs;
} GdiplusStartupInput;

typedef struct GdiplusStartupOutput {
    NotificationHookProc NotificationHook;
    NotificationUnhookProc NotificationUnhook;
} GdiplusStartupOutput;

GpStatus WINGDIPAPI GdiplusStartup(ULONG_PTR *, GDIPCONST GdiplusStartupInput *, GdiplusStartupOutput *);
VOID WINGDIPAPI GdiplusShutdown(ULONG_PTR);
GpStatus WINGDIPAPI GdipCreateBitmapFromHICON(HICON hicon, GpBitmap **bitmap);
GpStatus WINGDIPAPI GdipCreateHBITMAPFromBitmap(GpBitmap *bitmap, HBITMAP *hbmReturn, ARGB background);
VOID WINGDIPAPI GdipFree(VOID *);

#define IDM_SENDTOFIRST 0

TCHAR   *g_FOLDER_SENDTO;
TCHAR   **g_PSENDTO;                    /* Store the shourtcuts full path */
UINT    g_idm = IDM_SENDTOFIRST;

HBITMAP *g_hBmpImageA;                  /* MenuItemBitmap */

HINSTANCE       g_hinst;                /* My hinstance */
HMENU           g_hmenuSendTo;          /* My SendTo popup */
LPSHELLFOLDER   g_psfDesktop;           /* The desktop folder */

UINT g_FORKING = 0;   /* compatible with UAC focus changes */

LPSHELLFOLDER PIDL2PSF(LPITEMIDLIST pidl)
{
    LPSHELLFOLDER psf = NULL;

    if (pidl) {
        g_psfDesktop->lpVtbl->BindToObject(g_psfDesktop, pidl, NULL, &IID_IShellFolder, (LPVOID *)&psf);
    }
    return psf;
}

LPITEMIDLIST PidlFromPath(HWND hwnd, LPCTSTR pszPath)
{
    LPITEMIDLIST pidl;
    ULONG ulEaten;
    DWORD dwAttributes;
    HRESULT hres;
    WCHAR *wszName;

    wszName = calloc(T_MAX_PATH + 1, sizeof(WCHAR));
#ifdef UNICODE
    if (wcslen(pszPath) >= T_MAX_PATH) {return NULL;}
    wcscpy(wszName, pszPath);
#else
    if (!MultiByteToWideChar(CP_ACP, 0, pszPath, -1, wszName, T_MAX_PATH)) {
        return NULL;
    }
#endif
    hres = g_psfDesktop->lpVtbl->ParseDisplayName(g_psfDesktop, hwnd, NULL, wszName, &ulEaten, &pidl, &dwAttributes);
    free(wszName);
    if (FAILED(hres)) {
        return NULL;
    }
    return pidl;
}

LPSHELLFOLDER GetFolder(HWND hwnd, LPCTSTR pszPath)
{
    LPITEMIDLIST pidl;

    pidl = PidlFromPath(hwnd, pszPath);
    return PIDL2PSF(pidl);
}

HRESULT GetUIObjectOfAbsPidls(HWND hwnd, LPITEMIDLIST *pidls, INT NumOfpidls, REFIID riid, LPVOID *ppvOut)
{
    LPITEMIDLIST *pidlLasts;
    LPSHELLFOLDER psf;
    HRESULT hres;
    INT i;

    *ppvOut = NULL;
    pidlLasts = malloc(sizeof(LPITEMIDLIST) * NumOfpidls);
    if (pidlLasts == NULL) return E_FAIL;

    for (i = 0; i < NumOfpidls; i++) {
        hres = SHBindToParent(pidls[i], &IID_IShellFolder, (LPVOID *)&psf, (LPCITEMIDLIST *)&pidlLasts[i]);
        if (FAILED(hres)) goto Fail;
        if (i < NumOfpidls - 1) psf->lpVtbl->Release(psf);
    }
    hres = psf->lpVtbl->GetUIObjectOf(psf, hwnd, NumOfpidls, pidlLasts, riid, NULL, ppvOut);
Fail:
    psf->lpVtbl->Release(psf);
    return hres;
}

HRESULT GetUIObjectOfPaths(HWND hwnd, LPCTSTR *pszPaths, INT NumOfPaths, REFIID riid, LPVOID *ppvOut)
{
    LPITEMIDLIST *pidls;
    HRESULT hres;
    INT i;

    *ppvOut = NULL;
    pidls = malloc(sizeof(LPITEMIDLIST) * NumOfPaths);
    if (pidls == NULL) return E_FAIL;

    for (i = 0; i < NumOfPaths; i++) {
        pidls[i] = PidlFromPath(hwnd, pszPaths[i]);
        if (pidls[i] == NULL) goto Fail;
    }
    hres = GetUIObjectOfAbsPidls(hwnd, pidls, NumOfPaths, riid, ppvOut);
Fail:
    for (i = 0; i < NumOfPaths; i++) {
        CoTaskMemFree(pidls[i]);
    }
    free(pidls);
    return hres;
}

void DoDrop(LPDATAOBJECT pdto, LPDROPTARGET pdt)
{
    POINTL pt = { 0, 0 };
    DWORD dwEffect;
    HRESULT hres;

    dwEffect = DROPEFFECT_COPY | DROPEFFECT_MOVE | DROPEFFECT_LINK;
    hres = pdt->lpVtbl->DragEnter(pdt, pdto, MK_LBUTTON, pt, &dwEffect);
    if (SUCCEEDED(hres) && dwEffect) {
        hres = pdt->lpVtbl->Drop(pdt, pdto, MK_LBUTTON, pt, &dwEffect);
    }
    else {
        hres = pdt->lpVtbl->DragLeave(pdt);
    }
}

LPTSTR pidl_to_name(LPSHELLFOLDER psf, LPITEMIDLIST pidl, SHGDNF uFlags) {
    HRESULT hres;
    STRRET str;
    LPTSTR pszName = NULL;

    hres = psf->lpVtbl->GetDisplayNameOf(psf, pidl, uFlags, &str);
    if (hres == S_OK) {
        hres = StrRetToStr(&str, pidl, &pszName);
    }
    return pszName;
}

BOOL GethBitMapByPath(LPTSTR pszPath, HBITMAP *phbmp) {
    SHFILEINFO ShFI = {0};
    BOOL hasBmpImage = FALSE;

    if (SUCCEEDED(SHGetFileInfo(pszPath, FILE_ATTRIBUTE_NORMAL, &ShFI, sizeof(SHFILEINFO), SHGFI_ICON | SHGFI_SMALLICON | SHGFI_USEFILEATTRIBUTES))) {
        GpBitmap *bitmap = NULL;
        if (GdipCreateBitmapFromHICON(ShFI.hIcon, &bitmap) == Ok) {
            hasBmpImage = !(GdipCreateHBITMAPFromBitmap(bitmap, phbmp, 0));
            GdipFree(bitmap);
        }
        DestroyIcon(ShFI.hIcon);
    }
    return hasBmpImage;
}

void FolderToMenu(HWND hwnd, HMENU hmenu, LPCTSTR pszFolder)
{
    LPSHELLFOLDER psf;
    HRESULT hres;
    STRRET str;

    /* OS_WOW6432 */
    if ((PROC)(GetProcAddress(GetModuleHandle(_T("Shlwapi")), (LPCSTR)437))(30)) {
        AppendMenu(hmenu, MF_GRAYED | MF_DISABLED | MF_STRING, g_idm, TEXT("64-bit OS needs 64-bit version :p"));
       return;
    }

    psf = GetFolder(hwnd, pszFolder);
    if (psf) {
        LPENUMIDLIST peidl;
        hres = psf->lpVtbl->EnumObjects(psf, hwnd, SHCONTF_FOLDERS | SHCONTF_NONFOLDERS, &peidl);
        if (SUCCEEDED(hres)) {
            LPITEMIDLIST pidl;
            MENUITEMINFO mii;
            MENUINFO mi;
            BOOL hasBmpImage;
            while (peidl->lpVtbl->Next(peidl, 1, &pidl, NULL) == S_OK) {
                LPTSTR pszPath, pszName;
                //
                pszPath = pidl_to_name(psf, pidl, SHGDN_FORPARSING);
                pszName = pidl_to_name(psf, pidl, SHGDN_NORMAL);
                //
                // Path should be enough.
                CoTaskMemFree(pidl);
                if (pszPath == NULL || pszName == NULL) {continue;}
                //
                // Store the path to retrieve, as we check if it is a dir and launch it later.
                g_PSENDTO = (TCHAR **)realloc(g_PSENDTO, sizeof(TCHAR *) * (g_idm - IDM_SENDTOFIRST + 1));
                if (g_PSENDTO == NULL) {continue;}
                g_PSENDTO[g_idm] = _tcsdup(pszPath);
                //
                // Icon
                g_hBmpImageA = (HBITMAP *)realloc(g_hBmpImageA, sizeof(HBITMAP *) * (g_idm - IDM_SENDTOFIRST + 1));
                hasBmpImage = GethBitMapByPath(pszPath, &g_hBmpImageA[g_idm]);
                //
                if (PathIsDirectory(pszPath)) {
                    HMENU hSubMenu = CreatePopupMenu();
                    if (AppendMenu(hmenu, MF_ENABLED | MF_POPUP | MF_STRING, (UINT)hSubMenu, pszName)) {
                        mi.cbSize = sizeof(mi);
                        mi.fMask = MIM_HELPID;
                        mi.dwContextHelpID = g_idm;
                        SetMenuInfo(hSubMenu, &mi);
                        g_idm++;
                    }
                }
                else {
                    if (AppendMenu(hmenu, MF_ENABLED | MF_STRING, g_idm, pszName)) {
                        mii.cbSize = sizeof(mii);
                        mii.fMask = MIIM_DATA;
                        if (hasBmpImage) {
                            mii.fMask |= MIIM_BITMAP;
                            mii.hbmpItem = g_hBmpImageA[g_idm];
                        }
                        SetMenuItemInfo(hmenu, g_idm, FALSE, &mii);
                        g_idm++;
                    }
                }
                //
                CoTaskMemFree(pszPath);
                CoTaskMemFree(pszName);
            }
            peidl->lpVtbl->Release(peidl);
        }
        psf->lpVtbl->Release(psf);
    }

    if (g_idm == IDM_SENDTOFIRST) {
        AppendMenu(hmenu, MF_GRAYED | MF_DISABLED | MF_STRING, g_idm, TEXT("Send what sent to me to my sendto ^_^"));
    }
}

void SendTo_OnInitMenuPopup(HWND hwnd, HMENU hmenu, UINT item, BOOL fSystemMenu)
{
    if (GetMenuItemCount(hmenu) > 0) {return;}
    if (hmenu == g_hmenuSendTo) { /* :p only top level */
        FolderToMenu(hwnd, hmenu, g_FOLDER_SENDTO);
    }
    else {
        MENUINFO mi;
        mi.cbSize = sizeof(mi);
        mi.fMask = MIM_HELPID;
        if (GetMenuInfo(hmenu, &mi)) {
            FolderToMenu(hwnd, hmenu, g_PSENDTO[mi.dwContextHelpID]);
        }
    }
}

void SendTo_SendToItem(HWND hwnd, int idm)
{
    HRESULT hres;

    g_FORKING = 1;
    if (__argc == 1) {
        ShellExecute(NULL, NULL, g_PSENDTO[idm], NULL, NULL, SW_SHOWDEFAULT);
    }
    else {
        LPDATAOBJECT pdto;
        LPDROPTARGET pdt;
        hres = GetUIObjectOfPaths(hwnd, &g_PSENDTO[idm], 1, &IID_IDropTarget, (LPVOID *)&pdt);
        if (SUCCEEDED(hres)) {
            /* First convert all filenames to a data object. */
            hres = GetUIObjectOfPaths(hwnd, __targv + 1, __argc - 1, &IID_IDataObject, (LPVOID *)&pdto);
            if (SUCCEEDED(hres)) {
                    /* Now drop the file on the drop target. */
                    DoDrop(pdto, pdt);
                    pdt->lpVtbl->Release(pdt);
            }
        }
        pdto->lpVtbl->Release(pdto);
    }
    // Exit as done!
    g_FORKING = 0;
    PostQuitMessage(0);
}

void SendTo_OnCommand(HWND hwnd, int id, HWND hwndCtl, UINT codeNotify)
{
    SendTo_SendToItem(hwnd, id);
}

BOOL SendTo_OnCreate(HWND hwnd, LPCREATESTRUCT lpCreateStruct)
{
    g_hmenuSendTo = CreatePopupMenu();
    return TRUE;
}

/* UAC focus changes!!! */
void SendTo_OnKillFocus(HWND hwnd, HWND hwndOldFocus)
{
    if (g_FORKING == 0) PostQuitMessage(0);
}

LRESULT CALLBACK SendTo_WndProc(HWND hwnd, UINT uiMsg, WPARAM wParam, LPARAM lParam)
{
    switch (uiMsg) {
    HANDLE_MSG(hwnd, WM_CREATE, SendTo_OnCreate);
    HANDLE_MSG(hwnd, WM_INITMENUPOPUP, SendTo_OnInitMenuPopup);
    HANDLE_MSG(hwnd, WM_COMMAND, SendTo_OnCommand);
    HANDLE_MSG(hwnd, WM_KILLFOCUS, SendTo_OnKillFocus);
    }

    return DefWindowProc(hwnd, uiMsg, wParam, lParam);
}

BOOL InitApp(void)
{
    WNDCLASS wc;
    HRESULT hr;

    wc.style = 0;
    wc.lpfnWndProc = SendTo_WndProc;
    wc.cbClsExtra = 0;
    wc.cbWndExtra = 0;
    wc.hInstance = g_hinst;
    wc.hIcon = NULL;
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
    wc.lpszMenuName = NULL;
    wc.lpszClassName = TEXT("SendTo+");

    RegisterClass(&wc);

    hr = SHGetDesktopFolder(&g_psfDesktop);
    if (FAILED(hr)) {
        return FALSE;
    }

    g_FOLDER_SENDTO = calloc(T_MAX_PATH + 1, sizeof(TCHAR));
    if (g_FOLDER_SENDTO == NULL) {return FALSE;}

    return TRUE;
}

void TermApp(void)
{
    int i, n;

    if (g_psfDesktop) {
        g_psfDesktop->lpVtbl->Release(g_psfDesktop);
        g_psfDesktop = NULL;
    }
    n = g_idm - IDM_SENDTOFIRST;
    for (i = 0; i < n; i++) {
        free(g_PSENDTO[i]);
        DeleteObject(&g_hBmpImageA[i]);
    }
    free(g_PSENDTO);
    free(g_FOLDER_SENDTO);
    free((void **)g_hBmpImageA);
}

int WINAPI _tWinMain(HINSTANCE hinst, HINSTANCE hinstPrev, LPTSTR lpCmdLine, int nCmdShow) 
{
    MSG msg;
    HWND hwnd;
    HRESULT hrInit;
    POINT pt = {0, 0};
    ULONG_PTR           gdiplusToken;
    GdiplusStartupInput gdiplusStartupInput = {1, NULL, FALSE, TRUE}; // MUST!

    g_hinst = hinst;

    if (!InitApp()) return 1;
    if (GetFullPathName(TEXT("sendto"), T_MAX_PATH, g_FOLDER_SENDTO, NULL) == 0) {return 2;}
    GdiplusStartup(&gdiplusToken, &gdiplusStartupInput, NULL);
    hrInit = CoInitialize(NULL);

    hwnd = CreateWindow(
        TEXT("SendTo+"),                /* Class Name */
        TEXT("lifenjoiner"),            /* Title */
        WS_POPUP,                       /* Style */
        CW_USEDEFAULT, CW_USEDEFAULT,   /* Position */
        0, 0,                           /* Size */
        NULL,                           /* Parent */
        NULL,                           /* No menu */
        hinst,                          /* Instance */
        0);                             /* No special parameters */

    SetWindowLong(hwnd, GWL_EXSTYLE, WS_EX_TOOLWINDOW);
    ShowWindow(hwnd, nCmdShow);

    GetCursorPos(&pt);
    TrackPopupMenu(g_hmenuSendTo, TPM_LEFTALIGN, pt.x, pt.y, 0, hwnd, NULL);

    while (GetMessage(&msg, NULL, 0, 0)) {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }

    TermApp();
    GdiplusShutdown(gdiplusToken);

    if (SUCCEEDED(hrInit)) {
        CoUninitialize();
    }

    return 0;
}
