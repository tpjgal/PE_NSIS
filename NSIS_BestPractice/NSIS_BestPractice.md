
START 

```
; Example NSIS Installer Script with Comments

; Set the name and version of the installer
Name "MyApp Installer" ; Name of the installer displayed to the user
OutFile "MyAppSetup.exe" ; Output executable file name

; Define installation directory and requested execution level
InstallDir "$ProgramFiles\MyApp" ; Default installation directory
RequestExecutionLevel user ; Requested execution level for installer

; Include Modern UI for a better user experience
!include "MUI2.nsh"

; Define sections
Section "Main Application" SEC_MAIN
    ; Set installation directory and copy files
    SetOutPath $INSTDIR
    File "MyApp.exe"
    File "README.txt"
    ; Create uninstaller
    WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

Section "Start Menu Shortcut" SEC_SHORTCUT
    ; Create Start menu shortcut
    CreateDirectory "$SMPROGRAMS\MyApp"
    CreateShortCut "$SMPROGRAMS\MyApp\MyApp.lnk" "$INSTDIR\MyApp.exe"
SectionEnd

; Define uninstaller section
Section "Uninstall"
    ; Remove installed files and shortcuts
    Delete "$INSTDIR\MyApp.exe"
    Delete "$INSTDIR\README.txt"
    Delete "$SMPROGRAMS\MyApp\MyApp.lnk"
    RMDir "$SMPROGRAMS\MyApp"
    Delete "$INSTDIR\Uninstall.exe"
    RMDir "$INSTDIR"
SectionEnd

; Include additional configuration options
!include "Sections.nsh"

; Define custom functions
Function .onInit
    ; Display welcome message
    MessageBox MB_OK "Welcome to MyApp Installer!"
FunctionEnd

Function .onInstSuccess
    ; Display installation success message
    MessageBox MB_OK "MyApp has been successfully installed."
FunctionEnd

Function .onGUIEnd
    ; Prompt user to launch the application after installation
    MessageBox MB_YESNO "Do you want to launch MyApp now?" IDYES launchApp
    launchApp:
    ; Launch the application if user chooses to
    ExecWait "$INSTDIR\MyApp.exe"
FunctionEnd

; Define language strings
LangString DESC_SecMain ${LANG_ENGLISH} "Main Application Files"
LangString DESC_SecShortcut ${LANG_ENGLISH} "Start Menu Shortcut"

; Define interface options
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Define installer attributes
!define MUI_ICON "MyApp.ico"
!define MUI_UNICON "MyApp.ico"

; Additional settings
SetCompressor /SOLID lzma ; Set compression method
SetCompressorDictSize 32 ; Set compression dictionary size

; Compile the script
!include "LogicLib.nsh"
!include "FileFunc.nsh"
!include "WinMessages.nsh"
!include "Sections.nsh"
!include "WordFunc.nsh"
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_MAIN} $(DESC_SecMain)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_SHORTCUT} $(DESC_SecShortcut)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

; Uninstaller
UninstallText "Uninstall MyApp"

```


