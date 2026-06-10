# DataAddons Category Data Format

> Source: e:\World of Warcraft Addon Development\Krowi_AchievementFilter (codebase exploration)
> Collected: 2026-05-29
> Published: Unknown

## Overview

Category data in Krowi's Achievement Filter defines the entire category tree displayed across the addon's five tabs (Achievements, Expansions, Events, PvP, Specials). It is declared as nested Lua tables and parsed at runtime by `KrowiAF.CreateCategories()` into live `Category` objects.

---

## The Five Tab Root Tables

Each tab has exactly one root table:

| Tab | Root table | Populated by |
|---|---|---|
| Achievements | `KrowiAF.CategoryData.Achievements` | `DataAddons/Retail/CategoryData_Achievements.lua` |
| Expansions | `KrowiAF.CategoryData.Expansions` | Initialized in `DataAddons/Shared/CategoryData.lua`; populated by every per-expansion file |
| Events | `KrowiAF.CategoryData.Events` | `DataAddons/Retail/CategoryData_Events.lua` |
| PvP | `KrowiAF.CategoryData.PvP` | `DataAddons/Retail/CategoryData_PvP.lua` |
| Specials | `KrowiAF.CategoryData.Specials` | `DataAddons/Retail/CategoryData_Specials.lua` |

---

## File Structure

```
DataAddons/
  Shared/
    CategoryData.lua                 ← Initialises KrowiAF.CategoryData; defines shared.CT table
    03_WrathOfTheLichKing/
      CategoryData.lua               ← shared expansion (Retail + Classic both load this)
    04_Cataclysm/
    05_MistsOfPandaria/
  Retail/
    01_Vanilla/CategoryData.lua      ← tinsert into KrowiAF.CategoryData.Expansions
    02_TheBurningCrusade/
    …
    12_Midnight/CategoryData.lua
    CategoryData_Achievements.lua
    CategoryData_Events.lua
    CategoryData_PvP.lua
    CategoryData_Specials.lua
  Classic/
    03_WrathOfTheLichKing/CategoryData.lua
    04_Cataclysm/CategoryData.lua
    05_MistsOfPandaria/CategoryData.lua
```

Load order: Shared first, then Retail/Classic per-expansion files in numeric order, then tab-specific files.

---

## File Header

```lua
local _, addon = ...
local shared = addon.Data.CategoryData.Shared
local CT = shared.CT
```

`CT` is the shared cross-expansion category name table (see CT Table below).

---

## How Expansion Data Is Added

Per-expansion files append to the Expansions tab root using `tinsert`:

```lua
tinsert(KrowiAF.CategoryData.Expansions, {
    CT.TheWarWithin,  -- expansion display name from CT
    { ... top-level sub-categories ... },
    { ... more sub-categories ... },
})
```

There are no patch keys (unlike AchievementData). All categories for an expansion live in a single nested table.

---

## Category Table Syntax

A category is a positionally-parsed Lua table. The parser (`ParseCategory` in `CategoryDataApi.lua`) advances an index:

```lua
{
    <id>,        -- optional integer: KAF category ID (omit for auto-assignment from 9000+)
    <name>,      -- optional string:  display name (evaluated at load time)
    <canMerge>,  -- optional boolean: enable merge-small-categories UI behaviour
    <child>,     -- repeating: child data (sub-category, achievement list, or modifier)
    <child>,
    …
}
```

### Position Detection Rules

| Value type at current index | Interpretation |
|---|---|
| `number` | Category ID |
| `string` | Display name |
| `boolean` | `canMerge` flag |
| `table` | Child data (processed after ID/name/canMerge are consumed) |

---

## Category IDs

KAF category IDs are **KAF-internal integers**, not WoW achievement category IDs.

- Provide an explicit ID for any category referenced externally (other files, plugins, `Data/SpecialCategories.lua`, `EventData.lua` navigation).
- Omit the ID for purely structural leaves — auto-assigned from 9000+.
- **Never change an explicit ID once in production.**

Known tab root IDs:

| Tab | Root ID |
|---|---|
| Achievements | 1100 |
| Expansions | 883 |
| Events | 884 |
| PvP | 955 |
| Specials | 971 |

---

## Display Name Helpers

Names are resolved at load time via helper functions, not hardcoded strings:

| Helper | Resolves to |
|---|---|
| `CT.SomeKey` | Localized string from `shared.CT` table (preferred for recurring category types) |
| `addon.GetCategoryInfoTitle(wowCategoryId)` | WoW achievement category name (e.g. 96 → "Quests") |
| `addon.GetMapName(uiMapId)` | Zone/map name via `C_Map.GetMapInfo` |
| `addon.GetInstanceInfoName(journalInstanceId)` | Dungeon or raid name via `EJ_GetInstanceInfo` |
| `addon.L["Key"]` | Addon localization string for names not in CT or WoW API |

Common WoW category IDs for `GetCategoryInfoTitle`:

| ID | Name |
|---|---|
| 92 | Character |
| 95 | Player vs. Player |
| 96 | Quests |
| 97 | Exploration |
| 168 | Dungeons & Raids |
| 169 | Professions |
| 201 | Reputation |
| 15117 | Pet Battles |
| 15246 | Collections |
| 15271 | Raids |
| 15272 | Dungeons |

