# Zone Data Format

> Sources: Krowi_AchievementFilter codebase exploration, 2026-05-30
> Raw: [DataAddons Zone Data Format](../../raw/achievement-data/2026-05-30-zone-data-format.md)

## Overview

ZoneData maps achievement IDs to in-game map IDs (zone IDs). When a player opens the world map on a specific zone, the addon uses this mapping to surface relevant achievements. Unlike `AchievementData` (patch-keyed, split per patch), each expansion has exactly **one** `ZoneData.lua` file — all zone assignments for that expansion live in it.

File location:
```
DataAddons/Retail/XX_ExpansionName/ZoneData.lua
```

## File Header

```lua
local _, addon = ...
local shared = addon.Data.ZoneData.Shared
```

Only include `shared` when the file uses shared groups (`shared.OldWorldPetAchievements`, `shared.CrossExpansionDelves`). All current files include it.

## Main Table Structure

```lua
KrowiAF.ZoneData.ExpansionName = {
    { -- ZoneName (zone/dungeon/raid)
        mapID_or_array,
        { achievementIDs }
    },
    -- more zone entries
}
```

Each entry is a two-element table:
1. **Map ID(s)** — single integer, or a table of integers when a zone spans multiple sub-maps.
2. **Achievement ID list** — flat or nested table of integer IDs.

### Single map ID

```lua
{ -- Borean Tundra (zone)
    114,
    { 33, 41, 45, 7520 }
}
```

### Multiple map IDs

All listed map IDs receive the same achievement list:

```lua
{ -- Algeth'ar Academy (dungeon)
    {2097, 2098, 2099},
    { 16434, 16329, 16441, ... }
}
```

## Shared Groups (`addon.Data.ZoneData.Shared`)

Defined in `DataAddons/Shared/ZoneData.lua`. Include these inside achievement ID lists to pull in cross-expansion sets.

| Key | Contents |
|---|---|
| `shared.OldWorldPetAchievements` | Cross-zone pet battle achievement IDs (Local/Traveling/World Pet Mauler, etc.) — used across pre-Cataclysm zone entries |
| `shared.CrossExpansionDelves` | Delve achievement IDs that appear in every delve map regardless of expansion (e.g., "You're Getting a Delve!", "Delve Deep") |

## Nested Table Composition

The achievement ID list supports nested tables that are recursively flattened. Local tables are defined at the top of the file and referenced inside zone entries. Newer expansions (The War Within, Midnight) use this heavily for delve seasonal tiers that repeat across every delve zone:

```lua
local delves = {
    shared.CrossExpansionDelves,
    40631, -- War Within Delves: Tier 1
    40512, -- War Within Delves: Tier 2
}

local delvesS1Progress = {
    40515, -- War Within Delves: Tier 4 (Season 1)
    40516, -- War Within Delves: Tier 5 (Season 1)
}

local delvesS1 = {
    delves,
    delvesS1Progress,
}

KrowiAF.ZoneData.TheWarWithin = {
    { -- Fungal Folly (delve)
        2249,
        {
            40525, -- Fungal Folly Stories
            delvesS1,          -- expands to: delves + delvesS1Progress
            delvesS2Progress,
            delvesS3Progress,
        }
    },
}
```

## Entry Types and Content Conventions

The comment on each opening brace names the type: `(zone)`, `(dungeon)`, `(raid)`, `(delve)`. Content rules differ by type.

### Zone entries

Contain zone-specific achievements (quests, exploration, treasures, adventurer, glyph hunter, tour of duty, faction rep) **plus** cross-expansion achievements.

**Older expansions** repeat the cross-expansion block (Loremaster, Explorer, Squirrels, etc.) verbatim inside every zone entry:
```lua
{ -- Bastion (zone)
    {1533, 1690, 1713, 1714},
    {
        14281, -- The Path to Ascension
        ...
        -- repeated in every zone entry:
        14280, -- Loremaster of Shadowlands
        15388, -- Shadowlands Explorer
        7520,  -- The Loremaster
    }
},
```

**Newer expansions** (Midnight) define a local table once and inject it into each zone entry:
```lua
local quelThalas = {
    62110, -- Loremaster of Midnight
    42045, -- Midnight
    61839, -- Midnight Pathfinder
    ...
}

{ -- Eversong Woods (zone)
    {2395, 2579},
    { ..., quelThalas }
},
{ -- Harandar (zone)
    {2413, 2576},
    { ..., quelThalas }
},
```

**The War Within** and some other expansions do not repeat cross-zone achievements in every zone entry — they appear only once.

### Dungeon entries

Contain only dungeon-specific achievements: Normal/Heroic/Mythic clears, Keystone Hero, Keystone Victor (for dungeons added as Mythic+ keys in later seasons), and individual boss feats. No cross-zone or zone-wide achievements.

```lua
{ -- Darkflame Cleft (dungeon)
    2303,
    {
        40427, -- Darkflame Cleft
        40428, -- Heroic: Darkflame Cleft
        40429, -- Mythic: Darkflame Cleft
        20584, -- Keystone Hero: Darkflame Cleft
    },
},
```

### Raid entries