```
; Example NSIS Installer Script with Detailed Comments

; Set the name and version of the installer
Name "MyApp Installer" ; Name displayed during installation
OutFile "MyAppSetup.exe" ; Output executable file name

; Define installation directory and requested execution level
InstallDir "$ProgramFiles\MyApp" ; Default installation directory
RequestExecutionLevel user ; Requested execution level for installer

; Include Modern UI for a better user experience
!include "MUI2.nsh"

; Define sections

; Main Application section
Section "Main Application" SEC_MAIN
    ; Set installation directory and copy files
    SetOutPath $INSTDIR ; Set the installation directory
    File "MyApp.exe" ; Copy MyApp executable
    File "README.txt" ; Copy README file
    ; Create uninstaller
    WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

; Start Menu Shortcut section
Section "Start Menu Shortcut" SEC_SHORTCUT
    ; Create Start menu shortcut
    CreateDirectory "$SMPROGRAMS\MyApp" ; Create directory in Start menu
    CreateShortCut "$SMPROGRAMS\MyApp\MyApp.lnk" "$INSTDIR\MyApp.exe" ; Create shortcut to MyApp
SectionEnd

; Define uninstaller section
Section "Uninstall"
    ; Remove installed files and shortcuts
    Delete "$INSTDIR\MyApp.exe" ; Delete MyApp executable
    Delete "$INSTDIR\README.txt" ; Delete README file
    Delete "$SMPROGRAMS\MyApp\MyApp.lnk" ; Delete Start menu shortcut
    RMDir "$SMPROGRAMS\MyApp" ; Remove Start menu directory
    Delete "$INSTDIR\Uninstall.exe" ; Delete uninstaller
    RMDir "$INSTDIR" ; Remove installation directory
SectionEnd

; Include additional configuration options
!include "Sections.nsh"

; Define custom functions

; Initialization function
Function .onInit
    ; Display welcome message
    MessageBox MB_OK "Welcome to MyApp Installer!"
FunctionEnd

; Installation success function
Function .onInstSuccess
    ; Display installation success message
    MessageBox MB_OK "MyApp has been successfully installed."
FunctionEnd

; GUI end function
Function .onGUIEnd
    ; Prompt user to launch the application after installation
    MessageBox MB_YESNO "Do you want to launch MyApp now?" IDYES launchApp
    launchApp:
    ; Launch the application if user chooses to
    ExecWait "$INSTDIR\MyApp.exe"
FunctionEnd

; Define language strings
LangString DESC_SecMain ${LANG_ENGLISH} "Main Application Files"
LangString DESC_SecShortcut ${LANG_ENGLISH} "Start Menu Shortcut"

; Define interface options
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Define installer attributes
!define MUI_ICON "MyApp.ico"
!define MUI_UNICON "MyApp.ico"

; Additional settings
SetCompressor /SOLID lzma ; Set compression method
SetCompressorDictSize 32 ; Set compression dictionary size

; Compile the script
!include "LogicLib.nsh"
!include "FileFunc.nsh"
!include "WinMessages.nsh"
!include "Sections.nsh"
!include "WordFunc.nsh"
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_MAIN} $(DESC_SecMain)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_SHORTCUT} $(DESC_SecShortcut)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

; Uninstaller
UninstallText "Uninstall MyApp"

```



1. **Name and Version** : Set the name and version of the installer using `Name` and `OutFile` directives.
2. **Installation Directory** : Define the default installation directory using `InstallDir`.
3. **Execution Level** : Specify the requested execution level for the installer using `RequestExecutionLevel`.
4. **Modern UI** : Include Modern UI components for a better user experience using `!include "MUI2.nsh"`.
5. **Sections** : Define installer sections for different components of the application.
6. **Files and Shortcuts** : Copy files and create shortcuts during installation using `File`, `SetOutPath`, `CreateShortCut`.
7. **Uninstaller** : Define an uninstaller section to remove installed files and shortcuts.
8. **Custom Functions** : Define custom functions for initialization, installation success, and GUI interactions.
9. **Language Strings** : Define language strings for multi-language support.
10. **Interface Options** : Define interface options for the installer using macros like `MUI_PAGE_COMPONENTS`.
11. **Installer Attributes** : Define installer attributes such as icons using `!define`.
12. **Compression** : Set compression method and dictionary size using `SetCompressor`.
13. **Compilation** : Compile the script and include necessary NSIS libraries.
14. **Uninstaller Text** : Define text for the uninstaller using `UninstallText`.

