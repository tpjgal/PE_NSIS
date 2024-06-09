#NSIS Best Practice 

## Execute application after installation 

```
Sleep 1000
ExecWait '"$INSTDIR\AppFolder\App.exe"'
```

## Read Loacal path 

``` 
   Var LocalPath 
   ReadEnvStr $LocalPath "LOCALAPPDATA"
```


## Search Folder Name in path 

    check previous version present or not in the registry.
    This will do post uninstallation, re-write the registry or delete the registry. 	
 ``` 
     Var FindHandle
	 Var FolderName
	 Var Olderversion
	 
     FindFirst $FindHandle $FolderName "$LOCALAPPDATA\TestFolder\*"
	 LOOP:
           StrCmp $FolderName "" DONE 
             ${If} $FolderName == "TEST1"
                     StrCpy $Olderversion "1"
             ${ElseIf} $FolderName == "TEST2"
                     StrCpy $Olderversion "2"
             ${EndIf} 					 
		
	   FindNext $FindHandle $FolderName
	   Goto LOOP 
	 DONE:
	 
	 StrCmp $0 Olderversion NO_PREVIOUS_VERSION
	 CHECKVERSION:
	   ; Update Registry 
	 Goto CHECKVERSION
	 FindClose $FindHandle
	 NO_PREVIOUS_VERSION:
	  ; Delete Registry 
```

For logical must include 
``` 
  !include LogicLib.nsh 
```

## File Extenstion 

based on the version if user double click on the file then application should be launch.
```
; *.abc
!define FILEEXT_ABC "ABC"

; Write Registry  and Re-Registry for update version. 
WriteRegStr HKCU "Software\Classes\${FILEEXT_ABC}\Shell\open\command" "" '"$InstallationPath\App_$version\app.exe" "%1"'
```
