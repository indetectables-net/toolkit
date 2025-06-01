# SendTo Recomposed

A modern, Unicode-only re-implementation of the classic **SendTo+** helper for Windows.  
Compared with the original project, this version is faster, 64-bit clean and shows *custom folder icons* in the popup.  
Licensed under **GPL v3**.
The name of this project is a [tribute to that album.](https://www.youtube.com/playlist?list=OLAK5uy_nlVsyX0dWJn0qJiTWyyxgw7nu_Z7AjeYU)

![](assets/demo.gif)

## Key Ingredients

* **Unicode-only** no ANSI/TCHAR branches – predictable builds 
* **Dark mode ready** Native dark-theme support
* **Custom folder icons** honours `desktop.ini` for nicer menu visuals 
* **Icon cache** a single `SHGetImageList` call – speedy painting 
* **Secure recursion** hidden/system items skipped, depth capped to 4 
* **Robust drag-and-drop** real `IDataObject`, always calls `DragLeave` 
* **Clean shutdown** no GDI, COM or image-list leaks 
* **High-DPI aware** PerMonitorV2 scaling on Windows 10+
* **Custom SendTo directory** Override default via `/D <directory>` switch
* **Native 64-bit** Compiled and tested for x86_64 with no WOW64 redirection issues

## Building

MSVC 

```cmd
rc /r sendto.rc

cl /O2 /MD /DUNICODE /D_UNICODE ^
   sendto.c ^
   ole32.lib shell32.lib shlwapi.lib comctl32.lib user32.lib gdi32.lib uuid.lib

mt -nologo -manifest sendto.manifest -outputresource:sendto.exe;#1
```

The output `sendto.exe` is fully 64-bit.

## Usage

1. Copy the executable anywhere on disk.
2. Run it – a **Send To** style popup appears under the cursor with every item (and sub-folder) from the `sendto` folder located next to the executable.
   - Use `sendto.exe /D <directory>` to point to a custom directory.
   - Use `sendto.exe /?` to display this help message.
3. Either click an entry to launch it, or drag files onto the menu and drop them on a target to perform the same action Explorer would.

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
````

**Usage**

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
* **Complete refactor & modernisation** © 2025 DSR! - xchwarze@gmail.com
