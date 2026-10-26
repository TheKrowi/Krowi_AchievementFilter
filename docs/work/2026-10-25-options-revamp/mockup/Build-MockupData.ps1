param(
    [Parameter(Mandatory)] [string] $Tree,
    [Parameter(Mandatory)] [string] $Out
)
# Builds the options mockup's data from the real options tree, regrouped by feature.
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

function Resolve([string] $path) {
    $slice = $null
    if ($path.Contains('#')) { $parts = $path -split '#', 2; $path = $parts[0]; $slice = $parts[1] }
    $node = $t
    foreach ($seg in ($path -split ' > ')) { $node = Find-Child $node $seg }
    @{ node = $node; slice = $slice }
}

function Leaves([string] $path) {
    $r = Resolve $path
    $kids = @($r.node.children)
    if ($null -eq $r.slice) { return @($kids | Where-Object { $_.type -ne 'group' -and $_.type -ne 'header' }) }
    $list = @(); $in = ($r.slice -eq '')
    foreach ($k in $kids) {
        if ($k.type -eq 'header') { $in = ($r.slice -ne '' -and $k.name -eq $r.slice); continue }
        if ($in -and $k.type -ne 'group') { $list += $k }
    }
    $list
}

function Clean([string] $desc) {
    if (-not $desc) { return @('', $false) }
    $reload = $desc -match 'Requires a reload|\{reloadRequired\}'
    $s = $desc -replace '\{reloadRequired\}', '' -replace 'Requires a reload to take full effect\.?', '' -replace 'Default value: [^\n]*', ''
    $s = ($s -replace '\r', '' -replace '\n{3,}', "`n`n").Trim()
    @($s, $reload)
}

$script:ids = @{}
function New-Id([string] $sec, [string] $key) {
    $base = "$sec." + ($key -replace '[^A-Za-z0-9]', '')
    $id = $base; $n = 2
    while ($script:ids.ContainsKey($id)) { $id = "$base$n"; $n++ }
    $script:ids[$id] = $true
    $id
}

function New-Opt([string] $sec, $node, $ov) {
    $type = if ($node.type -eq 'keybinding') { 'key' } else { $node.type }
    $c = Clean $node.desc
    $o = [ordered]@{ id = (New-Id $sec $node.key); type = $type; label = $node.name; desc = $c[0] }
    if ($c[1]) { $o.reload = $true }
    if ($null -ne $node.default) { $o.def = $node.default }
    elseif ($type -eq 'toggle') { $o.def = $false }
    elseif ($type -in 'input', 'key', 'select') { $o.def = '' }
    if ($type -eq 'range') { $o.min = $node.min; $o.max = $node.max; $o.step = $node.step }
    if ($node.values) { $o.values = @($node.values | ForEach-Object { , @($_.key, $_.text) }) }
    if ($node.retailOnly) { $o.retail = $true }
    $o.srcKey = $node.key; $o.srcDis = $node.disabledBy; $o.srcWhen = $node.disabledWhen
    if ($ov) { foreach ($k in @($ov.Keys)) { if ($k -notin 'p', 'from', 'parentP') { $o[$k] = $ov[$k] } } }
    if ($ov -and $ov.parentP) { $o.srcParentKey = (Resolve $ov.parentP).node.key }
    $o
}

# Turns a list of leaves into rows: a description followed by key bindings becomes one key row.
function Rows-From([string] $sec, $leaves, $ov) {
    $rows = @(); $notes = @(); $i = 0
    while ($i -lt $leaves.Count) {
        $n = $leaves[$i]
        if ($n.type -eq 'execute' -and $n.name -in 'Select All', 'Deselect All') { $i++; continue }
        if ($n.type -eq 'description') {
            if ($i + 1 -lt $leaves.Count -and $leaves[$i + 1].type -eq 'keybinding') {
                $o = New-Opt $sec $leaves[$i + 1] $ov
                $o.label = $n.name; $o.keys = 2
                $rows += $o; $i += 2
                while ($i -lt $leaves.Count -and $leaves[$i].type -eq 'keybinding') { $i++ }
                continue
            }
            if ($n.name) { $notes += $n.name }
            $i++; continue
        }
        $rows += (New-Opt $sec $n $ov); $i++
    }
    @{ rows = $rows; notes = $notes }
}

