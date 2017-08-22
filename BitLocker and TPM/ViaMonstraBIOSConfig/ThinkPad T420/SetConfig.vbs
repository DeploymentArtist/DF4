'
' Set specific BIOS Setting
'
On Error Resume Next
Dim colItems

If WScript.Arguments.Count <> 2 Then
    WScript.Echo "SetConfig.vbs [setting] [value]"
    WScript.Quit
End If

strRequest = WScript.Arguments(0) + "," + WScript.Arguments(1) + ";"

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
    ObjItem.SaveBiosSettings ";", strReturn
Next

WScript.Echo strRequest
WScript.Echo " SaveBiosSettings: " + strReturn
