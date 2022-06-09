# Get-WinEvent supersedes Get-EventLog
# Get-EventLog -LogName application -Newest 100 -Source 'Windows Error*' | Select-Object timewritten, message | Where-Object message -match 'bluescreen' |  Format-Table -auto -wrap


# Get-WinEvent available properties

# Message:                     # MachineName:
# ID:                          # UserId:
# Version:                     # TimeCreated:
# Qualifiers:                  # ActivityId:
# Level:                       # RelatedActivityId:
# Task:                        # ContainerLog:
# Opcode:                      # MatchedQueryIds:
# Keywords:                    # Bookmark:
# RecordId:                    # LevelDisplayName:
# ProviderName:                # OpcodeDisplayName:
# ProviderID:                  # TaskDisplayName:
# LogName:                     # KeybwordsDisplayNames:
# ProcessID:                   # Properties:
# ThreadId:                    


Get-WinEvent -LogName application -MaxEvents 100 |`
Select-Object TimeCreated, Message, Logname, ProviderName |`
Where-Object Message -match 'bluescreen' |`
Format-Table -AutoSize
