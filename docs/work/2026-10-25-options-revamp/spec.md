# Spec: Options window with the explanations built in
Intent: [intent.md](intent.md). Status: done

## Requirements
Opening and the Settings entry
1. `/kaf`, the minimap icon, the filter menu's Options entry and its Help entry (on Overview) open the window on Retail, Mists and Titan Reforged.
2. KAF's entry in Settings > AddOns is one page: the addon's name, one line on what it does, the version, an "Open options" button and a line naming the other ways in. None of today's six pages is registered there any more.

The window
3. The window is movable and resizable (minimum about 1080 x 560 at UI scale 1). Its position, size, the collapsed state of the help pane and the last section persist across sessions.
4. Escape closes the window, in the addon's Escape order (`Gui/FramesForClosing.lua`).
5. The navigation lists Overview and the 22 sections in three groups (Achievement window, Around the game, This addon). The middle shows the section's options; the help pane on the right (380 px) shows the section's explanation, or the description of the option under the mouse. The pane collapses to a strip, and descriptions then show as tooltips.
6. Every option on today's six pages and every option injected into them appears in exactly one section, with today's label, description, default, disabled rule and hidden rule. Options that exist only on Retail stay Retail-only.
7. Changing an option in the window calls the same set function as AceConfig does today, so the saved value and every side effect are the same.
8. Controls: checkbox, slider with steppers and its value, dropdown, button, text field, and key binding with two keys. Compound controls: the tab list (a show checkbox and up/down per tab), the special categories per tab as one grid, the pop-up and chat rules as small grids, and the event families with All/None.
9. A dot marks every option whose value differs from its default; right-clicking the dot sets the default. Each section has a Defaults button that asks first, then sets every option of the section to its default.
10. Options that need a reload carry a reload mark. Changing one shows a bar with "Reload now".
11. Advanced shows the content tools (exports, Map Verifier, placeholders, map info, trace) only while "Enable debug info" is on.
12. Overview links the sections that are New (changed in a version newer than the one the player last looked at), lists the current version's changelog in English, and shows a tile per feature section. The window opens on Overview while a section is New, otherwise on the last section. The filter menu's Options entry shows "!" while a section is New.
13. Search finds options by label, description and group, and explanations by text; a result opens its section and highlights the option.
14. Combat behaviour follows the decision below.

The help content (parallel track)
15. The window takes each section's explanation (headings, paragraphs, legend lines, pictures) and an optional Show me function from one seam. A section without content shows no pane text and no Show me button, and nothing errors.

Stage 2
16. KAF's own definition format replaces AceConfig and `InjectOptions` for KAF's options. Every stage 1 test passes unchanged, the saved-variables layout stays as it is, and plugins that call `KrowiAF.PluginsApi` / `KrowiAF.UtilApi.InjectOptions` keep their groups and notes.

Removals, text, release
17. The old tutorial is gone: `Tutorials.lua`, the `Libs/Krowi_Tutorials` submodule, its `Libs/Files.xml` line, the General options' Tutorial button and the filter menu's tutorial list. Nothing references them.
18. All new player-facing text is localized: keys in enUS and every locale file, exported to CurseForge early in the week.
19. The in-game changelog comes from `_Packaging/Changelog.md` through a repo tool; the release gate fails when it is stale.
20. Nothing of the window runs while it is closed (no OnUpdate, ticker or event handler that allocates).
21. No new taint: the window and the stub are addon frames, and the window never touches the frames of Blizzard's `SettingsPanel`.

