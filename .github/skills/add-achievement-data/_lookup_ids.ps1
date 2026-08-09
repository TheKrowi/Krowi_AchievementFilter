# Overwrite $ids and $build before running. Parent agent uses replace_string_in_file to set the IDs.
# Uses exact-ID column-3 regex match — never a text search — to avoid wrong results on small IDs.
# Pre-requisite: wow.tools.local must already be running.
$ids = @(6375, 6402, 6556, 6566, 6581, 6582, 6602, 6604, 6605, 6606, 6827, 6927, 6932, 7433, 7499, 7500, 7501, 7521, 7525, 7860, 7934, 7936, 8080, 8124, 8293, 8300, 8302, 8348, 8398, 8399, 8454, 8484, 8641)
$build = "12.0.7.68974"
$baseUrl = "http://localhost:5000"
$pat = "^(" + ($ids -join "|") + ")$"
$body = "draw=1&start=0&length=$($ids.Count + 10)&columns[3][search][value]=$pat&columns[3][search][regex]=true"
$resp = Invoke-WebRequest "$baseUrl/dbc/data/achievement/?build=$build" `
    -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
$json = $resp.Content | ConvertFrom-Json
Write-Host "recordsFiltered: $($json.recordsFiltered)"
$rows = $json.data
$byId = @{}
$rows | ForEach-Object { $byId[$_[3]] = $_ }
foreach ($id in $ids) {
    $key = "$id"
    if ($byId.ContainsKey($key)) {
        $row = $byId[$key]
        Write-Host "$id|$($row[1])|$($row[2])|$($row[5])|$($row[13])|$($row[0])"  # id|Title_lang|Reward_lang|Faction|RewardItemID|Description_lang
    } else {
        Write-Host "$id|NOTFOUND"
    }
}
