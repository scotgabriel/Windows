$DriveToCheck = "F:"
$SleepTimer = 30
$RunningProcesses = (get-process | Where-Object {$_.Path -match $DriveToCheck} | Select-Object Path)

Clear-Host

Write-Host "`nChecking for open processes on $DriveToCheck`n"

foreach ($item in $RunningProcesses) {
  Write-Host $item.Path
}

Write-Host "`nEnd of list, closing in $SleepTimer seconds.`n"

sleep $SLeepTimer