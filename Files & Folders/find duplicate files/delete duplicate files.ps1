clear-host
$VerbosePreference = "Continue"
$Path = 'C:\dedup-test' #define path to folders to find duplicate files
$Files=gci -File -Recurse -path $Path | Select-Object -property FullName,Length

function DeleteDuplicates {
    
    $Count=1
    $TotalFiles=$Files.Count
    $MatchedSourceFiles=@()
    ForEach ($SourceFile in $Files)
    {
      Write-Progress -Activity "Processing Files" -status "Processing File $Count / $TotalFiles" -PercentComplete ($Count / $TotalFiles * 100)
      $MatchingFiles=@()
      $MatchingFiles=$Files | Where-Object {$_.Length -eq $SourceFile.Length}
      Foreach ($TargetFile in $MatchingFiles)
      {
        if (($SourceFile.FullName -ne $TargetFile.FullName) -and !(($MatchedSourceFiles |
          Select-Object -ExpandProperty File) -contains $TargetFile.FullName))
        {
          Write-Verbose "Matching $($SourceFile.FullName) and $($TargetFile.FullName)"
          Write-Verbose "File sizes match."
          if ((fc.exe /A $SourceFile.FullName $TargetFile.FullName) -contains "FC: no differences encountered")
          {
            Write-Verbose "Match found: $TargetFile.FullName"
            Remove-Item $TargetFile.FullName
            return
          }
        }
      }
      if ($MatchingFiles.Count -gt 0)
      {
        $NewObject=[pscustomobject][ordered]@{
          File=$SourceFile.FullName
          MatchingFiles=$MatchingFiles
        }
        $MatchedSourceFiles+=$NewObject
      }
      $Count+=1
    }
}
sleep 5
write-host "001"

for($i=1; $i -le 10; $i++){
    DeleteDuplicates
    write-host $i
}