function Build-Group([string] $sec, $g) {
    if ($g.kind -eq 'matrix') {
        $grp = [ordered]@{ header = $g.header; kind = 'matrix'; cols = $g.cols; rows = @() }
        if ($g.note) { $grp.note = $g.note }
        foreach ($r in $g.rows) {
            $cells = @(Leaves $r.from | Where-Object { $_.type -eq 'toggle' } | ForEach-Object { New-Opt $sec $_ $null })
            foreach ($c in $cells) { $c.label = $r.label + ': ' + $c.label; $c.srcDis = $null }
            if ($g.chain) { for ($k = 1; $k -lt $cells.Count; $k++) { $cells[$k].parent = $cells[0].id } }
            $grp.rows += [ordered]@{ id = (New-Id $sec ('mx' + $r.label)); label = $r.label; desc = $r.desc; cells = $cells }
        }
        return $grp
    }
    if ($g.kind -eq 'order') {
        $grp = [ordered]@{ header = $g.header; kind = 'order'; items = @() }
        if ($g.note) { $grp.note = $g.note }
        foreach ($it in $g.items) {
            $o = New-Opt $sec (Resolve $it.p).node @{ label = $it.label; desc = $it.desc }
            $grp.items += [ordered]@{ key = $it.key; src = $it.src; show = $o }
        }
        return $grp
    }
    $grp = [ordered]@{ header = $g.header; options = @() }
    $notes = @()
    foreach ($it in $g.items) {
        $ov = if ($it -is [hashtable]) { $it } else { @{ p = $it } }
        if ($ov.families) {
            foreach ($fam in @((Resolve $ov.families).node.children)) {
                $toggles = @($fam.children | Where-Object { $_.type -eq 'toggle' })
                if ($toggles.Count -eq 1 -and $toggles[0].name -eq $fam.name) { $grp.options += (New-Opt $sec $toggles[0] $null); continue }
                $opts = @(); $n = 1
                foreach ($tg in $toggles) {
                    $o = New-Opt $sec $tg @{ indent = 1 }
                    if ($tg.name -eq $fam.name) { $o.label = ($fam.name -replace 's$', '') + " $n" }
                    $n++; $opts += $o
                }
                $grp.options += [ordered]@{ id = (New-Id $sec ('sub' + $fam.name)); type = 'sub'; label = $fam.name; members = @($opts | ForEach-Object { $_.id }) }
                $grp.options += $opts
            }
        } elseif ($ov.from) {
            $res = Rows-From $sec @(Leaves $ov.from) $ov
            $grp.options += $res.rows; $notes += $res.notes
        } else {
            $grp.options += (New-Opt $sec (Resolve $ov.p).node $ov)
        }
    }
    if ($g.lockAll) { foreach ($o in $grp.options) { $o.locked = $true } }
    if ($g.Contains('defAll')) { foreach ($o in $grp.options) { if ($o.type -eq 'toggle') { $o.def = $g.defAll } } }
    foreach ($o in $grp.options) { if ($o.label -eq 'Loaded') { $o.locked = $true } }
    if ($g.devNames) {
        $switch = $grp.options | Where-Object { $_.label -eq $g.devSwitch } | Select-Object -First 1
        foreach ($o in $grp.options) { if ($o.label -in $g.devNames) { $o.dev = $true; $o.showIf = $switch.id } }
    }
    if ($g.allNone) {
        $members = @($grp.options | Where-Object { $_.type -eq 'toggle' } | ForEach-Object { $_.id })
        $grp.options = @([ordered]@{ id = (New-Id $sec ('sub' + $g.header)); type = 'sub'; label = $g.allNone; members = $members }) + $grp.options
    }
    if ($g.note) { $grp.note = $g.note }
    elseif ($g.notesFromTree -and $notes.Count) { $grp.note = ($notes -join $g.joiner) }
    $grp
}

function Resolve-Parents($section) {
    $all = @()
    foreach ($g in $section.groups) {
        if ($g.kind -eq 'matrix') { foreach ($r in $g.rows) { $all += $r.cells } }
        elseif ($g.kind -eq 'order') { foreach ($it in $g.items) { $all += $it.show } }
        else { $all += $g.options }
    }
    foreach ($o in $all) {
        $want = $null; $inv = $false
        if ($o.srcParentKey) { $want = $o.srcParentKey }
        elseif ($o.srcDis -and -not $o.Contains('parent')) {
            $want = ((($o.srcDis -split ',')[0]).Trim() -split '\.')[-1]
            $inv = -not ("$($o.srcWhen)" -match '^\s*not ')
        }
        if ($want) {
            $p = $all | Where-Object { $_.srcKey -eq $want -and $_.id -ne $o.id } | Select-Object -First 1
            if ($p) {
                $o.parent = $p.id
                if ($inv) { $o.inv = $true }
                if (-not $o.Contains('indent')) { $o.indent = 1 }
            }
        }
    }
    foreach ($o in $all) { foreach ($k in 'srcKey', 'srcDis', 'srcWhen', 'srcParentKey') { $o.Remove($k) } }
}

. (Join-Path $PSScriptRoot 'MockupSpec.ps1')

$sections = @()
foreach ($s in $spec.sections) {
    $sec = [ordered]@{ id = $s.id; name = $s.name }
    foreach ($k in 'summary', 'tile', 'isNew', 'explain', 'explainFull', 'showMe', 'showMeNote', 'alt') { if ($s.Contains($k)) { $sec[$k] = $s[$k] } }
    $sec.groups = @($s.groups | ForEach-Object { Build-Group $s.id $_ })
    Resolve-Parents $sec
    $sections += $sec
}

$data = [ordered]@{
    intro = $spec.intro; changelog = $spec.changelog; img = $spec.img
    nav = $spec.nav; tabOrder = $spec.tabOrder
    sections = $sections
}
$json = $data | ConvertTo-Json -Depth 30 -Compress
[IO.File]::WriteAllText($Out, $json, (New-Object Text.UTF8Encoding $false))
"{0} sections, {1:N0} chars" -f $sections.Count, $json.Length
foreach ($s in $sections) {
    $n = 0
    foreach ($g in $s.groups) { if ($g.kind -eq 'matrix') { foreach ($r in $g.rows) { $n += $r.cells.Count } } elseif ($g.kind -eq 'order') { $n += $g.items.Count } else { $n += $g.options.Count } }
    "  {0,-14} {1,3} options in {2} groups" -f $s.id, $n, $s.groups.Count
}