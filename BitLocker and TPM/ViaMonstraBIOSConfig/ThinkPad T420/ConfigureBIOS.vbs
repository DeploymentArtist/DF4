'Command number one
sFile = "SetConfig.vbs"
sCmd = "cscript.exe " & sfile & " SecurityChip Active"

If not oFSO.FileExists(sFile) then
	oLogging.CreateEntry "Config-BIOS - Could not find " & sFile & " in the " & sModelAlias & " folder", LogTypeError
	oLogging.CreateEntry "Config-BIOS - Could not run " & sCmd , LogTypeError
	iRetVal = Failure
Else 
	oLogging.CreateEntry "Config-BIOS - Searching for " & sFile , LogTypeInfo
	oLogging.CreateEntry "Config-BIOS - Running " & sCmd , LogTypeInfo
	oShell.Run sCmd
End if
