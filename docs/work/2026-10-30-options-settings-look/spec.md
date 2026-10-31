# Spec: Options window in the look of Blizzard's Settings, with a tab per Krowi addon
Intent: [intent.md](intent.md). Status: done

## Requirements
1. On Retail, Mists and Titan Reforged, the options window is drawn on Blizzard's own `SettingsFrameTemplate`, so each client shows its own frame, border and title strip, as its Options window does. It has no portrait.
2. Tabs sit on top, in the place of Blizzard's Game/AddOns tabs, drawn with `MinimalTabTemplate`: one per addon that registered with `Krowi_Options`. Today that is a single tab, "Achievement Filter", shown selected.
3. Clicking a tab shows that addon's sections, options and help, on its landing section. Each addon's ways in (`/kaf`, the minimap icon, the filter menu, the Settings > AddOns page) open the window on that addon's tab.
4. The section list on the left looks like Blizzard's category list:
   - each group under a header bar (`Options_CategoryHeader_1` to `_3`, cycling as Blizzard does);
   - sections in gold;
   - the selected section in white on `Options_List_Active`, hover on `Options_List_Hover`;
   - a New section marked with Blizzard's glowing NEW label left of its name.
5. The page has a white title, Defaults at its right and `Options_HorizontalDivider` under it.
6. The search box sits at the top right, in the tab row, and searches the selected tab by default. A "Search all tabs" check box in the bottom row (Krowi, in game, 2026-10-30; first "Every addon" beside the search box, shown only with a second tab), unticked by default, searches every tab instead:
   - results are grouped by addon;
   - clicking a result switches to its tab;
   - the choice is kept with the window's shared state.
7. A red Close button sits at the bottom right. The same bottom row holds the reload bar ("Some changes take effect after a reload. Reload now") and a "Lines under headings" check box. That check box is off by default, applies to every addon's tab and is kept with the window's shared state.
12. Blizzard's inner frame art is drawn across the window. Its shaded edges keep their size, and its divider stands at the end of the section list and again at the start of the help pane.
13. Every dropdown has Blizzard's arrows on each side, and the scroll bars are Blizzard's thin ones, placed as Blizzard places them.
14. The help pane hides behind a gold » at its top right. Collapsed, its strip shows a gold « with "How it works" written down the strip, as in the mockup but in the open pane's case (Lua's `upper()` leaves non-English letters small), and a click anywhere on it brings the pane back (Krowi, in game, 2026-10-30). Opened again, the help's scroll bar shows only when the help is longer than the pane.
8. The help pane on the right, its collapse strip, Show me, the in-window Yes/No, the resize grip and every option behave as they do today.
9. The window keeps one place, size and pane state, whichever addon opens it. Each addon still remembers its last section and the sections the player has seen.
10. No taint:
    - nothing in `Krowi_Options` inherits `SettingsCategoryListTemplate`, `SettingsCategoryListButtonTemplate`, `SettingsListTemplate`, `SettingsListSearchCategoryTemplate`, any `Settings*ControlTemplate`, `SettingsCheckboxTemplate`, `SettingsListSectionHeaderTemplate`, `KeyBindingFrameBinding*` or `UIPanelButtonTemplate`;
    - the X button closes with a plain `Hide`;
    - after KAF's window was open, Blizzard's Options window still highlights each category clicked.
11. No texture ships with the addon. Every piece of art comes from the client, by template or atlas name.

## Design
**The frame** (`Krowi_Options/Window.xml`):
- `Krowi_OptionsWindowTemplate` inherits `SettingsFrameTemplate` instead of `ButtonFrameTemplate`. Its pieces: `Bg` (`FlatPanelBackgroundTemplate`), `NineSlice` with the per-client `ButtonFrameTemplateNoPortrait` layout, `NineSlice.Text` for the title, and `ClosePanelButton`.
- `ClosePanelButton` gets the plain `Hide` the X has today (`WindowMixin.lua:93`).
- A plain `Body` frame replaces `ButtonFrameTemplate`'s `Inset` as the anchor for the layout (`WindowMixin.lua:186-254`). It runs from under the tabs (Blizzard's category list starts at `-76`) to above the bottom row (`46`).
- The window keeps its size limits (1000 x 560 minimum, 1180 x 720 default), its HIGH strata and its resize grip.
- The global frame name becomes the library's own, `Krowi_OptionsWindow`, since the window is no longer one addon's.

**Tabs:**
- The window builds one `MinimalTabTemplate` button per registered addon:
  - the first at `TOPLEFT 32, -27` and each next one 5 px to its right, as Blizzard places Game and AddOns (`Blizzard_SettingsPanel.xml:26-45`);
  - each 37 high, as wide as its text plus 40.
