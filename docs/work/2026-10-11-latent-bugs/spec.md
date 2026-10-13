# Spec: Three latent bugs found while exploring achievement guides
Intent: [intent.md](intent.md). Status: done

## Requirements
1. A: every library name the addon's own code asks for (`LibStub("...")`, `KROWI_LIBMAN:GetLibrary("...")`) is one that `Libs/` registers. Clicking a pet guide link opens the copy-link popup, and the General options' Tutorial button opens the tutorial menu, whether or not another Krowi addon is installed.
2. A: a check that runs on every turn fails when addon code asks for a library name that `Libs/` does not register.
3. B: a right-click menu entry for an achievement the addon does not register is shown greyed out and cannot be clicked, on both clients. Entries for registered achievements stay enabled.
4. C: the "Most progress" tooltip section keeps showing on achievements with transmog set data, as it has since late 2024 (decided below). The check that was meant to hide it, and the unused code behind it, are removed. Every achievement keeps today's behaviour.
5. Each fixed bug leaves a guard behind: the lint rule for A, a scenario for B and C.

## Root cause
**A. Two call sites still ask for libraries by their names from before Release 92.0.**
- `Gui/RightClickMenu/AchievementMenu/PetBattleLinks.lua:25,36,70` call `LibStub("Krowi_PopupDialog-1.0").ShowExternalLink(...)`. `Options/General.lua:62` calls `LibStub("Krowi_MenuBuilder-1.0")` and builds the tutorial menu with it (`:59-67`, wired to the Tutorial button at `:307`).
- The bundled libraries register as `Krowi_PopupDialog_2` (`Libs/Krowi_PopupDialog/Krowi_PopupDialog.lua:8`) and `Krowi_Menu_2`, whose builder the addon gets as `addon.MenuBuilder` (`Libs/Krowi_Util/LibMan.lua:106-107`). Both go through `KROWI_LIBMAN:NewLibrary`, which calls `LibStub:NewLibrary(libName, ...)` (`LibMan.lua:22`). LibStub raises "Cannot find a library instance" for an unknown name unless it is called silently.
- The renames came with the "big menu rework" (9e476538, 2025-12-28) and Release 92.0 (12636acf, 2026-01-15). The other call sites were moved to the new names: `WowheadLink.lua:5` and `General.lua:317,329,335` use `LibStub("Krowi_PopupDialog_2")`, and every other menu uses `addon.MenuBuilder:New`.
- No installed addon here ships `Krowi_PopupDialog-1.0`, so the pet guide links fail in the maintainer's own game too. `Krowi_Brokers_Template` (and `Krowi_Reminders`, which uses it) still embeds `Krowi_MenuBuilder-1.0`, which hides the tutorial failure on the maintainer's install. A player without that addon gets the error. BugGrabber's current log has no record of either error, so neither path has been clicked since the log was last cleared.

**B. The menu builder's fourth argument changed meaning, and one call site still passes the old one.**
- `AchievementMenu.lua:12-29` builds a "go to" entry. For an id not in `addon.Data.Achievements` it appends "(Missing)" and sets `disabled = true`, then passes `disabled` as the fourth argument of `menuBuilder:CreateButtonAndAdd`.
- The builder's fourth parameter is `isEnabled`. An entry is disabled only when it is `false`: `Libs/Krowi_Menu/Krowi_MenuBuilder.lua:250-256` on Retail (`button:SetEnabled(false)`) and `:428-434` on Classic (`Disabled = isEnabled == false`). `true` and `nil` both mean enabled, so the "(Missing)" entry is enabled and every other entry is enabled as well.
- The call site dates from before the same menu rework (9e476538), when the argument was a disabled flag. It is the only call in the addon that passes a fourth argument.
- A click on the entry calls `KrowiAF_SelectAchievementFromID(id)` (`Api/API.lua:63-70`). That loads `Blizzard_AchievementUI` if needed and calls `KrowiAF_SelectAchievement(nil)`, which returns at once (`:26-30`). So the click does nothing, and does not raise an error.
- Callers: `FirstCategory.lua:12`, `OtherFaction.lua:17`, `PartOfAChain.lua:14`, `RequiredFor.lua:15`.

