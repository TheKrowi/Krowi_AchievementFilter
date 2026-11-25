# Plan: Stop loading the Ace libraries nothing uses
Spec: [spec.md](spec.md). Status: accepted

## Files that change
- `Libs/Files.xml`: the `AceTimer-3.0.xml`, `AceEvent-3.0.xml` and `AceSerializer-3.0.xml` includes go.
- `Libs/AceTimer-3.0/`, `Libs/AceEvent-3.0/`, `Libs/AceSerializer-3.0/`: deleted.
- `Krowi_AchievementFilter.lua:4-6`: the `-- [[ Ace ]] --` block with `addon.Event` goes.
- `Tests/Tests.lua:527`: the `PLAYER_ENTERING_WORLD` handler moves onto a frame of its own, with the same body.
- `.claude/tools/headless/options-env.lua:86-87`: `AceSerializer` leaves the skip list.
- `docs/architecture.md:122`: the list of vendored libraries.
- `_Packaging/Changelog.md`, next version, `### Changed`: "The addon no longer loads three Ace3 libraries it stopped using (AceTimer, AceSerializer and AceEvent)."

## Order of work
1. Make the changes, then run `Check-Repo.ps1` on the whole tree and the spec's headless suites on both clients. Commit: `refactor: stop loading the Ace libraries nothing uses`.
2. In game, on Retail and then on Mists:
   - `Deploy.ps1 -WhatIf`, then deploy;
   - `Run-GameTests.ps1 options`, then `Read-GameTests.ps1` and `Read-GameErrors.ps1`.
3. Scan the AddOns folders of Retail and Mists for a non-silent `LibStub("AceTimer-3.0"|"AceSerializer-3.0"|"AceEvent-3.0")` in an addon that ships no copy of that library, and report any found.
4. The PR: `Get-ChangeClass.ps1`, `/code-review`, and the Decisions section.

## Risks
- **A leftover call** would only error where no other addon loads the library. Guard: `library-names` and the headless load, which has only KAF's `Libs/`.
- **The test runner.** A broken `PLAYER_ENTERING_WORLD` handler would stop `/kaftest` after a reload. Guard: the in-game run in step 2 starts through it.

## Proof
- `Check-Repo.ps1`: 0 errors.
- Headless `options` on both clients: every line equal to today's `Recorded`, including `options-fingerprint options=414 hash=723de62c` (Classic `options=310 hash=83fced41`).
- In game, Retail and Mists: `Read-GameTests.ps1` with no FAIL, and `Read-GameErrors.ps1` with no new row.