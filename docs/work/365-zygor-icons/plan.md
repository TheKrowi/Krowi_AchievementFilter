# Plan: Zygor's guide icons do not show on the addon's achievement rows
Spec: [spec.md](spec.md). Status: accepted

## Context
Issue #365: with Zygor Guides Viewer loaded on Retail, the addon's achievement rows show none of Zygor's guide icons. The spec (accepted 2026-10-26) finds two causes. The plugin `Plugins/ZygorGuidesViewer.lua` starts only from a post-hook on `KrowiAF_ToggleAchievementFrame`: Blizzard's Toggle Achievements key followed by a click on one of the addon's tabs never starts it, and on the addon's own toggle it starts after the list has drawn. Krowi's decision: set the plugin up when the list loads and follow Zygor's drawing, including Zygor's shared icon pool. The drawing code stays as it is. Worktree `.claude/worktrees/fix-365-zygor-icons`, branch `fix/365-zygor-icons`; intent and spec committed as 0c1cb9d6.

## Files that change
- `Tests/Plugins.lua` (new): the `plugins` suite, the first-draw scenarios (below), the in-game environment, `addon.Tests.Ready.plugins`, `addon.Tests.Async.plugins`.
- `Tests/Files.xml`: `<Script file="Plugins.lua" />` after `Earned.lua`.
- `.claude/tools/headless/run-tests.lua`: `suites.plugins` with its model, and the suite in the header's suite list.
- `Tests/README.md`: a `plugins` row. `.github/copilot-instructions.md`: `plugins` in the Offline tooling suite list.
- `Api/PluginsApi.lua`: `pluginsApi:LoadPluginsWithBlizzard_AchievementUI()`, the same loop as `LoadPlugins`, calling `plugin:LoadWithBlizzard_AchievementUI()` where it is a function.
- `Krowi_AchievementFilter.lua`: `LoadBlizzard_AchievementUI()` calls `KrowiAF.PluginsApi:LoadPluginsWithBlizzard_AchievementUI()` after `addon.HookFunctions()`, before it replaces itself.
- `Plugins/ZygorGuidesViewer.lua`: `IconSetup` becomes `Setup`. It returns unless `KrowiAF_AchievementsFrame` and `ZGV.Achievement` (with `IconSetup` and `AvailGuides`) both exist, and runs once (a file-local flag instead of `ZGV.Achievement.KrowiAF_Loaded`). The body stays the same: `ZGV.Achievement:IconSetup()`, `ZGV.SearchIconPool or CreateFramePool(...)`, `hooksecurefunc(KrowiAF_AchievementsFrame.ScrollBox, "Update", ScheduleUpdate)`. `zgv:OnEvent` calls `Setup()` on Zygor's `ADDON_LOADED` instead of hooking the toggle; the new `zgv:LoadWithBlizzard_AchievementUI()` calls `Setup()`. `UpdateIcon`, `UpdateIcons`, `ScheduleUpdate` and `Icon_OnClick` are untouched.
- `_Packaging/Changelog.md`: under the next version's `### Fixed`, a line like "Zygor Guides Viewer's guide icons show on the achievement rows again, from the first time the window opens, also when it is opened with the game's own key binding."
- `docs/work/365-zygor-icons/plan.md` (this plan), and `spec.md` where the in-game before-run changes the facts.

### The `plugins` suite (Tests/Plugins.lua)
Shares its scenarios between both runners through an environment object, like `Tests/Earned.lua`. `plugins.Run(env, observations, done)` runs the scenarios in order and calls `done(results)`; in game it is async, because Zygor draws on a timer.

