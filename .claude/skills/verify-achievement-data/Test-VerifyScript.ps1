#Requires -Version 5.1
<#
.SYNOPSIS
    Calibration test harness for Verify-AchievementData.ps1.
.DESCRIPTION
    Runs the verifier against five fixture files and asserts expected results:
      known_good.lua        — 8 entries (Classic); verifier must exit 0, no [FAIL] lines.
      known_bad.lua         — 10 entries (Classic); verifier must exit 1, exactly 11 [FAIL] lines (10 check failures + 1 autofactionsplit-unique Case 1 from Ach(714)/Ach(907) combination).
      known_good_retail.lua — 2 entries (Retail); verifier must exit 0, no [FAIL] lines.
      known_bad_retail.lua  — 2 entries (Retail); verifier must exit 1, exactly 1 [FAIL] line.
      known_good_ptr_fallback.lua — 2 entries; first id resolves in the live "wow" build (chosen as
        primary via auto-detect), second id only exists on "wowt" (PTR) and must be resolved via the
        fallback-build pass. Run WITHOUT -Build so auto-detection actually runs. Verifier must exit 0.
    Requires wow.tools.local running at http://localhost:5000 with a wow (Retail) build loaded. Tests 1 and 2
    also need a wow_classic build (Mists of Pandaria Classic) and are skipped without one; the fallback
    assertion in test 5 needs a wowt (PTR) build and is skipped without one.
.EXAMPLE
    cd "e:\World of Warcraft Addon Development\Krowi_AchievementFilter\.claude\skills\verify-achievement-data"
    .\Test-VerifyScript.ps1
