# Category Data Reference

This document describes how the category tree for the Retail Expansions, Events, PvP, and Specials tabs is defined, parsed, and wired into the addon at runtime. It is the primary reference for anyone editing or extending `CategoryData.lua` files.

For step-by-step task guides see:
- [`how-to/add-patch-achievements.md`](how-to/add-patch-achievements.md) — adding achievements to a new patch
- [`how-to/add-expansion.md`](how-to/add-expansion.md) — creating a new expansion folder

---

## 1. The Five Tabs and Their Root Tables

The addon displays five tabs. Each tab has exactly one **root category table** that drives its tree:

| Tab | Root table | Defined in |
|-----|-----------|------------|
| Achievements | `KrowiAF.CategoryData.Achievements` | `DataAddons/Retail/CategoryData_Achievements.lua` |
| Expansions | `KrowiAF.CategoryData.Expansions` | `DataAddons/Shared/CategoryData.lua` (initial), populated by every expansion file |
| Events | `KrowiAF.CategoryData.Events` | `DataAddons/Retail/CategoryData_Events.lua` |
| PvP | `KrowiAF.CategoryData.PvP` | `DataAddons/Retail/CategoryData_PvP.lua` |
| Specials | `KrowiAF.CategoryData.Specials` | `DataAddons/Retail/CategoryData_Specials.lua` |

At runtime `KrowiAF.CreateCategories()` (in `Api/CategoryDataApi.lua`) calls `ParseCategory()` on each of these five root tables to build the live category tree.

---

## 2. File Structure

```
DataAddons/
  Shared/
    CategoryData.lua          ← Initialises KrowiAF.CategoryData.Expansions
                                Defines cross-expansion Cross-Expansion content
                                Defines shared helper functions (e.g. GetTheWarWithinMythicPlus)
  Retail/
    01_Vanilla/
      CategoryData.lua        ← tinsert into KrowiAF.CategoryData.Expansions
    02_TheBurningCrusade/
      CategoryData.lua
    …
    12_Midnight/
      CategoryData.lua
    CategoryData_Achievements.lua   ← Achievements tab root (single-entry, just sets TabName)
    CategoryData_Events.lua         ← Full Events tab tree
    CategoryData_PvP.lua            ← Full PvP tab tree
    CategoryData_Specials.lua       ← Full Specials tab tree
    Files.xml                       ← Loads all the above in order
```

**Load order** (driven by `DataAddons/Retail/Files.xml`):
1. `DataAddons/Shared/CategoryData.lua` — loaded first (via `DataAddons/Shared/Files.xml`)
2. `01_Vanilla/CategoryData.lua` through `12_Midnight/CategoryData.lua` — in numeric order
3. `CategoryData_Achievements.lua`, `CategoryData_Events.lua`, `CategoryData_PvP.lua`, `CategoryData_Specials.lua`

Each per-expansion file uses `tinsert(KrowiAF.CategoryData.Expansions, { … })` to append its expansion block to the Expansions tab root table. The order of `tinsert` calls matches the visual order of expansions in the UI.

---

## 3. Category Table Syntax

A category is a Lua table. The parser (`ParseCategory` in `Api/CategoryDataApi.lua`) reads it positionally:

```lua
{
    <id>,        -- [position 1] optional integer — KAF category ID
    <name>,      -- [next]       optional string  — display name
    <canMerge>,  -- [next]       optional boolean — merge-small-category behaviour
    <child>,     -- [remaining]  repeating — child data (see §4)
    <child>,
    …
}
```

The parser advances an index through the table:
- If `[index]` is a **number** → it is the category ID; index advances.
- If `[index]` is a **string** → it is the display name; index advances.
- If `[index]` is a **boolean** → it is `canMerge`; index advances.
- All remaining entries are treated as **child data** (§4).

### 3.1 Category IDs

All category IDs in KAF are **KAF-internal integers** — they are not WoW's own achievement category IDs. The `GetCategoryInfoTitle()` helper (§5) looks up WoW category names by WoW's category IDs, but those IDs are only used for the *name string*, never as the KAF category ID.

