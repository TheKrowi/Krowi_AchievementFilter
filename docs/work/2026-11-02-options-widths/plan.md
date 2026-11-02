# Plan: The options window's controls take the widths of the game's Options window
Spec: [spec.md](spec.md). Status: accepted

## Context
After PR #379 the options window still differs from the game's Options window in its widths (Krowi, 2026-11-02). Accepted in the spec the same day:
- the game's sizes for sliders, dropdowns, row buttons, key buttons, the search box, Defaults and check boxes;
- the divider at its own 630, never wider than the page;
- the window at the game's width (920), with the help pane adding its own 380 (or its strip's 30), and resizable in height only;
- a check box in the bottom row that switches the controls between today's right-hand column (330 wide) and the game's placement from the row's centre, for Krowi to judge in game.

Work happens in the worktree `.claude/worktrees/feature-2026-11-02-options-widths` on branch `feature/2026-11-02-options-widths`. Intent and spec are committed in 93e40992.

## Files that change
| File | Change |
|---|---|
| `Krowi_Options/Krowi_Options.lua` | Minor 1 to 2 (`KROWI_LIBMAN:NewLibrary('Krowi_Options_1', 2)`). |
| `Krowi_Options/RowMixins.lua` | `local lib = KROWI_LIBMAN:GetLibrary("Krowi_Options_1")` at the top, as in `WindowMixin.lua`. **New `lib.RowGeometry(indent, centred)`** returns anchor specs `{ relativePoint, x }` for the name's left and right edges and for each control: `Toggle`, `Range`, `Select`, `Execute`, `Input`, `Key`, `Sub` (All), `TabArrows` (Up). It uses `RIGHT` for the 330 column and `CENTER` for the game's placement, so a row is placed in `Init` before its width is known. **New `lib.RowX(spec, width)`** turns a spec into an x from the row's left; the tooltip uses it, and so does the headless scenario. **Values** (spec requirement 13): column 330 for every control, with `Select` at 320 and `Input` at 324 (today's +10 and +6 offsets); names from 16 + 20 per indent to 342 before the edge. From the centre: −80 for `Toggle`, `Range`, `Input`, `Key`, `Sub` and `TabArrows`; −40 for `Execute`; −61.5 for `Select`, so its 220 dropdown starts where the game's does (`Blizzard_SettingControls.lua:730`: a 223 frame at −48, its dropdown centred); names from 37 + 15 per indent to −85. **`Krowi_OptionsOptionRowMixin:Init`** places the label and every control from the geometry of `window.CentredControls`; the label's RIGHT anchor moves there from `OnLoad`. **`OnEnter`** passes `lib.RowX(geometry[kind], self:GetWidth())` as the tooltip's x. The sub row places `All` and the tab order row places `Up` in their `Init`. `controlColumn` goes. The grid rows are unchanged. |
| `Krowi_Options/Rows.xml` | `Krowi_OptionsCheckButtonTemplate` 30 x 29. `Range` 250 x 20, `Select.Dropdown` 220 x 26 (frame stays 250), `Execute` 200 x 22, `Key1` and `Key2` 160 x 22, `Key2` at x 0 after `Key1`. The anchors of the controls placed by the geometry go (Init sets them). The tab order row's `Label` moves from 66 to 70. |
| `Krowi_Options/WindowMixin.lua` | **Width:** `minWidth` goes; `local gameWidth = 920` (`Blizzard_SettingsPanel.xml:5`); `lib.WindowWidth(collapsed)` returns `gameWidth + (collapsed and stripWidth or helpWidth)`. **New `ApplyWidth(keepLeft)`:** <br>• sets the scale `min(1, (UIParent:GetWidth() - 40) / width)`; <br>• with `keepLeft` and a known rect, re-anchors by `TOPLEFT` in UIParent's units, so the left edge stays; <br>• calls `SetWidth`, then `SetResizeBounds(width, minHeight, width, UIParent:GetHeight())`, or the `SetMinResize`/`SetMaxResize` fallback. <br>**Callers:** `Init` reads only `Size[2]`, then calls `ApplyWidth()` before the saved point. `SetPaneCollapsed` calls `ApplyWidth(true)` and then `SavePoint()`. `OnEvent` calls it for `UI_SCALE_CHANGED`/`DISPLAY_SIZE_CHANGED`. The grip calls `StartSizing("BOTTOM")`. **Page** (`Layout`, `PageWidth`): <br>• `pageInsets` becomes `{ Left = 1, Right = 24, Pad = 25 }`, and the page's `InitList` passes `leftPad` 25; <br>• `PageWidth()` is the row width (635, or 619 with the section list's scroll bar); <br>• the title at `navEnd + 23`; <br>• Defaults at `-40, -16` from the help pane's left; <br>• the divider `SetWidth(min(630, pageWidth))`, centred between `navEnd + 16` and 4 before the help pane, at y −50. <br>**Defaults:** a local `FitButton(button)` widens a button to `max(96, text + 24)`, called after each `DefaultsButton:SetText` (`ApplyStrings`, `RefreshFooter`). **Switch:** `CentredControls` is read from `saved.ControlsFromCentre` in `Init`. Its `OnClick` sets it, calls `lib.SetShared("ControlsFromCentre", ...)` and `ReloadSection()`. Its label is English, marked as the proof's. `Layout` places it left of "Lines under headings", with "Search all tabs" left of it; `UpdateSearchAll` ends the reload bar at it. **Lightbox:** `ShowPicture` divides its size by the window's scale, so a picture keeps its size when the window is scaled down. |
| `Krowi_Options/Window.xml` | `SearchBox` 350 x 22, `DefaultsButton` 96 x 22. New `ControlsFromCentre` check button (`Krowi_OptionsCheckButtonTemplate`) and `ControlsFromCentreLabel` (`GameFontNormalSmall`). |
| `Tests/Options.lua` | **Scenarios:** `row-geometry` (`lib.RowX` of every spec, for widths 635 and 619, both placements, indent 0 and 1) and `window-width` (`lib.WindowWidth` open and collapsed, and resize in height only). **Live:** <br>• `CheckDrawnRows` also checks each drawn row: control widths (250, 220, 200, 160), no control past the row's right edge, no name past its control, and a count of cut names (`IsTruncated`, reported, not failed); <br>• a new `sizes` step after `tabs` checks the search box 350, Defaults at least 96, a check box 30 x 29, the divider `min(630, page)` and the window `lib.WindowWidth(...)`; <br>• a new `placement` step ticks the switch, followed by one section step for the first section with each control type (toggle, range, select, execute, input, key), so both placements are checked and photographed; <br>• the `pane` step also checks the width; <br>• `Restore` puts the switch back and the saved table covers its key. |
| `docs/work/2026-11-02-options-widths/plan.md` | This plan. |

Reused as they are: `InitList`'s `leftPad` (`WindowMixin.lua:118`), `lib.SetShared`, `ReloadSection`, the `HeadingLines` check box pattern (`WindowMixin.lua:247-251`, `:374-375`, `:520-523`), `LayoutInnerFrame` (follows `navEnd`/`right` by itself), and the secure Show me overlay, which already scales by `GetEffectiveScale` (`Options/Window/Help/ShowMe.lua:415-424`).

## Order of work
1. Commit this plan: `docs(work): plan for 2026-11-02-options-widths`.
2. **Test first:** add the scenarios `row-geometry` and `window-width`. `Recorded` is today's code: the helpers are missing, so they report `column 300 from the right, names from 16` and `resizable from 1000x560`. `Target` is the spec's values. Run `run-tests.lua <worktree> options` headless (both clients) and commit `test: options window widths and row geometry`.
3. **Rows:** `RowMixins.lua` and `Rows.xml`. Set `row-geometry`'s `Recorded` to `Target`; headless green.
4. **Window:** `WindowMixin.lua` and `Window.xml` (width, page, Defaults, divider, search box, switch, lightbox). Set `window-width`'s `Recorded` to `Target`.
5. **Live steps** in `Tests/Options.lua`, then the minor bump.
6. **Checks:** `Check-Repo.ps1`, the `options`, `escape` and `help` suites headless, and `Find-DeprecatedApi.ps1`.
7. **In game:** `Deploy.ps1 -WhatIf`, deploy to Retail and Mists, and tell Krowi what was copied. Krowi runs `/kaftest options` and `/kaftest escape`, ticks the switch, toggles the pane, drags the height, and compares with the game's Options window. Then `Read-GameTests.ps1`, `Read-GameErrors.ps1` and the screenshots.
8. **Krowi's pick** (AskUserQuestion, recommended first, by what each looks like in game). Either one placement stays (the switch and its key go, and `Restore` stops covering them), or both stay as an option with a default. In that case the label goes into the 11 locale files, translated, and to CurseForge through `krowi:localization` on Krowi's go. Record the pick in the spec's Decision and here.
9. **Wrap up:** set the work files to `done`, run `/code-review` and `krowi:taint-reviewer`, do the after-runs on Retail and Mists, open the PR.

## Risks
- **A row is initialised before it has its width.** The anchors are relative (`RIGHT`, `CENTER`), so no width is read in `Init`; only `OnEnter` reads it, for the tooltip.
- **A hidden window may have no rect yet.** `ApplyWidth(true)` re-anchors only when `GetLeft()` returns a value. `Init` sets the width before the saved point.
- **Scale and re-anchoring:** the left and top edges are converted through the old and new scale (`GetLeft() * GetScale() / newScale`), so the window does not jump when the scale changes.
- **The section list's scroll bar** shows on a short window. The page then gives up 16 (rows 619), and the window's width stays, so dragging the height never changes the width.
- **Mists** has `SetResizeBounds` too; the existing fallback is kept for both bounds.
- **Cut names:** the game's placement leaves a name 195 at indent 0 on a 635 row (37 to 232.5), against 277 in the 330 column. The live step counts the cut names for Krowi's pick and does not fail on them.

## Proof
- **Headless:** `row-geometry` and `window-width` pass at `Target`; `options`, `escape` and `help` are green on Retail and Classic. `Check-Repo.ps1` is green.
- **In game, Retail 12.1.5 and Mists 5.5.4:**
  - `/kaftest options` is green in both placements, and `escape` is green;
  - `Read-GameErrors.ps1` shows no new row;
  - the screenshots of both placements sit next to the game's Options window.
- **Reviews:** the `/code-review` and `krowi:taint-reviewer` findings are fixed, or listed in the PR.

## Departures
- **Taint review of the first build** (2026-11-02): no findings. The window writes nothing of Blizzard's, the Show me overlay follows the window's scale through `GetEffectiveScale`, and no secret value is read.
- **Krowi's first look in game** (2026-11-02, spec requirements 17 to 19):
  - `RowMixins.lua`: the dropdown's frame stands 18.5 after the controls' line and the input box 6, in both placements (`selectIn`, `inputIn`). Before, in the column the dropdown was 10 after the line, and from the centre the input box was on the line. `row-geometry` was moved test first: `Target`, then the code, then `Recorded`.
  - `Rows.xml`: the key buttons use `Krowi_OptionsKeyButtonTemplate`, a copy of the game's silver key button art whose pieces carry no names. Inheriting `UIMenuButtonStretchTemplate` would have made a global per piece for every row through its `$parent` names. `Krowi_OptionsKeyButtonMixin` swaps the art when pressed. The row shows "Not bound" in grey at alpha 0.8, and lights the button waiting for a key.
  - `WindowMixin.lua`: the help pane's arrows are swapped.
  - `Tests/Options.lua`: each drawn dropdown row checks that its left arrow stands 2.5 from the check boxes' line.
- **Krowi's second look** (2026-11-02, spec requirement 20): `WindowMixin.lua` moves « from the pane's top right to its top left, 4 in, so its centre is the strip's » centre (15 in), and anchors "How it works" 2 after it, centred on it (it was at 16, −12). Then (Krowi, the same day) the window's `HelpKicker` became the button's `Label` in `Window.xml`, and the new `SetKicker(text)` sets it and widens the button's hit rect over it, so the name closes the pane and lights with the arrow, as on the strip.
- **Krowi's pick** (2026-11-02, the spec's Decision): the column stays.
  - `RowMixins.lua`: `placements` becomes the column's `placement`, and `lib.RowGeometry(indent)` loses its `centred` argument.
  - `WindowMixin.lua` and `Window.xml`: the `ControlsFromCentre` check box, its label, `CentredControls` and the saved `ControlsFromCentre` go.
  - `Tests/Options.lua`: `row-geometry` keeps the column's two widths; the `placement` step, the `placed-` section steps, `SectionsWithEachType` and the switch in `Restore` go.
