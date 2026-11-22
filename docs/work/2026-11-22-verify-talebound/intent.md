# Intent: verify knows the 12.1.7 rewards, and the parked harness leftovers
Author: Claude, for Krowi (maintainer). Source: follow-ups of PR #426 and PR #427. Status: accepted

## Problem
- `Verify-AchievementData.ps1` on `DataAddons/Retail/12_Midnight/AchievementData.lua` reports two false failures for 12.1.7: Ach(64464) and Ach(64465) carry `:Toy()` for "Traveling Raven: Hexed Tiny Tome" and "Traveling Raven: Wood-Cursed Hearthstone", which the script does not count as reward text. The other 26 Raven trackers (`:Other()`) pass only as "trusted" false positives.
- The script does not know `:TaleboundSilver()` and does not count "Small/Medium/Large Pile of Bound Silver" as reward text, so the 70 Bound Silver entries are not checked at all: a Bound Silver achievement without the tag would pass, and so would the tag on an achievement without the reward.
- The `add-achievement-data` skill's reward table does not name `:TaleboundSilver()` or say how a "Traveling Raven:" reward is tagged.
- The holiday lookup's `-Locale` (commit b38da09e), taken out of PR #426, waits in `docs/backlog.md`.
- The two CurseForge answers of 2026-11-21 have no row in `docs/work/2026-11-21-wows-anniversary-event/gates.md`, and today's export answer none in the 12.1.7 folder's.

## Proposed outcome
The verify run on Midnight lists only its ten older findings; a Bound Silver or Raven entry with the wrong tag fails. The data skill tells the next session how to tag both. The holiday lookup can print the game's own holiday names in another language. The backlog line and the missing gate rows are done.

## Affected users and systems
Maintainer tooling only: `.claude/skills/verify-achievement-data/`, `.claude/skills/add-achievement-data/`, `docs/`. Nothing ships; no client, saved variable or locale changes.

## Constraints
No existing check may get weaker: the change only adds reward texts and a tag the script recognises.

## Open questions
None.