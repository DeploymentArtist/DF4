 '
' Set specific BIOS Setting
'
On Error Resume Next
Dim colItems

If WScript.Arguments.Count <> 3 Then
    WScript.Echo "SetConfigPassword.vbs [setting] [value] [password + encoding]"
    WScript.Quit
End If

strRequest = WScript.Arguments(0) + "," + WScript.Arguments(1) + "," + WScript.Arguments(2) + ";"

strComputer = "LOCALHOST"     ' Change as needed.
Set objWMIService = GetObject("WinMgmts:" _
    &"{ImpersonationLevel=Impersonate}!\\" & strComputer & "\root\wmi")
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
    ObjItem.SaveBiosSettings WScript.Arguments(2) + ";", strReturn
Next

WScript.Echo strRequest
WScript.Echo " SaveBiosSettings: " + strReturn
