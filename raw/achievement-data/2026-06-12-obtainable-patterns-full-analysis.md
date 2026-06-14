# Obtainable() Patterns — Full Analysis

> Source: e:\World of Warcraft Addon Development\Krowi_AchievementFilter (codebase exploration)
> Collected: 2026-06-12
> Published: Unknown

## Overview

Full analysis of all `:Obtainable()` patterns used across all `DataAddons/` achievement files, cross-referenced with the dispatch logic in `Objects/Achievement.lua:SetTemporaryObtainable()` and the runtime evaluation logic in `Data/TemporaryObtainable.lua`.

Files examined:
- `DataAddons/Shared/AchievementData.lua` — AchBuilder definition
- `DataAddons/Shared/03_WrathOfTheLichKing/AchievementData.lua`
- `DataAddons/Shared/04_Cataclysm/AchievementData.lua`
- `DataAddons/Shared/05_MistsOfPandaria/AchievementData.lua`
- `DataAddons/Retail/03_WrathOfTheLichKing/AchievementData.lua`
- `DataAddons/Retail/04_Cataclysm/AchievementData.lua`
- `DataAddons/Retail/05_MistsOfPandaria/AchievementData.lua`
- `DataAddons/Retail/06_WarlordsOfDaenor/AchievementData.lua`
- `DataAddons/Retail/07_Legion/AchievementData.lua`
- `DataAddons/Retail/08_BattleForAzeroth/AchievementData.lua`
- `DataAddons/Retail/09_Shadowlands/AchievementData.lua`
- `DataAddons/Retail/10_Dragonflight/AchievementData.lua`
- `DataAddons/Retail/11_TheWarWithin/AchievementData.lua`
- `DataAddons/Retail/12_Midnight/AchievementData.lua`
- `DataAddons/Classic/03_WrathOfTheLichKing/AchievementData.lua`
- `DataAddons/Classic/04_Cataclysm/AchievementData.lua`
- `DataAddons/Classic/05_MistsOfPandaria/AchievementData.lua`
- `Objects/Achievement.lua` — SetTemporaryObtainable dispatch
- `Data/TemporaryObtainable.lua` — runtime evaluation

---

## Dispatch Logic (Objects/Achievement.lua)

`SetTemporaryObtainable` receives the variadic args of `:Obtainable(...)` unpacked as positional parameters `(startInclusion, startFunction, startValue, endInclusion, endFunction, endValue)`. Five dispatch cases:

| Case | Args shape | Handler called |
|---|---|---|
| 1 | `"Never"` or `"Once"` only (1 arg) | `SetTemporaryObtainableNeverOnce(startInclusion)` |
| 2 | `[incl, fn]` — no value (2 args) | `SetTemporaryObtainableDuring(incl, fn, nil)` → Start={From,fn,N}, End={Until,fn,N} |
| 3 | `"Before", fn, val` — no end (3 args) | `SetTemporaryObtainableFromVersionToEnd(incl, fn, val)` → Start={From, Version, **achievementPatchId**}, End={Before, fn, val} |
| 4 | `[incl, fn, val]` — no end (3 args, not "Before") | `SetTemporaryObtainableStartOnly(incl, fn, val)` → Start={incl,fn,val}, End={Until, Date, 2100-01-01} |
| 5 | all 6 args | `SetTemporaryObtainableFull(...)` |

**Critical for Case 3:** When data says `Obtainable("Before", "Version", {9, 0, 1})` or `Obtainable("Before", "Date", {2019, 6, 11})`, the stored Start is NOT derived from the written arguments — it is set to `self.BuildVersion.Id`, the achievement's own patch version. Only the cutoff end is taken from the data arguments.

Each call to `:Obtainable()` pushes one record into `achievement.TemporaryObtainable[]`.

---

## Runtime Evaluation (Data/TemporaryObtainable.lua)

`GetObtainableState(achievement)` reads only `records[#records]` — the **last** record. Earlier records are tooltip-history only.

`GetNotObtainableTexts(achievement)` iterates **all** records. Used for tooltip display.

Evaluated states: `"Past"`, `"Current"`, `"Future"`.

---

## All Patterns Found in Data Files

### "Never" — permanently unobtainable

