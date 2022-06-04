# Most virtualization platforms have "Virtual" in the "model"
$IsVirtual = ((Get-WmiObject Win32_ComputerSystem).model).Contains("Virtual")