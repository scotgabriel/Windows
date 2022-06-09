#Requires -RunAsAdministrator

# The logon to the sandbox has a password that you won't know.
# If you want to LOCK the sandbox or do other things that require the password
# open an ELEVATED CLI and type "net user WDAGUtilityAccount *" and set a password
# the password you set will go away when you close the sandbox, just like every thing else.

Enable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -All -Online
