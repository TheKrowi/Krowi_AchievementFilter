# Objective coverage gate for add-category-data.
# Overwrite $patchKey, $achievementFile and $build before running; no other params should be needed.
#
# What it checks (fast, deterministic, one batched DB call):
#   1. Every achievement ID declared in the target AchievementData.lua patch block
#      (Ach(id) plus AutoFactionSplit(faction.X, id) secondary IDs) appears at least
#      once somewhere under DataAddons/**/CategoryData*.lua.
#   2. For every missing ID, look up its achievement_category via wow.tools.local.
#      If that category falls under a CONFIRMED out-of-scope root (see
#      $outOfScopeCategoryIds below - PvP ladder Feats of Strength, Collections/
#      Appearances, Housing), it's reported as an informational skip.
#      NOTE: ":NotCategorized()" in AchievementData.lua is a REWARD-TYPE tag (the
#      achievement's reward can't be classified), NOT a category-placement exemption.
#      It must NOT be used to auto-skip an ID here (confirmed 2026-08-03: 62872 and
#      63473 were both tagged ":NotCategorized()" yet still needed real CategoryData
#      placement, in DataAddons/Retail/CategoryData_PvP.lua's Midnight Season 2 block).
#   3. Any remaining missing ID (not in a confirmed out-of-scope category) is a FAIL -
#      it must be placed somewhere or the skip needs fresh justification to the user
#      (and, once confirmed, added to $outOfScopeCategoryIds below).
#
# CAVEAT: the category-based allowlist in step 2 is a coarse heuristic and can produce
# false negatives - e.g. achievement_category 15270 (PvP)/15259 (Appearances) combo
# achievements like "Champion of the Dawn"/"Light of the Party" (Season 1) ARE tracked
# in CategoryData_PvP.lua even though most other IDs in those categories are not. Spot
# check any FAIL-adjacent category-skip results against precedent before trusting them.
#
# Exit code 0 = pass (nothing missing besides confirmed skips). Exit code 1 = fail.
# This script does NOT check ordering, placement judgment, or Keystone Hero/Victor
# pairing - see RUBRIC.md for the LLM-as-judge pass that covers those.

$patchKey = "12_01_00"
$achievementFile = "e:\World of Warcraft Addon Development\Krowi_AchievementFilter\DataAddons\Retail\12_Midnight\AchievementData.lua"
$dataAddonsRoot = "e:\World of Warcraft Addon Development\Krowi_AchievementFilter\DataAddons"
$build = "12.1.0.68914"

# Confirmed out-of-scope achievement_category IDs (grows over time - add new ones here
# once you and the user confirm a whole category is never tracked in CategoryData.lua).
# 15270 = Player vs. Player (under Feats of Strength 81) - arena/RBG ladder titles/mounts/transmog
# 15269 = Mounts (under Feats of Strength 81) - generic FoS mount bucket; PvP-season mount rewards
#         land here (not under the raid/dungeon/zone's own category, which stays in-scope)
# 15259 = Appearances (Collections tab) - transmog set completion achievements
# 15606 = Housing - neighborhood/decor achievements
$outOfScopeCategoryIds = @("15270", "15269", "15259", "15606")


$content = Get-Content -Raw $achievementFile

# Isolate the target patch block: from `KrowiAF.AchievementData["<patchKey>"] = {` to the matching top-level `}`
$startPattern = [regex]::Escape("KrowiAF.AchievementData[`"$patchKey`"] = {")
$startMatch = [regex]::Match($content, $startPattern)
if (-not $startMatch.Success) {
    Write-Host "FAIL: patch key '$patchKey' not found in $achievementFile"
    exit 1
}
$searchStart = $startMatch.Index + $startMatch.Length
$closeIdx = $content.IndexOf("`n}", $searchStart)
if ($closeIdx -lt 0) {
    Write-Host "FAIL: could not find closing brace for patch block '$patchKey'"
    exit 1
}
$block = $content.Substring($searchStart, $closeIdx - $searchStart)

# Extract primary IDs: Ach(12345)
$achMatches = [regex]::Matches($block, 'Ach\((\d+)\)([^\r\n]*)')
# Extract secondary faction-split IDs: AutoFactionSplit(faction.X, 12345) or FactionSplit(faction.X, 12345)
$factionMatches = [regex]::Matches($block, '(?:AutoFactionSplit|FactionSplit)\(faction\.\w+,\s*(\d+)\)')

$ids = [ordered]@{}
foreach ($m in $achMatches) {
    $id = $m.Groups[1].Value
    $ids[$id] = $true
}
foreach ($m in $factionMatches) {
    $id = $m.Groups[1].Value
    if (-not $ids.Contains($id)) { $ids[$id] = $true }
}

Write-Host "Patch '$patchKey': $($ids.Count) achievement IDs extracted."

# Gather every CategoryData*.lua file's content once
$categoryFiles = Get-ChildItem -Path $dataAddonsRoot -Recurse -Filter "CategoryData*.lua"
$categoryText = ($categoryFiles | ForEach-Object { Get-Content -Raw $_.FullName }) -join "`n"

$missingHard = @()
foreach ($id in $ids.Keys) {
    $found = [regex]::IsMatch($categoryText, "\b$id\b")
    if (-not $found) {
        $missingHard += $id
    }
}

# For remaining missing IDs, check achievement_category via wow.tools.local before failing.
$stillMissing = @()
$categorySkip = @()
if ($missingHard.Count -gt 0) {
    $pat = "^(" + ($missingHard -join "|") + ")$"
    $body = "draw=1&start=0&length=$($missingHard.Count + 10)&columns[3][search][value]=$pat&columns[3][search][regex]=true"
    $resp = Invoke-WebRequest "http://localhost:5000/dbc/data/achievement/?build=$build" -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
    $json = $resp.Content | ConvertFrom-Json
    $byId = @{}
    $json.data | ForEach-Object { $byId[$_[3]] = $_ }
    foreach ($id in $missingHard) {
        $row = $byId["$id"]
        if ($row -and ($outOfScopeCategoryIds -contains "$($row[7])")) {
            $categorySkip += "$id (category $($row[7]): $($row[1]))"
        } else {
            $stillMissing += $id
        }
    }
}

if ($categorySkip.Count -gt 0) {
    Write-Host "INFO: $($categorySkip.Count) IDs absent but confirmed out-of-scope by category:"
    $categorySkip | ForEach-Object { Write-Host "  $_" }
}

if ($stillMissing.Count -gt 0) {
    Write-Host "FAIL: $($stillMissing.Count) IDs not found in ANY CategoryData*.lua file and not in a confirmed out-of-scope category:"
    Write-Host ($stillMissing -join ', ')
    Write-Host ""
    Write-Host "Each of these must either be placed in a category file, or - if genuinely out-of-scope - confirmed"
    Write-Host "with the user and added to `$outOfScopeCategoryIds in this script (with a repo memory note)."
    exit 1
}

Write-Host "PASS: all non-skipped IDs from patch '$patchKey' appear in at least one CategoryData*.lua file"
Write-Host "(or are confirmed out-of-scope by category)."
exit 0
