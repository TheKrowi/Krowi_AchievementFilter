# Plan: An "Until" version cutoff reads as obtainable until 2100
Spec: [spec.md](spec.md). Status: accepted

Approved by Krowi (maintainer) on 2026-10-02 in plan mode; it touches the data API, so it waited for that gate.

## Context
`Obtainable("Until", "Version", {5, 0, 4})` on 5313 (and the same shape on 11065, 61963, 61991) falls into `SetTemporaryObtainable`'s Case 4 (open-ended start) in `Objects/Achievement.lua:267-272`. The result is the record `Until Version 5.0.4 .. Until Date 2100-1-1`, which makes the state "Current" (5313 lands in Time Limited) and gives the tooltip in the screenshot. Decision (option A): Case 3 accepts `Until` as the inclusive twin of `Before`, and the data load reports misplaced inclusion words. The data stays unchanged.

## Files that change
- `Objects/Achievement.lua`
  - Case 3 condition becomes `(startInclusion == "Before" or startInclusion == "Until") and startFunction and startValue and not endInclusion`. Its comment says "end-only cutoff from the achievement's own patch: Before (exclusive) or Until (inclusive)". `SetTemporaryObtainableFromVersionToEnd` already stores the first word as `End.Inclusion` and stays as it is.
  - New `CheckInclusion(self, side, inclusion)` next to `CheckAnchorFunction`. It uses the word lists `Start = {From, After}` and `End = {Until, Before}` and reports `MalformedObtainable` through the existing `ReportObtainable` with "Obtainable() starts/ends a window with X where From or After / Until or Before is expected". Case 4 calls it for the start, and Case 5 for the start and the end. It only reports and records the window anyway, like `CheckAnchorFunction`.
