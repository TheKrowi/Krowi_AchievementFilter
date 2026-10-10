# Find the link group (primary map id and all its sub-zones) for any map id, from raw\MapVerifier.csv.
# Pass the map ids as -Ids 2537,2538, or set the $Ids placeholder below, run, and reset it to @().
# Output: id|primary=N|primaryName=...|ids=N, N, N   or   id|NOT_IN_ANY_GROUP
param(
    [string[]] $Ids = @()
)
if ($Ids.Count -eq 0) { Write-Host "Pass -Ids or set the `$Ids placeholder first."; return }
$root = (Resolve-Path "$PSScriptRoot\..\..\..").Path
. "$root\.claude\skills\sync-mapverifier\_mapverifier_io.ps1"
$rows = (Read-MapVerifierCsv "$root\raw\MapVerifier.csv").Rows
$byId = @{}; $members = @{}
foreach ($r in $rows) {
    $byId[[int]$r.id] = $r
    if ($r.link -ne '') {
        $p = [int]$r.link
        if (-not $members.ContainsKey($p)) { $members[$p] = [System.Collections.Generic.List[int]]::new(); $members[$p].Add($p) }
        $members[$p].Add([int]$r.id)
    }
}
foreach ($id in $ids) {
    $i = [int]$id
    $p = if ($byId.ContainsKey($i) -and $byId[$i].link -ne '') { [int]$byId[$i].link } elseif ($members.ContainsKey($i)) { $i } else { $null }
    if ($null -ne $p) {
        Write-Host "$id|primary=$p|primaryName=$($byId[$p].name)|ids=$(($members[$p] | Sort-Object) -join ', ')"
    } else {
        Write-Host "$id|NOT_IN_ANY_GROUP"
    }
}
