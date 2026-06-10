# DataAddons Achievement Data Format

> Source: e:\World of Warcraft Addon Development\Krowi_AchievementFilter (codebase exploration)
> Collected: 2026-05-29
> Published: Unknown

## Overview

This document captures the full achievement data format used in Krowi's Achievement Filter addon, as derived from codebase exploration of `DataAddons/`, `Api/AchievementDataApi.lua`, `DataAddons/Shared/AchievementData.lua`, and `Api/ApiDocumentation.lua`.

---

## V2 Format (Current Standard)

All new achievement entries use `KrowiAF.AchievementData` with the fluent `Ach()` builder. V2 is the standard for all patches from expansion 11 (The War Within) onward, and is used for new patches added to any expansion file.

### Required File Header

```lua
local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction -- only if FactionSplit or AutoFactionSplit is used
```

### Patch Table Structure

Patch keys use the format `"XX_YY_ZZ"` where XX/YY/ZZ are zero-padded version components:

```lua
KrowiAF.AchievementData["11_01_00"] = {
    {KrowiAF.SetAchievementPatch, 11, 1, 0},  -- Must be first entry; sets patch version for all following achievements
    Ach(12345),                                -- Simple (no extras)
    Ach(12346):Mount(),                        -- Single reward type
    Ach(12347):Title():PvE(15),                -- Reward type + PvE season
    Ach(12348):FactionSplit(faction.Alliance, 12349), -- Faction-split
}
```

The first entry `{KrowiAF.SetAchievementPatch, major, minor, patch}` is mandatory and must appear before any `Ach()` entries.

---

## Ach() Builder

Defined in `DataAddons/Shared/AchievementData.lua`. Returns a metatable-backed object allowing fluent method chaining.

```lua
function shared.Ach(id)
    return setmetatable({KrowiAF.AddAchievementData, id}, AchBuilder)
end
```

The internal table is `{KrowiAF.AddAchievementData, id, extras}` where `extras` is lazily created by `GetExtras()` on first call to any modifier.

---

## All Builder Methods

### Reward Type Methods (dynamically generated from `KrowiAF.Enum.RewardType`)

| Method | Description |
|---|---|
| `:NotCategorized()` | Uncategorized reward |
| `:Other()` | Generic/other reward |
| `:AlliedRace()` | Allied race unlock |
| `:Garrison()` | Garrison-related reward |
| `:Mount()` | Mount reward |
| `:Pet()` | Battle pet reward |
| `:RemixBronze()` | Remix bronze reward |
| `:Tabard()` | Tabard reward |
| `:Teleport()` | Teleport reward (e.g., Keystone Hero) |
| `:Title()` | Title reward |
| `:Toy()` | Toy reward |
| `:TradersTender()` | Trader's Tender currency reward |
| `:Transmog()` | Transmog reward |
| `:WarbandCampsite()` | Warband campsite reward |
| `:RemixInfiniteKnowledge()` | Remix infinite knowledge reward |
| `:HousingDecor()` | Housing decoration reward |
| `:KeystoneResilience()` | Keystone resilience reward |

Multiple reward types can be chained: `Ach(id):Title():Mount():Toy()`.

### Misc Methods

| Method | Signature | Description |
|---|---|---|
| `:PvE(season)` | `season: number` | Adds a PvE season reference |
| `:PvP(season)` | `season: number` | Sets `IsPvP = true` and adds a PvP season reference |
| `:IsPvP()` | — | Sets `IsPvP = true` only (no season) |
| `:IsRealmFirst()` | — | Marks the achievement as a realm-first |
| `:FactionSplit(faction, altId)` | `faction: Enum.Faction`, `altId: number` | Links two distinct faction-variant achievements (requires both entries) |
| `:AutoFactionSplit(faction, altId)` | `faction: Enum.Faction`, `altId: number` | Same as FactionSplit but auto-generates mirror entry for opposite faction (only one entry needed) |
| `:Obtainable(...)` | variadic | Marks temporary obtainability conditions |
| `:Anniv20()` | — | Shorthand for `Obtainable("From", "Date", {2024, 11, 4}, "Until", "Date", {2025, 1, 7})` |

---

## FactionSplit vs AutoFactionSplit

**`:FactionSplit(faction, altId)`** — for achievements that cannot be auto-paired. Use when the two variants have **different obtainability conditions**, or when there is no paired counterpart (`altId = nil`). Each variant is its own `Ach()` entry:

```lua
-- Different obtainability windows between factions
Ach(610):IsPvP():FactionSplit(faction.Alliance, 615):Obtainable("Before", "Version", {8, 0, 1}),
Ach(615):IsPvP():FactionSplit(faction.Horde, 610):Obtainable("Before", "Version", {9, 0, 1}),

-- Faction-only tag with no paired counterpart
Ach(12242):FactionSplit(faction.Alliance, nil):AlliedRace(),
```

