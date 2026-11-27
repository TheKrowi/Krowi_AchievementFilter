# Plan: Categories never load on Retail with HandyNotes: Dragonflight enabled
Spec: [spec.md](spec.md). Status: draft

## Files that change
| File | Change |
|---|---|
| `.claude/tools/headless/run-tests.lua` | new headless-only suite `loader` with its scenarios (test first) |
| `Tests/README.md` | the `loader` suite under the headless-only suites ("Four suites") |
| `Data/TaskRunner.lua` | each task under `xpcall`; a failed task reported, recorded and skipped; `addon.RunTaskProtected` for the plugin category pass |
| `Data/LoadDiagnostics.lua` | the kind `TaskFailed`, listed by `Print` among the defects |
| `Api/CategoryDataApi.lua` | the category build in steps: `StartCategories`, `CreateCategoryTree(tree)`, `CreatePluginCategoryTrees`, `FinishCategories`; `KrowiAF.CreateCategories` stays, calling them in order, for anything outside that calls it |
| `Data/Data.lua` | `RegisterCategoryDataTasks` registers one task per tab tree; `PostLoadOnPlayerLogin` sets `TasksLoaded` first |
| `Data/AchievementCache.lua` | both `coroutine.resume` calls checked; on an error: reported, the cache finishes with what it has |
| `Gui/WindowFrames/AchievementsFrame/AchievementsFrameMixin.lua` | the empty-tab text: "not loaded" while the load runs, "failed to load" once `TasksLoaded` is set |
| `Localization/<11 base locales>.lua` | `L["Categories failed to load"]` in all 11; the older `L["Categories not loaded"]` also into esES, esMX, itIT and ptBR, which lack it today (they show English now) |
| `_Packaging/Changelog.md` | a new `## 107.1` with the line under `### Fixed` |

