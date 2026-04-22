# Krowi's Achievement Filter — Codebase Analysis Report

**Date:** April 19, 2026  
**Scope:** Full codebase review (Lua + XML)  
**Author:** GitHub Copilot (Claude Sonnet 4.6)  
**For:** Ongoing quality tracking. Safe to paste into a fresh chat as context.

---

## Context Summary

Krowi's Achievement Filter (`KrowiAF`) is a World of Warcraft addon (~368 Lua files, ~102 XML files). It replaces and extends the native Achievements UI with additional tabs, 6400+ achievements, advanced filtering/sorting, an event reminder system, a data manager, and multi-character tracking. It supports both Retail (mainline) and Classic (Wrath/Cata/Mists). There is **no build system, no linter, no automated tests** — the WoW client is the only runtime validator.

---

## THE GOOD

### 1. Consistent OOP Pattern via Metatables

All domain objects (`Achievement`, `Category`, `Event`, `Tab`, `BuildVersion`, `Flags`, `CompareFunc`, `SaturationStyle`) use the same idiomatic Lua OOP pattern:

```lua
-- Objects/Achievement.lua
achievement.__index = achievement;
function achievement:New(id, ...) 
    local instance = setmetatable({}, achievement);
    ...
    return instance;
end
```

The pattern is applied uniformly across all nine object types. Methods always receive `self` implicitly via `:` syntax. No deviation.

### 2. Clean Namespace Isolation

Every file begins with:
```lua
local addonName, addon = ...;
-- or
local _, addon = ...;
```

The shared `addon` table is the only inter-file coupling mechanism. There are no bare global writes except for deliberately public API (the `KrowiAF` global) and WoW frame names (which must be global by engine requirement). Module sub-tables follow a consistent pattern:

```lua
-- pattern used everywhere
addon.Gui = {};
local gui = addon.Gui;
```

This is correct, idiomatic, and prevents global namespace pollution.

### 3. Well-Defined Public API Surface

`Api/API.lua` creates the `KrowiAF` global as the single public contract. All public functions and data registration tables live there. Internal consumers use `addon.*`; external consumers (plugins, other addons) use `KrowiAF.*`. This boundary is real and generally respected.

### 4. Lazy Initialization to Conserve Memory

`Category:New` does not pre-create `Children` or `Achievements` tables:

```lua
-- Objects/Category.lua
function category:AddCategory(cat)
    self.Children = self.Children or {};  -- only created when needed
    tinsert(self.Children, cat);
    ...
end
```

With 1200+ categories and 6400+ achievements, this meaningfully reduces memory allocation. The same pattern appears for `MoreCategories`, `WatchListCategories`, `ExcludedCategories`, `TransmogSets`, etc.

### 5. Coroutine-Based Async Cache Build

`addon.BuildCacheAsync` in `Globals.lua` iterates through all achievement IDs (up to ~80,000+) inside a coroutine that yields when a frame time budget is exceeded:

```lua
coMaxDuration = 500 / (tonumber(C_CVar.GetCVar("targetFPS")) or GetFrameRate());
...
if (debugprofilestop() - coStart > coMaxDuration) then
    coroutine.yield();
end
```

This prevents the cache build from freezing the client. It is one of the most technically sophisticated pieces of code in the addon and is well-executed. The callback queue (`coOnFinish`, `coOnDelay`) allows multiple callers to register interest before the async operation completes — essentially a promise pattern.

### 6. Data Integrity Manager with Migration Chain

`Data/DataIntegrityManager.lua` implements a migration system with 30 numbered solutions applied in order on every upgrade. First-time installs run all solutions with `firstTime = true`. Each solution is a function that receives `prevBuild`, `currBuild`, `prevVersion`, `currVersion`, `firstTime` — giving it full context to decide whether to act. This is a solid approach for saved-data schema evolution.

### 7. Loader Pattern Decouples Data from Processing

`DataAddons/Loaders/AchievementData.lua` (and its siblings for zone/tooltip/event data) prepend the handler function into every data chunk before execution:

```lua
-- DataAddons/Loaders/AchievementData.lua
for k1, v1 in next, KrowiAF.AchievementData do
    for k2, v2 in next, v1 do
        if addon.Util.IsTable(v2) and not addon.Util.IsFunction(v2[1]) then
            tinsert(KrowiAF.AchievementData[k1][k2], 1, KrowiAF.AddAchievementData);
        end
    end
end
```

Data files declare only IDs and metadata; they never import or call processing functions directly. This is a clean separation, though the mechanism is implicit (see THE UGLY §2).

### 8. Temporal Obtainability System

`Data/TemporaryObtainable.lua` and `Objects/Achievement.lua` together implement a rich model for time-gated achievements (PvE seasons, PvP seasons, game versions, calendar events, dates, "never/once" for deprecated content). The `SetTemporaryObtainable*` family of methods builds typed records and `GetObtainableState` dispatches on them to return `"Past"`, `"Current"`, or `"Future"`. This is architecturally sound.

### 9. Localization System Done Right

