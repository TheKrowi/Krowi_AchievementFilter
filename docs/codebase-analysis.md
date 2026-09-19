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

### 2. Inconsistent Semicolon Usage ✅ FIXED (2026-09-11)

Per the project's own instructions, semicolons should not be used, yet almost every file in `Api/`, `Options/`, `DataAddons/` and `Gui/WindowFrames/` ended statements with them while newer files such as `Data/TemporaryObtainable.lua` did not. The tree was stripped in one pass by `.claude/tools/Strip-Semicolons.ps1`: 7572 statement semicolons removed and 21 table-field separators turned into commas across 221 files, each file accepted only after `luac -s` produced byte-identical bytecode before and after. The `semicolon` lint rule keeps them from coming back on added lines.

### 3. Inconsistent Data Entry Style in `DataAddons/Retail/` ✅ FIXED (verified 2026-09-09)

The V2 `Ach()` builder (defined in `Api/AchievementDataBuilder.lua` as `KrowiAF.Ach`) is the only style in use. All new data files and new patch tables must use:

```lua
local Ach = KrowiAF.Ach
```

<details>
<summary>Original issue (resolved before 2026-05-29, verified 2026-09-09)</summary>

The legacy expansion data files used the old verbose V1 style (bare positional arguments) next to V2 files, splitting maintenance between two formats. As of 2026-09-09 all 17 `AchievementData*.lua` files under `DataAddons/` contain V2 entries only (grep for `^\s*\{\s*\d+\s*,` finds zero V1 rows). The interim `shared.Ach` factory was superseded by `KrowiAF.Ach`; the last two stale references (`wiki/achievement-data/achievement-data-format.md`, `.claude/skills/add-achievement-data/SKILL.md`) were fixed 2026-09-09.

</details>

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

### 12. `achievementPatch` is Implicit Shared Mutable State

`Api/AchievementDataApi.lua`:

```lua
local achievementPatch  -- module-level upvalue
function KrowiAF.SetAchievementPatch(major, minor, patch)
    achievementPatch = KrowiAF.GetBuildVersion(major, minor, patch)
end
```

Every `AddAchievementData` call implicitly reads `achievementPatch` — the value set by the most recent `SetAchievementPatch` call. In the V2 patch-table format the first entry of every patch table is always `{KrowiAF.SetAchievementPatch, major, minor, patch}`, which keeps this safe by convention. However:

- A patch table that accidentally omits the setter row will silently inherit the previous patch's `BuildVersion`.
- The initial value is `nil`, so any achievement registered before the first `SetAchievementPatch` call (e.g., a malformed data file loaded before the setter) gets `BuildVersion = nil` with no error.

**Status:** By design — the sequential task-group execution model makes this safe in practice. Documented here as a constraint that must be respected by all data files.

### 13. Mixed Positional and Field-Keyed Extras Table in `AchBuilder`

`Api/AchievementDataBuilder.lua`: the `extras` object stored at `self[3]` is used simultaneously as a hash map (`e.Faction`, `e.AltId`, `e.RewardType`, `e.IsPvP`, `e.IsRealmFirst`, `e.AutoPair`) and as a sequential array (season entries like `{"PvE Season", 13}`, obtainables like `{"From", "Date", {2024, 11, 4}, ...}`). `AddAchievementData` separates them with `if #extras > 0 then` (numeric entries become `temporaryObtainables`) and named-field reads.

This works but makes the extras structure opaque — its shape cannot be inferred from any single call site. Validation of the extras table is entirely implicit (wrong types or wrong keys produce wrong data silently, not errors).

**Status:** No change today. Documented as a structural constraint to be aware of when extending the builder.

### 14. V1 Category Parser Maintained Alongside V2

`Api/CategoryDataApi.lua` contains two parallel code paths: the V1 parser (`ParseCategory` / `ParseChildData`) which uses runtime type-sniffing on positional arguments, and the V2 path (`ParseCategoryV2`) which uses explicit named fields (`_v2 = true` sentinel). Both code paths are active and process the majority of the data tree.

The V1 parser is fragile by design — a wrong type at the wrong positional index is silently misrouted (a numeric name, a boolean ID, or a misplaced nil will produce incorrect category structure). Migration to V2 is the long-term fix.

