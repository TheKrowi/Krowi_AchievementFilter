# Intent: The options window's Overview shows the sections as cards
Author: Krowi (maintainer), comparing the options window with the revamp's mockup. Source: idea. Status: done

## Problem
The options window's Overview (new in 105.0) lists the sections under their group names as gold links, one per line, below the release's changelog: the same names, in the same order, as the navigation beside it, so the page adds nothing a player cannot already see on the left (Retail screenshot of the `options` run, 2026-11-02 22:29). The revamp's mockup drew them as cards: a picture of the feature, its name and one line on what it covers, three to a row (`docs/work/2026-10-25-options-revamp/mockup/canvas/Main.dc.html:65-75`). The revamp's spec asked for that too (requirement 12, "a tile per feature section"); the build kept the links and its review removed the unused `Tile` fields (`docs/work/2026-10-25-options-revamp/plan.md`, Departures).

## Proposed outcome
The Overview shows each group's sections as boxes in a grid, as in the mockup (Krowi, 2026-11-02: "I want the current option to also have the boxes instead of a vertical list"): a picture, the section's name and a short line on what it covers. A click opens the section, as the link does today.

## Affected users and systems
- Every player who opens the options window, on Retail and Mists Classic (Titan Reforged through the Mists runs). The window lands on Overview while a section is New, so every player sees it on the first open after 105.0.
- `Options/Window/Window.lua` (what Overview shows) and `Krowi_Options/` (how the window draws it), which every Krowi addon will share once it moves to Krowi_Libraries.
- The help pictures in `Media/Help` (`Options/Window/Help/Pictures.lua`); 7 sections have none, and Achievement guides has none on Mists.
- Localization, if the cards carry a line of text.
- The `options` suite (`Tests/Options.lua`) and its headless model.

## Constraints
- No taint: only the addon's own frames, no Blizzard frame or template is touched.
- The New list and the changelog above the sections stay.
- 105.0 is not released, so Overview ships for the first time with the cards; no changelog line of its own.

## Open questions
- What a card shows for a section without a picture.
- Whether a card carries a line of text, which means 22 new strings in every locale.