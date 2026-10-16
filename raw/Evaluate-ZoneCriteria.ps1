# Evaluate-ZoneCriteria.ps1
# Checks ZoneData placements against the game's own criteria trees (Zone Placement Rules 2 and 3 in
# .claude\skills\add-zone-data\SKILL.md; the reasons and decisions D1 to D14 are in docs\zone-decisions.md).
#
#   R2   a placed achievement whose criteria name a zone or city must be on (one of) the map(s) carrying that
#        name. Only location-bound criteria count: explore (43), kill (0), quest (27), cast-at (29), pet battle
#        in zone (158, 161). Reputation (46) and achievement (8) criteria never do, even when the faction is
#        named after a city. Names match link-group primaries of any verdict except Continent and Skip-like,
#        exactly, or as an "... in <Map>" tail (Elder Highpeak in The Hinterlands). A name that exists in
#        several expansions (Nagrand, Uldum, Dalaran, ...) passes when the id is on any candidate. Instance and
#        Battleground candidates are never expected (Explore Ghostlands names "Windrunner Spire").
#        Achievements placed only on instance maps (Dungeon, Raid, Delve, Scenario, ClassHall) are not
#        checked: their criteria name the instance by its area (Keystone Master: "Boralus").
#   D8   informational, decision D8 (resolved 2026-09-05, per map): an explore criterion naming a City inside
#        the zone never puts the zone's achievement on the city (Explore Durotar names Orgrimmar); a criterion
#        naming an outdoor sub-map follows the yes/no table $d8SubMaps below. "[D8  ]" lines are decided
#        cases that stay off the inner map; "[D8? ]" names a sub-map not in the table yet, a map whose parent
#        chain in raw\MapVerifier.csv reaches a map the id is on: ask the user, then add it. A sub-map decided
#        yes, and any missed map that is not inside a map the id is on, is an ordinary R2 finding.
#   R3   a meta (criteria of type 8) must be on every primary map one of its child achievements is placed on,
#        transitively, instances included (Rule 3 is literal: The Flame Warden in the Slave Pens, Master of
#        Wintergrasp in Vault of Archavon). Continent maps are never expected; children in $noPropagate are
#        not followed and metas in $skipMetas are not checked.
#   R3+  informational: the meta is on a map no child is on (children not placed anywhere are listed).
#
# The three DBC tables (achievement, criteriatree, criteria) are exported once per build from wow.tools.local
# into .claude\cache\dbc\<build>\ (git-ignored) and read offline afterwards; -Refresh re-exports. Criteria trees
# are the same on both clients for shared ids, so the Retail export is used; ids that exist only on Classic are
# counted and skipped. The export also serves as the offline title source for `N, -- Title` comment lines.
#
# Usage:
#   .\Evaluate-ZoneCriteria.ps1                    # every id placed in ZoneData
#   .\Evaluate-ZoneCriteria.ps1 -Ids 6558,2136     # specific ids (placed or not)
#   .\Evaluate-ZoneCriteria.ps1 -Refresh           # re-export the tables
#   .\Evaluate-ZoneCriteria.ps1 -Quiet             # findings only, no D8/R3+ information
# Exit code 0 = no R2/R3 findings; 1 = findings.

param(
    [int[]]  $Ids,
    [switch] $Refresh,
    [switch] $Quiet,
    [string] $Build,
    [string] $RootDir = (Split-Path $PSScriptRoot -Parent)
)
Set-StrictMode -Version 3
$ErrorActionPreference = "Stop"
$baseUrl = "http://localhost:5000"
$skillDir = Join-Path $RootDir '.claude\skills\add-zone-data'
. (Join-Path $skillDir '_zonedata_parser.ps1')
. (Join-Path $RootDir '.claude\tools\KitPath.ps1')
. (Join-Path $KitTools 'Get-WowBuilds.ps1')

