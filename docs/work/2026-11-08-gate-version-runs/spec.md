# Spec: The release gate counts only in-game runs of the version being released
Intent: [intent.md](intent.md). Status: done

## Requirements
1. `read-runs.lua` takes an optional `version=<v>` argument and then prints only runs whose `Version` (each run keeps `addon.Metadata.Version`, `Tests/Tests.lua` since before 105.0) equals it; a run without one never matches.
2. The gate hands `$tocVersion` to the reader for Krowi_AchievementFilter's own suite runs, and nothing for the `/kotest` runs.
3. The commit applies cleanly to the 105.0 tag.

## Root cause
`release-gate.ps1` (`Get-Runs` and the suite loop) filters by build, time and result only; `read-runs.lua` does not print the version, so the gate cannot tell builds apart.

## Design
The reader filters, so the gate's changed lines stay few and away from the lines PR #404 changed after 105.0 (the run object, the green filter, the messages): the reader call inside `Get-Runs` passes `version=$runVersion` when set, and the suite loop sets `$runVersion = $tocVersion` around its `Get-Runs` call and clears it before `/kotest`'s.

## Options considered
1. **The reader filters (chosen):** small, and the commit applies to 105.0.
2. **The reader prints the version and the gate filters:** clearer messages ("no run of 105.1"), but it touches the lines #404 changed, so a hotfix off 105.0 could not carry it.

## Areas of concern
- Taint, clients, Blizzard API, other addons, saved variables, localization, libraries, data snapshots, player-facing text: none (release tooling only).
- Releases from `main`: the TOC version is set before the release's runs (krowi:release step 1), so runs of the old version stop counting once it is bumped; that is the rule Krowi_ExtendedVendorUI already has.
- PR #405 changes the same two files (the matrix): the second of the two to merge resolves a small conflict, and the matrix check gets the same version filter then.

## Verification
- `read-runs.lua` against Retail's saved variables: 20 runs without the argument, 17 with `version=105.0`, none with `version=105.1`.
- The kit's preflight `-ReportOnly` on this branch: the suite lines pass on the 105.0 runs as before.
- `git cherry-pick --no-commit` of the commit onto 105.0 in a scratch worktree: clean; the kit's `New-Hotfix.ps1 -Carry <commit> -WhatIf` accepts it.

## Decision
Krowi, 2026-11-08, at the kit's scope gate (Krowi_ClaudeKit `docs/work/2026-11-08-hotfix-mode/gates.md`): "Yes, like KEVU (Recommended)". The design follows the kit's approved plan, step 9.