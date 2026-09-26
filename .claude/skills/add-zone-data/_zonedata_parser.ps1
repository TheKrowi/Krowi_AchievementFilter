# Shared parser for every ZoneData.lua under DataAddons. Dot-source it:
#   . "$PSScriptRoot\_zonedata_parser.ps1"
#   $zd = Get-ZoneDataIndex -RootDir $root
#   $maps = Get-MapReference -RootDir $root
#
# Handles every Zone() shape the builder accepts (Api/ZoneDataBuilder.lua):
#   zoneData:Zone(map, { ... })                 zoneData:Zone({map, map}, { ... })
#   zoneData:Zone(map, nil, { 10-player }, { 25-player })
#   zoneData:Zone(map, localTable)              zoneData:Zone({maps}, localTable)
# Resolves file-local tables (local delves = { ... }) recursively and the shared.* tables defined in
# DataAddons\Shared\ZoneData.lua. Lua comments are stripped before parsing.
#
# Get-ZoneDataIndex returns a hashtable:
#   Entries        list of @{ File; Line; MapIds [int[]]; DirectIds HashSet[int]; DirectList List[int] (with duplicates);
#                             TableIds HashSet[int] (from referenced tables); Ids HashSet[int] (direct + table); Unresolved [string[]] }
#   IdToFiles      achievement id -> HashSet[string] of relative file paths whose Zone() entries contain it
#   IdToMaps       achievement id -> HashSet[int] of map ids it is tagged on
#   MapToEntries   map id -> List of entries
#   SharedDefined  HashSet[int] of ids that live in shared.* tables (defined in SharedDefFile)
#   SharedDefFile  'DataAddons\Shared\ZoneData.lua'
#   Warnings       list of strings (unparseable calls, unresolved references)
#
# Get-MapReference returns @{ Names; Types; SubToPrimary; Inactive } from the MapVerifier CSVs, and
# ConvertTo-PrimaryMap maps a sub map id to its link-group primary.

function Remove-LuaComments([string] $s) { $s -replace '--[^\r\n]*', '' }

function Get-BalancedBlock([string] $Text, [int] $OpenPos, [char] $Open, [char] $Close) {
    $depth = 0; $sb = [System.Text.StringBuilder]::new(); $i = $OpenPos
    while ($i -lt $Text.Length) {
        $c = $Text[$i]
        if ($c -eq $Open) { $depth++; if ($depth -eq 1) { $i++; continue } }
        if ($c -eq $Close) { $depth--; if ($depth -eq 0) { return @{ Content = $sb.ToString(); End = $i } } }
        [void]$sb.Append($c); $i++
    }
    return @{ Content = $sb.ToString(); End = $i }
}

function Split-TopLevelArgs([string] $s) {
    $out = [System.Collections.Generic.List[string]]::new(); $d = 0; $buf = [System.Text.StringBuilder]::new()
    foreach ($ch in $s.ToCharArray()) {
        if ($ch -eq '{' -or $ch -eq '(') { $d++ }
        if ($ch -eq '}' -or $ch -eq ')') { $d-- }
        if ($ch -eq ',' -and $d -eq 0) { $out.Add($buf.ToString().Trim()); [void]$buf.Clear() } else { [void]$buf.Append($ch) }
    }
    if ($buf.ToString().Trim()) { $out.Add($buf.ToString().Trim()) }
    return $out
}

# Tokens of a Lua table body: integers and identifiers (local names or shared.X).
function Get-TableTokens([string] $body) {
    $ints = [System.Collections.Generic.List[int]]::new(); $refs = [System.Collections.Generic.List[string]]::new()
    foreach ($t in (Split-TopLevelArgs $body)) {
        if ($t -match '^\d+$') { $ints.Add([int]$t) }
        elseif ($t -match '^[A-Za-z_][\w.]*$') { $refs.Add($t) }
        elseif ($t) { $refs.Add("<expr:$t>") }
    }
    return @{ Ints = $ints; Refs = $refs }
}

