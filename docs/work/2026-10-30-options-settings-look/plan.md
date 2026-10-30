# Plan: Options window in the look of Blizzard's Settings, with a tab per Krowi addon
Spec: [spec.md](spec.md). Status: accepted

## Context
Krowi wants the options window to look like Blizzard's own Options window on Retail and Mists, with tabs on top: one per Krowi addon, KAF first and KEVU next (Krowi, 2026-10-30). The spec was accepted the same day.
- **Build route:** Blizzard's frame and tabs (`SettingsFrameTemplate`, `MinimalTabTemplate`), with our own rows drawn on Blizzard's `Options_*` art.
- **Title strip:** "Options".
- **Shared state:** one place, size and pane state for every addon.
- **Search:** the open tab by default, with an "Every addon" check box that shows once a second addon has a tab.
- **Scope:** KAF only. Moving `Krowi_Options` into `Krowi_Libraries` is the next work item.

105.0 is not released, so this is the window's first shipped look.

## Files that change
| File | Change |
|---|---|
| `Krowi_Options/Krowi_Options.lua` | **Minor 0 to 1.** `lib.Tabs`: the registry, sorted by `TabName`, kept on `lib` so a newer copy inherits it. One shared frame, `lib.Frame`, named `Krowi_OptionsWindow` and created on first open. `CreateWindow(config)` returns a controller: `Open`, `Toggle`, `IsShown` and `Refresh` count only for its own tab, `GetFrame` as today, and a test-only `Unregister`. Frame-free helpers that the scenarios call: `lib.SetShared(key, value)` writes to every tab's saved table, `lib.Search(text, all, currentTab)` returns results with their tab. `OnCreated` runs per config. |
| `Krowi_Options/Window.xml` | **Frame:** `Krowi_OptionsWindowTemplate` inherits `SettingsFrameTemplate`. A `Body` frame replaces `Inset`. New pieces: `Tabs` (an anchor for the tab buttons), the page's `Divider` (`Options_HorizontalDivider`), an `InnerFrame` texture (`Options_InnerFrame`, variant), `SearchAll` (our check box plus a label), and a bottom-right `CloseButton` (`UIPanelButtonNoTooltipTemplate`, text from `CLOSE`). **Nav:** header template on `Options_CategoryHeader_%d` with `GameFontHighlightMedium`; button template 20 high on `Options_List_Active`/`_Hover`, its New mark a `NewFeatureLabelTemplate` child. |
| `Krowi_Options/WindowMixin.lua` | **Frame:** `OnLoad` gives `ClosePanelButton` and `CloseButton` a plain `Hide`. `Init` becomes window-wide: the title from `OPTIONS`, shared state read once. **Tabs:** new `ShowTab(tab, sectionId)` swaps `Config`, `Strings` and `Saved` and resets the section, search and confirm state; `RefreshTabs()` creates or reuses one `MinimalTabTemplate` button per tab, chained from `TOPLEFT 32,-27`, 5 px apart, with our own `OnClick` calling `SetSelected` per tab. **Layout:** on `Body`, with search at the top right and the reload bar and Close in the bottom row. **Nav:** `RefreshNav` numbers the headers `((n-1)%3)+1`; the nav button handles hover. **Search:** `OnSearch` honours `SearchAll`, with a `SubHeading` per addon and links that switch tab. **Shared state:** move, resize, collapse and `SearchAll` go through `lib.SetShared`. **Variants:** `ApplyLook()` for the temporary ones. |
| `Krowi_Options/Rows.xml`, `RowMixins.lua` | Variant: the header row's line shown or hidden. Variant: a `SelectSteppers` control, our frame inheriting `DropdownWithSteppersTemplate` with a `DropdownButton parentKey="Dropdown"` on `WowStyle2DropdownTemplate`. The row fills whichever control the look picks, with the same `SetupMenu` body. |
| `Options/Window/Window.lua` | The config passes `TabName = "Achievement Filter"`, drops `Name`, `Title` and `Icon`, and adds `Strings.SearchAll`. A temporary `/kaflook <variant>` (debug mode only) toggles the variants; removed before merge. |
| `Localization/*.lua` (11 locales) | `L["Every addon"]` below each file's `Exported at` line, translated. It goes to CurseForge through `krowi:localization` after merge, on Krowi's go. |
| `Tests/Options.lua` | `Window()` reads `Krowi_OptionsWindow`. New scenarios and a live step (Proof). |
| `Tests/Escape.lua`, `.claude/tools/headless/run-tests.lua`, `.luarc.json` | Frame name `KrowiAF_OptionsWindow` becomes `Krowi_OptionsWindow`. |
| `.claude/tools/Check-Repo.ps1`, `.claude/tools/README.md` | New rule `options-templates`: an `inherits` of a forbidden template under `Krowi_Options/` fails. The forbidden templates are those of spec requirement 10. |
| `_Packaging/Changelog.md` | The 105.0 "An options window ..." line is reworded for the look and the tabs. No new line. |
| `docs/backlog.md` | The Explore entry points to this work item. |
| `docs/work/2026-10-30-options-settings-look/plan.md` | This plan. |

Reused as they are:
- `InitList` (`WindowMixin.lua:78`);
- `Krowi_OptionsCheckButtonTemplate` (`Rows.xml:5`);
- `Krowi_OptionsTextRowMixin`;
- the in-window confirm (`AskConfirm`);
- `addon.Gui:RegisterFrameForClosing` (through `OnCreated`).

