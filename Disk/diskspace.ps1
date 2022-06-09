If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
# Relaunch as an elevated process:

 Start-Process powershell.exe "-NoExit",("-Command `"cd '$((Get-Location).Path)';& '$($MyInvocation.MyCommand.Path)';exit`"") -Verb RunAs
exit
}

$StartDir = "C:\"
Clear-Host
$results = @()
$dirs = Get-ChildItem -Path $StartDir -Recurse | Where-Object {$_.PSIsContainer}
foreach ($dir in $dirs) {
    $files =  Get-ChildItem $dir.pspath 
    $total = 0
    foreach ($file in $files) {
        $total += $file.Length
        }
    $results += New-Object psobject -Property @{Folder=$dir.fullname;Size=$total}
    }
$results | Sort-Object -Property Size -Descending | Format-Table -AutoSize
$biggestFolder = ($results | Sort-Object -Property Size -Descending)[0,1,2,3] -replace '[@\{\}]'
$biggestFolder = ($biggestFolder) -replace 'Folder=',"`r`n"
Write-Output "Biggest $biggestFolder"