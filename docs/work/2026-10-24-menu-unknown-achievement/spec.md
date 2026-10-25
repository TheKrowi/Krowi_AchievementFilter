# Spec: The right-click menu breaks on an achievement the game does not know
Intent: [intent.md](intent.md). Status: done

## Requirements
1. Right-clicking any achievement builds its whole menu without a Lua error on Retail and Classic. That holds even when a "go to" entry links to an id the player's client does not know, whether the addon registers that id or not. Every section after "Go to" (Guide, Pop out, reward preview, transmog sets, pet battle links, More) and the plugin entries (IAT) are there.
2. A "go to" entry for an id the client does not know reads `* Placeholder for <id> *`, the name the achievement list already shows for such an achievement (`Globals.lua:104`). When the addon does not register the id, " (Missing)" follows and the entry is greyed out, as for any "(Missing)" entry today.
3. Which entries are greyed out does not change: an entry is greyed out exactly when the addon does not register its id. A placeholder the addon registers stays clickable and selects it in its category, as clicking it in the list does.
4. The menu of a placeholder has `* Placeholder for <id> *` as its title instead of an empty one.
5. The browsing-history tooltip (hovering the back or forward arrow) lists a placeholder in the history as `<category path> > * Placeholder for <id> *`, without a Lua error, on Retail and Classic.
6. Entries, titles and history lines for achievements the client knows keep their text and behaviour.
7. Each fixed bug leaves a scenario behind (Verification).

## Root cause
**The menu takes an achievement's name from the game, and the game has none for an id it does not know.**
- `AchievementMenu:AddGoToAchievementLine` (`Gui/RightClickMenu/AchievementMenu/AchievementMenu.lua:12-29`) reads `addon.GetAchievmentName(id)` at `:14`. That returns the second value of `GetAchievementInfo` (`Globals.lua:95-98`), which is nil for an id the client does not know. `addon.GetAchievementInfo` (`Globals.lua:100-106`) handles exactly that case with the placeholder name; the menu does not use it.
- An id the addon does not register raises "attempt to concatenate a nil value" at `:17` (`name .. " ("`). A registered placeholder (`DoesNotExist`, set in `Data/AchievementCache.lua:15-16`) raises it at `:22` (`name .. nameSuffix`).
- The menu's title (`:43`) passes the same nil to `CreateTitle`. That raises no error (`MenuUtil.CreateTitle` in `Blizzard_Menu/MenuUtil.lua:198-200` on Retail, `AddTitle` with `Text = nil` in `Libs/Krowi_Menu/Krowi_MenuItem.lua:38-43` on Classic), but a placeholder's menu gets a title without text.

**The browsing-history tooltip has the same defect.** `SetTooltipHistory` (`Gui/BrowsingHistory/BrowsingHistory.lua:46-71`) builds each line as `path .. " > " .. addon.GetAchievmentName(...)` at `:62`. A placeholder in the history (selected while placeholders were shown) raises the same error each time the player hovers the back or forward arrow. The commented-out loop below it (`:64-69`) still shows the earlier version, which took the name from `addon.GetAchievementInfo`.

**Which links can point at an unknown id.** Of the four callers, two take their ids from data and two from the game:
- `OtherFaction.lua:17` links to `OtherFactionAchievementId`, the counterpart a data file names in `:FactionSplit` (`Objects/Achievement.lua:16`). Nothing checks that the client knows it.
- `FirstCategory.lua:12` links the achievement to itself, only while the Current Zone or Selected Zone category is selected (`:5-8`). It is unknown when the achievement is a placeholder, which the list shows only with the "Show placeholders" option and filter on (`Options/Defaults.lua:14`, `Filters.lua:46`, both off by default).
- `PartOfAChain.lua:14` and `RequiredFor.lua:15` cannot: chains link registered ids through the game's `GetPreviousAchievement` (`Data/Data.lua:245-252`), and "required for" ids are the achievements whose criteria the game lists (`Data/AchievementCache.lua:43-56`). The game knows both.

**What the player sees** (from the sources; the in-game before-run confirms it):
- Retail: Blizzard runs the menu generator through `securecallfunction` (`Blizzard_Menu/MenuUtil.lua:151-161`, `Menu.lua:2634-2637`). The error is reported and the menu still opens with what was built before it: the title, the Wowhead link and a "Go to" submenu that stops at the failing entry. Every later section and the plugin entries are missing.
- Classic: `menuBuilder:ShowPopup` builds the menu, then opens it (`Libs/Krowi_Menu/Krowi_MenuBuilder.lua:305-314`). The error stops it before `Toggle`, so no menu opens.

