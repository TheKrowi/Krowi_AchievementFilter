# Evaluate-ZoneDataDecisions.ps1
# Validates raw\ZoneDataDecisions.md (the zone-placement golden log) against the ZoneData.lua files
# and the game DB on both current builds. All ids are read from the log; none are typed on a command line.
#
# Check families (the id in brackets is what the output prints):
#   S  structure of the log      markers, 7 columns, decision vocabulary, ISO dates, ascending order,
#                                0..Highest contiguous, no id in two sections, numeric Zone ID cells
#   L  log vs ZoneData           skipped/removed absent; added/present present; Zone ID cell = the
#                                link-group primaries the id is really tagged on; cited file paths true;
#                                ZoneData ids <= Highest all logged
#   D  log vs game DB            titles exact (Retail first, Classic fallback); ghost rows; Not Found ids
#                                absent on both builds; Statistics table = DB statistics (Flags bit 1 or
#                                category root "Statistics") and no statistic in the main log; skipped
#                                rows the DB ties to an instance; gap ids looked up
#
# Exit code 0 = no ERROR findings; 1 = ERROR findings (WARN/INFO never fail the run).
#
# Usage:
#   .\Evaluate-ZoneDataDecisions.ps1                 # full run, needs wow.tools.local (_start_server.ps1)
#   .\Evaluate-ZoneDataDecisions.ps1 -SkipDb         # S, L and C only, no server needed (~1 s)
#   .\Evaluate-ZoneDataDecisions.ps1 -ReportFile out.md
#   .\Evaluate-ZoneDataDecisions.ps1 -FixZoneCells    # after link groups changed in raw\MapVerifier.csv: rewrite Zone ID cells

param(
    [string] $DecisionsFile = "$PSScriptRoot\ZoneDataDecisions.md",
    [string] $RootDir       = (Split-Path $PSScriptRoot -Parent),
    [string] $RetailBuild,          # override; default resolved from the server
    [string] $ClassicBuild,         # override; default resolved from the server
    [string] $ReportFile,
    [switch] $SkipDb,
    [switch] $FixZoneCells   # rewrite the Zone ID cell of every added/present row to the primaries the id is really tagged on, then validate
)
Set-StrictMode -Version 3
$ErrorActionPreference = "Stop"
$baseUrl = "http://localhost:5000"
$skillDir = Join-Path $RootDir '.claude\skills\add-zone-data'
. (Join-Path $skillDir '_zonedata_parser.ps1')
. (Join-Path $skillDir '_builds.ps1')

$findings = [System.Collections.Generic.List[object]]::new()
function Add-Finding([string]$Check, [string]$Severity, [string]$Message) {
    $findings.Add([pscustomobject]@{ Check = $Check; Severity = $Severity; Message = $Message })
}
function Decode-Html([string]$s) {
    $s -replace '&#39;', "'" -replace '&amp;', '&' -replace '&quot;', '"' -replace '&lt;', '<' -replace '&gt;', '>'
}
$allowedDecisions = @('✅ added', '✅ already present', '⏭ skipped', '🗑 removed')

