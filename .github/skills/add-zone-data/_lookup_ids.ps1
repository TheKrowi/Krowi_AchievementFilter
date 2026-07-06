# Overwrite $ids before running. Parent agent uses replace_string_in_file to set the IDs.
# Uses exact-ID column-3 regex match — never a text search — to avoid wrong results on small IDs.
$ids = @()
$build = "12.0.7.68275"
$pat   = "^(" + ($ids -join "|") + ")$"
$body  = "draw=1&start=0&length=$($ids.Count + 10)&columns[3][search][value]=$pat&columns[3][search][regex]=true"
$resp  = Invoke-WebRequest "http://localhost:5000/dbc/data/achievement/?build=$build" `
    -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
$rows  = ($resp.Content | ConvertFrom-Json).data
$byId  = @{}
$rows | ForEach-Object { $byId[$_[3]] = $_ }
foreach ($id in $ids) {
    $sid = "$id"
    if ($byId.ContainsKey($sid)) {
        Write-Host "$id|$($byId[$sid][1])|$($byId[$sid][0])"  # id|Title_lang|Description_lang
    } else {
        Write-Host "$id|NOT_FOUND|"
    }
}
