# Overwrite $names and $build before running. Parent agent uses replace_string_in_file to set the names.
# Looks up housedecor table ID by exact Name_lang match -- this is the id passed to :HousingDecor(recordId).
# Pre-requisite: wow.tools.local must already be running.
$names = @(
    "Lightbloom Moss Mound",
    "Silvermoon Energy Focus",
    "Colossal Amani Stone Visage",
    "Opened Domanaar Storage Crate",
    "Eversong Feast Platter",
    "Eversong Lantern Painting",
    "Amani Spearhunter's Spit",
    "Fungarian Vine Fence",
    "Void Elf Weapon Rack",
    "Tome of Kings",
    "Sunstrider Omnium Simulacrum"
)
$build = "12.0.7.68974"
$baseUrl = "http://localhost:5000"
foreach ($name in $names) {
    $body = "draw=1&start=0&length=10&search[value]=$name"
    $resp = Invoke-WebRequest "$baseUrl/dbc/data/housedecor/?build=$build" `
        -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
    $json = $resp.Content | ConvertFrom-Json
    $match = $json.data | Where-Object { [System.Net.WebUtility]::HtmlDecode($_[0]) -eq $name } | Select-Object -First 1
    if ($match) {
        Write-Host "$name|RecordID=$($match[4])"
    } else {
        Write-Host "$name|NOTFOUND (recordsFiltered=$($json.recordsFiltered))"
    }
}
