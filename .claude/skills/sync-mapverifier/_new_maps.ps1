# List the maps a game build has that raw/MapVerifier.csv does not, plus the rows the CSV has without a verdict:
# the to-do list of a Map Verifier session before or after a patch. Read-only.
# The build comes from add-zone-data's _builds.ps1: the newest live Retail build, or with
# $env:KAF_RETAIL_PRODUCT = "wowxptr" the newest PTR build.
# Pre-requisite: wow.tools.local must already be running.
# Output: NEW|id|name|type|parent id parent name   and   UNREVIEWED|id|name|type|parent (no verdict and no link)
. "$PSScriptRoot\..\add-zone-data\_builds.ps1"
. "$PSScriptRoot\_mapverifier_io.ps1"
$baseUrl = "http://localhost:5000"
$build = (Get-WowBuilds -BaseUrl $baseUrl).Retail
$types = @{ 0 = 'cosmic'; 1 = 'world'; 2 = 'continent'; 3 = 'zone'; 4 = 'dungeon'; 5 = 'micro'; 6 = 'orphan' }

$csv = @((Read-MapVerifierCsv (Join-Path $PSScriptRoot '..\..\..\raw\MapVerifier.csv')).Rows)
$known = @{}
foreach ($r in $csv) { $known[[int]$r.id] = $r }

$resp = Invoke-WebRequest "$baseUrl/dbc/data/uimap/?build=$build" -Method POST -Body "draw=1&start=0&length=10000" `
    -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
$rows = @(($resp.Content | ConvertFrom-Json).data)   # uimap columns: 0=Name_lang 1=ID 2=ParentUiMapID 5=Type
$names = @{}
foreach ($m in $rows) { $names[[int]$m[1]] = [System.Net.WebUtility]::HtmlDecode($m[0]) }

Write-Host "Build $build : $($rows.Count) maps, raw/MapVerifier.csv $($csv.Count) rows"
foreach ($m in $rows | Sort-Object { [int]$_[1] }) {
    $id = [int]$m[1]
    if ($known.ContainsKey($id)) { continue }
    $parent = [int]$m[2]
    Write-Host ("NEW|{0}|{1}|{2}|{3} {4}" -f $id, $names[$id], $types[[int]$m[5]], $parent, $names[$parent])
}
foreach ($r in $csv | Where-Object { -not $_.verdict -and -not $_.link }) {   # a linked sub-map takes its primary's verdict
    Write-Host ("UNREVIEWED|{0}|{1}|{2}|{3} {4}" -f $r.id, $r.name, $types[[int]$r.mapType], $r.parentMapID, $names[[int]$r.parentMapID])
}