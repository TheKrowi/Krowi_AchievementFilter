# Intent: Zygor's guide icons do not show on the addon's achievement rows
Author: LadyTaayy (player, CurseForge comment 2026-10-18), filed by Krowi (maintainer). Source: GitHub issue #365. Status: done

## Problem
Zygor Guides Viewer puts a small magnifying glass on each row of Blizzard's achievement list that has a Zygor guide; clicking it opens that guide. With the addon enabled, the reporter sees none of these icons on the addon's achievement rows ("don't appear at all"), on Retail.

The addon has a plugin for exactly this, `Plugins/ZygorGuidesViewer.lua` (last fixed in 87.1), so the icons should be there.

## Proposed outcome
With Zygor loaded, every row of the addon's achievement list (Achievements, Expansions, Events, PvP and Specials tabs, the search results and the special categories) whose achievement has a Zygor guide shows Zygor's icon, from the first time the list is shown in a session, however the window was opened. Clicking the icon opens the guide in Zygor's viewer, as on Blizzard's list.

## Affected users and systems
- Retail players who use Zygor Guides Viewer with the addon. Zygor's achievement icons are a Retail feature; Mists and the other clients are not known to have them.
- The achievement window: the addon's achievement list, shared by all its tabs.
- The plugin `Plugins/ZygorGuidesViewer.lua` and Zygor's achievement module (`Code-Retail/Achievement.lua`, Zygor 9.6) and its shared icon pool, which Zygor also uses in the Pet Journal and the Mount Journal.
- The key bindings that open the window: Blizzard's Toggle Achievements and the addon's tab bindings (the first-run switch of Y is issue #197).
- No options, saved variables, data files or libraries.

## Constraints
- No taint: no Blizzard frame or function is changed; Zygor's own icons on Blizzard's list keep working.
- Without Zygor, or with a Zygor build without the achievement module, nothing happens and no error is raised.
- Independent of #197: the fix must not depend on which binding Y holds.

## Open questions
- Why the icons never appear (answered in the spec).
- Whether the shared icon pool, which Zygor clears from three places, belongs in this fix.