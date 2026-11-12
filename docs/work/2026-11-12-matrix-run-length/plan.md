# Plan: a shorter /kaftest matrix run
Spec: [spec.md](spec.md). Status: draft

## Files that change
- `Tests/Tests.lua`: `MatrixSteps` marks each single-feature step `SkipIdleMinute = true`; `RunMatrixStep` keeps the running step in a local beside `matrixStep` and clears it with it; `tests.MatrixStep()` returns that step, or nil.
- `Tests/Memory.lua`: the suite asks `addon.Tests.MatrixStep()`; with `SkipIdleMinute` it adds the not-measured observation and calls `done` at once, without `measuring` or the idle frame.
- `.claude/tools/Run-GameTests.ps1`: `$wtf` and the saved-variables lookup move above the matrix branch; a `Wait-SavedVariables $since` helper polls the newest `Krowi_AchievementFilter.lua` every second for up to 60 s until its `LastWriteTime` is not older than `$since`, and prints the write time. The matrix loop and the plain run take the time before typing `/reload` and stop the run with the reason when the file never arrives. The help block says so.
- `Tests/README.md` (The matrix run): the idle minute runs in the all-on and all-off steps. `.claude/tools/README.md`, if it describes the runner's reload, the same line.
- `docs/backlog.md`: "The matrix run's length" goes (this item; the declined parts are in spec.md, Decision).
- This folder: `plan.md`, `gates.md`.

## Order of work
1. Tests side: `Tests.lua` and `Memory.lua`; Lua 5.1 syntax; headless `memory` and `features` on Retail and Classic; `Check-Repo.ps1 -ChangedOnly`.
2. Runner: `Run-GameTests.ps1`; parse check (`[scriptblock]::Create`); a dry check of the helper against the Retail saved file (a `$since` in the past returns at once, one in the future times out).
3. Docs, then one commit per side: `fix(tests): ...` for the runner, `refactor(tests): ...` for the idle minute, `docs: ...`.
4. In game (after `Send-GameInput.ps1 -State`; input within 5 minutes means asking Krowi, naming about 25 min): deploy, `Run-GameTests.ps1 -Matrix` on Retail, then `Run-GameTests.ps1 memory` on Retail, then `-Matrix` on Mists; `Read-GameErrors.ps1`; the steps' times against 2026-11-12.
5. `Get-ChangeClass.ps1` (harness), work files `Status: done`, PR against `main`, `/code-review`, the merge gate.

## Risks
- **A plan pending across the deploy** has no flag and measures in every step: harmless, as today.
- **The saved-variables file of another account** written later than the one the game uses: the helper reads the newest, as `Read-MatrixState` and `Read-GameTests.ps1` already do, so they agree.
- **A slow disk or a long login** past 60 s: the run stops with the reason instead of reading a stale file; the limit can grow.
- **The flaky `reloaded` cannot be forced:** the fix is proven by the runner's own lines (the write time after each `/reload`) and by whole matrix runs, not by a reproduction on demand.

## Proof
- Headless `memory`, `features` green on Retail and Classic; lint clean.
- Retail 12.1.5 and Mists 5.5.4 matrix green, every step 18 of 18; the not-measured line in the four single-feature steps, the idle minute in all-on and all-off; step times; no addon error.
- `Run-GameTests.ps1 memory` alone on Retail: the idle minute measured.