$nameAliases = @{ 'Sholozar Basin' = 'Sholazar Basin'; 'Karasang Wilds' = 'Krasarang Wilds' }   # DB spellings
$locationTypes = @(0, 27, 29, 43, 158, 161)
# R2: an id placed only on these maps is not checked, and these maps are never expected (Battleground is filtered on its own)
$instanceVerdicts = @('Dungeon', 'Raid', 'Delve', 'Scenario', 'ClassHall')
# criterion descriptions that coincide with a map name but are not a place (quest titles); reviewed by hand
$notALocation = @{ 14353 = @('Azshara') }   # Ardenweald's a Stage: quest "Azshara" (the queen), not the zone
# D8 (2026-09-05): does a zone's explore achievement also go on an outdoor sub-map its criterion names? Per-map decisions by
# the user, no general rule; a sub-map not in this table is reported as [D8? ] until decided. Cities are always no.
$d8SubMaps = @{
    74   = $true    # Caverns of Time (Tanaris)
    2444 = $true    # Slayer's Rise (Voidstorm)
    1698 = $true    # Seat of the Primus (Maldraxxus)
    1701 = $true    # Heart of the Forest (Ardenweald)
    1707 = $true    # Elysian Hold (Bastion)
    499  = $true    # Deeprun Tram (Field Photographer selfie)
    500  = $false   # "Deeprun Tram" map of Bizmo's Brawlpub: brawler content only
    33   = $false   # Blackrock Mountain: between Searing Gorge and Burning Steppes, decided no
    2239 = $false   # Amirdrassil: the criterion is the sub-area of the Emerald Dream (2200), not this separate map
}
# children a meta must not inherit maps from (placed by convention rather than by criteria). Empty since D11 was decided on
# 2026-09-05 and the four season-independent Legion keystone achievements left the Shadowlands dungeons; kept for the next case.
$noPropagate = @()
# metas never placed, so never reported (decisions 2026-09-05, raw\ZoneMetaProposals-2026-09-05.md sections E and F):
#   Realm First! feats (own rule, not the real-world-event rule; may be revisited) and hidden tracking achievements the
#   addon does not register (Allied Races unlock requirements, <Hidden> unlock flags, raid-portal trackers, hidden copies)
$skipMetas = @(1463, 6829,
    12445, 12446, 12447, 12448, 13089, 13092, 13159, 13160, 13991, 13993, 13258, 13259, 16414, 20480, 40024, 40028, 41085,
    40193, 40315,   # Into the Storm (copy), [HIDDEN] Now THIS is Dragon Racing!: hidden copies, not registered
    63263,          # [DNT]Midnight Keystone Myth: Season 1 Personal Achievement: hidden, not registered
    63689)          # [DNT]Midnight Keystone Myth: Season 2 Personal Achievement: hidden, not registered

# --- 1. tables ---------------------------------------------------------------------------------------
if (-not $Build) { $Build = (Get-WowBuilds -BaseUrl $baseUrl).Retail }
$cacheDir = Join-Path $RootDir ".claude\cache\dbc\$Build"
New-Item -ItemType Directory -Force $cacheDir | Out-Null
foreach ($t in 'achievement', 'criteriatree', 'criteria') {
    $f = Join-Path $cacheDir "$t.csv"
    if ($Refresh -or -not (Test-Path $f) -or (Get-Item $f).Length -lt 1000) {
        Write-Host "Exporting $t for $Build..."
        Invoke-WebRequest "$baseUrl/dbc/export/?name=$t&build=$Build" -UseBasicParsing -OutFile $f
    }
}
Write-Host "Reading tables from $cacheDir..."
$sw = [Diagnostics.Stopwatch]::StartNew()
$ach = @{}
foreach ($r in Import-Csv (Join-Path $cacheDir 'achievement.csv')) {
    $ach[[int]$r.ID] = @{ Title = $r.Title_lang; Tree = [int]$r.Criteria_tree; Flags = [int]$r.Flags; Category = [int]$r.Category }
}
$children = @{}
foreach ($r in Import-Csv (Join-Path $cacheDir 'criteriatree.csv')) {
    $p = [int]$r.Parent
    if ($p -eq 0) { continue }
    if (-not $children.ContainsKey($p)) { $children[$p] = [System.Collections.Generic.List[object]]::new() }
    $children[$p].Add(@{ Id = [int]$r.ID; Desc = $r.Description_lang; CriteriaId = [int]$r.CriteriaID })
}
$crit = @{}
foreach ($r in Import-Csv (Join-Path $cacheDir 'criteria.csv')) { $crit[[int]$r.ID] = @{ Type = [int]$r.Type; Asset = [int]$r.Asset } }
Write-Host ("  {0} achievements, {1} criteria, {2:n1} s" -f $ach.Count, $crit.Count, $sw.Elapsed.TotalSeconds)

