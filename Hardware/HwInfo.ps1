# AUTHOR: github username: gabe31415
# Get HW info

function Show-Menu
{
    param (
        [string]$Title = 'My Menu'
    )
    Clear-Host
    Write-Host "==================== $Title ===================="
    Write-Host ""
    Write-Host "0: Press '0' to get Model information"
    Write-Host "1: Press '1' to get Physical Memory Size"
    Write-Host "2: Press '2' to get Max POSSIBLE Physical Memory Size"
    Write-Host "Q: Press 'Q' to quit."
    Write-Host ""
}
function GetHwModel
{
    $wmiHW = Get-WmiObject Win32_ComputerSystem
    return $wmiHW.Model
}

function GetMemoryCurrent
{
    $wmiHW = Get-WMIObject Win32_PhysicalMemory
    return $wmiHW.Capacity
}

function GetMemoryMaximumPossible
{
    $wmiHW = Get-WMIObject Win32_PhysicalMemoryArray
    return $wmiHW.MaxCapacity
}

function DoHardwareChecks
{
    do
    {
        Show-Menu -Title 'Hardware check options'
        $selection = Read-Host "Please make a selection"
        switch ($selection)
        {
            '0' { GetHwModel }
            '1' { GetMemoryCurrent}
            '2' { GetMemoryMaximumPossible}
            'q' { return }
        }
        pause
    }
    until ($selection -eq 'q')
}
