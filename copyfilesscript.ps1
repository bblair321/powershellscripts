Set-ExecutionPolicy unrestricted
$Item = Read-Host -Prompt "Path to item you want to copy"
$Path = Read-Host -Prompt "Path where item will be copied to"
Copy-Item -path "$Item" -Destination "$Path"
Write-Host "Your file '$Item' has been copied to '$Path'"
Read-Host -Prompt "Press Enter to exit"