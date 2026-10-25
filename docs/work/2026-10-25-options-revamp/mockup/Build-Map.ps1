param(
    [Parameter(Mandatory)] [string] $Tree,
    [Parameter(Mandatory)] [string] $Out
)
# One-off: writes the first version of Options/Window/Map.lua from MockupSpec.ps1, with the display-name paths of the
# spec turned into the AceConfig key paths of the options tree (merge.lua's options-tree.json). Edited by hand after.
$ErrorActionPreference = 'Stop'
$t = Get-Content -Raw $Tree | ConvertFrom-Json

function Find-Child($node, [string] $seg) {
    $idx = 1
    if ($seg -match '^(.*)\[(\d+)\]$') { $seg = $Matches[1]; $idx = [int] $Matches[2] }
    $kids = if ($node -is [array]) { $node } else { @($node.children) }
    $hits = @($kids | Where-Object { if ($seg.StartsWith('@')) { $_.key -eq $seg.Substring(1) } else { $_.name -eq $seg } })
    if ($hits.Count -lt $idx) { throw "Not found: '$seg'" }
    $hits[$idx - 1]
}

# name path -> @{ Path = 'Page.args.A.args.B'; Header = '<header key>' or $null; Node }
function Resolve([string] $path) {
    $slice = $null
    if ($path.Contains('#')) { $parts = $path -split '#', 2; $path = $parts[0]; $slice = $parts[1] }
    $node = $t; $keys = @()
    foreach ($seg in ($path -split ' > ')) { $node = Find-Child $node $seg; $keys += $node.key }
    $header = $null
    if ($null -ne $slice) {
        if ($slice -eq '') { $header = '' }
        else { $header = (@($node.children) | Where-Object { $_.type -eq 'header' -and $_.name -eq $slice } | Select-Object -First 1).key }
        if ($null -eq $header) { throw "Header '$slice' not found under $path" }
    }
    @{ Path = ($keys -join '.args.'); Header = $header; Node = $node }
}

$script:strings = [ordered]@{}
function L([string] $s) { $script:strings[$s] = $true; 'L["' + ($s -replace '"', '\"') + '"]' }
function Q([string] $s) { '"' + ($s -replace '"', '\"') + '"' }

. (Join-Path $PSScriptRoot 'MockupSpec.ps1')

$lines = New-Object System.Collections.Generic.List[string]
function Emit([string] $s) { $lines.Add($s) }

function Emit-Entry($it, [string] $ind) {
    $ov = if ($it -is [hashtable]) { $it } else { @{ p = $it } }
    $fields = @()
    if ($ov.families) { $r = Resolve $ov.families; $fields += 'Families = ' + (Q $r.Path) }
    elseif ($ov.from) {
        $r = Resolve $ov.from
        $fields += 'Group = ' + (Q $r.Path)
        if ($null -ne $r.Header) { $fields += 'Header = ' + (Q $r.Header) }
    } else { $r = Resolve $ov.p; $fields += 'Path = ' + (Q $r.Path) }
    $optionKids = @($r.Node.children | Where-Object { $_ -and $_.type -ne 'header' -and $_.type -ne 'description' })
    $retailOnly = $r.Node.retailOnly -or ($optionKids.Count -gt 0 -and -not @($optionKids | Where-Object { -not $_.retailOnly }).Count)
    if ($retailOnly) { $fields += 'Retail = true' }
    if ($ov.label) { $fields += 'Label = ' + (L $ov.label) }
    if ($ov.btn) { $fields += 'Button = ' + (L $ov.btn) }
    if ($ov.Contains('indent')) { $fields += 'Indent = ' + $ov.indent }
    if ($ov.parentP) { $fields += 'Parent = ' + (Q (Resolve $ov.parentP).Path) }
    if ($ov.placeholder) { $fields += 'Placeholder = ' + (L $ov.placeholder) }
    Emit ($ind + '{ ' + ($fields -join ', ') + ' },')
}