# --- 2. zone data and map names ----------------------------------------------------------------------
$mapRef = Get-MapReference -RootDir $RootDir
$zd = Get-ZoneDataIndex -RootDir $RootDir
$nameToPrimaries = @{}
foreach ($kv in $mapRef.Names.GetEnumerator()) {
    $id = [int]$kv.Key
    if ($mapRef.SubToPrimary.ContainsKey($id)) { continue }
    if ($mapRef.Types[$id] -eq 'Continent' -or $mapRef.SkipLike.Contains($id) -or $mapRef.Types[$id] -eq '') { continue }
    $k = $kv.Value.ToLowerInvariant()
    if (-not $nameToPrimaries.ContainsKey($k)) { $nameToPrimaries[$k] = [System.Collections.Generic.List[int]]::new() }
    $nameToPrimaries[$k].Add($id)
}
function Get-Primaries([int] $AchId) {
    $set = [System.Collections.Generic.HashSet[int]]::new()
    if ($zd.IdToMaps.ContainsKey($AchId)) { foreach ($m in $zd.IdToMaps[$AchId]) { [void]$set.Add((ConvertTo-PrimaryMap $mapRef $m)) } }
    return ,$set
}
function Resolve-ZoneName([string] $Desc) {
    $d = $Desc.Trim()
    if ($nameAliases.ContainsKey($d)) { $d = $nameAliases[$d] }
    $k = $d.ToLowerInvariant()
    if ($nameToPrimaries.ContainsKey($k)) { return @{ Name = $d; Candidates = $nameToPrimaries[$k] } }
    if ($d -match '\sin\s+(.+)$') {
        $tail = $Matches[1]
        if ($nameAliases.ContainsKey($tail)) { $tail = $nameAliases[$tail] }
        $tk = $tail.ToLowerInvariant()
        if ($nameToPrimaries.ContainsKey($tk)) { return @{ Name = $tail; Candidates = $nameToPrimaries[$tk] } }
    }
    return $null
}
function Get-Leaves([int] $Tree, [int] $Depth) {
    $out = [System.Collections.Generic.List[object]]::new()
    if (-not $children.ContainsKey($Tree)) { return ,$out }
    foreach ($c in $children[$Tree]) {
        if ($c.CriteriaId -ne 0 -and $crit.ContainsKey($c.CriteriaId)) {
            $out.Add(@{ Desc = $c.Desc; Type = $crit[$c.CriteriaId].Type; Asset = $crit[$c.CriteriaId].Asset })
        } elseif ($Depth -lt 4) {
            foreach ($l in (Get-Leaves $c.Id ($Depth + 1))) { $out.Add($l) }
        }
    }
    return ,$out
}
function Format-Maps($Maps) { ($Maps | Sort-Object | ForEach-Object { "$_ $($mapRef.Names[$_])" }) -join '; ' }
# true when the map's parent chain in raw\MapVerifier.csv (parentOverride first) reaches one of the given primary maps
function Test-InsideMaps([int] $MapId, $Primaries) {
    $cur = $MapId
    for ($depth = 0; $depth -lt 6; $depth++) {
        $p = $mapRef.Parent[$cur]
        if (-not $p) { return $false }
        $cur = [int]$p
        if ($Primaries.Contains((ConvertTo-PrimaryMap $mapRef $cur))) { return $true }
    }
    return $false
}

