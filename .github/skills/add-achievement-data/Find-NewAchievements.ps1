param(
    [string]$BuildNew = "12.0.7.67669",
    [string]$BuildOld = "12.0.5.67602",
    [string]$BaseUrl  = "http://localhost:5000"
)

function Get-AllAchievementIds {
    param([string]$Build)
    # First get the total count
    $body = "draw=1&start=0&length=1"
    $resp = Invoke-WebRequest "$BaseUrl/dbc/data/achievement/?build=$Build" `
        -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
    $total = ($resp.Content | ConvertFrom-Json).recordsTotal

    $allIds = [System.Collections.Generic.List[int]]::new()
    $pageSize = 5000
    $start = 0
    while ($start -lt $total) {
        $body = "draw=1&start=$start&length=$pageSize"
        $resp = Invoke-WebRequest "$BaseUrl/dbc/data/achievement/?build=$Build" `
            -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
        $page = ($resp.Content | ConvertFrom-Json).data
        $page | ForEach-Object { [void]$allIds.Add([int]$_[3]) }
        $start += $pageSize
    }
    return $allIds
}

Write-Host "Fetching achievements from $BuildOld ..."
$ids05 = Get-AllAchievementIds -Build $BuildOld
Write-Host "  -> $($ids05.Count) achievements"

Write-Host "Fetching achievements from $BuildNew ..."
$ids07 = Get-AllAchievementIds -Build $BuildNew
Write-Host "  -> $($ids07.Count) achievements"

$set05   = [System.Collections.Generic.HashSet[int]]::new()
$ids05 | ForEach-Object { [void]$set05.Add($_) }
$newIds  = $ids07 | Where-Object { -not $set05.Contains($_) } | Sort-Object

Write-Host ""
Write-Host "=== New in $BuildNew (not in $BuildOld): $($newIds.Count) ==="
$newIds | ForEach-Object { Write-Host $_ }

# Now fetch full details for the new IDs
if ($newIds.Count -eq 0) { Write-Host "Nothing new."; exit 0 }

Write-Host ""
Write-Host "=== Fetching details for new IDs ==="
$pat  = "^(" + ($newIds -join "|") + ")$"
$body = "draw=1&start=0&length=$($newIds.Count + 10)&columns[3][search][value]=$pat&columns[3][search][regex]=true"
$resp = Invoke-WebRequest "$BaseUrl/dbc/data/achievement/?build=$BuildNew" `
    -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
$rows = ($resp.Content | ConvertFrom-Json).data | Sort-Object { [int]$_[3] }

# Build category parent lookup (fetch all categories once)
Write-Host "Building category parent map ..."
$catBody  = "draw=1&start=0&length=1000"
$catResp  = Invoke-WebRequest "$BaseUrl/dbc/data/achievement_category/?build=$BuildNew" `
    -Method POST -Body $catBody -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
$catParent = @{}  # catId -> parentId
($catResp.Content | ConvertFrom-Json).data | ForEach-Object { $catParent[[int]$_[1]] = [int]$_[2] }

function Get-TopLevelCategory([int]$catId) {
    $cur = $catId
    while ($catParent.ContainsKey($cur) -and $catParent[$cur] -ne -1) {
        $cur = $catParent[$cur]
    }
    return $cur
}

# Filter 1: bit 20 (0x100000) in Flags = hidden/[DNT] sub-steps
$FLAG_HIDDEN_TRACK = 0x100000

# Filter 2: top-level category = 1 (Statistics) or 15076 (Guild)
$EXCLUDED_TOP_CATS = @(1, 15076)

$filteredRows = $rows | Where-Object {
    $flags  = [int]$_[10]
    $topCat = Get-TopLevelCategory([int]$_[7])
    ($flags -band $FLAG_HIDDEN_TRACK) -eq 0 -and
    $topCat -notin $EXCLUDED_TOP_CATS
}

$skipped = $rows.Count - $filteredRows.Count
if ($skipped -gt 0) {
    Write-Host "  (filtered out $skipped hidden/statistics/guild achievements)"
}

Write-Host ""
Write-Host ("ID".PadRight(8) + "Faction".PadRight(10) + "RewardItem".PadRight(14) + "Reward_lang".PadRight(50) + "Title_lang")
Write-Host ("-" * 120)
foreach ($row in $filteredRows) {
    $id         = $row[3]
    $title      = $row[1]
    $reward     = $row[2]
    $faction    = $row[5]
    $rewardItem = $row[13]
    Write-Host ("$id".PadRight(8) + "$faction".PadRight(10) + "$rewardItem".PadRight(14) + "$reward".PadRight(50) + "$title")
}
