# Set Maximum Event Log Size to 40MB for All Event Logs

$logs = get-eventlog -list | ForEach-Object {$_.log}
foreach ($l in $logs) {
    limit-eventlog -logname $l -MaximumSize 40MB
}
get-eventlog -list
exit 0

