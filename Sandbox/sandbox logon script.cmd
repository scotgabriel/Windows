REM sandbox-setup.cmd
REM This code runs in the context of the Windows Sandbox
mkdir c:\scriptrunning

REM set execution policy first so that a setup script can be run
powershell.exe -command "&{Set-ExecutionPolicy -ExecutionPolicy Unrestricted -force}"

REM set the sandbox useraccount's desktop password
net user wdagutilityaccount pw123

REM Now run the true configuration script
REM powershell.exe -file "C:\Users\wdagutilityaccount\Documents\sg-root\programming\Application Installation\Windows-Dev-Workstation-Applications-viaChocolatey.ps1"
