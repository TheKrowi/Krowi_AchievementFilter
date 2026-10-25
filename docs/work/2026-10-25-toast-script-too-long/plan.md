# Plan: Clicking an achievement toast can stop with "script ran too long"
Spec: [spec.md](spec.md). Status: accepted

## Context
Krowi clicked the toast of an achievement they had just earned while in combat on Retail and got "script ran too long" from `CategoriesFrameMixin.lua:141`. Root cause (spec, accepted 2026-10-25): after an earn, opening the window on that achievement recounts all 7149 achievement rows of the Expansions tab in one script, and combat's time limit stops it. Decision: recount only what the earn changed (per-category dirty marks), and in the same PR walk the tree once in `ExpandToCategory` and drop the extra full recount for an empty category. This plan becomes `docs/work/2026-10-25-toast-script-too-long/plan.md`. It is not routine (shared GUI code), so it waits for Krowi.

## Files that change
**Seams first, with no change in behaviour (committed with the scenarios):**
- `Data/AchievementCache.lua`: move the window part of `addon.OnAchievementEarned` (lines 189-195: the three `AchievementEarnedUpdate...OnNextShow` flags and `IsTracked = nil`) into `addon.MarkEarnedInWindow(achievementId)`. `OnAchievementEarned` calls it from the same place, after the `criteriaCache` early return. The suite calls it to simulate an earn without writing saved data.
- `Gui/WindowFrames/CategoriesFrame/CategoriesFrameMixin.lua`: `OnEvent` delays a named `KrowiAF_CategoriesFrameMixin:OnAchievementEarned()`, which for now calls `self:Update(true)`, instead of `self.Update, self, true`.

**The suite:**
- `Tests/Earned.lua` (new, suite `earned`, `addon.Tests.Earned`), registered last in `Tests/Files.xml`. It has the shared scenario code plus the game environment, built the way `Tests/Navigation.lua` does it (`Run(env)`, `GameEnv`, `Suites.earned`, `Ready.earned`).
- **Instruments, used by both runs and always put back, also after an error (`pcall`):**
  - A wrapper on `addon.Objects.Category.GetAchievementNumbers` records the top-level categories it is called on (`self.Parent.TabName ~= nil`), the same test `GetDisplayCategories` uses.
  - A wrapper on `addon.GetAchievementNumbers` counts the rows validated (an observation).
- **Each recount scenario yields one of these labels:**
  - "whole tab": every top-level category of the tab outside the expected set was recounted.
  - "earned only": nothing outside the expected set was recounted.
  - "partly n/m": anything else.
  - The expected set is the top-level ancestors of the earned achievement's `Category`, `MoreCategories`, `WatchListCategories` and `ExcludedCategories`, the same for its `NextAchievements`, and the tab's flexible top-level categories.
  - Labels instead of numbers keep the game and headless lines equal while option-dependent special categories differ.
