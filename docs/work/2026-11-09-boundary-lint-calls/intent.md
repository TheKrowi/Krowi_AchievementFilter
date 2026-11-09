# Intent: The feature-boundary lint reads a call as a definition
Author: Krowi (maintainer). Source: found while splitting the Right-click menu into a second feature (docs/work/2026-11-09-right-click-menu, on its branch); Krowi's call on 2026-11-09 to fix it in a PR of its own first. Status: done

## Problem
The repo lint's `feature-boundary` rule (`.claude/tools/Check-Repo.ps1`) takes a line that starts with a call, such as `addon.Features.Register(...)` or `KrowiAF_SelectAchievementFromID(id)`, for a definition of that name. With one feature nothing shows. With two, each feature "defines" the registry functions it calls, so each is reported for naming the other's: the Right-click menu split got 22 false errors. Players see nothing; the second feature cannot pass the lint.

## Proposed outcome
A call defines nothing: two features that call the same core function pass the lint, and a feature that names something another feature really defines is still reported.

## Affected users and systems
The maintainer and every session that runs `Check-Repo.ps1` or its Stop hook; the feature split of 106 (the Right-click menu next, 13 more after it). Nothing that ships.

## Constraints
The rule gets stricter, never weaker: every real cross-feature or core-to-feature name it reports today it still reports. No other rule changes.

## Open questions
None.