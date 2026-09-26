# Overwrite $categoryIds before running. wow.tools.local must already be running.
$categoryIds = @()
$build = "12.1.0.68914"
$pat = "^(" + ($categoryIds -join "|") + ")$"
$body = "draw=1&start=0&length=$($categoryIds.Count + 10)&columns[1][search][value]=$pat&columns[1][search][regex]=true"
$resp = Invoke-WebRequest "http://localhost:5000/dbc/data/achievement_category/?build=$build" -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
$json = $resp.Content | ConvertFrom-Json
Write-Host "recordsFiltered: $($json.recordsFiltered)"
$rows = $json.data
$byId = @{}
$rows | ForEach-Object { $byId[$_[1]] = $_ }
foreach ($id in $categoryIds) {
    $key = "$id"
    if ($byId.ContainsKey($key)) {
        $row = $byId[$key]
        Write-Host "$id|$($row[0])|parent=$($row[2])"
    } else {
        Write-Host "$id|NOTFOUND"
    }
}