**Who hits it today.**
- No BugGrabber log on Retail or Classic holds the error.
- Every `:FactionSplit` counterpart is also registered on the same client: 477 counterpart ids on Retail and 227 on Classic, all in that client's data snapshot (`.claude/tools/headless/snapshots/Achievements.<client>.txt`). So in practice an unknown id in a menu is a registered placeholder: an id the data registers and the client's build lacks. The "(Missing)" case of requirement 2 only guards against future data.
- All 8840 registered ids were looked up with `.claude/skills/add-zone-data/_lookup_ids.ps1` in Retail 12.1.5.70575 and Classic 5.5.4.70579 (2026-10-25). Two are missing from their client's build:
  - 63685 (BlizzCon 2026, `DataAddons/Retail/12_Midnight/AchievementData.lua:893`) on Retail. It is most likely a hotfix-added achievement, which the client gets through its hotfix cache, so the game probably knows it.
  - 7295 (Listen to the Drunk Fish, `DataAddons/Shared/05_MistsOfPandaria/AchievementData.lua:333`) on Classic, where it is a placeholder.
  - 7295 has zone data (`DataAddons/Shared/05_MistsOfPandaria/ZoneData.lua:239`, Valley of the Four Winds); 63685 has none.
  - So on Mists, a player with placeholders shown who stands in Valley of the Four Winds with the Current Zone category selected and right-clicks 7295 gets the error, through the first-category entry. Any other right-click on 7295 only shows the empty title.
  - The history tooltip breaks once such a player selects 7295. Both need the placeholder option and filter, which are off by default, which fits that no player has reported it.
  - Corrected 2026-10-25 after the code review: the first version of this spec said neither id had zone data, from a search whose output was cut short.

**Reproduction.** No logged error exists, so the reproduction is the new scenarios recorded as "error", run in game before the fix (Verification).

## Design
- `AddGoToAchievementLine` and the title in `CreateMenu` (`AchievementMenu.lua:14,43`) and the history line (`BrowsingHistory.lua:62`) take the name from `addon.GetAchievementInfo` (its second value) instead of `addon.GetAchievmentName`. That gives the game's name for a known id and the placeholder name for an unknown one, so it is never nil. The `isEnabled` rule and the "(Missing)" suffix stay as they are (requirement 3).
- Three lines in two files. The callers, `Libs/` and the shared helper `addon.GetAchievmentName` do not change.
- The commented-out history loop (`BrowsingHistory.lua:64-69`) is left as it is: removing dead code is not part of this fix.
- Test first: the scenarios below are recorded "error", and their in-game before-run on Retail and Classic is green before the fix.

## Options considered
- **1. Placeholder name in the menu, greyed out as today (recommended, chosen).** The entry reads `* Placeholder for 12345 *`, plus " (Missing)" and greyed out when the addon does not register 12345. A placeholder the addon registers is clickable and opens it in its category. A placeholder's menu has that name as its title. The player sees the same name the list already shows, and the change is two lines.
- **2. The same name, but every entry the client does not know is greyed out.** This is how the intent worded the outcome. It also greys out the first-category entry of a placeholder, which today would take the player to the placeholder's own category, and the faction counterpart when the data registers it as a placeholder. It adds a second condition to the enabled rule for no gain the player can see.
- **3. Fix the shared helper `addon.GetAchievmentName` to fall back to the placeholder name.** This fixes the menu and the history tooltip in one place, but changes what other callers see. Sorting by name would put placeholders first instead of last (`Filters.lua:355-369` always sorts a nil name last; the placeholder name starts with a space, so it sorts before every letter). The 12 data categories named through it (`DataAddons/Retail/07_Legion/CategoryData.lua:530` and others) would load with a placeholder name instead of nil on a client that lacks the id. Not recommended: a wider change than the bug needs.
- **Label alternative, considered and dropped:** "Achievement 12345" with Blizzard's translated word. It reads better in other languages but differs from what the list shows for the same achievement. The placeholder text is English only, in the list as well.
- **The history tooltip: in this work item (chosen) or the backlog.** It is the same defect with the same one-line fix; including it widens the review and the in-game check by one scenario.

