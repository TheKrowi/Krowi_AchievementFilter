# Intent: Reward preview's names and descriptions for their section
Author: Krowi (maintainer). Source: idea, 2026-11-11, the names-and-descriptions review Pop Out had that day (docs/work/2026-11-09-pop-out, review-options.md), applied to Reward preview. Status: done

## Problem
Reward preview's section was reworded once after #405 (docs/work/2026-11-09-reward-preview-texts), but three of its descriptions still read as written by an AI or from the code's side ("When checked, hovering ...", "Invert the vertical drag direction", "Achievements with more previewable rewards than this (e.g. ...)"), and the width and height descriptions end on "This will update when you resize the window". Two names do not fit where they stand: "Show on Mouseover" under "Show Icon on Achievements" reads as if the icon shows only under the mouse, and "Width" and "Height" are the same kind of setting as Pop Out's "Default Width", which Krowi renamed "Starting Width" for its section. The help page says "Click the preview icon" also for a player who turned the icon off.

## Proposed outcome
Every name makes sense under the section's title next to the Enable switch, and every description is short and plain, starts with a verb or "The ... of", and says what changes, in Krowi's style. The help page's intro matches the icon setting the player has.

## Affected users and systems
Every player who opens the Reward preview section or its help page, on Retail and Mists Classic. `Features/RewardPreview/Options.lua` and `Help.lua`, the 11 `Localization/<lang>.lua` files, the 106 changelog entry, the CurseForge localization project. No saved variables.

## Constraints
The saved keys stay. No translation is lost. Pop Out's unmerged branch adds lines below the same "Exported at" line and the same key "Starting Width": whichever pull request merges second keeps both blocks and one "Starting Width".

## Open questions
Which names and descriptions Krowi takes, per row of the review page.