**Status:** V1 must remain available for existing plugin authors who use the V1 format. A future migration will move all first-party data to V2 and then V1 support can be deprecated. No code changes today.

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
| 5 | ✅ FIXED | `RemoveCategory` matches by Name+Level, not identity | `Objects/Category.lua` | Fixed 2026-09-11: reference equality. The only caller is `ClearTree` in `Globals.lua`; the Watch List and Excluded tree rebuilds (`Options/Layout.lua`, `ReloadWatchedAchievements`) reset the special root's `Children` without clearing the per-achievement `WatchListCategories`/`ExcludedCategories`, so an unwatch afterwards walked the orphaned chain and the name match removed the live node of the same name, which could empty the root and trigger `ClearWatchedAchievements`. Clearing the per-achievement lists on rebuild is an optional follow-up for row 14. |
| 6 | ✅ FIXED | `ToggleGameMenu` hook block 2 is dead code | `Krowi_AchievementFilter.lua` | Fixed 2026-09-19, the finding itself was wrong: block 2 re-armed the `KrowiAF_SpecialFrame` proxy in `UISpecialFrames` so the next Escape closed the next frame. The real defects, all verified by the `escape` suite in `Tests/` (in game through `/kaftest`, headlessly through the `unit-tests` lint rule): the hook ran after every branch of Blizzard's handling, so it hid a frame even when a popup, menu or spell cast had consumed the press; the Map Verifier was missing from its list; and the proxy stayed shown after a close button, which swallowed one Escape. Replaced by `Gui/FramesForClosing.lua`: an ordered list of shown registered frames, closed one per press from the proxy's `OnHide` inside Blizzard's `CloseSpecialWindows` on both clients (Retail 12.1's `RegisterGameMenuEscHandler` taints Blizzard's handler table when an addon registers, so every Escape then ran tainted; rejected). The achievement window takes its turn in the list on both clients because the addon's toggle shows it with a plain `Show`, so the panel manager never holds it; a panel registered through `ShowUIPanel` by another path is closed through `HideUIPanel`, because a plain `Hide` leaves it registered and `CloseWindows` then swallows every following Escape (`HideUIPanel` returns early for a hidden frame). |
| 7 | ✅ FIXED | Magic number `9999` for synthetic category ID offsets | `Globals.lua` | Fixed 2026-09-14: the mirror nodes take `addon.Data.GetNextFreeCategoryId()` instead. The offset was worse than a missing constant: explicit ids (57 on Retail, highest 2570) plus 9999 landed inside the auto-generated range (9000 to 10474 on Retail, growing about 150 per expansion) and the Blizzard tab range that follows it, and the same id was written for every tab and every special tree, so the registry entry never identified one node. No collision existed on 2026-09-14 only because no explicit id below 476 exists. |
| 8 | ✅ FIXED | Missing solution #24 in migration chain | `Data/DataIntegrityManager.lua` | Fixed 2026-04-19: entire legacy solutions list removed |
| 9 | ✅ FIXED | "varify" typos in debug messages | `Data/DataIntegrityManager.lua` | Fixed 2026-04-19 |
| 10 | ✅ FIXED | BrowsingHistory stored to SavedData but never restored | `BrowsingHistory.lua` | Fixed 2026-09-14: session-local `records` table; `Load` removes the stale `KrowiAF_SavedData.BrowsingHistory` once. The restore was commented out in the feature's first commit (5c64807, 2024-05-03), so session-only was the design; restoring would be wrong anyway because auto-generated and mirror category ids shift between releases. |
| 11 | ✅ FIXED | Undocumented `ignoreAchievementIds` entries | `Data/SavedData/AchievementData.lua` | Fixed 2026-09-14: 7268, 7269, 7270 are the Temple of Kotmogu scenario achievements from the Mists of Pandaria beta (never released, no faction, no reward), now commented; 40910/40821 already carried a comment and a Retail/Classic split; 42114 had been removed in 98.2. |
| 12 | ✅ FIXED | Dead code: `GetTopMostParentCategory` + debug branch for `120005` | `Globals.lua` | Fixed 2026-09-09: both removed |
| 13 | ✅ FIXED | `Plugins/Plugins.lua` entirely commented out | `Plugins/Plugins.lua` | Fixed 2026-09-09: file and its commented-out `Files.xml` line deleted |
| 14 | 🟡 LOW | `Globals.lua` is too large / does too much | `Globals.lua` | Refactor: split cache, compat, and window management |
| 15 | ✅ FIXED | Mixed indentation and semicolons throughout codebase | All files | `.editorconfig` exists; the style rules live in `.github/copilot-instructions.md`. Semicolons stripped tree-wide 2026-09-11 by `.claude/tools/Strip-Semicolons.ps1` (7593 in 221 files, bytecode-verified); the `semicolon` lint rule guards added lines. |
| 16 | ✅ FIXED | `AchBuilder` reward consumer guards: `IsTable` check + temp table alloc on every filter/render pass | `Filters.lua` validation #6, `Gui/AchievementTooltip/Rewards.lua` | Fixed 2026-04-26: `IsTable` guards removed from both consumers. `RewardType` is always a table or nil. |
| 17 | ✅ FIXED | `shared.Ach` reference in docs/skills diverged from actual `KrowiAF.Ach` factory | `copilot-instructions.md`, `ApiDocumentation.lua`, `docs/how-to/`, skill files | Fixed 2026-06-21; two stragglers in the wiki and the add-achievement-data skill fixed 2026-09-09. |
| 18 | 🟡 LOW | `achievementPatch` implicit mutable state (see THE BAD §12) | `Api/AchievementDataApi.lua` | By design; no code change. Documented as constraint. |
| 19 | 🟡 LOW | Mixed positional+field extras table in AchBuilder (see THE BAD §13) | `Api/AchievementDataBuilder.lua` | No change today; documented as structural constraint. |
| 20 | 🔄 FUTURE | V1 category parser maintained alongside V2 (see THE BAD §14) | `Api/CategoryDataApi.lua` | Migrate all first-party data to V2, then deprecate V1. Plugin authors must stay on V1 until notified. |
| 21 | ✅ FIXED | Accidental globals: `GetActiveCalendarEvents`, `AddNestedCriterium`, `HandleScrollBar`, `DebugTable` declared without `local` | `Data/EventData.lua`, `Gui/RightClickMenu/AchievementMenu/PetBattleLinks.lua`, `Plugins/GW2_UI/GW2_UI.lua`, `Options/General.lua` | Fixed 2026-09-09; guarded by the new `globals` rule in `.claude/tools/Check-Repo.ps1` (allowlist `Check-Repo.globals`) |
| 22 | ⛔ WON'T FIX | `TooltipData.Load()` commented out as an Issue #300 diagnostic in 99.6 and shipped that way through 100.3, although 99.9 found the taint cause elsewhere | `Krowi_AchievementFilter.lua` | Decided 2026-09-09: stays disabled by design. It was switched off for taint problems, the feature has not been maintained for a long time and is not a priority. Do not re-enable; the only remaining cleanup would be removing the dead call and data, and only on request. |
| 23 | ✅ FIXED | Calendar wrapper globals `C_CalendarSetMonth`, `C_CalendarSetAbsMonth`, `C_CalendarResetAbsMonth`, `C_CalendarGetMonthInfo` mimicked Blizzard API names in `_G` | `Gui/AchievementCalendar/MonthCursor.lua` | Fixed 2026-09-11: file renamed from `C_Calendar.lua`, functions moved to `addon.Gui.Calendar.MonthCursor` (`SetMonth`, `SetAbsMonth`, `ResetAbsMonth`, `GetMonthInfo`), the four allowlist lines in `Check-Repo.globals` deleted. The `Check-Repo.globals` allowlist now holds only the deliberate FrameXML overrides and API polyfills. |
| 24 | ✅ FIXED | Two overlapping instruction files (`CLAUDE.md` and `.github/copilot-instructions.md`) drifted apart: V2 header and patch record, `Plugins/Plugins.lua`, `Data/Retail`, "dev merges to main" | `CLAUDE.md`, `.github/copilot-instructions.md`, `CONTRIBUTING.md` | Fixed 2026-09-09: `copilot-instructions.md` is the single canonical file (merged and corrected); `CLAUDE.md` imports it with `@` and keeps only the Claude Code wiring; lint messages, the release skill and `CONTRIBUTING.md` point at the canonical file |
| 25 | ✅ FIXED | Lua language-server config was a 600-line hand-grown `Lua.diagnostics.globals` block in `.vscode/settings.json` (auto-appended by `ketho.wow-api` while its annotation library pointed at a long-uninstalled extension version, so every WoW global was "unknown"), with `deprecated` and `undefined-field` switched off | `.luarc.json`, `.vscode/settings.json`, `.claude/tools/Check-Repo.ps1` | Fixed 2026-09-11: editor-neutral `.luarc.json` (Lua 5.1, `Libs/` and non-addon folders ignored, 166 globals no annotation covers, `deprecated` back on); the extension's FrameXML annotations on and its auto-globals off in `.vscode/settings.json`; new lint rules `luarc` (list stays exact) and `luals` (language server tree-wide, 6 pre-existing warnings: 2 `need-check-nil`, 4 `invisible`). `undefined-field` stays off: 56 findings, almost all fields the addon injects into Blizzard frames (`HeaderDetails`, `KAF_AddDefaultValueText`, ElvUI `Point`/`backdrop`); typing those is a follow-up. |

