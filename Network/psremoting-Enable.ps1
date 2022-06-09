
# My default
Enable-PSRemoting -Force

# Use this on the machine and if doesn't pass the "public/private/domain" profile check
# EVEN though all networks that are enabled show "private" or "DomainAuthenticated"
Enable-PSRemoting -SkipNetworkProfileCheck -Force