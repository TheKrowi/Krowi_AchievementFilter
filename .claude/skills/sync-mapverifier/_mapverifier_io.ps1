# Shared reader, writer and validator for raw\MapVerifier.csv, the canonical Map Verifier state.
# Dot-source it:   . "$PSScriptRoot\_mapverifier_io.ps1"
#
# Canonical form (what Write-MapVerifierCsv produces and what Test-MapVerifierRows expects):
#   header  id,name,mapType,parentMapID,verdict,expansion,link,parentOverride,nameOverride,comment
#   one row per map id, ascending, CRLF line endings, no final newline, UTF-8 without BOM,
#   a field is quoted only when it contains , " CR or LF (double quotes doubled) — identical to the
#   in-game export (Gui/DataManager/MapVerifier/MapVerifierMixin.lua).
# Game-derived columns (name, mapType, parentMapID) are informational; the in-game import ignores them.

$MapVerifierColumns = @('id', 'name', 'mapType', 'parentMapID', 'verdict', 'expansion', 'link', 'parentOverride', 'nameOverride', 'comment')
$MapVerifierVerdicts = @('Zone', 'StartingZone', 'City', 'Continent', 'Dungeon', 'Raid', 'Delve', 'ClassHall', 'Battleground', 'Scenario', 'Error', 'TaxiAndAdventure', 'Skip')
$MapVerifierExpansions = @('Vanilla', 'TBC', 'WotLK', 'Cata', 'MoP', 'WoD', 'Legion', 'BfA', 'SL', 'DF', 'TWW', 'Midnight', 'Cross')
$MapVerifierSkipLike = @('Skip', 'TaxiAndAdventure', 'Error', 'StartingZone')       # not shown on the world map
$MapVerifierInactiveLike = @('TaxiAndAdventure', 'Error', 'StartingZone')           # maps that must not appear in ZoneData

function ConvertFrom-CsvLine([string] $line) {
    # RFC 4180 style split: quoted fields may contain commas and doubled quotes
    $fields = [System.Collections.Generic.List[string]]::new()
    $sb = [System.Text.StringBuilder]::new(); $inQ = $false; $i = 0
    while ($i -lt $line.Length) {
        $c = $line[$i]
        if ($inQ) {
            if ($c -eq '"') { if ($i + 1 -lt $line.Length -and $line[$i + 1] -eq '"') { [void]$sb.Append('"'); $i++ } else { $inQ = $false } }
            else { [void]$sb.Append($c) }
        } elseif ($c -eq '"') { $inQ = $true }
        elseif ($c -eq ',') { $fields.Add($sb.ToString()); [void]$sb.Clear() }
        else { [void]$sb.Append($c) }
        $i++
    }
    $fields.Add($sb.ToString())
    return $fields
}

function ConvertTo-CsvField([string] $v) {
    if ($null -eq $v) { return '' }
    if ($v -match '[,"\r\n]') { return '"' + ($v -replace '"', '""') + '"' }
    return $v
}

# Returns @{ Rows = List of ordered row hashtables; Errors = List of strings }. Rows keep every column as a string.
function Read-MapVerifierCsv([string] $Path) {
    $errors = [System.Collections.Generic.List[string]]::new()
    $rows = [System.Collections.Generic.List[object]]::new()
    if (-not (Test-Path -LiteralPath $Path)) { $errors.Add("file not found: $Path"); return @{ Rows = $rows; Errors = $errors } }
    $text = [System.IO.File]::ReadAllText($Path, [System.Text.UTF8Encoding]::new($false))
    if ($text.Length -gt 0 -and $text[0] -eq [char]0xFEFF) { $text = $text.Substring(1) }
    $lines = $text -split "`r?`n"
    if ($lines.Count -eq 0 -or -not $lines[0]) { $errors.Add("empty file"); return @{ Rows = $rows; Errors = $errors } }
    $header = @(ConvertFrom-CsvLine $lines[0])
    $missing = @($MapVerifierColumns | Where-Object { $_ -notin $header })
    if ($missing) { $errors.Add("header lacks column(s): $($missing -join ', ') (header is '$($lines[0])')"); return @{ Rows = $rows; Errors = $errors } }
    $index = @{}; for ($i = 0; $i -lt $header.Count; $i++) { $index[$header[$i]] = $i }
    for ($n = 1; $n -lt $lines.Count; $n++) {
        $line = $lines[$n]
        if ($line.Trim() -eq '') { if ($n -lt $lines.Count - 1) { $errors.Add("line $($n + 1): empty line") }; continue }
        $f = @(ConvertFrom-CsvLine $line)
        if ($f.Count -ne $header.Count) { $errors.Add("line $($n + 1): $($f.Count) fields, header has $($header.Count)"); continue }
        $row = [ordered]@{}
        foreach ($c in $MapVerifierColumns) { $row[$c] = $f[$index[$c]] }
        $row['_line'] = $n + 1
        $rows.Add($row)
    }
    return @{ Rows = $rows; Errors = $errors }
}

