# Spec: Pop Out as a feature that switches off (106, step 3)
Intent: [intent.md](intent.md). Status: accepted

## Requirements

The feature
1. Pop Out registers as the feature `PopOut` (title "Pop Out"), switch saved per profile at `Features.PopOut`, default on. No saved key moves or changes meaning (`Popout.*`, `Achievements.Modifiers.PopOut`, `KrowiAF_SavedData.AchievementPopouts`, `LastPopoutPosition`, `PopoutLifecycleLog`, `PopoutHideDebug`), so no migration runs.
2. With the switch on, Pop Out behaves as on `main`, on Retail and Mists: a modifier click on a row, the right-click menu's Pop Out / Close Popout entry (Order 40, same place), Show me, the Pop Outs of the last session restored after the login data load, snapping, fading, the corner buttons, close on earn, and every setting.
3. With the switch off and the game reloaded: a modifier click on a row does nothing more than it does today when no modifier action matches; the menu has no Pop Out entry; no Pop Out is restored and none is made; no error is raised. The Pop Outs saved in the last session stay in the saved data and come back when the switch goes on again.
4. Loading the feature's files makes nothing (no frame, hook, script, event, timer or slash command) and writes nothing into the saved data; the logout listener, the lifecycle log and the menu entry start in its `Start`.

The boundary
5. The core opens nothing of Pop Out by name. A modifier click reaches it through a new slot (`Slots.RowModifiers`), the restore after the login data load through a new registry phase (`AfterDataLoad`); Show me and the menu entry are the feature's own (`Features.AddHelp`, `Slots.AchievementMenu.Add`).
6. EllesmereUI's skin of Pop Outs is a file of its own, `Plugins/EllesmereUI/PopOut.lua`, which the boundary rule gives to the feature; `Plugins/EllesmereUI.lua` names no Pop Out code.
7. The public surface stays: the frame names `KrowiAF_AchievementPopout<id>` and the template `KrowiAF_AchievementPopout_Template`, and the table `addon.Gui.AchievementPopout` with `OpenPopouts`, `Open`, `Close`, which the tests reach.

The options window
8. The Pop Out section stays where it is (Achievement window group, after the Right-click menu, before Reward preview and Achievement guides: Order 100), opens with the switch, and below it shows today's rows under the headings "Pop Outs", "Buttons" and "Appearance", greyed out while the switch is off. The modifier row sits under "Pop Outs" too, with a link button after it, and is also kept in General's Modifiers group (requirement 8a); both rows read and write the same saved key.
8a. The modifier setting is in two places, as Blizzard's own settings list a binding in more than one (Krowi, 2026-11-09): (i) in General's Modifiers group (Keys and clicks) as the fifth row, after Include / Exclude, with a link button after it that opens the Pop Out section; (ii) in the Pop Out section under "Pop Outs", with a link button after it that opens the Keys and clicks section. Both rows go grey while the switch is off. Their description says the setting is controlled by the Pop Out feature being on, and where to switch it on. The link buttons say what they open ("Go to Pop Out", "Go to Keys and clicks") and the one in General stays usable while Pop Out is off, so the way to the switch is never greyed. The core's Modifiers group names no Pop Out code: the feature adds its row and its button into that group through the registry (requirement 8b).
8b. `Features.AddOptions` takes `Into`: rows a feature adds into another part of the options table, each with the path of the core group and an order. The registry adds them while the files load, as it adds the feature's own section, so they exist (greyed) while the feature is off.
9. The rows keep their pairs (a toggle with the option drawn after it: Close On Earn with its delay, Enable Snapping with its distance) and their `disabled` rules.
10. Its help page and Overview card stay; while Pop Out is off the page opens with the off line and has no Show me.
11. Its settings and help text go through the options review (what each does, name, description, help text; REVIEW.md, Texts), with the proposals put to Krowi at the look gate (`review-options.md`).

