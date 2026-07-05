---
name: add-zone-data
description: Add achievement IDs to the correct ZoneData.lua entries in Krowi's Achievement Filter. Covers all entry types (zone, dungeon, raid, delve, battleground), map ID lookup via MapVerifier CSVs and wow.tools.local, and autonomous self-validation via Evaluate-ZoneData.ps1. Use when adding achievements to existing zone entries, creating new zone entries, or after add-achievement-data produces new IDs that need zone coverage.
---

# Add Zone Data

Maps achievement IDs to in-game zone/map IDs in `DataAddons/Retail/XX_ExpansionName/ZoneData.lua`.
When a player opens the world map on a zone, the addon surfaces the achievements registered for that map ID.

## Core Rules

### File location
One ZoneData.lua per expansion — **never split by patch**:
```
DataAddons/Retail/XX_ExpansionName/ZoneData.lua
DataAddons/Shared/XX_ExpansionName/ZoneData.lua   ← used for Retail+Classic shared data
DataAddons/Shared/ZoneData.lua                     ← cross-expansion data (Brawler's Guild, delve base tables)
```

### File header
```lua
local _, addon = ...
local shared = addon.Data.ZoneData.Shared
```
Only reference `shared` if you actually use `shared.OldWorldPetAchievements` or `shared.CrossExpansionDelves`.

### Builder API
```lua
local zoneData = KrowiAF.NewZoneData("ExpansionName")  -- once per file

zoneData:Zone(mapId, { achievementIds })
zoneData:Zone({mapId1, mapId2, ...}, { achievementIds })
```

---

## Map ID Selection

**Valid map IDs are ONLY those in `raw/MapVerifier_ActiveZones.csv`.**  
Map IDs in `raw/MapVerifier_InactiveZones.csv` are explicitly excluded — never add them to ZoneData.

### Finding the right map ID

The four `raw/MapVerifier_*.csv` files are structured exports of this repo's own data — they are not authoritative game sources. `MapVerifier_ZonesPerAchievement.csv` only reflects zones where achievements are *already* registered in ZoneData; it tells you nothing about where a new achievement should go.

To find the correct map ID for a new achievement:

1. **Derive it from the achievement name/context** — "Heroic: Ara-Kara" → look up "Ara-Kara" in `raw/MapVerifier_ActiveZones.csv` by the `name` column to get its `id`.
2. **Confirm the ID is in ActiveZones** (not InactiveZones) before using it.
3. **For linked sub-zones** (e.g. dungeon wings) check `raw/MapVerifier_LinkGroups.csv` — use the primary ID.
4. **Only for brand-new content** not yet in any CSV, query wow.tools.local:
   ```powershell
   $j = (Invoke-WebRequest "http://localhost:5000/dbc/data/uimap/?build=12.0.7.68275" `
         -Method POST -Body "draw=1&start=0&length=20&search[value]=ZoneName" `
         -ContentType "application/x-www-form-urlencoded" -UseBasicParsing).Content | ConvertFrom-Json
   $j.data | ForEach-Object { "$($_[1]) T$($_[5]) $($_[0])" }
   # UiMapType: 3=Zone, 4=Dungeon/Raid — only use these
   ```

### When zone placement isn't obvious

If the achievement name alone doesn't make the zone clear, look up the achievement's title and description:

- **wow.tools.local** — query the achievement table by ID for `Title_lang` (col 1) and `Description_lang` (col 0). See [verify-achievement-data API.md](../verify-achievement-data/API.md) for the query pattern.
- **Wowhead** — `https://www.wowhead.com/achievement=ID` — provides full description, criteria, and community notes that often clarify the location.

If placement is still ambiguous after these lookups, **stop and ask the user**.

---

## Entry Types and Their Content Rules

### Zone entry
**Map IDs:** The zone's primary map ID. Sub-zones listed in LinkGroups are covered via the primary.

**Include:**
- Zone meta: Sojourner, Explore [Zone], Adventurer of [Zone], Treasures of [Zone], Tour of Duty
- Dragonflight+: Glyph Hunter, Skyriding racing achievements
- Zone faction/rep achievements, zone-specific quest chain completions and feats
- Cross-expansion meta (Loremaster, Explorer, Squirrels, Diplomat, Pathfinder) — either repeat in every zone entry (older pattern) or inject via a shared local table (newer pattern, preferred)

**Do NOT include:** dungeon/raid/delve achievements, even if the instance is geographically inside the zone.

