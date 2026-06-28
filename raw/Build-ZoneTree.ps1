# Build-ZoneTree.ps1
# Fetches all UiMap entries from wow.tools.local and outputs a hierarchical zone tree.
# The tree is organized by expansion (based on continent parent) and outputs a
# reference Lua file that can be used to structure ZoneData files.

param(
    [string]$Build = "12.0.7.68275",
    [string]$OutputFile = "$PSScriptRoot\ZoneTree.md"
)

Write-Host "Fetching UiMap data for build $Build..."
$resp = Invoke-WebRequest "http://localhost:5000/dbc/data/uimap/?build=$Build" `
    -Method POST `
    -Body "draw=1&start=0&length=2000" `
    -ContentType "application/x-www-form-urlencoded" `
    -UseBasicParsing
$json = $resp.Content | ConvertFrom-Json

# Parse records: [0]=Name, [1]=ID, [2]=ParentUiMapID, [3]=Flags?, [4]=?, [5]=UiMapType
# UiMapType: 0=Cosmic, 1=World, 2=Continent, 3=Zone, 4=Dungeon, 5=Micro, 6=Orphan
$all = $json.data | ForEach-Object {
    [PSCustomObject]@{
        Name     = [System.Web.HttpUtility]::HtmlDecode($_[0])
        ID       = [int]$_[1]
        ParentID = [int]$_[2]
        Type     = [int]$_[5]
    }
}

Write-Host "Total UiMap entries: $($all.Count)"

# Build lookup and children map
$byId = @{}
foreach ($m in $all) { $byId[$m.ID] = $m }

$children = @{}
foreach ($m in $all) {
    if ($m.ParentID -gt 0) {
        if (-not $children[$m.ParentID]) { $children[$m.ParentID] = [System.Collections.Generic.List[object]]::new() }
        [void]$children[$m.ParentID].Add($m)
    }
}

# Find canonical nodes reachable from Cosmic root (ID 946)
$canonical = [System.Collections.Generic.HashSet[int]]::new()
$queue = [System.Collections.Generic.Queue[int]]::new()
$queue.Enqueue(946)
while ($queue.Count -gt 0) {
    $id = $queue.Dequeue()
    if ($canonical.Add($id)) {
        foreach ($child in ($children[$id] ?? @())) { $queue.Enqueue($child.ID) }
    }
}
Write-Host "Canonical nodes (reachable from Cosmic): $($canonical.Count)"

# Map continent IDs to expansion names.
# Note: This maps by GEOGRAPHIC continent parent, not necessarily when zone content was introduced.
# e.g., Eversong Woods (TBC) is under Eastern Kingdoms (Vanilla continent) → assigned to Vanilla here.
# The "By Expansion" tables should be treated as geographic groupings, not strict expansion gates.
$expansionByContinent = @{
    12   = "01_Vanilla"              # Kalimdor
    13   = "01_Vanilla"              # Eastern Kingdoms
    101  = "02_TheBurningCrusade"    # Outland
    113  = "03_WrathOfTheLichKing"   # Northrend
    424  = "05_MistsOfPandaria"      # Pandaria
    572  = "06_WarlordsOfDraenor"    # Draenor
    619  = "07_Legion"               # Broken Isles
    875  = "08_BattleForAzeroth"     # Zandalar
    876  = "08_BattleForAzeroth"     # Kul Tiras
    905  = "07_Legion"               # Argus (under Broken Isles)
    948  = "04_Cataclysm"            # The Maelstrom
    1355 = "08_BattleForAzeroth"     # Nazjatar (BfA 8.2 — direct child of Azeroth world)
    1550 = "09_Shadowlands"          # The Shadowlands
    1978 = "10_Dragonflight"         # Dragon Isles
    2274 = "11_TheWarWithin"         # Khaz Algar
    2366 = "05_MistsOfPandaria"      # The Wandering Isle (Pandaren starting zone)
    2537 = "12_Midnight"             # Quel'Thalas (under EK)
}

$typeNames = @{0="Cosmic"; 1="World"; 2="Continent"; 3="Zone"; 4="Dungeon"; 5="Micro"; 6="Orphan"}

# Recursive tree builder
function Build-Tree {
    param($nodeId, $indent, $lines, $expansionsByNode)

    $m = $byId[$nodeId]
    if (-not $m) { return }

    # Determine expansion label
    $expLabel = ""
    if ($expansionsByNode[$nodeId]) { $expLabel = " [[$($expansionsByNode[$nodeId])]]" }

    $typeName = $typeNames[$m.Type] ?? "Unknown($($m.Type))"
    $lines.Add("$indent- **$($m.Name)** (ID: $nodeId, Type: $typeName)$expLabel")

    # Sort children: Continents and Zones first (type 2,3), then others
    $kids = $children[$nodeId] ?? @()
    $sorted = @($kids | Sort-Object { $_.Type }, { $_.Name })
    foreach ($child in $sorted) {
        if ($canonical.Contains($child.ID)) {
            Build-Tree -nodeId $child.ID -indent "$indent  " -lines $lines -expansionsByNode $expansionsByNode
        }
    }
}

# Assign expansions to all nodes by walking up to find continent ancestor
$expansionsByNode = @{}
foreach ($m in $all) {
    if (-not $canonical.Contains($m.ID)) { continue }
    # Walk up to find continent
    $cur = $m.ID
    $visited = @{}
    while ($cur -gt 0 -and -not $visited[$cur]) {
        $visited[$cur] = $true
        if ($expansionByContinent[$cur]) {
            $expansionsByNode[$m.ID] = $expansionByContinent[$cur]
            break
        }
        $cur = if ($byId[$cur]) { $byId[$cur].ParentID } else { 0 }
    }
}

