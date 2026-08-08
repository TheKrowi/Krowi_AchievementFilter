#Requires -Version 5.1
<#
.SYNOPSIS
    Validates multi-ID groups in all ZoneData.lua files against MapVerifier_LinkGroups.csv.

.DESCRIPTION
    For every zoneData:Method({id1, id2, ...}, ...) call across all ZoneData.lua files,
    checks whether the set of IDs exactly matches a group defined in MapVerifier_LinkGroups.csv.
    Reports any mismatches so they can be investigated after the CSV is updated.

.OUTPUTS
    Console summary with PASS / FAIL per file, and a final list of all invalid groups.
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot   # repo root, one level above raw/
$rawDir = Join-Path $root "raw"
$dataAddonsDir = Join-Path $root "DataAddons"

# ---------------------------------------------------------------------------
# 1. Load valid groups from MapVerifier_LinkGroups.csv
# ---------------------------------------------------------------------------
$linkGroupsPath = Join-Path $rawDir "MapVerifier_LinkGroups.csv"
$linkGroupsRaw = Import-Csv $linkGroupsPath

# Build a HashSet<string> where each entry is a canonical key: sorted, comma-separated IDs
# Also build a lookup: primaryId -> name + sorted ids for "closest match" hints
$validGroupKeys = [System.Collections.Generic.HashSet[string]]::new()
$groupByPrimary = @{}   # key = int primaryId, value = sorted int[]

foreach ($row in $linkGroupsRaw) {
    $ids = $row.ids -split "," | ForEach-Object { [int]$_.Trim() } | Sort-Object
    $key = $ids -join ","
    [void]$validGroupKeys.Add($key)
    $groupByPrimary[[int]$row.primaryId] = $ids
}

Write-Host "Loaded $($validGroupKeys.Count) valid groups from MapVerifier_LinkGroups.csv" -ForegroundColor Cyan

# ---------------------------------------------------------------------------
# 2. Find all ZoneData.lua files
# ---------------------------------------------------------------------------
$zoneDataFiles = Get-ChildItem -Path $dataAddonsDir -Recurse -Filter "*ZoneData*.lua"

Write-Host "Found $($zoneDataFiles.Count) ZoneData.lua files to scan" -ForegroundColor Cyan
Write-Host ""

# ---------------------------------------------------------------------------
# 3. Scan each file for multi-ID group calls
# ---------------------------------------------------------------------------
# Matches: anyMethod({  id1 , id2, ...  },
# Capture group 1 = everything inside the braces
$groupPattern = [regex]':\w+\(\{([^}]+)\},'

$allIssues = [System.Collections.Generic.List[PSCustomObject]]::new()
$filesWithIssues = 0

foreach ($file in $zoneDataFiles | Sort-Object FullName) {
    $relPath = $file.FullName.Substring($root.Length + 1)
    $lines = Get-Content $file.FullName
    $fileIssues = [System.Collections.Generic.List[PSCustomObject]]::new()

    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        $m = $groupPattern.Match($line)
        if (-not $m.Success) { continue }

        # Parse the IDs (may have trailing comments after --)
        $rawIds = $m.Groups[1].Value -split "," | ForEach-Object {
            $part = ($_ -replace '--.*$', '').Trim()
            if ($part -match '^\d+$') { [int]$part }
        } | Where-Object { $_ -ne $null }

        # Skip single-entry "groups" — those are just a table with one ID, not a real group
        if ($rawIds.Count -lt 2) { continue }

        $sorted = $rawIds | Sort-Object
        $key = $sorted -join ","

        if (-not $validGroupKeys.Contains($key)) {
            # Build a hint: look up the CSV group for the smallest ID in the set
            $hint = ""
            $firstId = $sorted[0]
            if ($groupByPrimary.ContainsKey($firstId)) {
                $csvGroup = $groupByPrimary[$firstId] -join ", "
                $hint = "CSV group for $firstId = {$csvGroup}"
            } else {
                # Check if any ID in the set is a primary in the CSV
                foreach ($id in $sorted) {
                    if ($groupByPrimary.ContainsKey($id)) {
                        $csvGroup = $groupByPrimary[$id] -join ", "
                        $hint = "CSV group for $id = {$csvGroup}"
                        break
                    }
                }
            }
            if ($hint -eq "") {
                $hint = "No matching primary ID found in CSV"
            }

            $issue = [PSCustomObject]@{
                File    = $relPath
                Line    = $i + 1
                Found   = "{$($sorted -join ', ')}"
                Hint    = $hint
                Comment = ($line -replace '^.*--\s*', '').Trim()
            }
            $fileIssues.Add($issue)
            $allIssues.Add($issue)
        }
    }

    if ($fileIssues.Count -gt 0) {
        $filesWithIssues++
        Write-Host "FAIL  $relPath  ($($fileIssues.Count) issue(s))" -ForegroundColor Red
        foreach ($issue in $fileIssues) {
            Write-Host "      L$($issue.Line): $($issue.Found)" -ForegroundColor Yellow
            Write-Host "        $($issue.Hint)" -ForegroundColor DarkYellow
            if ($issue.Comment -ne "") {
                Write-Host "        Comment: $($issue.Comment)" -ForegroundColor DarkGray
            }
        }
    } else {
        Write-Host "PASS  $relPath" -ForegroundColor Green
    }
}

# ---------------------------------------------------------------------------
# 4. Summary
# ---------------------------------------------------------------------------
Write-Host ""
Write-Host "===== SUMMARY =====" -ForegroundColor Cyan
Write-Host "Files scanned : $($zoneDataFiles.Count)"
Write-Host "Files with issues : $filesWithIssues"
Write-Host "Total invalid groups : $($allIssues.Count)"

if ($allIssues.Count -gt 0) {
    Write-Host ""
    Write-Host "All invalid groups:" -ForegroundColor Red
    $allIssues | Format-Table File, Line, Found, Hint -AutoSize -Wrap
    exit 1
} else {
    Write-Host ""
    Write-Host "All groups are valid." -ForegroundColor Green
    exit 0
}
