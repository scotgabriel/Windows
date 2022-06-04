$Session = New-Object -ComObject Microsoft.Update.Session
$Searcher = $Session.CreateUpdateSearcher()
$Searcher.Search("IsInstalled=1").Updates

# To find specific udpate by KB
# $Searcher.Search("IsInstalled=1").Updates | Where-Object {$_.Title -like "*KB2760587*"}