---

## CONTINUATION NOTES FOR NEXT SESSION

When resuming work in a new chat, paste this report as context and reference these section numbers. The most productive starting points are:

1. **Fix the three HIGH bugs first** (items 1–3 above) — they affect correctness in production.
2. **Refactor `Globals.lua`** — splitting the async cache builder into `Data/AchievementCache.lua` would also allow the `HandleAchievement`, `HandleCompletedAchievement`, `HandleNotCompletedAchievement` family to be tested in isolation conceptually, even if no test runner exists.
3. **Migrate all `DataAddons/Retail/` data files to the `Ach()`/`PvE()`/`Title()` helper style** — this is a large but mechanical refactor that greatly improves readability of the data layer. The `Shared/AchievementData.lua` helpers are already in place.
4. **Document the loader mechanism** in `docs/how-to/data-loader-pattern.md` — this is invisible to new contributors and a source of confusion.

---

*End of report.*

## Follow-ups from the zone-data sweep (2026-09-06)

Two code changes fell out of the zone placement rules work (rules in `.claude/skills/add-zone-data/SKILL.md`, decision record in `wiki/achievement-data/zone-data-format.md`). Both are runtime changes, not data. **Both applied 2026-09-06** on the `chore/zone-sweep-followups` branch: item 1 removed the file, the now empty `Data/Retail/Files.xml` and its `.toc` line, the `Data.lua` call and the skill; item 2 added a `GetAchievementsForMap` helper in the mixin that unions the Zone-type descendants (`C_Map.GetMapChildrenInfo(mapID, Enum.UIMapType.Zone, true)`) for Continent and World maps. The text below is kept as the record of what was asked.