```
; Example NSIS Installer Script with Detailed Comments

; Set the name and version of the installer
Name "MyApp Installer" ; Name displayed during installation
OutFile "MyAppSetup.exe" ; Output executable file name

; Define installation directory and requested execution level
InstallDir "$ProgramFiles\MyApp" ; Default installation directory
RequestExecutionLevel user ; Requested execution level for installer

; Include Modern UI for a better user experience
!include "MUI2.nsh"

; Define sections

; Main Application section
Section "Main Application" SEC_MAIN
    ; Set installation directory and copy files
    SetOutPath $INSTDIR ; Set the installation directory
    File "MyApp.exe" ; Copy MyApp executable
    File "README.txt" ; Copy README file
    ; Create uninstaller
    WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

; Start Menu Shortcut section
Section "Start Menu Shortcut" SEC_SHORTCUT
    ; Create Start menu shortcut
    CreateDirectory "$SMPROGRAMS\MyApp" ; Create directory in Start menu
    CreateShortCut "$SMPROGRAMS\MyApp\MyApp.lnk" "$INSTDIR\MyApp.exe" ; Create shortcut to MyApp
SectionEnd

; Define uninstaller section
Section "Uninstall"
    ; Remove installed files and shortcuts
    Delete "$INSTDIR\MyApp.exe" ; Delete MyApp executable
    Delete "$INSTDIR\README.txt" ; Delete README file
    Delete "$SMPROGRAMS\MyApp\MyApp.lnk" ; Delete Start menu shortcut
    RMDir "$SMPROGRAMS\MyApp" ; Remove Start menu directory
    Delete "$INSTDIR\Uninstall.exe" ; Delete uninstaller
    RMDir "$INSTDIR" ; Remove installation directory
SectionEnd

; Include additional configuration options
!include "Sections.nsh"

; Define custom functions

; Initialization function
Function .onInit
    ; Display welcome message
    MessageBox MB_OK "Welcome to MyApp Installer!"
FunctionEnd

; Installation success function
Function .onInstSuccess
    ; Display installation success message
    MessageBox MB_OK "MyApp has been successfully installed."
FunctionEnd

; GUI end function
Function .onGUIEnd
    ; Prompt user to launch the application after installation
    MessageBox MB_YESNO "Do you want to launch MyApp now?" IDYES launchApp
    launchApp:
    ; Launch the application if user chooses to
    ExecWait "$INSTDIR\MyApp.exe"
FunctionEnd

; Define language strings
LangString DESC_SecMain ${LANG_ENGLISH} "Main Application Files"
LangString DESC_SecShortcut ${LANG_ENGLISH} "Start Menu Shortcut"

; Define interface options
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Define installer attributes
!define MUI_ICON "MyApp.ico"
!define MUI_UNICON "MyApp.ico"

; Additional settings
SetCompressor /SOLID lzma ; Set compression method
SetCompressorDictSize 32 ; Set compression dictionary size

; Compile the script
!include "LogicLib.nsh"
!include "FileFunc.nsh"
!include "WinMessages.nsh"
!include "Sections.nsh"
!include "WordFunc.nsh"
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_MAIN} $(DESC_SecMain)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_SHORTCUT} $(DESC_SecShortcut)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

; Uninstaller
UninstallText "Uninstall MyApp"

```


In NSIS (Nullsoft Scriptable Install System), system-related code typically involves performing actions related to the operating system or system environment during the installation or uninstallation process. Here are some common system-related tasks and corresponding NSIS script commands:

Registry Operations:

Writing to the registry:

```
WriteRegStr HKCU "Software\MyApp" "Version" "1.0"
```

Reading from the registry:

```
ReadRegStr $0 HKCU "Software\MyApp" "Version"
```


File Operations:

Copying files:

```
File "MyApp.exe"
```

Deleting files:

```
Delete "$INSTDIR\MyApp.exe"
```


Directory Operations:

Creating directories:

```
CreateDirectory "$INSTDIR\SubDirectory"
```

Deleting directories:

```
RMDir "$INSTDIR\SubDirectory"
```


Shortcut Operations:

Creating shortcuts:

```
CreateShortCut "DESKTOP\MyApp.lnk" "DESKTOP\MyApp.lnk""INSTDIR\MyApp.exe"
```


Deleting shortcuts:

Delete "$DESKTOP\MyApp.lnk"


Process Execution:

