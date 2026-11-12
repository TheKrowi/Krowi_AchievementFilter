# Spec: a shorter /kaftest matrix run
Intent: [intent.md](intent.md). Status: done

## Requirements
1. In a `/kaftest matrix` run, the `memory` suite measures the idle minute only in the all-on and all-off steps. In each single-feature step it runs every check as before and adds the observation "idle minute: not measured in a single-feature step of the matrix (the all-on and all-off steps measure it)".
2. A `memory` run outside the matrix (`/kaftest memory`, `/kaftest run ... memory`, a login run) measures the idle minute as today.
3. Every other suite runs the same checks and takes the same screenshots in every step as today; the matrix still runs every suite but the probes in every step (Krowi, 2026-11-12: screenshots and slimmer single-feature steps are out of scope).
4. `Run-GameTests.ps1` reads the saved variables after a `/reload` only once the file is newer than the moment the `/reload` was typed, waiting up to 60 s; when it is not by then, the run stops with that reason and closes a client it started, as today. This holds in the matrix loop and in a plain run.
5. The matrix record (`Matrix.Last`), its `matrix|...` line and what the release gate reads from them do not change.
6. On Retail a single-feature step takes about a minute less than the 2 min 10 s measured on 2026-11-12, about 9 min for the matrix instead of 13.

## Root cause
Two separate costs and one bug.
- **The idle minute** (`Tests/Memory.lua:391-436`, `ObserveIdleMinute`, `idleSeconds = 60`) runs in every matrix step (`Tests/Tests.lua:440-490`, `RunMatrixStep` runs `plan.Suites` whole), 56 s of a 2 min 10 s step. It is an observation (`tinsert(observations, ...)`) and never fails; with every feature on and every feature off measured, a step with one feature on adds a number nobody compares.
- **The runner reads the saved variables too early.** After `/reload`, `Send-GameInput.ps1 -Command '/reload'` (kit, `tools/Send-GameInput.ps1:545-550`) waits up to 15 s for the marker to disappear and then for it to show again, and reports `reloaded: the UI is back`. On 2026-11-12 it reported that at 21:57:08.276, the second the game wrote the saved variables, and 3 s later the client was still loading (`%LOCALAPPDATA%\Krowi_ClaudeKit\GameInput.log`: `Command /reload reloaded` at 21:57:08.276, then `Quit refused: ... loading` at 21:57:11.747). `Run-GameTests.ps1:157` (`Read-MatrixState`) read the file at once and got the state before the reload: the old `matrix|` record and no `pending|` line, though the file written that second held step 1's plan. The loop took that for the end of the plan (`:159`) and stopped after step 1. The plain run reads the same way (`:196-198`).

Reproduction: the run's output (`matrix record ... 21:53:38`, "the matrix record is older than this run") and the kit's log above; the saved file read a minute later held `pending|1|6`.

## Design
- **The matrix's steps say whether they measure the idle minute.** `MatrixSteps` (`Tests/Tests.lua`) marks each single-feature step `SkipIdleMinute = true`; `RunMatrixStep` keeps the step it runs (beside `matrixStep`, its name) and `tests.MatrixStep()` returns it, or nil outside a matrix. `memory`'s suite skips `ObserveIdleMinute` when the step says so, adds the observation and reports at once. A plan saved by the older code has no flag and measures in every step, as today.
- **The runner waits for the saved variables.** `Run-GameTests.ps1` takes the time before it types each `/reload` and, before reading, polls the saved-variables file it reads until its `LastWriteTime` is not older than that time, every second for up to 60 s. The matrix loop and the plain run share the helper. A timeout ends the run as a failure with the reason.
- **The kit's early `reloaded`** is the kit's: a backlog line in the kit, offered as its own work item, so this repo is safe whatever the kit does.
- `Tests/README.md` (the matrix) says the idle minute runs in the all-on and all-off steps; `docs/backlog.md` loses "The matrix run's length", which this item settles (the two declined items are recorded here, in the Decision).

## Options considered
1. **(Recommended) A flag on the single-feature steps, read by `memory`.** The step says what it measures; a plan saved before the change keeps measuring.
2. **`memory` matches the step's name (`-alone`).** Fewer lines, but ties the suite to the names `MatrixSteps` makes up.
3. **Leave `memory` out of the single-feature steps.** Saves the same minute but drops its checks there, and the release gate's "every suite in every step" no longer holds.
- For the runner: **(Recommended) wait for the file in this repo's runner**, which needs no kit change; or **fix the kit's reload wait** (a marker seen again before the reload has begun is not the UI coming back), which helps every repo's runner but is a kit change with its own work item. Both can be done; this item does the first.

## Areas of concern
- Taint and secret values: none; `Tests/` runs only in debug mode, and the change adds no hook, event or Blizzard call.
- Clients: Retail and Mists run the same matrix; the idle minute and the runner behave the same on both.
- Blizzard API changes: none.
- Other addons, plugins and skins: none.
- Saved variables: `KrowiAF_DebugTable.Tests.Matrix.Pending.Steps` gains `SkipIdleMinute` on some steps; an older pending plan has none and measures everywhere. No migration.
- Localization, embedded libraries, data snapshots, player-facing text: none; `Tests/` and `.claude/` do not ship.
- Background jobs: none added (`background-jobs` rule).

## Verification
- Headless: `memory` and the `unit-tests` lint green on Retail and Classic; `Check-Repo.ps1` clean; Lua 5.1 syntax.
- In game, Retail 12.1.5 and Mists 5.5.4: `Run-GameTests.ps1 -Matrix` green, every step 18 of 18 suites; `memory`'s observations show the idle minute in the all-on and all-off steps and the not-measured line in the four single-feature steps; the steps' times from `Read-GameTests.ps1` against the 2026-11-12 run; the runner's output names the saved variables' write time after each `/reload`.
- `Run-GameTests.ps1 memory` alone still measures the idle minute.

## Decision
2026-11-12, Krowi:
- Intent accepted as written.
- Scope: the idle minute and the runner fix ("Idle minute + runner fix (Recommended)"). Out of scope: no screenshots in the all-off and single-feature steps (about 1 min a client, measured; a failure there would lose its picture) and slimmer single-feature steps (they catch a core suite breaking with one feature alone, and the release gate's rule would change).
- Design approved as written: option 1, and the runner waits for the saved variables in this repo; the kit's reload wait is offered as a kit work item of its own.