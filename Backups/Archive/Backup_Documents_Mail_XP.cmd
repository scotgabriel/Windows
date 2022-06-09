@ECHO off
REM - Specify backup drive letter and path below, with a trailing backslash - \
set backup_path=\\192.168.x.x\share\

REM -- Windows XP Backup Batch File

echo.
echo **********************************************************************
echo * CLOSE YOUR EMAIL AND DOCUMENTS - OR THEY WILL NOT BACKUP!!!!!!!!!! *
echo *                                                                    *
echo * This will only backup my documents and other specified areas.      *
echo * Please periodically verify that everything you need is in the      *
echo * backup folder. If there is anything else that needs backing up     *
echo * please contact the IT department for assistance setting it up.     *
echo * Wait until the backup completes and asks you to hit any key.       *
echo **********************************************************************

IF NOT EXIST %backup_path% GOTO MISSINGPATH

echo.
echo ****** PLEASE CHECK that you are connected to the network or have ******
echo ****** your backup drive connected, using the following path...
echo ****** Path: %backup_path%
pause

REM --SELECT YOUR BACKUP FILES HERE-- Add "REM " minus the quotes in front of any you don't want...
REM _______________________________________________________________________________________________
xcopy /h/i/c/k/e/y/f/d C:\"Documents and Settings"\"%username%"\"Desktop"\*.* %backup_path%"Desktop"
xcopy /h/i/c/k/e/y/f/d C:\"Documents and Settings"\"%username%"\"My Documents"\*.* %backup_path%"My Documents"
xcopy /h/i/c/k/e/y/f/d C:\"Documents and Settings"\"%username%"\"Favorites"\*.* %backup_path%"Favorites"
xcopy /h/i/c/k/e/y/f/d C:\"Documents and Settings"\"%username%"\"Cookies"\*.* %backup_path%"Cookies"
xcopy /h/i/c/k/e/y/f/d C:\"Documents and Settings"\"%username%"\"Application Data"\Microsoft\Outlook\*.* %backup_path%"Outlook_Type_Ahead"
xcopy /h/i/c/k/e/y/f/d C:\"Documents and Settings"\"%username%"\"Local Settings"\"Application Data"\Microsoft\Outlook\*.* %backup_path%"Outlook"

REM ----Other possible backup items below----
REM xcopy /h/i/c/k/e/y/f/d C:\Program Files\Lotus\Notes\Data\*.* "%backup_path%"Lotus\Data
REM xcopy /h/i/c/k/e/y/f/d C:\Program Files\Lotus\Notes\Notes.ini "%backup_path%"Lotus
REM xcopy /h/i/c/k/e/y/f/d C:\Pref??            "%backup_path%"Software_Name - Employee Review Software?


echo.
echo --Finished Copying--
pause
GOTO END

:MISSINGPATH
echo.
echo WARNING - Your backup path (%backup_path%) appears to be missing. ABORTING BACKUP.
echo Please make sure the drive is connected or mapped and try again.
echo If you don't know what to do, contact your Network Administrator
echo to make sure your data gets backed up.
pause
:END