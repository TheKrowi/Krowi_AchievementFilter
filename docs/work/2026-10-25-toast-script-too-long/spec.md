# Spec: Clicking an achievement toast can stop with "script ran too long"
Intent: [intent.md](intent.md). Status: done

## Requirements
1. After an achievement is earned, opening the window on it (toast, objective tracker, chat link) no longer recounts every category of the tab; only the categories whose counts the earn can change are recounted.
2. The same holds while the window is open when the achievement is earned: the categories list and the summary refresh one second later without a recount of the whole tab.
3. After an earn, every tab's category counts and the summary's bars include the earned achievement, whichever tab is shown first.
4. Filter changes, option changes and the first count of a tab still count in full, as today.
5. Retail and Classic behave the same; no Blizzard frame or function is changed.
6. Opening the window on a category walks the tab's tree once, whatever the depth of the category, and leaves the same categories shown and expanded as today.
7. Opening the window on a category that shows no achievements (all filtered out) no longer recounts the tab; the category and its path still show and it is selected.
8. The fix leaves scenarios behind (Verification).

## Root cause
**The click runs one full recount of the Expansions tab in a single script.** The game stops an addon's script that runs past a time limit, most often seen in combat; the limit is not documented (community reports: [WoWInterface](https://wowinterface.com/forums/showthread.php?p=268241), [Blizzard forums](https://us.forums.blizzard.com/en/wow/t/script-ran-too-long-too-sensitive/1558329)). Where the error lands is only where the time ran out; line 141 is a cheap line.

What one toast click runs, all in Blizzard's `AchievementAlertFrame_OnClick` (`wow-ui-source/live/.../Blizzard_FrameXML/Mainline/AlertFrameSystems.lua:390-417`):
- With the window closed, `AchievementFrame_ToggleAchievementFrame()` (`:406`), the addon's replacement, opens Blizzard's own Achievements tab first (`Gui/BlizzardOverrides.lua:33-49`).
- `AchievementFrame_SelectAchievement(id)` (`:416`) is the addon's (`Gui/BlizzardOverrides.lua:89-96`) and goes to `KrowiAF_SelectAchievementFromID` (`Api/API.lua:63-70`), `KrowiAF_SelectAchievement` (`:26-61`) and `KrowiAF_SelectCategory` (`:87-123`).
- `KrowiAF_SelectCategory` switches to the Expansions tab through `gui:ToggleAchievementFrame` (`Gui/Gui.lua:200-232`). The tab shows its frames (`AchievementFrameTabButtonMixin.lua:10-29`), so `KrowiAF_CategoriesFrame:OnShow` runs `Update(addon.AchievementEarnedUpdateCategoriesFrameOnNextShow)` (`CategoriesFrameMixin.lua:63-71`).
- **That flag is set by every earn** (`Data/AchievementCache.lua:181-191`, from `ACHIEVEMENT_EARNED` in `Krowi_AchievementFilter.lua:136-137`). With it, `GetDisplayCategories` (`CategoriesFrameMixin.lua:79-100`) recounts every top-level category of the tab, and `category:GetAchievementNumbers` (`Objects/Category.lua:147-209`) walks each subtree.
- Per achievement row that is `addon.GetAchievementNumbers` (`Globals.lua:64-83`): `filters.Validate` (`Filters.lua:266-288`, a new info table and often a new `ignoreFilters` table, then the filter chain), `GetAchievementInfo` again and the obtainable state.
- The Retail Expansions tab has 1255 categories and 7149 achievement rows (`.claude/tools/headless/snapshots/CategoryTree.Retail.txt`). All of them are validated to show one achievement, of which only the earned one changed.
- After that, on the same click: `ExpandToCategory` walks the whole tab once per level of the target's path (`CategoriesFrameMixin.lua:188-205`, `:161-166`; 4 levels for a zone, so about 5000 visits; the error landed in the first of those walks), `Update()` walks it again (`API.lua:74`), and the achievement list updates.
- **When the tab shows its Summary, the same click recounts the tab twice.** The Summary's `OnShow` runs `Update("ACHIEVEMENT_EARNED")` while its own earn flag is set (`SummaryFrameMixin.lua:82-86`), and that calls `KrowiAF_CategoriesFrame:Update(true)` (`:300-302`).
  - Measured in the before-run (Retail 12.1.5, 2026-10-25, out of combat): one select after an earn validated 10,343 achievement rows in 164 ms with the earned achievement's own category selected, and 20,686 rows in 273 ms with the Summary selected.
  - One full recount of the tab is 8,537 rows (headless, merged categories counted twice).