- **Scenarios.** The Recorded values are predictions; the first headless run confirms them.

  | Scenario | What it does | Recorded | Target |
  |---|---|---|---|
  | `earn-select-closed` | Draw Expansions once, close the window, mark achievement 862 (Explore Hellfire Peninsula, present on both clients) earned, then select it (game: `AchievementFrame_SelectAchievement(862)`; headless: `KrowiAF_SelectAchievementFromID(862)`, which the replacement forwards to, `BlizzardOverrides.lua:90-96`) | "whole tab, selected" | "earned only, selected" |
  | `earn-window-open` | Window open on Expansions, mark 862 earned, call `KrowiAF_CategoriesFrame:OnAchievementEarned()` | "whole tab" | "earned only" |
  | `earn-other-tab` | Draw Events and Expansions, close, mark 605 (Lunar Festival, Events) earned, open on Expansions, then switch to Events: was Events' top-level "Holidays" recounted? | "not recounted" | "recounted" |
  | `expand-path-state` | After selecting 862, compare every Expansions category's `NotHidden`/`NotCollapsed` with the path rule (shown iff the parent is on the path, expanded iff on the path) | "matches path rule" | "matches path rule" |
  | `select-empty-category` | Turn the Expansions tab's Completed and NotCompleted filters off for the run, recount once, then `KrowiAF_SelectCategory(862's category)`: is the returned category in the data provider and selected, and was anything recounted? | "selected, whole tab" | "selected, none" |

  - `expand-path-state` is a guard: its Recorded and Target are the same.
  - **Game-only observations:** the milliseconds (`debugprofilestop`) of `AchievementFrame_SelectAchievement(862)` with and without the earn mark, the rows each validated, and the summary's earn refresh (`KrowiAF_SummaryFrame:Update("ACHIEVEMENT_EARNED")` while shown) as a recounted-label observation.
- **What the game environment changes and puts back:**
  - Setup refuses while the data load runs or when the Expansions or Events tab is hidden.
  - It snapshots the window and its tab (as Navigation does) and each tab's `SelectedCategory`, and puts them back with `KrowiAF_SelectCategory`, which expands that path the way a click would.
  - It puts back 862's and 605's `IsTracked`, and the tab's Completion filters followed by `Update(true)`.
  - Nothing is saved.
- `.claude/tools/headless/run-tests.lua`: the new `suites.earned`, plus the suite's line in the header comment.
  - **Base:** the real data load of `client-env.lua`, as `obtainable` builds it (`:1558-1578`).
  - **Real files loaded on top:**
    - `Globals.lua` and `Filters.lua`;
    - `Data/TemporaryObtainable.lua`, with `time` and `KrowiAF_GetUtcOffsetSeconds` as `obtainable` sets them;
    - `Data/SpecialCategories.lua` (`:Load()` only, so each tab has its special top-level nodes);
    - `Data/AchievementCache.lua`;
    - `Gui/WindowFrames/CategoriesFrame/CategoriesFrameMixin.lua`.
  - **Modelled, each with its source in a comment:**
    - `addon.Options.db.profile` and `addon.Filters.db.profile` from `Options/Defaults.lua` and `Filters.lua` defaults, with each tab's `.Filters` a copy of the default achievement filters;
    - `addon.Util` helpers the files call (`TableFindKeyByValue`, `ConcatTables`, `DeepCopyTable`, `DelayFunction` as a direct call);
    - `GetAchievementInfo`: every registered id exists; completed by a fixed rule, with 862 and 605 completed; earnedBy set;
    - `GetPreviousAchievement`: nil;
    - `C_Map.GetBestMapForUnit`: nil;
    - `KrowiAF_CategoriesFrame` from `NewFrame` with the mixin, `OnShow`/`OnHide`/`OnEvent`, `RegisterEvent` and a ScrollBox and `CreateDataProvider` model (Insert, contents read back);
    - `KrowiAF_AchievementsFrame` and `KrowiAF_SummaryFrame` as lenient frames whose list calls are no-ops;
    - `addon.Gui:ToggleAchievementFrame`, modelled by its effect on the categories frame: it selects a tab stand-in (`Index`, `Filters`, `SelectedCategory`, `GetCategories`, and `ShowSubFrames` hiding and re-showing the categories frame, as `AchievementFrame_ShowSubFrame` does through Gui.lua's hook), and hides and shows the categories frame when the tab changes or the window was closed.
- `Tests/README.md` (suite row), `.github/copilot-instructions.md` (suite list under Offline tooling).

**The fix:**
- `Objects/Category.lua`: `category:MarkCountsDirty()` walks up to the category whose parent has `TabName` (its top-level ancestor) and sets `CountsDirty`. No table allocated.
- `Objects/Achievement.lua`: `achievement:MarkCountsDirty()` calls it for `Category`, each `MoreCategories`, `WatchListCategories` and `ExcludedCategories` entry, and does the same for each of `NextAchievements` (collapse series shows the next one).
- `Data/AchievementCache.lua`, in `MarkEarnedInWindow`:
  - drop `AchievementEarnedUpdateCategoriesFrameOnNextShow`, whose only reader is `OnShow`; keep the summary and achievements flags;
  - call `achievement:MarkCountsDirty()`;
  - for each tab in `addon.Tabs`, set `CountsDirty` on its top-level categories with `HasFlexibleData`.
- `Gui/WindowFrames/CategoriesFrame/CategoriesFrameMixin.lua`:
  - **`GetDisplayCategories` (`:81`):** `needsCounts = category.NumOfAch == nil or getAchNums or category.CountsDirty`. Nested categories with a mark keep today's path.
  - **`OnShow`:** `self:Update()`.
  - **`OnAchievementEarned`:** `self:Update()`.
  - **`ExpandToCategory`:** builds the path as a set from `category:GetTree()` and walks the tab once with a new local `ExpandPath(path, category)` that sets `NotHidden = path[category.Parent]` and `NotCollapsed = path[category]`. It then sets the tab root's `NotCollapsed = true`, as `ExpandCategory(root)` did. `ExpandCategory` and `OpenCloseCategory` stay for `SelectCategory`.
- `Api/API.lua:109`: drop `KrowiAF_CategoriesFrame:Update(true)` and its comment; the `AlwaysVisible` set and reset stay.
- `Gui/WindowFrames/SummaryFrame/SummaryFrameMixin.lua:301`: `KrowiAF_CategoriesFrame:Update()`.
- `Tests/Earned.lua`: each Recorded set to its Target.
- `_Packaging/Changelog.md`, `## 104.1` / `### Fixed`: "Clicking an achievement's toast right after earning it, also in combat, opens it in the window without a "script ran too long" error".
- `docs/work/.../spec.md` and `plan.md`: the measured numbers and any departure.

