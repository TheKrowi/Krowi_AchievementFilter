# Intent: Transmog set progress in the achievement tooltip stops working on 12.1.5
Author: Krowi (maintainer), captured by Claude. Source: found while preparing 12.1.5 (FrameXML diff of 12.1.0 against the 12.1.5 PTR, 2026-10-08). Status: done

## Problem
On Retail, hovering an achievement that rewards transmog sets (raid tier sets, PvP sets, and other achievements with transmog set data) shows an "Objectives progress" section listing which set pieces the player has collected. From 12.1.5, live on 2026-10-13, that section shows "Objectives progress" and "Collecting data" and then never fills in. No Lua error appears, so players only see a tooltip that never finishes. This may already happen on 12.1.0 for players whose client does not load Blizzard's deprecated API fallbacks.

## Proposed outcome
The transmog set progress in the achievement tooltip keeps working on 12.1.5 and later, on every client that shows it. When a client stops providing a Blizzard API the addon calls, the offline checks find it before a release, not the players after it.

## Affected users and systems
- Retail: the achievement tooltip's transmog set progress section (`Gui/AchievementTooltip/`), for every achievement with transmog set data (`DataAddons/*/TransmogSetData.lua`, Legion through Midnight, plus Shared).
- Classic (Mists of Pandaria Classic, Wrath Classic): the same section is loaded. The Classic item tooltip hook (`Data/TooltipData.lua`) uses the same Blizzard API. 12.1.5 does not change the Classic clients.
- The option that shows objectives progress in the tooltip (Options -> Tooltip -> Achievements -> Objectives Progress) and its "show when completed" sub-option.
- No saved variables, plugins or skins, localization strings or data files are involved.

## Constraints
- No taint: tooltip code only, no Blizzard frame or function is replaced.
- Classic keeps working: the Classic clients must provide whatever replaces the removed API.
- Ships before or with 12.1.5 (2026-10-13 NA, 2026-10-14 EU).

## Open questions
- Does the bug already affect live 12.1.0? It does when `loadDeprecationFallbacks` is off. In game, `/dump GetCVarDefault("loadDeprecationFallbacks"), GetCVar("loadDeprecationFallbacks"), GetItemInfo ~= nil` answers it.
  - 12.1.5 PTR, 2026-10-08: `"1"`, `"1"`, `false`. The CVar is on by default and the global is still gone, so 12.1.5 breaks every player, not only those who turned the fallbacks off.
  - Live 12.1.0.69933, 2026-10-08: also `"1"`, `"1"`, `false`. **Yes, live is already affected**, with the CVar on. The spec's reading of `Deprecated_ItemScript.lua` (the alias exists when the CVar is on) does not match the game; why was not investigated, because the fix does not depend on it. The changelog line therefore names no patch.
- How is a removed Blizzard API reproduced test first, when live still has it?