'
' Update Admnistrator Password
'
On Error Resume Next
Dim colItems

If WScript.Arguments.Count <> 4 Then
    WScript.Echo "SetSupervisorPasswordRemote.vbs [old Password] [new Password] [encoding] [hostname]"
    WScript.Quit
End If;
strRequest = "pap," + WScript.Arguments(0) + "," + WScript.Arguments(1) + "," + WScript.Arguments(2) + "*"

strComputer = WScript.Arguments(3)

Set objWMIService = GetObject("WinMgmts:" _
    &"{ImpersonationLevel=Impersonate," _
    &"authenticationLevel=pktPrivacy}!\\" _
    & strComputer & "\root\wmi")

Set colItems = objWMIService.ExecQuery("Select * from Lenovo_SetBiosPassword")

strReturn = "error"
For Each objItem in colItems
    ObjItem.SetBiosPassword strRequest, strReturn
Next

WScript.Echo " SetBiosPassword: "+ strReturn
