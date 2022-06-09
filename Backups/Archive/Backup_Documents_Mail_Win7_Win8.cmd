@ECHO off
REM - Specify backup drive letter\path or network path below, with a TRAILING BACKSLASH - \
REM - It should be accessible through Windows Explorer!
set backup_path=\\192.168.x.x\backups\%username%\

REM -- Windows 7 or Windows 8 Backup Batch File

IF NOT EXIST %backup_path% GOTO MISSINGPATH

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

echo.
echo ****** Please verify that the following path is correct.
echo ****** Path: %backup_path%
echo ****** Continue backup... ([Ctrl] C to abort)
pause

REM --SELECT YOUR BACKUP FILES HERE-- Add "REM " minus the quotes in front of any you don't want...
REM _______________________________________________________________________________________________
xcopy /h/i/c/k/e/y/f/d C:\"Users"\"%username%"\"Desktop"\*.* %backup_path%"Desktop"
xcopy /h/i/c/k/e/y/f/d C:\"Users"\"%username%"\"Documents"\*.* %backup_path%"Documents"
rem xcopy /h/i/c/k/e/y/f/d C:\"Users"\"%username%"\"Music"\*.* %backup_path%"Music"
xcopy /h/i/c/k/e/y/f/d C:\"Users"\"%username%"\"Pictures"\*.* %backup_path%"Pictures"
xcopy /h/i/c/k/e/y/f/d C:\"Users"\"%username%"\"Favorites"\*.* %backup_path%"Favorites"
xcopy /h/i/c/k/e/y/f/d C:\"Users"\"%username%"\"AppData"\"Roaming"\Microsoft\Outlook\*.* %backup_path%"Outlook_Type_Ahead"
xcopy /h/i/c/k/e/y/f/d C:\"Users"\"%username%"\"AppData\"Local"\Microsoft\Outlook\*.* %backup_path%"Outlook"

REM ----Other possiblebackup items below----
REM xcopy /h/i/c/k/e/y/f/d C:\"Program Files"\Lotus\Notes\Data\*.* "%backup_path%"Lotus\Data
REM xcopy /h/i/c/k/e/y/f/d C:\"Program Files"\Lotus\Notes\Notes.ini "%backup_path%"Lotus

REM xcopy /h/i/c/k/e/y/f/d C:\Pref??            "%backup_path%"Software_Name - Employee Review Software?


echo.
echo --Finished Copying--
pause
GOTO END

:MISSINGPATH
echo.
echo ******************************** ABORTING BACKUP *******************************
echo        WARNING - YOUR BACKUP PATH APPEARS TO BE MISSING OR INACCESSIBLE.
echo   path: %backup_path%
echo ******************************** ABORTING BACKUP *******************************
echo.
echo Please make sure the external drive is connected or the server share is mapped and try again.
echo.
echo Your backup path should be accessible in Windows Explorer.
echo.
echo You may need to open Windows Explorer, paste or type the backup path listed above into the
echo   address bar and then enter your user name and password before running the backup script again.
echo.
echo If you can't get to the path or don't know what to do, contact your Network Administrator
echo for further help to make sure your data gets backed up!!!
echo.
echo Remember to backup regularly.  "Backup religiously and follow that religion fanatically."
pause
:END