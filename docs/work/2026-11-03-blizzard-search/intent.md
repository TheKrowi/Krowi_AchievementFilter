# Intent: The options window searches the way the game's Options window does, with a broad search to switch on
Author: Krowi (maintainer), from comparing both windows side by side on Retail (2026-11-02). Source: idea. Status: done

## Problem
The options window's search (new in 105.0, not released yet) works differently from the game's own Options window, which the window otherwise copies:
- each hit is a link with its section and heading in grey behind it, and a click leaves the results for that section; in the game's window each hit is the setting itself, which can be changed right in the results;
- it matches an option's name, its description, the heading it stands under and the section's explanation, so a word finds many options that do not carry it in their name: "event" lists 117, of which 103 only because they stand under a heading with "event" in it, and "tooltip" lists 35, of which 3 carry it in their name (Retail, measured headless 2026-11-03);
- it starts at the second letter and matches the typed text as one piece, so "reminder sound" finds nothing.

## Proposed outcome
- By default the search works as the game's (Krowi, 2026-11-03: "I want blizzard options search"): it matches the names of the options from the first letter, on the whole text and on each word, best match first, and shows the found options as working rows under their section's name, which opens the section.
- A switch lets a player turn on a broad search, which also finds options by their description and sections by their explanation (Krowi, 2026-11-03: "with an option for the user to enable a broad search").

## Affected users and systems
- Every player who uses the options window's search box, on Retail and Mists Classic (Titan Reforged through the Mists runs).
- `Krowi_Options/` (`Krowi_Options.lua`, `WindowMixin.lua`, `RowMixins.lua`, `Rows.xml`, `Window.xml`), which every Krowi addon will share once it moves to Krowi_Libraries, and the addon's side of it (`Options/Window/Model.lua` `model.Search`, `Options/Window/Window.lua`).
- The window's shared state in `KrowiAF_SavedData.OptionsWindow`, which keeps the switch.
- "Search all tabs": with a second addon in the window, its rows show in the same results.
- The `options` suite (`Tests/Options.lua`: `search`, `search-reset-position`, the second-tab search) and its headless run.
- Every locale file, for the switch's label.

## Constraints
- No taint: the results are the addon's own rows; no `Settings*` template is inherited (`docs/backlog.md`, the Blizzard look entry).
- A slider dragged in the results keeps working; a change that shows or hides rows updates the results.
- 105.0 is not released, so the search ships for the first time in this form; no changelog line of its own.

## Open questions
- Option names that only make sense under their heading ("Loaded" seven times under Other addons, "Active" five times under Reminder events): the game shows only the section's name above its hits.
- What the broad search adds: descriptions and explanations, and whether a heading's name still brings every row under it.
- What the help pane shows while no result is under the mouse.
- Where the switch for the broad search stands.