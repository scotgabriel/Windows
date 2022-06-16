Const FAVORITES = &H6&

Set objShell = CreateObject("Shell.Application")
Set objFolder = objShell.Namespace(FAVORITES)
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objBookMark = objFSO.CreateTextFile(".\bookmark.htm", 2)
objBookMark.WriteLine "<TITLE>Bookmarks</TITLE>"
objBookMark.WriteLine "<H1>Bookmarks</H1>"
objBookMark.WriteLine "<DL><p>"
For Each objItem in objFolder.Items
    If objItem.IsLink Then
        Set objLink = objItem.GetLink
        objBookMark.Write "<A HREF=""" & objLink.Target & """>" & objItem.Name & "</A></br>"
    End If
Next
objBookMark.WriteLine "</DL></p>"
objBookMark.Close