The proofs
12. The headless `features` suite covers three features: files make nothing while loading, an off feature never starts and owns no slot entry, an on one does; Pop Out's own checks: its modifier entry and its menu entry exist exactly while it is started, and `AfterDataLoad` runs exactly for a started feature.
13. `feature-boundary` passes; it fails on a scratch reference from the core to `addon.Gui.AchievementPopout` (checked once, not committed).
14. `/kaftest matrix` through `Run-GameTests.ps1 -Matrix` is green on Retail and Mists with Pop Out added as a step: all on, all off, each feature alone. The `features` suite records the memory with Pop Out off and on.
15. The data snapshots and the headless pipeline stay unchanged.

## The trail today (file:line on `main`, f998df95)
- **The feature itself**: `Gui/AchievementPopout/AchievementPopout.lua` (the table; the lifecycle log and its `PLAYER_LOGOUT` frame made at file load `:36-40`; `Open`, `Close`, snap and save handlers; `Load` `:259-319`), `AchievementPopoutMixin.lua` (frame, chrome, fade, button clone), `AchievementPopout.xml` (virtual template), `MenuEntry.lua` (menu entry added at file load). `Gui/SnapFrame/` (the snap mixin, 237 lines) has no other user.
- **Core files that name it**: `Data/Data.lua:134` (`Load`), `Gui/WindowFrames/AchievementButton/AchievementButtonMixin.lua:149-150` (the modifier click, last in `ProcessModifiers`), `Gui/FilesModern.xml:15-16` and `Gui/FilesClassic.xml:14-15` (SnapFrame, AchievementPopout), `Options/Window/Help/ShowMe.lua:250-258` (the scene), `Options/Window/Help/Help.lua:208-214`.
- **Settings**: `Options/Defaults.lua:88` (modifier), `:108-121` (`Popout`); `Options/General.lua:419-426` (modifier row); `Options/Layout.lua:1580-1604` (chrome setters), `:1607-1730` (`popoutOptions`), `:1876`; section `Options/Window/Map.lua:157-167`, its place `:21-22`; the modifier group is mapped by `:264`.
- **Meets it without naming its code**: `Gui/SidePanels.lua:18` (tests a frame's shape, `AchievementId` and `Button`, to find the window a row belongs to; Reward preview's and Guide's panels close with it), the right-click menu (a Pop Out row opens it through `Slots.AchievementMenu.Open`).
- **Skin**: `Plugins/EllesmereUI.lua:895-912` (`SkinAchievementPopout(s)`), `:948` (in `ApplyVisuals`), `:1007-1011` (a post-hook on `Open`). No other plugin names Pop Out.
- **Tests and tooling**: `Tests/Memory.lua:353`, `Tests/Pictures.lua:610-650, 897-899`, `Tests/Options.lua:403-404`, `Tests/Escape.lua:273`, `Tests/Help.lua` (the page's id), `.claude/tools/Check-Repo.jobs:35` (the logout listener's path); the headless models do not load Pop Out's files.

## Design

### The folder
`Features/Files.xml` includes `PopOut\Files.xml` after the menu's. Everything of Pop Out moves there:

| New file | From |
|---|---|
| `PopOut.lua` | the registration (`Register`: `Start`, `AfterDataLoad`) and the table `addon.Gui.AchievementPopout` (same name, so the tests and the skin keep reaching it) |
| `Popout.lua`, `PopoutMixin.lua`, `Popout.xml` | `Gui/AchievementPopout/AchievementPopout.lua`, `AchievementPopoutMixin.lua`, `AchievementPopout.xml`; the file-load writes move into `Start` (below) |
| `SnapFrame.lua` | `Gui/SnapFrame/SnapFrameMixin.lua` (only Pop Out uses it) |
| `MenuEntry.lua` | `Gui/AchievementPopout/MenuEntry.lua`; added to `Slots.AchievementMenu` in `Start` |
| `Modifier.lua` | new: the modifier click, added to `Slots.RowModifiers` in `Start` |
| `Options.lua` | `Options/Layout.lua:1580-1730`, `Options/Defaults.lua:88, 108-121`, `Options/General.lua:419-426` (becomes the feature's `Into` row and button in General's Modifiers group, plus a second row and button in its own section), `Options/Window/Map.lua:157-167` |
| `Help.lua` | `Options/Window/Help/Help.lua:208-214`, `Options/Window/Help/ShowMe.lua:250-258` |
| `Plugins/EllesmereUI/PopOut.lua` | `Plugins/EllesmereUI.lua:895-912, 948, 1007-1011` |

### The slots and the registry (core)
- **`Slots.RowModifiers`**: `Add({Order, Handle = function(row) return handled end})`, and `Handle(row)` for the core. `ProcessModifiers` calls it where the Pop Out block is today, last, so the order of the other four modifiers and the final `return true` stay. Pop Out's handler tests `IsCustomModifierKeyDown(Achievements.Modifiers.PopOut)`, opens the Pop Out and returns true.
- **`AfterDataLoad`** in `Features.Register`: `Features.DataLoaded()` runs it, in `xpcall`, for every started feature, from where `Data/Data.lua:134` calls `Load` today (after `addon.Data.Achievements` is filled, still before the cache build). Achievement guides, Event reminders and Data Manager need the same hook, so it is a registry phase, not a Pop Out special.
- **`Pairs` for a feature's section**: `AddOptions`'s section may carry `Pairs`, passed to the group entry the registry builds (`Features.lua:147-152`), so a feature's toggle can draw its option after it as the window allows.

### What `Start` does
`Start` is run by the registry at `ADDON_LOADED`, after the options exist and before the data integrity manager and the saved data load (`Krowi_AchievementFilter.lua:40-47`). It takes the first lifecycle log line (what came off disk this session, as `FileLoad` does today; the event is named `Start`), registers the `PLAYER_LOGOUT` frame, adds the menu entry and the modifier entry. The template and the mixin tables are file-load definitions that make no frame; a Pop Out frame is made when one opens, as today. `AfterDataLoad` is today's `Load`.

### The settings and the help page
`Features.AddOptions("PopOut", ...)` with the saved keys unchanged: `Popout.*` and `Achievements.Modifiers.PopOut` (its default moves into the feature's defaults; the registry merges deep). The modifier is two entries over one key. In the section: a select under "Pop Outs" (its `disabled` comes with the greyed `Settings` group) and, right after it, an `execute` button "Go to Keys and clicks" calling `addon.Options.Open(nil, "keys")` (the pattern of General's Set Keybind button, `Options/General.lua:375-380`). In General: `Into` adds to `General.args.KeyBinding.args.General.args.Modifiers.args` a select `PopOut` (same key, own `disabled = not IsOn`, description ending "Controlled by the Pop Out feature: switch it on in its section.") and an `execute` button "Go to Pop Out" calling `addon.Options.Open(nil, "popout")`, which has no `disabled`, so it works while the feature is off. The feature names the core's group path and its own section, which the boundary allows; the core's `General.lua` loses the Pop Out row (`:419-426`) and names nothing new. The "keys" section's mapping (`Map.lua:264`) maps the whole group, so the new entries are drawn there and counted once by the options test. Texts: new phrases "Go to {section}" (button) and the description line, in every locale file; the layout of select plus button gets its look check in game (the select's width is trimmed as the other rows' are, `AdjustedWidth`). `Rows()` returns a flat list: header "Pop Outs" is the section's own heading (`Section.Header`), then the General rows and the modifier with their pairs, header "Buttons", two toggles, header "Appearance", three rows (`Features.lua:128-154`, the window draws a group's leaves and headers as sub-headings, `Options/Window/Source.lua:360-390`). The chrome setters call `RefreshAllChrome` as today. The section keeps its id `popout`, its card and its order. `Features.AddHelp("PopOut", {Id = "popout", ...})` with today's blocks and the scene from `ShowMe.lua`; `help.popout` and the scene leave the core.

### The skin
`Plugins/EllesmereUI.lua` gets a list of parts: `compatibility.AddPart(part)`, with `part.Install(skin)` called from `InstallHooks` and `part.Apply(skin)` from `ApplyVisuals`. `Plugins/EllesmereUI/PopOut.lua` adds Pop Out's part: the corner-chrome skin, the apply over the open ones, and the post-hook on `Open`. Adding a part at file load makes nothing; while Pop Out is off nothing opens, so the part does nothing.

### What stays
- `Gui/SidePanels.lua:18` keeps testing a frame's shape (`AchievementId` and `Button`) to find the window a row belongs to: it names no Pop Out code, and a field the feature would set on its own frames changes nothing a player sees (option 4).
- The right-click menu and Show me's pictures reach `addon.Gui.AchievementPopout` by name as before; the Pop Out menu entry, with the menu on and Pop Out off, is simply absent.
- The tests: `Tests/Memory.lua` already reads `OpenPopouts` (empty while off); `Tests/Pictures.lua`'s Pop Out scenario skips while off and says why; `Tests/Features.lua` gets Pop Out's row with the modifier and entry checks; `Tests/Options.lua`'s fingerprint and `Tests/Help.lua` change with the paths and the switch row.
- `.claude/tools/Check-Repo.jobs:35` follows the logout listener to its new path; the headless models and `options-env.lua` boot the feature as they boot the other two.
- `docs/architecture.md` (Features), the instruction file's Features section and `Tests/README.md` name `Slots.RowModifiers`, `AfterDataLoad` and the third feature.

## Options considered
1. **A modifier slot and an `AfterDataLoad` phase; the modifier setting in both places, each row greyed with the switch, each with a link button to the other (chosen by Krowi, 2026-11-09).** The core keeps no trace of Pop Out; the setting that only works through Pop Out greys out with it while it is off. A player sees it in the feature's section and, with the other four modifiers, in Keys and clicks. The new core parts (a slot, a phase, `Into`) are small and the next features (Guide, Data Manager, Event reminders) need the same phase.
2. **The modifier setting only in Pop Out's section.** Considered first. A player setting several modifiers cannot see what the others use, so two actions end up on one modifier and the later one never fires (`ProcessModifiers` stops at the first match; Pop Out is last). Rejected by Krowi.
2b. **The modifier setting only in General, as today.** No move, but the row stays editable while Pop Out is off and does nothing: the backlog's greying problem, which the menu split deferred.
3. **EllesmereUI's skin stays in `Plugins/EllesmereUI.lua`**, guarded by `addon.Gui.AchievementPopout and ...` as today. Nothing to build, but the plugin file then names Pop Out code, which the boundary rule fails (`Plugins/EllesmereUI.lua` is the core). Not possible without an exception; the part file is the shape the walk-through gave Event reminders.
4. **Side panels find their window through a field the feature sets** (`frame.IsOwnerWindow`) instead of testing a frame's shape. Cleaner, but it changes the core's lookup, `Tests/Escape.lua`'s stand-in frame and Reward preview's and Guide's panels for no change a player sees; the shape test names no feature code. Recommended: not now, kept out of this PR.
5. **A plain `Load` call guarded by `Features.IsStarted("PopOut")` in `Data/Data.lua`**: one line, but the core names the feature, which the boundary rule fails.

## Areas of concern
- **Taint and secret values.** Nothing new touches Blizzard frames: a Pop Out is a frame of the addon on `UIParent`, made from a virtual template when one opens, and its button clone is the addon's own row template. The modifier slot is called from the row's click handler, on the addon's own row, as the Pop Out call is today. The restore runs at `PLAYER_LOGIN` inside the data load as today; it calls `C_AddOns.LoadAddOn("Blizzard_AchievementUI")` as today (a registry phase adds a pcall layer, nothing else). The part file reads only the addon's frames. No secret values are read. `krowi:taint-reviewer` reviews the diff.
- **Clients.** Retail and Mists (the TOC's `## Interface:`; Wrath and Cata through `AllowLoadGameType`). Pop Out loads on both today (`Gui/FilesModern.xml`, `Gui/FilesClassic.xml`); `Features/Files.xml` loads on both. `Plugins/EllesmereUI/PopOut.lua` loads on both, and the plugin is Retail-only (`IsLoaded`).
- **Blizzard API changes.** None used newly. `Find-DeprecatedApi.ps1` runs on the moved files.
- **Other addons, plugins and skins.** EllesmereUI's skin keeps working through the part (verified in game when EllesmereUI is installed, otherwise by the headless model and the lint only; the spec's verification says which). No other plugin names Pop Out. Instance Achievement Tracker and GW2_UI skin the row button, not Pop Out.
- **Saved variables and migrations.** One new key per profile, `Features.PopOut` (AceDB stores it only when off). `Popout.*`, `Achievements.Modifiers.PopOut` and the saved-data tables keep their keys and shape. With Pop Out off nothing writes them, and the Pop Outs saved last session stay. The lifecycle log's first event is renamed `Start` and its `FileLoad` line is no longer written (the log is a forensic aid for the "randomly empty" bug; entries already in a player's saved data stay).
- **Localization.** No new phrase for the move: the switch and the off line reuse `Enable`, `Feature Switch Desc` and `Feature Off Help`; "Pop Out", "Pop Outs", "Buttons" and "Appearance" exist. Renames from the options review go into every locale file and to CurseForge in the same change.
- **Embedded libraries.** None change.
- **Data snapshots.** No data moves; both snapshots stay unchanged.
- **Player-facing text.** Changelog lines under 106: the switch (Added). The options fingerprint (`Tests/Options.lua`) changes: the paths move, the switch row is added, the modifier row changes section; the new values are committed with the reviewed diff.
- **Background jobs.** None added. The `PLAYER_LOGOUT` listener (once) and `SnapFrameMixin`'s `OnUpdate` (only while a Pop Out is dragged) are listed in `Check-Repo.jobs`; their paths follow the move.
- **Gate class.** `feature`. The changed `Check-Repo.jobs` line is an existing line of the lint tooling, which `Get-ChangeClass.ps1` reads as `harness`, as in the two earlier features; the gates asked are the same.

## Verification
- Headless: `features` (three features, off and on boots, the start check, the modifier and menu entry checks, `AfterDataLoad`), `menu`, `options` (every option mapped once, the switch on top, the rows greyed while off, the new fingerprint), `help`, `escape`, `tooltip`, `guide`; the data pipeline and both snapshots unchanged.
- Lint: `Check-Repo.ps1` clean, `feature-boundary` included; the scratch reference check of requirement 13.
- In game, Retail and Mists: the before-run of `menu`, `options`, `help` and `escape` on `main`; after the build `/kaftest matrix` through `Run-GameTests.ps1 -Matrix` (five steps), `Read-GameErrors.ps1` with no new row; a Pop Out opened, moved, snapped, closed, restored after a `/reload`, and the same with the switch off; the memory with Pop Out off and on in the PR.
- Look gate: the section with its switch, headings and the modifier row, greyed while off; the help page while off; a modifier click and a right-click that open no Pop Out while off; the options review's proposals. On a published page with screenshots of both clients.
- `krowi:taint-reviewer` and `/code-review` on the diff; at the end an Opus agent evaluates the whole piece of work (Krowi, 2026-11-09: this session runs on Sonnet 5.5 as a trial).

- **Not decided, left as today:** no duplicate check between the five modifiers (the row's first-match behaviour stays). Offered, not asked for; a follow-up if Krowi wants it.

## Decision
2026-11-09, Krowi: option 1 as amended: Pop Out moves into `Features/PopOut/` with its switch; the core gets `Slots.RowModifiers`, the `AfterDataLoad` phase, `Pairs` and `Into`; the modifier setting shows in General's Modifiers group and in Pop Out's section, both greyed while off, each with a link button to the other; EllesmereUI's skin becomes `Plugins/EllesmereUI/PopOut.lua`; `Gui/SnapFrame/` moves; option 4 (a field for the side panels) stays out; no duplicate check. Approved: "Approve the amended spec (Recommended)".