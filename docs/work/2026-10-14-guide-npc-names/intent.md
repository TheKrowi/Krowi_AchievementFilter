# Intent: Guide NPC names in the player's language, from the game
Author: Krowi (maintainer). Source: idea, `docs/backlog.md` "Archivist Zubashi's name in other locales" (from PR #338), discussed on 2026-10-14. Status: accepted

## Problem
The guide for 60962 "Legendary Research of the Ebon Blade" tells the player to talk to Archivist Zubashi. The name comes from `addon.L["Archivist Zubashi"]`, which is `= true` in all ten other locales, so a German, French, Korean or Chinese player reads the English name in a step that is otherwise in their language, and in the waypoint title (map pin, TomTom).

Filling in the ten translations by hand, through the CurseForge localization project, treats game data as a translation. The eleven sibling Legendary Research guides (backlog) would add about a dozen more NPC names, each needing ten more entries.

## Proposed outcome
- A guide step that names an NPC shows the name the player's own client uses, in every language, with no translation to maintain.
- The NPC names leave the localization files and the CurseForge project.
- A new guide names its NPC once, in English, in the data.

## Affected users and systems
- Retail players of any language who open a guide: the tooltip's Guide section, the right-click menu's Guide submenu, the side panel, the expanded row's guide block, and the map pin and TomTom waypoint titles.
- Classic: no guide data and no change.
- `DataAddons/Retail/07_Legion/GuideData.lua`, `Api/GuideDataBuilder.lua`, `Gui/Guide/Guide.lua`, the debug `/kafwhere` (`Globals.lua`), all 11 locale files.

## Constraints
- No taint and no secret-value errors: nothing touches Blizzard's tooltips or frames.
- Classic must not error (its client may lack the API).
- No new saved variables, no web lookups at runtime.

## Open questions
- What a player sees the first time, before their client has the NPC's name cached. In-game probe on 2026-10-14 (Retail, enUS): `C_TooltipInfo.GetHyperlink("unit:Creature-0-0-0-0-97485-0000000000").lines[1].leftText` returned "Archivist Zubashi"; for Hogger (448), not in the cache, the first call returned nothing and a second call a moment later returned "Hogger".