Emit 'local _, addon = ...'
Emit 'local L = addon.L'
Emit ''
Emit '-- Where every AceConfig option of the six option pages shows in the options window, per feature section'
Emit '-- (docs/work/2026-10-25-options-revamp). Paths are AceConfig key paths into addon.Options.OptionsTable, the form'
Emit '-- InjectOptions uses. An entry is a Path (one option), a Group (every option of a group, or with Header the ones'
Emit '-- under that header; "" = before the first header), or Families (each child group, a heading with All/None).'
Emit '-- The options suite (Tests/Options.lua) fails when an option is unmapped or mapped twice.'
Emit 'addon.Options.Window = addon.Options.Window or {}'
Emit 'addon.Options.Window.Map = {'
Emit '    Groups = {'
foreach ($g in $spec.nav) {
    Emit ('        { Name = ' + (L $g.name) + ', Tiles = ' + ($(if ($g.tiles) { 'true' } else { 'false' })) + ', Sections = { ' + (($g.ids | ForEach-Object { Q $_ }) -join ', ') + ' } },')
}
Emit '    },'
Emit '    Sections = {'
foreach ($s in $spec.sections) {
    if ($s.id -eq 'overview') { continue }
    $head = '        { Id = ' + (Q $s.id) + ', Name = ' + (L $s.name)
    if ($s.tile) { $head += ', Tile = ' + (Q $s.tile) }
    if ($s.isNew) { $head += ', ChangedIn = "104.0"' }
    Emit ($head + ', Groups = {')
    foreach ($g in $s.groups) {
        $gh = '            { Header = ' + (L $g.header)
        if ($g.note) { $gh += ', Note = ' + (L $g.note) }
        if ($g.allNone) { $gh += ', AllNone = ' + (L $g.allNone) }
        if ($g.kind -eq 'matrix') {
            $gh += ', Kind = "Grid"'
            if ($g.chain) { $gh += ', Chain = true' }
            $gh += ', Columns = { ' + (($g.cols | ForEach-Object { L ($_ -replace "­", '') }) -join ', ') + ' }'
            Emit ($gh + ', Rows = {')
            foreach ($r in $g.rows) {
                $res = Resolve $r.from
                $row = '                { Label = ' + (L $r.label) + ', Group = ' + (Q $res.Path)
                if ($null -ne $res.Header) { $row += ', Header = ' + (Q $res.Header) }
                Emit ($row + ' },')
            }
            Emit '            } },'
            continue
        }
        if ($g.kind -eq 'order') {
            Emit ($gh + ', Kind = "TabList", Entries = {')
            foreach ($it in $g.items) {
                $src = if ($it.src) { ', Source = ' + (L $it.src) } else { '' }
                Emit ('                { Key = ' + (Q $it.key) + $src + ', Path = ' + (Q (Resolve $it.p).Path) + ' },')
            }
            Emit '            } },'
            continue
        }
        if ($s.id -eq 'profiles') {
            $db = if ($g.header -like 'Filters*') { 'Filters' } else { 'Options' }
            Emit ($gh + ', Kind = "Profiles", Database = ' + (Q $db) + ' },')
            continue
        }
        if ($s.id -eq 'plugins') { continue }
        Emit ($gh + ', Entries = {')
        $devPaths = @{}
        if ($g.devNames) {
            $groupPath = (Resolve $g.items[0].from).Path
            $switch = $null
            foreach ($child in @((Resolve $g.items[0].from).Node.children)) {
                if ($child.name -eq $g.devSwitch) { $switch = "$groupPath.args.$($child.key)" }
            }
            foreach ($child in @((Resolve $g.items[0].from).Node.children)) {
                $p = "$groupPath.args.$($child.key)"
                if ($child.type -eq 'description') { continue }
                $f = 'Path = ' + (Q $p)
                if ($child.name -in $g.devNames) { $f += ', ShowIf = ' + (Q $switch) }
                Emit ('                { ' + $f + ' },')
            }
        } else {
            foreach ($it in $g.items) { Emit-Entry $it '                ' }
        }
        Emit '            } },'
    }
    if ($s.id -eq 'plugins') { Emit '            { Kind = "EachChild", Group = "Plugins" },' }
    Emit '        } },'
}
Emit '    },'
Emit '}'

$text = ($lines -join "`r`n")
[IO.File]::WriteAllText($Out, $text, (New-Object Text.UTF8Encoding $false))
"wrote {0} lines; strings used:" -f $lines.Count
$script:strings.Keys | Sort-Object | ForEach-Object { "  $_" }