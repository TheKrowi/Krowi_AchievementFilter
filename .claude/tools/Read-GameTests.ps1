<#
.SYNOPSIS
    Shows the last in-game test run (/kaftest) and diffs it against the headless run, so a
    change can be checked without watching the client: Deploy.ps1 -> /reload in game (with
    "/kaftest login <suite>" set once) -> Read-GameTests.ps1.

.DESCRIPTION
    Finds the most recently written Krowi_AchievementFilter.lua under the client's
    WTF\Account\*\SavedVariables and parses it with the vendored Lua 5.1 (the file is plain Lua).
    Prints KrowiAF_DebugTable.Tests.LastRun and marks every line that differs from what
    .claude\tools\headless\run-tests.lua produces for the same scenario, so the game and the model
    can be compared line by line. Scenarios skipped in game carry the outside state that made them
    unattributable (a target, a foreign popup, an open menu, a UI panel).

    The game writes saved variables on /reload and logout only, so a run that just finished is not in
    the file until the next /reload. The header shows when the file was last written.

.PARAMETER Client
    Retail (_retail_), Classic (_classic_) or Ptr (_ptr_). Default Retail.

.PARAMETER Account
    Account folder name (e.g. 133658957#1) instead of the most recently written file.

.EXAMPLE
    & ".claude\tools\Read-GameTests.ps1"
    & ".claude\tools\Read-GameTests.ps1" -Client Classic
#>
[CmdletBinding()]
param(
    [ValidateSet('Retail', 'Classic', 'Ptr')][string]$Client = 'Retail',
    [string]$Account
)

$ErrorActionPreference = 'Stop'
$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent   # .claude\tools -> repo root
$flavor = @{ Retail = '_retail_'; Classic = '_classic_'; Ptr = '_ptr_' }[$Client]
$wtf = "H:\World of Warcraft\$flavor\WTF\Account"
if (-not (Test-Path -LiteralPath $wtf)) { throw "No WTF\Account folder for $Client at $wtf" }

$candidates = if ($Account) {
    Get-Item -LiteralPath (Join-Path $wtf "$Account\SavedVariables\Krowi_AchievementFilter.lua")
} else {
    Get-ChildItem -LiteralPath $wtf -Directory | ForEach-Object { Join-Path $_.FullName 'SavedVariables\Krowi_AchievementFilter.lua' } |
        Where-Object { Test-Path -LiteralPath $_ } | Get-Item | Sort-Object LastWriteTime -Descending
}
$file = $candidates | Select-Object -First 1
if (-not $file) { throw "No Krowi_AchievementFilter.lua found under $wtf; has the client been reloaded since the addon was installed?" }

$lua = Join-Path $root '.claude\tools\lua51\lua.exe'
$reader = Join-Path $root '.claude\tools\headless\read-tests.lua'
$runner = Join-Path $root '.claude\tools\headless\run-tests.lua'
if (-not (Test-Path $lua)) { throw "Vendored Lua missing at $lua (run .claude\tools\lua51\Build-Lua51.ps1)" }

$age = (Get-Date) - $file.LastWriteTime
"Saved variables: $($file.FullName)"
"  last written $($file.LastWriteTime) ($([int]$age.TotalMinutes) min ago; the game only writes it on /reload or logout)"
""
# the headless lines for every suite, so the game's lines can be marked against the model's
$headless = Join-Path ([IO.Path]::GetTempPath()) 'KrowiAF-headless-tests.txt'
$ErrorActionPreference = 'Continue'
& $lua $runner $root -client $Client 2>&1 | ForEach-Object { "$_" } | Set-Content -LiteralPath $headless
$ErrorActionPreference = 'Stop'
& $lua $reader $file.FullName $headless
$code = $LASTEXITCODE
Remove-Item -LiteralPath $headless -ErrorAction SilentlyContinue
exit $code