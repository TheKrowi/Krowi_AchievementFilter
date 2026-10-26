# Spec: Zygor's guide icons do not show on the addon's achievement rows
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. With Zygor loaded on Retail, every row of the addon's achievement list whose achievement has a Zygor guide shows Zygor's icon from the list's first draw in a session, however the window was opened: Blizzard's Toggle Achievements binding followed by a click on one of the addon's tabs, the addon's tab bindings, the micro button, the minimap or broker icon, a toast, a chat link, the objective tracker.
2. The plugin draws the icons the way Zygor draws them on Blizzard's list, from Zygor's own icon pool, and follows the list on every redraw: scroll, category change, filter change, search, an earn.
3. Clicking an icon opens the guide in Zygor's viewer, as today.
4. Without Zygor, or with a Zygor build that lacks its achievement module, the plugin does nothing and raises no error.
5. The addon changes no Blizzard frame or function; no new taint.
6. The fix leaves a scenario behind (Verification).

## Root cause
One defect in when the plugin starts; a second one, suspected from the code, does not show in game.

**1. The plugin starts only on the addon's own toggle.** On Zygor's `ADDON_LOADED` the plugin post-hooks `KrowiAF_ToggleAchievementFrame` (`Plugins/ZygorGuidesViewer.lua:64-70`). The hook, `IconSetup` (`:52-62`), builds Zygor's guide list (`ZGV.Achievement:IconSetup()`) and hooks the addon's list `KrowiAF_AchievementsFrame.ScrollBox` `Update` once. Which ways of opening the window call that toggle:
- The addon's tab bindings (`Bindings.xml`), the micro button (`Globals.lua:330-343`) and the minimap icon (`Icon.lua:11`) do.
- A toast, a chat link and the objective tracker do too: Blizzard's `ShowAchievementFrameForAchievement` (`wow-ui-source/live/.../Blizzard_AchievementUI_Bootstrap.lua:19-25`) calls the addon's `AchievementFrame_SelectAchievement` (`Gui/BlizzardOverrides.lua`), which goes through `KrowiAF_SelectCategory` to the toggle (`Api/API.lua:91`).
- Blizzard's Toggle Achievements binding does not. `ToggleAchievementFrame` (`Blizzard_AchievementUI_Bootstrap.lua:13-17`) calls the addon's `AchievementFrame_ToggleAchievementFrame` (`Gui/BlizzardOverrides.lua:33-49`), which opens Blizzard's own Achievements tab, and a click on one of the addon's tabs runs `ShowSubFrames` (`AchievementFrameTabButtonMixin.lua:10-29`), not the toggle.

So a player whose Y still runs Blizzard's binding sees Zygor's icons on Blizzard's list (Zygor hooks `ToggleAchievementFrame` itself, `Code-Retail/Achievement.lua:10-12`) and none on the addon's tabs, for the whole session, unless they happen to use the micro button or a toast. The first-run switch of Y to the addon's binding (`Gui/Gui.lua:354`, `:376-378`) is often not in effect (issue #197): on two of the maintainer's accounts it is marked done while Y still runs Blizzard's binding. On Doomhammer, where Zygor and the addon are both enabled, account `#3` (Krowidhone) is such an account.

**2. Suspected, not reproduced: the first draw on the addon's toggle.** The hook is a post-hook: `gui:ToggleAchievementFrame` (`Gui/Gui.lua:200-232`) has already shown the tab and drawn its rows (`ShowSubFrames` → `KrowiAF_AchievementsFrame:Update()` → `ScrollBox:SetDataProvider` → `ScrollBoxListMixin:Update`, `wow-ui-source/live/.../Shared/Scroll/ScrollBox.lua:703-725`, `:762-798`) when `IconSetup` hooks `Update`. In game the rows still got their icons a frame later (before-run below). The likely reason: a row that changes size makes the list queue a full update for the next frame (`ScrollUtil.AddResizableChildrenBehavior`, `wow-ui-source/live/.../Shared/Scroll/ScrollUtil.lua:1594-1603`, added at `AchievementsFrameMixin.lua:23`), and the plugin's hook catches that. Besides, the first toggle of a session shows the tab's Summary, so the list's first draw usually comes later anyway.

