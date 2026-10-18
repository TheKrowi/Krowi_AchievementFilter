# Pass the ids as -Ids 12345,12346, or set the $Ids placeholder below, run, and reset it to @().
# -Client Classic queries the Classic build; the build itself is resolved from the server (the kit's tools\Get-WowBuilds.ps1).
# Uses exact-ID column-3 regex match — never a text search — to avoid wrong results on small IDs.
# Pre-requisite: wow.tools.local must already be running.
param(
    [string[]] $Ids = @(),
    [ValidateSet('Retail', 'Classic')] [string] $Client = 'Retail'
)
. "$PSScriptRoot\..\..\tools\KitPath.ps1"
. "$KitTools\Get-WowBuilds.ps1"
$baseUrl = "http://localhost:5000"
$build = (Get-WowBuilds -BaseUrl $baseUrl)[$Client]
if ($Ids.Count -eq 0) { Write-Host "Pass -Ids or set the `$Ids placeholder first."; return }
Write-Host "build: $Client $build"
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
