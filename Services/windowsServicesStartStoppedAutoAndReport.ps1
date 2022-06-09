$servers = Get-Content C:\servers.txt
$report = @()
Foreach ($Server in $Servers) {
Get-WMIObject win32_service -ComputerName $server -Filter "startmode = 'auto' AND state != 'running'" | Invoke-WmiMethod -Name StartService
$wmi = Get-wmiobject win32_service -Filter "startmode = 'auto' AND Exitcode =0" -ComputerName $server
$report += $wmi | select-object @{n="ServerName";e={Get-WmiObject win32_computersystem -ComputerName $server|Select-Object name -ExpandProperty name}}, @{n="ServiceName";e={$_.name}},@{n="Status";e={$_.state}},@{n="Start Account";e={$_.startname}}
}
$report|export-csv C:\Services-Report.csv -NoTypeInformation