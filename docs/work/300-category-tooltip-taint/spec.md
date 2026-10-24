# Spec: Secret number errors when a tooltip closes after using the achievement window
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. On Retail, hovering a category on Blizzard's Guild tab or Blizzard's Achievements tab in KAF's window shows no tooltip on `GameTooltip`, so the hover no longer has KAF-tainted execution write a Lua field of `GameTooltip` or its widget container. The taint probe records no `statusBarPool` or `GameTooltip.widgetContainer` detection by KAF for that hover and a widget tooltip after it. (Narrowed to the hover on 2026-10-24 after the taint review. The review thought Blizzard's leave handler on those buttons might still run tainted; the in-game observation found their `OnLeave` secure. The window's other leave handlers are in `docs/backlog.md`.)
2. The tooltip still shows the category's name and its completed and total count as a bar with the `completed/total` text, next to the button, and hides when the mouse leaves the button or the window closes.
3. Feat of Strength categories and the Statistics tab keep Blizzard's tooltips.
4. Mists Classic and Titan Reforged are unchanged.
5. With the ElvUI, GW2_UI or EllesmereUI plugin, the tooltip is skinned like KAF's own category tooltips.
6. Hiding the tooltip runs only when the mouse leaves its button, with no work per frame.
7. A scenario records which tooltip a Blizzard category button shows, before and after the fix.

## Root cause
The error is Blizzard's widget layout comparing a secret value while running tainted. KAF taints it in three steps:

