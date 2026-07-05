# Evaluate-ZoneDataDecisions.ps1
# Validates the ZoneDataDecisions.md golden log against all ZoneData.lua files.
#
# Rules:
#   "⏭ skipped"          — achievement ID must NOT appear in any ZoneData.lua
#   "✅ added"            — achievement ID MUST appear in at least one ZoneData.lua
#   "✅ already present"  — achievement ID MUST appear in at least one ZoneData.lua
#
# Exit code 0 = all checks pass; 1 = issues found.
#
# Usage:
#   .\Evaluate-ZoneDataDecisions.ps1
#   .\Evaluate-ZoneDataDecisions.ps1 -DecisionsFile "raw\ZoneDataDecisions.md"

param(
    [string] $DecisionsFile = "$PSScriptRoot\ZoneDataDecisions.md",
    [string] $RootDir       = (Split-Path $PSScriptRoot -Parent)
)

Set-StrictMode -Version 3
$ErrorActionPreference = "Stop"

$issueCount = 0
$issues     = [System.Collections.Generic.List[string]]::new()

function Add-Issue {
    param([string]$Message)
    $issues.Add("[ISSUE] $Message")
    $script:issueCount++
}

# ── Parse decisions log ──────────────────────────────────────────────────────
Write-Host "Parsing $DecisionsFile ..."

$lines = Get-Content -Path $DecisionsFile -Encoding UTF8

# Collect decisions: each entry is { Id, Title, Decision }
# Decision values we care about: "added", "already present", "skipped"
# Table rows look like: | 33 | Nothing Boring About Borean | ✅ already present | 114 | ... |

$decisions = [System.Collections.Generic.List[PSCustomObject]]::new()

foreach ($line in $lines) {
    # Skip header and separator rows
    if ($line -notmatch '^\s*\|\s*\d') { continue }

    $cols = $line -split '\|' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
    if ($cols.Count -lt 3) { continue }

    $rawId    = $cols[0].Trim()
    $rawTitle = $cols[1].Trim()
    $rawDecision = $cols[2].Trim()

    $id = 0
    if (-not [int]::TryParse($rawId, [ref]$id)) { continue }  # not a numeric ID row

    $decision = switch -Wildcard ($rawDecision) {
        "*skipped*"         { "skipped" }
        "*added*"           { "added" }
        "*already present*" { "present" }
        default             { $null }
    }

    if ($null -eq $decision) { continue }

    $decisions.Add([PSCustomObject]@{
        Id       = $id
        Title    = $rawTitle
        Decision = $decision
    })
}

$skipped = @($decisions | Where-Object { $_.Decision -eq 'skipped' })
$added   = @($decisions | Where-Object { $_.Decision -eq 'added' })
$present = @($decisions | Where-Object { $_.Decision -eq 'present' })

Write-Host "  Parsed $($decisions.Count) decisions: $($skipped.Count) skipped, $($added.Count) added, $($present.Count) already present"

# ── Load all ZoneData.lua files ──────────────────────────────────────────────
Write-Host "Loading ZoneData.lua files..."

$allZoneFiles = Get-ChildItem -Path "$RootDir\DataAddons" -Filter 'ZoneData.lua' -Recurse

# Build a combined index: achievementId -> list of files that contain it
# Search for bare integers that appear as achievement IDs.
# Pattern: the integer is preceded and followed by a non-digit (word boundary equivalent).
$idToFiles = @{}   # int -> [string[]]

foreach ($file in $allZoneFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8

    # Extract achievement IDs: indented integers on their own line followed by a comma.
    # This pattern matches "    33, -- comment" but NOT "zoneData:Zone(12, {".
    # It covers both direct achievement IDs and local-variable entries.
    $matches = [regex]::Matches($content, '(?m)^\s+([1-9][0-9]*)\s*,')
    foreach ($m in $matches) {
        $num = [int]$m.Groups[1].Value
        if (-not $idToFiles.ContainsKey($num)) { $idToFiles[$num] = [System.Collections.Generic.List[string]]::new() }
        $rel = $file.FullName.Replace($RootDir + '\', '')
        if ($rel -notin $idToFiles[$num]) { $idToFiles[$num].Add($rel) }
    }
}

Write-Host "  Indexed $($idToFiles.Count) unique integers across $($allZoneFiles.Count) files."

# ── Check skipped: must NOT appear in any ZoneData.lua ──────────────────────
Write-Host "`nCheck 1: Skipped achievements must not appear in any ZoneData.lua"

$skipViolations = 0
foreach ($entry in $skipped) {
    if ($idToFiles.ContainsKey($entry.Id)) {
        $files = $idToFiles[$entry.Id] -join ', '
        Add-Issue "Achievement $($entry.Id) ('$($entry.Title)') is logged as SKIPPED but appears in: $files"
        $skipViolations++
    }
}
if ($skipViolations -eq 0) { Write-Host "  OK — no violations." }

# ── Check added/present: MUST appear in at least one ZoneData.lua ───────────
Write-Host "Check 2: Added/present achievements must appear in at least one ZoneData.lua"

$missingViolations = 0
foreach ($entry in ($added + $present)) {
    if (-not $idToFiles.ContainsKey($entry.Id)) {
        $verb = if ($entry.Decision -eq 'added') { 'ADDED' } else { 'ALREADY PRESENT' }
        Add-Issue "Achievement $($entry.Id) ('$($entry.Title)') is logged as $verb but not found in any ZoneData.lua"
        $missingViolations++
    }
}
if ($missingViolations -eq 0) { Write-Host "  OK — no violations." }

# ── Summary ──────────────────────────────────────────────────────────────────
Write-Host "`n─────────────────────────────────────────────────────────────"
if ($issueCount -eq 0) {
    Write-Host "PASS — All $($decisions.Count) decision log entries are consistent with ZoneData.lua files." -ForegroundColor Green
    exit 0
} else {
    Write-Host "FAIL — $issueCount issue(s) found:" -ForegroundColor Red
    foreach ($issue in $issues) { Write-Host "  $issue" -ForegroundColor Yellow }
    exit 1
}
