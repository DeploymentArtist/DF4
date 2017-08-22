'
' List all BIOS settings
'
On Error Resume Next
Dim colItems

strComputer = "LOCALHOST"     ' Change as needed.
Set objWMIService = GetObject("WinMgmts:" _
    &"{ImpersonationLevel=Impersonate}!\\" & strComputer & "\root\wmi")
Set colItems = objWMIService.ExecQuery("Select * from Lenovo_BiosSetting")

For Each objItem in colItems
    If Len(objItem.CurrentSetting) > 0 Then
        Setting = ObjItem.CurrentSetting
        StrItem = Left(ObjItem.CurrentSetting, InStr(ObjItem.CurrentSetting, ",") - 1)
        StrValue = Mid(ObjItem.CurrentSetting, InStr(ObjItem.CurrentSetting, ",") + 1, 256)
        WScript.Echo StrItem + " = " + StrValue
    End If
Next
