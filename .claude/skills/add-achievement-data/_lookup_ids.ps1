# Overwrite $ids and $build before running. Parent agent uses replace_string_in_file to set the IDs.
# Uses exact-ID column-3 regex match — never a text search — to avoid wrong results on small IDs.
# Pre-requisite: wow.tools.local must already be running.
$ids = @(62447, 62449, 62460, 62461, 62492, 62930, 62955, 63104, 63254, 63358, 63359, 63432, 63451, 63452, 63453, 63454, 63609, 63630, 63633, 63653, 63097)
$build = "12.1.0.69273"
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
