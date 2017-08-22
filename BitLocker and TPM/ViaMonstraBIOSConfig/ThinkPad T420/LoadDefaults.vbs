'
' Load default BIOS settings
'
On Error Resume Next
Dim colItems

strComputer = "LOCALHOST"     ' Change as needed.
Set objWMIService = GetObject("WinMgmts:" _
    &"{ImpersonationLevel=Impersonate}!\\" & strComputer & "\root\wmi")

Set colItems = objWMIService.ExecQuery("Select * from Lenovo_LoadDefaultSettings")

strReturn = "error"
For Each objItem in colItems
    ObjItem.LoadDefaultSettings ";", strReturn
Next

WScript.Echo " LoadDefaultSettings: " + strReturn

If strReturn <> "Success" Then
    WScript.Quit
End If

Set colItems = objWMIService.ExecQuery("Select * from Lenovo_SaveBiosSettings")

strReturn = "error"
For Each objItem in colItems
    ObjItem.SaveBiosSettings ";", strReturn
Next

WScript.Echo " SaveBiosSettings: " + strReturn