1. **Blizzard's tab code runs tainted.** A player's click on Blizzard's Guild tab runs Blizzard's own `OnClick` (Blizzard_AchievementUI.xml:2569, wow-ui-source live), which reads two values KAF wrote:
   - the global `AchievementFrameTab_OnClick`. KAF rewrites it each time it opens the window (Gui/Gui.lua:206; also Gui/BlizzardOverrides.lua:6 and 36). It is the same value Blizzard's own toggle writes (Blizzard_AchievementUI.lua:221), which KAF replaces (Gui/BlizzardOverrides.lua:4).
   - `AchievementFrame.numTabs`, which `PanelTemplates_UpdateTabs` loops over (SharedUIPanelTemplates.lua:385). KAF raised it when it added its own tabs to Blizzard's strip (Gui/WindowFrames/AchievementFrameTabButtonFactory/AchievementFrameTabButtonFactory.lua:47-62), so the click runs tainted even without the global.

   When KAF itself selects the tab (key bindings, the micro button, Globals.lua:340), it calls Blizzard's tab code from its own `Select` function (Gui/Gui.lua:27-37), with the same result. Either way, `AchievementFrameBaseTab_OnClick(1 or 2)` → `InitAchievementPage` runs tainted (Blizzard_AchievementUI.lua:441-457). Its category list initializer stores `self.Button.showTooltipFunc = AchievementFrameCategory_StatusBarTooltip` as a tainted value on every category button of those two tabs (line 589-594). Gui/BlizzardOverrides.lua:69-72 already notes that Blizzard's achievement frame runs tainted this way. (Corrected at the plan gate on 2026-10-23: the first draft had the player's click going through Gui/Gui.lua:27-37.)
2. **The hover creates a tainted pool on `GameTooltip`.** The button's `OnEnter` reads that field (line 612-616), so `AchievementFrameCategory_StatusBarTooltip` runs tainted (line 777-783). Its `GameTooltip_ShowStatusBar` creates `GameTooltip.statusBarPool` on first use (GameTooltip.lua:521-528). This is the only caller of that function in live FrameXML, and KAF calls neither function itself. A pool that already exists gets its frames acquired tainted instead.
3. **Every later hide runs tainted.** `GameTooltip_OnHide` reads `self.statusBarPool` (GameTooltip.lua:409) two lines before `GameTooltip_ClearWidgetSet` (line 411). Most tooltips have no widget set and nothing shows. The first that has one, such as a map POI or a vignette, runs `UnregisterForWidgetSet` → `UpdateWidgetLayout` (Blizzard_UIWidgetManager.lua:287-295) → `ResizeLayoutMixin:Layout`, whose `self:GetNumPoints() == 0` (LayoutFrame.lua:493) errors when that number is secret. The error comes before `self.widgetSetID = nil` (Blizzard_UIWidgetManager.lua:298), so every later hide repeats it.

Why the number is secret is game state, not KAF. `GetNumPoints` lists no secret aspect in the API docs, so the secret comes from what the tooltip anchored the container to. The original report has it start in combat. Any addon that taints a field `GameTooltip_OnHide` reads before line 411 produces the same stack (CraftSim's `infoList`, read at line 398, in formigao's export), which is why the error is blamed on many addons.

Blizzard's other achievement tooltips call only C methods (`SetOwner`, `SetText`, `AddLine`, `Show`). Both exports confirm that: the tainted category tooltip ran those as well, and the only `GameTooltip` field the probe found tainted was `statusBarPool`.

**Reproduction:**
- Sinrath's export (issue comment, 2026-10-20; KAF 103.0, client 12.1.5.70448, only KAF, BugGrabber and BugSack): `statusBarPool` tainted by KAF at 21:46:48 with the achievement window and the map open, then the widget container's `widgetFrames`, `shownWidgetCount`, `numWidgetsShowing` and `timerWidgets` at 21:46:54.
- The maintainer's own probe session of 2026-10-23 19:57:05 (Krowi-Frostmane, 12.1.5.70529): `statusBarPool` tainted by KAF at 19:57:31 with the window open and the map closed, the same four widget container keys at 19:57:52 with the map open. No error followed, out of combat.

## Design
KAF provides its own `AchievementFrameCategory_StatusBarTooltip` on Retail, set in `addon.OverwriteFunctions` (Gui/BlizzardOverrides.lua) before Blizzard's category list first fills. It draws the tooltip on KAF's progress-bar tooltip (`addon.ProgressBarLib.GameTooltipWithProgressBar`, the library's own `Krowi_ProgressBarTooltip`), the same one KAF's own category buttons use (Gui/Gui.lua:283-302). It shows the button's `name` as the title, and a bar from 0 to `numAchievements` filled to `numCompleted`, with `numCompletedText` as its text. All three are fields Blizzard's initializer already sets on the button (Blizzard_AchievementUI.lua:581, 591-593).

- **Nothing touches `GameTooltip`,** so its fields stay as secure Blizzard code left them, whatever else in the window runs tainted. That meets requirement 1 without changing how KAF drives Blizzard's tabs.
- **Hiding.** Blizzard's `OnLeave` hides only `GameTooltip` (Blizzard_AchievementUI.lua:618-621). So the first time KAF's tooltip shows for a button, KAF adds `HookScript("OnLeave")` to that button, and the hook hides KAF's tooltip while that button owns it. That is the moment Blizzard hides its own tooltip. The buttons are pooled, so a file-local table keeps each from being hooked twice, and nothing is written on the button. A tooltip also hides with its owner, so closing the window hides it.
  - Changed on 2026-10-24, from an `OnUpdate` watcher that polled `IsMouseOver`. The taint review found that the watcher hid one frame late, so it could close a battle pet tooltip that had just opened (a GameTooltipTemplate tooltip's `OnHide` hides `BattlePetTooltip`, GameTooltip.lua:414). It also checked the button's area rather than the mouse focus. See Decision.
- **Skins** reach it through the plugins' existing code for that tooltip (Plugins/ElvUI.lua:54, Plugins/GW2_UI/GW2_UI.lua:241, Plugins/EllesmereUI.lua:312).
- **Not touched:** Feat of Strength categories keep `AchievementFrameCategory_FeatOfStrengthTooltip` (line 585-588). The Statistics tab has no category tooltip (line 595-596). Classic keeps Blizzard's function.

## Options considered
1. **KAF's progress-bar tooltip (recommended).** Category tooltips look the same on every tab, KAF's and Blizzard's, and the skins already cover it. `GameTooltip` is never used. Costs a hide on the button's leave.
2. **A text-only tooltip on `GameTooltip`.** The replacement shows the name and the `completed/total` text with C methods only (`SetOwner`, `SetText`, `AddLine`, `Show`) and no status bar. Smallest code, no watcher, and Blizzard's `OnLeave` hides it. It still runs tainted code on `GameTooltip`, which the two exports show leaves no Lua field behind but which does not rule out a future patch adding one, and the bar is gone.
3. **Stop running Blizzard's tab code from KAF.** KAF stops writing what Blizzard's tab code reads: the global `AchievementFrameTab_OnClick`, and `AchievementFrame.numTabs`, which means its own tabs leave Blizzard's tab strip. It follows tab changes with `hooksecurefunc`. The tooltip looks unchanged and the cause is removed at its root, which could also retire the chat-link workaround (Gui/BlizzardOverrides.lua:69-108). But other tainted writes into Blizzard's frame remain (the summary buttons' ids, the list's element data, same comment), so the frame may still not run secure; it touches the toggle, the micro button and the tab system. Offered as separate work.
4. **Leave it to Blizzard.** The error stack is generic (WoWUIBugs #811), but KAF alone reproduces it, so it stays KAF's to fix.

## Areas of concern
- **Taint and secret values.**
  - The replacement is a new global write of a FrameXML UI function, listed in `.claude/tools/Check-Repo.globals`. Blizzard's initializer reads the global at line 594. So an initializer pass that ran secure now runs tainted from that line on, for the rest of that event dispatch of the achievement frame. One example is `ACHIEVEMENT_EARNED` before the window was ever opened (Blizzard_AchievementUI.lua:936-946, 972-978), whose dispatch then rebuilds the achievement list and the header points. No `GameTooltip` and no protected call are on that path, and the window's first open taints the same state anyway (taint review, 2026-10-24).
  - The hide is a `HookScript("OnLeave")` on Blizzard's category buttons. It is a script hook, not a field write; Blizzard's own handler runs first, and the hook only hides KAF's tooltip. KAF already hooks Blizzard frames this way (Gui/BlizzardOverrides.lua, the filter dropdown).
  - The achievement window has no protected call besides the chat-link telemetry, which is already handled.
  - No secret values are read: the counts come from `AchievementFrame_GetCategoryTotalNumAchievements` and `GetNumCompletedAchievements`.
  - `krowi:taint-reviewer` runs on the diff.
- **Clients.** Retail only, behind `addon.Util.IsMainline`. Mists Classic and Titan Reforged have no secret values and keep Blizzard's tooltip.
- **Blizzard API changes.** `AchievementFrameCategory_StatusBarTooltip` is a global in live; `Find-DeprecatedApi.ps1` runs on the diff. If Blizzard renames it, the override writes a global nothing reads and Blizzard's tooltip returns, together with the bug.
- **Other addons, plugins and skins.** KAF's plugins skin the progress-bar tooltip already. An addon that hooks `AchievementFrameCategory_StatusBarTooltip` itself loses its hook if it hooked before KAF replaced it. ElvUI's own tooltip skin hooks `GameTooltip_ShowStatusBar`, which these buttons no longer call.
- **Saved variables and migrations.** None.
- **Localization.** None: the name and the count text come from Blizzard's button.
- **Embedded libraries.** None changed; Krowi_ProgressBar is used as it is.
- **Data snapshots.** None, no data touched.
- **Background jobs.** None: the hide runs from the button's `OnLeave`.
- **Player-facing text.** A changelog line under the next version's `### Fixed`.
- **Other entry points.**
  - Older reports may have had others (code before 99.6, other addons tainting `GameTooltip`).
  - A Blizzard leave handler in the window that runs tainted would hide `GameTooltip` tainted while it still shows another owner's widget tooltip. That is low likelihood, since that owner hides it first.
    - The category buttons' `OnLeave`, Feat of Strength ones included, was secure in game (2026-10-24).
    - The achievement, summary and shield buttons are not measured; that case is in `docs/backlog.md`.
  - The probe stays on and would show a key that tainted code sets to a new value. It does not see a key set to nil, or a value written again unchanged.

## Verification
- **Scenarios** in the `tooltip` suite (Retail only), in game and headlessly. As built (plan.md), a stand-in button with the fields Blizzard's list sets is passed to the global the way a button's `OnEnter` calls it. Blizzard's tab is not opened.

  | Scenario | Recorded before the fix | Target |
  |---|---|---|
  | `blizzard-category-tooltip`: which tooltip the button owns | `GameTooltip` (in game 2026-10-24) | `progress bar`, KAF's |
  | `blizzard-category-tooltip-leave`: after the button's `OnLeave` fires (`ExecuteFrameScript`), is a tooltip it owns still shown | `hidden` | `hidden` |

  - Headlessly, the real `addon.OverwriteFunctions` runs against a model of both tooltips and Blizzard's handlers.
  - Before the fix, the in-game run showed Blizzard's tooltip from addon code, which tainted `GameTooltip.statusBarPool` until reload.
  - An in-game observation reads a real category button of Blizzard's list when one exists: whether its `showTooltipFunc` is KAF's, and whether its `OnLeave` is tainted.
- **Hide on leave.** The `-leave` scenario fails with the hook removed (checked headlessly). In game, at the after-run, the maintainer hovers a Guild tab category and moves off, with a screenshot.
- **The probe, in game.** After `/reload`, the maintainer hovers a Guild tab category (or Blizzard's Achievements tab), then a map POI with a widget. After the next `/reload`, the probe's last session in the saved variables shows no `statusBarPool` and no `GameTooltip.widgetContainer` detection by KAF, against the two reproductions above.
- **The rest.** `Check-Repo.ps1`, the `escape`, `navigation` and `tooltip` suites headless and in game, `Read-GameErrors.ps1` after the reload, a Mists Classic check that the Guild tab tooltip is Blizzard's, and `krowi:taint-reviewer`.

## Decision
Option 1, KAF's progress-bar tooltip on Retail, chosen by the maintainer (Krowi) on 2026-10-23. The intent was accepted with it: the item was unambiguous, so its gate was folded into this one. Option 3 stays open as separate work.

2026-10-24, after the taint review: the tooltip hides from a `HookScript("OnLeave")` on each Blizzard category button it shows for, instead of the `OnUpdate` watcher of the first build. Chosen by Krowi over keeping the watcher (with or without a mouse-focus check).