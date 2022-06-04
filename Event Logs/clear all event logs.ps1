# Clear Windows Event Logs

wevtutil el | Foreach-Object {wevtutil cl "$_"}
