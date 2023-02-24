$zipPath = "C:\todo\*.rar"
$destinationPath = "C:\done"
$sevenZipExePath = "C:\Program Files\7-Zip\7z.exe"

Get-ChildItem $zipPath -Recurse | Where-Object { $_.Extension -eq ".rar" } | ForEach-Object {
    $zipFile = $_.FullName
    $targetFolder = Join-Path $destinationPath $_.Directory.Name

    # create the target folder if it doesn't exist
    if (!(Test-Path $targetFolder)) {
        New-Item $targetFolder -ItemType Directory
    }

    # extract the file using 7-Zip
    $arguments = "x `"$zipFile`" -o`"$targetFolder`""
    $processInfo = New-Object System.Diagnostics.ProcessStartInfo
    $processInfo.FileName = $sevenZipExePath
    $processInfo.Arguments = $arguments
    $processInfo.WindowStyle = [System.Diagnostics.ProcessWindowStyle]::Hidden
    $process = [System.Diagnostics.Process]::Start($processInfo)
    $process.WaitForExit()

    # check the exit code to see if the extraction was successful
    if ($process.ExitCode -eq 0) {
        Write-Host "Successfully extracted $zipFile"
    }
    else {
        Write-Warning "Failed to extract $zipFile"
    }
}
