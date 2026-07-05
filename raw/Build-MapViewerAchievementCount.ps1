# Build-MapViewerAchievementCount.ps1
# Generates MapViewerExportAchievementCount.csv — primary map ID, name, and
# the number of achievements registered for it (or its linked group) in the
# Retail ZoneData files (Shared + Retail, Classic excluded).
#
# Counting notes:
#   - Counts achievement IDs that appear directly in Zone(...) calls.
#   - Resolves file-local Lua variable references (e.g. local delves = {...}).
#   - Cross-file references (e.g. shared.OldWorldPetAchievements) are NOT
#     resolved and their achievements will NOT be counted.
#   - When a Zone call covers multiple map IDs that all belong to the same
#     primary group, those achievements are counted once (not once per ID).

param(
    [string]$RootDir   = (Split-Path $PSScriptRoot -Parent),
    [string]$OutputFile = "$PSScriptRoot\MapViewerExportAchievementCount.csv"
)

Set-StrictMode -Version 3

#region ─── Helper: extract balanced-block content ─────────────────────────────
# Finds the content between the opening character at $openPos and its
# matching close, stripping Lua line comments along the way.
# Returns a hashtable: { Content = [string]; EndPos = [int] }
function Get-BalancedBlock {
    param(
        [string] $Text,
        [int]    $OpenPos,
        [char]   $Open,
        [char]   $Close
    )

    $depth         = 0
    $inLineComment = $false
    $sb            = [System.Text.StringBuilder]::new()
    $i             = $OpenPos

    while ($i -lt $Text.Length) {
        $c = $Text[$i]

        if ($inLineComment) {
            if ($c -eq "`n") { $inLineComment = $false }
            $i++
            continue
        }

        # Lua line comment: --
        if ($c -eq '-' -and ($i + 1 -lt $Text.Length) -and $Text[$i + 1] -eq '-') {
            $inLineComment = $true
            $i += 2
            continue
        }

        if ($c -eq $Open) {
            $depth++
            if ($depth -eq 1) {
                # Outer open — skip, don't include in content
                $i++
                continue
            }
        }
        elseif ($c -eq $Close) {
            $depth--
            if ($depth -eq 0) {
                return @{ Content = $sb.ToString(); EndPos = $i }
            }
        }

        if ($depth -gt 0) { [void]$sb.Append($c) }
        $i++
    }

    return @{ Content = $sb.ToString(); EndPos = $i }
}
#endregion

#region ─── Step 1: primary map IDs ────────────────────────────────────────────
Write-Host "Reading active map IDs..."

$activePath = "$PSScriptRoot\MapViewerExportActive.csv"
$active     = Import-Csv -Path $activePath

# Primary = row whose 'link' column is empty
$primaries = $active |
    Where-Object { -not $_.link -or $_.link.Trim() -eq '' } |
    Sort-Object { [int]$_.id }

Write-Host "  Primary map IDs: $($primaries.Count)"
#endregion

#region ─── Step 2: linked groups ──────────────────────────────────────────────
Write-Host "Reading link groups..."

$linkGroupsPath = "$PSScriptRoot\MapViewerExportLinkGroups.csv"
$linkGroups     = Import-Csv -Path $linkGroupsPath

# primaryId -> array of all map IDs in the group
$groupsByPrimary = @{}
foreach ($row in $linkGroups) {
    $primId  = [int]($row.primaryId.Trim())
    $ids  = ($row.ids -split '[,\s]+') |
            Where-Object { $_ -match '^\d+$' } |
            ForEach-Object { [int]$_ }
    $groupsByPrimary[$primId] = $ids
}

# Primaries not in LinkGroups are single-member groups
foreach ($p in $primaries) {
    $primId = [int]$p.id
    if (-not $groupsByPrimary.ContainsKey($primId)) {
        $groupsByPrimary[$primId] = @($primId)
    }
}

# Reverse lookup: any map ID -> its primary ID
$idToPrimary = @{}
foreach ($primId in $groupsByPrimary.Keys) {
    foreach ($gid in $groupsByPrimary[$primId]) {
        $idToPrimary[$gid] = $primId
    }
}

Write-Host "  Groups: $($groupsByPrimary.Count)  |  Tracked map IDs: $($idToPrimary.Count)"
#endregion

#region ─── Step 3: parse Retail ZoneData Lua files ────────────────────────────
Write-Host "Parsing ZoneData Lua files (Shared + Retail, skip Classic)..."

