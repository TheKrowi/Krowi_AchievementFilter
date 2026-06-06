# Category Data Format

> Sources: Krowi_AchievementFilter codebase exploration, 2026-05-29
> Raw: [DataAddons Category Data Format](../../raw/achievement-data/2026-05-29-category-data-format.md)

## Overview

Category data defines the entire category tree displayed across the addon's five tabs. It is declared as nested Lua tables in `DataAddons/` files and parsed at runtime by `KrowiAF.CreateCategories()` into live `Category` objects. Unlike achievement data, categories do not use patch-keyed tables — all categories for an expansion live in a single nested structure appended to the appropriate tab root.

## File Header

```lua
local _, addon = ...
local shared = addon.Data.CategoryData.Shared
local CT = shared.CT
```

`CT` is the shared cross-expansion category name table (localized strings for recurring category types, expansion names, events, professions, etc.).

## Tab Root Tables

Each tab has one root table. Per-expansion files append to `Expansions` via `tinsert`; the other roots are populated by dedicated files.

| Tab | Root table |
|---|---|
| Achievements | `KrowiAF.CategoryData.Achievements` |
| Expansions | `KrowiAF.CategoryData.Expansions` |
| Events | `KrowiAF.CategoryData.Events` |
| PvP | `KrowiAF.CategoryData.PvP` |
| Specials | `KrowiAF.CategoryData.Specials` |

## Adding an Expansion Block

```lua
tinsert(KrowiAF.CategoryData.Expansions, {
    CT.TheWarWithin,             -- expansion display name
    { -- top-level sub-category
        CT.Character,
        { 40146, 40147, 19460 }, -- achievement ID list
    },
    { -- another sub-category
        addon.L["Zones"],
        { -- zone sub-category
            addon.GetMapName(2248),
            { CT.Quests, true, { 20118, 20595 } },
            { CT.Exploration, true, { 40831, 40435 } },
        },
    },
})
```

## Category Table Syntax

The parser reads each table positionally, advancing an index:

```lua
{
    <id>,        -- optional integer  — KAF category ID (omit → auto-assigned from 9000+)
    <name>,      -- optional string   — display name (resolved at load time)
    <canMerge>,  -- optional boolean  — enable merge-small-categories behaviour
    <child>,     -- repeating tables  — sub-categories, achievement lists, or modifier tables
    …
}
```

Detection rules at each index position:

| Type | Interpretation |
|---|---|
| `number` | Category ID |
| `string` | Display name |
| `boolean` | `canMerge` flag |
| `table` | Child data (after ID/name/canMerge consumed) |

## Category IDs

KAF category IDs are **KAF-internal integers** — not WoW achievement category IDs.

- Provide an explicit ID when the category is referenced externally (other files, plugins, `SpecialCategories.lua`, `EventData.lua` navigation).
- Omit for structural leaves with no external references (auto-assigned from 9000+).
- **Never change an explicit ID once in production.**

Known tab root IDs:

| Tab | ID |
|---|---|
| Achievements | 1100 |
| Expansions | 883 |
| Events | 884 |
| PvP | 955 |
| Specials | 971 |

## Display Name Helpers

Names are resolved at load time, never hardcoded:

| Helper | Resolves to |
|---|---|
| `CT.SomeKey` | Localized string from `shared.CT` |
| `addon.GetCategoryInfoTitle(wowCategoryId)` | WoW achievement category name (e.g. `96` → "Quests") |
| `addon.GetMapName(uiMapId)` | Zone/map name via `C_Map.GetMapInfo` |
| `addon.GetInstanceInfoName(journalInstanceId)` | Dungeon or raid name via `EJ_GetInstanceInfo` |
| `addon.L["Key"]` | Addon localization string |

Common WoW category IDs for `GetCategoryInfoTitle`: 92 = Character, 95 = PvP, 96 = Quests, 97 = Exploration, 168 = Dungeons & Raids, 169 = Professions, 201 = Reputation, 15272 = Dungeons, 15271 = Raids.

## The CT Table

Defined in `DataAddons/Shared/CategoryData.lua`. All values are localized strings evaluated at load time.

**Category types:** `Character`, `PvP`, `Quests`, `Exploration`, `Professions`, `Reputation`, `Dungeons`, `Raids`, `DungeonsAndRaids`, `FeatsOfStrength`, `Battlegrounds`, `Arena`, `Collections`, `PetBattles`, `Collect`, `Battle`, `Level`, `Delves`, `Timewalking`, `Cooking`, `Fishing`, `Archaeology`

**Profession sub-types:** `Alchemy`, `Blacksmithing`, `Enchanting`, `Engineering`, `Inscription`, `Jewelcrafting`, `Leatherworking`, `Tailoring`, `Mining`, `Skinning`, `Herbalism`

**Expansion names:** `Classic`, `TheBurningCrusade`, `WrathOfTheLichKing`, `Cataclysm`, `MistsOfPandaria`, `WarlordsOfDraenor`, `Legion`, `BattleForAzeroth`, `Shadowlands`, `Dragonflight`, `TheWarWithin`, `Midnight`

**Event names:** `HallowsEnd`, `Noblegarden`, `LunarFestival`, `Brewfest`, `ChildrensWeek`, `LoveIsInTheAir`, `PilgrimsBounty`, `DarkmoonFaire`, `WinterVeil`, `Midsummer`

## Child Data Forms

Every entry after the ID/name/canMerge triple is child data — one of three forms:

### Sub-category Definition

A table whose first non-number entry is a string — parsed recursively as a new category:

```lua
{ -- Isle of Dorn
    addon.GetMapName(2248),
    { CT.Quests, true, { 20118, 20595 } },
    { CT.Exploration, true, { 40831, 40435 } },
},
```

### Achievement ID List

A flat list of integers — all attached as achievements on the current category. Distinguished from a sub-category by `[2]` being a number (or having only one entry):

```lua
{
    40146, -- War Within Superior
    40147, -- War Within Epic
    19460, -- Two Warband Mentors: The War Within
},
```

### Special Modifier Table

A table with only named keys — no category or achievements created:

```lua
{ TabName = "Expansions" }
```

| Key | Type | Effect |
|---|---|---|
| `TabName` | string | Wires this category as the root of the named tab |
| `IgnoreFactionFilter` | boolean | Always shows all achievements regardless of faction filter |
| `IgnoreCollapsedChainFilter` | boolean | Bypasses the collapsed-chain filter option |
| `Tooltip` | string | Extra tooltip text shown on mouseover |

## canMerge

`true` enables **Merge Small Categories** UI behaviour: when the category has fewer achievements than the configured threshold, its achievements merge into the parent and the sub-category is hidden. Typically used on Quests, Exploration, PvP, and Reputation leaves within zone categories.

## Key Files

| File | Role |
|---|---|
| `DataAddons/Shared/CategoryData.lua` | Initialises `addon.Data.CategoryData`; defines `shared.CT`; contains cross-expansion content |
| `Api/CategoryDataApi.lua` | `ParseCategory`, `KrowiAF.AddIfNewCategoryData`, `KrowiAF.CreateCategories` |
| `Api/ApiDocumentation.lua` | Canonical annotated example |
| `DataAddons/Retail/11_TheWarWithin/CategoryData.lua` | Primary real-world reference |
| `docs/category-data-reference.md` | Extended reference with full ID lists and loader details |

## See Also

- [Achievement Data Format](achievement-data-format.md)
