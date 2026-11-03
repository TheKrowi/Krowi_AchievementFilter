# Spec: The options window searches the way the game's Options window does, with a broad search to switch on
Intent: [intent.md](intent.md). Status: done

## Requirements
The game's search is `SettingsPanelMixin:FindInitializersMatchingSearchText` and `OnSearchTextChanged` (`Blizzard_Settings_Shared/Blizzard_SettingsPanel.lua:575-701` on Retail, `:566-` on Classic, the same code), matching through `SettingsSearchableElementMixin:MatchesSearchTags` (`Blizzard_Settings.lua:52-75`), with `SettingsListSearchCategoryTemplate` as the section's heading (`Blizzard_SettingsList.xml:65-86`, `Blizzard_SettingsList.lua:14-39`).

**What a row is found by (its names)**
1. An option row by its name; a check box with a button also by the button's text, a check box with a slider also by the slider's name (the game's tags, `Blizzard_SettingControls.lua:916-918`, `:1320`).
2. A family's heading with All and None (Reminder events) by its name; a grid row by its label; a tab in the tab list by the tab's name.
3. Hidden rows are not found (`initializer:ShouldShow()`); a row only greyed out is.

**How the text matches**
4. From the first letter typed. An empty box (also after the clear button) shows the section the player was in.
5. Case does not matter, the text may stand anywhere in a name, and colour codes and icons in a name are not matched.
6. The whole text is tried, then each word of it (split at spaces and commas); a row is found when any of them is in one of its names.
7. Order: the sections by their best match, and within a section the best match first. A match's worth is the length of the text that matched, so the whole text beats a single word. Where the game takes the first word that matches in typed order, ours takes the best one, and a row that matches more of the words comes first ("show tooltip" puts "Show in Tooltip" before "Skin Tooltip"; the game does the opposite).

**What the results show**
8. The page title reads "Search results"; Defaults and the changed count are hidden, as the game's.
9. Each found row is the row itself, working as on its section's page: check box, slider, dropdown, button, key binding, input, the undo arrow and the reload arrow.
10. Above its rows, each section's name in the game's search heading (45 high, the large gold font, a light overlay under the mouse); a click opens the section. Under it, each row has the heading it stands under on its page above it, in the window's sub-heading style, once for the rows that share it (Krowi, 2026-11-03: option A).
11. A found row that hangs under another brings that one along, above it: a child option (`Parent` in `Options/Window/Map.lua`) its parent's row, a family member its family's heading, a grid row the grid's column header. A found family heading brings its members, since it stands for them.
12. Nothing found: one line "Nothing found." (today's string).
13. With "Search all tabs" ticked, each addon's results under its tab's name (today), and every row of another addon works as on that addon's own page.

**While searching**
14. A change in the results that shows or hides rows (a `ShowIf` switch, a parent turned off) updates the results in place, keeping the scroll position; a change that does not leaves the rows as they are, so a slider keeps its drag.
15. A choice that asks first (deleting or copying a profile) asks in the page's header, as on its page; today it does nothing in the results (`WindowMixin.lua:805`).
16. The help pane, under the mouse, shows the hovered row's description, and its kicker the row's own section (today the section the player came from, `WindowMixin.lua:1006`).
17. With no row under the mouse, the help pane explains the search (Krowi, 2026-11-03: "search help text"), under the title "Search", in two short paragraphs: what it finds and that a section's name opens the section; what the broad search adds. Today it shows the section the player came from (`WindowMixin.lua:1019`). Draft wording, for Krowi's look in game:
    - "Finds options by their name. Change them right here, or click a section's name to open it."
    - "Tick Search descriptions to also find options by what they do." (Krowi's look in game: sections by their explanation went, see 19)

**The broad search** (off by default)
18. A check box in the window's bottom row turns it on, kept with the window's shared state like "Search all tabs", for every addon in the window.
19. On, a row is also found by its description. A description must hold every word typed (prose holds common words everywhere); names keep the game's any-word rule (from the review, see plan.md). Sections are not found by their explanation (Krowi's look in game, 2026-11-03): its "How it works" line in the results read as an option and did not say why it was there.

## Design
**The search moves into Krowi_Options.** The window already has everything it needs from the consumer contract: `Config.Groups` and `Config.GetElements(id)` give every section's rows, an option answers `GetLabel`, `GetDescription`, `Type`, `GetButtonText` and `IsHidden`, and `Config.GetHelp(id)` gives the explanation. So `lib.Search` builds the results from those for every addon, and `Config.Search` and `model.Search` (`Options/Window/Model.lua:240-288`) go. Krowi_ExtendedVendorUI's tab, once it registers, then searches the same way without code of its own.
- **Tags per element kind**, in the library: `Option` (label, plus `With`'s button text or label), `Sub` (text), `GridRow` (label), `TabRow` (the show option's label). Broad adds `GetDescription()` per option (and, until Krowi's look in game, the help's text blocks per section).
- **Scoring** as requirement 7: for each row, the longest match over the whole text and each word, plus the number of words matched as the first key.
- **Rows**: the search returns `{ Tab, SectionId, Elements }` per section, with the elements in score order and the parents of requirement 11 inserted once, above their first child. `OnSearch` draws them through `Flatten`'s row kinds after a new `SearchHeading` row (`Rows.xml`: our own Button, 45 high, `GameFontNormalLarge` at 16, -16, an additive 0.1 grey overlay on hover; never `SettingsListSearchCategoryTemplate` itself).
- **Each search element carries its tab and section** (`element.Tab`, `element.SectionId`), and the window takes them from the row where today it reads its own: `OnRowEnter`'s kicker and help strings, `AskConfirm` and `OnOptionChanged`. In search, `Confirming` is keyed to the search, not to a section.
- **Updates**: `OnOptionChanged` while searching runs the search again and redraws only when the found rows' signature (today's `Signature`) changed.
- **The rows' headings**: the search remembers, for each found element, the last `Header` before it in its section, and draws a `SubHeading` row when it changes within a section.
- **The switch**: `Window.xml` gets a second `Krowi_OptionsCheckButtonTemplate` with its label in the bottom row, left of "Search all tabs", always shown; `Strings.SearchBroad` is the consumer's label; `lib.SetShared("SearchBroad", ...)`.
- **The pane while searching**: `ShowSearchHelp` fills it from `Strings.Search` (title), `Strings.SearchHelp` and `Strings.SearchHelpBroad`; `OnRowLeave` goes back to it while searching, and Show me hides (no section's help is drawn).
- Krowi_Options' minor goes from 2 to 3.

## Options considered
**A. The rows' context: the section's name and the row's heading (recommended, chosen).** Above a section's rows, its heading in the game's style, and above each row the heading it stands under on its page, in the small heading style. Our names lean on their headings far more than the game's: on Retail, "Loaded" stands seven times under Other addons (one per plugin), "Active" five times and "Curse Surges" six times under Reminder events, "Reverse Sort" five times under Tooltips, "Show Sub Categories" three times under Categories. With the heading, "loaded" shows ElvUI › Loaded, GW2 UI › Loaded, and so on.

The game has the same problem in places and answers it twice, without headings: eight dropdowns are named "Voice" in Combat Audio Alerts (`Blizzard_SettingsDefinitions_Shared/AudioAssist.lua:404` and on), each hung under its own check box ("Say Your Health"), which a search brings along; and 45 hand-written tags, such as "Combat Audio Alerts" and "CAA" on every option of that section (`AudioAssist.lua:184-200`). Requirement 11 is the first answer here, and covers Reminder events ("Active" under its family). The heading is the second answer without hand-written tags: it covers what hangs under no parent (the plugins' "Loaded", the tooltip lists' "Reverse Sort", the two profiles' rows).

**B. Only the section's name, as the game.** Exactly the game's look; "loaded" shows seven rows reading "Loaded" under Other addons, told apart only by hovering each.

**C. The broad search as today's breadth.** On, also every row under a heading whose name matches, as rows: "event" draws about 120 rows, nearly all of Reminder events. Not recommended: the section's own page shows the same with less scrolling, and requirement 19's explanation line already leads there.

**D. Keep the links.** Not what Krowi asked for.

## Areas of concern
- **Taint and secret values:** the results are the addon's own rows and frames; nothing of Blizzard's is read or written. No `Settings*` template is inherited (backlog rule). None found beyond that.
- **Clients:** Retail and Mists Classic draw the window from the same templates (`ButtonFrameTemplate`, `SearchBoxTemplate`); the game's search heading is the same on both (`wow-ui-source\classic\...\Blizzard_SettingsList.xml`). Titan Reforged runs the Mists files. KAF does not load on Forever.
- **Blizzard API changes:** none used beyond what the window uses today.
- **Other addons, plugins and skins:** ElvUI and the other skins do not skin this window. A plugin's injected options are found like any other, through `GetElements`. A second Krowi addon's tab (KEVU, once it registers) gets the same search through the library.
- **Saved variables:** one new key, `SearchBroad`, in `KrowiAF_SavedData.OptionsWindow` (already declared); nil reads as off. No migration.
- **Localization:** three new strings in every locale file: the switch's label ("Search descriptions") and the pane's two paragraphs (requirement 17); CurseForge export after the merge. "Search", "Search results" and "Nothing found." exist.
- **Embedded libraries:** Krowi_Options lives in the addon; its minor goes to 3. No `Libs/` change.
- **Data snapshots:** untouched.
- **Player-facing text:** the label only; no changelog line (the window is new in 105.0).
- **Performance:** a keystroke builds every section's elements, as `model.Search` does today (22 sections, 334 option rows); the first letter now searches too, which finds about 290 rows for "e". The rows are drawn by the scroll box, which makes only the visible ones.

## Verification
- **Options suite**, in game (`/kaftest options`) and headless:
  - `search` counts working rows under section headings instead of links;
  - `search-reset-position` (button text finds its check box) reads the library's results;
  - new scenarios: "reminder" finds nothing by name and finds Event reminders with the broad search; "loaded" shows each plugin's heading (option A); a child option brings its parent; "show tooltip" orders "Show in Tooltip" first; a profile choice in the results asks in the header; a `ShowIf` switch in the results adds its rows; the switch is kept through `lib.SetShared`; the pane explains the search with no row hovered and again after one is left;
  - the second-tab test searches the fake tab through its elements instead of a `Search` function.
- `Check-Repo.ps1`, `krowi:taint-reviewer` on the diff, `/code-review`.
- In game on Retail and Mists: type a letter at a time, change a check box, drag a slider and pick a dropdown value in the results, delete a profile from the results, tick the broad search, hover rows; screenshots against the game's own search for the look; `Read-GameErrors.ps1` after `/reload`.

## Decision
Krowi, 2026-11-03:
- The game's search by default, with a switch for a broad search ("I want blizzard options search, with an option for the user to enable a broad search").
- Option A: each row under its section's name and its own heading, after seeing how the game handles repeated names (parent rows and hand-written tags).
- The broad search adds descriptions and explanations, not every row under a matching heading (option C rejected).
- After the look in game the same day, the broad search adds descriptions only: "when search description is on i also see the how it works lines which is a mistake i think".
- With no row under the mouse, the help pane explains the search ("search help text maybe?"); the wording is judged in game.
- The switch's place in the bottom row is judged in game.