# --- 3. checks ---------------------------------------------------------------------------------------
$findings = [System.Collections.Generic.List[string]]::new()
$infos = [System.Collections.Generic.List[string]]::new()
if ($Ids) { $scope = @($Ids | Sort-Object -Unique) }
else {
    # every placed id, plus every meta that is not placed although one of its children is (Glory of the Hero on no dungeon)
    $set = [System.Collections.Generic.HashSet[int]]::new([int[]]@($zd.IdToMaps.Keys))
    foreach ($kv in $ach.GetEnumerator()) {
        if ($set.Contains($kv.Key) -or ($kv.Value.Flags -band 1)) { continue }   # placed already, or a statistic
        foreach ($l in (Get-Leaves $kv.Value.Tree 1)) {
            if ($l.Type -eq 8 -and $zd.IdToMaps.ContainsKey($l.Asset)) { [void]$set.Add($kv.Key); break }
        }
    }
    $scope = @($set | Sort-Object)
}
$classicOnly = 0; $zoneLeaves = 0; $metas = 0

foreach ($id in $scope) {
    if ($id -in $skipMetas) { continue }
    if (-not $ach.ContainsKey($id)) { $classicOnly++; continue }
    $a = $ach[$id]
    $leaves = Get-Leaves $a.Tree 1
    $mine = Get-Primaries $id
    $placedStr = if ($mine.Count -gt 0) { Format-Maps $mine } else { 'NOT PLACED' }
    $instanceOnly = $mine.Count -gt 0 -and @($mine | Where-Object { $mapRef.Types[$_] -notin $instanceVerdicts }).Count -eq 0

    # R2
    if (-not $instanceOnly) {
        $named = @{}   # name -> @{ Candidates; Explore = every criterion naming it is an explore (type 43) criterion }
        foreach ($l in $leaves) {
            if ($l.Type -notin $locationTypes) { continue }
            if ($notALocation.ContainsKey($id) -and $l.Desc.Trim() -in $notALocation[$id]) { continue }
            $z = Resolve-ZoneName $l.Desc
            if (-not $z) { continue }
            if (-not $named.ContainsKey($z.Name)) { $named[$z.Name] = @{ Candidates = $z.Candidates; Explore = $true } }
            if ($l.Type -ne 43) { $named[$z.Name].Explore = $false }
        }
        if ($named.Count -gt 0) { $zoneLeaves++ }
        foreach ($kv in ($named.GetEnumerator() | Sort-Object Key)) {
            $hit = $false
            foreach ($c in $kv.Value.Candidates) { if ($mine.Contains($c)) { $hit = $true; break } }
            if ($hit) { continue }
            # an open-world achievement never goes into an instance, however the entrance area is named (Explore Ghostlands: "Windrunner Spire"),
            # and a battleground variant of a zone name (Slayer's Rise 2397) is not the zone
            $cands = @($kv.Value.Candidates | Where-Object { $mapRef.Types[$_] -notin $instanceVerdicts -and $mapRef.Types[$_] -ne 'Battleground' })
            if ($cands.Count -eq 0) { continue }
            $candText = ($cands | ForEach-Object { "$_ $($mapRef.Names[$_]) ($($mapRef.Types[$_]))" }) -join ' | '
            # D8 (decided 2026-09-05): an explore criterion that names a City inside the zone does not put the zone's achievement on the
            # city (Explore Durotar: Orgrimmar); an outdoor sub-map follows the yes/no table $d8SubMaps. Criteria of other types performed
            # in a city (perform, photograph, quest) are Rule 6 content: a finding.
            if ($mine.Count -gt 0) {
                $allCity = @($cands | Where-Object { $mapRef.Types[$_] -ne 'City' }).Count -eq 0
                # a city named by an explore criterion: no (D8). Named by any other criterion type (perform, photograph, quest): Rule 6, a finding
                if ($allCity -and $kv.Value.Explore) { $infos.Add("[D8  ] $id $($a.Title) — explore criterion names city $candText; stays on $placedStr"); continue }
                if (-not $allCity) {
                    # outdoor maps, for every criterion type (the user wants no general rule): a map decided yes, or a missed map that is not
                    # inside a map the id is on (Elwynn Forest for a pet battle achievement placed on the other zones), is a finding below. The
                    # table goes first because two decided maps have other parents (Blackrock Mountain: Burning Steppes; Amirdrassil: Dragon Isles).
                    $outdoor = @($cands | Where-Object { $mapRef.Types[$_] -ne 'City' })
                    $decidedYes = @($outdoor | Where-Object { $d8SubMaps.ContainsKey($_) -and $d8SubMaps[$_] })
                    $undecided = @($outdoor | Where-Object { -not $d8SubMaps.ContainsKey($_) })
                    $subMaps = @($undecided | Where-Object { Test-InsideMaps $_ $mine })
                    if ($decidedYes.Count -eq 0 -and $undecided.Count -gt 0 -and $subMaps.Count -eq $undecided.Count) { $infos.Add("[D8? ] $id $($a.Title) — criterion names undecided sub-map $candText; stays on $placedStr until decided"); continue }
                    if ($decidedYes.Count -eq 0 -and $undecided.Count -eq 0) { $infos.Add("[D8  ] $id $($a.Title) — criterion names sub-map $candText, decided no; stays on $placedStr"); continue }
                }
            }
            $findings.Add("[R2  ] $id $($a.Title) — criterion names '$($kv.Key)' but the id is not on $candText (placed on: $placedStr)")
        }
    }

    # R3
    $childIds = @($leaves | Where-Object { $_.Type -eq 8 } | ForEach-Object { $_.Asset } | Sort-Object -Unique)
    if ($childIds.Count -gt 0) {
        $metas++
        $expected = @{}; $unplaced = [System.Collections.Generic.List[int]]::new()
        foreach ($cid in $childIds) {
            if ($cid -in $noPropagate) { continue }
            $cp = Get-Primaries $cid
            if ($cp.Count -eq 0) { $unplaced.Add($cid); continue }
            foreach ($p in $cp) { if ($mapRef.Types[$p] -ne 'Continent' -and -not $expected.ContainsKey($p)) { $expected[$p] = $cid } }
        }
        # Rule 3 is literal (decided 2026-09-05): a meta is placed on every map a child is on, instances included
        $missing = @($expected.Keys | Where-Object { -not $mine.Contains($_) } | Sort-Object)
        if ($missing.Count -gt 0) {
            $detail = ($missing | ForEach-Object { "$_ $($mapRef.Names[$_]) (child $($expected[$_]))" }) -join '; '
            $state = if ($mine.Count -eq 0) { 'NOT PLACED' } else { "placed on $($mine.Count)" }
            $findings.Add("[R3  ] $id $($a.Title) [$state] — meta not on $($missing.Count) map(s) its children are on: $detail")
        }
        if ($mine.Count -gt 0) {
            $extra = @($mine | Where-Object { -not $expected.ContainsKey($_) -and $mapRef.Types[$_] -ne 'Continent' } | Sort-Object)
            if ($extra.Count -gt 0) {
                $u = if ($unplaced.Count -gt 0) { " (unplaced children: $($unplaced -join ', '))" } else { '' }
                $infos.Add("[R3+ ] $id $($a.Title) — meta on $($extra.Count) map(s) no child is on: $(Format-Maps $extra)$u")
            }
        }
    }
}

Write-Host ""
Write-Host ("Scope: {0} ids ({1} Classic-only skipped); {2} with zone-named criteria, {3} metas" -f $scope.Count, $classicOnly, $zoneLeaves, $metas)
Write-Host ("=" * 70)
foreach ($f in $findings) { Write-Host $f }
if (-not $Quiet) { foreach ($i in $infos) { Write-Host $i -ForegroundColor DarkGray } }
Write-Host ("=" * 70)
if ($findings.Count -eq 0) { Write-Host "RESULT: R2/R3 pass ($($infos.Count) informational line(s))." -ForegroundColor Green }
else { Write-Host "RESULT: $($findings.Count) R2/R3 finding(s), $($infos.Count) informational line(s)." -ForegroundColor Red }
exit ($findings.Count -gt 0 ? 1 : 0)