- With the window open, the earn takes the same full recount one second later: `CategoriesFrameMixin.lua:46-51` calls `Update(true)`, and the summary does too (`SummaryFrameMixin.lua:78-80`, `:300-302`). That runs from a timer, also in combat.

**A second defect on the same flag.** The flag is cleared by the first `OnShow` after the earn (`CategoriesFrameMixin.lua:69`). A tab whose counts were made before the earn and that is shown later keeps its old counts until a filter change. The new scenario records this.

**Reproduction.** The report is Krowi's own BugSack entry, from a click in combat in the current session, so not yet in the BugGrabber file on disk. The reproduction is the new scenario (Verification): the number of achievements one click validates after an earn, recorded before the fix, plus the in-game time of the click as an observation.

## Design
Per-category dirty marks instead of one window-wide flag:
- **On an earn** (`addon.OnAchievementEarned`, also before the login cache build starts), mark `CountsDirty` on the top-level category (the child of the tab root) above each place the achievement is listed: `Category`, `MoreCategories`, `WatchListCategories`, `ExcludedCategories`. Mark every flexible top-level category too (Current Zone, Selected Zone, Search Results, Watch List, Tracking, Excluded, Uncategorized): Current Zone, Selected Zone and Search Results hold lists without a link back from the achievement. The next achievement in a series needs no mark, because the counts ignore collapse series (`Globals.lua:69`).
- **`KrowiAF_SelectCategory`** recounts the target's top-level category first when it is marked, so the open window cannot change the counts it reads between its two looks at them (`earn-select-open-hidden`, from the code review). It resets the `AlwaysVisible` marks when it set them, not when the count is zero again.
- **`GetDisplayCategories`** recounts a top-level category when its counts are missing, a full recount was asked for, or it is marked dirty, flexible or not (today only flexible ones honour the mark, `:81`).
- **The earn paths stop asking for a full recount:** `OnShow` no longer passes the earn flag, and the categories frame's and the summary's `ACHIEVEMENT_EARNED` refresh call `Update()` instead of `Update(true)`. The marks live on the categories, so each tab picks them up when it is next drawn (requirement 3).
- Filter and option changes keep `Update(true)` and `filters.Refresh` (requirement 4).

For the toast's Exploration achievement in a The Burning Crusade zone that means one expansion's subtree plus the small flexible lists instead of all 7149 rows.

The two smaller wastes on the same path (in scope by the decision):
- **One walk in `ExpandToCategory`.** Applying `ExpandCategory` once per level of the path, from the tab root down, ends in a state that one walk can set directly: a category is shown when its parent is on the path, and expanded when it is on the path itself; every other category is hidden and collapsed. `ExpandToCategory` builds the path as a set and walks the tab once; `ExpandCategory` keeps its single-target form for clicks on a category button (`SelectCategory`, `:219-245`).
- **No recount for an empty category in `KrowiAF_SelectCategory`.** The `AlwaysVisible` marks on the path are honoured by `GetDisplayCategories` without counts (`:80`, `:89`), and `SelectCategory` (`API.lua:72-85`) redraws the list after expanding. The `Update(true)` at `API.lua:109` only recounts; it is dropped. A scenario guards that such a category still shows and is selected.

## Options considered
For a player who earns an achievement and clicks its toast, on Retail and Classic alike:
- **1. Recount only what the earn changed (recommended).** The window opens on the achievement at once and without the error, also in combat. The counts in every tab include the earn, which also fixes the stale-tab defect. Touches the earn handler, the categories frame and the summary; no Blizzard code.
- **2. Select the achievement a frame later.** The click opens the window and `C_Timer.After(0)` selects the achievement. The window looks the same, but the full recount still runs inside one of the two scripts, so the error can still come in combat on a big tab. Not recommended on its own.
- **3. Wait for the end of combat.** A toast clicked in combat opens the window when combat ends. No error, but the click seems to do nothing until then, unlike Blizzard's own window. Not recommended.

