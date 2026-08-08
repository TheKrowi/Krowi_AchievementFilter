# Cleanup-ZoneData.ps1
# Removes map IDs found in MapVerifier_InactiveZones.csv from all ZoneData.lua files.
# - If removing inactive IDs from an entry leaves at least one valid map ID, the entry is updated.
# - If removing inactive IDs leaves NO valid map IDs, the entire zoneData:Zone(...) call is deleted.
# - Single-element map ID tables are collapsed:  {895}  ->  895
#
# Run from the raw/ directory.  Applies changes in-place; no backup by default.
# Use -WhatIf to preview without writing.

param(
    [string] $RootDir  = (Split-Path $PSScriptRoot -Parent),
    [switch] $WhatIf
)

Set-StrictMode -Version 3
$ErrorActionPreference = "Stop"

#region ─── Load inactive zones ─────────────────────────────────────────────────
$inactivePath = "$PSScriptRoot\MapVerifier_InactiveZones.csv"
$inactiveRows = Import-Csv $inactivePath
$inactiveIds  = [System.Collections.Generic.HashSet[int]]::new()

foreach ($row in $inactiveRows) {
    $id = 0
    if ([int]::TryParse($row.id.Trim(), [ref]$id)) {
        [void]$inactiveIds.Add($id)
    }
}
Write-Host "Inactive map IDs loaded: $($inactiveIds.Count)"
#endregion

#region ─── Helper: extract balanced-block ──────────────────────────────────────
function Get-BalancedBlock {
    param([string]$Text, [int]$OpenPos, [char]$Open, [char]$Close)
    $depth = 0; $inCmt = $false
    $sb = [System.Text.StringBuilder]::new()
    $i  = $OpenPos
    while ($i -lt $Text.Length) {
        $c = $Text[$i]
        if ($inCmt) { if ($c -eq "`n") { $inCmt = $false }; $i++; continue }
        if ($c -eq '-' -and ($i+1 -lt $Text.Length) -and $Text[$i+1] -eq '-') { $inCmt = $true; $i += 2; continue }
        if ($c -eq $Open)  { $depth++; if ($depth -eq 1) { $i++; continue } }
        if ($c -eq $Close) { $depth--; if ($depth -eq 0) { return @{Content=$sb.ToString(); StartPos=$OpenPos; EndPos=$i} } }
        if ($depth -gt 0)  { [void]$sb.Append($c) }
        $i++
    }
    return $null
}
#endregion

#region ─── Process files ────────────────────────────────────────────────────────
$zoneFiles = Get-ChildItem "$RootDir\DataAddons" -Filter "ZoneData.lua" -Recurse |
             Where-Object { $_.FullName -notlike "*\Classic\*" }

$totalChanged = 0

