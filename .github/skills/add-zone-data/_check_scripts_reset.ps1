# Evaluator: verify all designated lookup scripts are properly reset to their empty-placeholder state.
# Exits 0 (pass) when all scripts have @() or no values. Exits 1 (fail) listing dirty scripts.
$skillDir = "e:\World of Warcraft Addon Development\Krowi_AchievementFilter\.github\skills\add-zone-data"

$scripts = @{
    "_lookup_ids.ps1"       = '\$ids\s*=\s*@\((?!\s*\))'    # matches $ids = @( with content
    "_check_csv.ps1"        = '\$ids\s*=\s*@\((?!\s*\))'
    "_zone_search.ps1"      = '\$terms\s*=\s*@\((?!\s*\))'
    "_linkgroups_search.ps1"= '\$ids\s*=\s*@\((?!\s*\))'
    "_find_zonefile.ps1"    = '\$ids\s*=\s*@\((?!\s*\))'
}

$dirty = @()
foreach ($entry in $scripts.GetEnumerator()) {
    $path = Join-Path $skillDir $entry.Key
    if (-not (Test-Path $path)) { Write-Host "MISSING: $($entry.Key)"; $dirty += $entry.Key; continue }
    $content = Get-Content $path -Raw
    if ($content -match $entry.Value) {
        Write-Host "DIRTY:   $($entry.Key) — placeholder not reset to @()"
        $dirty += $entry.Key
    } else {
        Write-Host "OK:      $($entry.Key)"
    }
}

if ($dirty.Count -gt 0) {
    Write-Error "FAIL — $($dirty.Count) script(s) have leftover values. Reset them to @() before committing."
    exit 1
} else {
    Write-Host "`nPASS — all lookup scripts are clean."
    exit 0
}
