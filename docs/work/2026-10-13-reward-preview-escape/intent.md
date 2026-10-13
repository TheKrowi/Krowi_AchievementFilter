# Intent: Escape closes the reward preview before the achievement window
Author: Krowi (maintainer). Source: found in the in-game check of 2026-10-11-latent-bugs on Classic, 2026-10-13. Status: accepted

## Problem
With the reward preview pinned next to an achievement row, Escape closes the whole achievement window, and the preview closes with it. The guide panel, which shares the spot next to the row since 103.0 (PR #338), closes on its own first. So the two side panels behave differently on the same key. Seen on Classic; the reward preview code is the same on Retail.

## Proposed outcome
Escape closes the reward preview first and leaves the achievement window open, like the guide panel. A second Escape closes the window.

## Affected users and systems
- Retail and Classic: the reward preview, whether hovered or pinned, next to a row in the achievement window or in a popout.
- No options, saved variables, data or plugins.

## Constraints
- No new taint: the preview joins the addon's own Escape handling (`Gui/FramesForClosing.lua`), which never registers with Blizzard's handler table.
- The preview keeps closing with its window, as it does now.

## Open questions
None. Krowi decided on 2026-10-13: "make the reward preview do the same".