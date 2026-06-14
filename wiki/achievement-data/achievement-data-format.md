# Achievement Data Format

> Sources: Krowi_AchievementFilter codebase exploration, 2026-05-29; Krowi_AchievementFilter codebase exploration, 2026-06-12
> Raw: [DataAddons Achievement Data Format](../../raw/achievement-data/2026-05-29-dataddons-achievement-data-format.md); [Obtainable Patterns Full Analysis](../../raw/achievement-data/2026-06-12-obtainable-patterns-full-analysis.md)
> Updated: 2026-06-14

## Overview

Achievement data in Krowi's Achievement Filter is registered via `KrowiAF.AchievementData` patch tables using the **V2 fluent builder**. Each patch table begins with `{KrowiAF.SetAchievementPatch, major, minor, patch}` followed by individual achievement entries.

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

### The `_S` suffix (Shared files only)

Files under `DataAddons/Shared/` use the `_S` suffix on their patch table keys (e.g. `"03_00_02_S"`, `"05_01_00_S"`). This is a **conscious, mandatory convention** — not cosmetic.

**Why it's needed:** `DataAddons/Shared/Files.xml` is always loaded (both clients), and `DataAddons/Retail/Files.xml` / `DataAddons/Classic/Files.xml` are loaded on top via separate `[AllowLoadGameType]` directives in the `.toc`. If a Shared file and a Retail file both used `KrowiAF.AchievementData["03_00_02"] = { ... }`, the second assignment would silently overwrite the first, losing all shared entries for that patch.

The `_S` suffix makes the keys distinct (`"03_00_02_S"` vs. `"03_00_02"`), so the loader sees and processes both. The loader in `Data.lua` iterates all keys in `KrowiAF.AchievementData` without any suffix-awareness — the suffix carries no runtime meaning.

**Placement decision tree — where does an achievement ID go?**

| Situation | File(s) | Key suffix |
|---|---|---|
| Identical on both Retail and Classic | `Shared/` only | `_S` |
| Exists on both clients but differs (e.g. different obtainability) | `Retail/` **and** `Classic/` | plain |
| Retail only | `Retail/` only | plain |
| Classic only | `Classic/` only | plain |

An achievement ID must appear in exactly one location. Putting it in both `Shared/` and a client-specific file causes it to be registered twice: `addon.Data.Achievements[id]` is overwritten (last write wins) and `addon.Data.AchievementIds` gets the ID inserted a second time, causing it to appear duplicated in the UI.

**Key suffix rules:**
- `DataAddons/Shared/` patch tables always use the `_S` suffix.
- `DataAddons/Retail/` and `DataAddons/Classic/` patch tables always use the plain key.

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
| `:IsRealmFirst()` | Marks achievement as a realm-first and automatically registers it as `Obtainable("Once")`. |

### Faction

| Method | When to use |
|---|---|
| `:FactionSplit(faction, altId)` | Faction-specific achievement. Use when the two faction variants cannot be auto-paired — e.g. different obtainability conditions, or no paired counterpart (`altId = nil`). Each variant is its own `Ach()` entry. |
| `:AutoFactionSplit(faction, altId)` | Faction variants with **identical** modifiers. One entry only (lower ID first); system auto-creates the mirror for the opposite faction. |

### Obtainability

`:Obtainable(...)` marks achievements as temporarily obtainable. Accepts variadic condition arguments. Multiple `:Obtainable()` calls can be chained on a single `Ach()` — each pushes a separate record. Only the **last** record governs filter state; all records appear in the tooltip history.

#### Permanent / one-time

