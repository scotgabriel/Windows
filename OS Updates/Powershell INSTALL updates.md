# Install-WindowsUpdate

## Generic
```powershell
Install-WindowsUpdate
```

## Force from MS proper (not local WSUS), auto accept, reboot if needed
```powershell
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot
```