### 1. Retire the ExportedUiMaps fallback mechanism

Every fallback entry of `Data/Retail/ExportedUiMaps.lua` has been migrated into `DataAddons/*/ZoneData.lua`; the file's `tasks` table is empty but the file is still registered in `Data/Retail/Files.xml` and `Data/Data.lua` (around line 146) still calls `self.ExportedUiMaps.RegisterTasks(self.Maps, self.Achievements)` when the table exists. Remove the file, its Files.xml line, the two Data.lua lines, the `A`/`C`/`A10`/`A25` helpers and the `.claude/skills/migrate-zone-fallbacks` skill (obsolete), then run `.claude/tools/Check-Repo.ps1` and the headless pipeline for both clients. There is no Classic counterpart file. Low risk, no Blizzard API involved.

### 2. World Map button on continent maps

Continent maps no longer carry zone data (placement Rule 1, decision D2), so `KrowiAF_WorldMapButtonMixin:Refresh` in `Gui/WorldMapButton/WorldMapButtonMixin.lua` finds nothing for Kalimdor, Khaz Algar and the other continents and disables the button. Intended fix: when `C_Map.GetMapInfo(mapID).mapType` is `Enum.UIMapType.Continent` (or World), union the achievements of the child maps from `C_Map.GetMapChildrenInfo(mapID)` (zones and their link groups; de-duplicate, the same meta sits on many zones) before counting. `addon.GetAchievementsInZone` itself stays a flat lookup so the Current Zone category is unaffected. Read-only map API, no Blizzard frame hooks, but it is GUI code: run the `taint-reviewer` subagent on the diff and test the button on a continent map, a zone and inside a dungeon (10/25-player difficulty branch). Add a changelog line under the next version.