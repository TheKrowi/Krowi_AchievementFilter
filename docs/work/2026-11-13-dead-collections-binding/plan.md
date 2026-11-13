# Plan: remove the dead Collections key binding and option
Spec: [spec.md](spec.md). Status: accepted

Approved by Krowi on 2026-11-13 without the new `advanced-collections-hidden` scenario the first draft had ("why a new options scenario? overkill?", then "approved"): the existing `options-fingerprint` scenario is this item's test.

## Files that change
- `Tests/Options.lua`: `options-fingerprint`'s Target for both clients moved to the count without the setting first (step 1), then its Recorded after the fix (step 3), with a comment line naming this work item, as the earlier moves there have.
- `Bindings.xml`: lines 29-31 deleted (the `KrowiAF_OPEN_TAB_Collections_Achievements` binding).
- `Options/General.lua`: the `experimentalOptions` page (lines 484-502) and its line `Experimental = experimentalOptions,` in the General table deleted.
- `Options/Window/Map.lua`: the Experimental heading of the `advanced` section (lines 207-209) deleted; Debug stays its only heading.
- `_Packaging/Changelog.md`: the two lines of the spec under 106.0, `### Fixed`.
- `docs/backlog.md`: the spec's section and line, after the newest section.
- Not changed: `Options/Defaults.lua` (the default stays), `Gui/Collections/`, `Gui/FilesModern.xml`, every locale file, `Data/DataIntegrityManager.lua`.

## Order of work
1. **Reproduce first.** Set `options-fingerprint`'s Target to `options=414 hash=dd9543c9` (Retail) and TargetClassic to `options=310 hash=5ece58c7`, the values a scratch run gave with the page and heading removed in memory only. Run the `options` suite headless: the scenario passes against Recorded and is open against its Target on both clients, the others unchanged.
2. **Fix.** Delete the binding from `Bindings.xml`; delete the page and its line from `Options/General.lua`; delete the heading from `Options/Window/Map.lua`. Grep the tree outside `docs/` for `KrowiAF_OPEN_TAB_Collections_Achievements`, `ToggleCollectionsJournal`, `experimentalOptions` and `General.args.Experimental`: empty.
3. Run the `options` suite headless: `options-fingerprint` now got the Target and fails against Recorded, everything else unchanged. Set Recorded (both clients) to the Target, with the comment line. Run `options` and `help` again: green on both clients.
4. Changelog lines and backlog line. `Check-Repo.ps1 -ChangedOnly`: 0 errors. Commit by explicit paths.
5. `krowi:taint-reviewer` and `/code-review` on the diff. Fix or list.
6. **In game, once the game is free** (Retail, then Mists, one client at a time): `Deploy.ps1 -WhatIf`, deploy, `/reload`; the spec's Verification steps (Key Bindings rows, `/kaf` > Advanced, `Run-GameTests.ps1 options`, `Read-GameTests.ps1`, `Read-GameErrors.ps1`). Krowi's look at Advanced on Retail is the `look` gate, before the full runs.
7. PR: `Get-ChangeClass.ps1` (expected fix/gui), work files to done, push, PR against `main` with the `auto` rows under "Decisions taken without asking".

## Departures in the build
- Step 3 met the counts (414, 310) but not the hashes the scratch run predicted (`dd9543c9`, `5ece58c7`): the page's three `OrderPP()` calls went too, and the Tabs key binding options carry the order counter in their keys (`Binding492Key1` became `Binding489Key1`, eight keys on Retail). A diff of the sorted fingerprint parts before and after showed only that renumbering and the removed toggle, so Recorded and Target are the real values, `88087335` (Retail) and `83fced41` (Classic), with the comment saying why.
- **Nothing saved depends on those keys** (checked 2026-11-13, before the game): the number is a session counter (`Libs/Krowi_Util/Options/InjectOptions.lua:26-30`) drawn when `Api/TabDataApi.lua:75-94` injects each tab's rows at run time, so it already shifts with which tabs and plugins register, as it did when the tutorial button went (`Tests/Options.lua`, the fingerprint comment). The rows read and write the game's own bindings by command name (`GetBindingKey(bindingName)`, `addon.Options.SetKeyBinding(value, bindingName, slot)`), not by the option key. The profile (`KrowiAF_Options`) is keyed by setting paths (`Options/Defaults.lua`), and the window's saved table `KrowiAF_SavedData.OptionsWindow` holds only `Seen` (section id to version, `Options/Window/Window.lua:15-20`), `LastSection` (a section id, `Libs/Krowi_Options/WindowPage.lua:155`) and `Window` (`Point`, `Size`, `PaneCollapsed`, `SearchAll`, `SearchBroad`, `Changed`: every `SetShared` call in `Libs/Krowi_Options`). No option key is saved anywhere.
- After the look gate (2026-11-13): `krowi:taint-reviewer` and `/code-review` (low) on the diff found nothing; `options` and `help` headless green on both clients. The in-game `options` and `help` runs on Retail and Mists wait: the PC was in use (input 0 s before each check), so no client was started.
- The branch was rebased onto `origin/main` (7c708157, after #421-#423) before the game, since it was not pushed yet; no conflicts, `options` and `help` green again on both clients with the same fingerprint.

## Risks
- **An option table reader breaks on the missing page.** Only the map (`Map.lua:208`) and `General.lua:622` name it (grep); `every-option-mapped-once`'s `missing-paths` would catch a map path left behind.
- **A Defaults button errors on the missing option.** `defaults-restore-acedb` covers every section's reset; the default stays, so AceDB and the window's section reset have nothing new to miss.
- **A profile saved with the setting on.** Nothing reads it while `Gui/Collections/` is not loaded (`FilesModern.xml:12` commented out); the default stays, so the table AceDB builds is the same shape. No migration.
- **The fingerprint change hides another change.** Step 1 fixes the expected values before the code changes, so step 3 meets them only if exactly this option went.
- **A player's key bound to the removed command.** To confirm in game that pressing it raises no error.

## Proof
- `run-tests.lua "$PWD" options`: `options (Retail): 28 passed, 0 failed` and `options (Classic): 28 passed, 0 failed`, 0 open, with `options-fingerprint: PASS got=[options=414 hash=dd9543c9]` / `[options=310 hash=5ece58c7]`. `help` green on both clients.
- `Check-Repo.ps1 -ChangedOnly`: 0 errors. Grep of step 2: no match outside `docs/`.
- In game, Retail and Mists: Key Bindings > Krowi's Achievement Filter lists the nine named rows and no raw-named one; `/kaf` > Advanced shows only Debug; `/kaftest options` green; `Read-GameErrors.ps1` no new row and no bumped count.