function Get-ZoneDataIndex {
    param([Parameter(Mandatory)] [string] $RootDir, [string[]] $Files)

    $warnings = [System.Collections.Generic.List[string]]::new()
    $sharedDefFile = 'DataAddons\Shared\ZoneData.lua'
    $sharedTables = @{}
    $sharedRaw = Remove-LuaComments (Get-Content (Join-Path $RootDir $sharedDefFile) -Raw)
    foreach ($m in [regex]::Matches($sharedRaw, '(?m)^shared\.(\w+)\s*=\s*\{')) {
        $blk = Get-BalancedBlock $sharedRaw ($m.Index + $m.Length - 1) '{' '}'
        $sharedTables["shared.$($m.Groups[1].Value)"] = (Get-TableTokens $blk.Content).Ints
    }
    $sharedDefined = [System.Collections.Generic.HashSet[int]]::new()
    foreach ($v in $sharedTables.Values) { foreach ($i in $v) { [void]$sharedDefined.Add($i) } }

    $zoneFiles = if ($Files) { $Files | ForEach-Object { Get-Item (Join-Path $RootDir $_) } }
                 else { Get-ChildItem (Join-Path $RootDir 'DataAddons') -Recurse -Filter ZoneData.lua }

    $entries = [System.Collections.Generic.List[object]]::new()
    $idToFiles = @{}; $idToMaps = @{}; $mapToEntries = @{}

    foreach ($f in $zoneFiles) {
        $rel = $f.FullName.Substring($RootDir.Length).TrimStart('\', '/')
        $raw = Remove-LuaComments (Get-Content $f.FullName -Raw)

        # file-local tables, resolved recursively (delvesS1 -> delves -> shared.CrossExpansionDelves)
        $locals = @{}; $localRefs = @{}
        foreach ($m in [regex]::Matches($raw, '(?m)^local\s+(\w+)\s*=\s*\{')) {
            $blk = Get-BalancedBlock $raw ($m.Index + $m.Length - 1) '{' '}'
            $tok = Get-TableTokens $blk.Content
            $locals[$m.Groups[1].Value] = [System.Collections.Generic.List[int]]$tok.Ints
            $localRefs[$m.Groups[1].Value] = $tok.Refs
        }
        for ($pass = 0; $pass -lt 10; $pass++) {
            $changed = $false
            foreach ($k in @($locals.Keys)) {
                foreach ($r in $localRefs[$k]) {
                    $src = if ($locals.ContainsKey($r)) { $locals[$r] } elseif ($sharedTables.ContainsKey($r)) { $sharedTables[$r] } else { $null }
                    if ($src) { foreach ($i in @($src)) { if (-not $locals[$k].Contains($i)) { $locals[$k].Add($i); $changed = $true } } }
                }
            }
            if (-not $changed) { break }
        }
        $resolve = {
            param([string] $r)
            if ($locals.ContainsKey($r)) { return @($locals[$r]) }
            if ($sharedTables.ContainsKey($r)) { return @($sharedTables[$r]) }
            return @()
        }

        foreach ($m in [regex]::Matches($raw, 'zoneData:Zone\s*\(')) {
            $line = ([regex]::Matches($raw.Substring(0, $m.Index), "`n")).Count + 1
            $call = Get-BalancedBlock $raw ($m.Index + $m.Length - 1) '(' ')'
            $callArgs = Split-TopLevelArgs $call.Content
            if ($callArgs.Count -lt 2) { $warnings.Add("$rel`:$line Zone() call with fewer than two arguments"); continue }

            $mapIds = @()
            if ($callArgs[0] -match '^\{') { $mapIds = @(($callArgs[0] -replace '[{}]', '') -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ -match '^\d+$' } | ForEach-Object { [int]$_ }) }
            elseif ($callArgs[0] -match '^\d+$') { $mapIds = @([int]$callArgs[0]) }
            else { $warnings.Add("$rel`:$line unparseable map argument '$($callArgs[0])'"); continue }

            $direct = [System.Collections.Generic.HashSet[int]]::new()
            $directList = [System.Collections.Generic.List[int]]::new()   # keeps duplicates, for the duplicate check
            $tableIds = [System.Collections.Generic.HashSet[int]]::new()  # ids brought in through referenced tables
            $all = [System.Collections.Generic.HashSet[int]]::new()
            $unresolved = [System.Collections.Generic.List[string]]::new()
            for ($a = 1; $a -lt $callArgs.Count; $a++) {
                $arg = $callArgs[$a]
                if ($arg -eq 'nil') { continue }
                if ($arg -match '^\{') {
                    $tok = Get-TableTokens ($arg.Substring(1, $arg.Length - 2))
                    foreach ($i in $tok.Ints) { [void]$direct.Add($i); $directList.Add($i); [void]$all.Add($i) }
                    foreach ($r in $tok.Refs) { $res = & $resolve $r; if ($res.Count -eq 0) { $unresolved.Add($r) }; foreach ($i in $res) { [void]$tableIds.Add($i); [void]$all.Add($i) } }
                }
                elseif ($arg -match '^[A-Za-z_][\w.]*$') {
                    $res = & $resolve $arg; if ($res.Count -eq 0) { $unresolved.Add($arg) }; foreach ($i in $res) { [void]$tableIds.Add($i); [void]$all.Add($i) }
                }
                else { $unresolved.Add("<expr:$arg>") }
            }
            foreach ($u in ($unresolved | Select-Object -Unique)) { $warnings.Add("$rel`:$line Zone({$($mapIds -join ',')}) references '$u', which is not a local or shared.* table") }

            $entry = [pscustomobject]@{ File = $rel; Line = $line; MapIds = [int[]]$mapIds; DirectIds = $direct; DirectList = $directList; TableIds = $tableIds; Ids = $all; Unresolved = [string[]]$unresolved }
            $entries.Add($entry)
            foreach ($mid in $mapIds) {
                if (-not $mapToEntries.ContainsKey($mid)) { $mapToEntries[$mid] = [System.Collections.Generic.List[object]]::new() }
                $mapToEntries[$mid].Add($entry)
            }
            foreach ($i in $all) {
                if (-not $idToFiles.ContainsKey($i)) { $idToFiles[$i] = [System.Collections.Generic.HashSet[string]]::new() }
                [void]$idToFiles[$i].Add($rel)
                if (-not $idToMaps.ContainsKey($i)) { $idToMaps[$i] = [System.Collections.Generic.HashSet[int]]::new() }
                foreach ($mid in $mapIds) { [void]$idToMaps[$i].Add($mid) }
            }
        }
    }

    return @{
        Entries = $entries; IdToFiles = $idToFiles; IdToMaps = $idToMaps; MapToEntries = $mapToEntries
        SharedDefined = $sharedDefined; SharedDefFile = $sharedDefFile; Warnings = $warnings
    }
}

