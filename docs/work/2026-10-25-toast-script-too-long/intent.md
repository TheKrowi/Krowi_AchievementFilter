# Intent: Clicking an achievement toast can stop with "script ran too long"
Author: Krowi (maintainer), from their own BugSack. Source: in-game error. Status: accepted

## Problem
Krowi clicked the toast of an achievement they had just earned (an Exploration achievement in an Expansions zone category) on Retail, in combat. The click opens the achievement window and selects that achievement in the Expansions tab. Instead, the game stopped the addon's code with "script ran too long" (BugGrabber, 1x), at `Gui/WindowFrames/CategoriesFrame/CategoriesFrameMixin.lua:141`, called through `ExpandToCategory`, `KrowiAF_SelectCategory`, `KrowiAF_SelectAchievementFromID` and the addon's `AchievementFrame_SelectAchievement` from Blizzard's `AchievementAlertFrame_OnClick`.

When that happens the window is left half set up: the tab is switched, but the category is not expanded and the achievement is not selected. The player sees a Lua error for a plain click.

## Proposed outcome
Clicking an achievement's toast right after earning it opens the window on that achievement without an error, also in combat. The same holds for the other ways the game opens the window on an achievement (the objective tracker, a chat link).

## Affected users and systems
- Every player who earns an achievement and then opens the window on it through a toast, the tracker or a link; most exposed on Retail, whose Expansions tab is the largest. Mists and Titan run the same code on a smaller tab.
- The achievement window: the categories list, the summary, the Expansions, Events and Specials tabs.
- Options: Merge small categories (on by default), the completion filters.
- No saved variables, data files or libraries.

## Constraints
- No taint: the addon's `AchievementFrame_SelectAchievement` replacement stays as it is, and no Blizzard frame is touched.
- The category counts the window shows stay correct after an earn.
- Retail and Classic share the code; neither may regress.

## Open questions
- Which part of the click's work is the expensive part (answered in the spec).
- Whether the smaller wastes on the same path belong in this fix or in a follow-up.