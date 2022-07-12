md -Path $env:temp\firefoxinstall -erroraction SilentlyContinue | Out-Null
$Download = join-path $env:temp\firefoxinstall firefox_installer.exe
Invoke-WebRequest 'https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US' -OutFile $Download
Invoke-Expression "$Download /S"
