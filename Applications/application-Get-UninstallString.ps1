$uninstallPath1 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
$uninstallPath2 = "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
$appDisplayName = "Application Display Name Here"

get-childitem -path $uninstallPath1, $uninstallPath2 | Get-ItemProperty | Where-Object {$_.DisplayName -match $appDisplayName } | select-object -property DisplayName, UninstallString