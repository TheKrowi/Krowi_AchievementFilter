<#
.SYNOPSIS
    Says whether this year's WoW anniversary is in the data: from 1 October to 31 December, exits 1 with what is missing
    while it is not; the rest of the year, and once it is in, exits 0.

.DESCRIPTION
    Every November Blizzard adds a WoW's Nth Anniversary (N = year - 2004): a new calendar holiday and an achievement,
    usually on the PTR in September or October (docs/work/2026-11-21-wows-anniversary-event). The release gate
    (.claude/release-gate.ps1) runs this script and fails while it says something is missing (Krowi, 2026-11-21), so the
    anniversary cannot be forgotten in an autumn release. Offline: it reads the data files' comments, so each entry needs
    its comment written as the data skills write them:
    - the holiday's id in the WoW's Anniversary event row (DataAddons/Retail/06_WarlordsOfDaenor/EventData.lua),
      commented "-- WoW's Nth Anniversary (<year>)";
    - the achievement in a Retail AchievementData.lua, commented "-- WoW's Nth Anniversary";
    - the achievement in Events > WoW's Anniversary (DataAddons/Retail/CategoryData_Events.lua), with the same comment.

.PARAMETER Date
    The day to judge, default today: -Date 2027-10-15 shows what the 23rd will ask for.
#>
param([datetime]$Date = (Get-Date))

$ErrorActionPreference = 'Stop'
$repo = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
$year = $Date.Year
$number = $year - 2004
$suffix = if ($number % 100 -in 11, 12, 13) { 'th' } else { switch ($number % 10) { 1 { 'st' } 2 { 'nd' } 3 { 'rd' } default { 'th' } } }
$name = "WoW's $number$suffix Anniversary"

if ($Date.Month -lt 10) {
    "$name ($year): not checked before 1 October"
    exit 0
}

$missing = @()
$eventFile = Join-Path $repo 'DataAddons\Retail\06_WarlordsOfDaenor\EventData.lua'
$escaped = [regex]::Escape($name)
if (-not (Select-String -LiteralPath $eventFile -Pattern "^\s*\d+,\s*--\s*$escaped \($year\)" -Quiet)) {
    $missing += "its calendar holiday id in the WoW's Anniversary event row (DataAddons/Retail/06_WarlordsOfDaenor/EventData.lua, commented '-- $name ($year)')"
}
$achievementFiles = Get-ChildItem -LiteralPath (Join-Path $repo 'DataAddons\Retail') -Recurse -Filter 'AchievementData.lua'
$achievementIds = @($achievementFiles | Select-String -Pattern "Ach\((\d+)\).*--\s*$escaped\s*$" | ForEach-Object { $_.Matches[0].Groups[1].Value })
if (-not $achievementIds.Count) {
    $missing += "its achievement in a Retail AchievementData.lua (add-achievement-data)"
}
# The category must list the same achievement, not only a line with its name
$categoryFile = Join-Path $repo 'DataAddons\Retail\CategoryData_Events.lua'
$categoryIds = @(Select-String -LiteralPath $categoryFile -Pattern "^\s*(\d+),\s*--\s*$escaped\s*$" | ForEach-Object { $_.Matches[0].Groups[1].Value })
if (-not ($categoryIds | Where-Object { $_ -in $achievementIds })) {
    $missing += "its achievement$(if ($achievementIds.Count) { " ($($achievementIds -join ', '))" }) in Events > WoW's Anniversary (DataAddons/Retail/CategoryData_Events.lua)"
}

if ($missing.Count -eq 0) {
    "$name ($year) is in the data"
    exit 0
}
"$name ($year) is not in the data yet; missing: $($missing -join '; '). Find them on the PTR: `$env:KAF_RETAIL_PRODUCT = 'wowt'` (or 'wowxptr'), then .claude\skills\add-achievement-data\_lookup_holidays.ps1 -Terms '$number$suffix Anniversary' for the holiday id and window, and .claude\skills\add-achievement-data\Find-NewAchievements.ps1 for the achievement"
exit 1