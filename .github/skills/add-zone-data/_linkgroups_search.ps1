# Find the LinkGroup row(s) that contain any of the given map IDs.
# Overwrite $ids before running. Parent agent uses replace_string_in_file to set IDs.
$ids = @()
$root = "e:\World of Warcraft Addon Development\Krowi_AchievementFilter"
$csv = Import-Csv "$root\raw\MapVerifier_LinkGroups.csv"
foreach ($id in $ids) {
    $sid = "$id"
    $rows = $csv | Where-Object { $_.ids -match "(^|,\s*)$sid(\s*,|$)" }
    if ($rows) {
        foreach ($row in $rows) {
            Write-Host "$id|primary=$($row.primaryId)|primaryName=$($row.primaryName)|ids=$($row.ids)"
        }
    } else {
        Write-Host "$id|NOT_IN_ANY_GROUP"
    }
}
