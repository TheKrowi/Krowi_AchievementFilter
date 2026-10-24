# Plan: The right-click menu breaks on an achievement the game does not know
Spec: [spec.md](spec.md). Status: accepted

Approved by Krowi (maintainer) on 2026-10-25 in plan mode. It touches shared GUI code (the right-click menu, the browsing-history tooltip), so it waited for that gate. The in-game before-run is the second gate.

## Context
The achievement right-click menu and the browsing-history tooltip take an achievement's name from `GetAchievementInfo`, which is nil for an id the client does not know. That raises "attempt to concatenate a nil value" in the "go to" entries (`Gui/RightClickMenu/AchievementMenu/AchievementMenu.lua:14,17,22`) and in the history line (`Gui/BrowsingHistory/BrowsingHistory.lua:62`). A placeholder's menu also gets an empty title (`AchievementMenu.lua:43`). The decision (spec, option 1): use the placeholder name `addon.GetAchievementInfo` already gives (`Globals.lua:100-106`) and keep the enabled rule; the history tooltip is in scope.

## Files that change
- `Gui/RightClickMenu/AchievementMenu/AchievementMenu.lua`
  - **Test seam (step 2):** the file-local `CreateMenu(menuObj, achievement, caller)` becomes `achievementMenu:CreateMenu(menuObj, achievement, caller)`, and `Open` calls it. The suite can then build a whole menu into a root that is never shown. No behaviour change.
  - **Fix (step 4):** `:14` and the title at `:43` take the name from `addon.GetAchievementInfo` (its second value) instead of `addon.GetAchievmentName`.
- `Gui/BrowsingHistory/BrowsingHistory.lua:62` (fix): the same name source. The commented-out loop at `:64-69` stays.
- `Tests/Menu.lua`: three new scenarios, plus an env that can find or stand in an id per kind and build a whole menu.
- `Tests/Navigation.lua`: a history-tooltip scenario list, its runner, and an env function.
- `.claude/tools/headless/run-tests.lua`: the `menu` and `navigation` models (Scenarios).
- `Tests/README.md`: the `menu` and `navigation` rows.
- `_Packaging/Changelog.md`: a new `## 104.1` (no date) with two lines under `### Fixed`.
- `docs/backlog.md`: the "From the latent-bugs review (2026-10-13, PR #339)" section leaves the list, since this item is taken up. A new section "From the right-click menu fix (2026-10-25, docs/work/2026-10-24-menu-unknown-achievement)" holds the spec's two found-on-the-way items.

## Scenarios
**`menu` suite** (`Tests/Menu.lua`). The existing two keep their Recorded and Target:

| Name | Id | Recorded | Target |
|---|---|---|---|
| `missing-achievement-entry` | game knows it, addon does not | disabled | disabled |
| `registered-achievement-entry` | 6 | enabled | enabled |
| `unknown-achievement-entry` (new) | neither knows it | error | disabled placeholder |
| `placeholder-entry` (new) | addon registers it, game does not | error | enabled placeholder |
| `placeholder-menu` (new) | the whole menu of such an achievement | untitled | placeholder |

- **What an entry scenario records:**
  - "error" when the build raises (pcall), otherwise "enabled" or "disabled";
  - then " placeholder" when the game does not know the id and the entry's text starts with the name `addon.GetAchievementInfo` gives it.
  - That classification lives in the shared part, so the game and the headless run judge alike.
- **What the menu scenario records:** "error", or what the title says: "untitled" (nil or empty), "placeholder" or "name".
- **In game:**
  - "unknown" is the first id from 1 up that `GetAchievementInfo` does not know and the addon does not register.
  - "placeholder" is the first registered achievement with `DoesNotExist` (7295 on Mists, expected). Where there is none, it is a stand-in: `addon.Objects.Achievement:New(id)` with `DoesNotExist`, registered under an unknown id and removed by the cleanup.
  - The ids used are reported as observations, so the lines of both runs stay comparable.
  - `BuildMenu` sets `addon.Gui.SelectedTab` aside for the build and restores it. The first-category section depends on the player's selected category, so leaving it out keeps the result the same on every run and matches headless. Every other section and the plugin entries run for real.
  - Retail reads back with `MenuUtil.GetElementText`; Classic reads `root.Children[i].Text` and `.Disabled`.