# ── 1. Parse the log ─────────────────────────────────────────────────────────
$lines = Get-Content $DecisionsFile -Encoding UTF8
$highest = $null; $section = ""; $lineNo = 0; $markers = @{}
$main = [System.Collections.Generic.List[object]]::new()
$stats = [System.Collections.Generic.List[object]]::new()
$nf = [System.Collections.Generic.List[int]]::new()
foreach ($l in $lines) {
    $lineNo++
    if ($l -match '^\*\*Highest ID Analyzed:\s*(\d+)\*\*') { $highest = [int]$Matches[1] }
    if ($section -eq "done") { continue }
    if ($l -match '^## Main Log')      { $section = "main";  continue }
    if ($l -match '^## Statistics')    { $section = "stats"; continue }
    if ($l -match '^## IDs Not Found') { $section = "nf";    continue }
    if ($l -match '<!-- (END_MAIN_LOG|END_STATS_LOG|END_NOTFOUND) -->') {
        $markers[$Matches[1]] = $lineNo
        if ($Matches[1] -eq 'END_NOTFOUND') { $section = "done" }
        continue
    }
    if ($l -match '^\|\s*(\d+)\s*\|') {
        $cols = @(($l.Trim() -replace '^\|', '' -replace '\|$', '') -split '\|' | ForEach-Object { $_.Trim() })
        if ($section -eq "main") {
            $main.Add([pscustomobject]@{ Line = $lineNo; Id = [int]$cols[0]; Title = $cols[1]; Decision = $cols[2]
                ZoneCol = $cols[3]; ZoneName = $cols[4]; Reason = $cols[5]; Date = $cols[6]; NCols = $cols.Count })
        } elseif ($section -eq "stats") {
            $stats.Add([pscustomobject]@{ Line = $lineNo; Id = [int]$cols[0]; Title = $cols[1]; Decision = '⏭ skipped'; NCols = $cols.Count })
        }
    } elseif ($section -eq "nf" -and $l -match '^\d') {
        foreach ($t in ($l -split ',')) { $t = $t.Trim(); if ($t -match '^\d+$') { $nf.Add([int]$t) } }
    }
}
Write-Host "Parsed $DecisionsFile`: main=$($main.Count) stats=$($stats.Count) notfound=$($nf.Count) highest=$highest"

# ── S: structure ─────────────────────────────────────────────────────────────
foreach ($m in 'END_MAIN_LOG', 'END_STATS_LOG', 'END_NOTFOUND') { if (-not $markers.ContainsKey($m)) { Add-Finding "S-markers" "ERROR" "Insertion marker <!-- $m --> missing" } }
if (-not $highest) { Add-Finding "S-highest" "ERROR" "'**Highest ID Analyzed: N**' line missing" }
foreach ($r in $main)  { if ($r.NCols -ne 7) { Add-Finding "S-columns" "ERROR" "Line $($r.Line) (ID $($r.Id)) has $($r.NCols) columns, expected 7" } }
foreach ($r in $stats) { if ($r.NCols -ne 2) { Add-Finding "S-columns" "ERROR" "Line $($r.Line) (ID $($r.Id)) has $($r.NCols) columns, expected 2" } }
foreach ($r in $main) {
    if ($r.Decision -notin $allowedDecisions) { Add-Finding "S-vocabulary" "ERROR" "ID $($r.Id): decision '$($r.Decision)' is not one of: $($allowedDecisions -join ', ')" }
    if ($r.Date -notmatch '^\d{4}-\d{2}-\d{2}$') { Add-Finding "S-date" "ERROR" "ID $($r.Id): date '$($r.Date)' is not ISO" }
    $isAbsent = $r.Decision -like '*skipped*' -or $r.Decision -like '*removed*'
    if ($isAbsent -and ($r.ZoneCol -ne '—' -or $r.ZoneName -ne '—')) { Add-Finding "S-zone-cell" "WARN" "ID $($r.Id): $($r.Decision) row carries zone cells '$($r.ZoneCol)' / '$($r.ZoneName)'; expected — / —" }
    if (-not $isAbsent -and $r.ZoneCol -notmatch '^\d+(\s*,\s*\d+)*$') { Add-Finding "S-zone-cell" "ERROR" "ID $($r.Id): Zone ID cell '$($r.ZoneCol)' must be a comma-separated list of primary map ids (no free text, no —)" }
}
$all = @($main | ForEach-Object Id) + @($stats | ForEach-Object Id) + $nf
foreach ($g in ($all | Group-Object | Where-Object Count -gt 1)) { Add-Finding "S-duplicate" "ERROR" "ID $($g.Name) appears $($g.Count) times across sections" }
$gapIds = @()
if ($highest) {
    $set = [System.Collections.Generic.HashSet[int]]::new([int[]]$all)
    $gapIds = @(0..$highest | Where-Object { -not $set.Contains($_) })
    if ($gapIds) { Add-Finding "S-contiguity" "ERROR" "IDs in 0..$highest missing from every section: $($gapIds -join ', ')" }
}
function Test-Sorted($ids, $name) {
    $prev = -1; $breaks = @()
    foreach ($i in $ids) { if ($i -lt $prev) { $breaks += "$i after $prev" }; $prev = $i }
    if ($breaks) { Add-Finding "S-order" "WARN" "$name not in ascending id order at: $($breaks -join '; ')" }
}
Test-Sorted ($main | ForEach-Object Id) "Main log"
Test-Sorted ($stats | ForEach-Object Id) "Statistics table"
Test-Sorted $nf "Not-found list"