**Example (new expansion, shared local table):**
```lua
local quelThalas = {
    62110, -- Loremaster of Midnight
    42045, -- Midnight
    61859, -- Midnight Flight Master
    ...
}

zoneData:Zone({2395, 2579}, { -- Eversong Woods (zone)
    62044, -- Sojourner of Eversong Woods
    62059, -- Explore Eversong Woods
    ...
    quelThalas,
})
```

---

### Dungeon entry
**Map IDs:** Primary dungeon map ID. Use `{primary, wing1, wing2}` if the dungeon has multiple floors in ActiveZones.

**Include ONLY:**
- Normal/Heroic/Mythic clear achievements
- Keystone Hero (when the dungeon is a M+ key)
- Keystone Victor (when added as M+ key in a later season)
- Boss-specific feats and mechanics achievements

**Do NOT include:** zone-wide or expansion-wide achievements.

```lua
zoneData:Zone({2357, 2358}, { -- Ara-Kara, City of Echoes (dungeon)
    40370, -- Ara-Kara, City of Echoes
    40374, -- Heroic: Ara-Kara, City of Echoes
    40375, -- Mythic: Ara-Kara, City of Echoes
    20586, -- Keystone Hero: Ara-Kara, City of Echoes
})
```

---

### Raid entry
**Map IDs:** `{wing1, wing2, ...}` — all primary floor/wing IDs in ActiveZones.

**Include:**
- Wing sub-achievements (if any)
- Normal/Heroic/Mythic clear achievements
- Ahead of the Curve / Cutting Edge
- Season Master/Hero title achievements (for the raid that introduces the season)
- Glory of the [X] Raider
- Individual Mythic boss kill achievements (`Mythic: BossName`)
- Boss-specific feats and mechanics achievements
- Awakened/Fated cross-raid achievement (if applicable — add to ALL relevant raids of that expansion)

**Do NOT include:** zone-wide or expansion-wide achievements.

**Glory shared across multiple raids:** include it in each raid entry where it applies.

```lua
zoneData:Zone({2291, 2292, 2293, 2294, 2295, 2296}, { -- Nerub-ar Palace (raid)
    40244, -- Nerub-ar Palace
    40245, -- Heroic: Nerub-ar Palace
    40246, -- Mythic: Nerub-ar Palace
    40253, -- Ahead of the Curve: Queen Ansurek
    40254, -- Cutting Edge: Queen Ansurek
    40660, -- The War Within Season 1: Spelunker Supreme
    40232, -- Glory of the Nerub-ar Raider
    40236, -- Mythic: Ulgrax the Devourer
    ...
})
```

---

### Delve entry — standard
**Map ID:** Single delve map ID.

**Include:**
- Stories achievement for this specific delve
- Discoveries achievement for this specific delve
- Seasonal tier table references based on release season:

| Release season | Tables to include |
|---|---|
| Season 1 of expansion | `delvesS1, delvesS2Progress, delvesS3Progress` |
| Season 2 of expansion | `delvesS2, delvesS3Progress` |
| Season 3 of expansion | `delvesS3` |
| First season of NEXT expansion | `delvesS1` only |

```lua
zoneData:Zone(2249, { -- Fungal Folly (delve)  [Season 1 release]
    40525, -- Fungal Folly Stories
    40803, -- Fungal Folly Discoveries
    delvesS1,
    delvesS2Progress,
    delvesS3Progress,
})

zoneData:Zone(2396, { -- Excavation Site 9 (delve)  [Season 2 release]
    41098, -- Excavation Site 9 Stories
    41100, -- Excavation Site 9 Discoveries
    delvesS2,
    delvesS3Progress,
})
```

---

### Delve entry — boss lair (Zekvir, Nullaeus)
**Include ONLY:**
- Boss-specific achievements
- `delves` (base table — no seasonal progress)

**Do NOT include:** Stories/Discoveries or season progress tables.

```lua
zoneData:Zone(2348, { -- Zekvir's Lair (delve)
    40732, -- Heavy-Handed
    40103, -- My First Nemesis
    40431, -- Hunting the Hunter
    40433, -- Let Me Solo Him: Zekvir
    delves,
})
```

---

### Battleground / PvP area entry
Include all BG-specific achievements: Victory, Veteran, Perfection, All-Star, Assassin, Master of [BG], faction-specific titles.

```lua
zoneData:Zone({92, 1339}, { -- Warsong Gulch (battleground)
    166, -- Warsong Gulch Victory
    167, -- Warsong Gulch Veteran
    ...
})
```

---

## Shared / Cross-Expansion Tables