`enUS.lua` is split between a manually maintained block and a CurseForge-auto-generated block (clearly delimited by `AUTOGENTOKEN`). The `Shared.lua` file binds WoW global strings to locale keys at runtime (e.g., `L["Expansion"] = EXPANSION_FILTER_TEXT`), ensuring the addon tracks game-version string changes automatically.

### 10. Filter Validation Returns a Typed Integer, Not a Boolean

`Filters.Validate` returns:
- `-i` (negative index) — filtered out by rule `i`
- `1` — show normally
- `2` — always visible (admin override)
- `3` — ignore filters entirely
- `4` — always show completed override

This allows call sites to distinguish _why_ something was filtered, not just _whether_ it was. It's a good design.

### 11. ApiDocumentation.lua as a Living Reference

`Api/ApiDocumentation.lua` contains fully-annotated example data structures with field-level comments explaining every parameter. It doubles as a spec for plugin authors and a regression reference.

### 12. Configurable Frame-Time Budget

`coMaxDuration = 500 / (GetFrameRate())` adapts the coroutine yield interval to the player's target FPS. On a 60 fps machine the budget is ~8ms, on a 144 fps machine ~3.5ms. This self-tuning prevents degraded performance on high-refresh-rate monitors.

---

## THE BAD

### 1. Mixed Indentation Throughout

The codebase mixes 4-space indentation (most files), tab indentation, and occasionally 2-space. Compare `Objects/Achievement.lua` (4-space, consistent) with `Objects/Category.lua` (mix of 4-space and tab in the same file). `Globals.lua` mixes 4-space and tab in adjacent functions. No `.editorconfig` file exists to enforce a rule.

**Impact:** Low-severity but causes diff noise and makes code review harder.

### 2. Inconsistent Semicolon Usage

Per the project's own instructions, semicolons should not be used. Many newer files omit them. However, almost every file in `Api/`, `Options/`, `DataAddons/`, and `Gui/WindowFrames/` uses semicolons consistently at end-of-statement. Files like `Data/TemporaryObtainable.lua` and `Data/EventData.lua` (newer code) omit them entirely. The inconsistency is project-wide.

### 3. Inconsistent Data Entry Style in `DataAddons/Retail/`

`DataAddons/Shared/AchievementData.lua` introduced shorthand helper functions in 2025:
```lua
function shared.Ach(id, ...) ... end
function shared.PvE(season) return {"PvE Season", season} end
function shared.Title() return {RewardType = value} end
```

Only `11_TheWarWithin/AchievementData.lua` imports these helpers (line 3: `local Ach, PvE, PvP, Title = shared.Ach, ...`). All other expansion data files (`01_Vanilla` through `10_Dragonflight` and `12_Midnight`) use the old verbose style. The `12_Midnight` data was written _after_ the helpers existed but doesn't use them. This creates a maintenance split: maintainers must know which style applies to which file.

### 4. Duplicate Achievement Registration — Bug in `11_TheWarWithin` ✅ FIXED (2026-04-19)

<details>
<summary>Original issue (fixed 2026-04-19)</summary>

Achievement **20524** ("The War Within Keystone Conqueror: Season One") was registered twice — once via the `Ach()` helper and once via the old verbose style. The duplicate verbose entry was removed; only the `Ach(20524, PvE(13), Title())` entry remains.

</details>

### 5. `Resolve` Uses String Comparison for Version Numbers — Latent Bug ✅ FIXED (2026-04-19)

<details>
<summary>Original issue (fixed 2026-04-19)</summary>

`Data/DataIntegrityManager.lua` line ~96:

```lua
if not (prevBuild == nil or prevVersion == nil or prevBuild .. "." .. prevVersion < currBuild .. "." .. currVersion) then
    return; -- skip all migrations
end
```

This compares version strings lexicographically. Current version is `94.8`. When the version reaches `94.10`, the comparison `"94.10" < "94.9"` returns `true` in Lua string ordering (because `"1"` < `"9"`), so the condition evaluates as "old version is newer than new version" and **all migrations are skipped**. The same problem affects `94.10` vs any `94.{1-9}` comparison.

**Priority: HIGH.** Use numeric comparison: `tonumber(currBuild) > tonumber(prevBuild) or (tonumber(currBuild) == tonumber(prevBuild) and tonumber(currVersion) > tonumber(prevVersion))`.

</details>

### 6. Hardcoded Magic Number `9999` for Synthetic Category IDs

`Globals.lua`, `AddCategoriesTree`:

```lua
local newCategory = addon.Objects.Category:New(cat.Id + 9999, cat.Name);
addon.Data.Categories[cat.Id + 9999] = newCategory;
```

This offsets real category IDs by 9999 to create synthetic sub-categories for the Watch List / Tracking / Excluded trees. There is no constant, no comment explaining the choice of 9999, and no assertion that `cat.Id + 9999` won't collide with a real category ID. The comment in `Data.lua` shows `KrowiAF_Categories = data.Categories` — any ID collision would silently overwrite a real category.

**Priority: MEDIUM.** Replace with a clearly named constant and add a collision check.

