<#

USERNAME
SESSIONNAME
ID
STATE
IDLE TIME
LOGON TIME

#>


$currentUsers = (query user) -split "\n" -replace '\s\s+', ',' -replace '>', '' | convertfrom-csv -Delimiter ','

$currentUsers