# Generic example (incomplete)
Set-ItemProperty -Path "HKLM:\Software\CompanyName\Toochain\NetworkInterfaces" -Name "Count" -Value $adapters.Guid.Count.ToString();
$count = 0;
foreach ($adapter in $adapters) {
    Set-ItemProperty -Path "HKLM:\Software\CompanyName\Toochain\NetworkInterfaces" -Name ("Service" + $count++) -Value $adapter.Guid;
}