| Pattern | Description |
|---|---|
| `"Never"` | Achievement exists in the DB but was never obtainable (Vanilla PvP ranks, Collector's Edition items on Classic). Always shown as unobtainable. |
| `"Once"` | Realm-first: obtainable by only one player ever. Always shown as unobtainable. Automatically injected by `:IsRealmFirst()` — do not write it manually. |

#### Cutoff patterns (implicit start = achievement's own patch)

| Pattern | Example | Description |
|---|---|---|
| `"Before", "Version", {M, m, p}` | `Obtainable("Before", "Version", {9, 0, 1})` | Available from the achievement's own patch until the named game version. |
| `"Before", "Date", {Y, M, D}` | `Obtainable("Before", "Date", {2019, 6, 11})` | Available from the achievement's own patch until a specific calendar date. |

> **Note:** For both cutoff patterns the start of the window is **not** the argument you write — it is silently set to the achievement's own `BuildVersion.Id`. You only specify the cutoff end.

#### During patterns (single event / season)

| Pattern | Example | Description |
|---|---|---|
| `"Event", eventId` | `Obtainable("Event", 324)` | Available during each occurrence of a calendar event. |
| `"Event", eventId, false` | `Obtainable("Event", 1425, false)` | Tied to a calendar event but no longer obtainable in future occurrences. The `false` argument sets `IsNotObtainable = true` on the record. |
| `"PvP Season", N` | `Obtainable("PvP Season", 38)` | Available while PvP season N is active. |
| `"PvE Season", N` | `Obtainable("PvE Season", 10)` | Available while M+ season N is active. |

#### Range patterns

| Pattern | Example | Description |
|---|---|---|
| `"From", "Date", {Y,M,D}, "Until", "Date", {Y,M,D}` | `Obtainable("From", "Date", {2024,7,30}, "Until", "Date", {2024,8,26})` | Available only during a date window. |
| `"From", "PvP Season", N, "Until", "PvP Season", M` | `Obtainable("From", "PvP Season", 9, "Until", "PvP Season", 18)` | Available across a PvP season range. |
| `"From", "Version", {M,m,p}, "Before", "Version", {M,m,p}` | `Obtainable("From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3})` | Available within a specific version window. |

#### Open-ended re-introduction

| Pattern | Example | Description |
|---|---|---|
| `"From", "Version", {M, m, p}` | `Obtainable("From", "Version", {11, 2, 7})` | Available from a version onward with no end. Typically chained after an earlier `"Before"` window on the same achievement. |

`:Anniv20()` is a built-in shorthand for the 20th anniversary date window (`{2024, 11, 4}` to `{2025, 1, 7}`).

## Method Chain Ordering

The observed convention — follow this when writing new entries:

1. Reward types: `:Mount()`, `:Title()`, `:Transmog()`, etc.
2. Faction: `:FactionSplit()`, `:AutoFactionSplit()`, or `:IsPvP()`
3. Season: `:PvP(N)` and/or `:PvE(N)` (multiple allowed)
4. Obtainability: `:Obtainable(...)` (multiple allowed)

### Edge Cases

**`:IsPvP()` alongside `:Obtainable()`**

These are fully orthogonal. `IsPvP` is stored as a named field (`e.IsPvP = true`) on the extras table, while each `:Obtainable()` call appends a record to the integer-indexed portion of the same table. They coexist without any interaction — both are extracted and passed independently to `AddAchievementData`. Examples from the codebase confirm this combination is common:

```lua
Ach(8350):IsPvP():Obtainable("Before", "Version", {8, 3, 0}),
Ach(433):IsPvP():Obtainable("Never"):AutoFactionSplit(faction.Alliance, 443),
Ach(8360):Title():IsPvP():Obtainable("Before", "Version", {8, 3, 0}),
```

**`:IsRealmFirst()` with other methods**

Also fully orthogonal. It sets a standalone boolean flag and has two effects at the filter layer:
- Caught by the dedicated **Realm First** special filter (independently show/hide)
- **Exempts** the achievement from the **Feats of Strength** filter: a 0-point achievement with `IsRealmFirst = true` is never caught by the FeatsOfStrength filter, even though realm-first entries are feats

When combined with `:AutoFactionSplit()`, the `IsRealmFirst` flag is mirrored to the auto-paired entry (same as `RewardType` and `IsPvP`). `:IsRealmFirst()` automatically injects `Obtainable("Once")` — do not chain it manually. It can be combined with reward type methods: WotLK raid realm-firsts use `:Title():IsRealmFirst()` since those achievements also grant a title.

**Reward type ordering**

The `RewardType` array preserves chain order (each reward type method appends to the array with `tinsert`). This order is significant for **tooltip display**: `Rewards.lua` iterates the array sequentially and adds tooltip lines in that order. For **filtering**, the array is treated as an unordered set — an achievement is filtered out if any of its listed reward types matches the active filter, regardless of position. So ordering has no effect on filter behavior. The conventional ordering is **alphabetical** — e.g. `:Mount():Title():Transmog()` — which is easy to apply consistently without needing to memorize a pattern.

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
Ach(40097):Mount():Title():IsPvP(),

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

-- Event-tied but no longer obtainable in future occurrences
Ach(19079):Mount():Obtainable("Event", 1425, false),

-- Never obtainable
Ach(416):Obtainable("Never"),

-- Realm-first (one player ever) — Obtainable("Once") is injected automatically
Ach(4999):IsRealmFirst(),

-- Realm-first with title reward (WotLK raid realm-firsts)
Ach(456):Title():IsRealmFirst(),

-- Calendar date cutoff (start is implicit = achievement's own patch)
Ach(1436):Obtainable("Before", "Date", {2019, 6, 11}),

-- During a specific PvP season only
Ach(18027):Other():Obtainable("PvP Season", 35),

-- During a specific M+ season only
Ach(18027):Other():Obtainable("PvE Season", 10),

-- Dual-season: tied to both a PvP and M+ season window (use Obtainable, NOT :PvP/:PvE — see note below)
Ach(18027):Other():Obtainable("PvP Season", 35):Obtainable("PvE Season", 10),

-- Chained: version window + open-ended re-introduction
Ach(7944):Obtainable("From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}):Obtainable("From", "Version", {11, 2, 7}),
```

> **Dual-season note:** `Obtainable("PvP Season", N)` and `:PvP(N)` are **not** interchangeable. `:PvP(N)` sets `IsPvP = true` as a side effect, causing the achievement to be hidden by the PvP filter (`Filters.lua` line 254: `not _filters.Special.PvP and achievement.IsPvP`). For "Season N Master" achievements that are dual-natured (require both PvP and M+), the `Obtainable()` form deliberately omits the PvP flag. Use `Obtainable("PvP Season", N)` whenever you want season-gated availability without PvP-filter classification. `:PvE(N)` and `Obtainable("PvE Season", N)` are equivalent (no side effects), but mixing builder and `Obtainable` calls on the same chain is inconsistent — keep both sides as `Obtainable()`.

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