- `Tests/Obtainable.lua` (new) and `Tests/Files.xml` (registered last, after `WorldMap.lua`; see the departures). This is the `obtainable` suite, built on the `Tests/Navigation.lua` pattern (`Recorded`/`Target`, `PASS`/`FAIL`/`SKIP`, `TargetMet`, one line per scenario). Because the real `Objects/Achievement.lua`, `Data/TemporaryObtainable.lua`, build versions and `LoadDiagnostics` exist both in game and headlessly, the suite drives `addon` directly and needs no env abstraction:
  - A fake scenario creates `addon.Objects.Achievement:New(999999100 + i)`, sets `BuildVersion = addon.Data.BuildVersions["040003"]` directly (without `New`'s `SetInUse`, so the filter list is untouched) and calls `SetTemporaryObtainable(unpack(args))`. It counts the `LoadDiagnostics.Entries` added, then removes them again, along with their `Counts`.
  - A data scenario reads the real `addon.Data.Achievements[id]`.
  - The observation lists every record as `<start> .. <end>`, with Version ids through `KrowiAF.FormatBuildVersionId`, dates as `Y-M-D`, and ` own` for an implicit start. It adds `state=<GetObtainableState or none>` and, for fakes, `reports=<n>`. No tooltip text is observed, because it depends on locale and date options and would make the game and headless lines differ.
  - In game: `addon.Tests.Suites.obtainable`, with `Ready` requiring `addon.Data.IsLoaded`.
- `.claude/tools/headless/run-tests.lua`: `suites.obtainable` loads `client-env.lua` (as `load-data.lua` does) and runs `ctx:LoadFiles()` and `ctx:RunPipeline()` for the client. It sets `env.time = os.time` and `env.KrowiAF_GetUtcOffsetSeconds = function() return 0 end` (otherwise both are stubs, and the stub arithmetic would return 0), and `addon.Tests = {Suites = {}, Ready = {}}`. It then loads `Data/TemporaryObtainable.lua` and `Tests/Obtainable.lua` into the ctx env and returns `obtainable.Run()`. The header's suite list names it.
- `.github/copilot-instructions.md`: add `obtainable` to the headless suites list.
- `wiki/achievement-data/achievement-data-format.md`: add a "Cutoff patterns" row for `"Until", "Version", {M, m, p}` (from the achievement's own patch through the end of the named version, inclusive). `wiki/log.md` gets an entry.
- `_Packaging/Changelog.md`, 101.1 `### Fixed`: one line naming 5313, without a dev note (a dev note is the maintainer's own aside, see the departures); the root cause stays in `spec.md`.

## Scenarios (fake achievement added in 4.0.3, a patch both clients register)
| Name | Args | Recorded (today) | Target |
|---|---|---|---|
| until-version | `Until, Version, {5,0,4}` | `Until Version 5.0.4 .. Until Date 2100-1-1; state=Current; reports=0` | `From Version 4.0.3 own .. Until Version 5.0.4; state=Past; reports=0` |
| before-version | `Before, Version, {5,1,0}` | `From Version 4.0.3 own .. Before Version 5.1.0; state=Past; reports=0` | same |
| from-version | `From, Version, {5,0,4}` | `From Version 5.0.4 .. Until Date 2100-1-1; state=Current; reports=0` | same |
| window-version | `From, Version, {4,0,3}, Until, Version, {5,0,4}` | `From Version 4.0.3 .. Until Version 5.0.4; state=Past; reports=0` | same |
| never | `Never` | `Never; state=Past; reports=0` | same |
| unknown-start-word | `Through, Version, {5,0,4}` | `Through Version 5.0.4 .. Until Date 2100-1-1; state=Current; reports=0` | same with `reports=1` |
| swapped-window | `Until, Version, {5,0,4}, From, Version, {4,0,3}` | `Until Version 5.0.4 .. From Version 4.0.3; state=Current; reports=0` | same with `reports=2` |
| data-5313 | real 5313 | `Until Version 5.0.4 .. Until Date 2100-1-1; state=Current` | `From Version 4.0.3 own .. Until Version 5.0.4; state=Past` |

The records print the anchor as written, so both clients give the same lines. On Classic, 5.0.4 resolves to 5.5.0 and 5.1.0 to 5.5.1, and both are past on 5.5.4. The exact Recorded strings are confirmed by the first headless run before the fix. Where a run differs from this table, the code wins, and the difference is explained in `plan.md`.

## Order of work
1. Write `plan.md` (this plan) in the work folder with `Status: accepted`, and commit it: `docs(work): plan for 2026-10-02-until-version-cutoff`.
2. Record the baseline: run `load-data.lua … Both` and keep its summary lines, so step 5 can show no new findings.
3. **Scenario first.** Add the suite, its runner, its `Files.xml` entry and the instruction-file mention, with `Recorded` set to today's behaviour. Run `run-tests.lua "$PWD" obtainable`: 8 PASS per client, 4 open (until-version, unknown-start-word, swapped-window, data-5313). Commit: `test: reproduce the three-argument Until cutoff in the obtainable suite`. No in-game before-run is needed, because this is not GUI work (`docs/sdlc-playbook.md` stage 3). The in-game after-run covers the game.
4. **Fix only the code** in `Objects/Achievement.lua`, then set `Recorded` to `Target` on the 4 open scenarios. Rerun: 8 PASS, 0 open on both clients.
5. Run `load-data.lua … Both` and confirm the summary matches step 2 (no `MalformedObtainable` in first-party data). Run `Check-Repo.ps1 -ChangedOnly` and confirm it is clean, then update the wiki, its log and the changelog.
6. Commit: `fix(data): read a three-argument Until as an inclusive cutoff`. `plan.md` is updated wherever the work departed from it.
7. In-game after-run on Retail and on Mists Classic:
   - `Deploy.ps1 -WhatIf`, then `Deploy.ps1` (`-Client Classic` for Classic).
   - `/reload`, `/kaftest obtainable`, `/reload`.
   - `Read-GameTests.ps1` and `Read-GameErrors.ps1` (`-Client Classic`).
   - Hover 5313 (both clients) and 61963 (Classic), and check that 5313 is gone from Time Limited.
8. Set the work files to `Status: done`, push, and open the PR against `dev`. Run `/code-review` and list the findings. Stop at the merge gate.

## Risks
- **A plugin's misplaced word now prints in debug mode.** It only reports and records as before, so nothing a player sees changes.
- **Case 3 now catches a three-argument `Until` that a plugin meant as a start.** The tooltip and state code never understood `Until` as a start, so that data was already broken. Acceptable.
- **The suite's state lines depend on the client version.** All anchors are 5.1.0 or older, so they stay stable on both clients.
- **Headless `time` and the UTC offset are stubs by default.** They are set explicitly, otherwise the `Date` end would compare a stub.
- **The suite adds a full pipeline load per client to the `unit-tests` lint.** That is about 0.25 s each, which is acceptable.
- **The maintainer's uncommitted changelog edit must not be committed by accident.** The changelog is staged from `HEAD` plus the new line, and `git diff --cached` is checked before each commit.

## Proof
- `& ".claude\tools\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" obtainable` gives `run-tests: obtainable (Retail): 8 passed, 0 failed, 0 skipped; 0 open`, and the same for Classic. Before the fix it reports 4 open.
- `load-data.lua … Both` gives the same summary as the baseline, and `Check-Repo.ps1 -ChangedOnly` reports 0 errors.
- In game: `/kaftest obtainable` is green on both clients, and `Read-GameTests.ps1` marks no line that differs from headless.
  - Retail 5313 tooltip: "This achievement was temporarily obtainable from the start of Cataclysm (pre-patch) (4.0.3) until the end of Mists of Pandaria (pre-patch) (5.0.4)."
  - Classic 61963: green "is temporarily obtainable from the start of The Thunder King (5.5.3) until the end of Siege of Orgrimmar (5.5.4)".
  - 5313 is not in Time Limited.

## Departures and results
- **Headless, scenario first:** 8 PASS per client with 4 open (until-version, unknown-start-word, swapped-window, data-5313), as planned. **After the fix:** 8 PASS and 0 open on both clients, with exactly those four scenarios changed. `load-data … Both` reported 0 problems and no `MalformedObtainable` in first-party data.
- **Dev note rule.** The changelog line was first committed with a dev note. The maintainer then ruled that a dev note is their own aside to players, never a technical root cause (`24fa5b9` on `dev`), so both unreleased fix lines lost theirs: this one and the #325 line, whose note an agent had written in `ee3f6d1`. The maintainer confirmed dropping the #325 note on 2026-10-04.
- **An unplanned commit.** `chore(gui): silence the invisible-field diagnostic in TextFrameMixin` adds `---@diagnostic disable: invisible` to `Gui/DataManager/TextFrame/TextFrameMixin.lua`. It is not part of this fix: it clears 4 of the 5 `luals` warnings a full `Check-Repo.ps1` run shows on `dev`. The maintainer kept it in this PR on 2026-10-04, and the PR names it.
- **Rebased onto `dev` (2026-10-04, `754fcdb`).** While this branch waited, the world map fix (#332) added the `worldmap` suite at the same places in `run-tests.lua`, `Tests/Files.xml` and the instruction file. Each conflict kept both suites, which is why `Obtainable.lua` is registered after `WorldMap.lua`. The changelog kept `dev`'s world map and Midnight dungeon lines. After the rebase:
  - the test commit still gives 8 PASS and 4 open per client, and the fix commit 8 PASS and 0 open;
  - every suite passes on both clients with 0 open: escape 23, special 27, navigation 8, obtainable 8, and worldmap 5 on Classic (none on Retail);
  - `load-data … Both` reports 0 problems. Classic's count of version anchors on content it has not reached went from 330 to 332, because of `dev`'s two Shared `12.0.1` anchors (4524, 4525), not this work.