# Intent: The tab factory installs its hooks once, not once per tab
Author: Krowi (maintainer), from a code reading in the 2026-11-13 from-scratch analysis. Source: idea (code reading). Status: done

## Problem
When Blizzard's achievement window loads, KAF adds its tabs (Achievements, Expansions, Events, PvP, Specials) through `AchievementFrameTabButtonFactory:GetNew`. Each call is meant to hook Blizzard's tab functions only the first time, but the guard is true for most calls, so the hooks go in several times. Every tab change then runs KAF's tab update (window size, tab label offsets, the selected tab) and, on the Statistics tab, the view refresh several times instead of once. Nothing looks different to the player; it is wasted work on every tab click, and a skin that hooks the factory's `AchievementFrame_UpdateTabs` (KAF's GW2_UI plugin) runs as often. On Wrath (38002) the hook sits on the global `PanelTemplates_SetTab`, so the repeat happens on every tab click anywhere in the interface.

## Proposed outcome
The hooks are installed exactly once, however many tabs KAF and its plugins add. Every tab change runs KAF's tab update once. Nothing else changes.

## Affected users and systems
Every client with achievements (Retail 120105, Mists 50504, Wrath Titan 38002); Blizzard_AchievementUI's tab functions; KAF's own and plugin-added tabs (`KrowiAF.PluginsApi` tab data); skins that hook the factory (GW2_UI plugin) or read `GetTabs` (EllesmereUI plugin). No options, saved variables or data.

## Constraints
No taint change (hooks stay `hooksecurefunc`, installed at the same moment); no other behaviour change; the comparison hook, which never fires today (`addon.OverwriteFunctions` replaces `AchievementFrame_DisplayComparison` afterwards), stays as it is: comparison is investigated separately.

## Open questions
None beyond the design choice in the spec.