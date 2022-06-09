# Windows workstation ESD export process

## Identify Images you want to extract

dism /Get-WimInfo /WimFile:<filename>

## Image export from ESD file

dism /export-image /SourceImageFile:<filename> /SourceIndex:<index#> /DestinationImageFile:<filename> /Compress:max /CheckIntegrity