#>
[CmdletBinding()]
param(
    [string]$BaseUrl = "http://localhost:5000"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$scriptDir    = $PSScriptRoot
$verifyScript = Join-Path $scriptDir "Verify-AchievementData.ps1"
$fixturesDir  = Join-Path $scriptDir "fixtures"
$knownGood       = Join-Path $fixturesDir "known_good.lua"
$knownBad        = Join-Path $fixturesDir "known_bad.lua"
$knownGoodRetail = Join-Path $fixturesDir "known_good_retail.lua"
$knownBadRetail  = Join-Path $fixturesDir "known_bad_retail.lua"
$knownGoodPtrFallback = Join-Path $fixturesDir "known_good_ptr_fallback.lua"

$passCount = 0
$failCount = 0

function Assert {
    param([bool]$Condition, [string]$Message)
    if ($Condition) {
        Write-Host "  [PASS] $Message" -ForegroundColor Green
        $script:passCount++
    } else {
        Write-Host "  [FAIL] $Message" -ForegroundColor Red
        $script:failCount++
    }
}

# ── Ensure wow.tools.local is reachable ───────────────────────────────────────
try {
    $null = Invoke-WebRequest "$BaseUrl/casc/buildname" -UseBasicParsing -TimeoutSec 3
} catch {
    throw "wow.tools.local not reachable at $BaseUrl. Start it before running tests."
}

# ── Detect wow_classic build (Mists of Pandaria Classic is the current wow_classic product) ──
# Local builds first, then remote ones: the DBC endpoint fetches any build on demand
$buildsBody = "draw=1&start=0&length=200"
$builds = @(
    (Invoke-RestMethod "$BaseUrl/casc/builds" -Method POST -Body $buildsBody -ContentType "application/x-www-form-urlencoded").data
    (Invoke-RestMethod "$BaseUrl/casc/builds?remote=true" -Method POST -Body $buildsBody -ContentType "application/x-www-form-urlencoded").data
)
$classicBuild = $builds | Where-Object { $_[2] -eq "wow_classic" } |
    Select-Object -First 1 | ForEach-Object { "$($_[0]).$($_[1])" }
if ($classicBuild) {
    Write-Host "Using Classic build: $classicBuild"
} else {
    Write-Warning "No wow_classic build available locally or remotely; skipping the Classic tests (1 and 2)."
}

# ── Detect wow (Retail) build ─────────────────────────────────────────────────
$retailBuild = $builds | Where-Object { $_[2] -eq "wow" } |
    Select-Object -First 1 | ForEach-Object { "$($_[0]).$($_[1])" }
if (-not $retailBuild) { throw "No wow (Retail) build found locally. Load a Retail build in wow.tools.local." }
Write-Host "Using Retail build:  $retailBuild"
$ptrBuild = $builds | Where-Object { $_[2] -eq "wowt" } |
    Select-Object -First 1 | ForEach-Object { "$($_[0]).$($_[1])" }
if (-not $ptrBuild) { Write-Warning "No wowt (PTR) build loaded; test 5 cannot prove the fallback pass and only checks the ids resolve." }
Write-Host ""

# ── Helper: invoke the verifier and capture pipeline output + exit code ───────
# The verifier emits [FAIL] lines and the summary/pass message to the pipeline
# (stdout) as well as Write-Host. We capture pipeline output with & and read
# $LASTEXITCODE which is set by the script's exit 0 / exit 1.
function Invoke-Verifier {
    param([string]$LuaFile, [string]$Build)
    $output = @(& $verifyScript $LuaFile -Build $Build *>&1 | ForEach-Object { "$_" })
    $code   = $LASTEXITCODE
    $text   = $output -join "`n"
    return [PSCustomObject]@{
        ExitCode = $code
        Text     = $text
        Lines    = $output
    }
}

if ($classicBuild) {
# ════════════════════════════════════════════════════════════════════════════════
Write-Host "Test 1: known_good.lua — all entries should pass"
Write-Host "──────────────────────────────────────────────────"
$r1 = Invoke-Verifier -LuaFile $knownGood -Build $classicBuild

Assert ($r1.ExitCode -eq 0)                       "Exit code 0"
Assert ($r1.Text -match "All \d+ entries passed")  "Output: 'All X entries passed'"
Assert ($r1.Text -notmatch "\[FAIL\]")             "No [FAIL] lines"
Write-Host ""

# ════════════════════════════════════════════════════════════════════════════════
Write-Host "Test 2: known_bad.lua — each entry should fail exactly one check"
Write-Host "──────────────────────────────────────────────────────────────────"
$r2 = Invoke-Verifier -LuaFile $knownBad -Build $classicBuild

Assert ($r2.ExitCode -eq 1)                                            "Exit code 1"
Assert ($r2.Text -match "11 failure\(s\) in 10 entries checked")        "Summary: 11 failures in 10 entries (10 check failures + 1 autofactionsplit-unique Case 1)"
# id-exists
Assert ($r2.Text -match "\[FAIL\] id-exists.*Ach\(99999\)")             "[FAIL] id-exists      : Ach(99999)"
# faction — 3 branches
Assert ($r2.Text -match "\[FAIL\] faction.*Ach\(714\).*Faction=0.*Horde")  "[FAIL] faction Horde  : Ach(714)"
Assert ($r2.Text -match "\[FAIL\] faction.*Ach\(907\).*Faction=1.*Alliance") "[FAIL] faction Alliance: Ach(907)"
Assert ($r2.Text -match "\[FAIL\] faction.*Ach\(938\).*Faction=-1.*both")   "[FAIL] faction both   : Ach(938)"
# title-reward — 2 branches
Assert ($r2.Text -match "\[FAIL\] title-reward.*Ach\(418\)")            "[FAIL] title-reward db→missing: Ach(418)"
Assert ($r2.Text -match "\[FAIL\] title-reward.*Ach\(2136\)")          "[FAIL] title-reward method→non-title reward: Ach(2136)"
# reward-item — 2 branches
Assert ($r2.Text -match "\[FAIL\] reward-item.*Ach\(940\)")             "[FAIL] reward-item method→no db: Ach(940)"
Assert ($r2.Text -match "\[FAIL\] reward-item.*Ach\(2136\)")            "[FAIL] reward-item db→missing: Ach(2136)"
# description-lang — 2 cases
Assert ($r2.Text -match "\[FAIL\] description-lang.*Ach\(938\)")        "[FAIL] description-lang plain: Ach(938)"
Assert ($r2.Text -match "\[FAIL\] description-lang.*Ach\(714\)")        "[FAIL] description-lang AutoFactionSplit: Ach(714)"

$unexpected = @($r2.Lines | Where-Object {
    $_ -match "\[FAIL\]" -and
    $_ -notmatch "Ach\(99999\)" -and $_ -notmatch "Ach\(938\)" -and
    $_ -notmatch "Ach\(418\)" -and $_ -notmatch "Ach\(714\)" -and
    $_ -notmatch "Ach\(940\)" -and $_ -notmatch "Ach\(907\)" -and
    $_ -notmatch "Ach\(2136\)"
})
Assert ($unexpected.Count -eq 0) "No unexpected [FAIL] lines (false positives)"
Write-Host ""
}   # end Classic tests

# ════════════════════════════════════════════════════════════════════════════════
Write-Host "Test 3: known_good_retail.lua — all entries should pass (Retail build)"
Write-Host "─────────────────────────────────────────────────────────────────────"
$r3 = Invoke-Verifier -LuaFile $knownGoodRetail -Build $retailBuild

Assert ($r3.ExitCode -eq 0)                       "Exit code 0"
Assert ($r3.Text -match "All \d+ entries passed")  "Output: 'All X entries passed'"
Assert ($r3.Text -notmatch "\[FAIL\]")             "No [FAIL] lines"
Write-Host ""

# ════════════════════════════════════════════════════════════════════════════════
Write-Host "Test 4: known_bad_retail.lua — mutual FactionSplit with same rewards should fail"
Write-Host "──────────────────────────────────────────────────────────────────────────────"
$r4 = Invoke-Verifier -LuaFile $knownBadRetail -Build $retailBuild

Assert ($r4.ExitCode -eq 1)                                                "Exit code 1"
Assert ($r4.Text -match "1 failure\(s\) in 2 entries checked")             "Summary: 1 failure in 2 entries"
Assert ($r4.Text -match "\[FAIL\] autofactionsplit-unique.*Ach\(12593\).*Ach\(13294\)") "[FAIL] autofactionsplit-unique: Ach(12593) and Ach(13294)"

$unexpected4 = @($r4.Lines | Where-Object {
    $_ -match "\[FAIL\]" -and
    $_ -notmatch "Ach\(12593\)" -and $_ -notmatch "Ach\(13294\)"
})
Assert ($unexpected4.Count -eq 0) "No unexpected [FAIL] lines (false positives)"
Write-Host ""

# ════════════════════════════════════════════════════════════════════════════════
Write-Host "Test 5: known_good_ptr_fallback.lua — id missing from primary build must resolve via fallback"
Write-Host "──────────────────────────────────────────────────────────────────────────────────────────────"
$output5 = @(& $verifyScript $knownGoodPtrFallback *>&1 | ForEach-Object { "$_" })
$r5 = [PSCustomObject]@{ ExitCode = $LASTEXITCODE; Text = ($output5 -join "`n"); Lines = $output5 }

Assert ($r5.ExitCode -eq 0)                                     "Exit code 0"
Assert ($r5.Text -match "All \d+ entries passed")                "Output: 'All X entries passed'"
Assert ($r5.Text -notmatch "\[FAIL\]")                           "No [FAIL] lines"
if ($ptrBuild) {
    # The fixture's second id must still be missing from the live build for the fallback pass to trigger.
    # Achievements move from PTR to live every patch, so probe before asserting.
    $probeBody = "draw=1&start=0&length=1&columns[3][search][value]=^62282`$&columns[3][search][regex]=true"
    $onLive = (Invoke-RestMethod "$BaseUrl/dbc/data/achievement/?build=$retailBuild" -Method POST -Body $probeBody -ContentType "application/x-www-form-urlencoded").recordsFiltered -gt 0
    if ($onLive) {
        Write-Warning "Fixture known_good_ptr_fallback.lua no longer exercises the fallback pass: Ach(62282) now exists on the live build $retailBuild. Replace it with an id that only exists on a PTR build (wowt/wowxptr) to re-arm this assertion."
    } else {
        Assert ($r5.Text -match "Resolved \d+ additional ID\(s\) from fallback build") "Fallback build resolution message printed"
    }
}
Write-Host ""

# ════════════════════════════════════════════════════════════════════════════════
$total = $passCount + $failCount
Write-Host "──────────────────────────────────────────────────────────────────"
if ($failCount -eq 0) {
    Write-Host "All $total assertions passed. Verifier is calibrated." -ForegroundColor Green
    exit 0
} else {
    Write-Host "$failCount of $total assertions failed. Verifier needs calibration." -ForegroundColor Red
    Write-Host ""
    if ($classicBuild) {
        Write-Host "Verifier output (known_good):" -ForegroundColor Cyan
        $r1.Lines | ForEach-Object { Write-Host "  $_" }
        Write-Host ""
        Write-Host "Verifier output (known_bad):" -ForegroundColor Cyan
        $r2.Lines | ForEach-Object { Write-Host "  $_" }
    }
    Write-Host "Verifier output (known_good_retail):" -ForegroundColor Cyan
    $r3.Lines | ForEach-Object { Write-Host "  $_" }
    exit 1
}