# ── 2. ZoneData ──────────────────────────────────────────────────────────────
$zd = Get-ZoneDataIndex -RootDir $RootDir
$mapRef = Get-MapReference -RootDir $RootDir
foreach ($w in $zd.Warnings) { Add-Finding "Z-parse" "WARN" $w }
Write-Host "ZoneData: $($zd.Entries.Count) Zone() entries, $($zd.IdToFiles.Count) distinct achievement ids"

if ($FixZoneCells) {
    # Zone ID cell := sorted link-group primaries the id is tagged on (the log's schema). Rows are rewritten in place;
    # the in-memory rows are updated too so the checks below run on the fixed file.
    $fixed = 0
    foreach ($r in $main) {
        if (-not ($r.Decision -like '*added*' -or $r.Decision -like '*present*')) { continue }
        if (-not $zd.IdToMaps.ContainsKey($r.Id)) { continue }
        $cell = (@($zd.IdToMaps[$r.Id] | ForEach-Object { ConvertTo-PrimaryMap $mapRef $_ } | Sort-Object -Unique)) -join ', '
        if ($cell -eq $r.ZoneCol) { continue }
        $cols = @(($lines[$r.Line - 1].Trim() -replace '^\|', '' -replace '\|$', '') -split '\|' | ForEach-Object { $_.Trim() })
        $cols[3] = $cell
        $lines[$r.Line - 1] = '| ' + ($cols -join ' | ') + ' |'
        Write-Host "  fixed ID $($r.Id): '$($r.ZoneCol)' -> '$cell'"
        $r.ZoneCol = $cell
        $fixed++
    }
    if ($fixed -gt 0) {
        [System.IO.File]::WriteAllText($DecisionsFile, (($lines -join "`r`n").TrimEnd()), [System.Text.UTF8Encoding]::new($false))
    }
    Write-Host "FixZoneCells: $fixed cell(s) rewritten"
}
function Format-Maps($ids) { ($ids | Sort-Object | ForEach-Object { "$_ $($mapRef.Names[$_])" }) -join '; ' }

