# System Drive Fragmentation
# Analyzes the system drive to detect if a defragmentation is necessary. Requires Windows 8+ or Windows Server 2012.

$version = (Get-WmiObject Win32_OperatingSystem).Version
$major = $version.split(".")[0]
$minor = $version.split(".")[1]
if ($major -gt 6 -or ($major -eq 6 -and $minor -gt 1)) {
	Optimize-Volume $pwd.drive.name -Analyze -verbose
} Else {
	Write-Output "Operating system is not supported."
}