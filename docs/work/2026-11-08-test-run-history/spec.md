# Spec: a test run of many suites keeps every result it ran
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. A `/kaftest run` of N entries leaves all N of its runs in `KrowiAF_DebugTable.Tests.History` when its last suite has reported, also when N is more than 10.
2. `History` never keeps fewer runs than today (10), so runs made in a row with a reload between them stay readable; a single `/kaftest <suite>` after a long run trims it back to 10.
3. `.claude/tools/Run-GameTests.ps1` reads, prints and judges every run of its own `/kaftest run`. Its rule stays: a run fails on a failed check, a missing result, or when it passed nothing (Krowi: "One test fail is a full fail").
4. The release gate (`.claude/release-gate.ps1`) uses the same rule: a suite's run counts only when it failed nothing and passed something.
5. Every suite of the release set passes something on Retail and on Mists Classic:
   1. `worldmap` on Retail checks that Retail's map gets no strata of its own from the game rule it reads on show.
   2. `tooltip` on Mists checks that no achievement has transmog set data and that Blizzard's category tooltip function is not replaced.
   3. `schedules` on Mists checks that the client has no world or widget event rows.
   4. `plugins` on Mists checks that Zygor's achievement guides are absent, so the plugin draws nothing.
   5. `plugins` on Retail runs for real: Zygor Guides Viewer is on for the character the kit logs in with, and `/kaftest run` runs suites that need the achievement window's first draw before the others.
6. No scenario opens, closes or hides a Blizzard window or sets a CVar to make its check; the new checks only read.
7. `Tests.Runs` keeps its shape; the release gate reads it as before.

## Root cause
- `Tests/Tests.lua:30` keeps 10 runs (`keepRuns`), and `Report` (`Tests/Tests.lua:101-105`) trims `History` to that after every suite. A run of 17 pushes its own first seven runs out before it ends.
- `Run-GameTests.ps1:132-145` takes its runs from `Read-GameTests.ps1`'s list of `History` (runs newer than its start), so it finds 10 and stops with "only 10 of 17 entries left a run" (`Run-GameTests.ps1:165`).
- Second rule, same run: `Run-GameTests.ps1:157` counts a run that passed nothing as failed, rightly by Krowi's decision, and five runs of the release set pass nothing:
  - `worldmap` on Retail: no scenarios there (`Tests/WorldMap.lua:92`), on the claim that Retail's map never sets its own strata (`Tests/WorldMap.lua:21`). That claim is out of date: `WorldMapMixin:OnShow` sets the strata a game rule gives (`wow-ui-source/live/Interface/AddOns/Blizzard_WorldMap/Blizzard_WorldMap.lua:349-352`).
  - `tooltip` on Mists: Retail only (`Tests/Tooltip.lua:186`).
  - `schedules` on Mists: every scenario is RetailOnly (`Tests/Schedules.lua:148, 592`).
  - `plugins` on Mists: the plugin serves only Retail's Zygor Guides Viewer (`Tests/Plugins.lua:201-202`); Mists has its own Zygor installed.
  - `plugins` on Retail: Zygor Guides Viewer is installed but disabled on Krowi-Frostmane, and the suite needs the achievement window's first draw (`Tests/Plugins.lua:206-207`), which any suite before it in a run spoils.
- The release gate (`.claude/release-gate.ps1:79`) counted every run without a failure, so it passed these five.

Reproduction, 2026-11-08, release 105.0: `Run-GameTests.ps1` with all 17 suites exited 1 on all three tries on Retail and on Mists, each time "Only 10 of 17 entries left a run", while `.claude/tools/headless/read-runs.lua` read 17 runs of that morning from each client's saved variables, all with 0 failed; among them `worldmap` 0/0/0 on Retail, `tooltip` and `schedules` 0/0/0 and `plugins` 0 passed 2 skipped on Mists, `plugins` 0 passed 2 skipped on Retail.

