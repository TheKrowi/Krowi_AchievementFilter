# Intent: Reward preview texts in Krowi's words
Author: Krowi (maintainer). Source: idea, 2026-11-09, after PR #405 ("make this a small pr with all of the above"). Status: done

## Problem
Some of the texts PR #405 added to the Reward preview settings read as written by an AI: the Enable description joins two clauses with a colon and talks from the code's side ("no longer starts"), the icon description has no verb and ends on "either way", "Most icons per achievement" is odd English, the off line on the help page says "turn on" next to a check box called Enable, and the width and height descriptions are clipped. The names are in sentence case, while Blizzard's own Settings window and Krowi's older names use Title Case. Every later feature of the 106 split reuses the Enable texts.

## Proposed outcome
The section and its help page read like Krowi's own option texts: descriptions that start with a verb and say what changes, names in Title Case as Blizzard writes them, the same texts in all ten translations.

## Affected users and systems
Every player who opens the Reward preview settings or its help page, on Retail and Mists Classic. `Localization/*.lua` (all 11 files), `Features/RewardPreview/Options.lua`, the 106.0 changelog entry, the CurseForge localization project. No saved variables.

## Constraints
The saved keys stay. Settings of the same kind in sections not split yet (Pop Out's Default Width) keep their old texts until their own split. No translation is lost.

## Open questions
None: the wording and the case were settled at the gate on 2026-11-09.