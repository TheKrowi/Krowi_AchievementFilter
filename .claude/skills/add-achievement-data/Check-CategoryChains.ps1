param([string]$Build = "12.0.7.67669")

$BaseUrl = "http://localhost:5000"

function Get-CategoryRow($catId) {
    $body = "draw=1&start=0&length=1&columns[1][search][value]=^$catId`$&columns[1][search][regex]=true"
    $r = (Invoke-WebRequest "$BaseUrl/dbc/data/achievement_category/?build=$Build" -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing).Content | ConvertFrom-Json
    if ($r.recordsFiltered -eq 0) { return $null }
    return $r.data[0]  # [0]=Name_lang [1]=ID [2]=Parent
}

function Get-Chain($startCatId) {
    $parts = @()
    $cur = $startCatId
    while ($true) {
        if ($cur -eq -1) { $parts += "[-1]"; break }
        $row = Get-CategoryRow $cur
        if (-not $row) { $parts += "${cur}(?not found)"; break }
        $parts += "$($row[1])=$($row[0])"
        $parent = [int]$row[2]
        if ($parent -eq -1) { $parts += "[-1]"; break }
        $cur = $parent
    }
    return ($parts -join " -> ")
}

# Categories from the flagged achievements we analysed:
# bit 0  (Tracking/Counter): 15542 (Rotmire LFR/N/H/M variants), 15553 ([DNT] moths)
# bit 15 (Guild):            15570 (Rotmire Guild Run)
# also check included categories for contrast: 15566, 15608, 15610
$cats = @(
    @{Id=15542; Note="bit-0 (Rotmire progress variants)"},
    @{Id=15553; Note="bit-0 ([DNT] Moth Hunt)"},
    @{Id=15570; Note="bit-15 (Guild Run)"},
    @{Id=15566; Note="included (Rotmire normal)"},
    @{Id=15608; Note="included (Ritual Sites)"},
    @{Id=15610; Note="included (Showdown/misc)"}
)

foreach ($c in $cats) {
    $chain = Get-Chain $c.Id
    Write-Host "$($c.Note) [$($c.Id)]:"
    Write-Host "  $chain"
    Write-Host ""
}
