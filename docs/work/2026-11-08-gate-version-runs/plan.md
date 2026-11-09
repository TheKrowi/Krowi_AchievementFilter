# Plan: The release gate counts only in-game runs of the version being released
Spec: [spec.md](spec.md). Status: done

## Files that change
- `.claude/tools/headless/read-runs.lua`: the `version=<v>` argument.
- `.claude/release-gate.ps1`: the reader call in `Get-Runs`, `$runVersion` around the suite loop's call.
- This work folder.

## Order of work
1. The reader's filter, checked against Retail's saved variables.
2. The gate's two places, checked with the kit's preflight `-ReportOnly`.
3. The carry: a cherry-pick onto 105.0 in a scratch worktree, then `New-Hotfix.ps1 -Carry <commit> -WhatIf`.

## Risks
- A conflict with PR #405 in the same two files; resolved when the second merges.

## Proof
The checks of the spec's Verification; `Check-Repo.ps1 -ChangedOnly`.