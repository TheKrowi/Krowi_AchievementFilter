#Requires -Version 5.1
<#
.SYNOPSIS
    Verifies Krowi_AchievementFilter AchievementData.lua entries against wow.tools.local.
.DESCRIPTION
    Parses a Lua achievement data file, batch-queries all achievement IDs from the
    wow.tools.local DB, and runs up to 5 verification checks, reporting only failures.
.PARAMETER LuaFile
    Path to an AchievementData.lua file.
.PARAMETER Checks
    Which checks to run. Comma-separated. Default: all.
    Valid values: all, id-exists, faction, title-reward, reward-item, description-lang
.PARAMETER Build
    Build string override (e.g. "5.5.3.67509"). Auto-detected from file path if omitted.
.PARAMETER BaseUrl
    wow.tools.local base URL. Default: http://localhost:5000
.EXAMPLE
    .\Verify-AchievementData.ps1 "DataAddons\Classic\03_WrathOfTheLichKing\AchievementData.lua"
.EXAMPLE
    .\Verify-AchievementData.ps1 "DataAddons\Retail\11_TheWarWithin\AchievementData.lua" -Checks id-exists,faction
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory, Position = 0)]
    [string]$LuaFile,

    [string[]]$Checks = @("all"),

    [string]$Build = "",

    [string]$BaseUrl = "http://localhost:5000"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Add-Type -AssemblyName System.Web

# ── Normalize checks ──────────────────────────────────────────────────────────
$allCheckNames = @("id-exists", "faction", "title-reward", "reward-item", "description-lang")
if ($Checks -contains "all") { $runChecks = $allCheckNames } else { $runChecks = $Checks }

# ── Load file ─────────────────────────────────────────────────────────────────
$LuaFile = Resolve-Path $LuaFile | Select-Object -ExpandProperty Path
$lines   = Get-Content $LuaFile

