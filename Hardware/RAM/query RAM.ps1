# Physical memory modules info
Get-WMIObject Win32_PhysicalMemory

# Slots and max RAM
Get-WMIObject Win32_PhysicalMemoryArray


# Installed Total Bytes of RAM
(Get-WmiObject Win32_ComputerSystem).TotalPhysicalMemory