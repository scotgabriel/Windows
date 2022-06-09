###
# Author: Dave Long <dlong@cagedata.com>
# Gets an bandwidth test using iPerf3. Sum is the download speed of computer.
###

$iPerfDownload = "https://iperf.fr/download/windows/iperf-3.1.3-win64.zip"
$DownloadLocation = Join-Path $env:TEMP "iperf.zip"
$iPerfPath = Join-Path $env:TEMP "iperf"

if (!(Test-Path $iPerfPath)) {
  Invoke-WebRequest -Uri $iPerfDownload -OutFile $DownloadLocation
  Expand-Archive -Path $DownloadLocation -DestinationPath $iPerfPath
}
Set-Location (Join-Path $iPerfPath "iperf-3.1.3-win64")

$Download = & .\iperf3.exe --client iperf.cageops.com --port 5210 --parallel 10 --reverse
if (($Download | Select-Object -Last 1) -eq "iperf Done.") {
  Write-Host "Download Speed"
  $Download | Select-Object -Last 4 | Select-Object -First 2 | Write-Host
} else {
  Write-Host "iPerf failed to get download speed."
}
$Upload = & .\iperf3.exe --client iperf.cageops.com --port 5210 --parallel 10
if (($Upload | Select-Object -Last 1) -eq "iperf Done.") {
  Write-Host "Upload Speed"
  $Upload | Select-Object -Last 4 | Select-Object -First 2 | Write-Host
} else {
  Write-Host "iPerf failed to get upload speed."
}