Used for achievements that exist in the DB but were never obtainable (Vanilla PvP ranks on Classic, Collector's Edition items, Scarab Lord, etc.).

```lua
Ach(416):Obtainable("Never"),                                    -- Scarab Lord
Ach(433):IsPvP():Obtainable("Never"):AutoFactionSplit(...),      -- Vanilla PvP titles
```

Dispatch: Case 1. `GetObtainableState` returns `"Past"` immediately on `Start.Function == "Never"`.

### "Once" — realm-first, one player ever

Used exclusively with `:IsRealmFirst()`.

```lua
Ach(4999):IsRealmFirst():Obtainable("Once"),  -- Realm First! Level 85 (Legacy)
```

Dispatch: Case 1. `GetObtainableState` returns `"Past"` immediately.

### "Before", "Version", {M, m, p} — version cutoff

Achievement was available from its own patch until a specific game version.

```lua
Ach(5535):Obtainable("Before", "Version", {6, 0, 2}),  -- 1000 Valor Points
Ach(4826):Obtainable("Before", "Version", {9, 0, 1}),  -- Level 85 (Legacy)
```

Dispatch: Case 3. Stored: Start={From, Version, achievementPatchId}, End={Before, Version, normalizedVersionString}.

### "Before", "Date", {Y, M, D} — calendar date cutoff

Achievement was available from its own patch until a specific calendar date.

```lua
Ach(1436):Obtainable("Before", "Date", {2019, 6, 11}),   -- Friends In High Places
Ach(8213):Obtainable("Before", "Date", {2019, 6, 11}),   -- Friends In Places Higher Yet
```

Five occurrences across WotLK, Cata, WoD, MoP. Dispatch: Case 3. Same mechanics as `"Before", "Version"` but end comparison is calendar date.

### "Event", id — recurring calendar event

Available during each occurrence of a specific in-game calendar event.

```lua
Ach(957):Obtainable("Event", 1592),   -- Hero of the Zandalar Tribe
Ach(6019):Obtainable("Event", 374),   -- Come One, Come All! (Darkmoon Faire)
```

Dispatch: Case 2. Stored: Start={From, Event, id}, End={Until, Event, id}. Linked event occurrences are also checked via `calendarEvent.LinkedEventIds`.

### "PvP Season", N — during a specific PvP season

Available only while PvP season N is active.

```lua
Ach(18027):Other():Obtainable("PvP Season", 35):Obtainable("PvE Season", 10),
```

Dispatch: Case 2. Stored: Start={From, PvP Season, N}, End={Until, PvP Season, N}. Seen on Dragonflight Season Master achievements.

### "PvE Season", N — during a specific M+ season

Available only while M+ season N is active.

```lua
Ach(19396):Transmog():Obtainable("PvP Season", 36):Obtainable("PvE Season", 11),
```

Dispatch: Case 2. Stored: Start={From, PvE Season, N}, End={Until, PvE Season, N}.

### "From", "Date", {Y,M,D}, "Until", "Date", {Y,M,D} — date window

Available only during a specific date range.

```lua
Ach(2398):Obtainable("From", "Date", {2008, 11, 23}, "Until", "Date", {2008, 12, 7}),  -- WoW's 4th Anniversary
Ach(8391):IsPvP():Obtainable("From", "Date", {2013, 6, 18}, "Until", "Date", {2013, 8, 27}),
```

Dispatch: Case 5.

### "From", "PvP Season", N, "Until", "PvP Season", M — PvP season range

Available across a range of PvP seasons.

```lua
Ach(5539):IsPvP():Obtainable("From", "PvP Season", 9, "Until", "PvP Season", 18),  -- 50,000 Conquest Points
```

Dispatch: Case 5.

### "From", "Version", {M,m,p}, "Before", "Version", {M,m,p} — version window

Available during a bounded version range.

```lua
Ach(7943):Obtainable("From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}),  -- Brawler's Guild Season 2
```

Dispatch: Case 5.

### "From", "Version", {M,m,p} — open-ended re-introduction

Available from a specific version onward, no end. Synthetic end = 2100-01-01. Only used chained after an earlier window.

```lua
Ach(7944):Obtainable("From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}):Obtainable("From", "Version", {11, 2, 7}),
-- Bottle Service (Season 2): was available 6.0.3–7.0.3, re-added from 11.2.7 onward
```

Dispatch: the second `:Obtainable` → Case 4.

### "Until", "Version", {M,m,p} — end-only (one use, Legion)

One occurrence only:

```lua
Ach(11065):Obtainable("Until", "Version", {7, 0, 3}):Obtainable("Event", 1640),
-- It All Makes Sense Now: was available until 7.0.3, then re-enabled via Event 1640
```

Dispatch: Case 4. Note: `"Until"` as a Start.Inclusion is not handled by `GetVersionStartState` — the start state evaluation silently falls through (returns nil), so the first record never evaluates to `"Future"`. The second chained record (Event) governs current filter state.

---

## Chaining

Multiple `:Obtainable()` calls on one `Ach()` are valid. Each appends a record.

```lua
-- Two separate windows
Ach(7944):Obtainable("From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}):Obtainable("From", "Version", {11, 2, 7}),

-- Season Master: available during a specific PvP season AND a specific M+ season (separate filter records)
Ach(18027):Other():Obtainable("PvP Season", 35):Obtainable("PvE Season", 10),
```

- `GetObtainableState` uses only the **last** record → controls whether the achievement shows in filter results.
- `GetNotObtainableTexts` uses **all** records → tooltip shows full history.

---

## Inclusion Types

| Inclusion | Side | Meaning |
|---|---|---|
| `"From"` | Start | Available from the start of this point |
| `"After"` | Start | Available after the end of this point (not used in any data file) |
| `"Until"` | End | Available through the end of this point (inclusive) |
| `"Before"` | End | Available up until the start of this point (exclusive) |

---

## Dead Code / Unused Features

- **`"Season"` alias** — referenced in evaluation code as equivalent to `"PvE Season"`. Never used in data files.
- **`"Patch"` label** — referenced in tooltip text generation. Never used in data files.
- **`isObtainable = false`** — `SetTemporaryObtainableDuring` accepts an optional third arg that sets `record.IsNotObtainable = true`. No data file passes this. Dead code at data level.
- **`"After"` inclusion on Start** — `GetEventStartState` has a branch for it marked `-- Should not be used`. Never used in data.
- **`"Before"` inclusion on End for Events** — `GetEventEndState` has a branch marked `-- Should not be used`. Never used in data.
