# Intent: Options window with the explanations built in
Author: Krowi (maintainer), captured by Claude. Source: idea (2026-10-25), shaped by two rounds of clickable mockups (https://claude.ai/artifact/R1E7YE4Bj7goEFh18PRsBH, private). Status: done

## Problem
How the addon works and how it is set are in two places, and both have aged.

- **The options** are six AceConfig pages in the game's Settings > AddOns (`Options/`, about 3900 lines): General, Layout, Event Reminders, Plugins, Profiles, Credits. They are grouped by page, not by feature: the tooltip options sit under Layout > Achievements > Tooltip, the reminder toggles under Event Reminders > World Events > <expansion>. On Retail they hold about 310 toggles, 64 buttons, 42 sliders, 38 dropdowns, 18 key bindings and 4 text fields. Some settings take many controls for one idea: the tab order is 8 dropdowns, the special categories per tab 35 checkboxes on 8 pages.
- **The tutorial** (`Tutorials.lua`, Krowi_Tutorials) is 15 picture pages from the addon's early features, reached only through the filter menu's Help submenu and a button in the options; it never opens by itself. Several pictures are outdated (the event reminder page shows Shadowlands assaults from 2021), the newer features (guides, reward preview, Pop Out, tracking, the event scheduler) have no page, and almost every page ends with "(1) Options can be found under Game Menu > Interface > AddOns > ...", sending the player to the other place.

## Proposed outcome
One window where a player reads how each feature works and sets it, in the stock Blizzard look, on every client.

- **The window** is the addon's own, opened from a one-page stub in Settings > AddOns ("Open options"), the filter menu, the minimap icon and a new `/kaf` command. It is movable and resizable and remembers both.
- **Sections per feature** (22, plus Overview) on the left, their options in the middle, and a help pane on the right: the section's explanation with full-size pictures, or the description of the option under the mouse. The pane collapses to a strip; descriptions then show as tooltips.
- **The explanations are the middle ground** of the mockups: what the player sees (legends, colors, icons, clicks), not what they set; about one screen per section. Each section has a "Show me" button that opens the feature in game.
- **New pictures**, generated in game by a `/kaftest pictures` run and cropped with the old pictures' soft edge.
- **Overview** links the sections that are new since the player last looked and lists the release's changelog in English. The window opens there while a section is New, otherwise on the section the player had open.
- **Small aids**: a dot on every changed option (right-click resets it), Defaults per section, a reload mark and a "Reload now" bar, and the content tools of Advanced only while debug info is on.
- **Better controls** where AceConfig had none: the tabs and their order as one list, the special categories per tab as one grid, the pop-up and chat rules as small grids.
- The old tutorial and the six Settings pages go.

## Affected users and systems
- Every client the TOC lists: Retail (12.1.5, `120105`), Mists Classic (5.5.4, `50504`) and Titan Reforged (3.80.2, `38002`, China only, no local install). On the Classic clients the window is built from their own Blizzard templates.
- Every option in `Options/` and everything injected through Krowi_Util's `InjectOptions`: the tab data (`Api/TabDataApi.lua`), the event reminder toggles (`Api/EventDataApi.lua`), the special categories per tab (`Data/SpecialCategories.lua`, `Options/Layout.lua`), the header sort slots (`Gui/WindowFrames/AchievementFrameHeader.lua`), the credits, and the seven plugins' groups and notes (`Plugins/`, `Api/PluginsApi.lua`).
- The saved variables `KrowiAF_Options` (AceDB profiles) and `KrowiAF_SavedData` (tabs), read and written as they are today.
- The tutorial (`Tutorials.lua`, the `Libs/Krowi_Tutorials` submodule, KAF its only user), the filter menu's Help and Options entries, the minimap icon, the key bindings.
- The ElvUI, GW2 UI and EllesmereUI plugins, which skin the tutorial and the AceConfig options today.
- About 22 new strings for the explanations in every locale; the tutorial's strings leave with it.

## Constraints
- **Two stages in one week, one release by the end of October 2026.** Stage 1: the window draws today's AceConfig tables through a mapping table, with tests that every current system still works through it; nothing in how options work changes. Stage 2: a definition format of KAF's own replaces AceConfig and `InjectOptions`, and must pass stage 1's tests unchanged. No new options are added that week.
- **Saved data keeps its layout**: no migration ships with this; profiles and settings carry over untouched.
- **No taint**: the window never touches the frames of Blizzard's `SettingsPanel`, and opening it from the stub must not add a taint path (today's options already close the settings panel with a workaround, `Options/General.lua` `CloseSettingsPanel`). A "Show me" that would open Blizzard's world map from addon code tries a secure route first.
- **Not this week**: skins for the window (it exposes its pieces so they can follow), extraction to a library (the window lives in its own folder inside KAF, outside `Libs/`, registered through LibMan, so extraction is a move), storage cleanups, and changes to the plugin API's behaviour.
- **The help content runs as a parallel track** on its own branch and worktree, meeting the window at one seam: section id -> explanation blocks + a "Show me" function.

## Open questions
- The mapping table's form and home, and how the headless check proves every option is mapped once on every client.
- Stage 2's definition format: how it expresses rows built from data (events, grids, the tab list), options that depend on other addons (plugin groups, "not active when ElvUI is enabled"), key bindings and profiles, while reading and writing today's saved layout.
- How the window is built per client (Retail's templates vs the Classic clients'), and what Titan Reforged gets without a local test.
- What the window does in combat.
- When the six AceConfig pages, `Tutorials.lua` and the Krowi_Tutorials submodule are removed, and what the filter menu's Help entry becomes.
- When the new strings go to CurseForge so translators get the most of the week.