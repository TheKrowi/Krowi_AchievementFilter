# Apply a placement plan to the ZoneData.lua files: add or remove `N, -- Title` lines (or a table reference such as
# shared.OldWorldPetAchievements) inside existing Zone() blocks, located by link-group primary map id.
#
# Plan file: one instruction per line, `map,token,op`
#   map    a map id; the entry whose map list contains it (or its link-group primary) is edited
#   token  an achievement id, or a table reference text (shared.X, delvesS1, ...)
#   op     add | remove
#   lines starting with # are comments; blank lines are ignored
# Titles for added ids come from the cached DBC export (.claude\cache\dbc\<build>\achievement.csv, written by
# raw\Evaluate-ZoneCriteria.ps1). An add of an id already present in the block, or a remove of one that is not, is a
# no-op reported as such. Files keep CRLF and no final newline. -WhatIf prints the edits without writing.
#
# Usage:
#   & ".claude\skills\add-zone-data\_apply_zone_plan.ps1" -PlanFile "<path>\plan.csv" [-WhatIf]
param(
    [Parameter(Mandatory)] [string] $PlanFile,
    [switch] $WhatIf,
    [string] $RootDir = (Split-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) -Parent)
)
Set-StrictMode -Version 3
$ErrorActionPreference = "Stop"
. (Join-Path $PSScriptRoot '_zonedata_parser.ps1')

$mapRef = Get-MapReference -RootDir $RootDir
$zd = Get-ZoneDataIndex -RootDir $RootDir
$cache = Get-ChildItem (Join-Path $RootDir '.claude\cache\dbc') -Directory -ErrorAction SilentlyContinue | Sort-Object Name -Descending | Select-Object -First 1
if (-not $cache) { throw "No DBC export cache under .claude\cache\dbc; run raw\Evaluate-ZoneCriteria.ps1 once." }
$titles = @{}
foreach ($r in Import-Csv (Join-Path $cache.FullName 'achievement.csv')) { $titles[[int]$r.ID] = $r.Title_lang }
# ids some AchievementData file mentions (Ach(N) and faction-split mirrors alike); an id absent here is unregistered and a
# Zone() line for it is a data-load error (hidden tracking achievements, "(copy)" duplicates). Reported as a NOTE, not blocked.
$registered = [System.Collections.Generic.HashSet[int]]::new()
foreach ($f in Get-ChildItem (Join-Path $RootDir 'DataAddons') -Recurse -Filter 'AchievementData.lua') {
    foreach ($m in [regex]::Matches([IO.File]::ReadAllText($f.FullName), '\b(\d{1,6})\b')) { [void]$registered.Add([int]$m.Groups[1].Value) }
}

# plan -> per file, per entry
$plan = [System.Collections.Generic.List[object]]::new()
foreach ($line in Get-Content $PlanFile) {
    $t = $line.Trim()
    if ($t -eq '' -or $t.StartsWith('#')) { continue }
    $parts = $t -split ','
    if ($parts.Count -ne 3) { throw "Bad plan line: $line" }
    $plan.Add(@{ Map = [int]$parts[0].Trim(); Token = $parts[1].Trim(); Op = $parts[2].Trim().ToLowerInvariant() })
}
function Find-Entry([int] $Map) {
    $p = ConvertTo-PrimaryMap $mapRef $Map
    foreach ($e in $zd.Entries) {
        foreach ($m in $e.MapIds) { if ((ConvertTo-PrimaryMap $mapRef $m) -eq $p) { return $e } }
    }
    return $null
}
$byFile = @{}
$notes = [System.Collections.Generic.List[string]]::new()
foreach ($p in $plan) {
    $e = Find-Entry $p.Map
    if (-not $e) { $notes.Add("NO ENTRY for map $($p.Map) $($mapRef.Names[$p.Map]) — $($p.Op) $($p.Token) skipped"); continue }
    if (-not $byFile.ContainsKey($e.File)) { $byFile[$e.File] = @{} }
    $key = "$($e.Line)"
    if (-not $byFile[$e.File].ContainsKey($key)) { $byFile[$e.File][$key] = @{ Entry = $e; Ops = [System.Collections.Generic.List[object]]::new() } }
    $byFile[$e.File][$key].Ops.Add($p)
}

$added = 0; $removed = 0; $noop = 0
foreach ($file in ($byFile.Keys | Sort-Object)) {
    $path = Join-Path $RootDir $file
    $raw = [IO.File]::ReadAllText($path)
    $nl = if ($raw -match "`r`n") { "`r`n" } else { "`n" }
    $lines = [System.Collections.Generic.List[string]]::new([string[]]($raw -split "`r?`n"))
    # highest start line first so earlier insertions do not shift later entries
    foreach ($key in ($byFile[$file].Keys | Sort-Object { [int]$_ } -Descending)) {
        $item = $byFile[$file][$key]
        $start = [int]$key - 1
        $end = $start
        while ($end -lt $lines.Count -and $lines[$end] -notmatch '^\}\)\s*$') { $end++ }
        if ($end -ge $lines.Count) { $notes.Add("$file line $($key): closing '})' not found; entry skipped"); continue }
        $label = "$file line $key {$($item.Entry.MapIds -join ', ')}"
        foreach ($op in $item.Ops) {
            $isId = $op.Token -match '^\d+$'
            $pattern = if ($isId) { "^\s*$($op.Token),(\s|$)" } else { "^\s*$([regex]::Escape($op.Token)),(\s|$)" }
            $existing = -1
            for ($i = $start + 1; $i -lt $end; $i++) { if ($lines[$i] -match $pattern) { $existing = $i; break } }
            if ($op.Op -eq 'add') {
                if ($existing -ge 0) { $noop++; continue }
                $text = if ($isId) {
                    $title = $titles[[int]$op.Token]
                    if (-not $title) { $notes.Add("$label`: no title for $($op.Token) in the export; added without comment") }
                    if (-not $registered.Contains([int]$op.Token)) { $notes.Add("$label`: $($op.Token) '$title' is not registered in any AchievementData file (hidden or copy?); the data-load lint will flag it") }
                    if ($title) { "    $($op.Token), -- $title" } else { "    $($op.Token)," }
                } else { "    $($op.Token)," }
                $lines.Insert($end, $text); $end++; $added++
                Write-Host "  + $label`: $text"
            } elseif ($op.Op -eq 'remove') {
                if ($existing -lt 0) { $noop++; continue }
                Write-Host "  - $label`: $($lines[$existing].Trim())"
                $lines.RemoveAt($existing); $end--; $removed++
            } else { throw "Unknown op '$($op.Op)'" }
        }
    }
    if (-not $WhatIf) { [IO.File]::WriteAllText($path, ($lines -join $nl), [Text.UTF8Encoding]::new($false)) }
}
Write-Host ""
foreach ($n in $notes) { Write-Host "[NOTE] $n" -ForegroundColor Yellow }
Write-Host ("{0} added, {1} removed, {2} no-op{3}" -f $added, $removed, $noop, ($WhatIf ? ' (WhatIf, nothing written)' : ''))
