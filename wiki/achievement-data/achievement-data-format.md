# Achievement Data Format

> Sources: Krowi_AchievementFilter codebase exploration, 2026-05-29
> Raw: [DataAddons Achievement Data Format](../../raw/achievement-data/2026-05-29-dataddons-achievement-data-format.md)

## Overview

Achievement data in Krowi's Achievement Filter is registered via `KrowiAF.AchievementData` patch tables. Two formats exist: the current **V2 fluent builder** (all new data) and the legacy **V1 raw-table** format (older expansions, pending migration). Both coexist in the same files. Each patch table begins with `{KrowiAF.SetAchievementPatch, major, minor, patch}` followed by individual achievement entries.

## File Header

Every file using V2 requires this header. Include `faction` only when using `FactionSplit` or `AutoFactionSplit`.

```lua
local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction  -- include only if needed
```

## Patch Table Keys

Format: `"XX_YY_ZZ"` with zero-padded components matching the WoW patch version.

```lua
KrowiAF.AchievementData["11_01_00"] = {
    {KrowiAF.SetAchievementPatch, 11, 1, 0},  -- mandatory first entry
    Ach(12345),
    -- ...
}
```

## Ach() Builder Methods

`Ach(id)` returns a chainable builder. Methods can be combined freely unless noted.

### Reward Types

All dynamically generated from `KrowiAF.Enum.RewardType`. Chain multiple for achievements with multiple rewards.

| Method | Reward |
|---|---|
| `:Mount()` | Mount |
| `:Title()` | Title |
| `:Pet()` | Battle pet |
| `:Toy()` | Toy |
| `:Transmog()` | Transmog |
| `:Tabard()` | Tabard |
| `:Teleport()` | Teleport ability (e.g., Keystone Hero) |
| `:AlliedRace()` | Allied race unlock |
| `:HousingDecor()` | Housing decoration |
| `:WarbandCampsite()` | Warband campsite |
| `:TradersTender()` | Trader's Tender currency |
| `:KeystoneResilience()` | Keystone resilience |
| `:RemixBronze()` | MoP Remix bronze |
| `:RemixInfiniteKnowledge()` | MoP Remix infinite knowledge |
| `:Garrison()` | Garrison reward |
| `:Other()` | Generic other |
| `:NotCategorized()` | Uncategorized |

### Season & PvP

| Method | Description |
|---|---|
| `:PvE(season)` | Adds a PvE season reference. Chainable for multiple seasons. |
| `:PvP(season)` | Sets `IsPvP = true` and adds a PvP season reference. |
| `:IsPvP()` | Sets PvP flag only, no season. Use when no season number is relevant. |
| `:IsRealmFirst()` | Marks achievement as a realm-first. |

### Faction

| Method | When to use |
|---|---|
| `:FactionSplit(faction, altId)` | Faction-specific achievement. Use when the two faction variants cannot be auto-paired — e.g. different obtainability conditions, or no paired counterpart (`altId = nil`). Each variant is its own `Ach()` entry. |
| `:AutoFactionSplit(faction, altId)` | Faction variants with **identical** modifiers. One entry only (lower ID first); system auto-creates the mirror for the opposite faction. |

### Obtainability

`:Obtainable(...)` marks achievements as temporarily obtainable. Accepts variadic condition arguments:

| Pattern | Example |
|---|---|
| `"Before", "Version", {M, m, p}` | `Obtainable("Before", "Version", {9, 0, 1})` — unobtainable from that version onward |
| `"From", "Date", {Y,M,D}, "Until", "Date", {Y,M,D}` | `Obtainable("From", "Date", {2024,7,30}, "Until", "Date", {2024,8,26})` |
| `"Event", eventId` | `Obtainable("Event", 324)` — available during an in-game event |
| `"From", "PvP Season", N, "Until", "PvP Season", M` | available across a PvP season range |

`:Anniv20()` is a built-in shorthand for the 20th anniversary date window (`{2024, 11, 4}` to `{2025, 1, 7}`).

## Common Patterns

```lua
-- Simple
Ach(19409),

-- Single reward type
Ach(40232):Mount(),

-- PvE season only
Ach(20523):PvE(13),

-- Reward + season
Ach(20524):Title():PvE(13),

-- Multiple seasons (Keystone Hero available across S14 and S15)
Ach(20581):Teleport():PvE(14):PvE(15),

-- Multiple reward types + PvP flag
Ach(40097):Title():Mount():IsPvP(),

-- Reward types + PvP season
Ach(40233):Title():Toy():PvP(38),

-- AutoFactionSplit (lower ID first; mirror auto-generated for opposite faction)
Ach(40234):AutoFactionSplit(faction.Horde, 40235):Title():PvP(38),

-- FactionSplit (each variant is its own entry; use when obtainability or other modifiers differ)
Ach(610):IsPvP():FactionSplit(faction.Alliance, 615):Obtainable("Before", "Version", {8, 0, 1}),
Ach(615):IsPvP():FactionSplit(faction.Horde, 610):Obtainable("Before", "Version", {9, 0, 1}),

-- FactionSplit with no paired counterpart (faction-only tag)
Ach(12242):FactionSplit(faction.Alliance, nil):AlliedRace(),

-- Version-bounded obtainability
Ach(40446):Obtainable("Before", "Version", {11, 1, 0}),

-- Date window
Ach(40796):Obtainable("From", "Date", {2024, 7, 30}, "Until", "Date", {2024, 8, 26}),

-- Anniversary shorthand
Ach(40661):Anniv20(),
Ach(40976):Mount():Anniv20(),

-- Event-based
Ach(40862):Obtainable("Event", 324),
```

## Registration Pipeline

1. `{KrowiAF.SetAchievementPatch, M, m, p}` — sets the current patch on the private `achievementPatch` variable in `AchievementDataApi.lua`
2. Each `Ach(id)` entry holds `{KrowiAF.AddAchievementData, id, extras}` as its metatable base
3. The loader iterates the patch table and calls each entry, which resolves to `KrowiAF.AddAchievementData(id, extras)`
4. `KrowiAF.AddAchievementData` unpacks extras, calls the private `AddAchievementData`, and if `AutoPair` is set calls it again for the mirrored faction

## Key Files

| File | Role |
|---|---|
| `DataAddons/Shared/AchievementData.lua` | `AchBuilder` metatable + `shared.Ach()` factory |
| `Api/AchievementDataApi.lua` | `KrowiAF.AddAchievementData`, `KrowiAF.SetAchievementPatch` |
| `Api/ApiDocumentation.lua` | Canonical annotated examples |
| `DataAddons/Retail/11_TheWarWithin/AchievementData.lua` | Primary real-world V2 reference |
| `DataAddons/Loaders/` | Post-processing scripts that execute patch tables |

## See Also

- [Category Data Format](category-data-format.md)
