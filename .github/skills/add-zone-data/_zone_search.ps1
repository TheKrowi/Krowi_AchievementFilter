# Search MapVerifier_ActiveZones.csv by zone name (partial, case-insensitive).
# Overwrite $terms before running. Parent agent uses replace_string_in_file to set terms.
$terms = @()
$root = "e:\World of Warcraft Addon Development\Krowi_AchievementFilter"
$csv = Import-Csv "$root\raw\MapVerifier_ActiveZones.csv"
foreach ($term in $terms) {
    $rows = $csv | Where-Object { $_.name -match $term }
    if ($rows) {
        foreach ($row in $rows) {
            Write-Host "$term|$($row.id)|$($row.name)"
        }
    } else {
        Write-Host "$term|NOT_FOUND"
    }
}
