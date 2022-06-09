
# PREREQUISITES
#   If run from a saved script file (not just an interactive window)...
#   you will need to 'Set-ExecutionPolicy Unrestricted' <or other LESS "all inclusive" setting

# BASE

    # Chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    # Applications alphabetical by name
    
        # AutoHotKey
            choco install autohotkey -y
        # Forticlient (VPN)
            choco install forticlientvpn -y
        # Notepad++
            # choco install notepadplusplus -y
        # Postman
            # choco install postman -y
        # Visual Studio 2019 (Community Edition)
            # choco install visualstudio2019community -y
        # VSCODE
            choco install vscode -y
    
    
    
    
    
    
    