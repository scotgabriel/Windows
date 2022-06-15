# Manufacturer
(Get-WmiObject Win32_ComputerSystem).Manufacturer

# Model
(Get-WmiObject Win32_ComputerSystem).Model

# Serial Number
(Get-WmiObject -class win32_bios).SerialNumber