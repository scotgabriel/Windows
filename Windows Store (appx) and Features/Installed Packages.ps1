# List of installed appx packages for allusers

Get-AppxPackage -AllUsers | Select-Object name, packagefullname | Sort-Object -Property Name | Format-Table -AutoSize