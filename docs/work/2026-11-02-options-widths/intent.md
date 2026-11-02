# Intent: The options window's controls take the widths of the game's Options window
Author: Krowi (maintainer), from using the options window after PR #379. Source: idea. Status: done

## Problem
Since PR #379 the options window is drawn in the look of the game's own Options window, but several of its parts are a different size than the game's, so the two windows still look different side by side. Krowi noticed it mainly in the widths, on Retail and Mists Classic. Measured against Blizzard's source (`Blizzard_Settings_Shared`, the same on both clients):
- sliders are 210 wide, the game's 250;
- dropdowns are 200 wide between their arrows, the game's 220;
- the action buttons in rows are 160 wide, the game's 200;
- the key binding buttons are 124 each with a gap, the game's 160 each, side by side;
- the search box is 300 wide, the game's 350;
- Defaults is 110 wide, the game's 96;
- check boxes are 26 x 26, so their art (30 x 29) is drawn smaller than the game's;
- the divider under the page title is stretched across the page, the game's is drawn at its own size, centred;
- the controls start a fixed 300 from the row's right edge; the game's start from the row's centre, so they move with the page width, and the names stop 85 before the centre.

## Proposed outcome
- The sliders, dropdowns, row buttons, key buttons, search box, Defaults, check boxes and divider take the game's sizes (Krowi, 2026-11-02).
- For where the controls start, Krowi wants to see both in game first: today's column at the right, and the game's placement from the row's centre, switched by a check box in the window's bottom row (Krowi, 2026-11-02: "I want to see a POC of this, add an option near the bottom to toggle between"). Krowi then picks one, or keeps both as an option with a default.

## Affected users and systems
- Every player who opens the options window, on Retail and Mists Classic (Titan Reforged through the Mists runs).
- `Krowi_Options/` (`Rows.xml`, `RowMixins.lua`, `Window.xml`, `WindowMixin.lua`), which every Krowi addon will share once it moves to Krowi_Libraries.
- The window's shared state in `KrowiAF_SavedData.OptionsWindow`, if the switch is remembered.
- The `options` suite (`Tests/Options.lua`) and its headless model.

## Constraints
- No taint: only sizes and anchors of the addon's own frames change; no new Blizzard template is inherited.
- The window stays resizable from its 1000 x 560 minimum, and the help pane keeps its width, so the page is narrower than the game's (about 540 against 635 at the default size).
- 105.0 is not released, so the window ships for the first time with these sizes; no changelog line of its own.

## Open questions
- The divider is 630 wide and the page about 549 at the default size: what it does when it does not fit.
- The two key buttons (320) do not fit in today's 300 column: how wide the right-hand column becomes.
- After the in-game look: one placement, or both as a player's option, and which by default.