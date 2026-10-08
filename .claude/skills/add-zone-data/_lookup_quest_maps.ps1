# Print the maps a quest's points of interest sit on (questpoiblob), with the map names from raw/MapVerifier.csv:
# the Rule 5 fact for a quest criterion (_lookup_criteria.ps1 prints its quest id as "type 27 asset <quest id>").
# ObjectiveIndex -1 is the turn-in point, the map where the quest is completed.
# Overwrite $ids before running. Parent agent uses replace_string_in_file to set the IDs, then resets to @().
# Pre-requisite: wow.tools.local must already be running (_start_server.ps1 in Step 0).
# Output: quest|objective=<index>|uiMap=<id> <name> (<verdict>)   or   quest|NO_POI on <build>
$ids = @()
. "$PSScriptRoot\_builds.ps1"
$baseUrl = "http://localhost:5000"
$build = (Get-WowBuilds -BaseUrl $baseUrl).Retail

if ($ids.Count -eq 0) { Write-Host "Set `$ids first."; return }
$header = (Invoke-WebRequest "$baseUrl/dbc/header/questpoiblob/?build=$build" -UseBasicParsing).Content | ConvertFrom-Json
$cols = @($header.headers)
$questCol = [array]::IndexOf($cols, 'QuestID')
$mapCol = [array]::IndexOf($cols, 'UiMapID')
$objCol = [array]::IndexOf($cols, 'ObjectiveIndex')
if ($questCol -lt 0 -or $mapCol -lt 0) { throw "questpoiblob columns not found on $build (got: $($cols -join ', '))" }

$maps = @{}
foreach ($r in Import-Csv (Join-Path $PSScriptRoot '..\..\..\raw\MapVerifier.csv')) { $maps[[int]$r.id] = "$($r.name) ($($r.verdict))" }

$pat = '^(' + ($ids -join '|') + ')$'
$resp = Invoke-WebRequest "$baseUrl/dbc/data/questpoiblob/?build=$build" -Method POST `
    -Body "draw=1&start=0&length=1000&columns[$questCol][search][value]=$pat&columns[$questCol][search][regex]=true" `
    -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
$rows = @(($resp.Content | ConvertFrom-Json).data)
foreach ($id in $ids) {
    $mine = @($rows | Where-Object { [int]$_[$questCol] -eq $id })
    if ($mine.Count -eq 0) { Write-Host "$id|NO_POI on $build"; continue }
    $seen = @{}
    foreach ($row in $mine) {
        $map = [int]$row[$mapCol]
        $obj = if ($objCol -ge 0) { $row[$objCol] } else { '?' }
        $key = "$obj|$map"
        if ($seen.ContainsKey($key)) { continue }
        $seen[$key] = $true
        $name = if ($maps.ContainsKey($map)) { $maps[$map] } else { 'not in MapVerifier.csv' }
        Write-Host "$id|objective=$obj|uiMap=$map $name"
    }
}