$pdc =Get-ADDomain | select PDCEmulator | foreach { $_.PDCEmulator }

$os = (Get-WmiObject Win32_OperatingSystem -computer $pdc).Caption

$check = $name.contains("Small Business")
if (($check) -ne "True")
{
   Write-Host "Not an SBS Domain"
}

# If you know the name of the server just run the following and look for "Smaill Business" in the output

# (Get-WmiObject Win32_OperatingSystem -computer SERVERNAME).Caption