| Scenario | Opens the list | Recorded | Target |
|---|---|---|---|
| `zygor-blizzard-binding` | Blizzard's `ToggleAchievementFrame()` (what Y does on Blizzard's binding), then a click on the Expansions tab, on a category holding an achievement with a Zygor guide | `none` | `all` |
| `zygor-addon-binding` | the window closed, then `KrowiAF_ToggleAchievementFrame(addonName, "Achievements")` (what the addon's binding does) on such a category | `all` (planned `none`; see step 2) | `all` |

- **Result:** after 0.5 s, count the visible rows of `KrowiAF_AchievementsFrame.ScrollView:GetFrames()` whose achievement is in `ZGV.Achievement.AvailGuides`, and of those, the rows with a shown icon from `ZGV.SearchIconPool:EnumerateActive()` parented to them. The result is `all`, `some` or `none`; with no row with a guide in view, the scenario SKIPs. The counts are an observation.
- **Category selection without calling the toggle**, which would start the old plugin early: the same `AlwaysVisible` marks on the category's path that `KrowiAF_SelectCategory` uses (`Api/API.lua:110-127`). The tab's `SelectedCategory` is the merged category and its `SelectedAchievement` the achievement, so `ShowSubFrames` draws it scrolled to the row (`AchievementFrameTabButtonMixin.lua:10-29`). The marks are cleared right after the open.
- **Picking the achievement:** the first achievement with a Zygor guide whose `Category` or `MoreCategories` lies in the tab and that the tab's filters show (`addon.Filters.Validate > 0`). Picked after Blizzard's toggle, which fills Zygor's guide list through Zygor's own hook.
- **Order matters before the fix:** the Blizzard-binding scenario runs first and never calls the addon's toggle; the addon-binding one uses another tab, so the toggle's `SelectTab` really clicks it.
- **In-game environment:**
  - SKIPs when Zygor's achievement module is missing, on Classic, or when `Blizzard_AchievementUI` was already loaded at the start of the run (the window was opened this session, so the run is not the first draw). Krowi runs it as `/kaftest login plugins`, so it runs right after the `/reload`.
  - The addon-binding scenario SKIPs while `ResetViewOnOpen` is on, which reselects the first category.
  - Each scenario gets a banner and a screenshot (the `/kevutest` way, as `Tests/Tracking.lua` does), then a BugGrabber step for this addon's session errors.
  - Teardown puts both tabs' `SelectedCategory`/`SelectedAchievement` back and closes the window.
  - Observations: the Y binding (`GetBindingAction("Y")`), Zygor's version, the achievements picked.
- **Headless model** (`suites.plugins`):
  - The real code: `Api/PluginsApi.lua`, `Plugins/ZygorGuidesViewer.lua` and `Krowi_AchievementFilter.lua`. The last gives the real `ADDON_LOADED` wiring through `KrowiAF_SpecialFrame:OnEvent`; everything else it calls is the runner's addon stub.
  - A model of Zygor: `ZGV.Achievement` with `IconSetup` filling `AvailGuides` and creating the pool, `ScheduleTimer` queueing, `L.achieveframe_button`.
  - A `CreateFramePool` with `Acquire`, `ReleaseAll` and `EnumerateActive`, and icons with `SetParent`.
  - The list frame with a `ScrollBox.Update` and rows that have `Achievement`, `Header` and `Shield`.
  - Blizzard's `ToggleAchievementFrame`: it loads the UI (makes the list, fires the addon's `ADDON_LOADED`), then runs Zygor's own hook.
  - The addon's toggle, which draws the list inside the call.
  - A suite-local `hooksecurefunc` that also wraps table methods. The runner's shared one only records string hooks, and changing it would change the other suites.

## Order of work
1. **Test first.** Write `Tests/Plugins.lua`, `Tests/Files.xml`, `suites.plugins`, the README row and the suite list entry. Run `run-tests.lua "$PWD" plugins`: both scenarios PASS on `none`, open against `all`. Commit `test: reproduce #365 in the plugins suite`.
2. **In-game before-run (GUI gate).** Message krowi-achievementfilter-c1 before deploying, as it asked. `Deploy.ps1 -WhatIf`, then deploy to Retail, and tell Krowi what was copied and replaced. Krowi, on a Doomhammer character: `/kaftest login plugins`, `/reload`, wait for the run, `/reload` again. Then `Read-GameTests.ps1` and the screenshots. Expected: `none`/`none`, no FAIL. If the game differs (for instance `all` on the addon-binding scenario because the engine redraws the list a frame later), set `Recorded` to what the game shows, update the headless model and the spec's root cause 2, and re-run headless. Commit.
   - **Done 2026-10-26** (Doomhammer, after a first run on Frostmane SKIPped without Zygor): `none` (0 of 13) for Blizzard's binding, `all` (13 of 13) for the addon's toggle. The second scenario's `Recorded` is `all`. The headless model now queues the full update the list makes when a row changes size, and the spec's root cause 2 is marked not reproduced.
