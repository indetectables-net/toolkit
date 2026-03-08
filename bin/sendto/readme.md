# SendTo Recomposed

A modern, Unicode-only re-implementation of the classic **SendTo+** helper for Windows.  
Compared with the original project, this version is faster, 64-bit clean and shows *custom folder icons* in the popup.  
Licensed under **GPL v3**.
The name of this project is a [tribute to that album.](https://www.youtube.com/playlist?list=OLAK5uy_nlVsyX0dWJn0qJiTWyyxgw7nu_Z7AjeYU)

![](assets/demo.gif)

## Key Ingredients

* **Unicode-only** – no ANSI/TCHAR branches – predictable builds
* **Dark mode ready** – native dark-theme support
* **Custom folder icons** – honours `desktop.ini` for nicer menu visuals
* **Lazy icon resolution** – icons are resolved on-demand
* **Persistent icon cache** – optional on-disk cache
* **Secure recursion** – hidden/system items skipped, depth capped to 5
* **Robust drag-and-drop** – real `IDataObject` / `IDropTarget` COM interfaces
* **Clean shutdown** – no GDI, COM or image-list leaks
* **High-DPI aware** – PerMonitorV2 scaling on Windows 10+
* **Custom SendTo directory** – override default via `/D <directory>` switch
* **Native 64-bit** – compiled and tested for x86_64 with no WOW64 redirection issues

## Requirements

* **Minimum OS:** Windows 7 (the binary targets `_WIN32_WINNT_WIN7`)
* **Dark mode:** Windows 10 version 1809 or later (automatically detected; safely skipped on older builds)
* **Compiler:** MSVC with C11 support (the source uses designated initialisers, `<stdbool.h>`, and compound literals)

## Building

MSVC

```cmd
rc /r sendto.rc

cl /O2 /MD /DUNICODE /D_UNICODE ^
   sendto.c ^
   ole32.lib shell32.lib shlwapi.lib comctl32.lib user32.lib gdi32.lib uuid.lib

mt -nologo -manifest sendto.manifest -outputresource:sendto.exe;#1
```

> **Note:** the build requires `sendto.rc` (resource script) and `sendto.manifest` (DPI / common-controls manifest) – both are included in the repository alongside `sendto.c`.

The output `sendto.exe` is fully 64-bit.

## Usage

### 1. Prepare the `sendto` folder

Create a folder called **`sendto`** next to the executable and populate it with shortcuts (`.lnk`), executables, or sub-folders that represent your "Send To" targets.  Example layout:

```
C:\Tools\
├── sendto.exe
└── sendto\
    ├── Notepad++.lnk
    ├── 7-Zip.lnk
    ├── Scripts\
    │   ├── compress.bat
    │   └── upload.ps1
    └── Folders\
        ├── Project A.lnk
        └── Backup.lnk
```

### 2. Run

Run the executable – a **Send To** style popup appears under the cursor with every item (and sub-folder) from the `sendto` folder.

### 3. Command-line switches

| Switch | Description |
|---|---|
| `/D <directory>` | Use a custom directory instead of the `sendto` folder next to the executable |
| `/C` | Enable the persistent icon cache (`sendto.cache` is written next to the executable). Speeds up repeated launches by caching resolved icon bitmaps to disk |
| `/?` or `-?` | Display a usage help message |

**Examples:**

```cmd
sendto.exe
sendto.exe /D "D:\My Shortcuts" /C
sendto.exe /C "%1"
```

### 4. Interact

Either click an entry to launch it, or drag files onto the menu and drop them on a target to perform the same action Explorer would.

## How It Works

The program follows a straight-line flow:

1. **Initialise** – `OleInitialize`, common controls, `SHGetDesktopFolder`, dark-mode opt-in.
2. **Parse command line** – extract `/D`, `/C`, `/?` switches; remaining arguments are treated as source files for drag-and-drop.
3. **Enumerate** – `EnumerateFolder` walks the sendto directory recursively (up to depth 5), building a Win32 popup menu.  File icons are **not** resolved here – only directory icons are fetched eagerly.
4. **Display** – `TrackPopupMenuEx` shows the menu at the cursor.  As each submenu opens, `WM_INITMENUPOPUP` lazily resolves shell icons (optionally hitting the persistent cache first).
5. **Act on selection:**
   - **No file arguments** → `ShellExecuteExW` opens the target; the new window is located by PID and forced to the foreground.
   - **With file arguments** → a COM `IDataObject` is built from the source paths, an `IDropTarget` is obtained for the chosen menu entry, and a programmatic `DragEnter` → `Drop` (or `DragLeave`) is performed.  A `WinEvent` hook captures the foreground window activated by the drop so it can be brought forward.
6. **Tear down** – persist the icon cache (if dirty), release COM objects, uninitialise OLE.

## Context-Menu Integration

To register **SendTo Recomposed** in the Windows right-click menu for files and folders, create this `.reg`:

```reg
Windows Registry Editor Version 5.00

; ── Add "Send To+" for all files
[HKEY_CLASSES_ROOT\*\shell\SendToRecomposed]
@="Send To+"
"Icon"="\"%ProgramFiles%\\SendTo Recomposed\\sendto.exe\""

[HKEY_CLASSES_ROOT\*\shell\SendToRecomposed\command]
@="\"%ProgramFiles%\\SendTo Recomposed\\sendto.exe\" \"%1\""

; ── Add "Send To+" for folders
[HKEY_CLASSES_ROOT\Directory\shell\SendToRecomposed]
@="Send To+"
"Icon"="\"%ProgramFiles%\\SendTo Recomposed\\sendto.exe\""

[HKEY_CLASSES_ROOT\Directory\shell\SendToRecomposed\command]
@="\"%ProgramFiles%\\SendTo Recomposed\\sendto.exe\" \"%1\""
```

**Steps:**

1. Copy `sendto.exe` into `C:\Program Files\SendTo Recomposed\`.
2. Save the above as `add-context-menu.reg` and double-click to merge into your registry.
3. Right-click any file or folder and select **Send To+**.

To unregister, create a `.reg` with these deletions:

```reg
Windows Registry Editor Version 5.00

[-HKEY_CLASSES_ROOT\*\shell\SendToRecomposed]
[-HKEY_CLASSES_ROOT\Directory\shell\SendToRecomposed]
```

## License

This code is released under the **GNU General Public License v3.0**.
See [LICENSE](LICENSE.txt) for full text.

## Credits

* **Original concept & code** © 2017 lifenjoiner
* **Complete refactor & modernisation** © 2025 DSR! – xchwarze@gmail.com