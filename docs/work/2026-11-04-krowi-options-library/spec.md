# Spec: Krowi_Options becomes a normal library, with its own translations, before 105.0
Intent: [intent.md](intent.md). Status: done

## Requirements
1. **Edited where the other libraries are.** The library's code lives and is edited in `Krowi_Libraries\Krowi_Options` (`TheKrowi/Krowi_Options`), and KAF embeds it as the submodule `Libs/Krowi_Options`, loaded from `Libs/Files.xml` after Krowi_Util. KAF's `Krowi_Options/` folder and its TOC line go.
2. **No XML templates of its own.** Its 20 virtual templates (`Rows.xml`, `Window.xml`) are built in Lua, as Krowi_Menu, Krowi_PopupDialog and Krowi_Util build theirs. Blizzard's own templates (`SettingsFrameTemplate`, `WowScrollBoxList`, `MinimalScrollBar`, the dropdown, slider, search and input templates) are still used through `CreateFrame`.
3. **Every file guarded.** Each Lua file registers through LibMan (`NewLibrary` for the main file, `NewSubmodule` for the others) with its own minor, and returns when an equal or newer copy already loaded it. The 16 `Krowi_Options*Mixin` globals become fields of the library. The only global it creates is the window's frame name, `Krowi_OptionsWindow`.
4. **Two copies load cleanly.** With two addons embedding different versions, the game shows no warning and the window runs the newer version's code in every file.
5. **Its own translations.** The library has `Localization/` with `enUS` and the 10 locales KAF ships, loaded through Krowi_Util's AceLocale helper (`InitLocalization = true`), as Krowi_PopupDialog does. The window takes all 22 of its texts from it: the 21 phrases KAF passes today (`Options/Window/Window.lua:134-157`) and "Requires a reload" (now Krowi_Util's), under the same English keys, so every existing translation carries over as it is. The config's `Strings` goes.
6. **CurseForge.** Project 1783244 gets the 22 enUS phrases and every translation, through the sync run from `Krowi_Libraries\Krowi_Options` (it works there as it is). KAF's 11 locale files drop the 19 phrases only the window used (`Search` and `None` stay; KAF uses them elsewhere). KAF's project 413582 deletes those 19 phrases only after 1783244 has them, from `main`, through the sync's `-Delete`, once Krowi approves the deletion.
7. **Same window for players.** On Retail, Mists Classic and Titan Reforged, in every locale, the window looks and behaves as KAF 105.0's does today; the `options`, `escape` and `pictures` suites pass as before.
8. **A breaking change gets a new name.** The library registers as `Krowi_Options_2`, version 2.0, as the Krowi libraries' rule asks for a breaking API change (the config's `Strings`, the mixin globals and the templates go). A stray 1.0 alpha install, whose files are not guarded, then cannot overwrite the new code.
9. **The two glitches from the markers review are fixed** (`docs/backlog.md:152-153`, `docs/work/2026-10-31-options-markers`):
   - The undo arrow no longer stays on a row the mouse left through its part that is scrolled out of view. `IsMouseOver` tests the row's whole rectangle; the row must also be under the mouse within `PageScrollBox` (`RowMixins.lua`, `OnLeave` and `Refresh`).
   - The hover help follows a change made under the mouse: "↺ Reset to Default" appears or goes at once. Today `OptionHelpLines` runs only in `OnRowEnter`; `OnOptionChanged` runs it again for the hovered option (`WindowMixin.lua`).
