# Plan: The options window searches the way the game's Options window does, with a broad search to switch on
Spec: [spec.md](spec.md). Status: accepted

## Context
Krowi chose the game's search for the options window (new in 105.0, unreleased): names only, from the first letter, whole text then each word, best match first, the found options as working rows under their section's clickable name. On top of that: each row's own heading above it (option A), and a "Search descriptions" switch that adds descriptions and section explanations. With no row under the mouse, the help pane explains the search. The spec (accepted 2026-11-03, commit 2c8a184d) holds requirements 1-19; this plan is how to build them. Work happens in the worktree `.claude/worktrees/feature-2026-11-03-blizzard-search` on `feature/2026-11-03-blizzard-search`.

## Files that change
| File | Change |
|---|---|
| `Krowi_Options/Search.lua` (new, in `Krowi_Options/Files.xml` after `Krowi_Options.lua`) | the search itself, consumer-neutral, no frames: `lib.Flatten`, `lib.Search` |
| `Krowi_Options/Krowi_Options.lua` | minor 2 -> 3; old `lib.Search` removed; the config doc: `Search(text)` gone, `Strings` gains `SearchBroad`, `SearchHelp`, `SearchHelpBroad` |
| `Krowi_Options/WindowMixin.lua` | `Flatten` -> `lib.Flatten`; `OnSearch` draws the results; search-aware `OnOptionChanged`, `ReloadSection`, `AskConfirm`/`ConfirmingHere`/`RefreshFooter`, `OnRowEnter`/`OnRowLeave`; `ShowSearchHelp`; the switch in `OnLoad`/`Init`/`Layout`/`UpdateSearchAll`/`ApplyStrings` |
| `Krowi_Options/RowMixins.lua` | rows take strings from their element's tab (`window:StringsFor(element)`); `Krowi_OptionsSearchHeadingRowMixin` |
| `Krowi_Options/Rows.xml` | `Krowi_OptionsSearchHeadingRowTemplate` |
| `Krowi_Options/Window.xml` | `SearchBroad` check box and `SearchBroadLabel` |
| `Options/Window/Model.lua` | `model.Search` and its `Plain` removed |
| `Options/Window/Window.lua` | `Search = model.Search` removed; strings `SearchBroad`, `SearchHelp`, `SearchHelpBroad`; header comment names `SearchBroad` in the saved table |
| `Localization/*.lua` (11 main locale files) | 3 new strings below each `Exported at` line, translated |
| `Tests/Options.lua` | scenarios on `lib.Search`; second-tab test on elements; game steps for the drawn results |
| `Tests/README.md` | the options suite's search lines |