- **Headless:**
  - Real `Globals.lua`, against a modelled game: `GetAchievementInfo` knows 6 and the fake "missing" id 999999, but not the fake "unknown" id 999998 or the registered placeholder 999997.
  - The model builder gains `CreateTitle`.
  - `KrowiAF.PluginsApi` is a stub with no plugins.

**`navigation` suite** (`Tests/Navigation.lua`): a second list, `navigation.HistoryScenarios`, run after the tab scenarios inside the same Setup and Teardown.

| Name | Recorded | Target |
|---|---|---|
| `history-tooltip-unknown-achievement` | error | placeholder |

- **The steps:**
  1. A record `{CategoryId = <a category whose GetTree gives a path>, AchievementId = <unknown id>}` is pushed onto `addon.BrowsingHistory:GetAllRecords()`, and the index points at it.
  2. The back arrow's `OnEnter` runs under pcall.
  3. The tooltip's last line is read back.
  4. The tooltip is hidden, the record removed and the index restored.
- The history is session-only (`BrowsingHistory.lua:5-7`), so nothing is saved.
- The scenario records "error", "placeholder" (the line ends with the placeholder name) or "name".
- **Headless:** `ModelKrowiTooltip` moves above `suites.navigation` so both suites share it. The model also gets `GetAchievementInfo` (nil for the fake id), one category with `GetTree`, and a no-op `GameTooltip_AddBlankLineToTooltip`.

## Order of work
1. **`docs(work): plan for 2026-10-24-menu-unknown-achievement`:** this file and the `docs/backlog.md` move.
2. **`test: reproduce the unknown-achievement menu and history errors`:** the seam in `AchievementMenu.lua`, the scenarios, the headless models and the README rows. Headless, every new scenario passes against its Recorded, with its target open. `Check-Repo.ps1 -ChangedOnly` is clean.
3. **In-game before-run (gate):**
   1. `Deploy.ps1 -WhatIf`, then deploy, to Retail and to Mists (`-Client Classic`). Check `ListAgents` first and name whatever a peer's checkout had put there.
   2. Krowi runs `/kaftest menu` and `/kaftest navigation` on each client, then `/reload`.
   3. `Read-GameTests.ps1` (`-Client Classic` too) shows no FAIL and no difference from headless that cannot be explained.
   - If the game shows something else (a section or plugin erroring on a placeholder), work stops and it is reported, not absorbed into Recorded.
4. **`fix: the right-click menu and the history tooltip name an achievement the game does not know`:**
   - the three lines;
   - Recorded set to Target in both suites;
   - the changelog lines:
     - "Right-clicking an achievement linked to one your game does not have no longer gives an error, and the whole menu shows"
     - "Hovering the back or forward arrow no longer gives an error when a placeholder is in your browsing history"
5. **Test:**
   - Headless suites, `Check-Repo.ps1 -ChangedOnly -Luals`, `krowi:taint-reviewer` and `/code-review` on the diff.
   - The in-game after-run on both clients: deploy, both suites, `/reload`, `Read-GameTests.ps1`, `Read-GameErrors.ps1` (no new row, no bumped count).
   - By hand on Mists, with placeholders shown: right-click 7295, select it and hover the history arrows, with a screenshot of each.
6. **PR:** work files set to `done`, push, and a PR against `main` with the template; the merge waits for Krowi.

## Risks
- **Exposing `CreateMenu`:** nothing else calls it; no plugin or addon code reads `achievementMenu.CreateMenu`. `Open` behaves as before.
- **The in-game whole-menu build** runs every real section and every loaded plugin on a placeholder. An error there is a new finding under requirement 1, reported rather than hidden.
- **The test briefly changes addon state:** `SelectedTab`, a registry entry for the stand-in, and a history record. Each is restored in the same frame, with the restore outside the pcall.
- **One AddOns folder per client:** the other AchievementFilter session could deploy over the build under test. The deploy report names it.
- **Titan** has no local install. It runs the same code and builder path as Mists.

## Proof
- **Headless:** before the fix the new scenarios pass as "error"/"untitled" with their targets open; after it every target is met.
- **In game** on Retail and Mists, before and after, with the `Read-GameTests.ps1` lines matching headless.
- `Read-GameErrors.ps1` shows no KAF error after the after-run.
- Screenshots of 7295's menu and of the history tooltip on Mists.
- The taint review and code review findings are fixed, or listed in the PR.