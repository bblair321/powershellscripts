param([switch]$Elevated)
function Check-Admin {
$currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
$currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
if ((Check-Admin) -eq $false)  {
if ($elevated)
{
# could not elevate, quit
}
 
else {
 
Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
}
exit
}
cd C:\Users\Administrator\Downloads\
Expand-Archive -Path *valheimmods*.Zip -Force
Start-Sleep -s 5
cd C:\Users\Administrator\Downloads\*valheimmods*\*valheimmods*
Copy-Item "**" -Destination "E:\Valheim" -Recurse -Force
Write-Host "Your file has been copied"
Start-Sleep -s 2
$Host.SetShouldExit(0)