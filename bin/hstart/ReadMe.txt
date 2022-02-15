=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Hidden Start v4.8 for Windows XP/Vista/7/8/10
Copyright (c) 2003-2020 NTWind Software
https://www.ntwind.com/software/hstart.html
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=


Introduction
============

Console applications and batch files are regularly run at Windows startup or in 
a schedule. The main inconvenience of this is that each application opens a 
console window that flickers on the screen. Hidden Start (or Hstart) is a 
lightweight command line utility that allows you to run console applications 
and batch files without any window in the background, handle UAC privilege 
elevation under Windows 7 and Vista, start multiple commands in parallel or 
synchronously, and much more.

Hstart is usually started by entering the following command line:

  hstart /NOCONSOLE "batch_file_1.bat" "batch_file_2.bat" "batch_file_3.bat"

It is possible to redirect the console output of batch files into a log file:

  hstart /NOCONSOLE /IDLE /D="E:\Backups" 
        "cmd.exe /c "MyDailyBackup.bat > backup-log.txt""

The /IDLE command line switch means that the backup process will run with the 
lowest priority class, and /D="" sets the starting directory of the batch file 
(required if the command line or script contain relative paths).

Bypassing UAC is as easy as the following command:

  hstart /NOUAC regedit.exe

For more details, browse the "examples" folder.


Features
========

Hstart is very small (~100 Kb), but it allows you to:

[+] start console applications without any windows in the background
[+] start applications with administrative privileges without UAC prompts
[+] start non-elevated applications from elevated scripts and batch files
[+] start multiple applications in the specified order synchronously
[+] set the working directory and priority class of the created processes
[+] set the startup delay before command execution
[+] show success and error messages after command execution


Usage
=====

Run from command line:

  hstart.exe /[PARAMETERS] /[PRIORITY] [COMMAND LINES]

PARAMETERS:
  /NOCONSOLE - start console applications without any windows
  /ELEVATE or /RUNAS - start applications in elevated mode (Vista/7)
  /NOELEVATE - start applications in non-elevated mode (Vista/7)
  /UAC - run Hstart executable in elevated mode (Vista/7)
  /NOUAC - run apps elevated without any UAC prompts (Vista/7)
  /SHELL - run apps, open docs and URLs in the Windows Shell
  /D=PATH - set the starting directory for executed applications
  /DELAY=N - delay N seconds before command execution
  /WAIT - wait for the application to terminate (run synchronously)
  /WAITINPUT - wait for the user input to set the priority class
  /MSG=TEXT - show the message after command execution
  /TITLE=TEXT - set the title of the message
  /ERR=TEXT - show the error message if an error detected
  /ERRTITLE=TEXT - set the title of the error message
  /SILENT - silent mode, no error messages will be displayed
  /TEST - test mode, see what parameters are passed to Hstart

UAC:
  /REGTASK - register the Hstart UAC task in Task Scheduler
  /UNREGTASK - unregister the Hstart UAC task in Task Scheduler

PRIORITY:
  /REALTIME - realtime priority class
  /HIGH - high priority class
  /ABOVENORMAL - above normal priority class
  /NORMAL - normal priority class
  /BELOWNORMAL - below normal priority class
  /IDLE - idle priority class

Don't forget about quotes when using complex COMMAND LINES:

  hstart.exe /NOCONSOLE /D="C:\Dir 1"  ""C:\Dir 2\test.bat" -param"

For the latest help, FAQ and support, please visit:
https://www.ntwind.com/software/hstart.html

--
Alexander Avdonin

Web: https://www.ntwind.com
Email: alexander@ntwind.com
