# $errorLog=$args[0]
$errorLog='test'
Write-EventLog -LogName Application -EventID 2001 -EntryType Error -Source ‘OPM’ -Message (‘OPM acquisition encountered error: ' + $errorLog)
