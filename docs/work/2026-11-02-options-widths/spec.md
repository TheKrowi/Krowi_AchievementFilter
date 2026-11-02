# Spec: The options window's controls take the widths of the game's Options window
Intent: [intent.md](intent.md). Status: accepted

## Requirements
Sizes are the game's own, read from `Blizzard_Settings_Shared` in `wow-ui-source\live` and `\classic` (the same on both) and from the atlases measured with the kit's `Get-Atlas.ps1` on Retail 12.1.5.70688 and Mists 5.5.4.70631.
1. **The window has the game's width.** Without the help pane it is laid out as the game's 920-wide window (`Blizzard_SettingsPanel.xml:4-5`, `:58-71`): the section list 199 wide at 18, the page from 16 after the list to 22 before the window's edge, so the page's rows are 635 wide as the game's (`Blizzard_SettingsList.lua:43-47`, `:70-74`).
2. **The help pane adds its own width.** Open, "How it works" makes the window 380 wider (1300); collapsed, its 30-wide strip does (950). The window grows and shrinks to the right; its left edge stays where it is.
3. **The window resizes in height only**, from 560 up, as today. Its width follows requirements 1 and 2 alone.
4. While the section list needs its scroll bar (a short window), the page gives up the 16 the game's list keeps for it, as today, so the window's width does not change while its height is dragged.
5. A slider is 250 wide (`Blizzard_SettingControls.lua:656`).
6. A dropdown is 220 wide between its arrows (`Blizzard_SettingControls.lua:741`).
7. An action button in a row (for example "Show placeholders") is 200 wide (`Blizzard_SettingControls.lua:834`).
8. A key binding row's two buttons are 160 wide each and touch, as on the game's Keybindings page (`Blizzard_Keybindings.xml:69-80`).
9. The search box is 350 wide (`Blizzard_SettingsPanel.xml:79`).
10. Defaults is 96 wide (`Blizzard_SettingsList.xml:27`) and stands 36 before the page's right edge, and is wider only when its text, or the Yes it shows while the window asks, does not fit in a translation.
11. Every check box is 30 x 29, the size of its `checkbox-minimal` art (`Blizzard_SettingControls.xml:81`), so the art is no longer drawn smaller.
12. The divider under the page title, `Options_HorizontalDivider`, is drawn at its own 630 x 1, centred on the page (`Blizzard_SettingsList.xml:19-23`), and never wider than the page.
13. **A check box in the window's bottom row switches where the controls start**, for this proof only; the in-game Decision says what stays:
    - **unticked, today's placement with a wider column:** the names start 16 from the row's left (20 more per indent) and stop 12 before the column; every control starts 330 before the row's right edge;
    - **ticked, the game's placement:** the names start 37 from the row's left (15 more per indent) and stop 85 before its centre (`Blizzard_SettingControls.lua:334-335`); a check box, slider, key button, input box or sub-row button starts 80 before the centre, an action button 40 before it, and a dropdown's arrow where the game's is (`:576`, `:657`, `:871`, `:730`);
    - the choice is kept with the window's shared state, so a `/reload` keeps it.
14. With the pane collapsed, a row's tooltip still hangs from 10 before its control (#379), in both placements.
15. No control reaches past its row's right edge, and no name reaches into its control, in both placements, with the pane open or collapsed and with or without the section list's scroll bar.
16. A window wider than the screen (a large UI scale on a narrow screen) is scaled down to fit, so neither the page nor the help pane is cut off.

From Krowi's look in game (2026-11-02, screenshots of both windows side by side):

