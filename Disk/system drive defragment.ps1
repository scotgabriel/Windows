# Defragment System Drive
# Defragments the system drive in order to improve the system performance

# ?? Need to add logic to NOT defrag if
#    - solid state drive
#    - VM ($IsVirtual = ((Get-WmiObject Win32_ComputerSystem).model).Contains("Virtual"))

$version = (Get-WmiObject Win32_OperatingSystem).Version
$major = $version.split(".")[0]
$drive = $pwd.drive.name
if ($major -eq 10) {
	Optimize-Volume $drive -Defrag -verbos
} ElseIf($major -eq 6) {
	$minor = $version.split(".")[1]
    if ($minor -eq 2 -or $minor -eq 3) {
		Optimize-Volume $drive -Defrag -verbos
    } Else {
		Invoke-Expression -Command ('defrag ' + $drive + ': /U /V')
    }
} ElseIf ($major -eq 5) {
	Invoke-Expression -Command ('defrag ' + $drive + ': /U /V')
} Else {
	Optimize-Volume $drive -Defrag -verbos
}