Executing external commands:

```
ExecWait '"$INSTDIR\MyApp.exe" /silent' $0
```

Executing commands asynchronously:

```
nsExec::Exec '"$INSTDIR\MyApp.exe" /silent'
Pop $0
```


Environment Variables:

Setting environment variables:

```
System::Call 'Kernel32::SetEnvironmentVariable(t "PATH", t "C:\NewPath")'
```


Getting environment variables:


```
System::Call 'Kernel32::GetEnvironmentVariable(t "PATH", t R0, i ${NSIS_MAX_STRLEN})'
```


Service Management:

Starting, stopping, and managing services:

```
ServiceStartService "MyService"
ServiceStopService "MyService" $R0
```


Registry Permissions:

Setting registry key permissions:

```
SetRegView 64
AccessControl::GrantOnRegKey HKLM "SOFTWARE\MyApp" "(BU)" "Read" "(DENY)"
```


System Information:

Retrieving system information:

```
System::Call 'Kernel32::GetWindowsDirectory(t .R0, i ${NSIS_MAX_STRLEN})'
MessageBox MB_OK "Windows directory: $0"
```


User Account Control (UAC):

Elevating privileges:

```
RequestExecutionLevel admin
```

Checking if running with elevated privileges:

```
!include UAC.nsh
!insertmacro UAC_IsUserAnAdmin
Pop $0
StrCmp $0 "admin" 0 noAdmin
MessageBox MB_OK "Running with elevated privileges"
noAdmin:
```

INI File Operations:

Writing to an INI file:

```
WriteINIStr "$INSTDIR\settings.ini" "Section" "Key" "Value"
```


Reading from an INI file:

```
ReadINIStr 0 "0"INSTDIR\settings.ini" "Section" "Key"
```


User Input:

Prompting the user for input:

```
MessageBox MB_YESNO "Do you want to continue?" IDYES continue
continue:
```

Asking the user to select a directory:

```
!define MUI_DIRECTORYPAGE_TEXT_TOP "Select the installation directory:"
!insertmacro MUI_PAGE_DIRECTORY
```


System Reboot:

Prompting the user to reboot the system:

```
MessageBox MB_YESNO|MB_ICONQUESTION "Installation complete. Restart now?" IDYES reboot
reboot:Forcing a 
```

system reboot:

```
Reboot
```


File Associations:

Creating file associations:

```
SetShellVarContext all
WriteRegStr HKCR ".ext" "" "MyApp.Document"
WriteRegStr HKCR "MyApp.Document" "" "MyApp Document"
WriteRegStr HKCR "MyApp.Document\DefaultIcon" "" "$INSTDIR\MyApp.exe,1"
WriteRegStr HKCR "MyApp.Document\Shell\Open\Command" "" '"$INSTDIR\MyApp.exe" "%1"'
```


Message Box Customization:

Customizing message box appearance:

```
MessageBox MB_YESNO|MB_ICONEXCLAMATION|MB_DEFBUTTON2 "Are you sure you want to delete this file?" IDYES delete
delete:
```


Network Operations:

Checking network connectivity:

```
nsisnet::IsOnline
Pop $0 ; $0 will be 1 if online, 0 if offline
```


Version Information:

Getting file version information:

```
GetFileVersion "$INSTDIR\MyApp.exe" $0 $1 $2 $3
MessageBox MB_OK "File version: $0.$1.$2.$3"
```


Service Installation and Configuration:

Installing and configuring a Windows service:

```

ExecWait '"$INSTDIR\ServiceInstaller.exe" /install /silent'
ExecWait '"$INSTDIR\ServiceConfigurator.exe" /config MyAppService'
```


Firewall Configuration:

Adding firewall rules:

```
nsFirewall::AddRule "MyApp" "INSTDIR\MyApp.exe" "INSTDIR\MyApp.exe""INSTDIR\MyApp.exe" "TCP" "80" "Allow MyApp on port 80"
```


Error Handling:

Handling errors gracefully:

