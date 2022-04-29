[string]$OsDrive = (Get-WmiObject Win32_OperatingSystem).SystemDrive
write-host "Operating System is on drive: " $OsDrive

$UserProfiles = Get-ChildItem -Path "$OsDrive\Users"
foreach ($user in $UserProfiles){
    Write-Host "User Profile: " $user
}

$EdgeUserDataPart = "AppData\Local\Microsoft\Edge\User Data"

Function EdgeBrowserProfiles($EdgeUser) {
    $EdgeUserData = ''
    [string]$EdgeUserData = $OsDrive + '\Users\' + $EdgeUser + '\' + $EdgeUserDataPart
    # Write-Host "Base Edge Path for this user: "$EdgeUserData
    if ($EdgeUserData | Test-Path){
        $EdgeUserDataPossibleProfiles = Get-ChildItem -Path $EdgeUserData
        foreach ($Folder in $EdgeUserDataPossibleProfiles){
            if ($Folder -eq "Default" -or $Folder -like "Profile*"){
                # Write-Host "Edge Profile folder: " $Folder
                $EdgeExtensionsBase = $EdgeUserData + '\' + $Folder
                Write-Host "Edge Profile Folder full path: " $EdgeExtensionsBase
            }
        }
    }
}

foreach ($User in $UserProfiles) {
    EdgeBrowserProfiles $User
}




