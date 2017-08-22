'
' Set specific BIOS Setting
'
On Error Resume Next
Dim colItems

If WScript.Arguments.Count <> 3 Then
    WScript.Echo "SetConfigRemote.vbs [setting] [value] [hostname]"
    WScript.Quit
End If

strRequest = WScript.Arguments(0) + "," + WScript.Arguments(1) + ";"

strComputer = WScript.Arguments(2)

Set objWMIService = GetObject("WinMgmts:" _
    &"{ImpersonationLevel=Impersonate," _
    &"authenticationLevel=pktPrivacy}!\\" _
    & strComputer & "\root\wmi")

Set colItems = objWMIService.ExecQuery("Select * from Lenovo_SetBiosSetting")

For Each objItem in colItems
    ObjItem.SetBiosSetting strRequest, strReturn
Next

WScript.Echo strRequest
WScript.Echo " SetBiosSetting: " + strReturn

If strReturn <> "Success" Then
    WScript.Quit
End If

Set colItems = objWMIService.ExecQuery("Select * from Lenovo_SaveBiosSettings")

strReturn = "error"
For Each objItem in colItems
    ObjItem.SaveBiosSettings ";", strReturn
Next

WScript.Echo strRequest
WScript.Echo " SaveBiosSettings: " + strReturn
