# Plan: remove the dead Collections key binding and option
Spec: [spec.md](spec.md). Status: draft

## Files that change
- `Tests/Options.lua`: a new scenario `advanced-collections-hidden` (step 1); after the fix, the `options-fingerprint` lines Recorded and Target for both clients, with a comment line naming this work item, as the earlier moves there have (step 4).
- `Bindings.xml`: lines 29-31 deleted (the `KrowiAF_OPEN_TAB_Collections_Achievements` binding).
- `Options/General.lua`: the `experimentalOptions` page (lines 484-502) and its line `Experimental = experimentalOptions,` in the General table deleted.
- `Options/Window/Map.lua`: the Experimental heading of the `advanced` section (lines 207-209) deleted; Debug stays its only heading.
- `_Packaging/Changelog.md`: the two lines of the spec under 106.0, `### Fixed`.
- `docs/backlog.md`: the spec's section and line, after the newest section.
- Not changed: `Options/Defaults.lua` (the default stays), `Gui/Collections/`, `Gui/FilesModern.xml`, every locale file, `Data/DataIntegrityManager.lua`.

## Order of work
1. **Reproduce first.** In `Tests/Options.lua`, after `feature-sections`, add:
   ```lua
   -- The dead Collections experiment's setting (docs/work/2026-11-13-dead-collections-binding): Advanced shows no
   -- Experimental heading and no Collections Achievement Window row; Debug is its only heading
   {Name = "advanced-collections-hidden",
       Observe = function()
           local source = addon.Options.Window.Source
           local section = source.Section("advanced")
           if not section then return "no advanced section" end
           local collections, headings = "no", 0
           for _, element in ipairs(source.Elements(section)) do
               if element.Kind == "Header" then headings = headings + 1 end
               local option = element.Option
               if option and option.Info[#option.Info] == "CollectionsAchievementWindow" then collections = "yes" end
           end
           return ("collections=%s headings=%d"):format(collections, headings)
       end,
       Recorded = "collections=yes headings=2",
       Target = "collections=no headings=1"},
   ```
   Recorded is what the headless run gives before the fix (expected as above; corrected if it differs). It counts keys and headings, not heading texts, so it reads the same in every game language. Run the `options` suite headless: the new scenario passes and is open against its target on both clients, the other 28 unchanged. Commit `test: reproduce the dead Collections setting in the options suite`.
2. **In-game before-run** (the playbook's second gate for GUI work, needs the game): `Deploy.ps1 -WhatIf`, deploy, `Run-GameTests.ps1 options` on Retail, then Mists (one client at a time), `Read-GameTests.ps1`: no FAIL, no unexplained difference from headless, the new scenario open against its target. At the same time, before the binding goes: a screenshot of Key Bindings > Krowi's Achievement Filter with the raw-named row (a game action for Krowi or the kit's input, per the spec's Verification step 1).
3. **Fix.** Delete the binding from `Bindings.xml`; delete the page and its line from `Options/General.lua`; delete the heading from `Options/Window/Map.lua`. Grep the tree outside `docs/` for `KrowiAF_OPEN_TAB_Collections_Achievements`, `ToggleCollectionsJournal`, `experimentalOptions` and `General.args.Experimental`: empty.
4. Run the `options` suite headless. Expected: `advanced-collections-hidden` met (`collections=no headings=1`); `options-fingerprint` fails with `options=414` on Retail and `options=310` on Classic and new hashes, everything else unchanged. Set `advanced-collections-hidden`'s Recorded to its Target, and the fingerprint's Recorded and Target (both clients) to the new values, with a comment line: the Experimental page and its only toggle taken out (415 / 311 before, 34c0493f / 28b151fd; docs/work/2026-11-13-dead-collections-binding). Run again: green on both clients.
5. Changelog lines and backlog line. `Check-Repo.ps1 -ChangedOnly`: 0 errors. Commit `fix: remove the dead Collections key binding and setting`.
6. `krowi:taint-reviewer` on the diff (GUI code); `/code-review` on the diff. Fix or list.
7. **In-game after-run**, Retail and Mists: deploy, `/reload`, the spec's Verification steps 2-6 (`Run-GameTests.ps1 options`, `Read-GameTests.ps1`, `Read-GameErrors.ps1`, a screenshot of Key Bindings and of `/kaf` > Advanced). Krowi's look at Advanced is the `look` gate (Retail first, per "look first, full suites after").
8. PR: `Get-ChangeClass.ps1` (expected fix/gui), work files to done, push, PR against `main` with the `auto` rows under "Decisions taken without asking".

## Risks
- **An option table reader breaks on the missing page.** Only the map (`Map.lua:208`) and `General.lua:622` name it (grep); `every-option-mapped-once`'s `missing-paths` would catch a map path left behind.
- **A Defaults button errors on the missing option.** `defaults-restore-acedb` covers every section's reset; the default stays, so AceDB's `ResetProfile` and the window's section reset have nothing new to miss.
- **A profile saved with the setting on.** Nothing reads it while `Gui/Collections/` is not loaded (`FilesModern.xml:12` commented out); the default stays, so the table AceDB builds is the same shape. No migration.
- **The fingerprint change hides another change.** Step 4 expects exactly one option fewer per client and checks that every other scenario line is unchanged before the new values go in.
- **A player's key bound to the removed command.** The game drops a binding to an unknown command from the Key Bindings window; to confirm in game (step 7) that pressing it raises no error.

## Proof
- `& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" options`: `options (Retail): 29 passed, 0 failed` and `options (Classic): 29 passed, 0 failed`, 0 open, with `advanced-collections-hidden: PASS got=[collections=no headings=1]` and `options-fingerprint: PASS got=[options=414 ...]` / `[options=310 ...]`.
- `& ".claude\tools\Check-Repo.ps1" -ChangedOnly`: 0 errors.
- Grep of step 3: no match outside `docs/`.
- In game, Retail and Mists: Key Bindings > Krowi's Achievement Filter lists the nine named rows and no raw-named one; `/kaf` > Advanced shows only Debug; `/kaftest options` green (`Read-GameTests.ps1`); `Read-GameErrors.ps1` no new row and no bumped count.