17. **The controls line up in both placements, as the game's do.** A check box, a slider's left arrow, the key buttons and the input box's border start on one line, and a dropdown's left arrow 2.5 in from it (`Blizzard_SettingControls.lua:576`, `:657`, `:730`; the arrow 26 wide, 5 before the 220 dropdown, `SharedUIPanelTemplates.lua:1257`). In the column the dropdown's frame stood 10 after the line, which put its arrow 6 before it.
18. **The key buttons look like the game's** (`Blizzard_Keybindings.xml:5-28`): the silver art of `UIMenuButtonStretchTemplate`, white small text, "Not bound" in grey and slightly faded, and the button that waits for a key lit (`BindingUtil.lua:215-232`).
19. **The help pane's arrows point the way the window's right edge moves:** « on the open pane, since closing it narrows the window, and » on the collapsed strip.
20. **« stands at the open pane's top left, with "How it works" after it** (Krowi, 2026-11-02, second look): on the spot where the strip's » comes, so the arrow stays under the mouse when the pane closes and opens. "How it works" is part of the button, as the strip's is: a click on it closes the pane, and it lights with the arrow under the mouse.
21. **A check box carries the option that belongs to it, as the game's Tutorials and Mouse Sensitivity rows** (Krowi, 2026-11-02; `Blizzard_SettingControls.lua:1056-1064`, `:1168-1176`). The option is drawn 5 after the check box, a button 200 wide or a slider 214 wide, and greys out with the check box or by itself.
    - Each window's reset button goes after its Remember check box, named "Reset position" (Krowi: one string; the check box's name says which window).
    - The threshold's slider goes after Force two columns.
    - The pop outs' Close On Earn Delay and Snap Distance go after Close On Earn and Enable Snapping.

    The row's name, reload mark and changed line belong to both options together, and its reset arrow resets both.
    - A slider shows its own help under the mouse ("Force two columns threshold"), and search finds it by its own name.
    - A button has no help of its own (Krowi: "it should be obvious to the user"). Under the mouse the row's help stays the check box's, and a search for the button's text finds the check box's row.
    - "Reset window position", "Reset calendar position" and "Reset Data Manager position" leave every locale, to be deleted on CurseForge. The game's "Reset position" was already translated in 8 locales; esES, esMX and itIT get theirs in those files' own wording.

## Design
**Width** (`Krowi_Options/WindowMixin.lua`):
- `WindowWidth()` is 920 plus the pane's width (380 or 30). `Init` and `SetPaneCollapsed` set it; the pane's toggle first re-anchors the window by its top left, so it grows to the right, then saves the place.
- `SetResizeBounds(width, 560, width, <screen height>)` is set with every width change, and the grip keeps `StartSizing("BOTTOMRIGHT")`, which the bounds hold to height only. `Size` keeps both numbers in the shared state; only the height is read.
- After each width change and on `UI_SCALE_CHANGED`/`DISPLAY_SIZE_CHANGED` (already registered while shown), the window takes the scale `min(1, (UIParent:GetWidth() - 40) / width)` on its own frame.

**The page** (`Layout`), on the game's insets:
- the page's scroll box from 1 after the list's end (the game's 16 minus 15) to 24 before the help pane (the game's 22 to the edge, 2 of it given to the pane), with the rows padded 25 on the left (`InitList`'s `leftPad`), so a row is 635 wide;
- the title at 23 after the list's end, Defaults 36 before the page's right edge, the divider centred at its own width;
- the section list, the help pane and the inner frame art keep their own layout; the art's slices follow the new widths.

**Sizes** (`Krowi_Options/Rows.xml`, `Window.xml`):
- `Range` 250 x 20, `Select.Dropdown` 220 x 26 in its 250-wide arrow frame (`DropdownWithSteppersMixin:OnLoad` hangs the arrows 5 and 4 outside the dropdown), `Execute` 200 x 22, `Key1` and `Key2` 160 x 22 with no gap, `SearchBox` 350 x 22.
- `Krowi_OptionsCheckButtonTemplate` 30 x 29. The tab order row's name moves 4 right (66 to 70) to keep its gap after the larger box.
- `DefaultsButton` 96 x 22; after each `SetText` it widens to the text plus 24 when that is more (deDE "Standardwerte", ruRU "По умолчанию").

**Placement** (`Krowi_Options/RowMixins.lua`):
- One frame-free helper, `lib.RowGeometry(width, indent, centred)`, returns the name's left and right and each control's left as offsets from the row's left. The option, sub and tab order rows anchor from it in `Init`, and the tooltip's x (`OnRowEnter`) comes from it, so every row agrees and the headless runner can test it without frames.
- The 330 column replaces the file's `controlColumn = 300`.
- The grid rows (the event reminder per-expansion grid, columns from 200) have no counterpart in the game's window and keep their place.

**The switch** (`Krowi_Options/WindowMixin.lua`, `Window.xml`):
- A check box with its label, left of "Lines under headings", built like it. Its label is English only for the proof ("Controls from the centre"); the Decision after the in-game look turns it into a translated option or removes it.
- Its state is `ControlsFromCentre` in the shared state (`lib.SetShared`), off by default. Toggling it reloads the section.

**Library:** `Krowi_Options_1` minor 1 to 2.

## Options considered
1. **The window's width.**
   - **a. The game's width, with the help pane added to it, resizable in height only (Krowi's, 2026-11-02).** Every row is the game's 635 at every size, the divider fits at its own size, and the narrow page at the minimum size is gone.
   - **b. Resizable in both directions from 1000, as today.** The rows are 541 at the default size and 361 at the minimum with the pane open, where the names have 33.
