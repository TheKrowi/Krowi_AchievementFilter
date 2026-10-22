# Plan: Interface code branches on Krowi_Util's IsModern, not IsMainline
Spec: [spec.md](spec.md). Status: accepted

Approved by Krowi on 2026-10-22. Branch `refactor/2026-10-22-modern-flags`, stacked on PR #355 (Krowi_Util 2.8, Krowi_Menu 2.2).

## Files that change
- **`addon.Util.IsMainline` → `addon.Util.IsModern`** (interface sites, reasons in the spec):
  - `Gui/BlizzardOverrides.lua` (lines 32, 38, 49, 78, 159)
  - `Gui/WorldMapButton/WorldMapButton.lua:24`
  - `Gui/WindowFrames/FilterButton/FilterButton.lua:23`, `FilterButtonMixin.lua:3` (`local isModern`)
  - `Gui/WindowFrames/Search/OptionsMenuButton/OptionsMenuButtonMixin.lua:34`
  - `Gui/WindowFrames/AchievementButton/AchievementButtonExtraIconFactory.lua` (74, 208, 278, 291)
  - `Gui/RewardPreview/RewardPreviewMixin.lua:162`, `Gui/DataManager/Frame/FrameMixin.lua:109`
  - `Plugins/ElvUI.lua:677`, `Plugins/GW2_UI/GW2_UI.lua` (16, 1018, 1110), `Plugins/EllesmereUI.lua` (15, 1047)
  - `Tests/Menu.lua` (87, 97), which mirror the builder
- **`modern = addon.Util.IsModern` on every `addon.MenuBuilder:New`**: `Options/General.lua:69`, `Gui/RewardPreview/RewardPreview.lua:5`, `Gui/RightClickMenu/EventReminderMenu/EventReminderMenu.lua:6`, `Gui/RightClickMenu/AchievementMenu/AchievementMenu.lua:6`, `Gui/WindowFrames/Search/OptionsMenuButton/OptionsMenuButtonMixin.lua:8`, `Gui/WindowFrames/FilterButton/FilterButtonMixin.lua:17` (the `config` table).
- **Headless stubs**: `.claude/tools/headless/client-env.lua:182` and `.claude/tools/headless/run-tests.lua:274` add `IsModern` (same value as `IsMainline`) and `IsForever = false`.
- **Instruction file**: `.github/copilot-instructions.md:80` names `addon.Util.IsModern` for Blizzard's interface and `addon.Util.IsMainline` for Retail content.
- **Left on `IsMainline`** (content): category data, `Api/CustomCriteriaApi.lua`, `Data/SavedData/AchievementData.lua`, `Data/DataIntegrityManager.lua`, `Data/EventObserver.lua`, `Plugins/AchievementsTabFixes.lua`, and the suites' `gameEnv.IsRetail()` and Retail-only guards.
- No changelog line: players see nothing.

## Order of work
1. This plan; commit `docs(work): plan for 2026-10-22-modern-flags`.
2. Headless stubs first, so the suites can run against code that reads `IsModern`.
3. The flag swaps, then the menu builder configs.
4. Instruction-file line.
5. Checks (Proof), `krowi:taint-reviewer` on the diff, `/code-review`.
6. Deploy to Retail and Classic; a `/reload` on each and a quick look; `Read-GameErrors.ps1`.
7. Work files to `done`; commit `refactor: interface code branches on IsModern`; push; PR against `main`, noting it is stacked on #355 (merge #355 first).

## Risks
- **A site misclassified**: on Retail and Classic both flags are equal, so a wrong choice is invisible until Forever. Guarded by the per-site reasons in the spec, for review in the PR.
- **A typo reads nil** and silently takes the Classic branch on Retail. Guarded by the `util-flags` lint rule (fails on a flag Krowi_Util does not define) and the in-game look on Retail.
- **Stacked PR merged before #355**: this branch needs Krowi_Util 2.8; the PR says to merge #355 first.

## Proof
- `Check-Repo.ps1` (whole tree): 0 errors; covers `util-flags`, `category-snapshot`, `data-snapshot` (no diff) and `unit-tests` (every suite, both clients).
- `load-data.lua "$PWD" Both`: 0 problems.
- No `IsMainline` left under `Gui/`; every `MenuBuilder:New` passes `modern`.
- In game, Retail and Classic: after `/reload`, `Read-GameErrors.ps1` shows no new KAF error; the achievement window, filter dropdown, search options and a right-click menu open as before.