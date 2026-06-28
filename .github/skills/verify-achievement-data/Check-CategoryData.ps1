param([string]$LuaFile = "DataAddons\Retail\12_Midnight\CategoryData.lua")
Add-Type -AssemblyName System.Web

$build = "12.0.7.68275"
$content = Get-Content $LuaFile -Raw

# Extract all "    number, -- Comment" entries
$entries = [System.Collections.Generic.List[pscustomobject]]::new()
$matchList = [regex]::Matches($content, '^\s+(\d{4,6}),\s*--\s*(.+)$', 'Multiline')
foreach ($m in $matchList) {
    $entries.Add([pscustomobject]@{ Id = $m.Groups[1].Value; Comment = $m.Groups[2].Value.Trim() })
}

$uniqueIds = @($entries.Id | Select-Object -Unique)
Write-Host "Parsed $($entries.Count) entries, $($uniqueIds.Count) unique IDs"

# Batch query DB
$pat  = "^(" + ($uniqueIds -join "|") + ")$"
$body = "draw=1&start=0&length=$($uniqueIds.Count + 20)&columns[3][search][value]=$pat&columns[3][search][regex]=true"
$resp = Invoke-WebRequest "http://localhost:5000/dbc/data/achievement/?build=$build" `
    -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
$rows = ($resp.Content | ConvertFrom-Json).data
$byId = @{}
$rows | ForEach-Object { $byId["$($_[3])"] = $_ }
Write-Host "DB returned $($rows.Count) rows for $($uniqueIds.Count) unique IDs"

# Check each entry
$seen   = @{}
$fails  = [System.Collections.Generic.List[string]]::new()

foreach ($e in $entries) {
    $id = $e.Id
    # Skip duplicates (same ID can appear multiple times in CategoryData)
    if ($seen[$id]) { continue }
    $seen[$id] = $true

    $row = $byId[$id]
    if (-not $row) {
        $fails.Add("[FAIL] id-missing    : $id — not found in DB")
        continue
    }

    # HTML-decode the DB name (DB returns HTML entities: &#39; → ', &amp; → &, &quot; → ")
    $dbName = [System.Web.HttpUtility]::HtmlDecode($row[1])

    # Strip parenthetical reward/title/unlock info from comment for name comparison
    # Pattern: " (Reward: ...", " (Title: ...", " (Mount: ...", " (Pet: ...", " (Unlock: ...",
    # " (Customization ...", "(Season N)" is part of the name — keep it
    $strippedComment = $e.Comment -replace '\s*\((Reward|Title|Mount|Pet|Unlock|Customization)[^)]*\)\s*$', ''
    $strippedComment = $strippedComment.Trim()

    # Check if comment has reward info appended
    $hasRewardAppended = $e.Comment -ne $strippedComment
    if ($hasRewardAppended) {
        $fails.Add("[WARN] reward-in-comment: $id — comment has reward info: `"$($e.Comment)`"")
    }

    # Check name match
    if ($strippedComment -ne $dbName) {
        $fails.Add("[FAIL] description-lang: $id — comment `"$strippedComment`" != DB `"$dbName`"")
    }
}

if ($fails.Count -eq 0) {
    Write-Host "All entries passed."
} else {
    $fails | ForEach-Object { Write-Host $_ }
    Write-Host "`n$($fails.Count) issue(s) in $($entries.Count) entries checked."
}
