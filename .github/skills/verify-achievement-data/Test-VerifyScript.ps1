#Requires -Version 5.1
<#
.SYNOPSIS
    Calibration test harness for Verify-AchievementData.ps1.
.DESCRIPTION
    Runs the verifier against four fixture files and asserts expected results:
      known_good.lua        — 8 entries (Classic); verifier must exit 0, no [FAIL] lines.
      known_bad.lua         — 10 entries (Classic); verifier must exit 1, exactly 11 [FAIL] lines (10 check failures + 1 autofactionsplit-unique Case 1 from Ach(714)/Ach(907) combination).
      known_good_retail.lua — 2 entries (Retail); verifier must exit 0, no [FAIL] lines.
      known_bad_retail.lua  — 2 entries (Retail); verifier must exit 1, exactly 1 [FAIL] line.
    Requires wow.tools.local running at http://localhost:5000 with both a wow_classic and a wow build loaded.
.EXAMPLE
    cd "e:\World of Warcraft Addon Development\Krowi_AchievementFilter\.github\skills\verify-achievement-data"
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

# ── Detect wow_classic build ──────────────────────────────────────────────────
$builds = (Invoke-RestMethod "$BaseUrl/casc/builds" -Method POST `
    -Body "draw=1&start=0&length=50" -ContentType "application/x-www-form-urlencoded").data
$wotlkBuild = $builds | Where-Object { $_[2] -eq "wow_classic" } |
    Select-Object -First 1 | ForEach-Object { "$($_[0]).$($_[1])" }
if (-not $wotlkBuild) { throw "No wow_classic build found locally. Load a WotLK Classic build in wow.tools.local." }
Write-Host "Using Classic build: $wotlkBuild"

# ── Detect wow (Retail) build ─────────────────────────────────────────────────
$retailBuild = $builds | Where-Object { $_[2] -eq "wow" } |
    Select-Object -First 1 | ForEach-Object { "$($_[0]).$($_[1])" }
if (-not $retailBuild) { throw "No wow (Retail) build found locally. Load a Retail build in wow.tools.local." }
Write-Host "Using Retail build:  $retailBuild"
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

# ════════════════════════════════════════════════════════════════════════════════
Write-Host "Test 1: known_good.lua — all entries should pass"
Write-Host "──────────────────────────────────────────────────"
$r1 = Invoke-Verifier -LuaFile $knownGood -Build $wotlkBuild

Assert ($r1.ExitCode -eq 0)                       "Exit code 0"
Assert ($r1.Text -match "All \d+ entries passed")  "Output: 'All X entries passed'"
Assert ($r1.Text -notmatch "\[FAIL\]")             "No [FAIL] lines"
Write-Host ""

# ════════════════════════════════════════════════════════════════════════════════
Write-Host "Test 2: known_bad.lua — each entry should fail exactly one check"
Write-Host "──────────────────────────────────────────────────────────────────"
$r2 = Invoke-Verifier -LuaFile $knownBad -Build $wotlkBuild

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
Assert ($r2.Text -match "\[FAIL\] title-reward.*Ach\(938\)")            "[FAIL] title-reward method→no db: Ach(938)"
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
$total = $passCount + $failCount
Write-Host "──────────────────────────────────────────────────────────────────"
if ($failCount -eq 0) {
    Write-Host "All $total assertions passed. Verifier is calibrated." -ForegroundColor Green
    exit 0
} else {
    Write-Host "$failCount of $total assertions failed. Verifier needs calibration." -ForegroundColor Red
    Write-Host ""
    Write-Host "Verifier output (known_good):" -ForegroundColor Cyan
    $r1.Lines | ForEach-Object { Write-Host "  $_" }
    Write-Host ""
    Write-Host "Verifier output (known_bad):" -ForegroundColor Cyan
    $r2.Lines | ForEach-Object { Write-Host "  $_" }
    exit 1
}
