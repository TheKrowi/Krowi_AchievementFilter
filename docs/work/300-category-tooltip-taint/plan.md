# Plan: Secret number errors when a tooltip closes after using the achievement window
Spec: [spec.md](spec.md). Status: accepted

## Context
Issue #300: on Retail, after a player hovers a category on Blizzard's Guild tab (or Blizzard's Achievements tab) in KAF's window, every later tooltip with a widget set (map POI, vignette) can error on close with `LayoutFrame.lua:493 ... secret number value (execution tainted by 'Krowi_AchievementFilter')`, repeating until `/reload`. The hover runs Blizzard's `AchievementFrameCategory_StatusBarTooltip` tainted, which creates `GameTooltip.statusBarPool` tainted, and `GameTooltip_OnHide` reads that pool before clearing the widget set (spec.md, Root cause). The maintainer chose option 1 on 2026-10-23: on Retail, KAF draws that tooltip on its own progress-bar tooltip, so `GameTooltip` is never touched.

This plan is not routine: it replaces a Blizzard FrameXML function. The maintainer approved it on 2026-10-23.

## Files that change
- `Gui/BlizzardOverrides.lua`
  - A new `addon.Gui.BlizzardCategoryTooltip` table above `addon.OverwriteFunctions` (Gui.lua, which creates `addon.Gui`, loads before this file on both clients):
    - `Show(button)`: `addon.ProgressBarLib.GameTooltipWithProgressBar:Show(button, "ANCHOR_RIGHT", button.name, 0, button.numAchievements, button.numCompleted, 0, 0, 0, addon.Util.Colors.GreenRGB, nil, nil, nil, button.numCompletedText)`, the call `addon.Gui.ShowStatusBarTooltip` (Gui/Gui.lua:283-302) makes for KAF's own categories, with the fields Blizzard's initializer sets (Blizzard_AchievementUI.lua:581, 591-593). Then it points the watcher at the button and sets the watcher's `OnUpdate`.
    - A file-local watcher frame, created on the first `Show`. Its `OnUpdate` returns at once while the progress-bar tooltip is shown and owned by the button, and the button is visible and under the mouse (`IsMouseOver`, the test Blizzard's own `AchievementFrameCategories_UpdateTooltip` uses). Otherwise it hides the tooltip if the button still owns it, clears its owner and clears its own `OnUpdate`. No table or closure is made per tick.
    - `CheckLeave()`: one tick of the watcher, for `Tests/Tooltip.lua` (as `TaintDiagnostics.lua` exposes `SweepOnce` to the memory suite).
  - In `addon.OverwriteFunctions`, Retail only (`addon.Util.IsMainline`): `AchievementFrameCategory_StatusBarTooltip = addon.Gui.BlizzardCategoryTooltip.Show`, with a short comment on the mechanism and the issue number.
- `.claude/tools/Check-Repo.globals`: `Gui/BlizzardOverrides.lua AchievementFrameCategory_StatusBarTooltip`, with the reason, in the OverwriteFunctions block.
- `.claude/tools/Check-Repo.jobs`: `Gui/BlizzardOverrides.lua OnUpdate -`, "only while the category tooltip of Blizzard's Achievements or Guild tab is shown (Retail)", in the not-background-jobs block.
- `Tests/Tooltip.lua`: two scenarios of a new `Kind = "category"`, Retail only:
  - `blizzard-category-tooltip`: a stand-in category button (the addon's own Button frame with `name`, `numAchievements`, `numCompleted`, `numCompletedText`) is passed to `AchievementFrameCategory_StatusBarTooltip`, the call a real button's `OnEnter` makes through its `showTooltipFunc`. It records which tooltip the button then owns: `GameTooltip`, `progress bar` (KAF's) or `none`. Recorded `GameTooltip`, Target `progress bar`.
  - `blizzard-category-tooltip-leave`: the same show, then Blizzard's leave handler `AchievementCategoryTemplateButtonMixin.OnLeave(button)` and one watcher tick (`CheckLeave`, when it exists), with the button away from the cursor. It records whether a tooltip the button owns is still shown. Recorded `hidden`, Target `hidden`: a guard for requirement 2, since Blizzard's handler hides `GameTooltip` today.
  - Game env: loads Blizzard_AchievementUI if needed (`AchievementFrame_LoadUI`, as Tests/Navigation.lua does); the stand-in sits in the screen corner furthest from `GetCursorPosition`. Teardown hides KAF's tooltip, and `GameTooltip` only when the stand-in owns it.
  - `Setup` skips the Objectives progress option check for this Kind, the result line drops `id=` when a scenario has none, the Ready check already skips scenarios with a Kind, and the header comment describes the scenarios.
  - An observation on both clients: whether the global `AchievementFrameCategory_StatusBarTooltip` is Blizzard's (`issecurevariable`) or replaced by the addon. That gives the Mists check without a hover.
  - The run note: before the fix the first scenario calls Blizzard's tooltip from addon code and leaves `GameTooltip.statusBarPool` tainted for the session, so reload before combat.
- `.claude/tools/headless/run-tests.lua`, in `suites.tooltip`:
  - Models of `GameTooltip` (`SetOwner`, `IsOwned`, `GetOwner`, `SetMinimumWidth`, `SetText`, `Show`, `Hide`, `IsShown`) and of `GameTooltip_ShowStatusBar`.
  - Blizzard's `AchievementFrameCategory_StatusBarTooltip` as a copy of Blizzard_AchievementUI.lua:777-783, and `AchievementCategoryTemplateButtonMixin.OnLeave` as a copy of 618-621.
  - `addon.ProgressBarLib.GameTooltipWithProgressBar` with a model tooltip, and `addon.Util.Colors.GreenRGB`.
  - Loads the real `Gui/BlizzardOverrides.lua` and runs `addon.OverwriteFunctions()`. Undefined globals resolve to nil headlessly, so its telemetry block is skipped.
  - The stand-in button gets `IsMouseOver` returning false.
  - The runner's header comment names the file.
- `Tests/README.md`: the `tooltip` row describes the category scenarios.
- `_Packaging/Changelog.md`, 104.0 `### Fixed`: "Tooltips no longer give "secret number value" errors each time they close after you hover a category on the Guild tab; those categories now show the same progress tooltip as the addon's own".
- `docs/backlog.md`: spec option 3 (stop running Blizzard's tab code from KAF) as a follow-up.
- `docs/work/300-category-tooltip-taint/plan.md`: this plan, kept up to date.
- `docs/work/300-category-tooltip-taint/spec.md`: root cause step 1 corrected (found while answering the maintainer at the plan gate, 2026-10-23).
  - The player's click on Blizzard's Guild tab runs Blizzard's own `OnClick` (Blizzard_AchievementUI.xml:2569). That reads the global `AchievementFrameTab_OnClick`, which KAF rewrites each time it opens the window (Gui/Gui.lua:206; Blizzard's own toggle writes the same value, Blizzard_AchievementUI.lua:221).
  - It also reads `AchievementFrame.numTabs` in `PanelTemplates_UpdateTabs` (SharedUIPanelTemplates.lua:385, live). KAF raised that count when it added its own tabs (Gui/WindowFrames/AchievementFrameTabButtonFactory/AchievementFrameTabButtonFactory.lua:47-62), so the click runs tainted even without the global.
  - Gui/Gui.lua:27-37 only applies when KAF itself selects the tab (key bindings, the micro button).
  - The second route is why stopping the global write alone would not fix it, and why spec option 3 is uncertain.

## Order of work
1. **Scenarios first,** with Recorded set to today's behaviour: `Tests/Tooltip.lua`, the headless model and the README row. Headless: `blizzard-category-tooltip` PASS with its target open (`got=GameTooltip`), `-leave` PASS. Run `Check-Repo.ps1 -ChangedOnly`.
2. **In-game before-run** (the rule for GUI work):
   - `Deploy.ps1 -WhatIf`, then deploy to Retail, naming what it replaced (peer sessions per `ListAgents`).
   - Krowi: `/reload`, `/kaftest tooltip`, `/reload`.
   - `Read-GameTests.ps1`: no FAIL and no unexplained difference from headless.
   - Commit `test: reproduce #300 in the tooltip suite`.
3. **The fix:** `Gui/BlizzardOverrides.lua`, the globals and jobs lists. Set `Recorded` to `progress bar` for the first scenario. Headless: both PASS with their targets met. Full `Check-Repo.ps1`, with `-Luals` once.
4. **Changelog, backlog and plan.md** updates.
5. **Review:** `krowi:taint-reviewer` on the diff, `Find-DeprecatedApi.ps1`, `/code-review`; fix what they find or list it in the PR.
6. **In-game after-run** (Retail):
   - Deploy. Krowi: `/reload`, `/kaftest tooltip`, `/kaftest escape`, `/kaftest navigation`, `/reload`, then `Read-GameTests.ps1`.
   - Krowi by hand: hover a Guild tab category (Print Screen), move off it, close the window. Then open the map, hover a POI with a widget, move off, `/reload`.
   - Read the probe's last session and `Read-GameErrors.ps1`.
   - Mists: one `/kaftest tooltip` for the observation that the global is Blizzard's.
7. **Ship the PR:** set the work files to `Status: done`, commit `fix(retail): draw Blizzard's category tooltip on the addon's own tooltip (#300)` by explicit path, push, and open the PR with `Closes #300`.

## Risks
- **The override lands after Blizzard's list first fills.** Then its buttons keep Blizzard's function until the list refills. `OverwriteFunctions` runs at Blizzard_AchievementUI's `ADDON_LOADED`, or at `PLAYER_LOGIN` when it loaded earlier, both before the window can first show. The hand check in step 6 hovers a real button.
- **The tooltip stays up after the mouse leaves,** for example under an overlapping frame. Guarded by the `-leave` scenario and the hand check; `IsMouseOver` matches Blizzard's own test.
- **Taint.** One more replaced global. Blizzard's initializer reads it at line 594, so its event-driven refreshes run tainted from there; those only reach the window's category buttons. Reviewed by `krowi:taint-reviewer`.
- **The before-run taints `GameTooltip` itself** until `/reload`. The run note says so, and Krowi reloads after it.
- **Skins.** The ElvUI, GW2_UI and EllesmereUI plugins already skin this tooltip; no change in them.
- **Other entry points** of the same error, if any, stay visible in the probe.

## Proof
- `lua.exe .claude\tools\headless\run-tests.lua "$PWD" tooltip`: on Retail, `tooltip/blizzard-category-tooltip: PASS ... got=progress bar target=progress bar met` and `tooltip/blizzard-category-tooltip-leave: PASS ... got=hidden ... met`. On Classic, no scenarios.
- `Check-Repo.ps1`: 0 errors; the `globals`, `background-jobs`, `unit-tests` and `work-items` rules pass.
- `Read-GameTests.ps1` after the after-run: the `tooltip`, `escape` and `navigation` suites have no FAIL. The tooltip observation says the global is replaced by the addon on Retail and is Blizzard's on Mists.
- The hand check: the Guild tab category tooltip shows the name, KAF's bar and `completed/total` (screenshot), and hides when the mouse leaves.
- The probe's last session after the POI hover has no `statusBarPool` and no `GameTooltip.widgetContainer` detection with `TaintedBy = "Krowi_AchievementFilter"`, against the 2026-10-23 19:57 session that had both.
- `Read-GameErrors.ps1`: no new `LayoutFrame.lua` row and no bumped count.