**Not in scope, by the decision: Zygor's shared icon pool.** The plugin takes its icons from `ZGV.SearchIconPool` (`Plugins/ZygorGuidesViewer.lua:24`, `:41`), the pool Zygor itself shares between Blizzard's achievement list (`Code-Retail/Achievement.lua:33-38`), the Pet Journal (`Code-Retail/PetBattle.lua:1109-1114`) and the Mount Journal (`CreatureDetector.lua:250-255`). Each redraw calls `ReleaseAll` on it first, so each clears the others' icons until they redraw:
- Blizzard's list refills on an earn even while hidden (`wow-ui-source/live/.../Mainline/Blizzard_AchievementUI.lua:972-978`, `:936-937`), so the addon's rows lose their icons until the addon's own refresh one second later (`AchievementsFrameMixin.lua:95-100`).
- Scrolling the addon's list clears Zygor's icons in an open Pet or Mount Journal, and the other way round.

That is Zygor's own design, which the plugin follows; it is temporary on the addon's rows, so it does not explain icons that never appear.

**Ruled out:** Zygor's guide list is complete when `IconSetup` first runs, since each guide file passes `achieveid` in the header it registers at load (`ZygorGuidesViewer.lua:4471-4497`, e.g. `ZygorAchievementsCommonTWW.lua:5-7`). The fields the plugin reads exist: the view's frames (`ScrollBoxView.lua:59`, `:118`), the rows' `Header` and `Shield` (`AchievementButton.xml:102`, `:256`), Zygor's `ZygorSearchButton` template (`Templates.xml:219`). BugGrabber holds no Zygor or plugin error.

**Reproduction:** the in-game before-run of the `plugins` suite (Retail 12.1.5, Zygor 9.6, a Doomhammer character, right after a `/reload`, 2026-10-26):
- Opened as Blizzard's binding does, then the Expansions tab (Pet Battles > Collect): 0 of the 13 rows with a Zygor guide showed the icon (`none`). This is the report.
- Opened through the addon's toggle, then the Achievements tab (the same category): 13 of 13 (`all`).
- The screenshots show the same, and BugGrabber recorded no error from the addon.