Contain: wing sub-achievements, Normal/Heroic/Mythic clears, AotC/CE, season master/hero title, Glory (sometimes shared across multiple raid instances), individual boss Mythic kills, boss-specific feats.

```lua
{ -- Nerub-ar Palace (raid)
    {2291, 2292, 2293, 2294, 2295, 2296},
    {
        40247, -- The Skittering Battlements
        40244, -- Nerub-ar Palace
        40253, -- Ahead of the Curve: Queen Ansurek
        40232, -- Glory of the Nerub-ar Raider
        40236, -- Mythic: Ulgrax the Devourer
        ...
    }
},
```

A Glory achievement shared by multiple raid instances appears in each of them:
```lua
-- 61380 appears in The Voidspire, The Dreamrift, and March on Quel'Danas entries
61380, -- Glory of the Midnight Raider (Mount: Tenebrous Harrower)
```

### Delve entries — standard

Contain delve-specific Stories and Discoveries achievements, then one or more seasonal delve tier table references. Which seasons are included depends on when the delve was released:

| Release | Tables used |
|---|---|
| Season 1 of expansion | `delvesS1`, `delvesS2Progress`, `delvesS3Progress` |
| Season 2 of expansion | `delvesS2`, `delvesS3Progress` |
| Season 1 of next expansion | `delvesS1` only |

```lua
{ -- Fungal Folly (delve)            -- S1 release
    2249,
    { 40525, 40803, delvesS1, delvesS2Progress, delvesS3Progress }
},
{ -- Excavation Site 9 (delve)       -- S2 release
    2396,
    { 41098, 41100, delvesS2, delvesS3Progress }
},
{ -- The Shadow Enclave (delve)      -- next-expansion S1
    2502,
    { 61727, 61892, delvesS1 }
},
```

`delvesS1` = `delves` + `delvesS1Progress` (base delves included). `delvesS2Progress` / `delvesS3Progress` are additive — they do not re-include base delves.

### Delve entries — special boss lair

Delves with an optional boss (Zekvir in TWW, Nullaeus in Midnight) contain only boss-specific achievements plus `delves` (base tier list, no seasonal progress). No Stories/Discoveries achievements.

```lua
{ -- Zekvir's Lair (delve)
    2348,
    {
        40732, -- Heavy-Handed
        40103, -- My First Nemesis
        40431, -- Hunting the Hunter
        40433, -- Let Me Solo Him: Zekvir
        delves,
    }
},
{ -- Torment's Rise (delve)       -- Midnight equivalent
    2507,
    {
        40732, -- Heavy-Handed
        61797, -- My Shady Nemesis
        61798, -- Lighting the Dark
        61799, -- Let Me Solo Him: Nullaeus
        61808, -- Fabled Let Me Solo Him: Nullaeus
        delves,
    }
},
```

### Miscellaneous entries

Some entries cover sub-areas or seasonal activities (arenas, cross-expansion content, themed zones). These contain only their specific achievements with no shared table references:

```lua
{ -- Isle of Dorn - The Proscenium (zone)
    2328,
    { 40859, 40860 }
},
{ -- Dastardly Dome
    2447,
    { 41706, 41707, 41715, ... }
},
{ -- Vision of Orgrimmar / Vision of Stormwind
    {2403, 2404},
    { 41853, 41875, ... }
},
```

## Uncertain Map IDs

Some entries in the Midnight file carry a comment flagging that map IDs may need verification:

```lua
{ -- Nexus-Point Xenas (dungeon) [CHECK MAP IDS - MAY BE INACCURATE]
    2556,
    { ... }
},
```

## How the Loader Wires It Up

`DataAddons/Loaders/ZoneData.lua` prepends `KrowiAF.AddZoneData` as index `[1]` of each zone entry at runtime. The zone data author does not call `KrowiAF.AddZoneData` directly.

```lua
-- Loader transforms:
--   { mapID, {achievementIDs} }
-- into:
--   { KrowiAF.AddZoneData, mapID, {achievementIDs} }
```

`KrowiAF.AddZoneData(zoneIds, achievementIds, achievement10Ids, achievement25Ids)` then registers each achievement into `addon.Data.Maps[zoneId].Achievements`. The `achievement10Ids` / `achievement25Ids` parameters are historical (10-/25-man WotLK raids) and are `nil` for all modern content.

## Coverage Status

| Expansion | ZoneData.lua |
|---|---|
| 01_Vanilla | No Retail directory |
| 02_TheBurningCrusade | No Retail directory |
| 03_WrathOfTheLichKing | ✅ |
| 04_Cataclysm | ✅ |
| 05_MistsOfPandaria | ✅ |
| 06_WarlordsOfDaenor | ✅ |
| 07_Legion | ✅ |
| 08_BattleForAzeroth | ❌ Missing — needs to be created |
| 09_Shadowlands | ✅ |
| 10_Dragonflight | ✅ |
| 11_TheWarWithin | ✅ |
| 12_Midnight | ✅ — some entries flagged `[CHECK MAP IDS - MAY BE INACCURATE]` |

`08_BattleForAzeroth` is the only populated Retail expansion directory without a `ZoneData.lua`. All existing files use the same format — there is no V1/V2 split.

## See Also

- [Achievement Data Format](achievement-data-format.md)
- [Category Data Format](category-data-format.md)
