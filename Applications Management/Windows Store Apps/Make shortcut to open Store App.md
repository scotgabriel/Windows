# Open Windows Store Apps from shortcut

1. open "apps folder
	`shell:appsfolder`
1. `get-appxpackage > apps.txt`
1. open generated text file and search for desired app by a portion of it's name
1. save/copy the line for *PackageFullName*, we will use it later
1. use explorer to go to the *InstallLocation* path
1. open the `AppxManifest.xml` found in that location
1. Search for *Application ID*, and save/copy it's value (between the double quotes) for later
1. Generate an output similar to this
	```
	start explorer.exe shell:AppsFolder\SpotifyAB.SpotifyMusic_zpdnekdrzrea0!Spotify
	```
	but replace "SpotifyAB.SpotifyMusic_zpdnekdrzrea0" with *PackageFullName* and
	replace "!Spotify" with !*Application ID*
1. You should now be able to save that to a bat file to open the Store App programmatically
	

