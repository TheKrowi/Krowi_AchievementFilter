# Evaluate-ZoneData.ps1
# Validates all ZoneData.lua files under DataAddons. Parsing is shared with the add-zone-data skill
# (.claude\skills\add-zone-data\_zonedata_parser.ps1), so every Zone() shape is covered:
#   Zone(map, {…})   Zone({maps}, {…})   Zone(map, nil, {10-player}, {25-player})   Zone(map, localTable)
# and ids inside local tables (delves, classHalls, argus, …) and shared.* tables are resolved.
#
# Checks:
#   1. Duplicate achievement ids within one resolved zone entry (written twice, or written and also
#      brought in by a referenced table)
#   2. Map ids that are inactive, or unknown to raw\MapVerifier.csv (after link-group resolution)
#   3. Every achievement id exists in the game DB on Retail or Classic (both builds resolved from the
#      server; Retail-only files are checked against Retail only, Classic-only files against Classic only)
#   4. Parser warnings: Zone() calls that could not be read, references to tables that do not exist
#
# Exit code 0 = no issues; 1 = issues found.
#
# Usage:
#   .\Evaluate-ZoneData.ps1
#   .\Evaluate-ZoneData.ps1 -SkipDbCheck
#   .\Evaluate-ZoneData.ps1 -Files "DataAddons\Retail\11_TheWarWithin\ZoneData.lua"

param(
    [string[]] $Files,          # optional: restrict to specific file(s), relative to root
    [switch]   $SkipDbCheck,    # skip the wow.tools.local existence check
    [string]   $RetailBuild,    # override; default resolved from the server
    [string]   $ClassicBuild,   # override; default resolved from the server
    [string]   $RootDir = (Split-Path $PSScriptRoot -Parent)
)
Set-StrictMode -Version 3
$ErrorActionPreference = "Stop"
$baseUrl = "http://localhost:5000"
$skillDir = Join-Path $RootDir '.claude\skills\add-zone-data'
. (Join-Path $skillDir '_zonedata_parser.ps1')
. (Join-Path $skillDir '_builds.ps1')

$issues = [System.Collections.Generic.List[string]]::new()
function Add-Issue([string]$File, [string]$Message) { $issues.Add("[ISSUE] $File — $Message") }

Write-Host "Loading zone reference data and parsing ZoneData.lua files..."
$mapRef = Get-MapReference -RootDir $RootDir
$zd = if ($Files) { Get-ZoneDataIndex -RootDir $RootDir -Files $Files } else { Get-ZoneDataIndex -RootDir $RootDir }
Write-Host "  $($zd.Entries.Count) Zone() entries, $($zd.IdToFiles.Count) distinct achievement ids"

Write-Host "`nCheck 1: duplicate achievement ids within a zone entry"
Write-Host "Check 2: map ids inactive or unknown to raw\MapVerifier.csv"
foreach ($e in $zd.Entries) {
    $mapStr = $e.MapIds -join ', '
    foreach ($mapId in $e.MapIds) {
        $primary = ConvertTo-PrimaryMap $mapRef $mapId
        if ($mapRef.Inactive.Contains($mapId)) { Add-Issue $e.File "line $($e.Line): map $mapId is inactive (verdict TaxiAndAdventure, Error or StartingZone) and should not be in ZoneData" }
        elseif (-not $mapRef.Names.ContainsKey($primary)) { Add-Issue $e.File "line $($e.Line): map $mapId (primary $primary) has no row in raw\MapVerifier.csv" }
    }
    # duplicates: written twice, or written directly and also brought in by a referenced table
    $seen = [System.Collections.Generic.HashSet[int]]::new()
    foreach ($id in $e.DirectList) {
        if (-not $seen.Add($id)) { Add-Issue $e.File "line $($e.Line): achievement $id is written twice in zone entry {$mapStr}" }
    }
    foreach ($id in $e.DirectIds) {
        if ($e.TableIds.Contains($id)) { Add-Issue $e.File "line $($e.Line): achievement $id is written directly and also comes from a referenced table in zone entry {$mapStr}" }
    }
}
Write-Host "  Done."