3. **Fix.** `Api/PluginsApi.lua`, `Krowi_AchievementFilter.lua`, `Plugins/ZygorGuidesViewer.lua` as above. Headless: both scenarios now give `all`; set `Recorded` to `all` in the same commit as the fix (`fix: Zygor's guide icons show on the achievement rows from the first draw (#365)`).
4. Changelog line; `plan.md` updated where the build departed from it.
5. **Feedback loop:** `Check-Repo.ps1 -ChangedOnly` (the Stop hook too), `krowi:taint-reviewer` on the diff, `/code-review`; fix what they find.
   - **Departures from the build above, from the code review (2026-10-26):**
     - `Setup` only installs the hook; `UpdateIcons` calls `ZGV.Achievement:IconSetup()` first, so Zygor's guide list is built at the first draw, not at load.
     - The plugin API call moved below `LoadBlizzard_AchievementUI = function() end`.
     - In `Tests/Plugins.lua` the count and the screenshot are protected by `pcall`, and the always visible marks are undone after an error. The comments and README say the second scenario is a guard, not a first draw.
     - Not changed: a retry for `Setup` (`ZGV.Achievement` exists from Zygor's file load, before its `ADDON_LOADED`), and the shared-pool and hidden-list findings (the list's template is hidden, `ForceUpdate` returns while the list is hidden, and the plugin draws only when the list itself redraws; the shared pool is Krowi's decision).
6. **In-game after-run:** deploy (c1 first), `/kaftest login plugins`, `/reload` twice, `Read-GameTests.ps1` (`all`/`all`, no FAIL, no Lua errors), `Read-GameErrors.ps1`. Then Krowi opens the window by hand with Y on Krowidhone (account #3, Blizzard's Y) and on an account #1 character (the addon's Y), clicks into a category with a Zygor guide and looks at the rows.
7. **Deploy stage:** work files `Status: done`, commit by explicit path, push, PR against `main` with `Closes #365`, the template filled in.

## Risks
- **The before-run may show the addon-binding case working before the fix** (an engine redraw after the toggle). Then root cause 2 is wrong; step 2 records what the game shows. The fix still covers the Blizzard-binding case, the likely one of the report.
- **The suite's open path is addon code calling Blizzard's `ToggleAchievementFrame`.** Y runs that securely, so the run taints the window's open until the next `/reload`. Debug mode only, like the escape and earned suites. The README row says to `/reload` before combat.
- **Event order:** the plugin's own `ADDON_LOADED` for `Blizzard_AchievementUI` may come before the addon has made the list. The plugin API call from `LoadBlizzard_AchievementUI` removes the dependence on frame order. The headless model fires the real wiring.
- **Zygor's `IconSetup` now runs at `Blizzard_AchievementUI` load instead of the first toggle.** It builds the same guide list (the guides register at Zygor's file load) and hooks Blizzard's list a moment earlier. Zygor does the same on its own first `ToggleAchievementFrame`.
- **Tab state the run touches** (`SelectedCategory`, `SelectedAchievement`, `AlwaysVisible` marks) is put back by the teardown; the marks are cleared right after each open.
- **Shared game folder:** peers deploy to the same Retail AddOns folder. Message c1 before each deploy and name what was replaced.
- **Mists:** Zygor's install there does not load; the guard keeps the plugin silent, and the suite SKIPs on Classic.

## Proof
- Headless: `& "$kit\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" plugins`. Before the fix: 2 passed, 2 open. After: 2 passed, 0 open. `Check-Repo.ps1 -ChangedOnly` clean.
- In game, Retail, Doomhammer: before-run `none`/`none` (or what the game shows, recorded); after-run `all`/`all` with screenshots showing the magnifying glass on the rows. The BugGrabber step passes, and `Read-GameErrors.ps1` shows no new row or bumped count.
- Krowi's look: icons on the first open with Y on both accounts.
- `krowi:taint-reviewer`: no new hazard. `/code-review`: findings fixed or listed in the PR.