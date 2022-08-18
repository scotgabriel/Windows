@echo off

pushd "%~dp0"
set thisPath=%~dp0
setlocal

REM
REM Determining parameters
REM
REM You can specify the path to a specific vhd file in parameter 1, but you don't have to. Script will take 1st .vhd file found.
REM You can specify the driveletter - without colon - in parameter 2, but you don't have to. Script will take free drive letter found.
set vhdPath=%~dpnx1
set driveletter=%2
echo ThisPath: "%thisPath%"
if {%vhdPath%}=={} echo No specific VHD mentioned- will take first VHD file..

if not {%vhdPath%}=={} goto SpecificVHD
set SearchPath=%thisPath%*.vhd
echo SearchPath: %SearchPath%
for %%I in ("%SearchPath%") do (
   rem echo File: "%%I"
   set vhdpath=%%I
   if exist "%%I" goto outloop
)
:outloop
:SpecificVHD
echo.
if not exist %vhdpath% (
   echo Error! No .vhd file found in '%thisPath%' !
   exit /B 1
)

echo VHD path: %vhdpath%
rem pause
