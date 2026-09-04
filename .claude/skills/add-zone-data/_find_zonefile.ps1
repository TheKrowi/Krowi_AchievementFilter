# Find which ZoneData.lua files reference any of the given MAP IDs (word-boundary match).
# Overwrite $ids before running. Parent agent uses replace_string_in_file to set IDs, then resets to @().
# Caveat: this is a text search. It also hits achievement ids, comments and table values that happen to
# equal the number (searching map 84 Stormwind also returns achievement 84 lines). To check whether an
# ACHIEVEMENT id is placed, and on which maps, use _check_zonedata.ps1 instead — it parses the Zone() entries.
$ids = @()
$root = "e:\World of Warcraft Addon Development\Krowi_AchievementFilter"
$pattern = "\b(" + ($ids -join "|") + ")\b"
Get-ChildItem "$root\DataAddons" -Recurse -Filter "ZoneData.lua" | ForEach-Object {
    $file = $_
    $hits = Select-String -Path $file.FullName -Pattern $pattern
    if ($hits) {
        foreach ($m in $hits) {
            Write-Host "$($file.FullName -replace [regex]::Escape($root + '\'), '')|line $($m.LineNumber): $($m.Line.Trim())"
        }
    }
}
