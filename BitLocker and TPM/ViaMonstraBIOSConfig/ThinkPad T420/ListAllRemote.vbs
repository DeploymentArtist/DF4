'
' List all BIOS settings
'
On Error Resume Next
Dim colItems

If WScript.Arguments.Count <> 1 Then
   WScript.Echo "ListAllRemote.vbs [hostname]"
   WScript.Quit
End If

strComputer = WScript.Arguments(0)

Set objWMIService = GetObject("WinMgmts:" _
    &"{ImpersonationLevel=Impersonate," _
    &"authenticationLevel=pktPrivacy}!\\" _
    & strComputer & "\root\wmi")

Set colItems = objWMIService.ExecQuery("Select * from Lenovo_BiosSetting")

For Each objItem in colItems
    If Len(objItem.CurrentSetting) > 0 Then
        Setting = ObjItem.CurrentSetting
        StrItem = Left(ObjItem.CurrentSetting, InStr(ObjItem.CurrentSetting, ",") - 1)
        StrValue = Mid(ObjItem.CurrentSetting, InStr(ObjItem.CurrentSetting, ",") + 1, 256)
        WScript.Echo StrItem + " = " + StrValue
    End If
Next