# Reads raw\MapVerifier.csv (the canonical Map Verifier state, see .claude\skills\sync-mapverifier\SKILL.md).
#   Names        map id -> name                      Types      map id -> verdict ('' when unreviewed; a linked
#   SubToPrimary sub map id -> primary map id                     sub-zone reports its primary's verdict)
#   Inactive     HashSet of map ids whose verdict is TaxiAndAdventure, Error or StartingZone (must not be in ZoneData)
#   SkipLike     HashSet of map ids never shown on the world map (Inactive plus Skip)
#   MapType      map id -> numeric C_Map type, Parent map id -> parentMapID (game-derived, may be empty)
function Get-MapReference {
    param([Parameter(Mandatory)] [string] $RootDir)
    . (Join-Path $RootDir '.claude\skills\sync-mapverifier\_mapverifier_io.ps1')
    $read = Read-MapVerifierCsv (Join-Path $RootDir 'raw\MapVerifier.csv')
    if ($read.Errors.Count -gt 0) { throw "raw\MapVerifier.csv: $($read.Errors[0])" }
    $names = @{}; $types = @{}; $mapType = @{}; $parent = @{}; $subToPrimary = @{}
    $inactive = [System.Collections.Generic.HashSet[int]]::new(); $skipLike = [System.Collections.Generic.HashSet[int]]::new()
    foreach ($r in $read.Rows) {
        $id = [int]$r.id
        $names[$id] = $r.name; $types[$id] = $r.verdict; $mapType[$id] = $r.mapType; $parent[$id] = $r.parentMapID
        if ($r.link -ne '') { $subToPrimary[$id] = [int]$r.link }
    }
    foreach ($r in $read.Rows) {
        $id = [int]$r.id
        $v = $r.verdict
        if ($v -eq '' -and $subToPrimary.ContainsKey($id)) { $v = $types[$subToPrimary[$id]]; $types[$id] = $v }
        if ($v -in $MapVerifierInactiveLike) { [void]$inactive.Add($id) }
        if ($v -in $MapVerifierSkipLike) { [void]$skipLike.Add($id) }
    }
    return @{ Names = $names; Types = $types; SubToPrimary = $subToPrimary; Inactive = $inactive; SkipLike = $skipLike; MapType = $mapType; Parent = $parent }
}

function ConvertTo-PrimaryMap([hashtable] $MapRef, [int] $MapId) {
    if ($MapRef.SubToPrimary.ContainsKey($MapId)) { $MapRef.SubToPrimary[$MapId] } else { $MapId }
}
