$displaytypes = @{
    -1 = 'OTHER'
    0  = 'VGA'
    1  = 'SVIDEO'
    2  = 'COMPOSITE_VIDEO'
    3  = 'COMPONENT_VIDEO'
    4  = 'DVI'
    5  = 'HDMI'
    6  = 'LVDS'
    8  = 'D_JPN'
    9  = 'SDI'
    10 = 'DP_EXTERNAL'
    11 = 'DP_EMBEDDED'
    12 = 'UDI_EXTERNAL'
    13 = 'UDI_EMBEDDED'
    14 = 'RESERVED'
    15 = 'MIRACAST'
    -2147483648 = 'INTERNAL'
}

$displaylist = $null

$displays = Get-WmiObject -Query "SELECT __SERVER,Active,VideoOutputTechnology FROM WmiMonitorConnectionParams" -Namespace "root\wmi" -ErrorAction SilentlyContinue
if ($?)
    {
    foreach ($display in $displays) {
        If ($null -ne $displaylist) {
            $displaylist += ","
        }
        $displaylist += $displaytypes[$display.VideoOutputTechnology.GetHashCode()]
    }
}
else {
    $displaylist = "FAILED"
}

return $displaylist