foreach ($file in $zoneFiles) {
    $text     = [System.IO.File]::ReadAllText($file.FullName)
    $original = $text

    # Work backwards through the file so positions remain valid after each deletion.
    # Collect edit regions first, then apply in reverse order.

    $edits = [System.Collections.Generic.List[object]]::new()

    $zoneCallRgx = [regex]'zoneData:Zone\s*\('
    foreach ($zm in ($zoneCallRgx.Matches($text) | Sort-Object Index -Descending)) {
        $argStart = $zm.Index + $zm.Length   # character just after '('

        # Find position of the opening '(' — need to scan forward to parse args
        # The Zone call is:  zoneData:Zone(  <mapArg>  ,  <achArg>  )
        # We need the outer '()' balanced block.
        $outerOpenPos = $zm.Index + $zm.Value.Length - 1   # the '(' of Zone(
        # Actually zm.Value ends before the '(', let's find the '(' position:
        $parenPos = $text.IndexOf('(', $zm.Index + $zm.Length - 1)

        # Parse the outer call args by tracking depth
        $depth = 1; $inCmt = $false; $i = $parenPos + 1
        $callContent = [System.Text.StringBuilder]::new()
        $callEndPos  = $parenPos
        while ($i -lt $text.Length -and $depth -gt 0) {
            $c = $text[$i]
            if ($inCmt) { if ($c -eq "`n") { $inCmt = $false }; $i++; continue }
            if ($c -eq '-' -and ($i+1 -lt $text.Length) -and $text[$i+1] -eq '-') { $inCmt = $true; $i += 2; continue }
            if ($c -eq '(') { $depth++ }
            if ($c -eq ')') { $depth--; if ($depth -eq 0) { $callEndPos = $i; break } }
            if ($c -eq '{') { $depth++ }
            if ($c -eq '}') { $depth-- }
            [void]$callContent.Append($c)
            $i++
        }

        $body = $callContent.ToString().Trim()

        # Split body into top-level args (split at commas outside braces)
        $args  = [System.Collections.Generic.List[string]]::new()
        $adepth = 0; $abuf = [System.Text.StringBuilder]::new(); $ainCmt = $false
        foreach ($ch in ($body -replace '--[^\n]*','').ToCharArray()) {
            if ($ch -eq '{') { $adepth++; [void]$abuf.Append($ch) }
            elseif ($ch -eq '}') { $adepth--; [void]$abuf.Append($ch) }
            elseif ($ch -eq ',' -and $adepth -eq 0) { $args.Add($abuf.ToString().Trim()); [void]$abuf.Clear() }
            else { [void]$abuf.Append($ch) }
        }
        if ($abuf.Length -gt 0) { $args.Add($abuf.ToString().Trim()) }

        if ($args.Count -lt 2) { continue }

        # Parse map IDs from arg[0]
        $mapArg = $args[0].Trim()
        $originalMapArg = $mapArg
        $mapIds = [System.Collections.Generic.List[int]]::new()
        if ($mapArg -match '^\{') {
            $mapArg -replace '[{}]','' -split ',' | ForEach-Object {
                $m = $_.Trim(); if ($m -match '^\d+$') { $mapIds.Add([int]$m) }
            }
        } elseif ($mapArg -match '^\d+$') {
            $mapIds.Add([int]$mapArg)
        } else { continue }

        # Filter: keep only non-inactive IDs
        $activeIds = @($mapIds | Where-Object { -not $inactiveIds.Contains($_) })

        if ($mapIds.Count -eq $activeIds.Count) { continue }   # no change needed

        # Determine the full extent of the Zone call in the source (including trailing newline)
        # Region to replace: from start of 'zoneData:Zone' to end of ')' + optional trailing newline
        $regionStart = $zm.Index
        $regionEnd   = $callEndPos  # index of the closing ')'

        # Include trailing newline if present
        if ($regionEnd + 1 -lt $text.Length -and $text[$regionEnd + 1] -eq "`n") {
            $regionEnd++
        } elseif ($regionEnd + 2 -lt $text.Length -and $text[$regionEnd + 1] -eq "`r" -and $text[$regionEnd + 2] -eq "`n") {
            $regionEnd += 2
        }

        if ($activeIds.Count -eq 0) {
            # Remove entire Zone entry
            $edits.Add([PSCustomObject]@{
                Start  = $regionStart
                End    = $regionEnd
                Replacement = ""
                Action = "REMOVE"
                Comment = "all map IDs inactive: $($mapIds -join ', ')"
            })
        } else {
            # Rebuild map arg with only active IDs
            $newMapArg = if ($activeIds.Count -eq 1) {
                [string]$activeIds[0]
            } else {
                "{" + ($activeIds -join ", ") + "}"
            }

            # Find the exact byte range of the map arg IN THE ORIGINAL TEXT using position tracking.
            # This handles multi-line blocks and inline comments (e.g. '{ -- Torghast\n  1615...').
            $mapArgStart = $parenPos + 1
            while ($mapArgStart -lt $text.Length -and [char]::IsWhiteSpace($text[$mapArgStart])) { $mapArgStart++ }

            if ($text[$mapArgStart] -eq '{') {
                # Balanced block — find its matching '}'
                $bd = 0; $binCmt = $false; $bj = $mapArgStart
                while ($bj -lt $text.Length) {
                    $bc = $text[$bj]
                    if ($binCmt) { if ($bc -eq "`n") { $binCmt = $false }; $bj++; continue }
                    if ($bc -eq '-' -and ($bj+1 -lt $text.Length) -and $text[$bj+1] -eq '-') { $binCmt = $true; $bj += 2; continue }
                    if ($bc -eq '{') { $bd++ }
                    if ($bc -eq '}') { $bd--; if ($bd -eq 0) { break } }
                    $bj++
                }
                $mapArgEnd = $bj  # position of the closing '}'
            } else {
                # Bare integer — find where digits end
                $bj = $mapArgStart
                while ($bj -lt $text.Length -and [char]::IsDigit($text[$bj])) { $bj++ }
                $mapArgEnd = $bj - 1
            }

            $edits.Add([PSCustomObject]@{
                Start       = $mapArgStart
                End         = $mapArgEnd
                Replacement = $newMapArg
                Action      = "UPDATE"
                Comment     = "removed inactive IDs: $(($mapIds | Where-Object { $inactiveIds.Contains($_) }) -join ', ')"
            })
        }
    }

    if ($edits.Count -eq 0) { continue }

    # Apply edits in reverse order (highest Start first) so positions stay valid
    $edits = $edits | Sort-Object Start -Descending
    $sb = [System.Text.StringBuilder]($text)

    foreach ($edit in $edits) {
        $len = $edit.End - $edit.Start + 1
        $sb.Remove($edit.Start, $len) | Out-Null
        if ($edit.Replacement -ne "") {
            $sb.Insert($edit.Start, $edit.Replacement) | Out-Null
        }
        $rel = $file.FullName.Replace($RootDir + "\", "")
        Write-Host "  [$($edit.Action)] $rel — $($edit.Comment)"
    }

    $newText = $sb.ToString()

    # Clean up double blank lines left by removals
    $newText = [regex]::Replace($newText, "(\r?\n){3,}", "`r`n`r`n")

    if (-not $WhatIf) {
        [System.IO.File]::WriteAllText($file.FullName, $newText, [System.Text.Encoding]::UTF8)
    } else {
        Write-Host "  [WHATIF] Would write $($file.FullName)"
    }

    $totalChanged++
}

Write-Host ""
Write-Host "Done. Files modified: $totalChanged"
