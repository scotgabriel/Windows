$DriveToCheck = "F:"

$AllProcesses = Get-Process

$results = $AllProcesses | Foreach-Object {
    $handles = (handle64 -p $_.ID -NoBanner) | Where-Object { $_ -Match $DriveToCheck } | Foreach-Object {
            [PSCustomObject]@{
        "Hex"  = ((($_ -Split " ").Where({ $_ -NE "" })[0]).Split(":")[0]).Trim()
        "File" = (($_ -Split " ")[-1]).Trim()
        }
    }

    If ( $handles ) {
        [PSCustomObject]@{
            "Name"    = $_.Name
            "PID"     = $_.ID
            "Handles" = $handles
        }
    }
}

Write-Host "The following files are open:`n $results"

sleep 30