$zoneDataFiles = Get-ChildItem -Path "$RootDir\DataAddons" `
                               -Filter 'ZoneData.lua' -Recurse |
    Where-Object { $_.FullName -notlike "*\Classic\*" }

Write-Host "  Files found: $($zoneDataFiles.Count)"

# primaryId -> achievement count
$primaryAchCount = @{}

foreach ($file in $zoneDataFiles) {
    $raw = Get-Content -Path $file.FullName -Raw

    # ── Phase A: resolve file-local variable counts ────────────────────────
    # Detect  local varName = { ... }  and count the integer IDs inside,
    # recursively resolving references to other locals in the same file.

    $localInts = @{}   # varName -> [int[]]  (direct integers in the block)
    $localRefs = @{}   # varName -> [string[]] (names of other local vars referenced)

    $varDeclRgx = [regex]'(?m)local\s+(\w+)\s*=\s*\{'
    foreach ($vm in $varDeclRgx.Matches($raw)) {
        $varName   = $vm.Groups[1].Value
        # Skip module/namespace locals that aren't pure integer lists
        if ($varName -in @('addon','shared','sharedVanilla','sharedTBC','sharedWotLK',
                           'sharedCata','sharedMoP','zoneData')) { continue }

        $blockStart = $vm.Index + $vm.Length - 1   # position of '{'
        $result     = Get-BalancedBlock -Text $raw -OpenPos $blockStart -Open '{' -Close '}'
        $block      = $result.Content

        # Tokenize the block at top-level commas (respecting nested braces)
        $ints  = [System.Collections.Generic.List[int]]::new()
        $refs  = [System.Collections.Generic.List[string]]::new()
        $depth = 0
        $buf   = [System.Text.StringBuilder]::new()

        foreach ($ch in ($block -replace '--[^\n]*', '').ToCharArray()) {
            if ($ch -eq '{') { $depth++;  [void]$buf.Append($ch); continue }
            if ($ch -eq '}') { $depth--;  [void]$buf.Append($ch); continue }
            if ($depth -gt 0) { [void]$buf.Append($ch); continue }

            if ($ch -eq ',') {
                $tok = $buf.ToString().Trim()
                if ($tok -match '^\d+$')                    { $ints.Add([int]$tok) }
                elseif ($tok -match '^[a-zA-Z_]\w*$')      { $refs.Add($tok) }
                # cross-file refs (contain '.') are intentionally skipped
                [void]$buf.Clear()
            }
            else { [void]$buf.Append($ch) }
        }
        $tok = $buf.ToString().Trim()
        if ($tok -match '^\d+$')               { $ints.Add([int]$tok) }
        elseif ($tok -match '^[a-zA-Z_]\w*$') { $refs.Add($tok) }

        $localInts[$varName] = $ints
        $localRefs[$varName] = $refs
    }

    # Iteratively resolve counts (handles chains like delvesS1 -> delves + delvesS1Progress)
    $varCounts = @{}
    foreach ($vn in $localInts.Keys) { $varCounts[$vn] = $localInts[$vn].Count }

    for ($pass = 0; $pass -lt 10; $pass++) {
        $changed = $false
        foreach ($vn in $localInts.Keys) {
            $count = $localInts[$vn].Count
            foreach ($ref in $localRefs[$vn]) {
                if ($varCounts.ContainsKey($ref)) { $count += $varCounts[$ref] }
            }
            if ($varCounts[$vn] -ne $count) { $varCounts[$vn] = $count; $changed = $true }
        }
        if (-not $changed) { break }
    }

    # ── Phase B: parse Zone( ... ) calls ──────────────────────────────────
    $zoneRgx = [regex]':Zone\('
    foreach ($zm in $zoneRgx.Matches($raw)) {
        # The '(' starts at zm.Index + zm.Length - 1
        $parenPos  = $zm.Index + $zm.Length - 1
        $callBlock = Get-BalancedBlock -Text $raw -OpenPos $parenPos -Open '(' -Close ')'
        $body      = $callBlock.Content.Trim()

        if (-not $body) { continue }

        # --- extract map IDs (first argument) ---
        $mapIds    = @()
        $restStart = 0

        if ($body[0] -eq '{') {
            $br = Get-BalancedBlock -Text $body -OpenPos 0 -Open '{' -Close '}'
            $mapIds    = ($br.Content -split '[,\s]+') |
                         Where-Object { $_ -match '^\d+$' } |
                         ForEach-Object { [int]$_ }
            $restStart = $br.EndPos + 1
        }
        elseif ($body -match '^(\d+)') {
            $mapIds    = @([int]$Matches[1])
            $restStart = $Matches[0].Length
        }

        if (-not $mapIds) { continue }

        # --- count achievements in remaining arguments ---
        $achPart  = if ($restStart -lt $body.Length) { $body.Substring($restStart) } else { '' }
        $achClean = $achPart -replace '--[^\n]*', ''

        # Direct integers
        $directCount = ([regex]'\b(\d+)\b').Matches($achClean).Count

        # File-local variable references
        $refCount = 0
        foreach ($im in ([regex]'\b([a-zA-Z_]\w*)\b').Matches($achClean)) {
            $tok = $im.Groups[1].Value
            if ($varCounts.ContainsKey($tok)) { $refCount += $varCounts[$tok] }
        }

        $achCount = $directCount + $refCount

        # --- attribute to the correct primary ID(s) ---
        # Collect distinct primaries for the Zone call's map IDs
        $affectedPrimaries = $mapIds |
            ForEach-Object { if ($idToPrimary.ContainsKey($_)) { $idToPrimary[$_] } } |
            Where-Object   { $null -ne $_ } |
            Sort-Object -Unique

        foreach ($primId in $affectedPrimaries) {
            if (-not $primaryAchCount.ContainsKey($primId)) { $primaryAchCount[$primId] = 0 }
            $primaryAchCount[$primId] += $achCount
        }
    }
}

$withAch = ($primaryAchCount.Keys | Where-Object { $primaryAchCount[$_] -gt 0 }).Count
Write-Host "  Primaries with at least 1 achievement: $withAch"
#endregion

#region ─── Step 4: write output ────────────────────────────────────────────────
Write-Host "Writing output..."

$rows = $primaries | ForEach-Object {
    $primId   = [int]$_.id
    $count = if ($primaryAchCount.ContainsKey($primId)) { $primaryAchCount[$primId] } else { 0 }
    [PSCustomObject]@{
        primaryId        = $primId
        primaryName      = $_.name
        achievementCount = $count
    }
}

$rows | Export-Csv -Path $OutputFile -NoTypeInformation -Encoding UTF8
Write-Host "Done. $($rows.Count) rows written to: $OutputFile"
#endregion


