# DataAddons Zone Data Format

> Source: e:\World of Warcraft Addon Development\Krowi_AchievementFilter (codebase exploration)
> Collected: 2026-05-30
> Published: Unknown

## Overview

This document captures the ZoneData format used in Krowi's Achievement Filter addon, as derived from codebase exploration of `DataAddons/Retail/*/ZoneData.lua`, `DataAddons/Shared/ZoneData.lua`, `Api/ZoneDataApi.lua`, and `DataAddons/Loaders/ZoneData.lua`.

ZoneData maps achievement IDs to in-game map IDs (zone IDs), enabling the addon to show relevant achievements when the player opens the world map on a specific zone.

---

## File Location & Naming

One file per expansion:

```
DataAddons/Retail/XX_ExpansionName/ZoneData.lua
```

Unlike `AchievementData.lua` (which is split by patch key), all zone assignments for an expansion live in a single file. There is no patch-keyed splitting.

**Coverage status as of 2026-05-30:**

| Expansion | ZoneData.lua |
|---|---|
| 01_Vanilla | No Retail directory |
| 02_TheBurningCrusade | No Retail directory |
| 03_WrathOfTheLichKing | ✅ |
| 04_Cataclysm | ✅ |
| 05_MistsOfPandaria | ✅ |
| 06_WarlordsOfDaenor | ✅ |
| 07_Legion | ✅ |
| 08_BattleForAzeroth | ❌ Missing |
| 09_Shadowlands | ✅ |
| 10_Dragonflight | ✅ |
| 11_TheWarWithin | ✅ |
| 12_Midnight | ✅ |

`08_BattleForAzeroth` has a directory under `DataAddons/Retail/` but no `ZoneData.lua` — this is the only populated expansion directory missing the file.

---

## File Header

```lua
local _, addon = ...
local shared = addon.Data.ZoneData.Shared
```

`shared` references `DataAddons/Shared/ZoneData.lua`, which defines cross-expansion shared groups used inside achievement ID lists.

---

## Main Table Structure

```lua
KrowiAF.ZoneData.ExpansionName = {
    { -- ZoneName (zone/dungeon/raid)
        mapID_or_array,
        { achievementIDs }
    },
    -- more entries...
}
```

Each entry is a two-element table:
1. **Map ID(s)**: a single integer or a table of integers. Multiple map IDs share the same achievement list (e.g. an expansion zone split across several sub-maps).
2. **Achievement ID list**: a flat or nested table of achievement IDs.

The top-level `KrowiAF.ZoneData` table is initialized by `Api/ZoneDataApi.lua`.

---

## Single vs. Multi-Map Zones

Single map ID:
```lua
{ -- Borean Tundra (zone)
    114,
    { 33, 41, 45, ... }
}
```

Multiple map IDs (zone split across sub-maps):
```lua
{ -- Algeth'ar Academy (dungeon)
    {2097, 2098, 2099},
    { 16434, 16329, 16441, ... }
}
```

All listed map IDs receive the same achievement list.

---

## Achievement ID List — Nested Table Support

The achievement ID list supports nested tables (including local variables that are themselves tables or nested tables). The Loader and API flatten them recursively. This enables composition:

```lua
local delves = {
    shared.CrossExpansionDelves,
    40631,  -- War Within Delves: Tier 1
    40512,  -- War Within Delves: Tier 2
    ...
}

local delvesS1Progress = {
    40515,  -- War Within Delves: Tier 4 (Season 1)
    ...
}

local delvesS1 = {
    delves,
    delvesS1Progress,
}

{ -- Fungal Folly (delve)
    2249,
    {
        40525,  -- Fungal Folly Stories
        delvesS1,       -- flattens to: delves + delvesS1Progress
        delvesS2Progress,
    }
}
```

Newer expansions (The War Within, Midnight) make heavy use of local tables to group seasonal delve tiers that repeat across every delve zone entry.

---

## Shared Data (`addon.Data.ZoneData.Shared`)

Defined in `DataAddons/Shared/ZoneData.lua`:

| Key | Description |
|---|---|
| `shared.OldWorldPetAchievements` | Set of cross-zone pet battle achievement IDs (Local/Traveling/World Pet Mauler, etc.) used across pre-Cataclysm zones |
| `shared.CrossExpansionDelves` | Delve achievement IDs that apply to all delve maps regardless of expansion (e.g., "You're Getting a Delve!", "Delve Deep") |

---

## Loader (`DataAddons/Loaders/ZoneData.lua`)

```lua
for k1, v1 in next, KrowiAF.ZoneData do
    for k2, v2 in next, v1 do
        if addon.Util.IsTable(v2) and not addon.Util.IsFunction(v2[1]) then
            tinsert(KrowiAF.ZoneData[k1][k2], 1, KrowiAF.AddZoneData)
        end
    end
end
```

The Loader iterates all expansion tables and prepends `KrowiAF.AddZoneData` as the first element of each zone entry. The resulting structure `{ KrowiAF.AddZoneData, mapID(s), {achievementIDs} }` is then processed at runtime.

---

## API (`Api/ZoneDataApi.lua`)

```lua
function KrowiAF.AddZoneData(zoneIds, achievementIds, achievement10Ids, achievement25Ids)
```

- `zoneIds`: single integer or table of integers
- `achievementIds`: table of achievement IDs (recursively flattened)
- `achievement10Ids`: historical — 10-man raid variant IDs (WotLK era; nil for modern expansions)
- `achievement25Ids`: historical — 25-man raid variant IDs (WotLK era; nil for modern expansions)

Registers each achievement into `addon.Data.Maps[zoneId].Achievements` (and `.Achievements10`, `.Achievements25` for historical raids). Map entries are created on demand with `or {}`.

---

## Examples From Existing Files

### Simple zone (Cataclysm)

```lua
KrowiAF.ZoneData.Cataclysm = {
    { -- Twilight Highlands (zone)
        241,
        {
            4875, -- Loremaster of Cataclysm
            7520, -- The Loremaster
            shared.OldWorldPetAchievements,
            ...
        }
    },
}
```

### Dungeon with multiple sub-maps (Dragonflight)

```lua
KrowiAF.ZoneData.Dragonflight = {
    { -- Algeth'ar Academy (dungeon)
        {2097, 2098, 2099},
        {
            16434, -- See Me After Class
            16329, -- Duck, Duck, Spruce!
            ...
        }
    },
}
```

### Seasonal delve composition (The War Within)

```lua
local delves = { shared.CrossExpansionDelves, 40631, 40512, ... }
local delvesS1Progress = { 40515, 40516, ... }
local delvesS1 = { delves, delvesS1Progress }

KrowiAF.ZoneData.TheWarWithin = {
    { -- Fungal Folly (delve)
        2249,
        { 40525, delvesS1, delvesS2Progress, delvesS3Progress }
    },
}
```

---

## Entry Types and Content Conventions

Entries are typed by the comment on the opening brace: `(zone)`, `(dungeon)`, `(raid)`, `(delve)`. The content of the achievement ID list differs by type.

### Zone entries

Contain zone-specific quests, exploration, treasures, adventurer meta, glyph hunter, tour of duty, faction rep, and in **older expansions** also repeat cross-expansion achievements (Loremaster, Explorer, Squirrels, etc.) at the end of the list. In modern expansions (TWW onward) cross-zone achievements appear only once (via shared local tables or only in one zone entry).

Example — Shadowlands (cross-zone achievements repeated in every zone entry):
```lua
{ -- Bastion (zone)
    {1533, 1690, 1713, 1714},
    {
        14281, -- The Path to Ascension
        ...
        -- cross-expansion block repeated in every zone:
        14280, -- Loremaster of Shadowlands
        15388, -- Shadowlands Explorer
        14825, -- Shadowlands Voyager
        7520, -- The Loremaster
    }
},
```

