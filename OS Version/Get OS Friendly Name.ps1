function GetOsNameFriendly
{
    $wmiOS = (Get-WmiObject -Class Win32_OperatingSystem).caption
    return $wmiOS
}