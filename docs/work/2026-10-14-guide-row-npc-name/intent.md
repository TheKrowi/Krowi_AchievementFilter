# Intent: The expanded row's guide shows the NPC's name once the game has it
Author: Krowi (maintainer). Source: `docs/codebase-analysis.md` row 31, deferred from the code review of 2026-10-14-guide-npc-names; Krowi asked for it on 2026-10-14. Status: accepted

## Problem
With "show the guide under the selected achievement" on, the guide block under an expanded row can keep the English NPC name ("Talk to Archivist Zubashi") on a German, French or other client. That happens when the block is first drawn before the client has the NPC's name: within a moment of logging in with the NPC never seen, or while the name is a secret value. The block keeps it until the player selects another achievement and comes back, or resizes the window. The tooltip, the right-click menu and the side panel read the name on every show and are fine.

## Proposed outcome
The block under the expanded row shows the client's name for the NPC as soon as the client has it, without the player doing anything, and keeps showing it for the rest of the session.

## Affected users and systems
- Retail players on a non-English client with Achievements > Style > Guide > the expanded-row option on, for an achievement with a guide that names an NPC (60962 today, the eleven sibling Legendary Research guides later).
- Classic: no guide data and no change.

## Constraints
- The block must not re-render on every list update when nothing changed: that is what its cache key is for (`Gui/Guide/Content.lua:207-237`).
- No taint and no secret-value errors.

## Open questions
None.