# Microsoft.Winget HowTo

## if you can't find packages, your domain configuration may have it blocked.

To get around this
1. reinstall from package file
1. run `winget settings`
	1. change `autoUpdateIntervalInMinutes` to `0` so that it never checks for updates
1. reinstall from package file (should retain no autoupdate setting) and can now install packages