**Rules:**
- Provide an explicit ID for any category that must be referenced by other files, plugins, or by `Data/SpecialCategories.lua`.
- Omit the ID (or use auto-assignment) for categories that are purely structural leaves with no external references. Auto-assigned IDs start at 9000 and increment.
- Once an explicit ID is in production code, **never change it** — saved data and plugin references depend on it.

**Known tab root IDs:**

| Category | ID |
|----------|----|
| Achievements tab root | 1100 |
| Expansions tab root | 883 |
| Events tab root | 884 |
| PvP tab root | 955 |
| Specials tab root | 971 |

### 3.2 Display Names

Category names are **evaluated at load time**, not hardcoded strings. The three most common helpers are:

| Helper | What it resolves |
|--------|-----------------|
| `addon.GetCategoryInfoTitle(wowCategoryId)` | WoW's own achievement category name (e.g. 96 → "Quests", 97 → "Exploration", 201 → "Reputation") |
| `addon.GetMapName(uiMapId)` | Map/zone name via `C_Map.GetMapInfo` |
| `addon.GetInstanceInfoName(journalInstanceId)` | Dungeon or raid name via `EJ_GetInstanceInfo` |
| `addon.GetAchievmentName(achievementId)` | Achievement title (used rarely, e.g. for named sub-categories) |
| `addon.L["Key"]` | Localized string from the addon's locale tables |

All helpers cache their results and fall back gracefully (to a localization key or the raw ID) when the WoW API is unavailable on a given client version.

**Commonly used WoW category IDs** (for `GetCategoryInfoTitle`):

| ID | Name |
|----|------|
| 92 | Character |
| 95 | Player vs. Player |
| 96 | Quests |
| 97 | Exploration |
| 168 | Dungeons & Raids |
| 169 | Professions |
| 170 | Cooking |
| 171 | Fishing |
| 201 | Reputation |
| 15071 | Archaeology |
| 15117 | Pet Battles |
| 15246 | Collections |
| 15271 | Raids |
| 15272 | Dungeons |
| 15489–15496 | Individual DF profession categories |
| 15520 | The War Within |
| 15522 | Delves |
| 15542 | Midnight |

### 3.3 canMerge

`canMerge = true` enables a UI option called **Merge Small Categories**. When active, if a category has fewer achievements than the configured threshold, its achievements are merged up into the parent category and the sub-category itself is hidden. This is used on leaf sub-categories like Quests, Exploration, PvP, and Reputation within a zone so they collapse neatly when a player has few achievements there.

A value of `false` or omitting the boolean entirely disables merging for that category.

---

## 4. Child Data

Every entry after the ID/name/canMerge triple is "child data" and can be one of three forms:

### 4.1 Special Modifier Table

A child table that contains only named keys (no positional string at `[1]`). Processed immediately and does not create a sub-category:

```lua
{ TabName = "Expansions" }
```

| Key | Type | Effect |
|-----|------|--------|
| `TabName` | string | Wires this category as the root of the named tab. Sets `addon.Tabs[TabName].Categories` and `addon.Tabs[TabName].Category`. |
| `IgnoreFactionFilter` | boolean | Always shows all achievements regardless of the active faction filter. Useful for categories that contain both Alliance-only and Horde-only achievements. |
| `IgnoreCollapsedChainFilter` | boolean | Bypasses the option that hides earlier achievements in a chain. |
| `Tooltip` | string | Extra tooltip text shown when mousing over this category in the UI. |

### 4.2 Sub-category Definition

A child table whose first non-number entry is a **string** — parsed recursively as a new category:

```lua
{ -- Eversong Woods
    addon.GetMapName(2395),  -- name (no explicit ID → auto-assigned)
    { -- Quests sub-category
        addon.GetCategoryInfoTitle(96),
        true,   -- canMerge
        { 41802, 61957 },
    },
},
```

### 4.3 Achievement ID List

A child table that is a flat (or near-flat) list of integers. All IDs are attached as achievements on the current category. The presence of a second integer at `[2]` is used to distinguish this from a sub-category definition:

```lua
{
    61678, -- Midnight Superior
    61679, -- Midnight Epic
    42328, -- One Warband Mentor: Midnight
},
```

Achievement IDs must exist in `addon.Data.Achievements` (populated by `AchievementData.lua` files) before they are attached. IDs that don't exist are silently skipped.

---

