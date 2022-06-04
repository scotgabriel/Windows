# LocalAdmin create add modify

# Inputs
$ImportedLocalAdminName = null # Custom Field variable evaluated at runtime
$ImportedLocalAdminPasswordPreHash = null # Custom Field variable evaluated at runtime
$ImportedLocalAdminUserDescription = null # Custom Field variable evaluated at runtime
$ImportedLocalAdminUserFullName = null # Custom Field variable evaluated at runtime
<#
Created : 2017.02.03
Author  : gabe31415
#>

$LocalAdminName = "zzXenith-Apex"
$LocalAdminPasswordPreHash = "Insert-crazy-passw0rd-HERE!!!!!*&^"
$LocalAdminUserDescription = "msp001 Local account"
$LocalAdminUserFullName = "zzXenith Apex"

# additional variable generation based on local system
$PcName = (Get-CimInstance -ClassName Win32_ComputerSystem).Name
$HostAndUser = $PcName+"\"+$LocalAdminName
$LocalAdminPassword = ConvertTo-SecureString $LocalAdminPasswordPreHash -AsPlainText -force
$UsrExists = Get-LocalUser | Where-Object Name -eq $LocalAdminName | Measure-Object
$UserIsAdministrator = Get-LocalGroupMember -Name Administrators | Where-Object Name -EQ $HostAndUser | Measure-Object


IF ($UsrExists.Count -eq 0) {
    # If user doesn't exist, create it
    New-LocalUser -Name $LocalAdminName -Description $LocalAdminUserDescription -FullName $LocalAdminUserFullName -Password $LocalAdminPassword -AccountNeverExpires:$true -PasswordNeverExpires:$true -UserMayNotChangePassword:$true
}ELSE{
    # If user already exists, modify it to meet desired config
    Set-LocalUser -Name $LocalAdminName -Description $LocalAdminUserDescription -FullName $LocalAdminUserFullName -Password $LocalAdminPassword -AccountNeverExpires:$true -PasswordNeverExpires:$true -UserMayChangePassword:$false
}
IF ($UserIsAdministrator.Count -eq 0) {
    # If user account not a local admin, add it
    Add-LocalGroupMember -Group Administrators -Member $HostAndUser
}

