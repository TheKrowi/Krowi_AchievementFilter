# Intent: The release gate counts only in-game runs of the version being released
Author: Krowi (maintainer). Source: the kit's hotfix mode (Krowi_ClaudeKit `docs/work/2026-11-08-hotfix-mode`), Krowi's answer at its scope gate on 2026-11-08: "Yes, like KEVU (Recommended)". Status: done

## Problem
`.claude/release-gate.ps1` counts a suite's in-game run when it is green, on the newest build and newer than the suite's file, whatever build of the addon ran it. During 106, a 105.1 hotfix is released from a branch off 105.0 while `main` holds the split; a run of `main`'s 106 build would pass the hotfix's gate although the hotfix build was never tested.

## Proposed outcome
A release's gate counts only runs of the version in the TOC (`## Version:`), as Krowi_ExtendedVendorUI's gate does already. A hotfix off 105.0 carries this change (`New-Hotfix.ps1 -Carry`).

## Affected users and systems
Releases of Krowi_AchievementFilter: the gate and its reader `.claude/tools/headless/read-runs.lua`. Nothing ships; the addon is unchanged.

## Constraints
- The Krowi_Options test addon's `/kotest` runs keep their own rule (their version is the test addon's).
- The commit must apply to the 105.0 tag as it is, so a hotfix can carry it: it changes only lines that are the same at 105.0 and on `main`.

## Open questions
None.