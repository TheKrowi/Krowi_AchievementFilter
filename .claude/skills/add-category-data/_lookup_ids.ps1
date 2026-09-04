# Overwrite $ids before running. wow.tools.local must already be running.
# Overwrite $ids before running. wow.tools.local must already be running.
# Overwrite $ids before running. wow.tools.local must already be running.
$ids = @(63441, 63605, 63606, 63670)
$build = "12.1.0.68914"
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
        Write-Host "$id|$($row[1])|$($row[2])|$($row[5])|$($row[7])|$($row[0])"  # id|Title_lang|Reward_lang|Faction|Category|Description_lang
    } else {
        Write-Host "$id|NOTFOUND"
    }
}