## Order of work
1. Write `plan.md` from this plan into the work folder.
2. **Seams and suite.** Build `Tests/Earned.lua`, `suites.earned` and the registrations. Run `run-tests.lua "$PWD" earned` on both clients:
   - every scenario passes as Recorded, with its target open except `expand-path-state`;
   - if a prediction is wrong, find out why before going on and correct the spec's root cause.
   - Then `Check-Repo.ps1 -ChangedOnly`. Commit: `test: reproduce the full recount after an earn in the earned suite`.
3. **In-game before-run (GUI gate):**
   - `Deploy.ps1 -WhatIf`, then deploy the worktree to Retail and Mists, and name what it replaced (peers: `ListAgents`).
   - Krowi: `/kaftest earned`, then `/reload`.
   - Read the run with `Read-GameTests.ps1` (`-Client Classic` for Mists) and `Read-GameErrors.ps1`. Expected: no FAIL, lines equal to headless. Record the milliseconds in the spec.
4. **Fix**, in the files above. Set Recorded to Target. Headless suite, then every suite through `Check-Repo.ps1 -ChangedOnly`. Commit: `fix: earning an achievement recounts only its own categories, so opening it no longer runs too long`.
5. **Reviews:** `krowi:taint-reviewer` and `/code-review` on the diff. Fix the findings or list them.
6. **In-game after-run** on Retail and Mists, as in step 3. Expected: Target lines, fewer milliseconds, no errors. Also a look by hand: the Expansions and Events counts and the summary bars after a real earn when one comes; that is not forced.
7. Status `done` on all three files, push, open the PR (`Closes` nothing: there is no issue), then the merge gate.

## Risks
- **Stale counts if a place an earn touches is missed:** an achievement listed somewhere not linked from the achievement, or a chain step in another tab. The marks cover every link the achievement holds plus every flexible list, and any filter change still recounts in full. `earn-other-tab` checks the cross-tab case.
- **The single walk sets a different state than the per-level walks.** `expand-path-state` compares every category against the rule before and after the change, so a mismatch shows before the fix lands.
- **Dropping `Update(true)` for an empty category could hide it.** `select-empty-category` checks it is still listed and selected.
- **The headless model drifts from the game:** the tab toggle is a model, the in-game run uses the real one, and `Read-GameTests.ps1` diffs the two.
- **The in-game run changes the player's window:** the restore puts back the tab, each tab's selected category and the filters. Other expanded categories collapse, as after any selection.
- **Deploy collisions with peer sessions:** check `ListAgents` and name what the deploy replaced.

## Proof
- `lua.exe .claude\tools\headless\run-tests.lua "$PWD" earned`: before the fix, every scenario PASS with the targets open except the guard; after it, every scenario PASS with every target met. Both clients.
- `Check-Repo.ps1 -ChangedOnly`: 0 errors (it runs every suite).
- In game, Retail and Mists: `/kaftest earned`, `/reload`, `Read-GameTests.ps1`: no FAIL, no difference from headless, and the milliseconds of the select after an earn well below the before-run. `Read-GameErrors.ps1`: no new row.
- `krowi:taint-reviewer`: no finding left open. `/code-review`: findings fixed or listed in the PR.