Smaller wastes on the same click (the scope question at the gate):
- **In this PR (chosen).** `ExpandToCategory` walks the whole tab once per level (`:201-203`), and `KrowiAF_SelectCategory` asks for a second full recount when the target category shows no achievements (`API.lua:103-110`), for example with completed achievements hidden. Both are fixed as in the Design. The click gets cheaper for players who hide completed achievements too.
- **Only the recount.** The smallest fix for the reported error, with the two wastes in `docs/backlog.md`. Not chosen.

## Areas of concern
- **Taint and secret values:** none new. The path already runs in the addon's own `AchievementFrame_SelectAchievement` replacement; the change only does less work in addon frames. No secret-value API is read.
- **Clients:** `## Interface: 120105, 50504, 38002`. Mists and Titan share `CategoriesFrameMixin.lua`, `Category.lua`, the earn handler and the summary; Classic's alert click also calls `AchievementFrame_SelectAchievement` (`wow-ui-source/classic/.../Classic/AlertFrameSystems.lua:412`).
- **Blizzard API changes:** none.
- **Other addons, plugins and skins:** the plugin API's `KrowiAF_SelectCategory` and `KrowiAF_SelectAchievement` keep their behaviour. Plugins that inject categories get the same marks through the top-level ancestor.
- **Saved variables and migrations:** none.
- **Localization:** none.
- **Embedded libraries:** none.
- **Data snapshots:** none; no data changes.
- **Player-facing text:** one changelog line under the next version, `### Fixed`.

## Found on the way
- **A tab whose list comes out empty recurses until the stack overflows.** When no category of the selected tab shows, `Update` sets the selected category to `displayCategories[1]`, which is nil, and calls the tab's `ShowSubFrames` (`CategoriesFrameMixin.lua:133-136`). That hides and shows the categories frame, whose `OnShow` runs `Update` again.
  - The Summary is always visible by default, so this needs the Summary turned off for the tab and every achievement filtered out.
  - The headless model overflowed this way before it was given the default.
  - Not reproduced in game. Proposed for `docs/backlog.md`.
- **Other full recounts of a tab remain** (code review, 2026-10-25). `addon.Gui:RefreshView` sets `Filters.Refresh` on every tab (`Gui/Gui.lua:403`), so the next `Update` recounts the whole tab. Watching, unwatching, excluding or including an achievement from the right-click menu goes through it, and in combat that can run past the limit the same way. The per-category marks could serve those paths too. Proposed for `docs/backlog.md`.

## Verification
- **A new scenario suite** (name in the plan), on a real achievement of the Retail Expansions tab and one of Classic's, with the window closed and then open:
  - `earn-recount-on-select`: the number of achievement rows validated from the earn to the end of `AchievementFrame_SelectAchievement`. Recorded: the whole tab (7149 rows on Retail headless). Target: the earned achievement's top-level categories and the flexible ones.
  - `earn-recount-window-open`: the same for the earn refresh of the open window. Recorded: the whole tab. Target: as above.
  - `earn-other-tab`: the count of a tab drawn before the earn and shown after it. Recorded: whatever the current code shows (expected stale). Target: includes the earn.
  - `expand-path-state`: the categories shown and expanded after opening the window on a category four levels deep, and the number of categories visited. Recorded: the state today and one walk per level. Target: the same state, one walk.
  - `select-empty-category`: opening the window on a category whose achievements are all filtered out. Recorded: the category and its path show and it is selected, after a full recount. Target: the same, without a recount.
  - Game-only observation: the milliseconds of the select call with and without the earn.
- Headlessly: the suite and `Check-Repo.ps1 -ChangedOnly`. In game on Retail and Mists: the suite before the fix matches Recorded, after it Target; `/reload`, `Read-GameTests.ps1`, `Read-GameErrors.ps1`.
- `krowi:taint-reviewer` and `/code-review` on the diff.

## Decision
Krowi, 2026-10-25, at the design gate:
- **Option 1:** recount only what the earn changed. Krowi was in combat when the error came, which fits the root cause.
- **Scope:** include both smaller wastes on the same path (one walk in `ExpandToCategory`, no recount for an empty category).