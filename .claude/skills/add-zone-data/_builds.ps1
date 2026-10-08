# Resolve the current game builds from wow.tools.local instead of hard-coding them.
# Dot-source, then call Get-WowBuilds:
#   . "$PSScriptRoot\_builds.ps1"
#   $builds = Get-WowBuilds          # @{ Retail = "12.1.0.69587"; Classic = "5.5.4.69585" }
# Picks the newest build of product `wow` (Retail) and `wow_classic` (Classic). The local list is
# tried first; if either product is missing there the remote list is used, because the DBC endpoint
# fetches any build on demand. Never conclude "no Classic build" from the local list alone.
# To prepare a patch that is still on the PTR, set $env:KAF_RETAIL_PRODUCT = "wowxptr" (or "wowt")
# before running a script: Retail then resolves to the newest build of that product instead of `wow`.
# Pre-requisite: the server is running (_start_server.ps1).
function Get-WowBuilds {
    param([string] $BaseUrl = "http://localhost:5000")

    $retailProduct = if ($env:KAF_RETAIL_PRODUCT) { $env:KAF_RETAIL_PRODUCT } else { 'wow' }

    function Read-Builds([string] $url) {
        $resp = Invoke-WebRequest $url -Method POST -Body "draw=1&start=0&length=500" `
            -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
        foreach ($row in ($resp.Content | ConvertFrom-Json).data) {
            # local rows: version, build, product, folder, ...; remote rows: version, build, product, hash, ...
            [pscustomobject]@{ Version = [version]$row[0]; Build = [int]$row[1]; Product = $row[2] }
        }
    }
    function Pick($rows, [string] $product) {
        $rows | Where-Object Product -eq $product | Sort-Object Version, Build -Descending | Select-Object -First 1 |
            ForEach-Object { "$($_.Version).$($_.Build)" }
    }

    $rows = @(Read-Builds "$BaseUrl/casc/builds")
    $retail = Pick $rows $retailProduct
    $classic = Pick $rows 'wow_classic'
    if (-not $retail -or -not $classic) {
        $rows = @(Read-Builds "$BaseUrl/casc/builds?remote=true")
        if (-not $retail) { $retail = Pick $rows $retailProduct }
        if (-not $classic) { $classic = Pick $rows 'wow_classic' }
    }
    if (-not $retail -or -not $classic) {
        throw "Could not resolve both builds from $BaseUrl (retail='$retail', classic='$classic')."
    }
    return @{ Retail = $retail; Classic = $classic }
}