## Design
### The pieces
- **`Krowi_Options/`**, a folder at the repo root (outside `Libs/`), loaded from the TOC after `Libs/Files.xml` and registered through LibMan (`KROWI_LIBMAN:NewLibrary('Krowi_Options', 1)`). It knows nothing of KAF. It holds the window (frame, navigation, page, help pane, reload bar, resize grip), the controls, the compound controls, search and the help pane renderer. A consumer passes in its sections, an option source, the help seam, a saved table and its strings. Extraction later moves the folder into `Krowi_Libraries`.
- **Built from Blizzard's templates**, present in all three local wow-ui-source clones (`live`, `classic`, `classic_titan`): `ButtonFrameTemplate` (portrait frame), `SearchBoxTemplate`, a `CheckButton` with the `checkbox-minimal`/`checkmark-minimal` atlases, `MinimalSliderWithSteppersTemplate`, `WowStyle1DropdownTemplate`, `UIPanelButtonTemplate`, `InputBoxTemplate`, and `WowScrollBoxList` with `MinimalScrollBar` for the scrolling lists. On Mists and Titan the same templates draw with those clients' own art, which is the "Mists' own stock look". Every piece is a named mixin, so skins can target them later.
- **KAF's side**, in `Options/Window/`:
  - `Map.lua`, the mapping table (below);
  - `Help.lua`, the seam the content track fills;
  - `Stub.lua`, the Settings > AddOns page;
  - `Window.lua`, which creates the window on first open, `/kaf`, the entry points and the replacement for `addon.Options.Open`. That function sits on KAF's namespace table (`Libs/Krowi_Util/Options/Options.lua:82` is loaded into KAF's namespace), so Krowi_Util itself does not change.

### Stage 1: drawing today's AceConfig tables
- **Reading the tables.** The source reads `addon.Options.OptionsTable` directly and evaluates `name`, `desc`, `hidden`, `disabled`, `values`, `min`/`max`/`step` and `get` as values or functions. KAF's own handlers ignore AceConfig's `info` argument (190 `get = function()`, 129 `set = function(_, value)`, no `handler`, `confirm` or `validate`), and the source still passes an `info`-like table (`info[#info]`, `info.option`).
- **Profiles.** The AceDBOptions tables use handler method names. The Profiles section is drawn natively on AceDB's own API (`GetProfiles`, `SetProfile`, `CopyProfile`, `DeleteProfile`, `ResetProfile`), for both databases (`addon.Options.db`, `addon.Filters.db`).
- **The mapping table** (`Map.lua`, ported from `mockup/MockupSpec.ps1`):
  - Per section: its id, name, group, picture tile, "changed in" version, and its groups.
  - Each group names AceConfig paths in the dotted form `InjectOptions` uses (`Layout.args.Search.args.SearchField`), whole subtrees, header slices, or a compound control with its source paths.
  - The Plugins subtree is mapped as a whole, so a plugin's group shows up without a map change.
- **Registration.** Each `Options/*.lua` keeps `AceConfig:RegisterOptionsTable`, so `KrowiAF_GetOptions.GetTable` keeps working for the plugins and the suites. The `AddToBlizOptions` calls go. The stub registers through `Settings.RegisterCanvasLayoutCategory` and `Settings.RegisterAddOnCategory`.
- **Descriptions.** Today's descriptions end in "Default value: ..." and "Requires a reload" (`KAF_AddDefaultValueText`, `K_AddReloadRequired`). The source strips those suffixes by the localized strings, shows the default in the pane and turns the reload text into the reload mark. Stage 2 carries both as fields and drops the stripping.
- **Spacer and description rows.** Rows of empty descriptions (57 on Retail) are skipped. A description row becomes a group note. A header inside a group becomes a sub-heading.

### Saved data
Additive only: `KrowiAF_SavedData.OptionsWindow = { Point, Size, PaneCollapsed, LastSection, Seen = { [sectionId] = version } }`. AceDB's `KrowiAF_Options` and `KrowiAF_Filters` and the tab data keep their layout. The tutorial's viewed-pages record in `KrowiAF_SavedData` stays as dead data; a cleanup comes later as a numbered migration.

### The help seam
`addon.Options.Window.Help[sectionId] = { Title, Blocks = { {Heading = ...}, {Text = ...}, {Term = ..., Text = ...}, {Picture = "Interface/AddOns/Krowi_AchievementFilter/Media/Help/<name>", Width, Height} }, ShowMe = function() end }`. The window renders whatever is there.

