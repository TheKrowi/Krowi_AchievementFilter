# Find the link group (primary map id and all its sub-zones) for any map id, from raw\MapVerifier.csv.
# Overwrite $ids before running. Parent agent uses replace_string_in_file to set IDs, then resets to @().
# Output: id|primary=N|primaryName=...|ids=N, N, N   or   id|NOT_IN_ANY_GROUP
$ids = @()
$root = "e:\World of Warcraft Addon Development\Krowi_AchievementFilter"
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