## 5. Standard Expansion Skeleton

Every per-expansion `CategoryData.lua` follows this structure:

```lua
local _, addon = ...
local shared = addon.Data.CategoryData.Shared

tinsert(KrowiAF.CategoryData.Expansions, { -- ExpansionName
    <expansionCategoryId>,
    addon.GetCategoryInfoTitle(<wowExpansionCategoryId>),
    { -- Character
        <id>,
        addon.GetCategoryInfoTitle(92),
        { … achievement IDs … },
    },
    { -- Zones
        <id>,
        addon.L["Zones"],
        { -- ContainerZone (e.g. all of Khaz Algar)
            <id>,
            addon.GetMapName(<uiMapId>),
            { … zone-level achievements … },
        },
        { -- AreaZone (e.g. Isle of Dorn)
            <id>,
            addon.GetMapName(<uiMapId>),
            { -- Quests
                <id>,
                addon.GetCategoryInfoTitle(96),
                true,
                { … },
            },
            { -- Exploration
                <id>,
                addon.GetCategoryInfoTitle(97),
                true,
                { … },
            },
            { -- Player vs. Player
                <id>,
                addon.GetCategoryInfoTitle(95),
                true,
                { … },
            },
            { -- Reputation
                <id>,
                addon.GetCategoryInfoTitle(201),
                true,
                { … },
            },
            { -- [Optional] Skyriding/Skyrocketing Races
                addon.L["Skyriding Races"],
                true,
                { … },
            },
            { … misc achievements not fitting a sub-category … },
        },
    },
    { -- [Optional] Delves
        <id>,
        addon.GetCategoryInfoTitle(15522),
        { … per-delve sub-categories … },
    },
    { -- Dungeons
        <id>,
        addon.GetCategoryInfoTitle(15272),
        shared.GetXxxMythicPlus(addon.L["Mythic+"]),   -- see §7
        { -- DungeonName
            <id>,
            addon.GetInstanceInfoName(<journalInstanceId>),
            { <normal>, <heroic>, <mythic>, <keystoneHero> },
        },
        { … misc dungeon achievements … },
    },
    { -- Raids
        <id>,
        addon.GetCategoryInfoTitle(15271),
        { -- RaidName
            <id>,
            addon.GetInstanceInfoName(<journalInstanceId>),
            { -- Glory
                <id>,
                addon.L["Glory"],
                { … glory achievements … },
            },
            { -- Mythic
                <id>,
                addon.L["Mythic"],
                { … per-boss mythic kills … },
            },
            { … season/meta/curve achievements … },
        },
    },
    { -- [Optional] PvP
        <id>,
        addon.GetCategoryInfoTitle(95),
        { … },
    },
    { … expansion-level misc achievements … },
});
```

**Note:** Older expansions (Vanilla through Legion) often do not have the Delves or Skyriding sub-categories. Use only the categories that have achievements.

**Note on IDs for post-TWW zones:** Zones and sub-categories added after The War Within's launch typically omit explicit IDs (the parser auto-assigns from 9000). This is visible in the Midnight file where most entries have no ID. Explicit IDs are only needed when another file must reference the category by ID.

---

## 6. The Deferred Category Mechanism

A category can be referenced by ID before it is fully defined. If `ParseCategory` encounters a table whose first element is a number (an ID) but that ID has no name and has not yet been created in `addon.Data.Categories`, the entry is stored in `deferredCategories[id]`. When a later `ParseCategory` call creates the category with that ID, the deferred children are immediately processed.

This allows cross-file or cross-table references, for example a plugin or the Specials tab can refer to an expansion-defined category by its KAF ID and attach additional achievements to it without caring about load order.

---

## 7. Shared Helper Functions (`addon.Data.CategoryData.Shared`)

`DataAddons/Shared/CategoryData.lua` creates `addon.Data.CategoryData.Shared` (aliased as `shared` in every file that uses it). It stores reusable category fragments:

| Symbol | Type | Description |
|--------|------|-------------|
| `shared.TheWarWithin.MythicPlus` | table | Full Mythic+ season achievement tree for The War Within |
| `shared.GetTheWarWithinMythicPlus(categoryName)` | function | Returns a category table `{ categoryName, unpack(MythicPlus) }` for embedding in a Dungeons section |
| `shared.Midnight.MythicPlus` | table | Full Mythic+ season achievement tree for Midnight |
| `shared.GetMidnightMythicPlus(categoryName)` | function | Same pattern for Midnight |

