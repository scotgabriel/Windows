#Requires -RunAsAdministrator

$filePath = "$env:SystemRoot\System32\drivers\etc\hosts"
$hostFile = Get-Content $filePath
$commentToPrepend = "`r`n# the next line was commented out (date:initials) in support of ticket: (ticket#) `r`n"
$thingToSearchFor = "rhino.acme.com"

$results = foreach ($line in $hostFile) {
    # find lines containing string and comment it out
    if ($line -match $thingToSearchFor) {
        "$commentToPrepend# $line"
    }
    else {
        $line
    }
}

$results | Out-File $filePath -Force