## Design
The plugin sets up when the addon's list is loaded, not when the window is first toggled, so its redraw hook is in place before the list's first draw. The drawing itself (`UpdateIcon`, `UpdateIcons`, `ScheduleUpdate`, Zygor's pool) stays as it is.

- **Set up on load.** Setup is today's `IconSetup` body: Zygor's guide list (`ZGV.Achievement:IconSetup()`), Zygor's pool, and the post-hook on the list's `ScrollBox` `Update`. It runs once, as soon as both Zygor and the addon's list exist. Every draw of the list after that, the first one included, schedules `UpdateIcons`, whatever opened the window (requirement 1). The post-hook on `KrowiAF_ToggleAchievementFrame` goes.
- **Knowing when the list exists.** `KrowiAF_AchievementsFrame` is made when `Blizzard_AchievementUI` loads (`Gui/WindowFrames/AchievementsFrame/AchievementsFrame.lua:6`, from `Gui/Gui.lua:106`), usually on the first open of the window, long after Zygor loaded. The plugin's own `ADDON_LOADED` for `Blizzard_AchievementUI` may run before the addon's handler has made the frame (two event frames, no defined order), so the plugin API gets a second lifecycle call next to `LoadPlugins`: `KrowiAF.PluginsApi:LoadPluginsWithBlizzard_AchievementUI()`, called at the end of `LoadBlizzard_AchievementUI` (`Krowi_AchievementFilter.lua:55-69`), which calls `plugin:LoadWithBlizzard_AchievementUI()` where a plugin has one. The Zygor plugin sets up from whichever comes last: Zygor's `ADDON_LOADED` (when the list already exists) or that call (when Zygor is already loaded). Nobody can open the window before login, so the hook is always in before the first draw.
- **Guard:** setup runs only when `ZGV.Achievement` has `IconSetup` and its guide list (requirement 4).

Considered and not chosen: setting up on the first `OnShow` of the addon's list (also works, but the maintainer asked for the buttons on load), hooking `OnShow` of Blizzard's `AchievementFrame` (it shows before the tab is chosen, and on Blizzard's own tabs), and post-hooking the addon's internal `gui:LoadWithBlizzard_AchievementUI` from the plugin (works, but couples a plugin to a loader's name; the plugin API call is the documented seam).

## Options considered
For a Retail player with Zygor, per what they see:
- **1. Set up on load and follow Zygor's drawing (chosen).** The magnifying glass is on every row with a Zygor guide from the first open of the session, whichever key, button, toast or link opened the window, including Y on Blizzard's binding. The icons behave as Zygor's own do on Blizzard's list: they blink out for about a second after an earn, and the addon's list and an open Pet or Mount Journal clear each other's icons until they redraw. Mists and the other clients: no change.
- **2. The same, with the plugin's own icon pool.** Also stops the blink and the clearing between the addon's list and the journals. Not chosen: a plugin brings another addon into KAF and follows its drawing; it does not fix that addon.
- **Not offered: draw at once but keep starting on the addon's toggle.** It fixes only the first-draw gap; a player whose Y runs Blizzard's binding still never sees the icons, which is the likely case of the report.

## Areas of concern
- **Taint and secret values:** the plugin hooks only the addon's own list (`KrowiAF_AchievementsFrame.ScrollBox` `Update`), as it does today. `ZGV.Achievement:IconSetup()` hooks Blizzard's list's `ScrollBox` with `hooksecurefunc` from addon code, as today, now inside the addon's `Blizzard_AchievementUI` load instead of its toggle; Zygor does the same from its own `ToggleAchievementFrame` hook. Zygor's icons are parented to the addon's rows, as today. No secret-value API. `krowi:taint-reviewer` runs on the diff.
- **Clients:** `## Interface: 120105, 50504, 38002`. The plugin loads on every client. Zygor's achievement icons are Retail code (`Code-Retail/Achievement.lua`). The Mists install here has unreadable `.toc` files (binary content), so Zygor does not load there and Mists cannot be checked in game; the guard keeps the plugin silent wherever `ZGV.Achievement` is missing.
- **Blizzard API changes:** none.
- **Other addons, plugins and skins:** Zygor 9.6's own icons on Blizzard's list, the Pet Journal and the Mount Journal are unchanged. ElvUI and GW2_UI skin the rows; the icon sits at the row's top right as today.
- **Plugin API:** one new optional lifecycle call (`LoadWithBlizzard_AchievementUI`); plugins without it are unaffected.
- **Saved variables and migrations:** none.
- **Localization:** none; the tooltip text is Zygor's own (`achieveframe_button`).
- **Embedded libraries:** none.
- **Data snapshots:** none.
- **Background jobs:** none; the redraw runs from the list's `Update`, which runs only while the window is used.
- **Player-facing text:** one changelog line under the next version, `### Fixed`.

## Verification
- **A new `plugins` suite** (`Tests/Plugins.lua`, headless model in `run-tests.lua`); details in the plan. Each scenario opens the window on a category holding an achievement with a Zygor guide and records how many of its visible rows with a guide show the icon (`all`, `some`, `none`):
  - `zygor-blizzard-binding`: the list's first draw of the session, opened the way Blizzard's Toggle Achievements binding does, then a click on the Expansions tab. Recorded `none`, Target `all`.
  - `zygor-addon-binding`: opened through `KrowiAF_ToggleAchievementFrame` while the plugin has not drawn yet. Recorded `all` (the before-run; the headless model was given the list's queued update), Target `all`: a guard that the toggle keeps its icons.
  - In game the scenarios SKIP when the window was already opened in the session (`Blizzard_AchievementUI` loaded before the run), and the whole suite SKIPs without Zygor's achievement module.
- Headlessly: the suite and `Check-Repo.ps1 -ChangedOnly`. In game on Retail, on Doomhammer (`#1` and `#3`): the before-run matches Recorded, the after-run Target; then opening with Y on each account and looking at the rows, `Read-GameTests.ps1`, `Read-GameErrors.ps1`.
- `krowi:taint-reviewer` and `/code-review` on the diff.

## Decision
Krowi, 2026-10-26, at the design gate (intent accepted with it):
- **Option 1:** set up on load and follow Zygor's drawing, with Zygor's own pool. In Krowi's words: "KAF should just show the buttons on load and should follow that addon's drawing. plugins are meant to incorporate addons in KAF, not to fix addons".