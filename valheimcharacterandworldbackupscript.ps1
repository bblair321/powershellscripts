Copy-Item -path "C:\Users\brady\AppData\LocalLow\IronGate\*" -Destination "Z:\Valheim Backup" -Recurse -Force
Copy-Item -path "C:\Users\brady\AppData\LocalLow\IronGate\*" -Destination "H:\Valheim Backup" -Recurse -Force
Write-Host "Your file has been copied"
Start-Sleep -s 3
$Host.SetShouldExit(0)