# Validates content (not order). Returns a list of error strings, empty when valid.
function Test-MapVerifierRows($Rows) {
    $errors = [System.Collections.Generic.List[string]]::new()
    $byId = @{}
    foreach ($r in $Rows) {
        $id = 0
        if (-not [int]::TryParse($r.id, [ref]$id) -or $id -le 0) { $errors.Add("line $($r._line): id '$($r.id)' is not a positive integer"); continue }
        if ($byId.ContainsKey($id)) { $errors.Add("line $($r._line): id $id already appears on line $($byId[$id]._line)"); continue }
        $byId[$id] = $r
        if ($r.verdict -ne '' -and $r.verdict -notin $MapVerifierVerdicts) { $errors.Add("line $($r._line): verdict '$($r.verdict)' is not one of $($MapVerifierVerdicts -join ', ')") }
        if ($r.expansion -ne '' -and $r.expansion -notin $MapVerifierExpansions) { $errors.Add("line $($r._line): expansion '$($r.expansion)' is not one of $($MapVerifierExpansions -join ', ')") }
        foreach ($c in 'mapType', 'parentMapID', 'link', 'parentOverride') { $t = 0; if ($r[$c] -ne '' -and -not [int]::TryParse($r[$c], [ref]$t)) { $errors.Add("line $($r._line): $c '$($r[$c])' is not an integer") } }
    }
    foreach ($r in $Rows) {
        if ($r.link -eq '') { continue }
        $target = 0; if (-not [int]::TryParse($r.link, [ref]$target)) { continue }
        $id = [int]$r.id
        if ($target -eq $id) { $errors.Add("line $($r._line): id $id links to itself"); continue }
        if (-not $byId.ContainsKey($target)) { $errors.Add("line $($r._line): id $id links to $target, which has no row"); continue }
        if ($byId[$target].link -ne '') { $errors.Add("line $($r._line): id $id links to $target, which is itself linked to $($byId[$target].link); link to the primary") }
    }
    return $errors
}

# Order check for the validate-only path: ascending ids.
function Test-MapVerifierOrder($Rows) {
    $prev = 0
    foreach ($r in $Rows) { $id = [int]$r.id; if ($id -le $prev) { return "line $($r._line): id $id is not in ascending order (previous $prev); run Sync-MapVerifier.ps1" }; $prev = $id }
    return $null
}

function ConvertTo-MapVerifierText($Rows) {
    $lines = [System.Collections.Generic.List[string]]::new()
    $lines.Add(($MapVerifierColumns -join ','))
    foreach ($r in ($Rows | Sort-Object { [int]$_.id })) {
        $lines.Add((($MapVerifierColumns | ForEach-Object { ConvertTo-CsvField ([string]$r[$_]) }) -join ','))
    }
    return ($lines -join "`r`n")
}

function Write-MapVerifierCsv([string] $Path, $Rows) {
    [System.IO.File]::WriteAllText($Path, (ConvertTo-MapVerifierText $Rows), [System.Text.UTF8Encoding]::new($false))
}