- **Lines under headings removed** (Krowi, the same day):
  - `Window.xml` and `WindowMixin.lua`: the `HeadingLines` check box, its label, `ShowHeadingLines`, the saved `HeadingLines` and the `HeadingLines` string go. "Search all tabs" now stands next to Close, and with one tab the reload bar reaches to Close, as low as before.
  - `Rows.xml` and `RowMixins.lua`: the header row's `Line` goes, and so does its `Init`'s `window`.
  - `Options/Window/Window.lua` and the 11 locale files: `L["Lines under headings"]` goes.
  - `Krowi_Options.lua`: the saved table's comments.
  - `Tests/Options.lua`: the `sizes` step measures "Search all tabs" as the check box.
- **A check box with its option** (Krowi, the same day, spec requirement 21). Built test first: `position-rows`, `objectives-rows` and `popout-rows` were recorded as a row per option, then the code, then `Recorded`. Coverage and the fingerprint are unchanged.
  - `Options/Window/Map.lua`: a Path entry's `With` (the reset buttons, named by `Button`) and a Group entry's `Pairs` (`ForceTwoColumns`, `CloseOnEarn`, `EnableSnapping`).
  - `Options/Window/Source.lua`: an element carries `With`, and `AddLeaves` skips the paired keys.
  - `Options/Window/Model.lua`: the options list, coverage, section options and search include `With`.
  - `Krowi_Options/RowMixins.lua`:
    - the row draws `With` 5 after the check box, as `Execute` (200) or `Range` (214, put back to 250 on the next `Init`);
    - the slider and button set `With`;
    - the changed line, reload mark and reset arrow cover both options;
    - `OnEnter` over the control shows `With`'s help;
    - `InitRange` and `RefreshRange` are shared with the plain range row.
  - `Krowi_Options/WindowMixin.lua`: `ScrollToOption` also finds a `With`.
  - `Tests/Options.lua`: the live row check wants the control 5 after the check box, a 214 slider, and the slider showing `With`'s value.
- **One "Reset position"** (Krowi, the same day). `position-rows` was moved test first. The map's `Button` texts go, so the buttons read the AceConfig node's own name.
  - The row's `OnEnter` explains only a slider.
  - `model.Search` finds a button through its check box's row; the new `search-reset-position` scenario holds that.
  - The three strings leave the 11 locale files, and esES, esMX and itIT get "Reset position".