# posh-winbox-updater
Powershell utility module for updateing Mikrotik's Winbox.


Fast usage, without gallery:

wget https://raw.githubusercontent.com/nativeme/pwsh-winbox-updater/main/WinboxUpdater.psm1 -OutFile C:\Windows\Temp\tempscr.psm1;  
Import-Module C:\Windows\Temp\tempscr.psm1;  
Update-Winbox;  
