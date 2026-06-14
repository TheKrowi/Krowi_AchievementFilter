<#
.SYNOPSIS
    Evaluator for the "find new achievements" workflow.
    Exits 0 (pass) when the agent's working ID set exactly matches
    the authoritative output of Find-NewAchievements.ps1.
    Exits 1 (fail) with a diff report when they diverge.

.DESCRIPTION
    Failure modes caught:
      - Missed achievements (present in Find-NewAchievements output, not in agent set)
      - Hallucinated/[DNT]/hidden achievements (in agent set, filtered out by script)
      - Wrong assumption about which IDs are "new" (e.g. threshold-based approach)
      - wow.tools.local started redundantly (checked separately)

.PARAMETER BuildNew
    The newer build string (e.g. "12.0.7.67808").

.PARAMETER BuildOld
    The older build string (e.g. "12.0.5.67823").

.PARAMETER AgentIds
    Comma-separated list of achievement IDs the agent claims are new and valid
    (i.e. the IDs the agent intends to add to AchievementData.lua).
    Example: "62607,62608,62609,62887,62901"

.PARAMETER LuaFile
    Optional: path to the AchievementData.lua being updated. If supplied the
    evaluator also checks that none of the new IDs are already present in the
    file (duplicate guard).

.PARAMETER BaseUrl
    wow.tools.local base URL. Defaults to http://localhost:5000.

.EXAMPLE
    # Agent claims these IDs are new valid achievements for 12.0.7:
    & ".github\skills\add-achievement-data\Evaluate-FindNewAchievements.ps1" `
        -BuildNew "12.0.7.67808" `
        -BuildOld "12.0.5.67823" `
        -AgentIds "62607,62608,62609,62887,62901" `
        -LuaFile "DataAddons\Retail\12_Midnight\AchievementData.lua"
#>