# ── L: log vs ZoneData ───────────────────────────────────────────────────────
foreach ($r in $main) {
    $inZone = $zd.IdToFiles.ContainsKey($r.Id)
    if ($r.Decision -like '*skipped*' -or $r.Decision -like '*removed*') {
        if ($inZone) { Add-Finding "L1-absent-but-present" "ERROR" "ID $($r.Id) '$($r.Title)' is $($r.Decision) but is in: $(($zd.IdToFiles[$r.Id] | Sort-Object) -join ', ') (maps $(($zd.IdToMaps[$r.Id] | Sort-Object) -join ','))" }
        continue
    }
    if (-not $inZone) { Add-Finding "L2-claimed-missing" "ERROR" "ID $($r.Id) '$($r.Title)' is $($r.Decision) but appears in no ZoneData.lua"; continue }
    $actualPrim = [System.Collections.Generic.HashSet[int]]::new()
    foreach ($m in $zd.IdToMaps[$r.Id]) { [void]$actualPrim.Add((ConvertTo-PrimaryMap $mapRef $m)) }
    if ($r.ZoneCol -match '^\d+(\s*,\s*\d+)*$') {
        $claimed = @($r.ZoneCol -split ',' | ForEach-Object { [int]$_.Trim() })
        $notPrimary = @($claimed | Where-Object { (ConvertTo-PrimaryMap $mapRef $_) -ne $_ })
        if ($notPrimary) { Add-Finding "L3-zonecol" "WARN" "ID $($r.Id) '$($r.Title)': Zone ID cell lists sub-map(s) [$(Format-Maps $notPrimary)]; record link-group primaries only" }
        $claimedPrim = @($claimed | ForEach-Object { ConvertTo-PrimaryMap $mapRef $_ } | Sort-Object -Unique)
        $wrong = @($claimedPrim | Where-Object { -not $actualPrim.Contains($_) })
        if ($wrong) { Add-Finding "L3-zonecol" "ERROR" "ID $($r.Id) '$($r.Title)': Zone ID cell lists [$(Format-Maps $wrong)] but the id is not in any Zone() entry for them; actual: [$(Format-Maps $actualPrim)]" }
        $missing = @($actualPrim | Where-Object { $_ -notin $claimedPrim })
        if ($missing) { Add-Finding "L4-zonecol-incomplete" "ERROR" "ID $($r.Id) '$($r.Title)': also tagged on [$(Format-Maps $missing)], not listed in the Zone ID cell ($($r.ZoneCol))" }
    }
    foreach ($pm in [regex]::Matches($r.Reason, '`([^`]+)`')) {
        $frag = $pm.Groups[1].Value
        if ($frag -notmatch '(Shared|Retail|Classic)[/\\]') { continue }
        $frag2 = $frag -replace '/', '\'
        $files = @($zd.IdToFiles[$r.Id]); if ($zd.SharedDefined.Contains($r.Id)) { $files += $zd.SharedDefFile }
        if (-not ($files | Where-Object { $_ -like "*$frag2*" })) { Add-Finding "L6-filepath" "ERROR" "ID $($r.Id) '$($r.Title)': reason cites '$frag' but the id is only in: $(($files | Sort-Object | ForEach-Object { $_ -replace '^DataAddons\\', '' }) -join ', ')" }
    }
}
foreach ($r in $stats) { if ($zd.IdToFiles.ContainsKey($r.Id)) { Add-Finding "L1-absent-but-present" "ERROR" "Statistics ID $($r.Id) '$($r.Title)' is in: $(($zd.IdToFiles[$r.Id] | Sort-Object) -join ', ')" } }
foreach ($i in $nf) { if ($zd.IdToFiles.ContainsKey($i)) { Add-Finding "L7-notfound-present" "ERROR" "Not-found ID $i is in: $(($zd.IdToFiles[$i] | Sort-Object) -join ', ')" } }
if ($highest) {
    $logged = [System.Collections.Generic.HashSet[int]]::new([int[]]@($main | Where-Object { $_.Decision -like '*added*' -or $_.Decision -like '*present*' } | ForEach-Object Id))
    $undoc = @($zd.IdToFiles.Keys | Where-Object { $_ -le $highest -and -not $logged.Contains($_) } | Sort-Object)
    if ($undoc) { Add-Finding "L8-undocumented" "ERROR" "$($undoc.Count) ids <= $highest are in ZoneData but not logged as added/present: $($undoc -join ', ')" }
}