Write-Host "`nCheck 5: link groups listed whole (a sub-zone shares its zone's entry; never partial, never a sub-zone on its own)"
$groups = @{}   # primary -> [int[]] members, from the CSV
foreach ($kv in $mapRef.SubToPrimary.GetEnumerator()) {
    if (-not $groups.ContainsKey($kv.Value)) { $groups[$kv.Value] = [System.Collections.Generic.List[int]]::new(); $groups[$kv.Value].Add($kv.Value) }
    if (-not $groups[$kv.Value].Contains($kv.Key)) { $groups[$kv.Value].Add($kv.Key) }
}
$continentMaps = @($mapRef.Types.GetEnumerator() | Where-Object { $_.Value -eq 'Continent' } | ForEach-Object { $_.Key })
foreach ($e in $zd.Entries) {
    $listed = [System.Collections.Generic.HashSet[int]]::new([int[]]$e.MapIds)
    $prims = @($e.MapIds | ForEach-Object { ConvertTo-PrimaryMap $mapRef $_ } | Sort-Object -Unique)
    if ($prims.Count -gt 1) { Add-Issue $e.File "line $($e.Line): entry {$($e.MapIds -join ', ')} spans several link groups ($($prims -join ', ')); one entry per group" }
    foreach ($p in $prims) {
        if (-not $groups.ContainsKey($p)) { continue }
        $missing = @($groups[$p] | Where-Object { -not $listed.Contains($_) } | Sort-Object)
        if ($missing) { Add-Issue $e.File "line $($e.Line): entry {$($e.MapIds -join ', ')} lists part of link group $p $($mapRef.Names[$p]); missing $($missing -join ', ')" }
    }
    foreach ($m in $e.MapIds) { if ($m -in $continentMaps) { Add-Issue $e.File "line $($e.Line): map $m $($mapRef.Names[$m]) is a Continent; achievements link to zones and sub-zones only (Rule 1)" } }
}
Write-Host "  Done."

Write-Host "`nCheck 4: parser warnings"
foreach ($w in $zd.Warnings) { $issues.Add("[ISSUE] $w") }
if ($zd.Warnings.Count -eq 0) { Write-Host "  none" }

if (-not $SkipDbCheck) {
    Write-Host "`nCheck 3: achievement ids exist in wow.tools.local"
    try {
        if (-not $RetailBuild -or -not $ClassicBuild) {
            $b = Get-WowBuilds -BaseUrl $baseUrl
            if (-not $RetailBuild) { $RetailBuild = $b.Retail }
            if (-not $ClassicBuild) { $ClassicBuild = $b.Classic }
        }
        Write-Host "  builds: Retail $RetailBuild, Classic $ClassicBuild"
        function Get-ExistingIds([string]$build, [int[]]$ids) {
            $found = [System.Collections.Generic.HashSet[int]]::new()
            for ($o = 0; $o -lt $ids.Count; $o += 200) {
                $batch = $ids[$o..([Math]::Min($o + 199, $ids.Count - 1))]
                $pat = '^(' + ($batch -join '|') + ')$'
                $body = "draw=1&start=0&length=$($batch.Count + 10)&columns[3][search][value]=$pat&columns[3][search][regex]=true"
                $resp = Invoke-WebRequest "$baseUrl/dbc/data/achievement/?build=$build" -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
                foreach ($row in ($resp.Content | ConvertFrom-Json).data) { [void]$found.Add([int]$row[3]) }
                Write-Host "`r  $build`: $([Math]::Min($o + 200, $ids.Count)) / $($ids.Count)" -NoNewline
            }
            Write-Host ""
            return $found
        }
        $allIds = @($zd.IdToFiles.Keys + 6 | Sort-Object -Unique)   # 6 = control id
        $retail = Get-ExistingIds $RetailBuild $allIds
        $classic = Get-ExistingIds $ClassicBuild $allIds
        if (-not $retail.Contains(6) -or -not $classic.Contains(6)) { $issues.Add("[ISSUE] control id 6 did not resolve on both builds; DB results are void") }
        foreach ($id in ($zd.IdToFiles.Keys | Sort-Object)) {
            foreach ($file in $zd.IdToFiles[$id]) {
                $isRetailFile = $file -like 'DataAddons\Retail\*'
                $isClassicFile = $file -like 'DataAddons\Classic\*'
                $ok = if ($isRetailFile) { $retail.Contains($id) } elseif ($isClassicFile) { $classic.Contains($id) } else { $retail.Contains($id) -or $classic.Contains($id) }
                if (-not $ok) {
                    $where = if ($isRetailFile) { "Retail $RetailBuild" } elseif ($isClassicFile) { "Classic $ClassicBuild" } else { "Retail $RetailBuild or Classic $ClassicBuild" }
                    Add-Issue $file "achievement $id NOT FOUND on $where"
                }
            }
        }
        Write-Host "  Done."
    } catch {
        $issues.Add("[ISSUE] DB check failed: $_")
    }
} else {
    Write-Host "`nCheck 3: SKIPPED (-SkipDbCheck)"
}

Write-Host ""
Write-Host ("=" * 70)
if ($issues.Count -eq 0) { Write-Host "RESULT: No issues found. All checks passed." -ForegroundColor Green }
else { Write-Host "RESULT: $($issues.Count) issue(s) found:" -ForegroundColor Red; $issues | ForEach-Object { Write-Host $_ -ForegroundColor Yellow } }
Write-Host ("=" * 70)
exit ($issues.Count -gt 0 ? 1 : 0)
