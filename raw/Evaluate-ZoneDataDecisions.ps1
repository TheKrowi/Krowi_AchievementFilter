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

# ── Check 3: DB title verification ───────────────────────────────────────────
# Queries wow.tools.local for every ID in the main log and verifies the title
# in the decisions log matches the game DB exactly (after HTML-entity decode).
# IDs not found in this build (e.g. Classic-only IDs) are silently skipped.
# If the DB server is unreachable the check fails hard — it is not optional.
Write-Host "Check 3: Verifying titles in main log match the game DB"

$idsToVerify = @($decisions | Select-Object -ExpandProperty Id | Sort-Object -Unique)
$build = "12.0.7.68275"
$pat   = "^(" + ($idsToVerify -join "|") + ")$"
$body  = "draw=1&start=0&length=$($idsToVerify.Count + 10)&columns[3][search][value]=$pat&columns[3][search][regex]=true"

function Decode-Html([string]$s) {
    $s -replace '&#39;', "'" -replace '&amp;', '&' -replace '&quot;', '"' -replace '&lt;', '<' -replace '&gt;', '>'
}

try {
    $resp = Invoke-WebRequest "http://localhost:5000/dbc/data/achievement/?build=$build" `
        -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
} catch {
    Add-Issue "DB unreachable at http://localhost:5000 — title check requires the local DB server running. Error: $_"
    $resp = $null
}

if ($null -ne $resp) {
    $rows = ($resp.Content | ConvertFrom-Json).data
    $dbTitles = @{}
    foreach ($row in $rows) { $dbTitles[$row[3]] = $row[1] }  # col3=ID, col1=Title_lang

    $titleViolations = 0
    foreach ($entry in $decisions) {
        $sid = "$($entry.Id)"
        if (-not $dbTitles.ContainsKey($sid)) { continue }  # not in this DB build (Classic-only etc.) — skip

        $dbTitle  = (Decode-Html $dbTitles[$sid]).Trim()
        $logTitle = $entry.Title.Trim()

        if ($dbTitle -cne $logTitle) {
            Add-Issue "Achievement $($entry.Id) title mismatch — log: '$logTitle' | DB says: '$dbTitle'"
            $titleViolations++
        }
    }

    $checkedCount = ($decisions | Where-Object { $dbTitles.ContainsKey("$($_.Id)") }).Count
    if ($titleViolations -eq 0) {
        Write-Host "  OK — $checkedCount/$($idsToVerify.Count) titles verified against DB (build $build); $($idsToVerify.Count - $checkedCount) not in this build (skipped)."
    }
}

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