**`:AutoFactionSplit(faction, altId)`** — for faction variants with **identical modifiers**. Lower ID first; one entry only — the system auto-creates the mirror for the opposite faction with `altId`:

```lua
Ach(40234):AutoFactionSplit(faction.Horde, 40235):Title():PvP(38),
```

The `AutoPair` flag causes `AchievementDataApi.lua` to call `AddAchievementData` a second time for the opposite faction with `altId` and mirrored faction.

---

## Obtainable Conditions

The `:Obtainable(...)` method accepts variadic arguments describing time/version windows:

| Pattern | Example | Meaning |
|---|---|---|
| `"Before", "Version", {major, minor, patch}` | `Obtainable("Before", "Version", {9, 0, 1})` | Unobtainable from that version onward |
| `"From", "Date", {Y, M, D}, "Until", "Date", {Y, M, D}` | `Obtainable("From", "Date", {2024,7,30}, "Until", "Date", {2024,8,26})` | Available only during date window |
| `"Event", eventId` | `Obtainable("Event", 324)` | Available during specific in-game event |
| `"From", "PvP Season", N, "Until", "PvP Season", M` | `Obtainable("From", "PvP Season", 38, "Until", "PvP Season", 40)` | Available across a range of PvP seasons |

Chaining with reward types is valid: `Ach(id):Toy():Obtainable("Before", "Version", {9, 0, 1})`.

---

## Multiple PvE/PvP Seasons

A single achievement may apply to multiple seasons by chaining `:PvE()` calls:

```lua
Ach(20581):Teleport():PvE(14):PvE(15), -- Available in both season 14 and 15
```

---

## Data Registration Pipeline

Each `Ach()` entry in a patch table is structured as `{KrowiAF.AddAchievementData, id, extras}`. When the loader processes the patch table, it calls `KrowiAF.AddAchievementData(id, extras)`.

`KrowiAF.AddAchievementData` (in `Api/AchievementDataApi.lua`):
- If no extras: calls private `AddAchievementData(id)`
- If extras: extracts `Faction`, `AltId`, `RewardType`, `IsPvP`, `IsRealmFirst`, and positional temporary obtainables; calls `AddAchievementData` with all parameters
- If `AutoPair` is set: calls `AddAchievementData` a second time for the mirrored faction with the alt ID

`KrowiAF.SetAchievementPatch(major, minor, patch)` stores the current patch version in `achievementPatch`, which is applied to all subsequently registered achievements.

---

## Real-World Examples

```lua
-- Simple
Ach(19409), -- Working Underground

-- Single reward type
Ach(19408):HousingDecor(), -- Professional Algari Master
Ach(40232):Mount(), -- Glory of the Nerub-ar Raider

-- PvE season only
Ach(20523):PvE(13), -- The War Within Keystone Explorer: Season One

-- Reward type + season
Ach(20524):Title():PvE(13), -- The War Within Keystone Conqueror: Season One

-- Multiple seasons (same keystone hero achievement applies to S14 and S15)
Ach(20581):Teleport():PvE(14):PvE(15), -- Keystone Hero: Priory of the Sacred Flame

-- Multiple reward types + PvP flag
Ach(40097):Title():Mount():IsPvP(), -- Ruffious's Bid

-- Reward types + PvP season
Ach(40233):Title():Toy():PvP(38), -- Strategist: The War Within Season 1

-- AutoFactionSplit with rewards and PvP season
Ach(40234):AutoFactionSplit(faction.Horde, 40235):Title():PvP(38), -- Forged Warlord / Marshal

-- Allied race
Ach(40307):AlliedRace(), -- Allied Races: Earthen

-- Version-bounded obtainability
Ach(40446):Obtainable("Before", "Version", {11, 1, 0}), -- I TAKE Candle!

-- Event-based obtainability
Ach(40862):Obtainable("Event", 324), -- Tricks and Treats of Khaz Algar

-- Date window
Ach(40796):Obtainable("From", "Date", {2024, 7, 30}, "Until", "Date", {2024, 8, 26}),

-- Anniversary shorthand helper
Ach(40661):Anniv20(), -- Zoomies!
Ach(40976):Mount():Anniv20(), -- A Cool Twenty Years

-- PvP season range + reward
Ach(40795):Toy():IsPvP():Obtainable("From", "PvP Season", 38, "Until", "PvP Season", 40),
```

---

## Key Files

| File | Role |
|---|---|
| `DataAddons/Shared/AchievementData.lua` | AchBuilder metatable + `shared.Ach()` factory |
| `Api/AchievementDataApi.lua` | `KrowiAF.AddAchievementData`, `KrowiAF.SetAchievementPatch` |
| `Api/ApiDocumentation.lua` | Canonical annotated examples |
| `DataAddons/Retail/11_TheWarWithin/AchievementData.lua` | Primary real-world V2 reference |
| `DataAddons/Loaders/` | Post-processing scripts that execute patch tables |