```
Catch
MessageBox MB_ICONSTOP "An error occurred during installation."
```



```

; Script generated by the HM NIS Edit Script Wizard.

; Define the name and version of the installer
Name "MyApp Installer"
OutFile "MyAppSetup.exe"

; Set the default installation directory
InstallDir "$PROGRAMFILES\MyApp"

; Define the components and tasks for installation
Section "MyApp" SecMyApp
    SetOutPath $INSTDIR
    ; Copy application files
    File "MyApp.exe"
    File "README.txt"
SectionEnd

; Define additional components and tasks as needed...

; Add Start Menu shortcut
Section "Start Menu Shortcut" SecShortcut
    CreateDirectory "$SMPROGRAMS\MyApp"
    CreateShortCut "$SMPROGRAMS\MyApp\MyApp.lnk" "$INSTDIR\MyApp.exe"
SectionEnd

; Define uninstaller
Section "Uninstall"
    ; Remove installed files
    Delete "$INSTDIR\MyApp.exe"
    Delete "$INSTDIR\README.txt"
    ; Remove Start Menu shortcut
    Delete "$SMPROGRAMS\MyApp\MyApp.lnk"
    RMDir "$SMPROGRAMS\MyApp"
    ; Remove installation directory
    RMDir "$INSTDIR"
SectionEnd

; Specify language and interface options
LangString DESC_SecMyApp ${LANG_ENGLISH} "MyApp Application Files"
LangString DESC_SecShortcut ${LANG_ENGLISH} "Start Menu Shortcut"

!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Compile the script
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS
!insertmacro MUI_PAGE_LICENSE "License.txt"

; Add icon and branding
!define MUI_ICON "MyApp.ico"
!define MUI_UNICON "MyApp.ico"

; Set compression level
SetCompressor /SOLID lzma

; Build installer
Section "Install"
    SetOutPath "$INSTDIR"
    File MyApp.exe
    File README.txt
SectionEnd

; Set uninstaller options
UninstallText "Uninstall MyApp"

```



Shortcuts

```
; Script generated by the HM NIS Edit Script Wizard.

; Define the name and version of the installer
Name "Shortcut Creator"
OutFile "ShortcutCreator.exe"

; Define the default installation directory
InstallDir "$PROGRAMFILES\ShortcutCreator"

; Define the program executable and desktop shortcut
Var ProgramExe
Var ProgramShortcut

; Function to create program and desktop shortcuts
Function CreateShortcuts
    CreateShortCut "$SMPROGRAMS\ShortcutCreator.lnk" "$INSTDIR\ShortcutCreator.exe" ; Create Start Menu shortcut
    CreateShortCut "$DESKTOP\ShortcutCreator.lnk" "$INSTDIR\ShortcutCreator.exe" ; Create desktop shortcut
FunctionEnd

; Define components and tasks for installation
Section "ShortcutCreator" SecShortcutCreator
    SetOutPath $INSTDIR
    ; Copy application files
    File "ShortcutCreator.exe"
    ; Call function to create shortcuts
    Call CreateShortcuts
SectionEnd

; Define uninstaller
Section "Uninstall"
    ; Remove installed files
    Delete "$INSTDIR\ShortcutCreator.exe"
    ; Remove Start Menu shortcut
    Delete "$SMPROGRAMS\ShortcutCreator.lnk"
    ; Remove desktop shortcut
    Delete "$DESKTOP\ShortcutCreator.lnk"
    ; Remove installation directory
    RMDir "$INSTDIR"
SectionEnd

; Specify language and interface options
LangString DESC_SecShortcutCreator ${LANG_ENGLISH} "Shortcut Creator"

!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Compile the script
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

; Build installer
Section "Install"
    SetOutPath "$INSTDIR"
    File ShortcutCreator.exe
SectionEnd

; Set uninstaller options
UninstallText "Uninstall ShortcutCreator"

```

Extenstion Registry 


