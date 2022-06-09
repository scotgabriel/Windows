$rebootNeeded = 0
$rebootPending = 0
$rebootRequired = 0
$fileRenamePending = 0

Try {
    Get-ItemPropertyValue -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion" -Name "Component Based Servicing"
}
Catch {
    Write-Output "Component Based Servicing: Doesn't exist"
    $rebootPending = 0
}

Try {
    Get-ItemPropertyValue -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" -Name "Auto Update"
}
Catch {
    Write-Output "Component Based Servicing: Doesn't exist"
    $rebootRequired = 0
}

Try {
    Get-ItemPropertyValue -path "HKLM:\SYSTEM\CurrentControlSet\Control " -Name "Session Manager"
}
Catch {
    Write-Output "Component Based Servicing: Doesn't exist"
    $fileRenamePending = 0
}

