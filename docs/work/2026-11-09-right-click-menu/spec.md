# Spec: The Right-click menu as a feature that switches off (106, step 2)
Intent: [intent.md](intent.md). Status: accepted

## Requirements

The feature
1. The achievement right-click menu registers as the feature `RightClickMenu` (title "Right-click menu"), switch saved per profile at `Features.RightClickMenu`, default on. No existing saved key moves or changes meaning, so no migration runs.
2. With the switch on, the menu behaves as on `main`, on Retail and Mists: the same entries in the same order (Wowhead, Go to with its five parts, Guide, Pop Out, Preview Reward, Transmog Sets, Xu-Fu's Pet Guides, More, then the plugins' entries), opened from the same six places, the row's menu button while `RightClickMenu.ShowButtonOnAchievement` is on, its three settings, its help page and Show me.
3. With the switch off and the game reloaded: a right-click on an achievement row, an objectives row, a Pop Out row or the chat-link tooltip opens no menu and raises no error; rows have no menu button whatever its setting says; no plugin's menu hook is called. Modifier clicks, the guide and reward preview row icons, and everything else outside the menu work as before.
4. Loading the feature's files makes nothing (no frame, hook, script, event, timer or slash command); its menu builder is made in its `Start`.

The boundary
5. The core opens the menu through a slot and never names it. The menu reaches the core only through the slots and core names.
6. Entries owned by other features reach the menu through the core's menu slot and close it through the builder they are handed (`menuBuilder:Close()`), never by the menu's name: Preview Reward (already a slot entry), and Guide, Pop Out and Xu-Fu's Pet Guides, which stay in the core until their own features are split.
7. The event reminder side button's menu is no longer under `Gui/RightClickMenu/` nor in `addon.Gui.RightClickMenu`.
8. The public surface stays: `KrowiAF.PluginsApi:AddAchievementRightClickMenuItems`, `KrowiAF.UtilApi.MenuBuilder`, the row button's name `<row>RightClickMenuButton` and its `RightClickMenuButton` field (GW2_UI skins it).

The options window
9. The Right-click menu section stays where it is (Achievement window group, between Tooltips and Pop Out), opens with the switch, and below it shows its three settings under the sub-headings "Button" and "Wowhead link"; they grey out while the switch is off.
10. Its help page and Overview card stay; while the menu is off the page opens with the off line and has no Show me.
11. The menu's three settings and its help text go through the options review (what each does, name, description, help text; REVIEW.md, Texts), with the proposals put to Krowi at the look gate.

The proofs
12. The headless `features` suite covers both features: files make nothing while loading, an off feature never starts and owns no slot entry, an on one does. The menu's own checks: the opener is set and the row part is in the rows' slot exactly while it is started. That a row then gets the button while its setting is on is the code of `main`, shown at the look gate with the setting on.
13. `feature-boundary` passes; it fails on a scratch reference from the core to `addon.Gui.RightClickMenu` (checked once, not committed).
14. `/kaftest matrix` through `Run-GameTests.ps1 -Matrix` is green on Retail and Mists: all on, all off, Reward preview alone, Right-click menu alone. The `features` suite records the memory with the menu off and on.
15. The data snapshots and the headless pipeline stay unchanged.

The fix (added at the design gate)
16. A right-click on an achievement the addon does not register (a guild achievement or a statistic linked in chat, an objectives row naming one) opens no menu and raises no error, on Retail and Mists. Built test first: a `menu` scenario records today's behaviour as `Recorded`, verified in game, and this as `Target`.

