
ipconfig /all | Out-File -FilePath C:\<path-here>
Get-Process | Select-Object * | Out-File -FilePath C:\<path-here>
systeminfo | Out-File -FilePath C:\<path-here>
Get-WmiObject win32_service | Select-Object * | Out-File -FilePath C:\<path-here>
query user | Out-File -FilePath C:\<path-here>

# Exporting HKLM generates a file often around half a gig in size
reg export "HKLM" | Out-File -FilePath C:\<path-here>
reg export "HKCU" | Out-File -FilePath C:\<path-here>
net user | Out-File -FilePath C:\<path-here>
net group | Out-File -FilePath C:\<path-here>
net accounts | Out-File -FilePath C:\<path-here>
net localgroup | Out-File -FilePath C:\<path-here>
net share | Out-File -FilePath C:\<path-here>
net time | Out-File -FilePath C:\<path-here>
net view | Out-File -FilePath C:\<path-here>
netstat -abno | Out-File -FilePath C:\<path-here>
Get-CimInstance Win32_StartupCommand | Select-Object Name, command, Location, User | Format-List | Out-File -FilePath C:\<path-here>

$PendingRebootStatus = Test-PendingReboot -detailed -SkipConfigurationManagerClientCheck | Select-Object *
$PendingRebootStatus | Out-File -FilePath C:\<path-here>
$PendingRebootFileRenames = $PendingRebootStatus | Select-Object -ExpandProperty PendingFileRenameOperationsValue
$PendingRebootFileRenames | Out-File -Append -FilePath C:\<path-here>
