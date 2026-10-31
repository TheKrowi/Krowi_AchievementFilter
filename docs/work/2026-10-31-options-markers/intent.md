# Intent: The options window's markers say what they mean
Author: Krowi (maintainer), from using the options window. Source: idea. Status: accepted

## Problem
An option row in the options window can carry two markers, and a player cannot tell what either means without hovering the row:
- a small gold square left of the option's name, shown when the option differs from its default; a right-click on it sets the option back. Every text that explains it calls it a dot ("Changed. Right-click the dot to set it back.", the overview help's "A dot before an option means you changed it"), but it is drawn as a square, and next to the check boxes it reads as one more box;
- a circle with an arrow right of the name, shown on every option that takes full effect only after a reload. Only the hover text explains it ("Requires a reload to take full effect."); the overview help does not mention it.

Both clients, every section of every tab the window holds.

## Proposed outcome
A player who opens the options window can tell what each marker means from what the window shows, without hovering a row first.

## Affected users and systems
- Every player who opens the options window, on Retail and Mists Classic.
- `Krowi_Options/` (the rows, the page header, the reload bar, the hover help), which every Krowi addon will share once it moves to Krowi_Libraries.
- The overview help of this addon (`Options/Window/Help/Help.lua`).

## Constraints
- No taint: the markers are the addon's own textures on its own frames.
- No new strings for CurseForge if the existing ones can carry the explanation.
- The window keeps the look of the game's own Options window.

## Open questions
None: the look was picked in game and recorded in the spec's Decision.