## Requires AudioDeviceCmdlets.dll found here https://github.com/frgnca/AudioDeviceCmdlets

Param(
[Parameter(Mandatory=$true)]
[int]$newVolume
)
Import-Module ".\AudioDeviceCmdlets.dll"
If ($newVolume -gt 100){$newVolume = 100} If ($newVolume -lt 0){$newVolume = 0}
$curDefaultAudio = Get-AudioDevice -Playback
Get-AudioDevice -List | ForEach-Object { Set-AudioDevice -Index $_.Index Set-AudioDevice -PlaybackVolume $newVolume }
Set-AudioDevice -Index $curDefaultAudio.Index