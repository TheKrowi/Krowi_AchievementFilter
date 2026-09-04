<#
.SYNOPSIS
    Shows the Lua errors BugGrabber recorded in the game for this addon, so a deploy can be checked
    without watching the client: Deploy.ps1 -> /reload in game -> Read-GameErrors.ps1.

.DESCRIPTION
    Finds the most recently written !BugGrabber.lua under the client's WTF\Account\*\SavedVariables
    and parses it with the vendored Lua 5.1 (the file is plain Lua). Only errors whose message or
    stack mentions Krowi_AchievementFilter are shown unless -All is given.

    The game writes saved variables on /reload and logout only, so an error that just happened is
    not in the file until the next /reload. The header shows when the file was last written.

.PARAMETER Client
    Retail (_retail_), Classic (_classic_) or Ptr (_ptr_). Default Retail.

.PARAMETER Hours
    Only errors from the last N hours. Default 24. Use 0 for everything.

.PARAMETER All
    Do not filter to this addon.

.PARAMETER Account
    Account folder name (e.g. 133658957#1) instead of the most recently written file.

.PARAMETER Max
    Maximum errors to print. Default 20.

.EXAMPLE
    & ".claude\tools\Read-GameErrors.ps1"
    & ".claude\tools\Read-GameErrors.ps1" -Client Classic -Hours 0 -All
#>
[CmdletBinding()]
param(
    [ValidateSet('Retail', 'Classic', 'Ptr')][string]$Client = 'Retail',
    [double]$Hours = 24,
    [switch]$All,
    [string]$Account,
    [int]$Max = 20
)

$ErrorActionPreference = 'Stop'
$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent   # .claude\tools -> repo root
$flavor = @{ Retail = '_retail_'; Classic = '_classic_'; Ptr = '_ptr_' }[$Client]
$wtf = "H:\World of Warcraft\$flavor\WTF\Account"
if (-not (Test-Path -LiteralPath $wtf)) { throw "No WTF\Account folder for $Client at $wtf" }

$candidates = if ($Account) {
    Get-Item -LiteralPath (Join-Path $wtf "$Account\SavedVariables\!BugGrabber.lua")
} else {
    Get-ChildItem -LiteralPath $wtf -Directory | ForEach-Object { Join-Path $_.FullName 'SavedVariables\!BugGrabber.lua' } |
        Where-Object { Test-Path -LiteralPath $_ } | Get-Item | Sort-Object LastWriteTime -Descending
}
$file = $candidates | Select-Object -First 1
if (-not $file) { throw "No !BugGrabber.lua found under $wtf; is BugGrabber installed and has the client been reloaded since?" }

$lua = Join-Path $root '.claude\tools\lua51\lua.exe'
$reader = Join-Path $root '.claude\tools\headless\read-errors.lua'
if (-not (Test-Path $lua)) { throw "Vendored Lua missing at $lua (run .claude\tools\lua51\Build-Lua51.ps1)" }

$since = if ($Hours -gt 0) { [DateTimeOffset]::UtcNow.AddHours(-$Hours).ToUnixTimeSeconds() } else { 0 }
$filter = if ($All) { 'all' } else { 'Krowi_AchievementFilter' }
$age = (Get-Date) - $file.LastWriteTime
"BugGrabber log: $($file.FullName)"
"  last written $($file.LastWriteTime) ($([int]$age.TotalMinutes) min ago; the game only writes it on /reload or logout)"
""
& $lua $reader $file.FullName $since $filter $Max