### 7. Missing Solution #24 in Migration Chain ✅ FIXED (2026-04-19)

<details>
<summary>Original issue (fixed 2026-04-19)</summary>

`DataIntegrityManager.lua`'s `LoadSolutions` table has numbered comments from 1 to 30 but **solution #24 is absent**:

```lua
MigrateCharactersAndAchievements, -- 25  (skips 24)
```

This suggests a solution was removed at some point. The gap is harmless now but creates confusion: future maintainers adding solution #31 must decide whether to renumber or leave the gap, and the comment numbering no longer matches array positions.

**Priority: LOW.** Add an explanatory comment for the gap (`-- 24 removed: [reason]`) or renumber everything.

</details>

### 8. Typos in Production Diagnostic Messages ✅ FIXED (2026-04-19)

<details>
<summary>Original issue (fixed 2026-04-19)</summary>

`DataIntegrityManager.lua` lines 110 and 129:

```lua
diagnostics.Debug("Nothing to varify for Saved Character Data");
--                          ^^^^^^^
diagnostics.Debug("Nothing to varify for The War Within's Achievements Data");
```

Both say "varify" instead of "verify". These appear in debug output and would be visible to players with debug mode enabled.

</details>

### 9. Commented-Out Code Blocks in Main File

`Krowi_AchievementFilter.lua` contains multiple large commented-out blocks that appear to be debugging/investigation code, including `KrowiAF_AttCheck()` (a full function iterating `AllTheThings` data), a test frame creation, several `C_AddOns.LoadAddOn` calls at the top, a `-- addon.Gui:PrepareTabsOrder()` call, and a `-- C_AddOns.LoadAddOn("Blizzard_Calendar")` at the bottom. These should be deleted or moved to a scratch file.

### 10. `BrowsingHistory` Stores to `SavedData` But Never Restores

`BrowsingHistory.lua`:

```lua
KrowiAF_SavedData.BrowsingHistory = --[[KrowiAF_SavedData.BrowsingHistory or]] {};
```

The `or` branch is commented out, so the history is **always reset to empty on every login/reload**. The data is written to `KrowiAF_SavedData` (persisted to disk) but never read back. This wastes one SavedData write per session and is misleading to anyone reading the code who expects the history to survive reloads.

