# Spec: The options window's Overview shows the sections as cards
Intent: [intent.md](intent.md). Status: done

## Requirements
1. Below the New list and the changelog, Overview shows each group's name ("Achievement window", "Around the game", "This addon") as today's header, and under it a card per section of that group, in the navigation's order, three to a row.
2. The cards of a row are equally wide and fill the row: about 204 wide at the page's 635, about 198 while the section list shows its scroll bar (619), with 12 between them. The last row of a group starts at the left and keeps the same card width.
3. A card shows, from the top:
   - a picture area 86 high across the card;
   - the section's name in the navigation's gold, with the navigation's NEW label after it while the section is New;
   - a line on what the section covers (if the Decision keeps it), in the grey of the window's notes, wrapping to at most two lines.

   All cards of a row are as tall as the tallest one.
4. The picture area shows the section's first help picture, scaled to fill the area and cut to it from its top left, as the mockup did (`kaf-options.css:199`, `object-fit: cover; object-position: left top`). A section may name another part of its picture where its top left shows nothing useful, decided in game.
5. A section without a help picture (Criteria on units, Reminder events, Keys and clicks, Other addons, Profiles, Advanced, About, and Achievement guides on Mists) gets what the Decision picks.
6. A card has a dark fill and a thin border; under the mouse it lightens, as the window's links do. A click opens the section, as the link does today. The magnifier cursor of the help pane's pictures is not used: a card's picture does not enlarge.
7. The cards draw the same with the help pane open or collapsed. The page is 635 wide either way, since the pane changes the window's width, not the page's (`Krowi_Options/WindowMixin.lua:27-29`).
8. The New list and the changelog stay as they are. A New section is listed at the top and labelled on its card.
9. Krowi_Options stays addon-neutral: it draws cards from the data a consumer hands it (picture, its size and part, name, line, New, click). Which picture and text belong to which section stays in `Options/Window`.

## Design
**Krowi_Options** (`WindowMixin.lua`, `Rows.xml`, `RowMixins.lua`):
- A new page element `{ Kind = "Cards", Cards = { { Picture, Width, Height, TexCoords, Icon, Name, Text, IsNew, OnClick }, ... } }`. `Flatten` splits it into `CardRow` rows of three, as it splits a `Grid` into `GridRow`s (`WindowMixin.lua:667-686`).
- `Krowi_OptionsCardRowTemplate` holds three `Krowi_OptionsCardTemplate` buttons. Each has its fill and border textures, the picture texture, the name, the NEW label (the navigation's `NewFeature` frame) and the line. `Init` places the cards from the row's width and hides the unused ones in the last row.
- The row's height comes from the extent calculator: the picture area, the name and the measured height of the tallest line in the row (`MeasureText`, as the notes are measured, `WindowMixin.lua:226`).
- Cutting a picture to the card: the scale that fills both the card's width and its 86, then the texture coordinates of the top-left part that fits, inside the part of the power-of-two texture the picture fills (`Pictures.lua` `TexCoords`).
- `Signature` (`WindowMixin.lua:708-716`) counts a card row by its sections, so a change that keeps the same cards does not rebuild the page.
- The library's minor goes up by one.

**Options/Window** (`Window.lua`):
- `OverviewElements` hands each group's sections to one `Cards` element instead of a `Link` each. Each card takes its picture from the section's help (`window.Help[id].Blocks`, the first block with a `Picture`) and its line from a new string per section.
- The 22 lines are the mockup's (`docs/work/2026-10-25-options-revamp/mockup/MockupSpec.ps1`, the `summary` of each section), reread against what each section holds now.

## Options considered
**A. A section without a picture.**
1. **A game icon, centred on the dark picture area (recommended).** Every card keeps the same shape, so the grid stays even. One icon per section, chosen from the game's icons on both clients; Krowi judges them in game.
2. **A shorter card with only the name and the line.** The grid is uneven where a row mixes cards with and without a picture (Around the game), and "This addon" becomes a row of small boxes.
3. **"This addon" stays a list of links, as in the mockup,** and the two cards in "Around the game" without a picture get an icon. The page then shows boxes and a list.

**B. The line of text under the name.**
1. **Yes, the mockup's 22 lines (recommended).** The line is what makes a card say more than the navigation. 22 new strings go into enUS and are translated in the other 10 locale files (the agent translates them, as for "Reset position" in #384), then go to CurseForge.
2. **No line, the picture and the name only.** No new strings, and the cards are lower (about 120 instead of 150), but a card then says nothing the navigation does not.

**Not considered:** making new pictures for the sections without one (`/kaftest pictures`). Profiles, Advanced and About have nothing in the game to shoot; it can follow later for Criteria on units and Reminder events.

## Areas of concern
- **Taint and secret values:** none. The cards are the addon's own buttons in its own window; no Blizzard frame, template with Blizzard code, or protected call. The click runs the existing `window.Controller:Open`.
- **Clients:** Retail and Mists Classic draw the same window. Mists uses Retail's help pictures (Krowi's call, PR #376); Achievement guides has no picture there (`Help.lua:236`), which requirement 5 covers.
- **Blizzard API changes:** none; textures, font strings and `SetTexCoord` only.
- **Other addons, plugins and skins:** no plugin or skin touches the options window (no reference to it under `Plugins/`).
- **Saved variables and migrations:** none.
- **Localization:** with B1, 22 new strings in enUS below the `Exported at` line and in every locale file, then a CurseForge export; with B2, none.
- **Embedded libraries:** `Krowi_Options` is in this repo, not under `Libs/`; its LibMan minor goes up.
- **Memory and load:** Overview loads up to 15 help pictures at once, each at most 1024 x 1024, where today it loads none. This is texture memory, not addon memory, and only while the window is open; a hitch on opening is checked in game. If one shows, the pictures get small copies for the cards (`Make-HelpPictures.ps1`), a later step.
- **Data snapshots:** none.
- **Player-facing text:** no changelog line; the window is new in 105.0 and its line already covers it.

## Verification
- **Scenario** in the `options` suite (`Tests/Options.lua` and its model in `.claude/tools/headless/run-tests.lua`): `options/overview-cards`, Recorded `links=22 cards=0`, Target `links=0 cards=22 rows=9` (5 + 2 + 2), recorded first, then set to Target with the build.
- The existing in-game step `options/live-section-overview` draws the page and screenshots it; its row count changes from 32 to the card rows.
- `Check-Repo.ps1`, the headless suites, `krowi:taint-reviewer` on the diff, `/code-review`.
- In game, Retail and Mists: `Deploy.ps1`, `/kaftest options`, `Read-GameTests.ps1` and `Read-GameErrors.ps1`, and a look with the pane open and collapsed, before Krowi's own look.

## Decision
Krowi, 2026-11-02:
- **A1:** a section without a picture gets a game icon, centred on the dark picture area, so every card has the same shape. The icons are judged in game.
- **B1:** every card carries its line: 22 new strings, translated in every locale file and sent to CurseForge.
- The intent was accepted with the design question (an unambiguous request).
- After the first look in game (requirement 4): Reward preview's picture is remade at the preview's default size, and its card shows the picture's lower part, the mount, instead of its top left.