10. **No heading without rows** (found on Mists during this work, added by Krowi's decision below). On Mists, Reminder events showed "Other calendar events" with an All / None row and nothing to switch, and six "World Events: <expansion>" headings, all empty: their options are Retail-only, and `Map.lua` marked only the entries, so `Source.lua` still built the heading. The same shows on `main`. Which headings a client shows is the addon's call, not the library's: `Map.lua` marks the seven headings `Retail`, and `Source.lua` leaves such a heading out with everything under it on the other clients. The library does not change.

## Design
- **Order.**
  1. The two glitches are fixed test first, in KAF's `Krowi_Options/` on this branch: a scenario each in the `options` suite, then the fix. This keeps them testable with the suites as they are, before the code moves.
  2. The library repo takes this branch's `Krowi_Options/`, and the rest of the work is done on a branch there. It is tested through this KAF worktree, whose `Libs/Krowi_Options` points at that branch, the way Krowi_Menu's `CLAUDE.md` describes.
  3. The library is released as 2.0 alpha, KAF's PR pins the submodule to the tag 2.0, and KAF 105.0 ships with it.
- **Rows in Lua.**
  - Each row kind (`Header`, `Option`, `Sub`, `GridRow`, `Card`, `NavButton`, `HelpPicture`, ...) gets a builder that creates on a frame what its template declares: font strings, textures, child controls and scripts. It then applies the kind's mixin and runs its `OnLoad`. `WindowMixin.lua:118-139` and `223-236` keep their kind table, with a builder in place of each template name.
  - Blizzard's ScrollBox view accepts a frame type in place of a template (`frameTemplateOrFrameType`, `Blizzard_SharedXML/Shared/Scroll/ScrollBoxListView.lua:43` on `live`, `classic` and `classic_titan`), provided each row's height is given, which the window already does (`SetElementExtentCalculator`).
  - Rows of one frame type then share one pool, so a frame used as a header can come back for an option row. The view therefore asks for a plain host frame, and the row's content comes from a pool per kind, built once and handed back when the view releases the host (`SetFrameFactoryResetter`). This keeps the frame count the same as with templates. The exact mechanism is settled in `plan.md`, against what the suites read from the rows.
- **The window in Lua.** `CreateFrame("Frame", "Krowi_OptionsWindow", UIParent, "SettingsFrameTemplate")`, then everything `Window.xml` adds: tabs, navigation list, search box and boxes, page list, help pane, strip, Defaults button, reload bar and lightbox.
- **Guards.**
  - `Krowi_Options.lua`: `NewLibrary('Krowi_Options_2', 0, { SetCurrent = true, InitLocalization = true })`.
  - `RowMixins.lua`, `WindowMixin.lua`, `Search.lua`, the new builder files and the locale files: `NewSubmodule('<Name>', 0)`, or `GetCurrentLibrary(true)` for the locale files, as in Krowi_PopupDialog.
  - Code that runs at window creation reads the mixins from `lib`, so the newest copy's files decide.
- **Strings.** `lib.Strings` is built from `lib.L` with the field names the window already uses (`Search`, `SearchAll`, ..., `NeedsReload`), with the placeholders turned into `%s`/`%d` through Krowi_Util's `K_ReplaceVars`, as KAF does today. The broad search is always offered: until now it showed only on a tab whose addon named it, and KAF does.
- **KAF.**
  - `Libs/Krowi_Options` submodule and its `Libs/Files.xml` line.
  - `Options/Window/*.lua` and `Tests/*.lua` ask for `Krowi_Options_2`; `Window.lua` drops `Strings`; the 11 locale files drop the 19 phrases.
  - The lint keeps checking what it can:
    - `Check-Repo.ps1:482` and `540` and the `Krowi_Options` section of `Check-Repo.globals` go, as there are no templates or mixin globals left;
    - `.luarc.json` keeps `Krowi_OptionsWindow`.
  - The instruction files describe the library as embedded: the `copilot-instructions.md` load order and Key Directories rows, and `docs/architecture.md`.
- **The library repo.** Its `CLAUDE.md` becomes a normal library's, from Krowi_Menu's shape: clients, versioning table, consumers, taint-sensitive areas, localization, code style, testing in game, release. It also gets a changelog entry 2.0 and its description, with `Krowi_Util` and AceLocale (from Krowi_Util) as requirements.

## Options considered
- **Rows from a pool per kind behind plain host frames (recommended).** The frame count stays as with templates; each kind's mixin code keeps working on its own content frame.
- **One generic row that shows the pieces of whichever kind it holds.** Fewer moving parts per kind, but every pooled frame slowly builds the pieces of every kind it has held (13 kinds), and each kind's code has to hide everything else.
- **Keep XML with a template name per version.** Every release would rename 20 templates and every reference to them, and a copy's mixin names still collide. Rejected.
- **`Krowi_Options_1`, version 1.1, instead of `_2`/2.0.** Nobody but KAF uses 1.0, but a 1.0 alpha installed on its own loads after KAF, and its unguarded files would overwrite the new code. Rejected for the name; requirement 8.

## Areas of concern
- **Taint and secret values:** the window is an addon frame built on `SettingsFrameTemplate`; building it in Lua instead of XML changes no Blizzard frame and no secure path. The `krowi:taint-reviewer` agent reviews the builders.
- **Clients:**
  - Retail, Mists Classic and Titan Reforged (KAF's `## Interface:`).
  - The frame-type factory, `SettingsFrameTemplate` and the dropdown and slider templates exist on all three today (the window runs there).
  - Titan has no local client: there it is checked against `wow-ui-source\classic_titan` only.
- **Blizzard API changes:** none; `Find-DeprecatedApi.ps1` on the new files.
- **Other addons, plugins and skins:** skins (ElvUI and others) do not touch the window; plugins register no options in it.
- **Saved variables and migrations:** none. The window keeps its state in the table each addon passes.
- **Localization:** 22 phrases on 1783244, 19 leaving 413582, no translation lost (requirement 6). esES, esMX and itIT lack 2 of the 21 translations today, and koKR 1, so English shows there as now.
- **Embedded libraries:** this is one; Krowi_Util is unchanged. KAF's release preflight moves every `Libs/` library to its newest release tag, so the library is released before KAF.
- **Tooling:** under `Libs/`, KAF's lint rules and the language server skip the library (spike finding 4), as for every Krowi library. The syntax hook and the taint reviewer run in the library repo, and KAF's headless suites still load and run it (`options-env.lua` loads every file of the TOC, `Libs/` included).
- **Data snapshots:** none.
- **Player-facing text:** unchanged; no KAF changelog line. The library's changelog gets 2.0.
- **Parallel work:** the two fixes a peer session had planned in `Krowi_Options/` are made here (requirement 9). The peer is told, so no second branch touches `Krowi_Options/` meanwhile.

## Verification
- **Permanent tests:**
  - an `options` scenario: every one of the window's 22 strings comes from the library and is not empty;
  - a headless check that the library defines no XML template and no global besides `Krowi_OptionsWindow`.
- **Headless:** `options`, `escape` and `pictures` suites; `Check-Repo.ps1`; `Find-DeprecatedApi.ps1`.
- **Two copies, in game:**
  - KAF with 2.0 embedded, and a second copy of the library loaded after it. The second copy is installed as its own AddOns folder, which loads after KAF and finds KAF's `KROWI_LIBMAN`; this departs from the kit's rule against a standalone library, on purpose and only for this test.
  - Once with lower minors, once with higher: no warning in BugGrabber, and the window runs the newer copy's code.
- **In game:** `/kaftest options` and `/kaftest escape` on Retail, `/kaftest options` on Mists Classic, each with a look at the window by Krowi; `/kaftest pictures` where the help pictures are made.
- **CurseForge:** after the export, the sync's report for 1783244 reads "CurseForge now has every enUS phrase" and "CurseForge has them all".

## Decision
Krowi, 2026-11-04, at the first design question (where the locale files live while the library is edited in KAF): "handle as the other libraries. i would strongly push to already moving the library outside of kaf and handle it as a normal library, might as well do it before a 105 release, there is no hurry and test everything trough. i think krowi util and krowi menu also have localizations you can check out." The scope therefore grew from moving the strings to the extraction, and the spec was rewritten for it. Krowi_Util and Krowi_PopupDialog have locale files; Krowi_Menu initialises localization but has none (its `CLAUDE.md`).

Krowi, 2026-11-04, on the rewritten spec:
- `Krowi_Options_2`, version 2.0 (recommended option).
- The two glitches from the markers review: "fix in this session alongside the extraction" (requirement 9), instead of the peer session fixing them first.
- The two-copy test with a standalone `AddOns\Krowi_Options` folder, once, as a deliberate exception to the kit's rule (recommended option).

Krowi, 2026-11-04, on the empty Reminder events headings found on Mists (requirement 10): the library is a framework and the addon decides what shows where, so KAF must not hand it a heading that has nothing on the client ("am I correct to state that kaf should make sure these options are not shown in mists?"). Then: "Build the heading-level Retail flag in this branch, with the scenario." A library rule that drops empty headings was not taken; nothing in the map can empty a heading at run time today. AceConfig plays no part: the headings come from `Map.lua`, and stage 2 of the options revamp would carry the same flag.