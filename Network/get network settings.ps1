Get-WmiObject Win32_NetworkAdapterConfiguration

# Just get IP address(es)
# foreach ($i in Get-WmiObject Win32_NetworkAdapterConfiguration) {
#     if ($i.IPaddress) { $i.IPaddress[0] }
#   }