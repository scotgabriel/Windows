$filePath = "C:\Path-To-file.exe"

(Get-Item $filePath).VersionInfo | Select-Object FileVersion

if ($fileVersion -match "1.5.1.0") {
    Write-Host "The file is the right version"
}
else {
    Write-Host "Need to uninstall"
}