# Plan: a test run of many suites keeps every result it ran
Spec: [spec.md](spec.md). Status: accepted

## Files that change
- `Tests/Tests.lua`: `RunEntries` sets how many runs to keep while it runs (`max(keepRuns, #entries)`), `Report` trims `History` to that; `tests.FirstDraw`, entries reordered first-draw first; header.
- `Tests/WorldMap.lua`, `Tests/Tooltip.lua`, `Tests/Schedules.lua`, `Tests/Plugins.lua`: the read-only scenarios of spec requirement 5, an environment read each (game and headless), corrected headers; `Plugins.lua` sets `tests.FirstDraw.plugins`.
- `.claude/tools/headless/run-tests.lua`: the models of the new reads; a new headless-only suite `runner` that loads `Tests/Tests.lua` with stubbed game calls and runs fake suites. Check-Repo's `unit-tests` rule runs it from then on.
- `.claude/release-gate.ps1`: a green run needs `Passed > 0`; header.
- `Tests/README.md` (the `runner` suite, the new scenarios, Zygor needed on Retail), `.claude/tools/README.md` where it states the gate's rule.
- No changelog line, no locale strings.

## Order of work
1. Test first: the `runner` suite, Recorded = today's behaviour (a run of 12 keeps 10; the typed order), Target = the spec; commit `test: reproduce ...`.
2. The fix in `Tests/Tests.lua`; Recorded = Target.
3. The four suites' read-only scenarios with their models; Recorded set from the in-game run (step 5), not guessed.
4. The gate rule; the docs. Headless all suites on both clients, `Check-Repo.ps1`, a read-only review.
5. In game: Krowi turns Zygor Guides Viewer on for Krowi-Frostmane (Retail). Deploy the branch; `Run-GameTests.ps1` with all 17 suites on Retail, then Mists.
6. PR, merge on Krowi's word.

Opus builds steps 1-4 from a brief; I verify each commit.

## Risks
- Zygor on Krowi-Frostmane may disturb another suite (a Zygor window that takes Escape makes `escape` skip): seen in step 5, handled on its own.
- Something may load the achievement window before the first suite after a reload: `plugins` then still skips; seen in step 5.
- A premise scenario's in-game value differs from the expected one: investigated before Recorded is written, never written in to get green.
- Stubbing `Tests/Tests.lua` headlessly: kept to the `runner` suite, so the shared load stays untouched.

## Proof
- Headless: `run-tests.lua <root> runner` passes with Recorded = Target (12 kept, 10 after a single run, plugins first); every suite passes on both clients; `Check-Repo.ps1` 0 errors.
- In game: Retail and Mists runs of all 17 suites end "Run-GameTests: done" (exit 0) with 17 runs read and every run passing something.
- Preflight's gate on that build: every suite green under the new rule.