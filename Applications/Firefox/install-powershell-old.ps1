md -Path $env:temp\firefoxinstall -erroraction SilentlyContinue | Out-Null
$Download = join-path $env:temp\firefoxinstall firefox_installer.exe
(new-object System.Net.WebClient).DownloadFile('https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US',$Download)
Invoke-Expression "$Download /S"
