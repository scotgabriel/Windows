$RegistryPath = "HKLM:\SOFTWARE\MyBranchRoot"
$ValueName = "ValueNameHere"
Function CreateRegistryValue(){
    if (Get-ItemProperty -path $RegistryPath | Select-Object -ExpandProperty $ValueName){
        Write-Host "Clearing stale value."
        Clear-ItemProperty -Path $RegistryPath -Name $ValueName
    }
}