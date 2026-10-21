# Intent: Guides for the other eleven Legendary Research achievements
Author: Krowi (maintainer). Source: idea, `docs/backlog.md` (From the achievement guides, 2026-10-11, PR #338). Status: accepted

## Problem
Since 103.0 only Legendary Research of the Ebon Blade (60962, Death Knight) has a guide. The other eleven classes' Legendary Research achievements (60963 to 60973) show none, although their descriptions ("Research all ... Class Hall Upgrades") hide the same facts: either of the two Tier VII talents completes them, and the research NPC stands somewhere in the class hall that no in-game text names.

## Proposed outcome
Every class's Legendary Research achievement has a guide like 60962's on Retail, in the tooltip, the right-click menu, the side panel and the expanded row: how to get into the hall, the research NPC with a waypoint, and the Tier VII talents with the player's own research state.

## Affected users and systems
- Retail players with any class; the guide surfaces and their options (`Achievements.Guide`), unchanged.
- `DataAddons/Retail/07_Legion/GuideData.lua`: the guide steps (`Api/GuideDataBuilder.lua`) were built for these siblings in the 2026-10-11 work item, and step 0 of its plan measured every class hall. An entrance the steps cannot express also touches the builder and the renderer (`Gui/Guide/Guide.lua`).
- The guide suite's headless model and the Retail data snapshot.

## Constraints
- No new strings for the CurseForge translators, yet every step reads in each supported language (Krowi, at the design gate).
- Classic is untouched (no guide data there).

## Open questions
- Three halls are entered by clicking an object (the Paladin's Secret Door, the Druid's portal in the Emerald Dreamway, the Demon Hunter's Illidari Gateway), and the builder has no step for an object. What do those three guides do about it? Answered in [spec.md](spec.md), Decision.