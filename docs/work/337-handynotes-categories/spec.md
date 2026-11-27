# Spec: Categories never load on Retail with HandyNotes: Dragonflight enabled
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. An error in any task of the login data load reaches the game's error handler with its stack, as any addon error does: BugSack/BugGrabber records it, and the game's Lua error setting shows it.
2. The load then carries on (Decision, question 1). Every later group runs and `PostLoadOnPlayerLogin` runs.
3. (Scope) The category build is one task per tab tree (Achievements, Expansions, Events, PvP, Specials, each plugin's), not one task for all, so a failing tree leaves only its own tab without categories.
4. The rest of `PLAYER_LOGIN` runs whatever a task in the load's first slice does: the setup of Blizzard's achievement window when it is already loaded, the micro button, the map info hook and the Y binding move.
5. Each failure is recorded in `addon.Data.LoadDiagnostics` under a new kind, `TaskFailed`, with the data group that was loading (`AchievementData 10_02_05`) and the error, and the debug summary after the load lists it. (The headless lint does not go through the game's runner; it already fails on any task error through its own loop, `.claude/tools/headless/load-data.lua:218-226`, and reports any other kind generically, `:262-263`, so it needs no change.)
6. A load without failures behaves as today: the same order, the same per-frame budget, no closure or table allocated per task.
7. (Scope) An error in the achievement cache's coroutine (`Data/AchievementCache.lua`) reaches the error handler too, and the end of the load still runs, so the special categories fill with what was cached.
8. (Decision, question 2) What the player sees beyond the game's error display.
9. The fix leaves headless scenarios behind (Verification).

## Root cause
**The trigger is not known.** It was not reproduced on enUS (2026-10-13), and the reporter's trace lines, errors and plugin list, asked for on Discord on 2026-10-17, have not come. This spec fixes the mechanism that turns one failure into an unusable addon, and leaves the trigger open.

**The mechanism (code on `main`, 2026-11-27):**
- The message is shown when the selected tab's `GetCategories()` returns nil (`Gui/WindowFrames/AchievementsFrame/AchievementsFrameMixin.lua:119-120`). Only `KrowiAF.CreateCategories`, the category data task, sets a tab's categories (`Data/Data.lua:60-65`, `Api/CategoryDataApi.lua`).
- The login load (`Data/Data.lua:165-190`) runs its task groups in this order: achievement data patch by patch, custom criteria, categories, then events, tooltips, pet battle links, transmog sets, guides and zones, then `PostLoadOnPlayerLogin` (`:130-163`). Each group is inserted at the front (`:32-119`) and `StartTasksGroups` takes them from the back (`Data/TaskRunner.lua:45-64`).
- `RunTask` has no error handling (`Data/TaskRunner.lua:3-9`). A task that raises leaves `continue` at once. No timer is scheduled, so the runner never runs again. **An error in any achievement data or custom criteria task leaves every tab without categories for the session**, which is this symptom; reopening the window cannot help, since nothing is left to finish.
- What one task is: one achievement (`KrowiAF.Ach` returns `{KrowiAF.AddAchievementData, id, ...}`, `Api/AchievementDataBuilder.lua:144-146`), one event, tooltip, pet battle link, transmog set or custom criteria entry (`DataAddons/Loaders/*.lua` put the add function in front of each entry), and one task for the whole category build: `KrowiAF.CreateCategories` parses the five tab trees and every plugin's in turn (`Api/CategoryDataApi.lua:203-218`). An error in one tree loses that tree and every tree after it, so skipping a failed task alone does not save the tabs when the failure is in category data.
- The first slice of the load runs synchronously inside the `PLAYER_LOGIN` handler (`Krowi_AchievementFilter.lua:84`, `:103-112`). A failure there also skips everything after it in that handler: `ChangeAchievementMicroButtonOnClick`, the setup of an already loaded Blizzard achievement window, and the Y binding move. Later slices run from `C_Timer.After` (`Data/TaskRunner.lua:24`).
- The error does reach the game's error handler. A player without BugSack and with the game's Lua error display off (the client's default) sees nothing, which fits "no Lua errors".
- The achievement cache ignores what `coroutine.resume` returns (`Data/AchievementCache.lua:170`, `:173`). An error there is lost even with BugSack, the cache's OnUpdate keeps resuming a dead coroutine, and `PostBuildCache` (`Data/Data.lua:145-155`) never runs: the special categories stay empty and `IsLoaded` stays unset. It cannot cause this message (the categories exist by then), but it is the same silent failure.
- **Why our checks never saw it:** the headless pipeline runs every task under `pcall` and reports instead of stopping, "strictly more forgiving than the game" (`.claude/tools/headless/client-env.lua:320-355`).

**The trigger, what was checked (2026-10-13, HandyNotes: Dragonflight v156):**
- Its globals: only `SLASH_MOUNTID1`, `SLASH_PETID1`, LibUIDropDownMenu's `L_*` and its own names; this addon reads none of them.
- Its Ace libraries are none newer than this addon's copies were.
- It ships `Krowi_WorldMapButtons-1.4` minor 9 and registers its button from `OnInitialize`; this addon's minor 11 upgrades the same table in place, keeping `lib.Buttons`. No error path found.
- No achievement API override, no `Blizzard_AchievementUI` load, no achievement frame hook.
- On Krowi's install today HandyNotes: Dragonflight 173 runs beside 107.0 without the problem. The reporter's deDE client was never tried; every headless run and in-game suite runs enUS (`client-env.lua:116`).

## Design
**The runner.** `RunTask` runs each task under `xpcall` with `CallErrorHandler` (Blizzard's `Blizzard_SharedXMLBase/ErrorUtil.lua:1`, on Retail and Classic), so the error handler gets the error and its stack while the stack is still there. To keep requirement 6, the task goes through a file-local variable and fixed functions, `xpcall(RunCurrentTask, OnTaskError)`, where `OnTaskError` keeps the error text and calls `CallErrorHandler`, so nothing is allocated per task. On failure the runner records it (requirement 5) and goes on as the Decision says. `GetNextTask` already moves to the next task or group, so carrying on needs no other change in the loop.

**The record.** `LoadDiagnostics` gets the kind `TaskFailed`, reported with the source its `SetSource` task set for the group (`Data/LoadDiagnostics.lua:36-38`) and the error text. `Print` lists `TaskFailed` among the defect kinds. The headless pipeline's `TaskError` hook (`client-env.lua:352`, `load-data.lua:218-226`) already fails the lint on a task error, unchanged.

**The categories.** `RegisterCategoryDataTasks` registers one task per tree, each parsing one tree through `ParseOnce`, between a first task that sets up `parsed` and a last one that clears it (requirement 3). The order of the trees stays the same, so the category ids drawn for categories without `:WithId` stay the same (the category snapshot proves it).

**The cache.** The two `coroutine.resume` calls check their result. On an error the cache hands it to `CallErrorHandler` (with `debugstack(co)`, so the stack is the coroutine's, not the resume's), clears its OnUpdate, and runs its finish callbacks with what it has (requirement 7).

**What the player sees** (Decision, question 2). With requirements 2 and 3, a tab ends up without categories only when its own tree failed. Today's text for that case, "not yet fully loaded, close and reopen", is then wrong: reopening cannot help. Option 1 shows another text once the load has finished: the runner's finish sets a flag, and the achievements frame (`AchievementsFrameMixin.lua:119-120`) picks the text by it.

## Options considered
**Question 1: after a failed task, what loads?**
1. **(Recommended) Skip that one task, carry on with the next.** Player sees, on every client: the window works; the one achievement (or event, tooltip, zone list, tab tree) that failed is missing; the error is in BugSack.
2. **Skip the rest of its group, carry on with the next group.** Safer if one entry's failure leaves its group's state broken. Player sees: the window works; the rest of that patch's achievements (or that file's events, zones) are missing.
3. **Stop as today, but report.** Player sees: the addon still unusable for the session, with the error in BugSack.

**Question 2: what the player sees beyond BugSack.**
1. **(Recommended) A new window text when a tab has no categories after the load finished,** in place of "not yet fully loaded, close and reopen": the addon could not load this tab's categories, please report it with the Lua errors. Shows only after a failure in that tab's tree. One new text, translated into every locale file in the same change; the achievements frame changes, so the class is `fix/gui` (the plan and look gates ask).
2. **Nothing new.** The error goes to the game's error display only. If the failure is in category data, the player still reads "close and reopen", which cannot help. Class `fix/logic`, no translations.
3. **A chat line at the end of a load that had any failure,** naming the failed group, on top of option 1's text. A second new text in every locale.

**Question 3: scope.**
1. **(Recommended) The runner, the category build per tree, and the cache coroutine.** Player sees: one bad category tree empties only its own tab; an error in the cache no longer leaves the Summary, Watch List and the other special categories empty for the session.
2. **The runner and the category build per tree.** The reported symptom; the cache's silent stop stays.
3. **The runner only.** An error in category data still empties every tab after the failing tree.

## Areas of concern
- **Taint and secret values:** none. The load runs in addon code from an event handler and a timer; `xpcall` and `CallErrorHandler` are plain Lua and a Blizzard helper that calls `geterrorhandler()`; no Blizzard frame, hook or global changes. No secret values are read.
- **Clients:** Retail 120105 and 120107, Mists 50504, Wrath Titan 38002 (`Krowi_AchievementFilter.toc`) share the runner and the cache. `CallErrorHandler` exists in `Blizzard_SharedXMLBase/ErrorUtil.lua:1` in the `live`, `classic` and `classic_titan` clones. Titan has no local client to test on.
- **Blizzard API changes:** none. `xpcall` with a handler and no extra arguments works in every client and in the vendored Lua 5.1.
- **Other addons, plugins and skins:** a plugin's data registered through `KrowiAF.*` runs as tasks in the same load, so a failing plugin entry no longer stops the addon's own data. Error addons (BugSack) see the error as before, now with the stack at the failing line.
- **Saved variables:** none.
- **Localization:** question 2's option 1 adds one text, option 3 two, each into every locale file of `Localization/` in the same change; option 2 none.
- **Embedded libraries:** none.
- **Data snapshots and the headless pipeline:** the data snapshots do not change. The category snapshot must not change either: the trees are parsed in the same order, so the auto-allocated category ids stay. The headless pipeline drives the load through its own loop (`client-env.lua:324-355`), which takes the per-tree category tasks as they are registered.
- **Performance and memory:** one `xpcall` per task, one task per data entry at login (several thousand; the plan measures the load time before and after). No allocation per task (requirement 6). The login load runs once; it is no background job.
- **Player-facing text:** a changelog line under `### Fixed`: "An error in one piece of the addon's data no longer leaves the achievement window without categories; the rest loads."
- **Class:** `fix/gui` with question 2's options 1 and 3 (the achievements frame and the locale files), `fix/logic` with option 2 (`Data/TaskRunner.lua`, `Data/Data.lua`, `Data/AchievementCache.lua`, `Data/LoadDiagnostics.lua`; the scenarios ride along).

## Verification
- **Reproduce first, headless:** a new headless-only suite, `loader`, loads `Data/TaskRunner.lua` and `Data/LoadDiagnostics.lua` alone in the runner's sandbox (as the `runner` and `store` suites load their files) and runs fake task groups with `C_Timer.After` queued. Each scenario loads the runner afresh: its position (`taskIndex`, `Data/TaskRunner.lua:11`) is file-level and not reset when a run ends or stops, so a shared chunk would make one scenario's result depend on the one before it.
  - `task-error-later-groups`: a group whose second task raises, then two more groups. Recorded today: the later groups never run, the finish callback never runs. Target: every later task and the finish callback run.
  - `task-error-reported`: the same load. Recorded: the error handler is called once from the error, nothing recorded. Target: the error handler called once with the error, one `TaskFailed` entry with the group's source.
  - `task-error-first-slice`: the failing task in the first slice, called from a stand-in for the `PLAYER_LOGIN` handler with a step after it. Recorded: the step after it does not run. Target: it runs.
  - `no-error-same-order`: three groups without errors. Recorded and Target: the same task order and one finish call.
  - `category-tree-error`: the category build on the real category data with one tab's tree made to raise (headless, through the `special` suite's whole-addon load or the data pipeline's context). Recorded: that tab and every tab after it without categories. Target: only that tab without categories.
  - With question 2's option 1, `window-text-after-failure`: the achievements frame's text for a tab without categories, before and after the load finished. Recorded: "not loaded" both times. Target: "not loaded" before, the new text after.
  - With scope 1, `cache-error`: a cache coroutine whose work raises. Recorded: the error lost, the finish callbacks never run. Target: the error handler called, the finish callbacks run once.
- **After the fix:** every suite headless on both clients; `Check-Repo.ps1 -ChangedOnly`; the data pipeline (`load-data.lua Both`, no new diagnostics).
- **In game:** the failure cannot be forced in a real login without changing data, so the in-game check is that a normal login is unchanged: deploy to Retail and Mists, `/reload`, `Read-GameErrors.ps1` clean, the debug trace's "Finished loading data" with a time close to before, and the `earned` and `special` suites green.

## Decision
Krowi, 2026-11-27:
- **Question 1:** option 1, skip the one failed task and carry on with the next.
- **Question 2:** option 1, a new window text for a tab without categories once the load has finished. Class `fix/gui`.
- **Question 3:** option 1, the runner, the category build per tree, and the cache coroutine.