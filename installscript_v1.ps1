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

$downloads=(New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path
cd $downloads
Expand-Archive -Path *valheimmods*.Zip -Force
cd $downloads\*valheimmods*\*valheimmods*
$destination = $(
      Add-Type -AssemblyName Microsoft.VisualBasic
      [Microsoft.VisualBasic.Interaction]::InputBox('Enter file path','Mod Installer', 'Enter Path')
)

Copy-Item "**" -Destination "$destination" -Recurse -Force
Write-Host "Your file has been copied"
cd $downloads\*valheimmods*\*valheimmods*
Invoke-Item "rick.ps1"
Start-Sleep -s 2
$Host.SetShouldExit(0)