## Order of work
1. **Test first** (`.claude/rules/tests.md`). Add the suite `loader` to `run-tests.lua`. Each scenario builds what it needs on the client `c` the runner hands it and loads the files it tests with `c.loadAddonFile`, afresh per scenario (the runner's `taskIndex` is file-level). Stubs it sets on `c.env`: `C_Timer.After` (a queue the scenario drains), `debugprofilestop`, `GetFrameRate`, `C_CVar.GetCVar`, `CallErrorHandler` (records its calls), `debugstack`.
   - `task-error-later-groups`: groups A (2nd task raises), B, C. Records which tasks ran and whether the finish callback ran.
   - `task-error-reported`: the same load. Records the error handler's calls and the `TaskFailed` entries with their source.
   - `task-error-first-slice`: `StartTasksGroups` called from a stand-in `PLAYER_LOGIN` handler with a step after it; the failing task in the first slice. Records whether the step ran.
   - `no-error-same-order`: three groups, no error. Records the task order and the finish calls (Recorded = Target).
   - `category-tree-error`: the real data load of `client-env.lua` (as `obtainable` uses it) with the PvP tree's root made to raise when parsed. Records which of the five tabs have categories.
   - `plugin-tree-error`: the same with two fake plugin trees registered after the registration step, the first raising. Records whether the second plugin's tree was parsed and the five tabs.
   - `window-text-after-failure`: `AchievementsFrameMixin.lua` loaded alone; `OnShow` on a fake frame whose tab has no categories, before and after `TasksLoaded`. Records the text key shown.
   - `cache-error`: `Data/AchievementCache.lua` loaded with a stubbed `addon.Data` whose achievement list makes `HandleAchievements` raise. Records the error handler's calls and the finish callbacks.

   Every `Recorded` is today's behaviour, every `Target` the spec's. Run `run-tests.lua <root> loader` on both clients: every scenario passes and is open where the behaviour changes. Commit: `test: reproduce #337 in the loader suite`.
2. **Runner.** In `Data/TaskRunner.lua`: file-local `currentTask` and `currentError`; `RunCurrentTask()` runs `currentTask` as `RunTask` does now; `OnTaskError(err)` keeps `err` and returns `CallErrorHandler(err)`. `RunTask(task)` sets `currentTask`, calls `xpcall(RunCurrentTask, OnTaskError)`, and on failure reports `TaskFailed` with the error to `addon.Data.LoadDiagnostics`. Nothing else in the loop changes: `GetNextTask` moves on as before. `addon.RunTaskProtected = RunTask` for step 4.
3. **Diagnostics.** `Kind.TaskFailed` with its comment; add it to `defectKinds`.
4. **Categories.** In `Api/CategoryDataApi.lua`, split `CreateCategories` into the four steps. `CreatePluginCategoryTrees` walks `KrowiAF.CategoryData` when it runs (plugins register theirs in their own `PLAYER_LOGIN`, after ours, `Api/ApiDocumentation.lua:38`) and runs each tree through `addon.RunTaskProtected`, so one plugin's failure costs only its own tree. In `Data/Data.lua`, `RegisterCategoryDataTasks` registers `SetSource`, `StartCategories`, one `{CreateCategoryTree, tree}` per tab tree in today's order (Achievements, Expansions, Events, PvP, Specials), `CreatePluginCategoryTrees`, `FinishCategories`.
5. **Cache.** In `Data/AchievementCache.lua`, a local `ResumeCache()` resumes the coroutine and checks the result; on an error it calls `CallErrorHandler(err .. "\n" .. debugstack(co))`, then the same finish as a normal end (OnUpdate cleared, `coFinished`, the callbacks run). The finish moves into a local function both paths call.
6. **Window text.** `PostLoadOnPlayerLogin` sets `self.TasksLoaded = true` first. `AchievementsFrameMixin:OnShow` picks `"Categories failed to load"` when `addon.Data.TasksLoaded`, else today's text. A window open during the load gets the new text through `gui:RefreshViewAfterPlayerLogin`, which shows the subframes again at the end of the load.
7. **Texts.** The enUS text, below the `Exported at` line (`.claude/rules/localization.md`):
   `{addonName} could not load the categories of this tab.` / `Please report this, with the Lua errors from BugSack.`
   Translated into the 10 other base locales; the older text into the four that lack it.
8. **Changelog.** `## 107.1`, `### Fixed`: "An error in one piece of the addon's data no longer leaves the achievement window without categories; the rest loads."
9. Set each scenario's `Recorded` to its `Target`. Commit: `fix: a failing data entry no longer stops the login load (#337)`.

## Risks
- **The category ids.** Categories without `:WithId` draw ids in parse order. The five trees keep their order and the plugin pass stays last, so the category snapshot must not change; a diff there is a bug in step 4.
- **Plugins calling `KrowiAF.CreateCategories`.** None in this repo; it stays as a function that does the four steps, so an outside caller keeps working.
- **Load time.** One `xpcall` per task. Measured: the trace's "On Player Login: Finished loading data in N ms" on Retail before and after, three reloads each.
- **A task that half-ran.** A skipped task can leave its entry half-registered; later tasks that read it may fail too and are skipped and reported in turn. BugGrabber counts repeats, so a cascade shows as a few rows, not a flood.
- **The game's error handler during the load.** `CallErrorHandler` calls whatever handler is set; BugGrabber's records and returns. Without an error addon the game's own handler shows the error only when the Lua error setting is on, as today.

## Proof
- `run-tests.lua <root>` (every suite, both clients) passes; the `loader` scenarios meet their targets.
- `Check-Repo.ps1 -ChangedOnly` clean (`feature-texts`, `enus-autogen`, `unit-tests`, `category-snapshot`, `data-load`).
- `load-data.lua <root> Both`: no new diagnostics; the category and data snapshots unchanged.
- `krowi:taint-reviewer` on the diff (it changes an event-driven load and a window frame's text).
- In game, Retail and Mists: deploy, `/reload`, `Read-GameErrors.ps1` clean; the load time against the before figures; `/kaftest earned, special, navigation` green. The new text cannot show without a failure, so the look gate gets a screenshot from a debug-only forced failure: a temporary data line that raises, on a local build only, never committed.