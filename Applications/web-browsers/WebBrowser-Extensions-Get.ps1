[string]$OsDrive = (Get-WmiObject Win32_OperatingSystem).SystemDrive

$UserProfiles = Get-ChildItem -Path "$OsDrive\Users"

$EdgeUserDataPart = "AppData\Local\Microsoft\Edge\User Data"

Function EdgeBrowserProfiles($EdgeUser) {
    $EdgeUserData = ''
    [string]$EdgeUserData = $OsDrive + '\Users\' + $EdgeUser + '\' + $EdgeUserDataPart
    if ($EdgeUserData | Test-Path) {
        $EdgeUserDataPossibleProfiles = Get-ChildItem -Path $EdgeUserData
        foreach ($Folder in $EdgeUserDataPossibleProfiles) {
            if ($Folder -eq "Default" -or $Folder -like "Profile*") {
                $EdgeExtensionsBase = $EdgeUserData + '\' + $Folder + '\' + "Extensions"
                if ($EdgeExtensionsBase | Test-Path) {
                    $EdgeInstalledExtensions = (Get-ChildItem -path $EdgeExtensionsBase).FullName
                    foreach ($path in $EdgeInstalledExtensions){
                        $EdgeInstallExtensionVersions = (Get-ChildItem -Path $path).FullName | Select-Object -First 1
                        $manifestFile = $EdgeInstallExtensionVersions + '\' + "manifest.json"
                        if ($manifestFile | Test-Path){
                            $manifest = Get-Content -Raw -Path $manifestFile | ConvertFrom-Json
                            $ExtensionName = $manifest.name
                            $ExtensionName
                        }
                    }
                }
            }
        }
    }
}

foreach ($User in $UserProfiles) {
    EdgeBrowserProfiles $User
}
