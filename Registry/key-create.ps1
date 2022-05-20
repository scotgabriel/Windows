$RegistryPath = "HKLM:\SOFTWARE\MyBranchRoot"

Function CreateRegistryKeyPath() {
    if (Test-Path $RegistryPath) {
        Write-Host "Registry Key Path Exists."
    }
    else {
        New-Item -Path $RegistryPath -Force | Out-Null
        Write-Host "created reg path"
    }
}

CreateRegistryKeyPath
