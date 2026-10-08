# Print the calendar dates of in-game holidays (holidays + holidaynames), decoded: the fact behind an
# Obtainable("From", "Date", ..., "Until", "Date", ...) window for an anniversary or other dated event.
# Overwrite $terms (holiday name fragments, matched case-insensitively) and $build before running, then reset $terms to @().
# Pre-requisite: wow.tools.local must already be running.
# Output: holiday id|name|region|start (server time)|duration hours|end   one line per filled Date slot
$terms = @()
$build = "12.1.5.70077"
$baseUrl = "http://localhost:5000"

function Get-Rows([string]$table) {
    $resp = Invoke-WebRequest "$baseUrl/dbc/data/$table/?build=$build" -Method POST -Body "draw=1&start=0&length=5000" `
        -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
    @(($resp.Content | ConvertFrom-Json).data)
}
function Get-Columns([string]$table) {
    @(((Invoke-WebRequest "$baseUrl/dbc/header/$table/?build=$build" -UseBasicParsing).Content | ConvertFrom-Json).headers)
}
# WowTime packing: minute 0-5, hour 6-10, weekday 11-13, monthDay 14-19 (0-based), month 20-23 (0-based), year 24-28 (+2000)
function ConvertFrom-WowTime([long]$v) {
    if ($v -le 0) { return $null }
    $minute = $v -band 0x3F; $hour = ($v -shr 6) -band 0x1F
    $day = (($v -shr 14) -band 0x3F) + 1; $month = (($v -shr 20) -band 0xF) + 1; $year = (($v -shr 24) -band 0x1F) + 2000
    try { return Get-Date -Year $year -Month $month -Day $day -Hour $hour -Minute $minute -Second 0 } catch { return $null }
}

if ($terms.Count -eq 0) { Write-Host "Set `$terms first."; return }
$names = @{}
foreach ($r in Get-Rows 'holidaynames') { $names[[int]$r[0]] = [System.Net.WebUtility]::HtmlDecode($r[1]) }
$cols = Get-Columns 'holidays'
$ix = @{}; for ($i = 0; $i -lt $cols.Count; $i++) { $ix[$cols[$i]] = $i }
foreach ($h in Get-Rows 'holidays') {
    $name = $names[[int]$h[$ix['HolidayNameID']]]
    if (-not $name -or -not ($terms | Where-Object { $name -like "*$_*" })) { continue }
    $durations = @(0..9 | ForEach-Object { [int]$h[$ix["Duration[$_]"]] })
    for ($d = 0; $d -lt 26; $d++) {
        $start = ConvertFrom-WowTime ([long]$h[$ix["Date[$d]"]])
        if (-not $start) { continue }
        $hours = if ($d -lt 10 -and $durations[$d] -gt 0) { $durations[$d] } else { $durations[0] }
        $end = $start.AddHours($hours)
        Write-Host ("{0}|{1}|region={2}|{3:yyyy-MM-dd HH:mm}|{4}h|{5:yyyy-MM-dd HH:mm}" -f $h[$ix['ID']], $name, $h[$ix['Region']], $start, $hours, $end)
    }
}