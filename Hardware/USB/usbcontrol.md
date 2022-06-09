# USB Controller

## Disable Selective Suspend (Power management of USB devices)

tags: Startech.com Dock (DK30C2DPPD), monitor disconnect reconnect

### Registry

`HKLM\System\CurrentControlSet\Services\USB`<br>
Name = **"DisableSelectiveSuspend"**<br>
Type = **DWORD**<br>

#### Values

- "1" = Disable the Selective Suspend Feature

**Note**: I have always just gone through and unchecked "Allow Power Management" on a per USB device basis, but this seems to be more hollistic if you are having problems with multiple devices perhaps through a USB based hub/dock.
