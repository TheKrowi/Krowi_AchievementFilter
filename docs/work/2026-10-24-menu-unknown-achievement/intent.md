# Intent: The right-click menu breaks on an achievement the game does not know
Author: Krowi (maintainer), captured by Claude. Source: `docs/backlog.md`, "From the latent-bugs review (2026-10-13, PR #339)"; found while reviewing that work item's fix, not reported by a player. Status: accepted

## Problem
The right-click menu of an achievement links to related achievements: other faction, required for, part of a chain and, in the Current Zone and Selected Zone categories, the achievement's own first category. When one of those links points at an achievement the player's game client does not know, building the menu raises a Lua error. The player gets the error and a menu that is cut off or missing entirely, for every achievement that carries such a link, every time it is right-clicked.

There are two ways to hit it:
- **A link in the data to an id the client lacks**: an achievement that exists on only one client, or one Blizzard removed that the data still links to. It is not known whether any current data does this on Retail or Classic. No BugGrabber log on either client holds the error.
- **A placeholder**: an achievement from a coming patch, which the list shows only when both the "Show placeholders" option and the matching filter are on (both off by default). Right-clicking one while the Current Zone or Selected Zone category is selected links it to itself.

A "(Missing)" entry for an achievement the game knows but the addon does not register is not part of this: since 103.0 it is greyed out and works (`docs/work/2026-10-11-latent-bugs`, defect B).

## Proposed outcome
Right-clicking any achievement opens its full menu without a Lua error, on every client, whatever the data links to. A link to an achievement the game does not know still shows up as an entry the player cannot click, the way "(Missing)" entries are greyed out today.

## Affected users and systems
- The achievement right-click menu on Retail (12.1.5) and Classic (Mists 5.5.4, Titan 3.80.2).
- Its four "go to" sections: other faction, required for, part of a chain, first category.
- Players who turn on placeholders, and any player whose data links to an id their client lacks.
- Other addons that add to this menu through `KrowiAF.PluginsApi` (the IAT plugin, "IAT Tactics"): their entries come after the sections, so today they are lost with the rest of the menu.
- No saved variables, options or data files change. Localization: a new label may be needed for an entry whose name the game cannot give (decided in the spec).

## Constraints
- Entries for achievements the game and the addon both know keep their text and behaviour, and the "(Missing)" entries keep theirs.
- No `Libs/` edit: the menu builder in Krowi_Menu is not the cause.
- Built test first: the `menu` suite (`Tests/Menu.lua`) gets a scenario for an id the game does not know, recorded as the error, and its in-game before-run on Retail and Classic is green before the fix.

## Open questions
- What does the entry say when the game has no name for the id: the id with a "(Missing)" style label, the placeholder text the achievement list already uses ("* Placeholder for <id> *"), or something else?
- What does the menu's title show when the right-clicked achievement is itself a placeholder?
- Does any current data link to an id one of the clients lacks? If it does, that is a data defect for the data skills, separate from this fix.
- One scope or two: only the "go to" entries, or every place the menu reads an achievement's name (the title too)?