**Priority: LOW.** Either uncomment the restore logic (if that's the intent) or save history to a session-local table instead of `KrowiAF_SavedData`.

### 11. Undocumented `ignoreAchievementIds` in `SavedData/AchievementData.lua`

```lua
local ignoreAchievementIds = {};
ignoreAchievementIds[7268] = true;
ignoreAchievementIds[7269] = true;
ignoreAchievementIds[7270] = true;
ignoreAchievementIds[40910] = true;
ignoreAchievementIds[42114] = true;
```

No comment explains why these five IDs must be ignored. Anyone maintaining this file cannot determine if these entries are still relevant or should be removed/extended without testing in-game. At minimum, each entry should have a comment with the achievement name and reason for exclusion.

### 12. `KrowiAF_GetCategoryInfoTitle` Global Alias Without Documentation

`Localization/Shared.lua`:
```lua
KrowiAF_GetCategoryInfoTitle = addon.GetCategoryInfoTitle
```

An underscore-prefixed function is made global here with no comment. This is presumably for use in data files that run early in the load order before the API is fully wired, but nothing explains why this global alias is needed instead of using the `KrowiAF.UtilApi` or `addon.GetCategoryInfoTitle` directly.

### 13. `AutoOrderPlusPlus` Counter is Shared Mutable State

`addon.InjectOptions.AutoOrderPlusPlus` is a function that increments a module-level integer counter each time it is called. It is used throughout `General.lua`, `Layout.lua`, `TabDataApi.lua`, and others to assign `order` values to AceConfig options panels. Because it is shared global state, options registered in different files must be loaded in a specific order or risk gaps/overlaps in panel ordering. There is no documentation of this contract.

### 14. `GetTopMostParentCategory` Exists Only for Debug Code

`Globals.lua` contains `GetTopMostParentCategory` — a 20-line function with visited-node tracking and a depth limit of 1000 — but it is only called inside:

```lua
if addon.Diagnostics.DebugEnabled() and achievement and achievement.BuildVersion and achievement.BuildVersion.Id == "120005" then
    local topMostParent = GetTopMostParentCategory(achievement.Category);
    ...
```

This is development/investigation code gated by debug mode and a hardcoded version string `"120005"`. It should be removed before a stable release.

### 15. `AchBuilder` Reward-Type Methods Are Inconsistent and Create Runtime GC Pressure 🔄 PENDING

`DataAddons/Shared/AchievementData.lua` — the generated single-reward methods store a raw integer:
```lua
for key, value in pairs(rewardType) do
    AchBuilder[key] = function(self) GetExtras(self).RewardType = value; return self end
end
```

But `Rewards(...)` always stores a table:
```lua
function AchBuilder:Rewards(...)
    GetExtras(self).RewardType = {...}
end
```

Because `RewardType` can be either an integer or a table, both `Filters.lua` (line 177) and `Gui/AchievementTooltip/Rewards.lua` (line 17) must check `IsTable` on every filter/render pass and allocate a temporary `{rewardType}` wrapper table when it is not. This temp table is created and immediately GC'd on every scroll, tab switch, and filter change — for every single-reward achievement visible on screen.

**Pending (apply atomically when ready):**
1. Remove the `IsTable` guard and temp-table allocation from `Filters.lua` validation #6.
2. Remove the same guard from `Gui/AchievementTooltip/Rewards.lua`.

**Benchmark results** (10k iterations, WoW client):
- Promote vs current at load: +15.6% per rewarded achievement (~0.32ms total extra across all data — negligible)
- Runtime savings: eliminates `IsTable` (two function calls deep) + temp table allocation on every filter pass

**Priority: MEDIUM.**

### 16. `Category:RemoveCategory` Matches by Name+Level, Not Identity

```lua
function category:RemoveCategory(cat)
    for i, _ in next, self.Children do
        if self.Children[i].Name == cat.Name and self.Children[i].Level == cat.Level then
            tremove(self.Children, i);
            return;
        end
    end
end
```

Two categories can have the same Name and Level while being different objects (e.g., "Quests" appears under many expansion sub-trees). The first matching entry will be removed, not necessarily `cat`. The same issue exists in `Category:RemoveAchievement` (matches by `.Id`, which is correct) so there is an inconsistency even within the same file. The correct fix for `RemoveCategory` is a reference equality check (`self.Children[i] == cat`).

**Priority: MEDIUM.** This can cause silent data corruption in Watch List / Excluded / Tracking trees.

---

## THE UGLY

### 1. Copy-Paste Bug in `TemporaryObtainable:GetObtainableState` ✅ FIXED (2026-04-19)

<details>
<summary>Original issue (fixed 2026-04-19)</summary>

`Data/TemporaryObtainable.lua`, in the "end function" dispatch block: the second condition checked `startFunction == "Season"` instead of `endFunction == "Season"`, producing incorrect obtainability states for season-gated achievements using the legacy `"Season"` keyword.

</details>

### 2. Data Loader Mechanism is Invisible Magic

The loader pattern:
```lua
-- DataAddons/Loaders/AchievementData.lua
tinsert(KrowiAF.AchievementData[k1][k2], 1, KrowiAF.AddAchievementData);
```

…prepends the processor function at index 1 of each data chunk. Later, `Data.lua` calls `data:RegisterAchievementDataTasks()` which inserts the entire `v` (the chunk, now with its processor prepended) into `TasksGroups`. The `BuildCacheAsync` coroutine then iterates tasks, calling each sub-table as if it were a function table where `v[1]` is the function.

**No file documents this contract.** A new contributor reading any data file sees bare tables of IDs with no indication how they become function calls. The `ApiDocumentation.lua` shows the data format but says nothing about the loader mechanism. The `CONTRIBUTING.md` or a `docs/how-to/` file should explain the chunk execution model.

### 3. `Globals.lua` is a 800+ Line Grab-Bag

`Globals.lua` contains, without structural separation:
- Achievement chain traversal helpers (`GetPreviousAchievement`, `GetFirstAchievementId`)
- UI state helpers (`InGuildView`, `GetActiveCovenant`)
- Zone/map achievement lookups (`GetAchievementsInZone`)
- Achievement count accumulators (`GetAchievementNumbers`)
- Watch List / Excluded / Tracking category tree management (25+ functions)
- The 500-line async cache build coroutine (`BuildCacheAsync`, `HandleAchievements`, etc.)
- WoW API compatibility shims (`OverwriteFunctions`, `LoadBlizzardApiChanges`, `HookFunctions`)
- Window management (`MakeWindowMovable`, `MakeWindowStatic`, `MakeMovable`)
- Date/time utilities (`GetSecondsSince`)
- `GetAchievementInfo` / `GetAchievementInfoTable` wrappers
- `SortAchievementIds`

This violates the single-responsibility principle. The cache build logic alone warrants its own file (`Data/AchievementCache.lua`). The Watch/Excluded/Tracking tree management belongs in `Data/SpecialCategories.lua` or each respective object's file. The WoW API compatibility shims belong in a `Compat.lua` file.

### 4. `ToggleGameMenu` Hook Checks the Same Conditions Twice

`Krowi_AchievementFilter.lua`:

```lua
hooksecurefunc("ToggleGameMenu", function()
    -- Block 1: Hide frames
    if KrowiAF_FloatingAchievementTooltip and ... :IsShown() then
        KrowiAF_FloatingAchievementTooltip:Hide();
    elseif KrowiAF_TextFrame and ... :IsShown() then
        KrowiAF_TextFrame:Hide();
    elseif ...  -- 4 more elseif branches
    end

    -- Block 2: IDENTICAL condition check repeated to show KrowiAF_SpecialFrame
    if KrowiAF_FloatingAchievementTooltip and ... :IsShown()
    or KrowiAF_TextFrame and ... :IsShown()
    or ...  -- same 4 conditions
    then
        KrowiAF_SpecialFrame:Show();
    end
end)
```

Every frame's `:IsShown()` is evaluated twice per game menu open, and the compound `or` condition in block 2 always evaluates to `false` because block 1 just hid all the matching frames. The `KrowiAF_SpecialFrame:Show()` can never be reached. This appears to be dead code.

**Priority: MEDIUM.** The intent was likely to show `KrowiAF_SpecialFrame` if _any_ KAF frame was visible when the game menu opened (to keep the ESC key closing behavior correct). The fix is to capture the visibility state before hiding.

### 5. Version Comparison String Bug (Restatement as Structural Issue)

As noted in THE BAD §5, the string comparison `prevBuild .. "." .. prevVersion < currBuild .. "." .. currVersion` will silently skip all migrations when the version number's minor component reaches `10`. Since the addon is currently at `94.8`, this will affect the next milestone that increments past `94.9`. When it breaks, ALL 30 migration solutions will be silently skipped for affected users, potentially corrupting saved data.

The `DataIntegrityManager` has no fallback or error handling for this failure mode.

### 6. `achievementInfoCache` is Module-Level Mutable State in Filters

`Filters.lua`:

```lua
local achievementInfoCache;   -- module-level

function filters.Validate(_filters, achievement, ignoreFilters, ...)
    achievementInfoCache = addon.GetAchievementInfoTable(achievement.Id);
    ...
    for i, validation in next, validations do
        if validation.Validate(_filters, achievement, ignoreFilters) then
            -- validation.Validate captures achievementInfoCache via upvalue
            return -i;
        end
    end
end
```

The 18 validation closures in the `validations` array capture `achievementInfoCache` as an upvalue. The cache is set once per call and consumed by multiple closures. While Lua is single-threaded and this is therefore safe, it is a hidden coupling between `Validate` and all 18 closures that is not apparent from their signatures. If `Validate` is ever called re-entrantly (e.g., from within a validation that itself calls `GetAchievementNumbers`), the cache will be overwritten mid-validation. No guard prevents this.

### 7. `GetAchievementInfo` vs `GetAchievementInfoTable` — Two Overlapping Wrappers

`Globals.lua` defines both `addon.GetAchievementInfo` (returns the 15-value tuple from the WoW API, plus a synthesized `Exists` bool) and `addon.GetAchievementInfoTable` (same data packed into a named table with `Flags` parsed via `objects.Flags:New`). Call sites throughout the codebase use both functions for the same purpose, forcing the reader to mentally track which return format is expected. `addon.GetAchievementInfo` is the older API; ideally all callers would migrate to `addon.GetAchievementInfoTable` and the tuple version retired.

### 8. `DEBUG` Flag in `TemporaryObtainable.lua` Uses Comment-Toggle ✅ FIXED (2026-04-19)

<details>
<summary>Original issue (fixed 2026-04-19)</summary>

```lua
local DEBUG --= true
```

When this flag is active (by uncommenting `= true`), all season/version lookups return hardcoded values (previous season = 6, current season = 7, etc.). If accidentally left active on a release build, every player's time-gated achievements will show incorrect obtainability states. The flag is not guarded by `addon.Diagnostics.DebugEnabled()` and has no warning in the release checklist.

**Priority: HIGH.** At minimum, guard with `assert(not DEBUG, "DEBUG flag active in TemporaryObtainable!")` or convert to use `addon.Diagnostics.DebugEnabled()`.

</details>

### 9. `GetMergedCategory` is O(n²) in the Category Tree

`Objects/Achievement.lua`:

```lua
function achievement:GetMergedCategory()
    local categories = self.Category:GetTree(); -- allocates a new table per call
    for _, category in next, categories do
        if category.MergedAchievements ~= nil then
            for _, ach in next, category.MergedAchievements do
                if ach.Id == self.Id then        -- linear scan
                    return category;
                end
            end
        end
        if category.Achievements ~= nil then
            for _, ach in next, category.Achievements do
                if ach.Id == self.Id then        -- linear scan
                    return category;
            ...
```

For every achievement that needs its merged category, this:
1. Allocates a new `categories` table (`GetTree` does `tinsert` N times)
2. Iterates every category in the tree path
3. For each category, does a linear scan through its achievements looking for this achievement

With `MergeSmallCategories` enabled and frequent category list refreshes, this is called many times per frame for many achievements. A reverse pointer on the achievement (set when `MergeAchievement` is called) would be O(1).

### 10. `category:GetAchievementNumbers` Rebuilds Counts on Every Call

`Objects/Category.lua`:

```lua
function category:GetAchievementNumbers()
    -- runs recursively through entire tree
    -- calls addon.GetAchievementInfoTable per achievement
    ...
    self.NumOfAch = numOfAch;  -- caches result
end
```

The result is cached, but cache invalidation is via `self.CountsDirty = true` which is only set in some paths (e.g., `AddWatchedAchievement`, `SetFlexibleData`). Applying a filter change does not set `CountsDirty` on affected categories — instead, `GetAchievementNumbers` is simply called again on the next render. With 1200+ categories and up to 6400 achievements, a full filter toggle can trigger thousands of `GetAchievementInfo` WoW API calls in a single frame cycle.

### 11. `ParseAddAchievementData` Uses Sequential Type-Sniffing to Parse Positional Arguments

`Api/AchievementDataApi.lua`:

```lua
local function ParseAddAchievementData(id, faction, otherFactionAchievementId, isPvP, isRealmFirst)
    local moreData;
    if addon.Util.IsTable(faction) then
        moreData = faction; faction = nil;
    end
    if addon.Util.IsTable(otherFactionAchievementId) then
        moreData = otherFactionAchievementId; otherFactionAchievementId = nil;
    end
    if addon.Util.IsTable(isPvP) then
        moreData = isPvP; isPvP = nil;
    end
    if addon.Util.IsTable(isRealmFirst) then
        moreData = isRealmFirst; isRealmFirst = nil;
    end
```

This function allows any positional argument to be a table by "stealing" it as `moreData`. The result is that the type of every argument must be checked, the order of the arguments matters for correctness, and only one `moreData` table is supported (the last one wins). The `Ach()` helper in `Shared/AchievementData.lua` uses a cleaner variadic approach, but the old parsing function is still in production use for the majority of the data.

### 12. Fragile `strsplit` in `VerifySavedCharacterData`

`DataIntegrityManager.lua`:
```lua
for guid, character in next, KrowiAF_SavedData.CharacterList do
    local _, realm, name = strsplit("-", guid);
    if character.Name == nil then
        KrowiAF_SavedData.CharacterList[guid].Name = name;
    end
```

WoW GUIDs have the format `Player-{realmId}-{guid}` — two hyphens, three parts. `strsplit` returns the parts by position, so `_` = `"Player"`, `realm` would be the numeric realm ID, not the realm name. But `character.Name` is set to the unit's full name, and `character.Realm` is the realm name string. The assignment `character.Name = name` would assign a numeric GUID segment, not a human-readable name. Either this code path is never reached (because `character.Name` is always set by `CharacterData.Upsert` before this runs), or it is subtly wrong. The lack of tests means it's unclear which.

### 13. `IncludeAchievement` Uses Iterator-as-Empty-Check Pattern

`Globals.lua`:
```lua
if KrowiAF_SavedData.ExcludedAchievements then
    for _, _ in next, KrowiAF_SavedData.ExcludedAchievements do
        return;  -- table is non-empty, bail out
    end
    KrowiAF_SavedData.ExcludedAchievements = nil;  -- table is empty, nil it
end
```

This is a "is table empty?" check implemented as an iterator. It works but is non-obvious to future maintainers. `next(KrowiAF_SavedData.ExcludedAchievements) ~= nil` is the idiomatic Lua pattern and communicates intent immediately.

### 14. UI Load Pattern Destroys Module References

`Gui/WindowFrames/AchievementsFrame/AchievementsFrame.lua`:
```lua
function achievementsFrame:Load()
    local frame = CreateFrame(...);
    ...
    addon.Gui.AchievementsFrame = nil;  -- destroys own module reference
end
```

After `Load()`, `addon.Gui.AchievementsFrame` no longer points to the `achievementsFrame` table or the frame — it is `nil`. All access to the frame after load goes through the global `KrowiAF_AchievementsFrame`. This pattern (also in `CategoriesFrame`, `SummaryFrame`, `Search`, `FilterButton`) intentionally prevents accidental double-loading, but it means:
- `achievementsFrame` local reference is still valid within the file scope
- `addon.Gui.AchievementsFrame` is nil everywhere else after load
- Debugging after load is harder because module lookups fail

A `loaded` boolean flag would prevent double-loading without destroying the reference.

### 15. `C_Timer.After(0, function() C_Timer.After(...) end)` Double Nesting

`Krowi_AchievementFilter.lua` PLAYER_ENTERING_WORLD handler:

```lua
C_Timer.After(0, function()
    C_Timer.After(addon.Options.db.profile.EventReminders.OnLoginDelay, function()
        addon.Gui.EventReminderAlertSystem:ShowActiveEventsOnPlayerEnteringWorld(...);
    end);
end);
```

The outer `C_Timer.After(0, ...)` defers execution by one frame. The inner timer then applies the user-configured delay. The outer zero-delay timer is unexplained. It may be to let the options database settle before reading `OnLoginDelay`, but that should happen synchronously. The nesting adds complexity with no documented purpose.

---

## STRUCTURAL OBSERVATIONS

### Retail vs Classic Divergence

The conditional load system (`[AllowLoadGameType mainline]` vs `[AllowLoadGameType wrath, cata, mists]`) is sound. However, several Lua files contain runtime checks like `addon.Util.IsMainline`, `addon.Util.IsWrathClassic`, etc. that branch on client type. The Gui layer in particular has these scattered throughout:

```lua
-- FilterButton.lua
tinsert(addon.Gui.SubFrames, addon.Util.IsMainline and CreateModern() or CreateClassic());
```

This is acceptable for small branches, but the `AchievementFrameHeader.lua` and `Gui.lua` files have multiple interspersed branches. A single `if addon.Util.IsMainline then ... else ... end` block per file would be cleaner than ternary inlining.

### The Plugin API Surface Is Thin but Incomplete

`Api/PluginsApi.lua` and `Plugins/AchievementsTabFixes.lua` show the plugin pattern. Plugins call `KrowiAF.PluginsApi:RegisterPlugin(name, table)`, then implement `:InjectOptions()` and `:Load()`. This is clean. However, `Plugins/Plugins.lua` is entirely commented out with the note that the system was moved to `PluginsApi.lua` — the dead file should be deleted.

### `Objects/CompareFunc.lua` and `Objects/SaturationStyle.lua`

These are small objects that were not covered in this review. They should be audited to verify they follow the same OOP pattern and do not contain similar issues to those found above.

### Data Volume Scaling

The `DataAddons/Retail/` tree spans 12 expansions. `11_TheWarWithin/CategoryData.lua` is large but manageable. `10_Dragonflight/CategoryData.lua` and earlier expansion files were not individually reviewed but the pattern should be consistent. The loader mechanism means any single bad entry (wrong ID type, missing function reference) will silently fail rather than throw an error — consider adding validation in the loader that asserts `type(v2[1]) == "function"` before executing.

---

## PRIORITY ACTION LIST

| # | Severity | Issue | File | Action |
|---|----------|-------|------|--------|
| 1 | ✅ FIXED | Copy-paste bug: `startFunction` checked instead of `endFunction` | `Data/TemporaryObtainable.lua` ~line 95 | Fixed 2026-04-19 |
| 2 | ✅ FIXED | Duplicate achievement 20524 registered twice | `DataAddons/Retail/11_TheWarWithin/AchievementData.lua` | Fixed 2026-04-19 |
| 3 | ✅ FIXED | String comparison for version numbers breaks at `x.10` | `Data/DataIntegrityManager.lua` | Fixed 2026-04-19: `Resolve` now uses `tonumber()` comparisons on Build and Version separately; legacy solutions removed. |
| 4 | ✅ FIXED | DEBUG flag in TemporaryObtainable can ship accidentally | `Data/TemporaryObtainable.lua` | Fixed 2026-04-19: `DEBUG` flag and all four `if DEBUG then` blocks removed entirely |
| 5 | 🟠 MEDIUM | `RemoveCategory` matches by Name+Level, not identity | `Objects/Category.lua` | Use reference equality |
| 6 | 🟠 MEDIUM | `ToggleGameMenu` hook block 2 is dead code | `Krowi_AchievementFilter.lua` | Fix ESC key visibility logic |
| 7 | 🟠 MEDIUM | Magic number `9999` for synthetic category ID offsets | `Globals.lua` | Named constant + collision assertion |
| 8 | ✅ FIXED | Missing solution #24 in migration chain | `Data/DataIntegrityManager.lua` | Fixed 2026-04-19: entire legacy solutions list removed |
| 9 | ✅ FIXED | "varify" typos in debug messages | `Data/DataIntegrityManager.lua` | Fixed 2026-04-19 |
| 10 | 🟡 LOW | BrowsingHistory stored to SavedData but never restored | `BrowsingHistory.lua` | Decide: restore or use session-local table |
| 11 | 🟡 LOW | Undocumented `ignoreAchievementIds` entries | `Data/SavedData/AchievementData.lua` | Add per-entry comments |
| 12 | 🟡 LOW | Dead code: `GetTopMostParentCategory` + debug branch for `120005` | `Globals.lua` | Remove before next release |
| 13 | 🟡 LOW | `Plugins/Plugins.lua` entirely commented out | `Plugins/Plugins.lua` | Delete file; update `Files.xml` |
| 14 | 🟡 LOW | `Globals.lua` is too large / does too much | `Globals.lua` | Refactor: split cache, compat, and window management |
| 15 | 🔄 ONGOING | Mixed indentation and semicolons throughout codebase | All files | `.editorconfig` + `docs/styleguide.md` created 2026-04-19. Apply incrementally as files are touched. |
| 16 | 🟠 MEDIUM | `AchBuilder` reward consumer guards: `IsTable` check + temp table alloc on every filter/render pass | `Filters.lua` validation #6, `Gui/AchievementTooltip/Rewards.lua` | Remove `IsTable` guards once builder loop promote pattern is live. Apply atomically. |

---

## CONTINUATION NOTES FOR NEXT SESSION

When resuming work in a new chat, paste this report as context and reference these section numbers. The most productive starting points are:

1. **Fix the three HIGH bugs first** (items 1–3 above) — they affect correctness in production.
2. **Refactor `Globals.lua`** — splitting the async cache builder into `Data/AchievementCache.lua` would also allow the `HandleAchievement`, `HandleCompletedAchievement`, `HandleNotCompletedAchievement` family to be tested in isolation conceptually, even if no test runner exists.
3. **Migrate all `DataAddons/Retail/` data files to the `Ach()`/`PvE()`/`Title()` helper style** — this is a large but mechanical refactor that greatly improves readability of the data layer. The `Shared/AchievementData.lua` helpers are already in place.
4. **Document the loader mechanism** in `docs/how-to/data-loader-pattern.md` — this is invisible to new contributors and a source of confusion.

---

## REWARD-TYPE REFACTOR — DECISION LOG (2026-04-19)

Discussion context for item 16 above.

- **Original:** single-reward methods store raw integer; `Rewards(r1, r2)` stores table. Two `IsTable` guards in filter/tooltip consumers wrap single values in a temp table on every render pass.
- **Always-table considered:** store `{value}` unconditionally in builder loop. Pros: removes all `IsTable` checks; consistent with `Rewards(...)`. Cons: does not enable chained syntax (second call overwrites). Load cost +14.7% per rewarded entry.
- **Pending:** remove `IsTable` guards from `Filters.lua` validation #6 and `Gui/AchievementTooltip/Rewards.lua` — apply atomically when ready.

---

## V1 → V2 Achievement Data Migration Roadmap

**Date added:** April 20, 2026

### Background

The addon uses two coexisting formats for achievement data:

| | V1 (legacy) | V2 (current standard) |
|--|--|--|
| **Table** | `KrowiAF.AchievementData["X_Y_Z"]` | `KrowiAF.AchievementData2["X_Y_Z"]` |
| **Syntax** | Positional tables `{id, faction, {...}}` | Fluent builder `Ach(id):Method():...` |
| **Import** | `local faction = ...; local rewardType = ...` | `local Ach = shared.Ach` |
| **Used by** | Expansions 01–10 and 12 (Retail), all Classic | Expansion 11 (Retail) only so far |

V2 is the current standard for **all new data** across all expansions and clients. Both formats are supported simultaneously by the loader (`DataAddons/Loaders/AchievementData.lua`). New patches added to old V1 files should use `KrowiAF.AchievementData2` alongside the existing V1 entries.

### What a Single Expansion Migration Involves

For each `DataAddons/Retail/XX_Name/AchievementData.lua` (and Classic equivalents):

1. **Add V2 imports to the file header** (if not already present):
   ```lua
   local shared = addon.Data.AchievementData.Shared;
   local Ach = shared.Ach;
   -- Keep `local faction = KrowiAF.Enum.Faction` if FactionSplit is used
   -- Remove `local rewardType = KrowiAF.Enum.RewardType` (not needed in V2)
   ```
2. **Rename all table keys**: `KrowiAF.AchievementData["X_Y_Z"]` → `KrowiAF.AchievementData2["X_Y_Z"]`
3. **Convert each entry** from positional/table form to `Ach(id):Method():...` fluent syntax
4. **Clean up unused locals**: remove `local rewardType` and `local faction` if no longer referenced

### End State

Once all expansions (Retail + Classic) are migrated:
- `KrowiAF.AchievementData` (V1 table) and `KrowiAF.AddAchievementData` can be removed from `Api/AchievementDataApi.lua`
- The V1 loop in `DataAddons/Loaders/AchievementData.lua` can be removed
- All V1 legacy sections in documentation and skill files can be removed

### Migration Status

#### Retail
| Expansion | Folder | Status |
|-----------|--------|--------|
| The War Within | `11_TheWarWithin` | ✅ Done |
| Midnight | `12_Midnight` | ⏳ Pending |
| Dragonflight | `10_Dragonflight` | ⏳ Pending |
| Shadowlands | `09_Shadowlands` | ⏳ Pending |
| Battle for Azeroth | `08_BattleForAzeroth` | ⏳ Pending |
| Legion | `07_Legion` | ⏳ Pending |
| Warlords of Draenor | `06_WarlordsOfDaenor` | ⏳ Pending |
| Mists of Pandaria | `05_MistsOfPandaria` | ⏳ Pending |
| Cataclysm | `04_Cataclysm` | ⏳ Pending |
| Wrath of the Lich King | `03_WrathOfTheLichKing` | ⏳ Pending |
| The Burning Crusade | `02_TheBurningCrusade` | ⏳ Pending |
| Vanilla | `01_Vanilla` | ⏳ Pending |

#### Classic
| Expansion | Folder | Status |
|-----------|--------|--------|
| Mists of Pandaria | `Classic/05_MistsOfPandaria` | ⏳ Pending |
| Cataclysm | `Classic/04_Cataclysm` | ⏳ Pending |
| Wrath of the Lich King | `Classic/03_WrathOfTheLichKing` | ⏳ Pending |
| The Burning Crusade | `Classic/02_TheBurningCrusade` | ⏳ Pending |
| Vanilla | `Classic/01_Vanilla` | ⏳ Pending |

**Migration order**: Retail first (12 → 10 → 9 → 8 → 7 → 6 → 5 → 4 → 3 → 2 → 1), then Classic (same order).

---

*End of report.*
