Import-Module "C:\Program Files\Microsoft Deployment Toolkit\bin\MicrosoftDeploymentToolkit.psd1"
New-PSDrive -Name "DS002" -PSProvider MDTProvider -Root "D:\MDTProduction"

new-item -path "DS002:\Out-of-Box Drivers" -enable "True" -Name "WinPE x86" -Comments "" -ItemType "folder" -Verbose
new-item -path "DS002:\Out-of-Box Drivers" -enable "True" -Name "WinPE x64" -Comments "" -ItemType "folder" -Verbose
new-item -path "DS002:\Out-of-Box Drivers" -enable "True" -Name "Windows 8 x64" -Comments "" -ItemType "folder" -Verbose

new-item -path "DS002:\Out-of-Box Drivers\Windows 8 x64" -enable "True" -Name "Dell" -Comments "" -ItemType "folder" -Verbose
new-item -path "DS002:\Out-of-Box Drivers\Windows 8 x64\Dell" -enable "True" -Name "Latitude E6410" -Comments "" -ItemType "folder" -Verbose

new-item -path "DS002:\Out-of-Box Drivers\Windows 8 x64" -enable "True" -Name "HP" -Comments "" -ItemType "folder" -Verbose
new-item -path "DS002:\Out-of-Box Drivers\Windows 8 x64\HP" -enable "True" -Name "HP EliteBook 8560w" -Comments "" -ItemType "folder" -Verbose

new-item -path "DS002:\Out-of-Box Drivers\Windows 8 x64" -enable "True" -Name "Lenovo" -Comments "" -ItemType "folder" -Verbose
new-item -path "DS002:\Out-of-Box Drivers\Windows 8 x64\Lenovo" -enable "True" -Name "ThinkPad T420" -Comments "" -ItemType "folder" -Verbose

new-item -path "DS002:\Out-of-Box Drivers\Windows 8 x64" -enable "True" -Name "Samsung" -Comments "" -ItemType "folder" -Verbose
new-item -path "DS002:\Out-of-Box Drivers\Windows 8 x64\Samsung" -enable "True" -Name "Slate 7" -Comments "" -ItemType "folder" -Verbose


