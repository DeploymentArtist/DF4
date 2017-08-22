'Command number one
sFile = "cctk.exe"
sCmd = "cctk.exe cctk --setuppwd=Password1234"

If not oFSO.FileExists(sFile) then
	oLogging.CreateEntry "Config-BIOS - Could not find " & sFile & " in the " & sModelAlias & " folder", LogTypeError
	oLogging.CreateEntry "Config-BIOS - Could not run " & sCmd , LogTypeError
	iRetVal = Failure
Else 
	oLogging.CreateEntry "Config-BIOS - Searching for " & sFile , LogTypeInfo
	oLogging.CreateEntry "Config-BIOS - Running " & sCmd , LogTypeInfo
	oShell.Run sCmd
End if

'Command number two
sFile = "cctk.exe"
sCmd = "cctk.exe --tpm=on --valsetuppwd=PasswordSucks123"

If not oFSO.FileExists(sFile) then
	oLogging.CreateEntry "Config-BIOS - Could not find " & sFile & " in the " & sModelAlias & " folder", LogTypeError
	oLogging.CreateEntry "Config-BIOS - Could not run " & sCmd , LogTypeError
	iRetVal = Failure
Else 
	oLogging.CreateEntry "Config-BIOS - Searching for " & sFile , LogTypeInfo
	oLogging.CreateEntry "Config-BIOS - running " & sCmd , LogTypeInfo
	oShell.Run sCmd
End if

'Command number tree
sFile = "cctk.exe"
sCmd = "cctk --tpmactivation=activate --valsetuppwd=PasswordSucks123"

If not oFSO.FileExists(sFile) then
	oLogging.CreateEntry "Config-BIOS - Could not find " & sFile & " in the " & sModelAlias & " folder", LogTypeError
	oLogging.CreateEntry "Config-BIOS - Could not run " & sCmd , LogTypeError
	iRetVal = Failure
Else 
	oLogging.CreateEntry "Config-BIOS - Searching for " & sFile , LogTypeInfo
	oLogging.CreateEntry "Config-BIOS - running " & sCmd , LogTypeInfo
	oShell.Run sCmd
End if