- The tab text is the consumer's new `TabName`. KAF passes "Achievement Filter", its TOC title without "Krowi's "; addon names are not translated.
- Tabs are sorted by `TabName`, so the order does not depend on load order.

**Several addons, one window** (`Krowi_Options/Krowi_Options.lua`):
- `lib.CreateWindow(config)` keeps its signature and still returns a controller. It now adds the config to `lib.Tabs`, a registry on the `lib` table that a newer copy of the library keeps, and every controller drives the one shared frame, `lib.Frame`.
- **The controller:**
  - `Open(sectionId)` shows the window on its own tab;
  - `Toggle` hides the window only when it shows its own tab, and otherwise opens on it;
  - `IsShown` and `Refresh` count only while its own tab is shown.
- **Switching tabs** swaps `Config`, `Strings` and the per-addon saved table, then shows that tab's landing section. A pending reload stays, because a reload reloads every addon.
- **Window place, size and pane state:**
  - read from the opening addon's saved table when the frame is created;
  - after each move, resize or collapse, written to every registered addon's table, so each addon alone still remembers it.
  - `LastSection` and `Seen` stay per addon.
  - The shape of `KrowiAF_SavedData.OptionsWindow` does not change.
- **`OnCreated(frame)`** runs for each registered config when the frame is made, and for a config registered later as it registers. KAF's call registers the window and the lightbox with its Escape handling, as today.
- **Title strip:** "Options" (Decision), from `SETTINGS_TITLE`, the string Blizzard's own window sets.
- **Search:** the selected tab's `Search(text)` by default. With "Search all tabs" ticked and more than one tab, the window calls every registered config's `Search` and lists the results under a `SubHeading` row per addon (its `TabName`). A result's link first switches to its tab. The check box (our own `Krowi_OptionsCheckButtonTemplate` with a label) sits in the bottom row, left of "Lines under headings", and shows only once a second addon has a tab (Krowi, 2026-10-31). Its state, `SearchAll`, is written with the shared place and size.

**Section list:**
- `Krowi_OptionsNavHeaderTemplate` draws `Options_CategoryHeader_%d` at its atlas size, with the label in `GameFontHighlightMedium` at x 20. The index is `((n - 1) % 3) + 1`, as Blizzard's list does (`Blizzard_CategoryList.lua:414`).
- `Krowi_OptionsNavButtonTemplate` is 20 high. Its label is `GameFontNormal`, or `GameFontHighlight` when selected. Its background is `Options_List_Active` when selected and `Options_List_Hover` under the mouse (`Blizzard_CategoryList.lua:42-63`).
- As in the game's list (`Blizzard_CategoryList.lua:209-217`), the navigation's scroll box reaches 50 px left of the list with the rows padded back by as much, so the NEW label hanging left of a section is not clipped, and its rows are 2 px apart (Krowi, in game: Mists cut the label off).
- Its New mark inherits `NewFeatureLabelTemplate`. That template is self-contained: its mixin only sizes its own text and plays its own glow (`Blizzard_SharedXML/NewFeatureLabel.lua`), and it uses the game's `NEW_CAPS` string. When the mark shows, its text is anchored to its right edge, as the game's list does (`Blizzard_CategoryList.lua:129-130`): left centred, the glow widens the mark by 40 and pushes the text 20 left, past the window's edge on Mists (Krowi, in game). Overview stays the first entry, above the groups.
- The list's scroll bar stands halfway between the header art's edge (197, measured on the atlas) and the divider, instead of right after the list (Krowi, in game).