Example — Midnight (cross-zone achievements via local table injected into each zone entry):
```lua
local quelThalas = {
    62110, -- Loremaster of Midnight
    42045, -- Midnight
    ...
}

{ -- Eversong Woods (zone)
    {2395, 2579},
    {
        41802, -- Eversong In Reprise
        ...
        quelThalas,  -- cross-zone block injected via local table
    }
},
```

### Dungeon entries

Contain only the dungeon-specific achievements: Normal/Heroic/Mythic clears, Keystone Hero, Keystone Victor, and individual boss feats. No cross-zone or zone-wide achievements.

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

Keystone Victor achievements (`61590`-range) appear alongside Keystone Hero for dungeons added in later seasons as Mythic+ keys.

### Raid entries

Contain raid wing sub-achievements, normal/heroic/mythic clears, AotC/CE, season master/hero, glory, individual boss mythic kills, and boss-specific feats.

```lua
{ -- Nerub-ar Palace (raid)
    {2291, 2292, 2293, 2294, 2295, 2296},
    {
        40247, -- The Skittering Battlements
        40244, -- Nerub-ar Palace
        40253, -- Ahead of the Curve: Queen Ansurek
        40254, -- Cutting Edge: Queen Ansurek
        40232, -- Glory of the Nerub-ar Raider
        40236, -- Mythic: Ulgrax the Devourer
        ...
    }
},
```

Some raid entries share a Glory achievement across multiple raid instances (e.g. `61380 -- Glory of the Midnight Raider` appears in The Voidspire, The Dreamrift, and March on Quel'Danas entries).

### Delve entries (standard)

Contain delve-specific Stories and Discoveries achievements, then one or more seasonal delve tier table references. Which season tables are included depends on when the delve was released.

```lua
{ -- Fungal Folly (delve)
    2249,
    {
        40525, -- Fungal Folly Stories
        40803, -- Fungal Folly Discoveries
        delvesS1,           -- base delves + S1 tier progress
        delvesS2Progress,   -- only S2 tier progress (base delves already in delvesS1)
        delvesS3Progress,
    }
},
```

Delves added in Season 2 include `delvesS2` (base + S2 progress) plus any later seasons:
```lua
{ -- Excavation Site 9 (delve)
    2396,
    {
        41098, -- Excavation Site 9 Stories
        41100, -- Excavation Site 9 Discoveries
        delvesS2,
        delvesS3Progress,
    }
},
```

Delves added in Season 1 of the next expansion include only `delvesS1` with no additional seasons:
```lua
{ -- The Shadow Enclave (delve)
    2502,
    {
        61727, -- The Shadow Enclave Stories
        61892, -- The Shadow Enclave Discoveries
        delvesS1,
    }
},
```

### Special boss-lair delves

Delves featuring an optional boss (Zekvir in TWW, Nullaeus in Midnight) have a distinct pattern: boss-specific achievements + `delves` (base only, no tier progress). No Stories/Discoveries achievements.

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
```

### Miscellaneous zone entries

Some entries are for sub-areas, arenas, or themed activities that don't fit the main four types. These contain only the specific achievements for that sub-area:

```lua
{ -- Isle of Dorn - The Proscenium (zone)
    2328,
    {
        40859, -- We're Here All Night
        40860, -- A Star of Dorn
    }
},
{ -- Dastardly Dome
    2447,
    {
        41706, -- Dastardly Duos Weekly High Score
        ...
    }
},
```

---

## Uncertain Map IDs

Some entries in the Midnight file carry a comment flagging that map IDs may be inaccurate and need verification:

```lua
{ -- Nexus-Point Xenas (dungeon) [CHECK MAP IDS - MAY BE INACCURATE]
    2556,
    { ... }
},
```

---

## Migration Status

- All existing ZoneData.lua files use the current table format — there is no V1/V2 split for zone data (unlike AchievementData).
- `08_BattleForAzeroth` is the only Retail expansion directory without a `ZoneData.lua`. It needs to be created.
- Vanilla and TBC have no Retail DataAddon directories and no zone data.
- Some Midnight entries have `[CHECK MAP IDS - MAY BE INACCURATE]` comments — map IDs need verification against the game DB.