## The trail today (file:line on `main`, 16e23cb7)
- **The menu**: `Gui/RightClickMenu/AchievementMenu/AchievementMenu.lua` (the table, its builder made at file load `:6`, `CreateMenu` merging its sections with `Slots.AchievementMenu.Entries` by `Order` `:44-63`, `Open` `:65-70`, `CloseMenu` `:8-10`). Its sections by `Order`: Wowhead 10, Go to 20 (part of a chain, required for, other faction, other locations, first category ride on it through `GetLastSection`), Guide 30, Pop Out 40, Preview Reward 50 (slot), Transmog Sets 60, Xu-Fu's Pet Guides 70, More 80. `Gui/RightClickMenu/RightClickMenu.lua` makes `addon.Gui.RightClickMenu`.
- **The openers**: `AchievementButtonMixin.lua:169`, `AchievementButton.lua:3-11` (the row's button, added at `:64-66` and `:76-78` while `ShowButtonOnAchievement` is on, template `AchievementButton.xml:334-345`), `AchievementsObjectivesMixin.lua:27`, `AchievementPopoutMixin.lua:89`, `FloatingAchievementTooltipMixin.lua:46` (its strata argument is ignored by `Open`), `Options/Window/Help/ShowMe.lua:244-249`.
- **Closing by name**: `Guide.lua:33, 45`, `PopOut.lua:18, 29`, `More.lua:18, 27, 40, 49`, `Features/RewardPreview/MenuEntry.lua:22, 35`.
- **Settings**: `Options/Layout.lua:1742-1782` (inline groups Button and Wowhead), `:1928`; `Options/Defaults.lua:108-114`; section `Options/Window/Map.lua:157-164`, its place `:21-22`; help `Options/Window/Help/Help.lua:208-219`.
- **The event reminder menu**: `Gui/RightClickMenu/EventReminderMenu/` writes `addon.Gui.RightClickMenu.EventReminderMenu`; opened only by `Gui/EventReminder/SideButton/SideButtonMixin.lua:25`. Its `Files.xml` keeps commented-out lines of achievement menu sections.
- **Dead**: `addon.Data.RightClickMenuExtras` (`Data/Data.lua:25`) is read by nothing.
- **Tests**: `Tests/Menu.lua:226, 237`, `Tests/Guide.lua:50, 267`, `Tests/Pictures.lua:610`, and the headless models that load the files by path (`.claude/tools/headless/run-tests.lua:1177-1184, 1238-1274`).

## Design

### The folder
`Features/Files.xml` includes `RightClickMenu\Files.xml` after Reward preview's. Everything of the menu itself moves there:

| New file | From |
|---|---|
| `RightClickMenu.lua` | `Gui/RightClickMenu/RightClickMenu.lua`, now the registration and `Start` |
| `AchievementMenu.lua` | `Gui/RightClickMenu/AchievementMenu/AchievementMenu.lua`; the builder is made in `Start` |
| `WowheadLink.lua`, `GoTo.lua`, `PartOfAChain.lua`, `RequiredFor.lua`, `OtherFaction.lua`, `OtherLocations.lua`, `FirstCategory.lua`, `TransmogSets.lua`, `More.lua` | the same files in `Gui/RightClickMenu/AchievementMenu/`, unchanged but for their paths |
| `RowButton.xml`, `RowButton.lua` | the template `AchievementButton.xml:334-345` and `AddRightClickMenuButton` (`AchievementButton.lua:3-11`) |
| `Options.lua` | `Options/Layout.lua:1742-1782, 1928`, `Options/Defaults.lua:108-114`, `Options/Window/Map.lua:157-164` |
| `Help.lua` | `Options/Window/Help/Help.lua:208-219`, `Options/Window/Help/ShowMe.lua:244-249` |

The table keeps its name, `addon.Gui.RightClickMenu.AchievementMenu`, which the boundary lint now counts as the feature's; the tests keep reaching it there.

### The entries of features not split yet
Each moves next to its owner in the core, and adds itself to `Slots.AchievementMenu` when its file loads, at the `Order` it has today:

| Entry | New file |
|---|---|
| Guide (30) | `Gui/Guide/MenuEntry.lua` (in `Guide.xml`); `Tests/Guide.lua` reaches it as `addon.Gui.Guide.MenuEntry` |
| Pop Out (40) | `Gui/AchievementPopout/MenuEntry.lua` (in `AchievementPopout.xml`) |
| Xu-Fu's Pet Guides (70) | `Gui/PetBattleLinks/MenuEntry.lua` (new folder, in both `Gui/Files*.xml`) |

Guide's and Pop Out's closing calls become `menuBuilder:Close()`, and so do Reward preview's (`MenuEntry.lua:22, 35`). A core entry added at file load has no owner; when its feature is split, the line moves into that feature's `Start`.

### The slots (core, `Slots.lua`)
- **The menu's opener.** `Slots.AchievementMenu.SetOpener(open)` is called by the menu's `Start`; it is an owned entry like any other, so the `features` suite sees it. `Slots.AchievementMenu.Open(caller, achievement)` calls the opener, and does nothing while none is set. The six openers call `addon.Slots.AchievementMenu.Open(self, achievement)` instead of the menu by name; Show me moves into the feature and calls its own menu.
- **A slot read by a feature.** `Slots.lua`'s header says the core reads the slots; it gains a line: a slot may have a host feature that reads its entries (the menu reads `AchievementMenu.Entries`), and the core then reaches the host only through the slot.
- **Row parts.** `Slots.RowParts.Add({Order, OnLoad = function(row) end})`: parts a feature adds to an achievement row when the row is made. The core calls `addon.Slots.RowParts.Load(row)` where `AddRightClickMenuButton` is called today (`AchievementButton.lua:64-66, 76-78`: the compact and normal rows, and the light ones through the compact one). The menu's part makes the button while `ShowButtonOnAchievement` is on, as today. Rows are made after `StartAll` (the achievement window is built at `ADDON_LOADED` of Blizzard_AchievementUI or later, `Krowi_AchievementFilter.lua:39, 57`), and still inside `OnLoad`, so GW2_UI, which skins `RightClickMenuButton` when a row is first acquired (`Plugins/GW2_UI/GW2_UI.lua:321-327, 479-484, 628`), finds it as today. `RowIcons` does not fit: it draws per achievement on pooled icons; the button is made once per row.

### The settings
`Features.AddOptions("RightClickMenu", ...)` with the saved keys under `RightClickMenu` as today. The registry's section is one heading with the switch and an inline group (`Features.lua:128-154`), and the window draws only the leaves of a group (`Options/Window/Source.lua:360-374`), so `Rows()` returns a flat list with two `header` rows, "Button" and "Wowhead link", which the window draws as sub-headings (`Source.lua:387-390`). The section keeps id `rightclick`, its card (`L["Card Right Click"]`), the navigation group `window` and order 90; `rightclick` leaves `Map.lua:21-22`'s lists and comes from the feature (`Features.lua:102-120`).

### The help page
`Features.AddHelp("RightClickMenu", {Id = "rightclick", ...})` with today's blocks, the picture `MenuMain`, and the Show me scene from `ShowMe.lua:244-249`. Its terms keep naming Guide and Xu-Fu's Pet Guides: they are text, not code, and the page describes the menu as players see it with everything on.

### The event reminder menu
`Gui/RightClickMenu/EventReminderMenu/` moves to `Gui/EventReminder/Menu/` (in `Gui/EventReminder/Files.xml`), as `addon.Gui.EventReminderMenu`, opened by `SideButtonMixin.lua:25` under that name. The commented-out achievement sections in its `Files.xml` go. It moves again, into `Features/EventReminders/`, with that feature.

### The unregistered achievement
`Slots.AchievementMenu.Open(caller, achievement)` returns when `achievement` is nil, before it calls the opener: the openers that pass `addon.Data.Achievements[id]` (the chat-link tooltip, the objectives rows) get nil for an id the addon never registered (`Data/SavedData/AchievementData.lua:88`), and today `CreateMenu` indexes it (`AchievementMenu.lua:45`). The guard sits where every opener passes, so it holds for whichever feature hosts the menu.

### Smaller changes
- `addon.Data.RightClickMenuExtras` is removed (read by nothing).
- `Tests/Menu.lua` and `Tests/Pictures.lua` skip their menu scenarios while the menu is off and say why (the `features` suite proves the absence); `Tests/Features.lua` gets the menu's row, with `frame` and `data` skipped for a feature that has none, and the menu's own checks (requirement 12).
- The headless models load the moved files from their new paths, and `options-env.lua` boots the menu feature as it boots Reward preview.
- `docs/architecture.md` (Features), the instruction file's Features section and `Tests/README.md` name the new slots and the second feature.

## Options considered
1. **Opener and row-part slots, the menu fully in its folder (recommended).** The core keeps no trace of the menu but the slot calls; the row button, its template and its setting live with the menu; an off menu makes nothing.
2. **The row button stays in the core** and is made only while the slot has an opener (the walk-through's simplest form). One slot less, but the core then reads the menu's setting `RightClickMenu.ShowButtonOnAchievement` and holds its template: a feature's part outside its folder.
3. **The entries of features not split yet stay inside the menu's folder** until their own PRs. Fewer files move now, but the menu would hold Guide's, Pop Out's and Xu-Fu's code, and naming those core parts from the menu makes the later moves undo this PR's. Against the accepted intent.
4. **Transmog set data moves with the menu** (it is read only by the Transmog Sets entry, `Globals.lua:313`). The grill's rule says a feature's own data loads only while it is on, but the data is a registry of its own (`KrowiAF.TransmogSetData`, `Api/TransmogSetDataApi.lua`, `Data/Data.lua:96-101`, `DataAddons/Loaders/TransmogSetData.lua`), so moving it needs a data-registry slot. Achievement guides needs the same slot for its much larger guide data; building it there and moving transmog set data in that PR keeps this one to the menu. Recommended: stays in the core here, noted in `docs/backlog.md` under 106 (six small files, 200 lines of data).
5. **Fix the menu of an achievement the addon does not register here** (`docs/backlog.md`, "From the right-click menu fix": right-clicking a guild achievement linked in chat opens an empty menu on Retail and errors on Mists). With every opener going through `Slots.AchievementMenu.Open`, the guard is one line there. But it changes behaviour in a PR whose proof is "on behaves as `main`", and a fix is built test first with its own scenario. Recommended: its own small PR right after this one.

## Areas of concern
- **Taint and secret values.** Nothing new touches Blizzard frames or functions. The menu is Krowi_Menu's as today (on Retail Blizzard's context menu); its builder is made at `ADDON_LOADED` instead of at file load (`New` makes no frame, `Libs/Krowi_Menu/Krowi_MenuBuilder.lua:53-67, 112-115, 293-295`), and it opens from the same click handlers through one more addon function. The row button is made in the same `OnLoad` of the addon's own rows. `krowi:taint-reviewer` reviews the diff.
- **Clients.** Retail and Mists (the TOC's `## Interface:`; Wrath and Cata through `AllowLoadGameType`). Every moved file loads on both today (`Gui/FilesModern.xml`, `Gui/FilesClassic.xml`); `Features/Files.xml` loads on both. Guide's entry stays loaded on Mists, where no achievement has a guide.
- **Blizzard API changes.** None used newly. `Find-DeprecatedApi.ps1` runs on the moved files.
- **Other addons, plugins and skins.** Instance Achievement Tracker adds its entry through `KrowiAF.PluginsApi`, which the menu calls as today; while off, no menu, so no call. GW2_UI's skin of the row button keeps working (above). No other file in `Plugins/` names the menu.
- **Saved variables and migrations.** One new key per profile, `Features.RightClickMenu` (AceDB stores it only when off). The three settings keep their keys. No migration.
- **Localization.** No new phrase for the move: the switch and the off line reuse `Enable`, `Feature Switch Desc` and `Feature Off Help`; "Right-click menu", "Button" and "Wowhead link" exist. Renames from the options review go into every locale file and to CurseForge in the same change.
- **Embedded libraries.** None change.
- **Data snapshots.** No data moves (option 4), so both snapshots stay unchanged.
- **Player-facing text.** Changelog lines under 106: the menu's switch (Added) and the right-click on an unregistered achievement (Fixed). The options fingerprint (`Tests/Options.lua`) changes: the paths move and the switch row is added; the new values are committed with the reviewed diff.
- **Background jobs.** None added; the menu has none.
- **Gate class.** `feature`. The headless models' changed paths are existing lines of the test tooling, which `Get-ChangeClass.ps1` reads as `harness`, as in the PoC; the gates asked are the same.

## Verification
- Headless: `features` (both features, off and on boots, the start check, the menu's opener and row button checks), `menu`, `guide`, `options` (every option mapped once, the switch on top, the rows greyed while off, the new fingerprint), `help`, `escape`, `tooltip`; the data pipeline and both snapshots unchanged.
- Lint: `Check-Repo.ps1` clean, `feature-boundary` included; the scratch reference check of requirement 13.
- In game, Retail and Mists: the before-run of `menu`, `guide`, `options` and `help` on `main`; after the build, `/kaftest matrix` through `Run-GameTests.ps1 -Matrix` (four steps; about twice the PoC's 15 minutes per client), `Read-GameErrors.ps1` with no new row; the memory with the menu off and on in the PR.
- Look gate: the section with its switch and sub-headings, greyed while off, the help page while off, a row without the button and a right-click that opens nothing while off; the options review's proposals. On a published page with screenshots of both clients.
- `krowi:taint-reviewer` and `/code-review` on the diff.

Found during the build (2026-11-09):
- **The boundary lint read a call as a definition.** Its definition patterns (`Check-Repo.ps1`, feature-boundary) took a line that starts with `addon.X(` or `KrowiAF_X(` for a definition, so with two features each "defined" `addon.Features.Register`, `AddOptions` and `AddHelp`, and the menu "defined" `KrowiAF_SelectAchievementFromID`, which it only calls: 22 false errors. A definition is now `function <name>(` or `<name> =`; the core-defined list uses the same patterns, so a core call no longer hides a feature's name either.
- **A check a feature has nothing for makes no line** in the `features` suite (`When` on the scenario): the lint's `unit-tests` rule reads any headless SKIP as an error.

## Decision
Krowi, 2026-11-09: the design as written (option 1: opener and row-part slots, the menu fully in its folder); transmog set data stays in the core in this PR and moves with Achievement guides' data-registry slot (option 4 not taken now); the menu of an unregistered achievement is fixed in this PR (option 5 taken, against the recommendation), test first (requirement 16).