## The search (`Krowi_Options/Search.lua`)
- `lib.Flatten(elements, known)`: today's `Flatten` (`WindowMixin.lua:667`) moved here; `known` is the window's `rowTemplates`, nil keeps every kind. Hidden options stay out (requirement 3).
- `Plain(text)`: today's `Model.lua:242`, moved.
- `lib.Search(text, all, current, broad)` -> `{ { Tab, Sections = { { Id, Name, Rows, Explained } } } }`, tabs in tab order, only those with hits.
  - Words: `text:upper()`, then each `([^, ]+)` (`Blizzard_SettingsPanel.lua:576-581`). Empty text -> nothing.
  - Per tab: every section of `Config.Groups` (not overview); per section `lib.Flatten(Config.GetElements(id))`, walking it once, remembering the last `Header` text and each row's parent:
    - **parent**: an `Option` with `Option.Indent >= 1` hangs under the nearest earlier `Option` with lower indent or `Sub`, not past a `Header`; a `GridRow` under the nearest earlier `GridHeader` (requirement 11).
    - **names** (requirements 1-2): `Option` -> `GetLabel()`, plus `With` (if shown) -> `GetButtonText()` for execute, else `GetLabel()`; `Sub` -> `Text`; `GridRow` -> `Label`; `TabRow` -> `Item.Show:GetLabel()`. Other kinds have none.
    - **broad** (requirement 19): an `Option` also by `GetDescription()` (and `With`'s); the section by `Config.GetHelp(id).Blocks` (`Text`, `Heading`, `Term`) -> `Explained = true`.
  - **Score** of a row (requirement 7): `{ inName, words, length }` compared in that order: whether a name matched (above description-only hits), how many of the split words are in its names (the whole text counts as all of them), the longest match. Ties keep page order.
  - **Rows** of a section: a hit and its parent form a block (parent first, then its found children by score); a found `Sub` brings all its members, a found `GridRow` its `GridHeader`. Blocks are grouped by their heading; heading groups ordered by their best block, blocks within by score. Each row element is a shallow copy with `Tab`, `SectionId` and `Heading` added, so the window's rows can tell whose they are.
  - Sections ordered by their best row (explanation-only sections after them); a section with neither rows nor `Explained` is left out.

## The window (`WindowMixin.lua`, `Rows.xml`, `Window.xml`)
1. **`OnSearch(text, scrollPosition)`**: trims; empty -> back to the section (today's path, without the two-letter minimum, requirement 4). Otherwise builds the list: with "Search all tabs", the tab's name as `SubHeading` (today); per section a `SearchHeading` (click: `ShowTab(tab, sectionId)`), a `SubHeading` each time the row's heading changes, the rows; for `Explained` a `Link` with `Strings.HowItWorks`; nothing -> the `Note` "Nothing found." Draws through the data provider, `self.Signature = Signature(list)`, then `ShowSearchHelp()`.
2. **`Signature`** also covers `SearchHeading` (its text).
3. **`OnOptionChanged` while searching** (requirement 14): builds the list again; a different signature redraws with `RetainScrollPosition`, the same one only `Refresh()`es (a slider keeps its drag). `ReloadSection` while searching calls `OnSearch(text, RetainScrollPosition)` (the tab list's arrows).
4. **Confirm in the results** (requirement 15): `AskConfirm` while searching sets `Confirming = { Search = true, ... }`; `ConfirmingHere` accepts it while searching; `RefreshFooter` shows Defaults (as Yes) and No only while such a question is open in the results, and hides Defaults and the count otherwise (requirement 8). Typing a new search drops the question, as today.
5. **A row of another tab** (requirement 13): `window:StringsFor(element)` = `(element.Tab or self.Tab).Config.Strings`, used by the option row's key texts, the `Sub` row's All/None and `OptionHelpLines`. `OnRowEnter`'s kicker reads `(row.Element.Tab or self.Tab).Config.SectionName(row.Element.SectionId or self.SectionId)` (requirement 16).
6. **The pane while searching** (requirement 17): `ShowSearchHelp()` fills the title `Strings.Search` and the two paragraphs; `OnRowLeave` returns to it while searching; `self.Help = nil`, so Show me hides.
7. **`Krowi_OptionsSearchHeadingRowTemplate`** (`Rows.xml`): a Button, 45 high, `Title` in `GameFontNormalLarge` at TOPLEFT 16, -16, `MouseoverOverlay` 0.1 grey additive shown on enter (`Blizzard_SettingsList.xml:65-86`); `rowTemplates.SearchHeading = { ..., 45 }`. Its mixin: `Init` sets the text, `OnClick` runs `element.OnClick`.
8. **The switch** (requirement 18): `Window.xml` `SearchBroad` (`Krowi_OptionsCheckButtonTemplate`) and `SearchBroadLabel`, always shown. `OnLoad`: click -> `self.SearchBroad = ...`, `lib.SetShared("SearchBroad", ...)`, search again while searching. `Init` reads `saved.SearchBroad`. `Layout`/`UpdateSearchAll`: the label right of the check box, left of "Search all tabs" when that shows, else of Close; the reload bar ends before the switch. `ApplyStrings`: label and hit rect, as `SearchAll`.

## Order of work
1. Tests first, on today's code (`Tests/Options.lua`, headless): the new scenarios with `Recorded` = what today's `model.Search` does and `Target` = the spec. `search-names` ("reminder": names-only 0 rows; broad finds Event reminders), `search-headings` ("loaded": `Other addons>ElvUI>Loaded ...`), `search-parent` (a child found with its parent; the pair picked with the probe at build time), `search-order` ("show tooltip": "Show in Tooltip" before "Skin Tooltip"), `search-first-letter` (one letter finds rows). Run `run-tests.lua options`: they pass as recorded and are open. Commit `test: record today's options search in the options suite`.
2. `Search.lua` + `Files.xml`, `Krowi_Options.lua` (minor 3, doc), `Model.lua`, `Window.lua`: the scenarios' `Recorded` set to `Target`; `search-reset-position` and the second tab (`SecondTab` gains `Groups`, `SectionName`, `GetElements` with one fake option) move onto `lib.Search`. Headless green.
3. The window: items 1-8 above; `Rows.xml`, `Window.xml`, `RowMixins.lua`.
4. Strings in the 11 locale files (enUS wording from the spec; the others translated).
5. Game steps in `Tests/Options.lua`: `search` counts `Option` rows and `SearchHeading`s; `search-letter` (one letter draws rows); `search-pane` (no hover -> the search help; hover a row -> its description with its section as kicker; leave -> the search help again); `search-confirm` ("Delete a Profile", the only option that asks first, `Options/Window/Source.lua:328`: a choice in the results asks in the header; the step presses No and checks the profile is still there); `search-broad` (the switch adds the Event reminders rows for "reminder", kept through `lib.SetShared`; put back); `search-change` (a parent's check box in the results greys its child without redrawing the rows); `search-showif` ("debug": turning "Enable debug info" off in the results removes its child rows, on brings them back; `Tests/Tests.lua:120` reads debug mode only when a run starts, and the step puts it back).
6. `Tests/README.md`, `Check-Repo.ps1 -ChangedOnly`, `krowi:taint-reviewer`, `/code-review`.

## Risks
- **The tests' in-game run drives the real window**: a step that changes a value puts it back (the suite's `Remember`); the confirm step never presses Yes.
- **Rows of another addon's tab** call `self.Window` functions that read the open tab; item 5 covers the strings and kicker. Defaults and the changed count are hidden in the results, so no section-bound call runs there.
- **A redraw on every change** while searching builds every section's elements again, as each keystroke does today; small (22 sections).
- **Show me** while searching: `self.Help = nil` releases a secure overlay (`UpdateShowMe`), as on the overview.
- **The headless window**: the drawing is checked only in game; the search engine fully headless.

## Where the build departed from the plan
After the review passes (`/code-review` at medium, `krowi:taint-reviewer`: no taint or secret-value finding):
- **Parents**: an option names its own (`GetParent`, new and optional in the option interface; KAF's from `Parent` in `Map.lua`), so "Show criteria if" finds Show Criteria across the heading between them. The indent rule stays for rows that name none (Reverse Sort under Sort priority N). A hidden parent leaves its child alone.
- **All / None headings** (Holidays, Other calendar events): their options are not indented, so a found heading brings them through its `Members`, and each row shows once, in its best place. Before, All and None in the results switched about 20 options out of sight.
- **Descriptions and explanations need every word typed**; names keep the game's any-word rule. With any word, "show tooltip" put a "How it works" link on nearly every section.
- **Rows within a block in the page's order**, not by score: a parent and its children read as on the page.
- **Headings** are grouped by their place, not their text, and a sub-heading counts as one.
- **A slider's change in the results** refreshes the rows without searching again: its value shows or hides no row, and a drag fired a search of every section on each step.
- **A tab whose addon names no `SearchBroad`** hides the switch and searches names only.
- Deferred to Krowi_Options' move into Krowi_Libraries: `Search.lua`, like `WindowMixin.lua` and `RowMixins.lua`, runs even when a newer copy of the library is loaded.
- New scenarios `search-parent-heading` and `search-all-none`.
- **Rebased on the Overview cards** (PR #389, merged 2026-11-03, Krowi's order: cards first, then search). The cards had raised Krowi_Options to minor 3 too, so this work takes it to 4. `lib.Flatten` gains the cards' `Cards` case, which the cards had put in the window's own `Flatten`. The search never meets cards: it reads the groups' sections, not Overview. The locale files carry both sets of strings below their `Exported at` line.
- **Krowi's look in game** (Retail, 2026-11-03): the search works; the broad search's "How it works" lines go, so the switch adds descriptions only (spec requirement 19). `lib.Search` no longer reads `GetHelp`, the results lose their `Link`, and the help pane's second line is shortened in every locale. `search-names` recorded the lines before the change.
- **The in-game `search-confirm` step** asked its question in the frame it typed the search; the box reports its text a frame later, which searched again and dropped the question. The step now asks 0.2 s later, as a player picks the choice only after typing.

## Proof
- Headless `run-tests.lua options` (Retail and Classic): every scenario PASS, the new ones met.
- `Check-Repo.ps1` clean; `krowi:taint-reviewer` and `/code-review` findings fixed or listed in the PR.
- Deploy to Retail and Mists (`Deploy.ps1 -WhatIf`, then deploy), Krowi runs `/kaftest options` and `/reload` on each; `Read-GameTests.ps1` green and `Read-GameErrors.ps1` empty on both.
- Krowi by hand: type letter by letter, change a check box, drag a slider, pick a dropdown value, a key binding, the results with "Search all tabs" (once a second tab exists), the switch's place and the pane's wording; screenshots beside the game's own search.