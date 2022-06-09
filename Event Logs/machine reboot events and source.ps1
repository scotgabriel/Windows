# Event Log ID's

# 1074  Expected shutdown: The process %1 has initiated the %5 of computer %2 on behalf of
#       user %7 for the following reason: %3
#       Reason Code: %4
#       Shutdown Type: %5
#       Comment: %6
# 1076  Unexpected shutdown (only written when the first user logs 
#       in <with shutdown privileges> to a system that just experienced an unexpected shutdown):
#       The process %1 has initiated the %5 of computer %2 on behalf of user %7 for the
#       following reason: %3
#       Reason Code: %4
#       Shutdown Type: %5
#       Comment: %6
# 6005  The Event log service was started.
# 6006  The Event log service was stopped.
# 6008  The previous system shutdown at **TIME** on **Date** was unexpected.
# 6009  Registered only at startup, contains string identifying the operating system version


Get-EventLog -LogName System | Where-Object {$_.EventID -in (1074,1076,6005,6006,6008,6009)} | Format-Table TimeGenerated, EventId, Message -AutoSize -Wrap