```

; Register file extension with application

Section "Register Extension" SecRegisterExtension
    ; Define the extension and associated file type
    WriteRegStr HKCR ".abc" "" "MyAppFile"

    ; Create registry entries for the file type
    WriteRegStr HKCR "MyAppFile" "" "MyApp File"
    WriteRegStr HKCR "MyAppFile\DefaultIcon" "" "$INSTDIR\MyApp.exe,1"
    WriteRegStr HKCR "MyAppFile\shell\open\command" "" '"$INSTDIR\MyApp.exe" "%1"'
SectionEnd

Section "Unregister Extension" SecUnregisterExtension
    ; Delete registry entries for the file type
    DeleteRegKey HKCR "MyAppFile\shell\open\command"
    DeleteRegKey HKCR "MyAppFile\shell\open"
    DeleteRegKey HKCR "MyAppFile\shell"
    DeleteRegKey HKCR "MyAppFile\DefaultIcon"
    DeleteRegKey HKCR "MyAppFile"

    ; Remove association with the file extension
    DeleteRegKey HKCR ".abc"
SectionEnd

```


Registry 


In NSIS, you can interact with various types of registry entries, including string values, DWORD values (32-bit integers), expandable string values, multi-string values, and binary values. Here's how you can work with each type of registry entry in NSIS:

String Value:

```
WriteRegStr HKCU "Software\MyApp" "Version" "1.0"
```


DWORD Value (32-bit integer):

```
WriteRegDWORD HKCU "Software\MyApp" "Count" 100
```


Expandable String Value (allows the use of environment variables):

```
WriteRegExpandStr HKLM "Software\MyApp" "InstallDir" "$INSTDIR"
```


Multi-String Value (sequence of strings separated by $\r$\n):

```
WriteRegExpandMultiStr HKLM "Software\MyApp" "Paths" "C:\Path1\$\r$\nC:\Path2"
```


Binary Value:

```

WriteRegBin HKLM "Software\MyApp" "Data" "DEADBEEF"
```


These commands create or modify registry entries under the specified registry key (HKCU for HKEY_CURRENT_USER, HKLM for HKEY_LOCAL_MACHINE, etc.).

To delete a registry key or value, you can use the DeleteRegKey and DeleteRegValue commands, respectively. For example:

```

DeleteRegKey HKCU "Software\MyApp"
DeleteRegValue HKLM "Software\MyApp" "Data"
```




Creating Subkeys:
You can create subkeys under existing registry keys using the WriteRegStr, WriteRegDWORD, etc., commands with the desired subkey path. For example:

```
WriteRegStr HKCU "Software\MyApp\Settings" "Option" "Value"
```


Checking if a Key Exists:
To check if a registry key exists before creating or modifying it, you can use the ReadRegStr or ReadRegDWORD commands. If the key doesn't exist, these commands will return an empty string. For example:

```
ReadRegStr $0 HKCU "Software\MyApp" "Version"
${If} $0 == ""
    ; Key doesn't exist, create it
    WriteRegStr HKCU "Software\MyApp" "Version" "1.0"
${EndIf}
```


Enumerating Subkeys:
To enumerate subkeys under a registry key, you can use the EnumRegKey command in a loop. For example:

```
Section
    EnumRegKey $0 HKCU "Software\MyApp" $1
    ${While} $1 != ""
        DetailPrint "Subkey found: $1"
        EnumRegKey $0 HKCU "Software\MyApp" $1
    ${Loop}
SectionEnd
```


Enumerating Values:
Similarly, you can enumerate values under a registry key using the EnumRegValue command. For example:

```
Section
    EnumRegValue $0 HKCU "Software\MyApp" $1 $2
    ${While} $1 != ""
        DetailPrint "Value found: $1 = $2"
        EnumRegValue $0 HKCU "Software\MyApp" $1 $2
    ${Loop}
SectionEnd
```


Registry Permissions:
You can set registry key permissions using the AccessControl command to control which users can read, write, or delete registry keys. For example:

