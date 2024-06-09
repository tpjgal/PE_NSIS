; Application Name 
!define PRODUCT_NAME "MYAPP"
; release folder 
!define RELEASE_FOLDER "bin\x64\Release\"

; Application version 
!define version 1.0 
; Application version dynamic 
;!getdllversion ${RELEASE_FOLDER}MyApp.exe ExeVer_
;!define appversion "${ExeVer_1}"
;!define subversion "${ExeVer_1}.${ExeVer_2}"

; Installer 
OutFile "${PRODUCT_NAME}${version}.exe"

; User Installation directory 
InstallDir "$LOCALAPPDATA\TestFolder"

; Installe Icon 
Icon Icon\MyApp.ico

; Install Section 
Section "Install"

 SetOutPath $INSTDIR
 File /a /x *.xml bin\x64\Release\*.*

 SetOutPath $INSTDIR\Icon 
 File /a /x *.xml Icon\*.* 
 DetailPrint "Installation"
 

 CreateDirectory "$STARTMENU\${PRODUCT_NAME}${version}"
 
 ; Creating Program Menu Shortcuts 
 CreateShortcut "$STARTMENU\${PRODUCT_NAME}${version}\${PRODUCT_NAME}${version}.lnk" "$INSTDIR\WinFormsApp.exe" "" "$INSTDIR\Icon\Computer.ico"
 CreateShortcut "$STARTMENU\${PRODUCT_NAME}${version}\Uninstall.lnk" "$INSTDIR\Uninstall.exe" "" "$INSTDIR\Icon\Uninstall.ico"

 ; Creating Desktop shorcuts
 CreateShortcut "$DESKTOP\${PRODUCT_NAME}${version}.lnk" "$INSTDIR\WinFormsApp.exe" "" "$INSTDIR\Icon\Computer.ico"
 
 WriteRegStr HKCU "Software\${PRODUCT_NAME}" "InstalLocation" $INSTDIR 
 WriteUninstaller "$INSTDIR\Uninstall.exe"
 ; add or remove program - Installed Apps 
 WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "DisplayName" "${PRODUCT_NAME}"
 WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "DisplayIcon" "$INSTDIR\Icon\Computer.ico"
 WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "UninstallString" "$INSTDIR\Uninstall.exe"

SectionEnd

; Delete Shortcuts, Directory & Registry 
Function un.PreUninstall
 DetailPrint "Uninstall"
 RMDir /r "$INSTDIR\${PRODUCT_NAME}${version}"
 RMDir /r "$STARTMENU\${PRODUCT_NAME}${version}"
 RMDir /r "$LOCALAPPDATA\TestFolder"

 Delete "$DESKTOP\${PRODUCT_NAME}${version}.lnk"
 DeleteRegKey HKCU "Software\${PRODUCT_NAME}"
 DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
FunctionEnd

; Check User want to uninstall or not
Function un.CallUninstall
 MessageBox MB_YESNO "Are you sure you want to uninstall ${PRODUCT_NAME}?" IDYES uninstall IDNO NoUninstall
 uninstall:
 Call un.PreUninstall
 NoUninstall:
 Call un.NonUninstall
FunctionEnd
 
 
 Function un.NonUninstall
 Sleep 1000
 DetailPrint "Abort Uninstallation"
 Quit 
 FunctionEnd
 
; Uninstall Section  
; function Call
 Section "Uninstall"
 Call un.CallUninstall
 SectionEnd