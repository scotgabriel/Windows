REM YYYY/MM/DD
REM This batch file will install the ....?

@ECHO OFF

CLS

REM --------------------------------------------------------------------
REM --------------------------------------------------------------------
ECHO ............. INSTALLING [APPLICATION-NAME] ............

IF EXIST "%ProgramFiles(x86)%" (

start /w msiexec /i "%~dp0\APPLICATION-INSTALLERx64.msi" /passive /l*v %windir%\Temp\APPLICATION-INSTALLERx64.log ALLUSERS=true
) ELSE (

start /w msiexec /i "%~dp0\APPLICATION-INSTALLER.msi" /passive /l*v %windir%\Temp\APPLICATION-INSTALLER.log ALLUSERS=true
) 