param(
    [Parameter(Mandatory)][string]$BuildNew,
    [Parameter(Mandatory)][string]$BuildOld,
    [Parameter(Mandatory)][string]$AgentIds,
    [string]$LuaFile,
    [string]$BaseUrl = "http://localhost:5000"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# ── helpers ──────────────────────────────────────────────────────────────────

function Invoke-WtlCheck {
    try {
        $r = Invoke-WebRequest "$BaseUrl" -UseBasicParsing -TimeoutSec 5 -ErrorAction Stop
        return $r.StatusCode -eq 200
    } catch { return $false }
}

$PASS = 0
$FAIL = 1
$errors = [System.Collections.Generic.List[string]]::new()

function Add-Error([string]$msg) { $errors.Add("  FAIL: $msg") }

# ── step 0: wow.tools.local reachable ────────────────────────────────────────

Write-Host "=== Evaluate-FindNewAchievements ==="
Write-Host ""
Write-Host "[0] Checking wow.tools.local is reachable at $BaseUrl ..."
if (-not (Invoke-WtlCheck)) {
    Write-Host "    FAIL: wow.tools.local not reachable. Start it first."
    exit $FAIL
}
Write-Host "    OK"

# ── step 1: compute authoritative set (same logic as Find-NewAchievements.ps1) ─

Write-Host ""
Write-Host "[1] Computing authoritative new+valid IDs ..."

function Get-AllAchIds { param([string]$Build)
    $body  = "draw=1&start=0&length=1"
    $total = ((Invoke-WebRequest "$BaseUrl/dbc/data/achievement/?build=$Build" -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing).Content | ConvertFrom-Json).recordsTotal
    $ids   = [System.Collections.Generic.List[int]]::new(); $start = 0; $pg = 5000
    while ($start -lt $total) {
        $body = "draw=1&start=$start&length=$pg"
        $resp = (Invoke-WebRequest "$BaseUrl/dbc/data/achievement/?build=$Build" -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing).Content | ConvertFrom-Json
        $resp.data | ForEach-Object { [void]$ids.Add([int]$_[3]) }
        $start += $pg
    }
    return $ids
}

$idsOld = Get-AllAchIds -Build $BuildOld
$idsNew = Get-AllAchIds -Build $BuildNew
$setOld = [System.Collections.Generic.HashSet[int]]::new(); $idsOld | ForEach-Object { [void]$setOld.Add($_) }
$candidates = $idsNew | Where-Object { -not $setOld.Contains($_) }
Write-Host "    Old=$($idsOld.Count), New=$($idsNew.Count), Raw new=$($candidates.Count)"

$authoritative = [System.Collections.Generic.HashSet[int]]::new()
if ($candidates.Count -gt 0) {
    $pat  = "^(" + ($candidates -join "|") + ")$"
    $body = "draw=1&start=0&length=$($candidates.Count + 10)&columns[3][search][value]=$pat&columns[3][search][regex]=true"
    $rows = ((Invoke-WebRequest "$BaseUrl/dbc/data/achievement/?build=$BuildNew" -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing).Content | ConvertFrom-Json).data
    # Category parent map
    $catRows = ((Invoke-WebRequest "$BaseUrl/dbc/data/achievement_category/?build=$BuildNew" -Method POST -Body "draw=1&start=0&length=1000" -ContentType "application/x-www-form-urlencoded" -UseBasicParsing).Content | ConvertFrom-Json).data
    $catParent = @{}; $catRows | ForEach-Object { $catParent[[int]$_[1]] = [int]$_[2] }
    function Get-TopCat([int]$c) { while ($catParent.ContainsKey($c) -and $catParent[$c] -ne -1) { $c = $catParent[$c] }; return $c }
    $FLAG_HIDDEN = 0x100000; $EXCL = @(1, 15076)
    foreach ($row in $rows) {
        if (([int]$row[10] -band $FLAG_HIDDEN) -eq 0 -and (Get-TopCat([int]$row[7])) -notin $EXCL) {
            [void]$authoritative.Add([int]$row[3])
        }
    }
}
Write-Host "    Authoritative new+valid IDs: $($authoritative.Count)"

# ── step 2: parse agent's claimed IDs ────────────────────────────────────────

Write-Host ""
Write-Host "[2] Parsing agent ID list ..."
$agentSet = [System.Collections.Generic.HashSet[int]]::new()
foreach ($tok in ($AgentIds -split "[,\s]+" | Where-Object { $_ -match "^\d+$" })) {
    [void]$agentSet.Add([int]$tok)
}
Write-Host "    Agent claimed IDs: $($agentSet.Count)"

# ── step 3: diff ─────────────────────────────────────────────────────────────

Write-Host ""
Write-Host "[3] Diffing agent set against authoritative set ..."

$missed = $authoritative | Where-Object { -not $agentSet.Contains($_) } | Sort-Object
$extra  = $agentSet      | Where-Object { -not $authoritative.Contains($_) } | Sort-Object

if ($missed) {
    Add-Error "Agent MISSED $($missed.Count) achievement(s) that should be added: $($missed -join ', ')"
}
if ($extra) {
    Add-Error "Agent included $($extra.Count) ID(s) that are hidden/DNT/statistics/guild (should be excluded): $($extra -join ', ')"
}

# ── step 4: duplicate guard ───────────────────────────────────────────────────

if ($LuaFile -and (Test-Path $LuaFile)) {
    Write-Host ""
    Write-Host "[4] Checking for duplicates in $LuaFile ..."
    $existingIds = [System.Collections.Generic.HashSet[int]]::new()
    foreach ($line in (Get-Content $LuaFile)) {
        $m = [regex]::Matches($line, "Ach\((\d+)\)")
        foreach ($match in $m) { [void]$existingIds.Add([int]$match.Groups[1].Value) }
    }
    $dupes = $agentSet | Where-Object { $existingIds.Contains($_) } | Sort-Object
    if ($dupes) {
        Add-Error "Agent included $($dupes.Count) ID(s) already present in the Lua file (duplicate): $($dupes -join ', ')"
    } else {
        Write-Host "    No duplicates found."
    }
} else {
    Write-Host ""
    Write-Host "[4] No LuaFile supplied — skipping duplicate check."
}

# ── result ────────────────────────────────────────────────────────────────────

Write-Host ""
if ($errors.Count -eq 0) {
    Write-Host "=== PASS: Agent ID set matches authoritative output. ==="
    exit $PASS
} else {
    Write-Host "=== FAIL ==="
    $errors | ForEach-Object { Write-Host $_ }
    Write-Host ""
    Write-Host "Fix: Always run Find-NewAchievements.ps1 first and use its filtered output"
    Write-Host "     as the definitive ID list. Do not derive IDs by threshold or name-based"
    Write-Host "     heuristics. Do not include DNT or hidden IDs."
    exit $FAIL
}
