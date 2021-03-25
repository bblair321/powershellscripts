@echo off
net use * /delete /noconfirm
taskkill /f /IM explorer.exe
explorer.exe
net use x: \\myServer\mySHaredFolder