Usage in an expansion's Dungeons category:

```lua
{ -- Dungeons
    1601,
    addon.GetCategoryInfoTitle(15272),
    shared.GetTheWarWithinMythicPlus(addon.L["Mythic+"]),
    { … individual dungeons … },
},
```

Usage in `CategoryData_Specials.lua` to replicate the M+ tree inside the Specials tab:

```lua
shared.GetTheWarWithinMythicPlus(addon.GetCategoryInfoTitle(15520)),
shared.GetMidnightMythicPlus(addon.GetCategoryInfoTitle(15542)),
```

When adding a new expansion with Mythic+ content, add a corresponding `shared.<ExpansionName>.MythicPlus` table and `shared.Get<ExpansionName>MythicPlus` helper in `DataAddons/Shared/CategoryData.lua`, then consume it from both the expansion's `CategoryData.lua` and from `CategoryData_Specials.lua`.

---

## 8. Achievement-to-Category Assignment

Achievements can appear in **multiple categories**. When an achievement ID appears in more than one category's achievement list it is attached to each; the achievement object tracks all its categories. This is intentional and used, for example, to show the same achievement under both its zone category and a meta/collection category in the Specials tab.

The `AddAchievements` helper in `CategoryDataApi.lua` silently skips IDs not present in `addon.Data.Achievements`, so category files can be populated before all achievement data is loaded without crashing.

---

## 9. Category Object Properties (Runtime)

After parsing, each category is an instance of `objects.Category` with these fields:

| Field | Set by | Description |
|-------|--------|-------------|
| `Id` | constructor | KAF integer ID |
| `Name` | constructor | Resolved display name string |
| `CanMerge` | constructor | boolean |
| `Level` | `AddCategory` | Depth in the tree (root = 0) |
| `NotHidden` | `AddCategory` | Visibility state; root categories are shown, children start hidden |
| `Parent` | `AddCategory` | Reference to the parent category |
| `Children` | `AddCategory` | Array of child category objects (lazy-created) |
| `Achievements` | `AddAchievement` | Array of achievement objects (lazy-created) |
| `TabName` | `SetTabName` | Present only on tab root categories |
| `IgnoreFilters.FactionFilter` | modifier | Present when IgnoreFactionFilter was set |
| `IgnoreFilters.CollapsedChainFilter` | modifier | Present when IgnoreCollapsedChainFilter was set |
| `Tooltip` | `SetTooltip` | Extra tooltip text |
| `Merged` | runtime | True if the category was merged into its parent (small-category merge) |

---

## 10. Quick ID Reference for Common Category Lookups

These IDs are used across multiple files and plugins. Keep them stable.

### Tab roots

| ID | Description |
|----|-------------|
| 1100 | Achievements tab root |
| 883 | Expansions tab root |
| 884 | Events tab root |
| 955 | PvP tab root |
| 971 | Specials tab root |

### Expansion roots (in Expansions tab)

| ID | Expansion |
|----|-----------|
| 1 | Classic (Vanilla) |
| 237 | Legion |
| 258 | Battle for Azeroth |
| 1207 | Dragonflight |
| 1431 | Cross-Expansion |
| 1598 | The War Within |

(Earlier expansions have similar IDs; consult their `CategoryData.lua` for the exact values.)

---

## 11. Adding a New Category (Checklist)

1. Choose an ID — explicit if it needs cross-referencing, omit for a pure structural leaf.
2. Decide on the name helper (`GetMapName`, `GetInstanceInfoName`, `GetCategoryInfoTitle`, `addon.L[]`).
3. Set `canMerge = true` for zone sub-categories (Quests, Exploration, PvP, Reputation) so they respect the Merge Small Categories option.
4. If the category contains Mythic+ achievements, add a `shared.GetXxx` helper rather than duplicating the block.
5. If achievements also belong in the Specials tab, add the IDs there too (or use the shared helper).
6. New categories for patches that arrive *after* the initial expansion release should generally omit explicit IDs (follow the Midnight pattern).
