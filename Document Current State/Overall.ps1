
ipconfig /all | Out-File -FilePath C:\<path-here>\ipconfig-all.txt
Get-Process | Select-Object * | Out-File -FilePath C:\<path-here>\get-process.txt
systeminfo | Out-File -FilePath C:\<path-here>\systeminfo.txt
Get-WmiObject win32_service | Select-Object * | Out-File -FilePath C:\<path-here>\get-wmiobject.txt
query user | Out-File -FilePath C:\<path-here>\query-user.txt

# Exporting HKLM generates a file often around half a gig in size
reg export "HKLM" | Out-File -FilePath C:\<path-here>\hklm.export
reg export "HKCU" | Out-File -FilePath C:\<path-here>\hkcu.export
net user | Out-File -FilePath C:\<path-here>\net-suser.txt
net group | Out-File -FilePath C:\<path-here>\net-group.txt
net accounts | Out-File -FilePath C:\<path-here>\net-accounts.txt
net localgroup | Out-File -FilePath C:\<path-here>\net-localgroup.txt
net share | Out-File -FilePath C:\<path-here>\net-share.txt
net time | Out-File -FilePath C:\<path-here>\net-time.txt
net view | Out-File -FilePath C:\<path-here>net-view.txt
netstat -abno | Out-File -FilePath C:\<path-here>netstat-abno.txt
Get-CimInstance Win32_StartupCommand | Select-Object Name, command, Location, User | Format-List | Out-File -FilePath C:\<path-here>\Get-CimInstance-Win32_startupCommand.txt

$PendingRebootStatus = Test-PendingReboot -detailed -SkipConfigurationManagerClientCheck | Select-Object *
$PendingRebootStatus | Out-File -FilePath C:\<path-here>\pendingRebootStatus.txt
$PendingRebootFileRenames = $PendingRebootStatus | Select-Object -ExpandProperty PendingFileRenameOperationsValue
$PendingRebootFileRenames | Out-File -Append -FilePath C:\<path-here>\pendingRebootStatus.txt