---

## The CT Table

`shared.CT` maps short keys to localized strings. Defined in `DataAddons/Shared/CategoryData.lua`. Covers category types, expansion names, battlegrounds, professions, and events. Key entries:

**Category types:** `Character`, `PvP`, `Quests`, `Exploration`, `Professions`, `Reputation`, `Dungeons`, `Raids`, `DungeonsAndRaids`, `FeatsOfStrength`, `Battlegrounds`, `Arena`, `Collections`, `PetBattles`, `Collect`, `Battle`, `Level`, `Delves`, `Timewalking`, `Cooking`, `Fishing`, `Archaeology`

**Profession sub-types:** `Alchemy`, `Blacksmithing`, `Enchanting`, `Engineering`, `Inscription`, `Jewelcrafting`, `Leatherworking`, `Tailoring`, `Mining`, `Skinning`, `Herbalism`

**Expansion names:** `Classic`, `TheBurningCrusade`, `WrathOfTheLichKing`, `Cataclysm`, `MistsOfPandaria`, `WarlordsOfDraenor`, `Legion`, `BattleForAzeroth`, `Shadowlands`, `Dragonflight`, `TheWarWithin`, `Midnight`

**Event names:** `HallowsEnd`, `Noblegarden`, `LunarFestival`, `Brewfest`, `ChildrensWeek`, `LoveIsInTheAir`, `PilgrimsBounty`, `DarkmoonFaire`, `WinterVeil`, `Midsummer`

---

## Child Data Forms

Every entry after the ID/name/canMerge triple is child data and takes one of three forms:

### 1. Special Modifier Table

A table with only named keys — no sub-category, no achievements created:

```lua
{ TabName = "Expansions" }
```

| Key | Type | Effect |
|---|---|---|
| `TabName` | string | Wires this category as the root of the named tab |
| `IgnoreFactionFilter` | boolean | Always shows achievements for all factions |
| `IgnoreCollapsedChainFilter` | boolean | Bypasses the collapsed chain filter option |
| `Tooltip` | string | Extra tooltip text shown on mouseover in the UI |

### 2. Sub-category Definition

A table whose first non-number entry is a **string** — parsed recursively:

```lua
{ -- Isle of Dorn
    addon.GetMapName(2248),    -- name (no explicit ID)
    { CT.Quests, true, { 20118, 20595 } },
    { CT.Exploration, true, { 40831, 40435 } },
},
```

### 3. Achievement ID List

A flat list of integers attached as achievements on the current category:

```lua
{
    40146, -- War Within Superior
    40147, -- War Within Epic
    19460, -- Two Warband Mentors: The War Within
},
```

The parser distinguishes an ID list from a sub-category by checking whether `[2]` is also a number (or the list has only one entry).

---

## canMerge

`canMerge = true` enables the **Merge Small Categories** UI option. When active and the category has fewer achievements than the configured threshold, its achievements merge up into the parent and the sub-category is hidden. Typically used on leaf types (Quests, Exploration, PvP, Reputation within a zone).

---

## Deferred Categories

If `ParseCategory` encounters a category table that has an explicit ID but the category object doesn't exist yet (and no name is provided), it defers it into `deferredCategories[id]`. Once another entry creates that category, the deferred table is processed. This supports forward-references in the data.

---

## Real-World Example

```lua
local _, addon = ...
local shared = addon.Data.CategoryData.Shared
local CT = shared.CT

tinsert(KrowiAF.CategoryData.Expansions, { -- The War Within
    CT.TheWarWithin,
    { -- Character
        CT.Character,
        {
            40146, -- War Within Superior
            40147, -- War Within Epic
            19460, -- Two Warband Mentors: The War Within
        },
    },
    { -- Zones
        addon.L["Zones"],
        { -- Isle of Dorn
            addon.GetMapName(2248),
            { CT.Quests, true,
                { 20118, 20595 },
            },
            { CT.Exploration, true,
                { 40831, 40435, 40434 },
            },
            { CT.PvP, true,
                { 40083 },
            },
            { CT.Reputation, true,
                { 41161, 41162 },
            },
        },
        -- ... more zones ...
    },
    { -- Dungeons & Raids
        CT.DungeonsAndRaids,
        { addon.GetInstanceInfoName(2569),    -- Dungeon name from Journal
            { 19459, 19461, 19462, 19463, 19464 },
        },
    },
})
```

---

## Key Files

| File | Role |
|---|---|
| `DataAddons/Shared/CategoryData.lua` | Initialises `addon.Data.CategoryData`; defines `shared.CT`; contains cross-expansion Expansions tab content |
| `Api/CategoryDataApi.lua` | `ParseCategory`, `KrowiAF.AddIfNewCategoryData`, `KrowiAF.CreateCategories` |
| `Api/ApiDocumentation.lua` | Canonical annotated category table example |
| `DataAddons/Retail/11_TheWarWithin/CategoryData.lua` | Primary real-world reference |
| `docs/category-data-reference.md` | Extended reference with ID lists and loader details |
