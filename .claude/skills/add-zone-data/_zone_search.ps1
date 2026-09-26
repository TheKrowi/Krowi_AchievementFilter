# Search raw\MapVerifier.csv by map name (partial, case-insensitive regex).
# Overwrite $terms before running. Parent agent uses replace_string_in_file to set terms, then resets to @().
# Output: term|id|name|verdict|expansion|link   (verdict is the primary's for linked sub-zones; skip-like verdicts are
#         Skip, TaxiAndAdventure, Error, StartingZone — never use those maps in ZoneData)
$terms = @()
$root = "e:\World of Warcraft Addon Development\Krowi_AchievementFilter"
. "$root\.claude\skills\sync-mapverifier\_mapverifier_io.ps1"
$rows = (Read-MapVerifierCsv "$root\raw\MapVerifier.csv").Rows
$byId = @{}; foreach ($r in $rows) { $byId[[int]$r.id] = $r }
foreach ($term in $terms) {
    $hits = @($rows | Where-Object { $_.name -match $term })
    if ($hits) {
        foreach ($r in $hits) {
            $verdict = $r.verdict
            if ($verdict -eq '' -and $r.link -ne '' -and $byId.ContainsKey([int]$r.link)) { $verdict = "linked:" + $byId[[int]$r.link].verdict }
            Write-Host "$term|$($r.id)|$($r.name)|$verdict|$($r.expansion)|$($r.link)"
        }
    } else {
        Write-Host "$term|NOT_FOUND"
    }
}