**C. The transmog check reads a field that was renamed in 2024.**
- `Gui/AchievementTooltip/MostProgress.lua:7` hides the section when `achievement.TransmogSets` is set. That field was filled by `achievement:AddTransmogSet` (`Objects/Achievement.lua:152-156`) from the old `Data/Retail/ExportedTransmogSets.lua`.
- 9681ae57 (2024-10-31, "Transmog sets are now moved to the new API system") replaced that export with `KrowiAF.TransmogSetData`. That stores the ids as `achievement.TransmogSetIds` (`Api/TransmogSetDataApi.lua:10`). The same commit moved `Objectives.lua:7` to `TransmogSetIds`, so the plain objectives still give way to the transmog set progress section (`TransmogObjectives.lua:16`). `MostProgress.lua:7` was not moved.
- Since then `AddTransmogSet` has no caller, `data.TransmogSets = {}` (`Data/Data.lua:12`) is unused, and the condition is always false. The section shows on transmog set achievements that are neither completed nor account-wide.
- **Correction, 2026-10-13, from the first in-game run:** the section stays hidden on 40469 all the same, even with the achievement seen as neither completed nor account-wide.
  - `CheckAdd` also needs at least one criterion (`MostProgress.lua:14-15`), and a collect-a-set achievement most likely has none that `GetAchievementNumCriteria` counts. The scenario now records the count in game.
  - So the dead check never changed anything on 40469, and removing it changes nothing either. Options C1 and C2 below lead to the same tooltip there.

## Design
- **A.**
  - `PetBattleLinks.lua` gets the dialog once at the top, `local popupDialog = LibStub("Krowi_PopupDialog_2")`, as `WowheadLink.lua:5` does, and calls `popupDialog.ShowExternalLink(...)` at the three sites.
  - `General.lua:62-63` becomes `tutorialMenuBuilder = addon.MenuBuilder:New({})`, like every other menu.
  - The guard is a new `Check-Repo` rule, `library-names`. It collects the names `Libs/` registers: every `NewLibrary(` call, with a literal argument or a local set to a literal in the same file; the generic definitions in `LibStub.lua` and `LibMan.lua` are skipped. Every literal passed to `LibStub(`, `LibStub:GetLibrary(` or `KROWI_LIBMAN:GetLibrary(` in addon code (outside `Libs/` and `.claude/`) must be one of those names. A prototype over today's tree flags exactly the four sites above and nothing else. The rule is documented in `.claude/tools/README.md`.
  - Like `removed-api` (2026-10-08-getiteminfo-removed), the rule checks every addon file, also with `-ChangedOnly`, because a renamed library breaks files nobody touched. The four known sites go into `Check-Repo.ignore` with the rule, each with a comment pointing here, and the fix removes them. That mirrors a scenario's Recorded and Target and keeps the lint green on every commit.
- **B.** `AchievementMenu.lua` passes `isEnabled`: `local isEnabled` set to `false` for a missing achievement, passed in place of `disabled`. Nothing else changes.
- **C (decided: option C2).**
  - `MostProgress.lua:7` drops `or achievement.TransmogSets`, so the condition says what the code has done since 2024.
  - The dead `achievement:AddTransmogSet` (`Objects/Achievement.lua:152-156`) and `data.TransmogSets` (`Data/Data.lua:12`) are removed, so the old name cannot be read again by mistake.
- One work item, one branch (`fix/2026-10-11-latent-bugs`) and one PR. A commit with the guards comes first. After the maintainer's in-game before-run, a commit per fix follows.

