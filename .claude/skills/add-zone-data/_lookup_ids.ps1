# Overwrite $ids before running. Parent agent uses replace_string_in_file to set the IDs, then resets to @().
# Uses exact-ID column-3 regex match — never a text search — to avoid wrong results on small IDs.
# Queries BOTH current builds (resolved from the server by _builds.ps1): Shared ZoneData serves Classic too,
# so an id is only "not in the game DB" when neither build has it.
# Pre-requisite: wow.tools.local must already be running (_start_server.ps1 in Step 0).
# Output: id|Title_lang|Description_lang|builds=retail,classic   (builds= lists where the id exists)
#         id|NOT_FOUND||builds=
$ids = @()
. "$PSScriptRoot\_builds.ps1"
$baseUrl = "http://localhost:5000"
$builds = Get-WowBuilds -BaseUrl $baseUrl
$pat  = "^(" + ($ids -join "|") + ")$"
$body = "draw=1&start=0&length=$($ids.Count + 10)&columns[3][search][value]=$pat&columns[3][search][regex]=true"
function Decode-Html([string]$s) { $s -replace '&#39;', "'" -replace '&amp;', '&' -replace '&quot;', '"' }
$byId = @{}   # id -> @{ Row; Builds }
foreach ($kv in @(@{ Name = 'retail'; Build = $builds.Retail }, @{ Name = 'classic'; Build = $builds.Classic })) {
    $resp = Invoke-WebRequest "$baseUrl/dbc/data/achievement/?build=$($kv.Build)" `
        -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
    foreach ($row in ($resp.Content | ConvertFrom-Json).data) {
        $sid = "$($row[3])"
        if (-not $byId.ContainsKey($sid)) { $byId[$sid] = @{ Row = $row; Builds = @() } }
        $byId[$sid].Builds += $kv.Name
    }
}
Write-Host "builds: retail=$($builds.Retail) classic=$($builds.Classic)"
foreach ($id in $ids) {
    $sid = "$id"
    if ($byId.ContainsKey($sid)) {
        $r = $byId[$sid].Row
        Write-Host "$id|$(Decode-Html $r[1])|$(Decode-Html $r[0])|builds=$($byId[$sid].Builds -join ',')"
    } else {
        Write-Host "$id|NOT_FOUND||builds="
    }
}