# ── Helpers ───────────────────────────────────────────────────────────────────
function Invoke-AchievementQuery {
    param([int[]]$Ids, [string]$BuildStr)
    $pat  = "^(" + ($Ids -join "|") + ")$"
    $body = "draw=1&start=0&length=$($Ids.Count + 20)&columns[3][search][value]=$pat&columns[3][search][regex]=true"
    $resp = Invoke-RestMethod "$BaseUrl/dbc/data/achievement/?build=$BuildStr" `
                -Method POST -Body $body -ContentType "application/x-www-form-urlencoded"
    $map = @{}
    foreach ($row in $resp.data) {
        $map["$($row[3])"] = [PSCustomObject]@{
            Title      = [System.Web.HttpUtility]::HtmlDecode("$($row[1])")
            Reward     = [System.Web.HttpUtility]::HtmlDecode("$($row[2])")
            Faction    = "$($row[5])"    # "-1"=both, "0"=Horde, "1"=Alliance
            RewardItem = "$($row[13])"
        }
    }
    return $map
}

# Build the expected inline comment for a faction-split entry.
# Rules:
#   - Suffix >= 2 chars: apply merge formula (strip shared prefix+suffix).
#   - Suffix < 2 chars (incidental single-char match) or no suffix:
#     keep both full names as "Name1 / Name2".
# This avoids false splits like "Conqueror"/"Justicar" sharing trailing 'r'.
function Get-MergedFactionComment {
    param([string]$Primary, [string]$Secondary)
    if ($Primary -eq $Secondary) { return $Primary }

    # Longest common prefix
    $pLen = 0
    $min  = [Math]::Min($Primary.Length, $Secondary.Length)
    while ($pLen -lt $min -and $Primary[$pLen] -eq $Secondary[$pLen]) { $pLen++ }

    # Longest common suffix (no overlap with prefix)
    $sLen = 0
    $n1   = $Primary.Length; $n2 = $Secondary.Length
    while ($sLen -lt ($n1 - $pLen) -and $sLen -lt ($n2 - $pLen) -and
           $Primary[$n1 - 1 - $sLen] -eq $Secondary[$n2 - 1 - $sLen]) { $sLen++ }

    if ($sLen -ge 2) {
        # Trim the suffix leftward to the nearest non-alphanumeric boundary.
        # Without this, coincidental word endings (e.g. "Alliance"/"Horde" both ending in 'e',
        # or "Ghostlands"/"Wetlands" sharing "tlands") produce mid-word splits.
        $suffix = $Primary.Substring($n1 - $sLen)
        while ($suffix.Length -gt 0 -and [char]::IsLetterOrDigit($suffix[0])) {
            $suffix = $suffix.Substring(1)
            $sLen--
        }
        if ($sLen -ge 2) {
            # Meaningful shared suffix — apply the merge formula
            $prefix = $Primary.Substring(0, $pLen)
            $u1     = $Primary.Substring($pLen, $n1 - $pLen - $sLen)
            $u2     = $Secondary.Substring($pLen, $n2 - $pLen - $sLen)
            return "$prefix$u1 / $u2$suffix"
        }
        # After trimming nothing useful remains — fall through to prefix check
    }

    # No usable suffix — strip any common prefix (trimmed rightward to a word boundary).
    # E.g. "In Service of the Alliance" / "In Service of the Horde" → "In Service of the Alliance / Horde"
    if ($pLen -gt 0) {
        $prefix = $Primary.Substring(0, $pLen)
        while ($prefix.Length -gt 0 -and [char]::IsLetterOrDigit($prefix[$prefix.Length - 1])) {
            $prefix = $prefix.Substring(0, $prefix.Length - 1)
        }
        if ($prefix.Length -gt 0) {
            $u1 = $Primary.Substring($prefix.Length)
            $u2 = $Secondary.Substring($prefix.Length)
            return "$prefix$u1 / $u2"
        }
    }

    # No usable prefix or suffix: both full names
    return "$Primary / $Secondary"
}

# ── Ensure wow.tools.local is reachable ───────────────────────────────────────
$serverReachable = $false
try {
    $null = Invoke-WebRequest "$BaseUrl/casc/buildname" -UseBasicParsing -TimeoutSec 3
    $serverReachable = $true
} catch { }

if (-not $serverReachable) {
    Write-Host "wow.tools.local not reachable — starting it..."
    Start-Process "E:\World of Warcraft Addon Development\wow.tools.local\wow.tools.local.exe"
    Write-Host "Waiting for server to become ready..."
    $deadline = (Get-Date).AddSeconds(60)
    while ((Get-Date) -lt $deadline) {
        Start-Sleep -Seconds 3
        try {
            $null = Invoke-WebRequest "$BaseUrl/casc/buildname" -UseBasicParsing -TimeoutSec 2
            $serverReachable = $true
            break
        } catch { }
    }
    if (-not $serverReachable) { throw "wow.tools.local did not become reachable within 60 seconds." }
    Write-Host "Server is ready."
}

# ── Auto-detect build ─────────────────────────────────────────────────────────
if (-not $Build) {
    $availableBuilds = (Invoke-RestMethod "$BaseUrl/casc/builds" -Method POST `
        -Body "draw=1&start=0&length=50" `
        -ContentType "application/x-www-form-urlencoded").data |
        ForEach-Object { [PSCustomObject]@{ Build = "$($_[0]).$($_[1])"; Type = $_[2] } }

    $norm = $LuaFile.Replace('\', '/')

    # Priority order of build types to try per file path
    $candidates = if ($norm -match '/DataAddons/Retail/') {
        @("wow")
    } elseif ($norm -match '/DataAddons/Classic/') {
        @("wow_classic", "wow_classic_era")
    } elseif ($norm -match '/DataAddons/Shared/') {
        @("wow", "wow_classic", "wow_classic_era")
    } else {
        @("wow", "wow_classic", "wow_classic_era")
    }

    # Find the first ID in the file to probe with
    $probeId = $null
    foreach ($line in $lines) {
        if ($line -match 'Ach\((\d+)\)') { $probeId = $Matches[1]; break }
    }
    if (-not $probeId) { throw "No Ach() entries found in '$LuaFile'." }

    foreach ($type in $candidates) {
        $b = $availableBuilds | Where-Object { $_.Type -eq $type } | Select-Object -First 1
        if (-not $b) { continue }
        $testBody = "draw=1&start=0&length=1&columns[3][search][value]=^$probeId`$&columns[3][search][regex]=true"
        $testResp = Invoke-RestMethod "$BaseUrl/dbc/data/achievement/?build=$($b.Build)" `
                        -Method POST -Body $testBody -ContentType "application/x-www-form-urlencoded"
        if ($testResp.recordsFiltered -gt 0) {
            $Build = $b.Build
            break
        }
    }

    if (-not $Build) { throw "Could not auto-detect build for '$LuaFile'. Pass -Build explicitly." }
    Write-Host "Auto-detected build: $Build"
}

# ── Parse Lua entries ─────────────────────────────────────────────────────────
# Matches:  Ach(ID)[chain], -- comment
# The chain captures everything up to the optional "-- comment" at end of line.
# Commas in the chain are fine; "--" in chains would break this but doesn't occur in practice.
$entryPat    = '^\s*Ach\((\d+)\)((?:[^-\r\n]|-(?!-))*?)(?:--\s*(.+))?\s*$'
$factPat     = ':(?:Auto)?FactionSplit\(faction\.(Alliance|Horde),\s*(\d+)\)'
$factOnlyPat = ':(?:Auto)?FactionSplit\(faction\.(Alliance|Horde)(?:,\s*nil)?\)'

$entries = [System.Collections.Generic.List[PSCustomObject]]::new()

foreach ($line in $lines) {
    if ($line -notmatch $entryPat) { continue }

    $eId      = [int]$Matches[1]
    $eChain   = $Matches[2]
    $eComment = if ($Matches[3]) { $Matches[3].Trim() } else { "" }

    $fSide   = $null
    $splitId = $null
    if ($eChain -match $factPat) {
        $fSide   = $Matches[1]     # "Alliance" or "Horde" — faction of PRIMARY ID
        $splitId = [int]$Matches[2]
    } elseif ($eChain -match $factOnlyPat) {
        $fSide   = $Matches[1]     # Single-faction achievement (no paired ID)
    }

    $entries.Add([PSCustomObject]@{
        ID          = $eId
        Comment     = $eComment
        HasTitle    = [bool]($eChain -match ':Title\(\)')
        HasMount    = [bool]($eChain -match ':Mount\(\)')
        HasPet      = [bool]($eChain -match ':Pet\(\)')
        HasItem     = [bool]($eChain -match ':Item\(\)')
        HasToy      = [bool]($eChain -match ':Toy\(\)')
        HasTransmog   = [bool]($eChain -match ':Transmog\(\)')
        HasOther      = [bool]($eChain -match ':Other\(\)')
        HasTabard     = [bool]($eChain -match ':Tabard\(\)')
        HasGarrison   = [bool]($eChain -match ':Garrison\(\)')
        HasAlliedRace = [bool]($eChain -match ':AlliedRace\(\)')
        FactionSide = $fSide
        SplitID     = $splitId
    })
}

Write-Host "Parsed $($entries.Count) entries from $([System.IO.Path]::GetFileName($LuaFile))"

# ── Batch DB query ────────────────────────────────────────────────────────────
$primaryIds = [int[]]($entries | ForEach-Object { $_.ID })
$splitIds   = [int[]]($entries | Where-Object { $_.SplitID } | ForEach-Object { $_.SplitID })
$allIds     = ($primaryIds + $splitIds) | Select-Object -Unique | Sort-Object

$dbById = @{}
$chunk  = 150
for ($i = 0; $i -lt $allIds.Count; $i += $chunk) {
    $slice = [int[]]$allIds[$i .. [Math]::Min($i + $chunk - 1, $allIds.Count - 1)]
    (Invoke-AchievementQuery -Ids $slice -BuildStr $Build).GetEnumerator() |
        ForEach-Object { $dbById[$_.Key] = $_.Value }
}

Write-Host "Queried $($dbById.Count) / $($allIds.Count) IDs from DB"

# ── Verification ──────────────────────────────────────────────────────────────
$failures = [System.Collections.Generic.List[string]]::new()

foreach ($e in $entries) {
    $key = "$($e.ID)"
    $db  = $dbById[$key]

    # id-exists
    if ($runChecks -contains "id-exists") {
        if (-not $db) {
            $failures.Add("[FAIL] id-exists       : Ach($($e.ID)) — not found in DB (build $Build)")
            continue    # no point running other checks without DB data
        }
    }
    if (-not $db) { continue }

    # faction
    if ($runChecks -contains "faction") {
        $f           = $db.Faction
        $hasFactSplit = $null -ne $e.FactionSide

        if ($f -in @("0","1") -and -not $hasFactSplit) {
            $label = if ($f -eq "0") { "Horde" } else { "Alliance" }
            $failures.Add("[FAIL] faction         : Ach($($e.ID)) — DB Faction=$f ($label) but no :FactionSplit()")
        }
        if ($f -eq "-1" -and $hasFactSplit) {
            $failures.Add("[FAIL] faction         : Ach($($e.ID)) — DB Faction=-1 (both factions) but has :FactionSplit()")
        }
    }

    # title-reward
    # Accepted title formats in DB Reward_lang:
    #   "Title Reward: X"          — Cataclysm+ standard format
    #   "Title: X"                 — WotLK-era format (no "Reward" word)
    #   "Character Title: X"       — Retail MoP/modern format
    #   "Seasonal Character Title: X" — Retail seasonal PvP title format
    #   "Reward: Title & X"        — combined title+item reward (e.g. Loremaster's Colors)
    #   "Reward: X and Y Title"    — combined mount+title reward (ends with " Title")
    #   "Reward: X Title & Y"      — combined title+item reward (title in middle, e.g. Pilgrim Title & Plump Turkey Pet)
    if ($runChecks -contains "title-reward") {
        $r         = $db.Reward.Trim()
        $isTitle   = $r -match '^Title Reward:' -or $r -match '^Title:' -or $r -match '^Titles:' -or
                     $r -match '^Character Title:' -or $r -match '^Seasonal Character Title:' -or
                     $r -match '^Reward:\s*Title\b' -or $r -match '^Reward:.*\bTitle$' -or
                     $r -match '^Reward:.*\bTitle\s*&'
        if ($isTitle -and -not $e.HasTitle) {
            $failures.Add("[FAIL] title-reward    : Ach($($e.ID)) — DB Reward_lang=`"$r`" but no :Title()")
        }
        if ($e.HasTitle -and -not $isTitle) {
            $failures.Add("[FAIL] title-reward    : Ach($($e.ID)) — has :Title() but DB Reward_lang is not a title reward (`"$r`")")
        }
    }

    # reward-item
    # Use Reward_lang as the tangible-reward signal. Retail DB uses specific type prefixes
    # instead of the generic "Reward:" used in Classic builds. Recognised prefixes:
    #   "Reward: X"             — Classic-style generic reward
    #   "Item Reward: X"        — Specific item reward (Classic/Retail)
    #   "Mount: X"              — Mount reward (Retail)
    #   "Mount Reward: X"       — Vicious Saddle etc. (Retail)
    #   "Pet: X"                — Pet reward (Retail)
    #   "Toy: X"                — Toy reward (Retail)
    #   "Unlock: X"             — Feature/content unlock (Retail)
    #   "Character Unlock: X"   — Character-level unlock e.g. transmog sets (Retail)
    #   "Appearance: X"         — Appearance/transmog unlock (Retail); use :Transmog()
    #   "Follower: X"           — Garrison follower reward; use :Garrison()
    #   "Garrison Monument Reward: X" — Garrison monument; use :Garrison()
    # Title-style prefixes are excluded to avoid double-flagging "Reward: Title & X" entries.
    # RewardItemID alone is unreliable for Classic builds — it is non-zero for virtually all
    # achievements regardless of actual rewards.
    if ($runChecks -contains "reward-item") {
        $r          = $db.Reward.Trim()
        $isTitleStr = $r -match '^Title Reward:' -or $r -match '^Title:' -or $r -match '^Titles:' -or
                      $r -match '^Character Title:' -or $r -match '^Seasonal Character Title:' -or
                      $r -match '^Reward:\s*Title\b'
        $isReward   = (-not $isTitleStr) -and (
                       $r -match '^Reward:' -or $r -match '^Item Reward:' -or
                       $r -match '^Mount:' -or $r -match '^Mount Reward:' -or
                       $r -match '^Pet:' -or $r -match '^Toy:' -or
                       $r -match '^Unlock:' -or $r -match '^Character Unlock:' -or
                       $r -match '^Appearance:' -or $r -match '^Demon Hunter Appearance:' -or
                       $r -match '^Arsenal:' -or $r -match '^Cross-Game Reward:' -or
                       $r -match '^Follower:' -or $r -match '^Garrison Monument Reward:'
                      )
        $hasMethod = $e.HasMount -or $e.HasPet -or $e.HasItem -or $e.HasToy -or $e.HasTransmog -or $e.HasOther -or $e.HasTabard -or $e.HasGarrison -or $e.HasAlliedRace
        if ($isReward -and -not $hasMethod) {
            $failures.Add("[FAIL] reward-item     : Ach($($e.ID)) — DB Reward_lang=`"$r`" but no :Mount()/:Pet()/:Item()/:Toy()/:Transmog()/:Other()/:Tabard()")
        }
        if ($hasMethod -and -not $isReward) {
            $failures.Add("[FAIL] reward-item     : Ach($($e.ID)) — has reward method but DB Reward_lang=`"`$r`" is not a tangible reward")
        }
    }

    # description-lang
    if ($runChecks -contains "description-lang" -and $e.Comment -ne "") {
        if ($e.SplitID) {
            $splitDb = $dbById["$($e.SplitID)"]
            if ($db -and $splitDb) {
                $expected = Get-MergedFactionComment -Primary $db.Title -Secondary $splitDb.Title
                if ($e.Comment -ne $expected) {
                    $failures.Add("[FAIL] description-lang: Ach($($e.ID))+Ach($($e.SplitID)) — comment `"$($e.Comment)`" ≠ expected `"$expected`"")
                }
            }
        } else {
            if ($e.Comment -ne $db.Title) {
                $failures.Add("[FAIL] description-lang: Ach($($e.ID)) — comment `"$($e.Comment)`" ≠ DB Title_lang `"$($db.Title)`"")
            }
        }
    }
}

# ── Report ────────────────────────────────────────────────────────────────────
Write-Host ""
if ($failures.Count -eq 0) {
    Write-Host "All $($entries.Count) entries passed." -ForegroundColor Green
} else {
    $failures | ForEach-Object { Write-Host $_ -ForegroundColor Yellow }
    Write-Host ""
    Write-Host "$($failures.Count) failure(s) in $($entries.Count) entries checked." -ForegroundColor Yellow
}
