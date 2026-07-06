# Check which achievement IDs are already present in MapVerifier_ZonesPerAchievement.csv
# Set $ids before running.
$ids = @()
$root = "e:\World of Warcraft Addon Development\Krowi_AchievementFilter"
$csv = Import-Csv "$root\raw\MapVerifier_ZonesPerAchievement.csv"
foreach ($id in $ids) {
    $rows = $csv | Where-Object { $_.achievementId -eq $id }
    if ($rows) {
        foreach ($row in $rows) {
            Write-Host "$id|PRESENT|zones=$($row.zones)"
        }
    } else {
        Write-Host "$id|NOT_PRESENT"
    }
}