2. **The divider when the page is narrower than 630.**
   - **a. At its own size and centred, never wider than the page (Krowi's, recommended).** With 1a the page is always wider than 630, so it is always the game's.
   - **b. Always 630.** It would run into the section list and the help pane on a narrow page.
   - **c. Stretched across the page, as today.**
3. **The fixed column, now that the two key buttons need 320.**
   - **a. 330 for every control (Krowi's, recommended).** The controls line up in one column; at 635 the names have 277 (today 213).
   - **b. 300, with the key buttons 145 each.**
4. **The proof's switch.** A temporary `/kaflook` command, as for #379, was the alternative. Krowi asked for a check box in the bottom row (2026-11-02).
5. **A window wider than the screen.** Scaling the window down (recommended) keeps everything in view; collapsing the pane on its own would hide the help instead; leaving it lets the screen's edge cut it off.

## Areas of concern
- **Taint and secret values:** only sizes, anchors and the scale of the addon's own frames change, and the switch is our own check box template. No Blizzard template is added, no Blizzard frame or global is touched, no secret value is read. `krowi:taint-reviewer` reviews the diff.
- **The secure Show me button** is laid over ours by coordinates against `UIParent` (`UpdateShowMe`). It must follow the window's new width and its scale: the plan checks that `UpdateShowMe` reads the button's place through the effective scale, and the `options` suite's Show me step runs with the pane toggled.
- **Clients:** Retail 12.1.5 and Mists 5.5.4 have the same values (`Blizzard_SettingControls.lua` in `classic`: `:474`, `:551-552`, `:609-610`, `:696`, `:733`; `Blizzard_SettingsPanel.xml` and `Blizzard_SettingsList.lua` alike) and the same atlas sizes. Both have `SetResizeBounds`. Titan Reforged through the Mists runs.
- **Blizzard API changes:** none.
- **Other addons, plugins and skins:** KAF's ElvUI, GW2 UI and EllesmereUI plugins do not skin the options window (#379's spec).
- **Saved variables and migrations:** `KrowiAF_SavedData.OptionsWindow` gains `ControlsFromCentre` through the shared state; no migration, it is absent until set and read as off. `Size[1]`, the width, is no longer read. If the Decision removes the switch, its key goes with it; only test installs have it, since 105.0 is not released.
- **Localization:** none for the proof. If the switch stays, its label goes into every locale file, translated, and to CurseForge. The Defaults text does not change.
- **Embedded libraries:** `Krowi_Options` stays inside KAF; minor 1 to 2.
- **Data snapshots:** none.
- **Player-facing text:** none; 105.0 is not released and its window line stays.
- **Wider by default:** 1300 against today's 1180 with the pane open. On a 16:9 screen the game's interface is about 1365 wide at UI scale 1, so above about 1.05 requirement 16 scales the window down.
- **Out of scope:** heights (rows 30 high against the game's 26 with 9 between, the window 720 against 724), the help pane's width, the section list.

## Verification
- **Headless scenarios** in the `options` suite (`Tests/Options.lua`, model in `.claude/tools/headless/run-tests.lua`), run before the build with `Recorded` set to today's behaviour, then `Recorded` set to `Target`:
  - `row-geometry`: `lib.RowGeometry` for a 635-wide row and a 619-wide one (the section list's scroll bar shown), in both placements, with indent 0 and 1. `Recorded` is today's geometry (column 300, names from 16, controls 210, 200, 160 and 124 wide).
  - `window-width`: the window's width with the pane open and collapsed, and its resize bounds. `Recorded`: today's 1180 with bounds from 1000 x 560.
- **Live step** `layout` in the `options` suite (game only), in both placements and with the pane open and collapsed, on the sections with a slider, a dropdown, an action button and the key bindings:
  - the window is 1300 or 950 wide, and a row 635 (or 619);
  - each shown control has its width from requirements 5 to 8;
  - no control's right edge is past its row's, no name's right edge is past its control's left;
  - the cut names are counted and listed;
  - the search box, Defaults, a check box and the divider have their sizes from requirements 9 to 12;
  - a screenshot per placement; the switch and the pane are put back at the end.
- **In game, Retail and Mists:** `Deploy.ps1 -WhatIf`, deploy, `/reload`; Krowi ticks the switch on and off, toggles the pane, drags the height, and compares with the game's Options window; `/kaftest options` and `/kaftest escape`, then `Read-GameTests.ps1` and `Read-GameErrors.ps1`.
- **Review passes:** `REVIEW.md` (`/code-review`, `krowi:taint-reviewer`).

## Decision
Krowi, 2026-11-02:
- Take the game's sizes for the sliders, dropdowns, row buttons, key buttons, search box, Defaults and check boxes.
- Where the controls start: "I want to see a POC of this, add an option near the bottom to toggle between" (requirement 13; the pick follows the in-game look).
- The divider at its own size, never wider than the page (option 2a).
- The fixed column 330 (option 3a).
- The window: "copy the blizzard options widths, make the screen only resizable vertically with a fixed width. how it works makes the window wider" (option 1a, requirements 1 to 4). Read as: the game's 920 layout, the pane's 380 (or its strip's 30) added, growing to the right. Scaling a window wider than the screen down (option 5) is the agent's addition, put to Krowi with the plan.

Krowi, 2026-11-02, after the first look in game: "buttons look different and should align with blizz, also elements do not align properly in ours (right) compared to blizz (left). lastly, the arrow on the how it works section should be reversed as the screen shrinks when we close it", and "turning it on aligns but still, elements should be aligned when it's off too" (requirements 17 to 19). Not raised, and left as it is: the game's list spaces its rows further apart (26 tall with 9 between, a heading 45 with its title 16 down, `Blizzard_SettingsList.lua:44-47`, `Blizzard_SettingControls.xml:14-19`, `:108`) than ours (30 with none, a heading 34), and raises its sliders and dropdowns 3 above the row's middle (`:657`, `:730`).

Krowi, 2026-11-02, the second look: "move the yellow arrows to the left and how it works a bit to the right", then "the "how it works" when open should also be part of the collapse button as it is to expand. keep the text where it is tough" (requirement 20).

Krowi's pick of the placement, 2026-11-02: "controls from the center can be removed, it's nicer when it's off". The column stays, the only placement; the switch, its saved key and the game's placement go. And: "also remove the lines under headings option, no line needed". The check box, its saved key, the line under the page's headings and the string "Lines under headings" in every locale go. The string is deleted on CurseForge through `krowi:localization` on Krowi's go. The two saved keys were never released (the window is new in 105.0), so no migration clears them.