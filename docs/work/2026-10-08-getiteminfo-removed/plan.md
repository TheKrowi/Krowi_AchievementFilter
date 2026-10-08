# Plan: Transmog set progress in the achievement tooltip stops working on 12.1.5
Spec: [spec.md](spec.md). Status: accepted

Approved by Krowi (maintainer) on 2026-10-08. The reproduction (steps 1 and 2) is built that day. The in-game before-run (step 3) and the after-run happen the same evening, because the maintainer cannot play earlier, so the fix (step 5) waits for the before-run.

Departures, 2026-10-08:
- **`removed-api` checks every addon file, also with `-ChangedOnly`, and counts as always-on.** A removed API breaks files nobody touched, and the Stop hook only lints changed files. The step 1 proof is therefore `-ChangedOnly` as planned, and it shows all three findings.
- **The in-game scenario builds the whole tooltip** through `addon.Gui.AchievementTooltip:ShowTooltip`, instead of calling the section's `CheckAdd` and `Add`. The section is a file local, and the tooltip finds it only by load order. Inspect therefore looks for "Collecting data" anywhere in the tooltip.
- **The reproduction is committed before the in-game before-run.** The run happens the same evening; if it is not green, the scenario is corrected before the fix.

## Files that change
- `.claude/tools/Check-Repo.removed-api` (new): one global per line, `<name> <build that removed it>`, for every global the ten deleted 12.1.5 deprecation addons assigned in 12.1.0, sorted.
- `.claude/tools/Check-Repo.ps1`: rule `removed-api` in the header table, and a pass over the `luac -l` output the `globals` rule already collects. Every `GETGLOBAL` of a listed name, in an addon file outside `Libs/` and `.claude/`, is an error with file and line.
- `.claude/tools/Check-Repo.ignore`: the three known sites, each with a comment pointing to this work item, added with the rule and removed by the fix. This mirrors a scenario's Recorded and Target, so the lint stays green on every commit.
- `Tests/Tooltip.lua` (new): suite `tooltip`, scenario `transmog-set-progress` on 40469 I'm Bringing Nerub-ack.
  - The environment interface works as in `Tests/WorldMap.lua`.
  - **Setup**, in game:
    - Refuses unless the objectives-progress option is on and the achievement has transmog set data.
    - Simulates 12.1.5: saves `_G["GetItemInfo"]` and sets it to nil. This is a string key, because the scenario must not read the name the lint rule bans.
  - **Show:** runs the real section: `CheckAdd`, then `Add`, on `Krowi_Tooltip` owned by a test frame that carries the achievement.
  - **Inspect:**
    - `stuck` when the last tooltip line is still "Collecting data".
    - `done` when it is gone and at least one set progress line follows "Objectives progress".
  - **Teardown:** restores the global and hides the tooltip, also after an error.
  - **Ready:** requests the set items with `C_Item.RequestLoadItemDataByID`. It reports ready once `C_Item.GetItemInfo` returns their equip slots, so the section runs without yielding in game and the line can be read right away.
  - **Clients:** Retail only. No Classic achievement has transmog set data, so Classic reports "no scenarios" the way `worldmap` does on Retail.
  - Recorded `stuck`, Target `done`.
- `Tests/Files.xml`: register `Tooltip.lua`.
- `.claude/tools/headless/run-tests.lua`: `suites.tooltip`.
  - Loads the real `Gui/AchievementTooltip/TransmogObjectives.lua` in the Retail environment, which, like 12.1.5, has no global `GetItemInfo`.
  - Models `Krowi_Tooltip` (lines, owner, `Krowi_TooltipTextLeft/Right<n>`), `C_TransmogSets.GetSetInfo` / `GetSetPrimaryAppearances`, `C_TransmogCollection.GetSourceInfo` and `C_Item.GetItemInfo` (equip slot at position 9), using one fake set of two items.
  - Also models `addon.GetUsableSets` and the tooltip options.
  - The header comment lists the suite.