```
AccessControl::GrantOnRegKey HKCU "Software\MyApp" "(DENY)(X,RD,WD,WDAC,WO,DC)" "BUILTIN\Guests"
```



Creating Subdirectories:
You can create subdirectories within the local app data directory using the CreateDirectory command. For example:

```
Section
    SetOutPath "$LOCALAPPDATA\MyApp\Config"
    CreateDirectory "$LOCALAPPDATA\MyApp\Config"
SectionEnd
```


Copying Files Recursively:
If you need to copy files recursively (including subdirectories), you can use the File /r command. For example:

```

Section
    SetOutPath "$LOCALAPPDATA\MyApp"
    File /r "Files\*.*"
SectionEnd
```


Creating Shortcuts:
You can create shortcuts in the Start Menu or on the desktop that point to files or folders in the local app data directory. For example:

```
Section
    CreateShortCut "SMPROGRAMS\MyApp.lnk" "SMPROGRAMS\MyApp.lnk""LOCALAPPDATA\MyApp\MyApp.exe"
    CreateShortCut "DESKTOP\MyApp.lnk" "DESKTOP\MyApp.lnk""LOCALAPPDATA\MyApp\MyApp.exe"
SectionEnd
```


Setting Registry Entries:
You may need to set registry entries related to your application's configuration stored in the local app data directory. For example:

```
Section
    WriteRegStr HKCU "Software\MyApp" "ConfigPath" "$LOCALAPPDATA\MyApp\Config"
SectionEnd
```


Uninstallation:
When uninstalling the application, ensure that any files or folders created in the local app data directory are removed. For example:

```
Section "Uninstall"
    RMDir /r "$LOCALAPPDATA\MyApp"
    DeleteRegKey HKCU "Software\MyApp"
SectionEnd
```

Checking for Existing Files or Directories:
Before creating directories or copying files, it's a good practice to check if they already exist to avoid overwriting existing data. You can use IfFileExists and IfFileExists commands for this purpose. For example:

```
Section
    IfFileExists "$LOCALAPPDATA\MyApp\Config" 0 ConfigNotFound
    MessageBox MB_OK "Config directory already exists!"
    Goto ConfigExists
    ConfigNotFound:
    MessageBox MB_OK "Config directory not found, creating..."
    CreateDirectory "$LOCALAPPDATA\MyApp\Config"
    ConfigExists:
    ; Continue with other tasks
SectionEnd
```


Reading Files from the Local App Data Directory:
If your application needs to read files from the local app data directory, you can use the ReadINIStr command for INI files or FileRead command for text files. For example:

```
Section
    ReadINIStr 0 "0"LOCALAPPDATA\MyApp\Config\settings.ini" "Section" "Key"
    MessageBox MB_OK "Value: $0"
SectionEnd
```


Writing Files to the Local App Data Directory:
Similarly, if your application needs to write files to the local app data directory, you can use the WriteINIStr command for INI files or FileWrite command for text files. For example:

```

Section
    WriteINIStr "$LOCALAPPDATA\MyApp\Config\settings.ini" "Section" "Key" "Value"
    FileOpen 1 "1"LOCALAPPDATA\MyApp\Config\log.txt" w
    FileWrite $1 "Log message"
    FileClose $1
SectionEnd
```


Executing Files from the Local App Data Directory:
If your application needs to execute files located in the local app data directory, you can use the Exec command. For example:

```
Section
    Exec "$LOCALAPPDATA\MyApp\MyScript.exe"
SectionEnd
```





Function call 

```
; Example NSIS script with custom function

; Define custom function to display a message box
Function ShowMessageBox
    MessageBox MB_OK "This is a custom function!"
FunctionEnd

; Main section of the script
Section
    ; Display a message box before calling the custom function
    MessageBox MB_OK "Calling custom function..."
  
    ; Call the custom function
    Call ShowMessageBox
  
    ; Display a message box after calling the custom function
    MessageBox MB_OK "Custom function called!"
SectionEnd

```







END
