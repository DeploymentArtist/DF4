# Check for elevation
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "Oupps, you need to run this script from an elevated PowerShell prompt!`nPlease start the PowerShell prompt as an Administrator and re-run the script."
	Write-Warning "Aborting script..."
    Break
}

# Check for HydrationDeploymentShare folder
if (!(Test-Path -path .\HydrationDeploymentShare))
 {
 Write-Warning "Oupps, cannot find the HydrationDeploymentShare folder"
 Write-Warning "Aborting script..."
 Break
 }

# Check for Media001 folder
if (!(Test-Path -path .\Media001))
 {
 Write-Warning "Oupps, cannot find the Media001 folder"
 Write-Warning "Aborting script..."
 Break
 }
 
# Validation OK, continue 
Copy-Item -Path ".\HydrationDeploymentShare\Applications" -Destination "C:\HydrationDF4\DS" -Recurse -Verbose -Force
Copy-Item -Path ".\HydrationDeploymentShare\Control" -Destination "C:\HydrationDF4\DS" -Recurse -Verbose -Force
Copy-Item -Path ".\HydrationDeploymentShare\Operating Systems" -Destination "C:\HydrationDF4\DS" -Recurse -Verbose -Force
Copy-Item -Path ".\HydrationDeploymentShare\Scripts" -Destination "C:\HydrationDF4\DS" -Recurse -Verbose -Force
Copy-Item -Path ".\Media001\Control" -Destination "C:\HydrationDF4\ISO\Content\Deploy" -Recurse -Verbose -Force
