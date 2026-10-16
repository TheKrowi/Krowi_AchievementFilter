# Print the criteria tree of achievements: the zone, NPC or boss names the game itself uses.
# This is the "checkable fact" Zone Placement Rule 4 asks for before assigning a zone.
# Pass the ids as -Ids 12345,12346, or set the $Ids placeholder below, run, and reset it to @().
# Pre-requisite: wow.tools.local must already be running (_start_server.ps1 in Step 0).
# Output: one header line per achievement, then its criteria indented (tree id, criteria id, amount, and the
# criteria's type and asset: 8 = achievement id, 27 = quest id, 46 = faction id, 43 = explore area, 0 = creature id).
# The header gives the root tree's operator and amount, which say how many children complete it: 4 = all children,
# 8 = any child, 7 = <amount> of the children, 5 = the children's quantities summed to <amount>.
param(
    [string[]] $Ids = @()
)
. "$PSScriptRoot\..\..\tools\KitPath.ps1"
. "$KitTools\Get-WowBuilds.ps1"
$baseUrl = "http://localhost:5000"
$build = (Get-WowBuilds -BaseUrl $baseUrl).Retail   # criteria trees are the same on both clients for shared ids

function Decode-Html([string]$s) { $s -replace '&#39;', "'" -replace '&amp;', '&' -replace '&quot;', '"' }
function Invoke-Dbc([string]$table, [string]$body) {
    (Invoke-WebRequest "$baseUrl/dbc/data/$table/?build=$build" -Method POST -Body $body `
        -ContentType "application/x-www-form-urlencoded" -UseBasicParsing).Content | ConvertFrom-Json
}
function Get-CriteriaTypeAsset([int]$criteriaId) {
    # criteria columns: 0=ID 1=Type 2=Asset
    if ($criteriaId -eq 0) { return "" }
    $c = @((Invoke-Dbc 'criteria' "draw=1&start=0&length=1&columns[0][search][value]=^$criteriaId`$&columns[0][search][regex]=true").data)
    if ($c.Count -eq 0) { return "" }
    return ", type $($c[0][1]) asset $($c[0][2])"
}
function Write-Children([int]$parent, [int]$depth) {
    # criteriatree columns: 0=ID 1=Description_lang 2=Parent 3=Amount 4=Operator 5=CriteriaID 6=OrderIndex 7=Flags
    $j = Invoke-Dbc 'criteriatree' "draw=1&start=0&length=500&columns[2][search][value]=^$parent`$&columns[2][search][regex]=true"
    foreach ($row in @($j.data | Sort-Object { [int]$_[6] })) {   # @() keeps a single row from being unrolled into its cells
        Write-Host ("{0}{1} (tree {2}, criteria {3}, amount {4}{5})" -f ('  ' * $depth), (Decode-Html $row[1]), $row[0], $row[5], $row[3], (Get-CriteriaTypeAsset ([int]$row[5])))
        if ($depth -lt 3) { Write-Children ([int]$row[0]) ($depth + 1) }
    }
}

if ($Ids.Count -eq 0) { Write-Host "Pass -Ids or set the `$Ids placeholder first."; return }
$pat = '^(' + ($ids -join '|') + ')$'
# achievement columns: 0=Description_lang 1=Title_lang 3=ID 14=Criteria_tree
$ach = Invoke-Dbc 'achievement' "draw=1&start=0&length=$($ids.Count + 10)&columns[3][search][value]=$pat&columns[3][search][regex]=true"
$found = @{}
foreach ($row in $ach.data) {
    $found["$($row[3])"] = $true
    $root = @((Invoke-Dbc 'criteriatree' "draw=1&start=0&length=1&columns[0][search][value]=^$($row[14])`$&columns[0][search][regex]=true").data)
    $rootText = if ($root.Count -gt 0) { ", operator $($root[0][4]) amount $($root[0][3])" } else { "" }
    Write-Host "== $($row[3]) $(Decode-Html $row[1]) — $(Decode-Html $row[0]) [criteria tree $($row[14])$rootText, build $build] =="
    Write-Children ([int]$row[14]) 1
}
foreach ($id in $ids) { if (-not $found.ContainsKey("$id")) { Write-Host "== $id NOT_FOUND on $build ==" } }
