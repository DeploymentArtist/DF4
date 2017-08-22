'Command number one
sFile = "BIOSConfigUtility.EXE"
sCmd = "BIOSConfigUtility.EXE /SetConfig:TPMEnable.REPSET /NewAdminPassword:""Password1234""" 
If not oFSO.FileExists(sFile) then
	oLogging.CreateEntry "Config-BIOS - Could not find " & sFile & " in the " & sModelAlias & " folder", LogTypeError
	oLogging.CreateEntry "Config-BIOS - Could not run " & sCmd , LogTypeError
	iRetVal = Failure
Else 
	oLogging.CreateEntry "Config-BIOS - Searching for " & sFile , LogTypeInfo
	oLogging.CreateEntry "Config-BIOS - Running " & sCmd , LogTypeInfo
	oShell.Run sCmd
End if