The content track owns `Options/Window/Help.lua`, the explanation strings, `Media/Help/`, the `/kaftest pictures` steps and the Show me scenes. That includes the map's secure route: a `SecureActionButtonTemplate` button of type `click` on the minimap's zone-text map toggle, created out of combat, falling back to opening the map with a note.

### Combat
The window opens and works in combat on every client. Key binding buttons, Show me and Reload now are greyed out with "Not in combat" while `InCombatLockdown()` is true, and come back on `PLAYER_REGEN_ENABLED`, which the window listens to only while it is shown.

### Stage 2, outline
- **A spike first.** The definition format is designed as a paper spike on the four hard cases (event families, the tabs with order and bindings, the special-categories grid, the ElvUI plugin with its "not active" reasons). It goes to its own gate as an addendum to this spec, with a second entry under Decision.
- **The format.** Plain tables per section. Each option carries its saved path (today's layout), its default (from the AceDB defaults), a reload flag, `disabledBy`/`hiddenIf`, and an "unavailable because" reason. Groups can build their rows from a list at draw time.
- **The plugin shim.** Stage 1's AceConfig reader stays as the adapter for tables plugins inject through `InjectOptions:AddPluginTable`/`AddTable`, so plugins keep working.
- **AceConfig goes.** `AceConfig-3.0` (with its Dialog, Registry and Cmd parts), `AceGUI-3.0` and `AceDBOptions-3.0` leave `Libs/` once nothing reads them (AceDB stays).

### Removals
- **The tutorial:** `Tutorials.lua`, `Libs/Krowi_Tutorials` (submodule and `Libs/Files.xml` line), the Tutorial button (`Options/General.lua:307`) and the filter menu's tutorial list (`Gui/WindowFrames/FilterButton/FilterButtonMixin.lua:235-247`). The Help entry opens the window on Overview.
- **Old files:** the 15 `.tga` files in `Media/` once the content track's pictures replace them, and the tutorial strings in every locale once the new ones exist.

### The in-game changelog
`.claude/tools/Build-ChangelogLua.ps1` writes `Options/Window/Changelog.lua` from the changelog section of the version being released (the TOC's `## Version:`). `.claude/release-gate.ps1` runs it and fails when the committed file differs.

## Options considered
For the gate, each by what the player sees:

1. **Combat.**
   - **(a) Recommended:** the window opens and works in combat. Key bindings, Show me and Reload now are greyed out with "Not in combat", because `SetBinding`, key capture and some scenes are blocked there.
   - (b) The window refuses to open in combat and says so in chat.
   - (c) The window closes when combat starts.
2. **Titan Reforged.** There is no local client to test on.
   - **(a) Recommended:** the same window ships there. Mists runs the same code and the same templates (both in the `classic_titan` clone), so the Mists runs stand in for it.
   - (b) Titan keeps today's Settings pages until a player confirms the window works.
3. **The in-game changelog.**
   - **(a) Recommended:** generated at release by the repo tool, with the release gate failing when it is stale.
   - (b) Copied into a Lua file by hand each release.

Not offered, because players see no difference: drawing the profiles on AceDB's API instead of teaching the AceConfig reader handler methods, and mapping single options instead of whole pages (decided 2026-10-25).

## Areas of concern
- **Taint and secret values.**
  - The window, its controls and the stub are addon frames. The templates are ones addons use routinely, and the dropdowns use Blizzard's menu system as Krowi_Menu already does on modern clients.
  - "Open options" on the stub runs from a click and closes the settings panel through the existing `SettingsPanel:Close(true)` path (`Options/General.lua:42`, `settings-close` lint rule) before showing the window.
  - `SetBinding` and keyboard capture are blocked in combat (see option 1).
  - The Show me scenes and the map's secure button are the content track's, and get their own taint review.
  - No option reads secret-value APIs.
  - `krowi:taint-reviewer` runs on the diff.
- **Clients.**
  - TOC `120105, 50504, 38002`. The templates and `Settings.RegisterCanvasLayoutCategory` exist in all three clones.
  - Retail-only options stay hidden on Mists and Titan (requirement 6).
  - Titan cannot be tested locally (option 2).
- **Blizzard API changes.** `Settings.RegisterCanvasLayoutCategory`/`RegisterAddOnCategory`/`OpenToCategory`, ScrollBox and the Menu API; `Find-DeprecatedApi.ps1` runs on every changed file.
- **Other addons, plugins and skins.**
  - The seven plugins inject their groups, and ElvUI, GW2 UI and EllesmereUI add "not active" notes into three other groups through `KrowiAF_GetOptions.GetTable`, which keeps working because the tables stay registered.
  - Their skins no longer reach the options (no skins this week); ElvUI's "Skin Ace3" and "Skin Tutorials" rows are its own settings, shown for reference.
  - The Plugins subtree is mapped whole, so outside plugins still show.
- **Saved variables and migrations.** Additive `KrowiAF_SavedData.OptionsWindow` only, so the plan is non-routine and waits at its gate. No migration ships.
- **Localization.**
  - About 30 interface strings (section names that do not exist yet, Overview, Show me, Defaults, Reload now, the reload bar, the stub, "Not in combat"), plus about 22 explanations from the content track.
  - Exported to CurseForge by mid-week with `krowi:localization`; untranslated keys fall back to English at release.
  - The tutorial strings leave every locale once the new ones exist.
- **Embedded libraries.**
  - `Libs/Krowi_Tutorials` is removed.
  - Krowi_Util does not change in stage 1. Its `Options/InjectOptions.lua` keeps working as the plugin shim's base.
  - Stage 2 removes the Ace config libraries KAF no longer reads.
  - The window folder registers under its own LibMan name, so no embedded copy collides with it.
- **Data snapshots.** Options are not data. The headless runner gains the stubs the window needs; the snapshots must stay unchanged.
- **Player-facing text.** Changelog lines for the new window and the removed tutorial, the stub, Overview and the interface strings, in Krowi's plain style. The explanations are the content track's.
- **Globals and background jobs.**
  - `/kaf` adds `SLASH_KAF1` and `SlashCmdList.KAF` to `.claude/tools/Check-Repo.globals` with a reason.
  - The window runs nothing while closed; anything that listens is listed in `Check-Repo.jobs`.

## Verification
- **Headless suite `options`** (`Tests/Options.lua` + `run-tests.lua`, Retail and Mists), the regression suite for stage 2:
  - every option mapped exactly once;
  - for each option, setting it through the window changes the same saved values as calling its AceConfig set function;
  - the disabled and hidden rules agree;
  - Defaults restores the AceDB defaults exactly;
  - the changed dots match;
  - with the plugins stubbed as loaded, their groups and notes are present.
- **In-game `/kaftest options`** (Retail, then Mists):
  - opens the window through each scriptable way in, walks every section and sets each option through the window;
  - checks the saved values and BugGrabber, and screenshots each section;
  - puts the settings back;
  - the stub's button waits for Krowi's click.
- **Escape suite:** a scenario for the window's place in the Escape order (alone, and under the calendar).
- **Taint:** `krowi:taint-reviewer` on the diff. In game, open the window from the stub, then enter combat and open the map and a bag: no `ADDON_ACTION_BLOCKED`, and nothing new in the taint diagnostics.
- **Plugins loaded:** in-game runs with ElvUI, GW2 UI and EllesmereUI loaded show their groups and notes.
- **The rest:** `Check-Repo.ps1`, `Find-DeprecatedApi.ps1` and `/code-review` on the PR. The release gate requires green `options` runs on the newest Retail and Mists builds and a current changelog file.

## Decision
Krowi, 2026-10-25: the design as written, with option 1a (the window works in combat; key bindings, Show me and Reload now greyed out), 2a (Titan Reforged gets the same window, the Mists runs stand in for it) and 3a (the changelog is generated at release and checked by the release gate). The decisions that shaped the intent (own window, middle-ground help, two stages in one week with one release, no skins, no library extraction, saved layout unchanged) were taken the same day over two rounds of mockups. Stage 2's definition format comes to its own gate as an addendum.