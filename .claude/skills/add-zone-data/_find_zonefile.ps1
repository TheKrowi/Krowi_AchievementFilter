# Find which ZoneData.lua files reference any of the given map IDs.
# Overwrite $ids before running. Parent agent uses replace_string_in_file to set IDs.
$ids = @()
$root = "e:\World of Warcraft Addon Development\Krowi_AchievementFilter"
$pattern = "\b(" + ($ids -join "|") + ")\b"
Get-ChildItem "$root\DataAddons" -Recurse -Filter "ZoneData.lua" | ForEach-Object {
    $file = $_
    $matches = Select-String -Path $file.FullName -Pattern $pattern
    if ($matches) {
        foreach ($m in $matches) {
            Write-Host "$($file.FullName -replace [regex]::Escape($root + '\'), '')|line $($m.LineNumber): $($m.Line.Trim())"
        }
    }
}
