# Increase Windows Service Timeout at Startup

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "ServicesPipeTimeout" -Value 60000 -Type DWORD
exit 0