# Generate output organized by expansion
$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add("# WoW UI Map Zone Tree")
$lines.Add("")
$lines.Add("Generated from build $Build — $(Get-Date -Format 'yyyy-MM-dd')")
$lines.Add("")
$lines.Add("**UiMapType values:** 0=Cosmic, 1=World, 2=Continent, 3=Zone, 4=Dungeon, 5=Micro, 6=Orphan")
$lines.Add("")
$lines.Add("---")
$lines.Add("")

# Section: Full tree from Cosmic root (only type 0,1,2,3 = structural zones)
$noteLines = @(
    '> **Note:** The "Zones by Expansion" tables group zones by their *geographic continent parent*, not necessarily',
    '> when zone content was introduced. For example, Eversong Woods (added in TBC) sits under the Eastern Kingdoms',
    '> continent (Vanilla), so it appears under Vanilla here. Zones like Uldum, Tol Barad, and Vashj''ir are',
    '> geographically under Classic continents but were introduced in Cataclysm.'
)
foreach ($nl in $noteLines) { $lines.Add($nl) }
$lines.Add("")
$lines.Add("## Full Structural Tree (Cosmic → World → Continent → Zone)")
$lines.Add("")
$lines.Add("Only Cosmic (0), World (1), Continent (2), and Zone (3) type nodes are shown.")
$lines.Add("")

function Build-StructuralTree {
    param($nodeId, $indent, $lines)

    $m = $byId[$nodeId]
    if (-not $m) { return }
    if ($m.Type -notin @(0,1,2,3)) { return }

    $expLabel = if ($expansionByContinent[$nodeId]) { " — **$($expansionByContinent[$nodeId])**" } else { "" }
    $typeName = $typeNames[$m.Type]
    $lines.Add("$indent- ``$nodeId`` **$($m.Name)**$expLabel")

    $kids = ($children[$nodeId] ?? @()) | Where-Object { $canonical.Contains($_.ID) -and $_.Type -in @(0,1,2,3) } | Sort-Object Type, Name
    foreach ($child in $kids) {
        Build-StructuralTree -nodeId $child.ID -indent "$indent  " -lines $lines
    }
}

Build-StructuralTree -nodeId 946 -indent "" -lines $lines

$lines.Add("")
$lines.Add("---")
$lines.Add("")

# Section: Per-expansion zone lists (Type 3 only, grouped by continent)
$lines.Add("## Zones by Expansion (Type 3 only)")
$lines.Add("")

$expansionOrder = @(
    @{ Key="01_Vanilla"; Label="Vanilla (Classic)" }
    @{ Key="04_Cataclysm"; Label="Cataclysm (revamped world)" }
    @{ Key="02_TheBurningCrusade"; Label="The Burning Crusade" }
    @{ Key="03_WrathOfTheLichKing"; Label="Wrath of the Lich King" }
    @{ Key="05_MistsOfPandaria"; Label="Mists of Pandaria" }
    @{ Key="06_WarlordsOfDraenor"; Label="Warlords of Draenor" }
    @{ Key="07_Legion"; Label="Legion" }
    @{ Key="08_BattleForAzeroth"; Label="Battle for Azeroth" }
    @{ Key="09_Shadowlands"; Label="Shadowlands" }
    @{ Key="10_Dragonflight"; Label="Dragonflight" }
    @{ Key="11_TheWarWithin"; Label="The War Within" }
    @{ Key="12_Midnight"; Label="Midnight" }
)

foreach ($exp in $expansionOrder) {
    $lines.Add("### $($exp.Label) (``$($exp.Key)``)")
    $lines.Add("")
    $lines.Add("| Zone ID | Zone Name | Continent ID | Continent Name |")
    $lines.Add("|---------|-----------|-------------|----------------|")

    $zones = $all | Where-Object {
        $_.Type -eq 3 -and
        $canonical.Contains($_.ID) -and
        $expansionsByNode[$_.ID] -eq $exp.Key
    } | Sort-Object { if ($byId[$_.ParentID]) { $byId[$_.ParentID].Name } else { "" } }, Name

    foreach ($z in $zones) {
        $continent = $byId[$z.ParentID]
        $continentName = if ($continent) { $continent.Name } else { "?" }
        $continentId = $z.ParentID
        $lines.Add("| $($z.ID) | $($z.Name) | $continentId | $continentName |")
    }

    if (-not $zones) {
        $lines.Add("| — | *(none)* | — | — |")
    }
    $lines.Add("")
}

# Zones with no expansion assigned
$unassigned = $all | Where-Object {
    $_.Type -eq 3 -and
    $canonical.Contains($_.ID) -and
    -not $expansionsByNode[$_.ID]
} | Sort-Object Name

if ($unassigned) {
    $lines.Add("### Unassigned / Special Zones")
    $lines.Add("")
    $lines.Add("| Zone ID | Zone Name | Parent ID | Parent Name |")
    $lines.Add("|---------|-----------|-----------|-------------|")
    foreach ($z in $unassigned) {
        $parent = $byId[$z.ParentID]
        $parentName = if ($parent) { $parent.Name } else { "?" }
        $lines.Add("| $($z.ID) | $($z.Name) | $($z.ParentID) | $parentName |")
    }
    $lines.Add("")
}

$output = $lines -join "`n"
Set-Content -Path $OutputFile -Value $output -Encoding UTF8
Write-Host "Written to: $OutputFile"
Write-Host "Lines: $($lines.Count)"