## Design
1. `Tests/Tests.lua`: `RunEntries` sets how many runs to keep while it runs, `max(keepRuns, #entries)`, and `Report` trims `History` to that; outside a run it is 10. `tests.FirstDraw[name] = true` marks a suite that needs the achievement window's first draw; `RunEntries` moves those entries to the front, keeping the others' order.
2. One read-only scenario per suite and client where it had none (requirement 5), with a read in the suite's game environment and the same read in the headless model, so `run-tests.lua` runs them on both clients:
   - `worldmap/retail-map-strata-rule`: `C_GameRules.GetGameRuleAsFrameStrata(Enum.GameRule.WorldMapFrameStrata)`, "none" for nil or UNKNOWN.
   - `tooltip/classic-no-transmog-sets`: achievements with `TransmogSetIds`; `tooltip/classic-category-tooltip`: the global absent or secure ("not replaced").
   - `schedules/classic-no-world-events`: rows of `addon.Data.Events` World and Widget.
   - `plugins/classic-zygor-not-served`: whether `ZGV.Achievement.AvailGuides` exists.
   - Recorded is what the game shows in the in-game run, never guessed; Target the same.
3. `Plugins.lua` sets `tests.FirstDraw.plugins`. Krowi turns Zygor Guides Viewer on for Krowi-Frostmane on Retail (a click at character select).
4. `.claude/release-gate.ps1`: a green run needs `Passed > 0` (read-runs' third field).
5. A headless-only suite `runner` in `run-tests.lua` loads `Tests/Tests.lua` with stubbed game calls and runs fake suites: the permanent test of requirements 1, 2 and 5.5's order.

## Options considered
- **Keep at least as many runs as the run asked for (chosen).** Krowi's words: the run knows it runs 17, so it keeps 17. One place, `Tests/Tests.lua`; the readers stay as they are.
- **Read each suite's own record (`Tests.Runs`).** More change in the two readers, and runs of part of a suite still need `History`.
- **Keep 20 runs always.** Raised again whenever suites are added.
- Judging a run that passed nothing:
  - **Keep it a failure, and fix each suite (chosen by Krowi).**
  - Name such suites without failing the run, failing only when all passed nothing (recommended at the gate, not chosen).
  - Drop the rule (not chosen).
- For the suites with nothing to check on a client: leaving them out of that client's run was the alternative; a read-only check of the reason keeps them in and fails when the reason stops being true.

## Areas of concern
- Taint and secret values: the new scenarios only read (a game rule, the addon's own data, a global's security, another addon's table); `Tests/Tests.lua` runs only in debug mode. No Blizzard window is opened by the new code and no CVar is set.
- Clients: Retail and Mists Classic, where the suites run; the new scenarios branch on `IsMainline` as the suites do.
- Blizzard API changes: `C_GameRules.GetGameRuleAsFrameStrata` and `Enum.GameRule.WorldMapFrameStrata` are read guarded (absent means "none"); checked in the live source.
- Other addons, plugins and skins: Zygor Guides Viewer on for Krowi-Frostmane on Retail; another suite could be disturbed by it (a Zygor window taking Escape), seen in the in-game run.
- Saved variables: `KrowiAF_DebugTable.Tests.History` holds up to N runs after a run of N entries (17 today), debug data only; no migration.
- Localization: none.
- Embedded libraries: none changed. Krowi_Options' test runner keeps 10 runs too (`Tests/Krowi_OptionsTests/Tests/Runner.lua:28`), but `/kotest` runs everything as one entry (`all`).
- Data snapshots: none.
- Player-facing text: none, and no changelog line (players never run `/kaftest`).
- Two-copy gate: it reads `Run-GameTests.ps1`'s exit code, whose rule does not change.

## Verification
- Permanent test: the headless `runner` suite: a run of 12 fake suites keeps 12 (Recorded 10 before the fix), a single run after it trims to 10, a first-draw suite runs first (Recorded: the typed order before the fix).
- The new scenarios pass headlessly on both clients and in game.
- In game, with Zygor on for Krowi-Frostmane on Retail: `Run-GameTests.ps1` with all 17 suites on Retail and on Mists reads 17 runs each and exits 0; the preflight's gate is green on that build with the new rule.
- `Check-Repo.ps1`, the headless suites, a review.

## Decision
2026-11-08, Krowi:
- Judging: "If a test failes, that test need validation and code fixing or test fixing. Handle each individually. One test fail is a full fail." The tool's rule stays; each suite that passes nothing is validated and fixed on its own, and the release gate takes the same rule.
- Keeping runs: "See prev answer, do we need to discuss further?", taken as the recommendation: the run keeps as many results as it asked for.
- Plan approved: "Approved the plan but what's the plan for? Didn't we already release 105?"