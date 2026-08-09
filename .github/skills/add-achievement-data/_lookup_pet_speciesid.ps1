# Overwrite $names and $build before running. Parent agent uses replace_string_in_file to set the names.
# Chains creature (by exact Name_lang) -> battlepetspecies (by CreatureID) to get the SpeciesID
# passed to :Pet(speciesId) -- the game resolves name/displayId from this at runtime via GetPetInfoBySpeciesID.
# Pre-requisite: wow.tools.local must already be running.
$names = @("Hopling", "Singing Cricket", "Feral Vermling", "Venus", "Jade Tentacle", "Mr. Bigglesworth", "Tito", "Stunted Direhorn")
$build = "12.0.7.68974"
$baseUrl = "http://localhost:5000"
foreach ($name in $names) {
    $body = "draw=1&start=0&length=10&search[value]=$name"
    $resp = Invoke-WebRequest "$baseUrl/dbc/data/creature/?build=$build" `
        -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
    $json = $resp.Content | ConvertFrom-Json
    $match = $json.data | Where-Object { [System.Net.WebUtility]::HtmlDecode($_[1]) -eq $name } | Select-Object -First 1
    if (-not $match) {
        Write-Host "$name|NOTFOUND (creature, recordsFiltered=$($json.recordsFiltered))"
        continue
    }
    $creatureId = $match[0]
    $body2 = "draw=1&start=0&length=5&columns[3][search][value]=^($creatureId)$&columns[3][search][regex]=true"
    $resp2 = Invoke-WebRequest "$baseUrl/dbc/data/battlepetspecies/?build=$build" `
        -Method POST -Body $body2 -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
    $json2 = $resp2.Content | ConvertFrom-Json
    if ($json2.recordsFiltered -ge 1) {
        Write-Host "$name|CreatureID=$creatureId|SpeciesID=$($json2.data[0][2])"
    } else {
        Write-Host "$name|CreatureID=$creatureId|SpeciesID=NOTFOUND"
    }
}