## Options considered
- **C1. Restore the exclusion through `TransmogSetIds` (recommended).** A transmog set achievement's tooltip shows its set progress and no "Most progress" line, as it did before October 2024 and as `Objectives.lua` already assumes. Collected appearances are shared by the account, so comparing characters says little there.
- **C2. Remove the dead check and keep showing the section.** Players keep the "Most progress" line they have seen for two years. The tooltip then mixes the transmog set progress with a per-character comparison that `Objectives.lua` deliberately left out.
- **A guard: lint rule (recommended) or scenario.** The lint rule runs on every turn in a fraction of a second. It catches any future call site with a stale library name, not just these four, and needs no game. A scenario would have to click the menu entries and the options button in game, to prove a name exists. The playbook's "every fixed bug leaves a scenario" is met here by a `Check-Repo` rule, which is where the playbook puts mechanical rules (stage 6). This is a departure from the rule, so it is for the maintainer to accept.
- **Packaging: one work item (recommended) or three.** One work item means one review and one in-game session with two deploys (the guards, then the fixes). Three work items follow the usual one-fix-one-folder habit but triple the gates, PRs and deploys for three one-line changes.
- **In-game runs.** The maintainer rule is that the in-game before-run is green before the fix starts. The maintainer asked for the fixes before their next in-game session. Recommended: commit the guards first, then the fixes, and in one session deploy the guard commit, run the suites (the before-run: Recorded), then deploy the branch head and run them again (the after-run: Target). The fix code then exists before the before-run, but nothing ships until both runs are green.

## Areas of concern
- **Taint and secret values:** none. A changes which addon library object is called. B changes the enabled state of an addon menu entry. C changes an addon-side condition. No Blizzard frame, hook or protected API is involved. The `taint-reviewer` is not needed; the diff touches no hook or lockdown API.
- **Retail and Classic:** A and B run on both clients, through each client's builder (`Krowi_MenuBuilder.lua` has a Retail and a Classic implementation of the fourth argument, quoted above). C is Retail only in effect, because only Retail has transmog set data, but the code is shared.
- **Plugins and skins:** plugins get the menu builder through `KrowiAF.UtilApi.MenuBuilder`, which is unchanged. Other Krowi addons that embed the old libraries are unaffected: this addon neither registers nor removes those names.
- **Saved variables and migrations:** none.
- **Localization:** none. "(Missing)" and every label already exist.
- **Data snapshots:** none, no data or category files change.

## Verification
- **A:** `Check-Repo.ps1` with the new `library-names` rule. Before the fix it reports the four sites, `PetBattleLinks.lua:25,36,70` and `General.lua:62`; after it, none. In game on Retail, right-click a pet battle achievement (for example one in Mists of Pandaria) → Xu-Fu's Pet Guides: the copy-link popup opens. General options → Tutorial: the tutorial menu opens. Both with `Krowi_Brokers_Template` disabled. On Classic, the Tutorial button.
- **B:** new suite `menu` (`Tests/Menu.lua`, `suites.menu` in `run-tests.lua`, the README table and the instruction file's suite list).
  - `missing-achievement-entry`: an id the game knows but the addon does not register. Recorded "enabled", Target "disabled".
  - `registered-achievement-entry`: Recorded and Target "enabled".
  - In game, the entry is built into a real root menu (`MenuUtil.CreateRootMenuDescription` on Retail, a `Krowi_Menu_2` menu item on Classic) and read back through `IsEnabled()` or `.Disabled`. Headlessly, the same function runs against a model of the builder's fourth-argument rule.
- **C:** a scenario `most-progress-transmog-set` in the `tooltip` suite, on 40469 seen as neither completed nor account-wide. Recorded and Target are both "shown" (the "Most progress" line is present). The scenario records the decision, so a later change that hides the section again shows up as a diff. Headlessly, the real `MostProgress.lua` runs against stubs of the options and the criteria count; in game, against the real tooltip.
- `Check-Repo.ps1 -ChangedOnly`, all suites headlessly, then the in-game runs on Retail and Classic with `Read-GameTests.ps1` and `Read-GameErrors.ps1`.

## Decision
Krowi, 2026-10-11, at the design gate, which also accepted the intent:
- **C:** option C2, "Keep showing it". Only the dead check and the unused code behind it go.
- **A guard:** the `library-names` lint rule, accepted in place of a scenario for this bug.
- **Packaging:** one work item, one branch, one PR.
- **In-game runs:** strict. The work stops after the guards commit, the maintainer does the in-game before-run, then the fixes are written and the maintainer does the after-run.