# AT's script

Function Search-LargeFiles {
    # If FileSize is not specified the default value of 75MB will be used
    # Specify filesize in MB. Search for files greater than FileSize.

    [CmdletBinding()]
    Param (
        [string]$ComputerName = $env:COMPUTERNAME,
        [int]$FileSize = 75
    )

    # Captapture initial FileSize for HTML report before converting to bytes
    $initialFileSize = $FileSize

    # Convert value to bytes
    $FileSize = $FileSize * 1000 * 1000

    # create temp dir
    if (-not (Test-Path C:\temp)) {
        New-Item -Path C:\temp -ItemType Directory
    }

    # remove old report
    $FilePath = "C:\temp\$computerName-largefiles.html"
    if ($FilePath) {
        Remove-Item -Path $FilePath -ErrorAction SilentlyContinue
    }

    # HTML code
    $header = @"
    <style>
        body {
                font-family:"Times New Roman",Arial,Helvetica,sans-serif;
                font-size: 12pt;
                background-color:#E5E4E2;
            }
        table {
                border-style:solid;
                border-width:1px;
                border-collapse:collapse;
            }
        td {
                border-width: 1px;
                border-style: solid;
                border-color: black;
                text-align: left;
            }
        th {
                text-align:center;
                padding-top:5px;
                padding-bottom:5px;
                padding-right:7px;
                padding-left:7px;
                border-color:black;
                background-color:DarkGrey;
                color:white;
            }
        name tr {
                color:#000000;
                background-color:#EAF2D3;
            }
    </style>
<title>Large Files</title>
"@
    $title = "<h1 style=text-align:left;>$computerName</h1><h2>Files Larger than $initialFileSize MB</h2>"
    $footer = "<h5><i>Report run $((Get-Date).ToShortDateString())</i></h5>"

    Write-Host "Searching for files larger than $initialFileSize MB..." -ForegroundColor Green
    $largefiles = Get-ChildItem -Path C:\ -Recurse -File -ErrorAction SilentlyContinue | 
    Where-Object { $_.Length -gt $FileSize }
    
    $largefilesbody = $largefiles | Sort-Object -Descending -Property Length |
    Select-Object @{Name = "FileName"; Expression = { $_.Name } },
    @{Name = "Size(MB)"; Expression = { [decimal]("{0:N2}" -f ($_.Length / 1mb)) } },
    @{Name = "Location"; Expression = { $_.Directory } },
    CreationTime | ConvertTo-Html -Fragment

    $fileextension = $largefiles |
    Sort-Object -Property Extension | Group-Object -Property Extension -NoElement |
    Sort-Object Count -Descending | Select-Object Count, Name | ConvertTo-Html -Fragment

    ConvertTo-Html -Head $header -Body "$title $largefilesbody $fileextension" -PostContent $footer | Out-File $FilePath
}