**Page and bottom row:**
- The page title stays `GameFontHighlightHuge`, with `Options_HorizontalDivider` under it, stretched across the page.
- Defaults, the changed count and the in-window Yes/No keep their place at the page's top right.
- A new `CloseButton` (`UIPanelButtonNoTooltipTemplate`, the game's `CLOSE` string) sits at the bottom right, left of the resize grip. The reload bar moves into that bottom row, left of it.

**Rows:** they already use the gold label, the control column, Blizzard's minimal check box and the slider with steppers (`Krowi_Options/Rows.xml`). They stay, except for the variants below.
- With the help pane collapsed, a row's tooltip (`Krowi_Tooltip`) hangs above the row from 10 before the hovered control, where the game's window shows a setting's (`Blizzard_SettingControls.xml:57-61`, `DefaultTooltipMixin`: `ANCHOR_RIGHT`, x -10, on the part of the row before the control), instead of at the row's far right (Krowi, in game, 2026-10-31).

**Details judged in game:** a temporary debug switch (`/kaflook <name>`) toggled each detail live. Krowi picked on 2026-10-30 (Decision), and the switch is gone.
- **The inner frame art.** `Options_InnerFrame` is drawn at its atlas size in Blizzard's fixed 920 x 724 window (`Blizzard_SettingsPanel.xml:10-14`). Ours is wider, because of the help pane, and resizable. Stretched as one piece, its divider moved off the section list's edge, and nothing divided the page from the help pane.
  - The kit's `Get-Atlas.ps1` measured it on both clients: it is the same 886 x 618 atlas of file 1318750.
  - Its shading is 30 px left and right, 90 px at the top and 178 px at the bottom. Its divider is 2 px at x 199.
  - It is now drawn in slices (`WindowMixin.lua`, `CreateInnerFrame` and `LayoutInnerFrame`): the edges and the divider at their size, and the flat parts stretched. The divider stands at the end of the navigation and again at the start of the help pane. The dark fills behind the navigation and the help pane are gone.
  - The navigation is 199 px wide, as the game's category list (`Blizzard_SettingsPanel.xml:58-63`), so its header bars end at the divider. Without a scroll bar, the divider stands at the art's own place, as in Blizzard's window.
  - While the navigation does not fit, its scroll bar shows after the list, and the divider and the page move right by the 16 px the game's list keeps for it (`Blizzard_CategoryList.lua:220-229`; Krowi, in game). The window follows the scroll bar's `OnVisibilityChanged` (`ManagedScrollBarVisibilityBehaviorMixin`).
- **The page's group headers.** Blizzard's section headers are `GameFontHighlightLarge` without a line (`Blizzard_SettingControls.xml:13-23`). The gold underline became the player's "Lines under headings" check box, off by default.
- **Dropdowns.** Blizzard's `DropdownWithSteppersTemplate`, with a `WowStyle2DropdownTemplate` child, replaced `WowStyle1DropdownTemplate`. It has an arrow on each side ("◀ SHIFT key ▶"), and the arrows step through the menu's radios.
- **Scroll bars** (Krowi, in game): `MinimalScrollBar`, anchored as `Blizzard_CategoryList.xml` and `Blizzard_SettingsList.xml` anchor theirs, replaced `WowTrimScrollBar`.

## Options considered
1. **How the look is built.**
   - **a. Blizzard's frame and tabs, our own rows on Blizzard's art (recommended).** This is the design above. It is the route the taint review found safe. Each client draws its own art, and the code behind the rows, search, tooltip and key capture stays ours.
   - **b. Keep `ButtonFrameTemplate` and only restyle the inside.** It is less work, but the portrait frame and border stay the general Retail ones, so it would not look like the Options window.
   - **c. Register the options in Blizzard's own Settings window.** Rejected by the taint review: it would be a second options window, with Defaults, commit and revert owned by `SettingsPanel`, and it has no help pane.
2. **The title strip.**
   - **a. "Options", the game's own `OPTIONS` string (recommended).** It is translated already, and the tabs say which addon is open.
   - **b. "Krowi's Addons".** This is a new string for CurseForge.
   - **c. The open addon's full title, such as "Krowi's Achievement Filter".** It changes with the tab and repeats it.
3. **Place, size and pane state with several addons.**
   - **a. One shared state, written to every addon's table (recommended).** The window opens where the player left it, from whichever addon.
   - **b. Each addon remembers its own.** The window would open in a different place depending on which addon opened it.
4. **Search with several tabs.**
   - **a. The open tab (recommended).** This is what each addon's search does today, and with one tab it is all there is.
   - **b. Every tab, with results grouped by addon.** This can be added when KEVU joins, if wanted.
   - **Chosen: both.** The open tab by default, and every tab with the "Every addon" check box.

## Areas of concern
- **Taint and secret values:**
  - The review's safe list is followed: `SettingsFrameTemplate` with the X set to a plain `Hide`, `MinimalTabTemplate` (`SelectableButtonMixin`, self-contained), `NewFeatureLabelTemplate` (self-contained, above), `FlatPanelBackgroundTemplate`, `UIPanelButtonNoTooltipTemplate`, `MinimalSliderWithSteppersTemplate` and `DropdownWithSteppersTemplate`.
  - Nothing calls the Settings API beyond today's stub, and nothing touches `SettingsPanel`, `SettingsTooltip` or `KeybindListener`.
  - On the Classic clients `SettingsFrameTemplate` names its title texture `$parentTitleBg`, which adds the global `Krowi_OptionsWindowTitleBg`. It is a texture name, not a Lua write.
  - No secret values are read.
  - `krowi:taint-reviewer` reviews the diff.
- **Clients:**
  - Retail 12.1.5 has `SettingsFrameTemplate` (`Blizzard_Settings_Shared/Mainline/`).
  - Mists 5.5.4 and Titan Reforged 3.80.2 have the Classic version (`Blizzard_Settings_Shared/Classic/`).
  - `MinimalTabTemplate`, `MinimalSliderWithSteppersTemplate`, `NewFeatureLabelTemplate` and the `Options_*` atlases are in all three clones.
  - `Blizzard_Settings_Shared` is not load-on-demand on any client.
  - Titan has no local install; the Mists runs stand in for it, as for the window in 105.0.
- **Blizzard API changes:** none. `Find-DeprecatedApi.ps1` runs on the diff.
- **Other addons, plugins and skins:**
  - KAF's ElvUI, GW2 UI and EllesmereUI plugins do not skin the options window (no reference to it in `Plugins/`).
  - Skin addons that restyle Blizzard's `SettingsPanel` do so by its name, not its template.
  - The frame name changes from `KrowiAF_OptionsWindow` to `Krowi_OptionsWindow`. Nothing outside the tests and `.luarc.json` uses it, and the window has not shipped yet: it first ships in 105.0.
- **Saved variables and migrations:** none. `KrowiAF_SavedData.OptionsWindow` keeps `Point`, `Size`, `PaneCollapsed`, `LastSection` and `Seen`.
- **Localization:**
  - Two new strings, "Search all tabs" (`Strings.SearchAll`) and "Lines under headings" (`Strings.HeadingLines`), go into every locale file, translated, and to CurseForge.
  - `OPTIONS`, `CLOSE` and `NEW_CAPS` are the game's own, and the tab shows the addon's name.
  - `L["New"]` stays in use by the overview's New header.
- **Embedded libraries:**
  - `Krowi_Options` stays inside KAF.
  - Its minor goes from 0 to 1 (`KROWI_LIBMAN:NewLibrary('Krowi_Options_1', 1)`).
  - The unconditional mixin globals and templates (backlog) only matter once a second addon embeds it. That is the extraction work item.
- **Data snapshots:** none.
- **Player-facing text:** 105.0 is not released, so the window ships for the first time with this look. The 105.0 changelog line for the window is reworded instead of adding a line.

## Verification
- **Headless:** the `options` suite follows the new frame name, `Krowi_OptionsWindow`:
  - `Tests/Options.lua`, `Tests/Escape.lua`, `.claude/tools/headless/run-tests.lua` and `.luarc.json` are updated;
  - `CloseButton` stays the bottom button the suite clicks.
- **New scenarios in the `options` suite:**
  - the window shows one tab, "Achievement Filter", selected;
  - `Open` through KAF's controller shows that tab;
  - a second, test-only registration adds a second tab, and switching to it and back keeps each addon's section and the shared size. It runs headless only, so nothing extra shows in game;
  - with that second tab, "Every addon" shows. Ticked, a search lists both addons' results under their names, and a result of the other addon switches to its tab.
- **Permanent guard:** a `Check-Repo` rule, `options-templates`, fails on any `inherits` of the forbidden templates in requirement 10 under `Krowi_Options/`.
- **In game, Retail and Mists:**
  - `Deploy.ps1 -WhatIf`, deploy, `/reload`;
  - `/kaftest options` and `/kaftest escape` (the release gate's suites), then `Read-GameTests.ps1` and `Read-GameErrors.ps1`;
  - screenshots of KAF's window next to Blizzard's Options window;
  - `C_Texture.GetAtlasInfo("Options_InnerFrame")` printed for the inner frame variant.
- **Taint check (Krowi's clicks):** open KAF's window, close it, open Esc > Options and click several categories. The highlight follows each click, and BugGrabber and the taint log show nothing from KAF.
- **Review passes:** `REVIEW.md` (`/code-review`, `krowi:taint-reviewer`).

## Decision
Krowi, 2026-10-30:
- 1a: Blizzard's frame and tabs, with our own rows on Blizzard's art.
- 2a: the title strip says "Options".
- 3a: one shared place, size and pane state.
- For search: "the open tab by default, option to search every tab", built as the "Every addon" check box in requirement 6.

In game, the same day:
- Blizzard's inner frame is a must, with a divider at the end of the navigation and another before the help pane.
- The lines under headings become a player's check box in the window's bottom row, off by default.
- The dropdowns keep Blizzard's arrows.
- The scroll bars are Blizzard's new, thin ones.

The scope came from the intent gate the same day: the look and the tab host now, proven with KAF alone; the move into `Krowi_Libraries` is the next work item. A single tab shows while KAF is the only Krowi addon.