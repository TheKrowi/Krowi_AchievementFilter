# Plan: help content for the options window (Track B)
Spec: [spec.md](spec.md), plan: [plan.md](plan.md) (Track B, design decision 9). Status: done

Approved by Krowi on 2026-10-25, with the four decisions below (non-routine: a secure button and taint-sensitive Show me scenes).

## Context
The options revamp runs as two tracks. Track A builds the window. This track fills the seam the window reads, `addon.Options.Window.Help[sectionId]`:
- the 23 explanations;
- their pictures;
- a Show me for each feature section.

Once both are merged, Track A removes the old tutorial.

Where things start from:
- **Texts:** the mockup's middle-ground `explain` blocks (`mockup/MockupSpec.ps1`).
- **Pictures:** cut by a repo tool from screenshots of a game-only `/kaftest pictures` run, with the old pictures' soft edge (`mockup/Crop-Pictures.ps1`) and a TGA reader (`mockup/Convert-Tga.ps1`).
- **Branch:** the worktree `feature/2026-10-25-options-help`, off `feature/2026-10-25-options-revamp`, with a PR back into that branch. plan.md says "off `main`"; Krowi chose the revamp branch, so Track A's `options` suite and `options-env.lua` are already here.

## Decisions (Krowi, 2026-10-25, at this plan's questions)
1. **Show me closes the options window.** The feature then opens on its own. `/kaf`, the minimap icon or the filter menu reopen the window on the same section.
2. **Criteria on units** (switched off since 99.6, won't fix, `docs/codebase-analysis.md:665`): its help says in one line that the feature is off for now and its options change nothing. No picture, no Show me.
3. **No minimap map button to click** (another addon replaced the minimap): no map opens. The pane says "Press <key> to open your map", with the player's own `TOGGLEWORLDMAP` key, so no addon code touches the map.
4. **One key per line.**
   - All lines are pre-translated into every language, so translators only verify if they want.
   - The refactor does not involve them directly: nothing asks them to translate.

## The seam, as this track fills it
`Options/Window/Help/Help.lua` fills the table nil-safely, so it does not depend on load order:

```lua
addon.Options.Window = addon.Options.Window or {}
addon.Options.Window.Help = addon.Options.Window.Help or {}
```

Each entry has this shape:

```lua
Help[sectionId] = {
    Title = L["..."],
    Blocks = {
        {Heading = text},
        {Text = text},
        {Term = text, Text = text},   -- Term may be an icon (|T...|t) or a coloured word, set in code
        {Picture = "Interface/AddOns/Krowi_AchievementFilter/Media/Help/<Name>", Width = w, Height = h, TexCoords = {0, r, 0, b}},
    },
    ShowMe = function() end,                    -- optional; the pane closes the window first, then calls it
    ShowMeSecure = function(button, close) end, -- maps only; returns false when it cannot lay its button
    ShowMeNote = function() return text end,    -- maps only; shown instead of the button when ShowMeSecure returns false
}
```

**What Track A's pane must honour**, agreed with that session before building (Order of work, step 2):
- **`TexCoords` on a picture.** The pictures are padded to powers of two like the old ones (every `Media/*.tga` is; `Krowi_Tutorials.lua:346-359` computes the same coordinates). `Width` and `Height` are the natural size in UI units; the pane scales a picture down to its width.
- **The Show me rule (decision 1).** The pane closes the window, then calls `ShowMe()`.
- **For `maps`:**
  - the pane calls `ShowMeSecure(button, close)` each time it shows its Show me button;
  - on `false`, it hides the button and shows `ShowMeNote()`.

All 23 ids from plan.md step 4 get an entry: `overview tabs window categories summary achievements filters search tooltips rightclick popout rewards guides calendar maps criteria events eventlist keys plugins profiles advanced about`.

## The texts and their strings
- **Source.** The middle-ground blocks of `MockupSpec.ps1`, edited only where they would be wrong in the window:
  - "below" becomes "here", because the options sit beside the text;
  - no version numbers inside a translated string (`eventlist`'s "New in 104.0" goes; the New mark says it);
  - About's version and author come from `addon.Metadata` (`Libs/Krowi_Util/MetaData.lua:26-38`) through a format string;
  - `criteria` becomes the one line of decision 2.
- **Icons and colours in code.** The tooltip icons are the textures the tooltip uses: `|T136814:0|t` completed, `|T136815:0|t` not completed, `|T136813:0|t` no longer obtainable (`Gui/AchievementTooltip/AchievementTooltip.lua:7-36`). The colour terms use `addon.Util.Colors`. Neither is ever part of a translation.
- **Keys (decision 4).**
  - A term reuses the label the player already sees in game, translated already: `Completed`, `Not Completed`, `Obtainable`, `Faction`, `Collapse Chain`, `Earned By`, `Account`, `Wowhead`, `Go to`, `Xu-Fu's Pet Guides`, `More`, `Current Zone`, `Selected Zone`, `Watch List`, `Excluded`, `Summary`, the tab names and more.
  - Only the sentences are new keys, named `Help <Section> <Part>` (for example `Help Tabs Intro`): about 110 short single lines.
  - This departs from the intent's "about 22 strings". The old tutorial's multi-line strings came back from CurseForge flattened onto one line in ruRU and koKR (`ruRU.lua:124,534`, `koKR.lua:111`).
- **Locales.**
  - The keys go below `Exported at` in `enUS.lua`, and in each of the ten other main locale files (`deDE esES esMX frFR itIT koKR ptBR ruRU zhCN zhTW`), translated.
  - **Keeping them through the next CurseForge import,** which replaces everything below `AUTOGENTOKEN`:
    - first `krowi:localization`'s read-only report must show no translations waiting on CurseForge;
    - then, on Krowi's go, `-Export` for enUS and `-Export -Language <lang>` for each language. That replaces CurseForge's text for every phrase in that file, which is why the report has to be clean first.
  - The skill's "translated files come from CurseForge" then holds again.
  - Track A's interface strings can go in the same export.

## The pictures
All are cut from screenshots of the live game on Retail: one set for both clients, like the old tutorial. The old `.tga` files stay until Track A removes them.

| Picture | Section | Scene | Cut out |
|---|---|---|---|
| `NewTabs` | tabs | achievement window on Expansions | the tab strip |
| `Window` | window | achievement window | the window, scaled down |
| `CategoryTree` | categories | Expansions, current expansion expanded | the category list |
| `SummaryBars` | summary | Expansions summary | the progress bars |
| `CompactList` | achievements | a category, Compact on for the run | the achievement list |
| `Colors` | achievements | four rows: earned, earned no longer obtainable, not earned no longer obtainable, account-wide | four row crops stacked |
| `FilterMenu` | filters | the filter menu open | the menu |
| `SearchBox` | search | a search typed, with its preview | the field and preview |
| `TipAchievement`, `TipEarnedBy` | tooltips | the tooltip of an achievement in a chain | the tooltip; its Earned By part |
| `TipCategory` | tooltips | a category's tooltip | the tooltip |
| `TipPoints` | tooltips | the header points tooltip | the tooltip |
| `MenuMain`, `MenuGoTo` | rightclick | the right-click menu; Go To (waits for Krowi's hover) | each menu |
| `PopOut` | popout | an achievement popped out | the Pop Out |
| `RewardPreview` | rewards | the preview of a mount achievement | the preview |
| `GuidePanel` | guides (Retail) | the guide of 60962, Legendary Research of the Ebon Blade | the panel |
| `CalendarDays` | calendar | a month with achievements, a day selected | calendar and side window |
| `MapButton` | maps | Krowi opens the map with M and hovers the button | button and tooltip |
| `Reminders` | events | placeholder pop-ups | the pop-ups |

No picture for `overview`, `criteria`, `eventlist`, `keys`, `plugins`, `profiles`, `advanced` and `about`.

### `/kaftest pictures` (`Tests/Pictures.lua`, game only)
Built on the `tracking` suite's step machine (`Tests/Tracking.lua:171-571`): `{Name, Text, Run, Check}` steps on `C_Timer.After` with a run token, a banner, and `Screenshot()` with the runner's `Screenshot = {Time}` record, which `Read-GameTests.ps1` pairs with its file.

Each step:
- builds its scene through the section's Show me scene function, so the run proves every Show me in game;
- checks the expected frame shows (a `GameOnly` line);
- records the rectangles to cut out;
- takes the screenshot.

Steps run 3 s apart, because the files are named by the second. The rest of the run:
- **Backdrop.** A black backdrop on `UIParent` at `BACKGROUND` strata, as Screenshot Mode does (`Options/General.lua:109-134`). The banner sits at the top of the screen, outside every cut.
- **Rectangles.**
  - In screen pixels: frame edges times `GetEffectiveScale()` times the `GetPhysicalScreenSize()` height / 768.
  - The natural size is also recorded in `UIParent` units.
  - Both go into `KrowiAF_DebugTable.Pictures`, the last 5 runs with build, client, screen size and UI scale; that saved variable is already declared.
- **Mouse steps** (`MenuGoTo`, `MapButton`): an instruction in the banner, then up to 30 s for Krowi, else SKIP. The run never clicks, hovers or opens the map.
- **Put back:**
  - the Compact option;
  - windows, menus, search text, selected tab and category;
  - Pop Outs (closed with `:Close(id)`, so a persisted one is not saved).
- **Last steps.**
  - The addon's Lua errors of the session, from BugGrabber (`Tracking.lua:410-427`).
  - `screenshotFormat` and `screenshotQuality` are read, never set. Below 8 an observation asks Krowi to type `/console screenshotQuality 10` in game.
- **Guards.** Combat stops the run. The Ready check waits for `addon.Data.IsLoaded`.

### `.claude/tools/Make-HelpPictures.ps1`
Turns the newest pictures run into `Media/Help/<Name>.tga` and a generated `Options/Window/Help/Pictures.lua` (name -> `Width`, `Height`, `TexCoords`).

Reading the run:
- It finds the saved variables and screenshots as `Read-GameTests.ps1:45-55,72-99` does.
- It reads the records with a small `.claude/tools/headless/read-pictures.lua` on the kit's Lua.

Making each picture:
- Loads jpg or png through System.Drawing, tga through `Convert-Tga.ps1`'s reader.
- Rescales the rectangle when the screenshot differs from the recorded screen.
- Cuts it out, stacking `Colors`' parts.
- Scales the longest side to at most `-MaxSide`, 512 by default.
- Applies the soft edge (`Crop-Pictures.ps1`'s curve, `-Fade` 18).
- Pads to powers of two with transparency.
- Writes a 32-bit RLE TGA, type 10, with the old files' header layout.

Options: `-Preview <dir>` writes PNGs too (the Read tool cannot open TGA), `-Only <names>`, `-WhatIf`. It writes CRLF, without a BOM and without a final newline.

## Show me
`ShowMe.lua` holds one scene function per section, shared with `/kaftest pictures`.

Rules for every scene:
- It returns early in combat; Track A greys the button there too.
- It loads `Blizzard_AchievementUI` the addon's way first (`Api/API.lua:64`).
- It needs `addon.Data.IsLoaded`.
- It uses only the entry points the key bindings, minimap icon and menus already use. None calls `ShowUIPanel` or draws on `GameTooltip`.

| Section | The player sees | Through |
|---|---|---|
| tabs | the achievement window on Expansions | `KrowiAF_ToggleAchievementFrame(addonName, "Expansions", nil, true)` (`Api/API.lua:125`, `Gui/Gui.lua:200-232`) |
| window | the window as the minimap icon opens it | the icon's left-click path (`Icon.lua:9-16`) |
| categories | Expansions at the current expansion | `KrowiAF_SelectCategory` on the last child of `addon.Tabs.Expansions.Categories` that is neither `HasFlexibleData` nor `IsSummary` (`Api/API.lua:87-123`) |
| summary | the Expansions summary | `KrowiAF_SelectCategory(addon.Tabs.Expansions.Categories[1])` |
| achievements | the window on an earned achievement | `KrowiAF_SelectAchievementFromID`, skipping one without a category (it errors at `API.lua:54`) |
| filters | the filter menu open | Retail: `KrowiAF_AchievementFrameFilterButton:OpenMenu()`; Mists: `button.menuBuilder:Show(button, 96, 15)` (`FilterButtonMixin.lua:36-50`) |
| search | the cursor in the search field | `KrowiAF_SearchBoxFrame:SetFocus()` on an addon tab |
| tooltips | an achievement's tooltip beside its row | `row:ShowTooltip()` on its row, drawn on `Krowi_Tooltip` (`AchievementButtonMixin.lua:655-660`) |
| rightclick | the selected achievement's right-click menu, at the cursor | `addon.Gui.RightClickMenu.AchievementMenu:Open(row, achievement)` |
| popout | the tracked achievement, else the selected one, popped out | `addon.Gui.AchievementPopout:Open(achievement)` |
| rewards | a mount achievement's preview, pinned to its row | `addon.Gui.RewardPreview:TogglePin(row, id)` where `HasPreviewableEntries(id)` |
| guides (Retail) | the guide of 60962, pinned to its row | `addon.Gui.Guide.Panel:TogglePin(row, achievement)` |
| calendar | the achievement calendar | `KrowiAF_AchievementCalendarFrame:Show()`, the header button's own OnClick |
| maps | the world map | the secure route below |
| events | placeholder reminders where yours appear | `addon.Gui.EventReminderAlertSystem:AddAlert` on copies of the events. The Location button's `PopUpsShowPlaceholderFunc` (`Options/EventReminders.lua:117-135`) writes onto the real events; that is not repeated here. With reminders off at login it says so in chat. |
| eventlist | a placeholder reminder for each event you have on | the same, for the events on in `EventReminders.*Events` |

No Show me for `overview`, `criteria`, `keys`, `plugins`, `profiles`, `advanced` and `about`.

### The map's secure route (spec, decision 9)
- **The delegate.** Retail's `MinimapCluster.ZoneTextButton` and Mists' `MiniMapWorldMapButton` call `ToggleWorldMap()` on click (`wow-ui-source/live/.../Blizzard_Minimap/Mainline/Minimap.lua:138-140`, `classic/.../Blizzard_Minimap/Classic/Minimap.xml:243-271`).
- **The button.** `ShowMeSecure(button, close)` creates once, out of combat, a `SecureActionButtonTemplate` button on `UIParent`:
  - `type = "click"`, `clickbutton` = that delegate, `useOnKeyDown = false`, registered for `LeftButtonUp`;
  - `SECURE_ACTIONS.click` calls `delegate:Click()` from secure code (`live/.../Blizzard_FrameXML/SecureTemplates.lua:560-567`, `classic/...:554-561`);
  - `useOnKeyDown = false` makes it act on mouse-up whatever the player's CVar (`:796-814`).
- **Laid over the pane's button.**
  - `SetAllPoints` on the pane's Show me button, at its strata and a higher level; never parented to the window.
  - Hovering lights the pane's button.
  - `PostClick` calls `close()` (decision 1).
  - It hides with the pane's button through a one-time `HookScript("OnHide")`.
  - `PLAYER_REGEN_DISABLED`, registered only while laid over, lets go and hides it before the lockdown starts, so nothing of the window becomes anchor-protected in combat.
- **No delegate** (missing, or `HasAccessConstraints`): it returns `false`, and `ShowMeNote()` gives "Press <key> to open your map" from `GetBindingKey("TOGGLEWORLDMAP")` (decision 3).

## Files that change
- **New, `Options/Window/Help/`:** this track's own folder, so no file is shared with Track A.
  - `Files.xml`;
  - `Help.lua`;
  - `ShowMe.lua`;
  - `Pictures.lua`, generated.
- **`Options/Files.xml`:** `<Include file="Window\Help\Files.xml" />` after `Credits.lua`. Once Track A's `Options/Window/Files.xml` includes `Help\Files.xml`, this line goes at the merge.
- **New `Media/Help/*.tga`:** 22 pictures, about 0.5 MB each. The old 15 TGAs (12.9 MB) leave with the tutorial.
- **`Localization/*.lua`:** the 11 main locale files, below `Exported at`.
- **Tests:**
  - `Tests/Help.lua`, `Tests/Pictures.lua`;
  - `Tests/Files.xml`;
  - `Tests/README.md`, two rows;
  - `.claude/tools/headless/run-tests.lua`, `suites.help` modelled on `suites.options:1583-1598`;
  - the suite list in `.github/copilot-instructions.md`.
- **Tools:** `.claude/tools/Make-HelpPictures.ps1`, `.claude/tools/headless/read-pictures.lua`, rows in `.claude/tools/README.md`.
- **`.claude/tools/Check-Repo.jobs`:** a `-` line for `ShowMe.lua`'s `PLAYER_REGEN_DISABLED`, registered only while the map's button is laid over the pane.
- **`docs/work/2026-10-25-options-revamp/plan-help.md`:** this plan.
- **Not touched:** Track A's files, the tutorial, and `_Packaging/Changelog.md`, whose lines come with Track A's close.

## The suite `help` (test first)
`Tests/Help.lua`, written in the `Observe`/`Recorded`/`Target` form of `Tests/Options.lua`. It runs headlessly on `options-env.lua`'s whole-addon load, and in game.

| Scenario | Checks | Recorded first | Target |
|---|---|---|---|
| `sections` | the entries are exactly the 23 ids | `entries=0` | `entries=23 missing=none extra=none` |
| `blocks` | each block has one kind; no string is an unresolved key | `bad=0 unresolved=0` | same |
| `pictures` | each picture has its size in `Pictures.lua` and its file in `Media/Help` (headless on disk; in game `SetTexture` returns true) | `missing=0` | same |
| `show-me` | the sections with a Show me | `none` | the 16 feature sections; `guides` Retail only |
| `map-agrees` | every section of Track A's map has help, once `Map.lua` exists | `no map` | `agrees` |

## Order of work
1. **Plan.** `plan-help.md` is this plan, set to accepted. Commit: `docs(work): help-track plan for 2026-10-25-options-revamp`.
2. **Coordination.** A message to Track A's session (found through `ListAgents`, or Krowi names it) covering:
   - this track owns `Options/Window/Help/`;
   - Track A's `Options/Window/Files.xml` includes `Help\Files.xml`;
   - the seam points the pane must honour.
3. **Test first.**
   - `Tests/Help.lua` recording the empty seam;
   - `suites.help`;
   - the registrations;
   - headless runs on both clients.
   - Commit: `test: help suite records the empty help seam`.
4. **Texts.**
   - `Help.lua`;
   - the enUS keys, then the ten translated locales;
   - `sections` and `blocks` to target.
   - Commit: `feat: help texts for every options section`.
5. **Show me.**
   - `ShowMe.lua`, with the secure map button;
   - the jobs line;
   - `show-me` to target;
   - `krowi:taint-reviewer`.
   - Commit: `feat: Show me for every feature section`.
6. **The pictures run.**
   - `Tests/Pictures.lua`;
   - `Deploy.ps1 -WhatIf`, then deploy to Retail, naming anything another session's deploy put there;
   - Krowi: `/kaftest pictures`, mouse steps on the banner's cue, then `/reload`;
   - `Read-GameTests.ps1`, `Read-GameErrors.ps1`;
   - then Mists, as its Show me check.
   - Commit: `test: pictures run builds every Show me scene and records what to cut`.
7. **The pictures.**
   - The tool and `read-pictures.lua`;
   - `Media/Help/*.tga` and `Pictures.lua`, with PNG previews in the scratchpad that I look at, and Krowi in game;
   - `pictures` to target.
   - Commit: `feat: help pictures from the pictures run`.
8. **Strings to CurseForge.** `krowi:localization`'s report, then the exports on Krowi's go (see Locales).
9. **Close.**
   - `/code-review`, `Check-Repo.ps1`, `Find-DeprecatedApi.ps1` on the changed files;
   - `plan-help.md` brought up to date, status `done`;
   - push, then a PR into `feature/2026-10-25-options-revamp`.

## Risks
- **The pane is Track A's and may not exist yet.** Until it does, the proof is:
  - the `help` suite;
  - the pictures run;
  - the previews.
  Length and look in the real pane are checked once both tracks are on the revamp branch.
- **The secure overlay is new to KAF.** It is argued from Blizzard's source. It needs Krowi's clicks: Show me on maps opens the map; combat with the maps section open, then moving and closing the window, gives no `ADDON_ACTION_BLOCKED`.
- **The pictures depend on Krowi's character:**
  - all four `Colors` states;
  - a mount reward;
  - a chain.
  A missing state is a SKIP, and that picture waits for a character that has it.
- **Screenshot quality.** The default jpg quality 3 blurs text. The run asks for 10 and records what it got.
- **The per-language export overwrites CurseForge's text for each phrase.** It runs only after a clean report.
- **Merge with Track A.** These are line-level conflicts, resolved at the merge into the revamp branch:
  - the `Options/Files.xml` include;
  - neighbouring `suites.*` blocks in `run-tests.lua`;
  - keys added below `Exported at` in the locale files.

## Proof
- **Headless:**
  - `run-tests.lua $PWD help` passes on Retail and Classic with `Recorded` = `Target`, except `map-agrees` until Track A's map exists;
  - `options` passes as on the base branch;
  - `Check-Repo.ps1` is clean;
  - `Find-DeprecatedApi.ps1` is clean.
- **In game, Retail then Mists:**
  - `/kaftest pictures`: every step PASSes, or SKIPs with its reason;
  - `Read-GameErrors.ps1`: no new row;
  - Krowi's clicks on the map's Show me: as in Risks.
- **Pictures:** the previews, then the real pane.
- **Review:** `krowi:taint-reviewer` and `/code-review`.

## Where the build departed
- **The seam with Track A** (agreed with that session on 2026-10-25):
  - the map is read as `addon.Options.Window.Map.Sections[i].Id`;
  - the pane calls `ShowMeSecure(button, close)` on every refresh of the maps help, its own `PLAYER_REGEN_DISABLED` and `PLAYER_REGEN_ENABLED` included, and `ShowMeSecure(nil)` on the first draw that is not the maps help (another section, a hover, a collapse, a search, the window hidden). The pane reuses one Show me button for every section, so the OnHide hook alone would not release the secure button.
  - inside `PLAYER_REGEN_DISABLED` `InCombatLockdown()` is still false, so `ShowMeSecure` also treats `UnitAffectingCombat("player")` as combat, and in combat it returns true (the pane greys its button), not false (the note).
- **The texts follow the game, not the mockup,** where the mockup had aged:
  - the filter menu has Past, Current and Future Obtainable and Always Show Completed (`FilterButtonMixin.lua:150-176`);
  - the header colours are five (orange, blue, green, yellow, red), plus faded for not earned (`Temporarily obtainable Header Colors Desc`), so `Colors` is five rows;
  - the row icons are the extra icons the rows draw (`AchievementButtonExtraIconFactory.lua`).
- **121 keys**, not about 110: the 118 the texts use and 3 for Show me (the map key note, its fallback, reminders off). The tutorial's `Green`, `Red`, `Grey` and `World Map Button` are now also read by the help, so they stay when the tutorial's strings go.
- **19 pictures,** not 22: no `UnitCriteria` (decision 2), and no `MenuGoTo`, since Retail keeps its open menus where addon code cannot read them (the run found `Menu.GetManager().menus` nil); the right-click menu picture shows Go to with its arrow. `CompactList` SKIPs while Compact Achievements is off, because that option needs a `/reload`; the tool takes each picture from the newest run that has it.
- **The tool** has `-SavedVariables` and `-Screenshots` too, for a copied file or a test; it was tested on a synthetic run (an old RLE tutorial TGA as a screenshot, and a picture in two parts).
- **The taint review** (`krowi:taint-reviewer`, 2026-10-25) found the secure map route sound on all three clients (the click reaches `ToggleWorldMap` from `SECURE_ACTIONS.click`; letting go in `PLAYER_REGEN_DISABLED` lifts the anchor restriction, as Blizzard's own action bars do), and three things, fixed:
  - the `search` scene took keyboard focus from an open chat line, which ran its focus-lost handler in the addon's call and tainted `ACTIVE_CHAT_EDIT_BOX`: it focuses the search box only when nothing has focus;
  - a delegate the secure click refuses (`HasAnyForbiddenAspects(ScriptedInput)` on Retail) or that is hidden (Mists hides `MiniMapWorldMapButton` with the group finder off) would close the window and open no map: those now give the note;
  - a raised window could lie over the secure button: the pane button's `OnEnter` lifts it back.
  Left for the game: whether `Click()` works on a hidden delegate (now avoided), and the overlay on a raised window.
- **The secure button is placed by coordinates, not anchored.** The first in-game try (Retail, 2026-10-25) failed with `Action[SetPoint] failed because[Cannot anchor protected frames to regions]` at `SetAllPoints(owner)`: a protected frame cannot anchor to an addon frame at all, not only in combat, so the plan's anchoring was wrong. It is now set against `UIParent` from the pane button's position and size; the window calls `ShowMeSecure` again after a move or resize, and the pane button's `OnEnter` puts it back over when it has drifted. In debug mode the map route reports each change in chat (`Show me, map: ...`).
- **The secure button lies in `DIALOG` strata.** The window is a toplevel `HIGH` frame, so every click in it raised it, and its Show me button, over a secure button laid in the same strata; the mouse never reached the secure one (Track A's diagnosis, confirmed in game: "Show me worked").
- **`.luarc.json`** lists the frames the new files read that the language server cannot see: `KrowiAF_GuidePanel`, `KrowiAF_SearchPreviewContainer`, `Krowi_ProgressBarTooltip`, `MiniMapWorldMapButton`.
- **The pictures run grew with Krowi's runs on Retail (2026-10-25, 17:16 to 21:36):**
  - the black backdrop moves, per screenshot, right under the lowest of the frames the picture shows, and drops back under everything between steps (a backdrop left high covered the map at the last step); the rest of the interface is black around and behind a picture, also behind translucent frames (Krowi: "everything should be black");
  - each step first closes what the step before left open; debug mode's tooltip lines are off for the run (in memory only); the header colour options the colour rows need are on for the run, with the player's values kept in `KrowiAF_DebugTable.PicturesRestore` until they are back, also after a `/reload` mid-run;
  - the calendar is shot with the achievement window closed, the guide with the reminder buttons beside the window hidden (they are alert frames in `DIALOG`, over the `HIGH` panel); tall frames are cut to their top; Earned By from its first to its last line; the reminders to three; the summary from its Progress Overview header;
  - each picture is saved as it is taken, so a `/reload` mid-run keeps the rest; `/kaftest pictures <name or number>` redoes one picture (the shared runner `Tests/Tests.lua` now hands what follows a suite's name to the suite);
  - the run refuses to start while a menu is open, instead of closing it.
- **Pictures up to 1024 px** (the plan said 512): Krowi found them too small in the 328-unit pane, and Track A added the mockup's click-to-enlarge lightbox (`a0c76aa0`), which needs the full resolution. The 19 pictures come to about 11 MB; the old tutorial's 15 TGAs (12.9 MB) leave with the tutorial.
- **The code review** (`/code-review` on the branch, 2026-10-25) and a second taint review found no taint. Fixed: settings left changed by a `/reload` mid-run (above); Collapse Chain swapping the picked achievement in the scenes and colour rows; the reward preview and guide guards on a reused row; placeholders queued beyond the free places; the secure button giving up when the pane's button had no position yet (it keeps its owner and retries) and staying shown when combat refused its release (it lets go once combat ends); a single colour row rebuilding the whole picture from one part. Passed to Track A: its search matches the icon and colour escapes in the terms; its `OnShow` should call `UpdateShowMe` after an Alt+Z re-show.
- **Deferred, listed in the PR:**
  - the secure button in `DIALOG` is an invisible click target above any `HIGH` window opened over the pane's bottom-left corner while the maps help shows;
  - a scene that finds nothing to show (a new character, data still loading) closes the options window and shows nothing;
  - the pictures run closes the achievement window at the end instead of restoring its tab and selection;
  - the headless `help` suite loads the whole addon a second time instead of sharing the `options` suite's load;
  - the step machine is the third copy of the one in `Tests/Tracking.lua`;
  - the reward scene's search reads every achievement's reward data.
- **Not done in game:** the Mists pictures run (the Show me scenes on Mists), and the combat check with the maps section open; the map's Show me was confirmed on Retail.