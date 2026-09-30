# Intent: Guild tab shows two sets of navigation buttons
Author: Malivil (reporter), captured by Claude for the maintainer. Source: GitHub issue #325 (https://github.com/TheKrowi/Krowi_AchievementFilter/issues/325), opened 2026-09-04. Status: done

## Problem
On Retail 12.1.0 (reported with KAF 100.1), opening the achievement window and clicking the Guild tab shows two sets of navigation buttons stacked on top of each other in the strip under the "Guild Achievements" title. The screenshot on the issue shows a grey "Back" button with a pair of arrow buttons drawn over it. Neither set reads cleanly, and a click can land on the wrong one.

## Proposed outcome
Each tab of the achievement window shows one set of navigation buttons, clear of anything else in the header strip.

## Affected users and systems
- Every Retail 12.1+ player with the default options: Options > Layout > Track Achievement Browser History is on by default (`Options/Defaults.lua`) and the Guild tab is shown by default (`Api/TabDataApi.lua`).
- Blizzard's tabs in the achievement window: Guild (shown by default), Blizzard's own Achievements tab (hidden by default), Statistics. The addon's own tabs look right today.
- Classic (Wrath, Cata, Mists) is not affected as reported; its header has no Blizzard Back button.
- Plugin skins that restyle or move the addon's arrows: ElvUI, GW2_UI, EllesmereUI.

## Constraints
- No taint: no overrides of Blizzard functions, no new writes to Blizzard frames or globals.
- Classic keeps its current look and behaviour.
- The plugin skins keep finding the arrows by their global names.
- The Track Achievement Browser History option keeps working.

## Open questions
- Which navigation should the Guild tab keep: Blizzard's Back button (Blizzard's own history of meta-achievement jumps), the addon's arrows (the history of the addon's tabs), or both side by side?
- Should the addon's arrows still show on the Statistics tab, where Blizzard shows no Back button?