- `.github/copilot-instructions.md`: the suite list under the headless test suites.
- `Gui/AchievementTooltip/TransmogObjectives.lua:41`, `:44` and `Data/TooltipData.lua:177`: `GetItemInfo` becomes `C_Item.GetItemInfo`.
- `.claude/tools/headless/client-env.lua:140`: `GetItemInfo` leaves the stubbed names.
- `_Packaging/Changelog.md`: a Fixed line under 102.0.
  - This branch is off `dev`, which still ends at 101.2, so it adds the same `## 102.0` header the 12.1.5 data branch (#334) adds.
  - Whichever PR merges second resolves the two headers into one section.

## Order of work
1. Lint rule and list, plus the three ignore entries. Show that the rule fires without the ignore entries (three errors) and passes with them.
2. Suite `tooltip`, headless: `transmog-set-progress` PASSes with Recorded `stuck`, and its target is open. Run every suite and the full lint.
3. In-game before-run on Retail, on live 12.1.0 or the 12.1.5 PTR (`Deploy.ps1`, or `-Client Xptr`). The maintainer, in debug mode:
   - hovers 40469 once, so the items are cached;
   - runs `/kaftest tooltip`, then `/reload`.
   - Then `Read-GameTests.ps1`. It must be green and show `stuck`, the same as headless.
4. Commit: `test: reproduce 2026-10-08-getiteminfo-removed in the tooltip suite and the removed-api rule`.
5. Fix the three calls, remove the three ignore entries, set the scenario's Recorded to `done`, and drop the headless stub. Commit `fix(retail): read item info through C_Item in the achievement tooltip (2026-10-08-getiteminfo-removed)`.
6. Changelog line. Update this plan wherever the work departed from it.
7. Feedback loop:
   - `Check-Repo.ps1` (full run, with `-Luals`) and every suite;
   - the `taint-reviewer` subagent on the diff;
   - in-game after-run on Retail (`/kaftest tooltip`, plus hovering 40469 and 16395 by hand) and on Mists Classic (an achievement tooltip and a recipe item tooltip);
   - `Read-GameErrors.ps1` on both.
8. Status `done` on all three files, then push and open the PR against `dev`.

## Risks
- **Setting a Blizzard global from the test taints that key until `/reload`.** Nothing secure reads `GetItemInfo`: Blizzard's own code calls `C_Item.GetItemInfo`, and the global was only a compatibility alias. The suite header documents it, and Teardown restores the value. The `globals` lint rule watches `SETGLOBAL`, and a `_G[...]` store is `SETTABLE`, so this is not a hidden write: the comment states it and the rule's purpose (no accidental writes from addon code) is kept.
- **The item cache in game:** the Ready check waits for the items, and a manual run reports why it cannot run instead of producing a wrong `stuck`.
- **Over-matching:** a name in the list that an addon file uses as its own global would be flagged. The rule reads only `GETGLOBAL`, so locals and fields are never seen, and the list holds only Blizzard API names.
- **The changelog conflict with #334:** covered in Files that change.
- **Classic:** `TooltipData.lua:177` changes behaviour only if `C_Item.GetItemInfo` differs from the old global there. Blizzard's Classic documentation shows the same returns (spec, Root cause), and the Mists Classic after-run checks it.

## Proof
- Step 1, without ignore entries: `Check-Repo.ps1 -ChangedOnly` prints three `[removed-api] Error` lines at `TransmogObjectives.lua:41`, `:44` and `TooltipData.lua:177`.
- Step 2: `run-tests.lua "$PWD" tooltip` prints `tooltip/transmog-set-progress: PASS ... recorded=stuck got=stuck target=done open` on Retail and "no scenarios on Classic".
- Step 3: `Read-GameTests.ps1` shows the same line with no difference marked.
- After the fix:
  - the same commands show `got=done ... met`;
  - `Check-Repo.ps1` (full run) reports 0 errors with no `removed-api` ignore entry left;
  - in game, 40469 and 16395 show their set progress lines, and `Read-GameErrors.ps1` lists nothing new.