## Order of work
1. Commit this plan: `docs(work): plan for 2026-10-30-options-settings-look`.
2. **Test first:**
   - the `options-templates` lint rule, green on today's code;
   - scenarios `window-tabs` and `window-second-tab` with `Recorded` set to today's behaviour (no registry) and `Target` set to the spec;
   - run headless; commit `test: options window tabs and template guard`.
3. **The library:** registry, controller, shared state and search in `Krowi_Options.lua`, plus KAF's config. Set `Recorded` to `Target`; headless green.
4. **The frame:** `Window.xml` and `WindowMixin.lua` (frame, Body, tabs, nav art, page divider, bottom row, search box and check box). Rename the frame in the tests, Escape suite, runner and `.luarc.json`.
5. **Variants:** `ApplyLook`, the rows' variants and `/kaflook`.
6. **Strings:** `L["Every addon"]` in all 11 locale files. Then the changelog rewording.
7. **Checks:** `Check-Repo.ps1`, the `options`, `escape` and `help` suites headless, then `Find-DeprecatedApi.ps1`.
8. **In game:** deploy to Retail and Mists (`-WhatIf` first). Krowi runs `/kaftest options` and `/kaftest escape`, compares the variants live with `/kaflook`, and picks.
9. **After the picks:**
   - keep the picked variants and remove the switch and the losing code;
   - set the work files to `done`;
   - run the review passes (`/code-review`, `krowi:taint-reviewer`);
   - after-runs on Retail and Mists, then open the PR.

Departures (2026-10-30):
- **The title is `SETTINGS_TITLE`, not `OPTIONS`.** It is the string Blizzard's own window sets (`Blizzard_SettingsPanel.lua:54`, on all three clients) and reads "Options" as well, which is decision 2a.
- **The variant switch is `/kaflook <name>`, not `/kaftest look <name>`.** `/kaftest` runs suites, and the switch is gone after the pick.
- **Taint review of the build:** clean on every new template. One finding, already there before this work: `DropdownSelectionTextMixin` shows `GameTooltip` from our rows when a dropdown's text is cut off, and hides it on leave, the #300 path. Fixed by overriding `ShouldShowTooltip` on our own two dropdowns (`RowMixins.lua`). The `section-*` live steps now check every drawn dropdown for it.
- **In-game picks (Krowi, 2026-10-30):** the inner frame drawn in slices, the arrow dropdowns, the thin scroll bars, "Lines under headings", the divider at the game's own place, and the help strip from the mockup (see spec). The `/kaflook` switch is gone.
- **Second taint review** (after the picks): no finding on any client.
- **Code review** (high, 2026-10-30). Fixed:
  - the inner-frame slices drew over the window's own text and dimmed the page title, so they moved to the BACKGROUND layer;
  - the dropdown arrows now pass their hover on to the row;
  - a scroll bar change inside `ShowSection` or a search no longer builds the page twice (`Filling`, `EndFill`);
  - `PageWidth` uses the page's own insets;
  - the pictures suite hides the shared window on any tab;
  - the `options-templates` rule also catches `Settings*Mixin`, `KeybindListener` and the panel's globals, and skips comments over several lines;
  - the unused `Strings.New`, the atlas set twice and the final newline added to `Window.lua` are gone.
  - Deferred: the unconditional mixin globals and templates, in `docs/backlog.md` for the move into `Krowi_Libraries`.

## Risks
- **`Options_InnerFrame` has a fixed size** (Blizzard's window is 920 x 724; ours is wider and resizable). Stretched, it may distort. That is the first variant, measured with `C_Texture.GetAtlasInfo` in game.
- **`MinimalTabTemplate` click behaviour.** Its `SelectableButtonMixin:OnClick` toggles the tab's own selection. Our `SetScript("OnClick")` replaces it, so a click on the open tab never deselects it. `OnLoad` sets the text from `tabText`, which is nil at `CreateFrame`, so text and width are set right after.
- **The rename to `Krowi_OptionsWindow`** must reach every reader: the tests, the runner, `.luarc.json` and the Escape suite. A grep for `KrowiAF_OptionsWindow` must come back empty, apart from the work folders.
- **`DropdownWithSteppersTemplate`** needs the child `Dropdown` defined before its `OnLoad`, so it is declared in XML. The steppers move between the menu's radios, so they only work for dropdowns built from radios. Any other dropdown hides them (`SetSteppersShown(false)`).
- **A tab registered while the frame exists**, which happens in game when the scenario runs after an open: `RefreshTabs` rebuilds the buttons, and `Unregister` hides the spare button.

## Proof
- **Lint:** `options-templates` passes. The `Check-Repo` Stop hook is green.
- **Scenarios** (headless and in game, frame-free):
  - `window-tabs`: `tabs=Achievement Filter`.
  - `window-second-tab`: a test tab "Zz Test" with its own saved table and search. Expected: `tabs=Achievement Filter,Zz Test shared=both search-open=1 search-all=2 groups=Achievement Filter,Zz Test`, and after `Unregister`, `tabs=Achievement Filter`.
- **New live step** (game only), `tabs`, after `open`:
  - the window shows as many tab buttons as `lib.Tabs` has;
  - KAF's tab is selected;
  - the title strip shows `OPTIONS`;
  - `SearchAll` is hidden while there is one tab;
  - with a screenshot.
- **In game, Retail and Mists:**
  - green `/kaftest options` and `/kaftest escape`;
  - `Read-GameErrors.ps1` shows no new row;
  - screenshots next to Blizzard's Options window.
- **Taint, Krowi's clicks:** open KAF's window, close it, open Esc > Options and click several categories. The highlight must follow each click.
- **Reviews:** the `krowi:taint-reviewer` and `/code-review` findings are fixed or listed in the PR.