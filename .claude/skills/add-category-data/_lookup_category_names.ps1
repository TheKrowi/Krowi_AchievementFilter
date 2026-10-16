# Pass the achievement category ids as -Ids 15270,15259, or set the $Ids placeholder below, run, and reset it to @().
# -Client Classic queries the Classic build; the build itself is resolved from the server (the kit's tools\Get-WowBuilds.ps1).
# wow.tools.local must already be running.
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
$pat = "^(" + ($Ids -join "|") + ")$"
$body = "draw=1&start=0&length=$($Ids.Count + 10)&columns[1][search][value]=$pat&columns[1][search][regex]=true"
$resp = Invoke-WebRequest "$baseUrl/dbc/data/achievement_category/?build=$build" -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
$json = $resp.Content | ConvertFrom-Json
Write-Host "recordsFiltered: $($json.recordsFiltered)"
$rows = $json.data
$byId = @{}
$rows | ForEach-Object { $byId[$_[1]] = $_ }
foreach ($id in $Ids) {
    $key = "$id"
    if ($byId.ContainsKey($key)) {
        $row = $byId[$key]
        Write-Host "$id|$($row[0])|parent=$($row[2])"
    } else {
        Write-Host "$id|NOTFOUND"
    }
}
