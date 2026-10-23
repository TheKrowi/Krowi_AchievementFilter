<#
.SYNOPSIS
    Shows the last in-game test run (/kaftest) and diffs it against the headless run, so a
    change can be checked without watching the client: the kit's Deploy.ps1 -> /reload in game (with
    "/kaftest login <suite>" set once) -> Read-GameTests.ps1.

.DESCRIPTION
    Finds the most recently written Krowi_AchievementFilter.lua under the client's
    WTF\Account\*\SavedVariables and parses it with the kit's Lua 5.1 (the file is plain Lua).
    Prints KrowiAF_DebugTable.Tests.LastRun and marks every line that differs from what
    .claude\tools\headless\run-tests.lua produces for the same scenario, so the game and the model
    can be compared line by line. Scenarios skipped in game carry the outside state that made them
    unattributable (a target, a foreign popup, an open menu, a UI panel).

    The game writes saved variables on /reload and logout only, so a run that just finished is not in
    the file until the next /reload. The header shows when the file was last written.

    Steps only the game runs are marked g and not diffed. A step that took a screenshot gets the path of
    the file from the client's Screenshots folder, to open with the Read tool.

.PARAMETER Client
    Retail (_retail_), Classic (_classic_), Ptr (_ptr_, the wowt test realm) or Xptr (_xptr_, the second test realm, wowxptr). Default Retail.

.PARAMETER Account
    Account folder name (e.g. 133658957#1) instead of the most recently written file.

.EXAMPLE
    & ".claude\tools\Read-GameTests.ps1"
    & ".claude\tools\Read-GameTests.ps1" -Client Classic
#>
[CmdletBinding()]
param(
    [ValidateSet('Retail', 'Classic', 'Ptr', 'Xptr')][string]$Client = 'Retail',
    [string]$Account
)

$ErrorActionPreference = 'Stop'
$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent   # .claude\tools -> repo root
. (Join-Path $PSScriptRoot 'KitPath.ps1')
. (Join-Path $KitTools 'AddonContext.ps1')   # the kit's client map: Get-ClientFolder
$wtf = Join-Path (Get-ClientFolder $Client) 'WTF\Account'
if (-not (Test-Path -LiteralPath $wtf)) { throw "No WTF\Account folder for $Client at $wtf" }

$candidates = if ($Account) {
    Get-Item -LiteralPath (Join-Path $wtf "$Account\SavedVariables\Krowi_AchievementFilter.lua")
} else {
    Get-ChildItem -LiteralPath $wtf -Directory | ForEach-Object { Join-Path $_.FullName 'SavedVariables\Krowi_AchievementFilter.lua' } |
        Where-Object { Test-Path -LiteralPath $_ } | Get-Item | Sort-Object LastWriteTime -Descending
}
$file = $candidates | Select-Object -First 1
if (-not $file) { throw "No Krowi_AchievementFilter.lua found under $wtf; has the client been reloaded since the addon was installed?" }

$lua = $KitLua
$reader = Join-Path $root '.claude\tools\headless\read-tests.lua'
$runner = Join-Path $root '.claude\tools\headless\run-tests.lua'

$age = (Get-Date) - $file.LastWriteTime
"Saved variables: $($file.FullName)"
"  last written $($file.LastWriteTime) ($([int]$age.TotalMinutes) min ago; the game only writes it on /reload or logout)"
""
# the headless lines for every suite, so the game's lines can be marked against the model's
$headless = Join-Path ([IO.Path]::GetTempPath()) 'KrowiAF-headless-tests.txt'
$ErrorActionPreference = 'Continue'
$model = if ($Client -eq 'Classic') { 'Classic' } else { 'Retail' }   # the test realms run the Retail client
& $lua $runner $root -client $model 2>&1 | ForEach-Object { "$_" } | Set-Content -LiteralPath $headless
$ErrorActionPreference = 'Stop'

# A step that took a screenshot prints its time; the game names the file after the second it was written, the same
# second or the next (WoWScrnShot_MMddyy_HHmmss), and the steps are seconds apart, so the nearest file within 2 s is it
$shotDir = Join-Path (Get-ClientFolder $Client) 'Screenshots'
$shots = @(if (Test-Path -LiteralPath $shotDir) {
    Get-ChildItem -LiteralPath $shotDir -File -Filter 'WoWScrnShot_*' | ForEach-Object {
        $t = [datetime]::MinValue
        if ($_.BaseName -match '^WoWScrnShot_(\d{6})_(\d{6})$' -and
            [datetime]::TryParseExact($Matches[1] + $Matches[2], 'MMddyyHHmmss', [Globalization.CultureInfo]::InvariantCulture, 'None', [ref]$t)) {
            [pscustomobject]@{ Time = $t; Path = $_.FullName }
        }
    }
})
$encoding = [Console]::OutputEncoding
[Console]::OutputEncoding = [Text.Encoding]::UTF8
try {
    $output = & $lua $reader $file.FullName $headless
    $code = $LASTEXITCODE
} finally {
    [Console]::OutputEncoding = $encoding
}
foreach ($line in $output) {
    if ("$line" -match '^(\s+)screenshot at (\d{4}-\d\d-\d\d \d\d:\d\d:\d\d)(.*)$') {
        $at = [datetime]::ParseExact($Matches[2], 'yyyy-MM-dd HH:mm:ss', [Globalization.CultureInfo]::InvariantCulture)
        $indent, $tail = $Matches[1], $Matches[3]
        $best = $shots | Where-Object { ($_.Time - $at).TotalSeconds -ge -1 -and ($_.Time - $at).TotalSeconds -le 2 } |
            Sort-Object { [math]::Abs(($_.Time - $at).TotalSeconds) } | Select-Object -First 1
        "${indent}screenshot at $($at.ToString('HH:mm:ss')): $(if ($best) { $best.Path } else { 'none found' })$tail"
    } else {
        "$line"
    }
}
Remove-Item -LiteralPath $headless -ErrorAction SilentlyContinue
exit $code