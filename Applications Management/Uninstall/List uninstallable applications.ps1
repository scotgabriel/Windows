# List all programs in the registry that show up in "add/remove programs" GUI

Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Sort-Object -Property DisplayName | Format-Table -AutoSize