# ── D: game DB ───────────────────────────────────────────────────────────────
if (-not $SkipDb) {
    try {
        if (-not $RetailBuild -or -not $ClassicBuild) {
            $b = Get-WowBuilds -BaseUrl $baseUrl
            if (-not $RetailBuild) { $RetailBuild = $b.Retail }
            if (-not $ClassicBuild) { $ClassicBuild = $b.Classic }
        }
    } catch {
        Add-Finding "D-server" "ERROR" "wow.tools.local unreachable at $baseUrl — DB checks not run. Start it with .claude\skills\add-zone-data\_start_server.ps1. $_"
    }
    if ($RetailBuild -and $ClassicBuild) {
        function Invoke-AchievementQuery([string]$build, [int[]]$ids) {
            $res = @{}
            for ($o = 0; $o -lt $ids.Count; $o += 150) {
                $batch = $ids[$o..([Math]::Min($o + 149, $ids.Count - 1))]
                $pat = '^(' + ($batch -join '|') + ')$'
                $body = "draw=1&start=0&length=$($batch.Count + 10)&columns[3][search][value]=$pat&columns[3][search][regex]=true"
                $resp = Invoke-WebRequest "$baseUrl/dbc/data/achievement/?build=$build" -Method POST -Body $body -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
                foreach ($row in ($resp.Content | ConvertFrom-Json).data) {
                    # achievement columns: 0 Description 1 Title 3 ID 4 Instance_ID 5 Faction 7 Category 10 Flags
                    $res[[int]$row[3]] = [pscustomobject]@{ Title = (Decode-Html $row[1]).Trim(); Instance = [int]$row[4]; Category = [int]$row[7]; Flags = [long]$row[10] }
                }
            }
            return $res
        }
        $ids = @(@($all) + 6 + $gapIds | Sort-Object -Unique)   # 6 "Level 10" is the control id
        Write-Host "DB: querying $($ids.Count) ids on Retail $RetailBuild and Classic $ClassicBuild ..."
        $db = @{}
        $db[$RetailBuild] = Invoke-AchievementQuery $RetailBuild $ids
        $db[$ClassicBuild] = Invoke-AchievementQuery $ClassicBuild $ids
        foreach ($b in $db.Keys) { if (-not $db[$b].ContainsKey(6)) { Add-Finding "D-control" "ERROR" "Control id 6 did not resolve on build $b; results for that build are void" } }
        Write-Host "  found: retail=$($db[$RetailBuild].Count) classic=$($db[$ClassicBuild].Count)"

        $catResp = Invoke-WebRequest "$baseUrl/dbc/data/achievement_category/?build=$RetailBuild" -Method POST -Body "draw=1&start=0&length=2000" -ContentType "application/x-www-form-urlencoded" -UseBasicParsing
        $catParent = @{}; $catName = @{}
        foreach ($row in ($catResp.Content | ConvertFrom-Json).data) { $catParent[[int]$row[1]] = [int]$row[2]; $catName[[int]$row[1]] = $row[0] }
        function Get-CategoryRoot([int]$c) { $n = 0; while ($catParent.ContainsKey($c) -and $catParent[$c] -ne -1 -and $n -lt 20) { $c = $catParent[$c]; $n++ }; return $c }
        function Get-DbRow([int]$id) {
            foreach ($b in $RetailBuild, $ClassicBuild) { if ($db[$b].ContainsKey($id)) { return @{ Build = $b; Row = $db[$b][$id] } } }
            return $null
        }
        function Test-IsStatistic($row) { (($row.Flags -band 1) -ne 0) -or ((Get-CategoryRoot $row.Category) -eq 1) }

        foreach ($r in @($main) + @($stats)) {
            $hit = Get-DbRow $r.Id
            if (-not $hit) {
                if ($r.Decision -like '*removed*') { continue }   # expected: the id left the game
                $sev = if ($r.Decision -like '*skipped*') { "WARN" } else { "ERROR" }
                Add-Finding "D2-ghost" $sev "ID $($r.Id) '$($r.Title)' ($($r.Decision)) exists on neither $RetailBuild nor $ClassicBuild$(if ($sev -eq 'WARN') { ' — log it as 🗑 removed or move it to Not Found' })"
                continue
            }
            if ($r.Decision -like '*removed*') { Add-Finding "D2-ghost" "ERROR" "ID $($r.Id) '$($r.Title)' is 🗑 removed but still exists on $($hit.Build)" }
            if ($hit.Row.Title -cne $r.Title) { Add-Finding "D1-title" "ERROR" "ID $($r.Id): log title '$($r.Title)' | DB ($($hit.Build)) says '$($hit.Row.Title)'" }
        }
        foreach ($i in $nf) {
            $hit = Get-DbRow $i
            if ($hit) { Add-Finding "D3-notfound-exists" "ERROR" "Not-found ID $i exists on $($hit.Build): '$($hit.Row.Title)' (Flags=$($hit.Row.Flags), category root '$($catName[(Get-CategoryRoot $hit.Row.Category)])')" }
        }
        foreach ($i in $gapIds) {
            $hit = Get-DbRow $i
            if ($hit) { Add-Finding "D9-gap" "ERROR" "Gap ID $i exists on $($hit.Build): '$($hit.Row.Title)' (Flags=$($hit.Row.Flags), Instance=$($hit.Row.Instance), category root '$($catName[(Get-CategoryRoot $hit.Row.Category)])')" }
            else { Add-Finding "D9-gap" "WARN" "Gap ID $i exists on neither build; add it to the Not Found list" }
        }
        foreach ($r in $stats) {
            $hit = Get-DbRow $r.Id; if (-not $hit) { continue }
            if (-not (Test-IsStatistic $hit.Row)) { Add-Finding "D4-stats-not-statistic" "ERROR" "Statistics ID $($r.Id) '$($r.Title)' has Flags=$($hit.Row.Flags) and category root '$($catName[(Get-CategoryRoot $hit.Row.Category)])'; it is an achievement and belongs in the main log as ⏭ skipped" }
        }
        foreach ($r in $main) {
            $hit = Get-DbRow $r.Id; if (-not $hit) { continue }
            if (Test-IsStatistic $hit.Row) { Add-Finding "D5-statistic-in-main" "ERROR" "ID $($r.Id) '$($r.Title)' is a DB statistic (Flags=$($hit.Row.Flags)) and belongs in the Statistics table" }
            if ($r.Decision -like '*skipped*' -and $hit.Row.Instance -gt 0) { Add-Finding "D6-skipped-has-instance" "WARN" "ID $($r.Id) '$($r.Title)' is skipped but the DB ties it to Instance_ID $($hit.Row.Instance)" }
        }
        $classicOnly = @(@($main) + @($stats) | Where-Object { $db[$ClassicBuild].ContainsKey($_.Id) -and -not $db[$RetailBuild].ContainsKey($_.Id) } | ForEach-Object { $_.Id })
        if ($classicOnly) { Add-Finding "D7-classic-only" "INFO" "$($classicOnly.Count) logged ids exist only on Classic $($ClassicBuild): $($classicOnly -join ', ')" }
    }
}

