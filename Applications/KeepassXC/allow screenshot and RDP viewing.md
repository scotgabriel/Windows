# Screenshot Security

By default, KeePassXC prevents recordings and screenshots of the application window on Windows and macOS.  
This prevents inadvertent spillage of information during meetings and disallows other applications to capture the window contents.  
If you would like to enable screen capture, you must start the application with the `--allow-screencapture` command line flag.

> ![note]
> You can also add the command line parameter to the auto-start definition in the registry: HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run look for the KeePassXC entry
