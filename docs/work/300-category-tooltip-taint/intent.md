# Intent: Secret number errors when a tooltip closes after using the achievement window
Author: Ookami313 (reporter), with formigao, Dhampir113, qianjhust and Sinrath; captured by Claude. Source: GitHub issue #300. Status: accepted

## Problem
On Retail, BugSack fills with `Blizzard_SharedXML/LayoutFrame.lua:491` (`:493` on 12.1.5) `attempt to compare a secret number value (execution tainted by 'Krowi_AchievementFilter')`, raised through `GameTooltip_ClearWidgetSet` when a tooltip closes. Once it starts it repeats on every tooltip close, also while the player does nothing, until `/reload`: reports count from 15 to over 34000 per session. Reporters see it start in combat or when hovering a world map POI. It has been open since 12.0.5 and KAF 95.0 (2026-05-11); the attempts in 96.0 to 99.9 did not stop it, and Sinrath still had it on 103.0 (2026-10-18).

On 2026-10-20 Sinrath reproduced it with only KAF, BugGrabber and BugSack loaded: open the achievement window, open the world map, hover a map POI with a widget tooltip.

## Proposed outcome
Using the achievement window never leads to this error, whatever tooltip the player hovers afterwards, in or out of combat.

## Affected users and systems
- Retail only: secret values exist only on 12.x. Mists Classic and Titan Reforged are not affected.
- The achievement window's Blizzard tabs that KAF keeps: Guild (shown by default, for characters in a guild) and Blizzard's own Achievements tab (hidden by default, Options > Layout > Tabs).
- Blizzard's `GameTooltip` and the tooltips that carry a widget set (world map POIs, vignettes).
- The ElvUI, GW2_UI and EllesmereUI plugins, which skin the achievement window and KAF's tooltips.
- The taint probe (`TaintDiagnostics.lua`), which produced the exports in the issue.
- No options, saved variables or data files.

## Constraints
- No write into Blizzard frames, `GameTooltip` or `C_*` namespaces; hooks only through `hooksecurefunc`.
- Mists Classic and Titan Reforged keep their current behaviour.
- The plugin and skin contracts stay as they are.

## Open questions
- What the category tooltip on Blizzard's tabs looks like after the fix: KAF's own progress-bar tooltip, a text-only tooltip, or Blizzard's unchanged.