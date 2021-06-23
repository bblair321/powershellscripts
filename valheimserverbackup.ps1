Stop-Process -Name "valheim_server"
cd C:\
Copy-Item -Path "C:\valheimserver*" -Destination "\\192.168.0.4\Mod Depository\ValheimMods\ServerBackups\$(get-date -f "yyyy-MM-dd-hh-mm")" -Recurse
cd C:\valheimserver
Start-Process "start_headless_server.bat"