## Areas of concern
- **Taint and secret values:** none. The change is which addon function names a menu entry or a tooltip line. The entries go into the addon's own menu through the same builder calls, and the history lines into the addon's own `Krowi_Tooltip`. No Blizzard frame, hook or protected API is touched. `GetAchievementInfo` returns no secret values. The `krowi:taint-reviewer` will still run on the diff, since it is GUI code.
- **Clients:** `## Interface: 120105, 50504, 38002` (Retail 12.1.5, Mists 5.5.4, Titan 3.80.2). The code is shared. The menu builder differs (Retail's Blizzard menus, Classic's `Krowi_Menu_2`), and with it what the player sees of the bug (above). Titan has no local install, so it is checked through Mists, which takes the same builder path.
- **Blizzard API changes:** none. `GetAchievementInfo` returning nothing for an unknown id is what `addon.GetAchievementInfo` already relies on.
- **Other addons, plugins and skins:** `KrowiAF.PluginsApi:AddAchievementRightClickMenuItems` (`AchievementMenu.lua:51`) is unchanged. Its entries (IAT) now appear in menus that used to break before reaching it. Menu and tooltip skins see the same element types.
- **Saved variables and migrations:** none.
- **Localization:** none. "Missing" exists in every locale. The placeholder text is the existing English-only text from `Globals.lua:104`.
- **Embedded libraries:** none; `Libs/` is not edited.
- **Data snapshots:** none; no data or category file changes.
- **Player-facing text:** a changelog line under the next version's `### Fixed`, worded in the plan.

## Found on the way
- **7295 in the Shared Mists file is not in the Classic 5.5.4 build** (above). Shared holds only achievements identical on both clients, so it may belong in the Retail file. That is for the data skills, after a check of the Classic client's hotfix cache and a `data-verifier` pass; proposed for `docs/backlog.md`.
- **`Verify-AchievementData.ps1` cannot tell which client lacks an id.** It falls back to other builds and products for an id the first build lacks, and it reports no missing `:FactionSplit` counterpart. The sweep above went through `_lookup_ids.ps1` instead. Proposed for `docs/backlog.md`.

## Verification
- **Scenarios in the `menu` suite** (`Tests/Menu.lua`, its model in `.claude/tools/headless/run-tests.lua`). Each records "error", "enabled" or "disabled", and whether the entry text is the placeholder name.
  - `unknown-achievement-entry`: an id neither the client nor the addon knows (in game the first such id from 1 up; headlessly a fake id the model's game does not know). Recorded "error", Target "disabled" with the placeholder name and "(Missing)".
  - `placeholder-entry`: an id the addon registers and the client does not know (in game a registered achievement with `DoesNotExist`, else a stand-in registered only for the build and removed after it; headlessly a registered id the model's game does not know). Recorded "error", Target "enabled" with the placeholder name.
  - `placeholder-title`: the title the menu of such an achievement gets. Recorded "empty", Target the placeholder name.
  - `missing-achievement-entry` and `registered-achievement-entry` keep their Recorded and Target.
- **A scenario for the history tooltip**: a placeholder record in the browsing history, the tooltip's lines read back. Recorded "error", Target a line ending in the placeholder name. Its suite is decided in the plan; `navigation` already drives these buttons.
- Headlessly: the suites and `Check-Repo.ps1 -ChangedOnly`. In game on Retail and Mists: before the fix `/kaftest menu` (and the history scenario's suite) matches Recorded; after it, Target. A second `/reload`, then `Read-GameTests.ps1` and `Read-GameErrors.ps1`: no new row and no bumped count.
- By hand on Mists, with placeholders shown: right-click 7295 and hover the history arrows after selecting it; a screenshot of each.
- `krowi:taint-reviewer` and `/code-review` on the diff.

## Decision
Krowi, 2026-10-25, at the design gate:
- **Option 1**: the placeholder name in the "go to" entries and the menu title, with the enabled rule unchanged. Requirement 3 refines the intent's outcome: a placeholder the addon registers stays clickable.
- **The data check runs in this session.** Its result is under "Who hits it today".
- **The browsing-history tooltip is fixed in this work item** (requirement 5), not moved to the backlog.