Defined in `DataAddons/Shared/ZoneData.lua`. Reference by value (not string key):

| Reference | Contents |
|---|---|
| `shared.OldWorldPetAchievements` | Pet Mauler, Continental Tamer, World Safari — add to Vanilla/TBC/WotLK zone entries |
| `shared.CrossExpansionDelves` | Expansion-agnostic delve achievements (You're Getting a Delve!, Delve Deep, etc.) — always the first item in the `delves` local table |

---

## Nested Table Composition

Local tables can be nested inside the achievement list and are recursively flattened at runtime:

```lua
local delves = {
    shared.CrossExpansionDelves,
    40631, -- War Within Delves: Tier 1
    ...
}

local delvesS1Progress = {
    40515, -- War Within Delves: Tier 4 (Season 1)
    ...
}

local delvesS1 = {
    delves,          -- includes CrossExpansionDelves + all base achievements
    delvesS1Progress,
}

zoneData:Zone(2249, {
    40525, -- Fungal Folly Stories
    delvesS1,        -- expands to: CrossExpansionDelves + base delves + Season 1 progress
    delvesS2Progress,
    delvesS3Progress,
})
```

For zone-wide cross-expansion achievements in newer expansions, define a local table once and reference it in each zone entry:
```lua
local quelThalas = { 62110, 42045, ... }   -- expansion-wide meta

zoneData:Zone({2395, 2579}, { ..., quelThalas })
zoneData:Zone({2413, 2576}, { ..., quelThalas })
```

---

## Validation — Autolearn Loop

After every edit to a ZoneData.lua file, run the evaluator:

```powershell
cd "e:\World of Warcraft Addon Development\Krowi_AchievementFilter\raw"
.\Evaluate-ZoneData.ps1 -SkipDbCheck
```

**If it fails, fix the reported issues and re-run. Do not proceed until the evaluator passes.**

For a full DB check (verifies achievement IDs exist in wow.tools.local):
```powershell
.\Evaluate-ZoneData.ps1   # requires wow.tools.local to be running
```

The evaluator checks:
1. **Duplicates** — achievement ID appears more than once in the same zone entry (after resolving local variable references)
2. **Inactive map IDs** — map ID is in `MapVerifier_InactiveZones.csv` — must never appear in ZoneData
3. **Unknown map IDs** — map ID is not in `MapVerifier_ActiveZones.csv` and not in InactiveZones — verify it's correct
4. **Missing achievement IDs** — achievement ID not found in the game DB

Max retry count before escalating: **3 attempts**.

---

## Step-by-Step Workflow

1. **Identify the expansion** from the achievement IDs or context.
2. **Open** `DataAddons/Retail/XX_ExpansionName/ZoneData.lua`.
3. **Look up map IDs** for any new zones/instances by name in `raw/MapVerifier_ActiveZones.csv`.
4. **Determine entry type** (zone/dungeon/raid/delve/BG) and apply content rules above.
5. **Write the entry** using the builder pattern. For delves, include the correct seasonal table references.
6. **Run the evaluator** (`.\Evaluate-ZoneData.ps1 -SkipDbCheck`). Fix any issues.
7. **Run with DB check** (`.\Evaluate-ZoneData.ps1`) to confirm all achievement IDs exist.
8. **Log the decision** in `raw/ZoneDataDecisions.md` — one row per achievement evaluated, regardless of outcome:

| Column | Values |
|---|---|
| ID | Achievement ID |
| Title | Achievement title from DB |
| Decision | `✅ added`, `✅ already present`, `⏭ skipped` |
| Zone ID | Map ID used, or `—` if skipped |
| Zone Name | Zone name, or `—` if skipped |
| Reason | Brief rationale (e.g. "no geographic association", "already in Retail ZoneData") |
| Date | ISO date (YYYY-MM-DD) |

---

## Common Mistakes

| Mistake | Fix |
|---|---|
| Adding dungeon achievements to the parent zone entry | Dungeon achievements belong ONLY in the dungeon's own zone entry |
| Using an inactive map ID | Check `MapVerifier_InactiveZones.csv`; use only ActiveZones IDs |
| Including `delvesS1` when it's a Season 2 release delve | Use `delvesS2` for Season 2 delves |
| Forgetting `shared.CrossExpansionDelves` in the `delves` base table | It must be the first item in every expansion's `delves` local table |
| Duplicate IDs from copy-paste (e.g. across season blocks) | Evaluator catches these — run it after every edit |
| Adding AotC/CE to the wrong raid | These belong to the raid where the relevant boss is the final boss |