# ── Report ───────────────────────────────────────────────────────────────────
$order = @{ ERROR = 0; WARN = 1; INFO = 2 }
$sorted = $findings | Sort-Object { $order[$_.Severity] }, Check
foreach ($f in $sorted) { Write-Host ("[{0,-5}] {1,-24} {2}" -f $f.Severity, $f.Check, $f.Message) }
if ($ReportFile) {
    $sb = [System.Text.StringBuilder]::new()
    [void]$sb.AppendLine("# ZoneDataDecisions validation — $(Get-Date -Format 'yyyy-MM-dd HH:mm')")
    [void]$sb.AppendLine("main=$($main.Count) stats=$($stats.Count) notfound=$($nf.Count) highest=$highest; ZoneData entries=$($zd.Entries.Count) ids=$($zd.IdToFiles.Count)")
    foreach ($sev in 'ERROR', 'WARN', 'INFO') {
        $grp = @($findings | Where-Object Severity -eq $sev)
        [void]$sb.AppendLine("`n## $sev ($($grp.Count))")
        foreach ($g in ($grp | Group-Object Check | Sort-Object Name)) { [void]$sb.AppendLine("### $($g.Name) ($($g.Count))"); foreach ($f in $g.Group) { [void]$sb.AppendLine("- $($f.Message)") } }
    }
    $sb.ToString() | Set-Content $ReportFile -Encoding UTF8
}
$counts = 'ERROR', 'WARN', 'INFO' | ForEach-Object { "$_=$(@($findings | Where-Object Severity -eq $_).Count)" }
Write-Host "`n─────────────────────────────────────────────────────────────"
$errCount = @($findings | Where-Object Severity -eq 'ERROR').Count
if ($errCount -eq 0) { Write-Host "PASS — $($main.Count) main-log rows, $($stats.Count) statistics, $($nf.Count) not-found ids consistent ($($counts -join ' '))" -ForegroundColor Green; exit 0 }
else { Write-Host "FAIL — $($counts -join ' ')" -ForegroundColor Red; exit 1 }
