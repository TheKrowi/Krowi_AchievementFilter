# Intent: 12.1.7 "Echoes of the Worldcore" achievements
Author: Krowi, maintainer. Source: idea. Status: done

## Problem
Patch 12.1.7 "Echoes of the Worldcore" goes live on 1 December 2026 (2 December in Europe). Its PTR build 12.1.7.71087 has 119 visible achievements the addon does not know (`Find-NewAchievements.ps1` against live 12.1.5.70961; 63685 BlizzCon 2026 is already in the 12.1.5 block). Without them players see them only under Blizzard's own categories, with no filters, tooltips or obtainability.
- 90 are Talebound, the new roguelite mode: 60 under Blizzard's new top-level Talebound category (Bosses 15627, Levels 15628, general 15625), most rewarding Bound Silver, a new warband currency, plus three titles and a warband campsite; and 30 "Traveling Raven" trackers under Expansion Features > Talebound (15631), silent duplicates of the others that unlock an item at the Traveling Raven vendor.
- 4 Lorewalking (decor), The Coreway Advance (Midnight quests), 6 Winter Veil neighborhood achievements plus Bow Go and Let's Put A Bow On It, and Master of the Turbulent Timeways VI (mount).

## Proposed outcome
Krowi's answers (2026-11-21):
- Talebound sits in the **Specials tab**.
- Bound Silver is a reward type of its own, "like the remix currencies" (Remix Bronze, Remix Infinite Knowledge), in the reward filter.
- The Traveling Raven rewards are identified item by item and typed by what each item is.
- The data is added **now from the PTR**, as a provisional `12_01_07` block named "Echoes of the Worldcore", and checked again against the live build on 1 December.

## Affected users and systems
- Retail only: Midnight's `AchievementData.lua` (new `12_01_07` block), `BuildVersionData.lua` (the patch and its name in every locale), `CategoryData_Specials.lua` (Talebound), `CategoryData_Events.lua` (Winter Veil), Midnight's `CategoryData.lua` (Lorewalking, quests, Timewalking), `ZoneData.lua` where the zone rules ask.
- The reward types: `Api/AchievementDataApi.lua` (the `RewardType` list), the builder, the filter menu (`Gui/WindowFrames/FilterButton/FilterButtonRewardTypes.lua`) and its saved filter settings, the locale files.
- The data snapshots.

## Constraints
- A new reward type is appended to the list, so the saved filter settings of every other type keep their meaning.
- PTR data is provisional: ids, rewards and names can still change before 1 December (Wowhead: the PTR already dropped Talebound's Mythic achievements).

## Open questions
- The Specials tab's Talebound shape: Blizzard's (Bosses, Levels, general) or another; whether the 30 Traveling Raven trackers get a subcategory there.
- The Bound Silver reward type's name, label and icon in the filter.
- What each of the 30 Traveling Raven items is (Wowhead, the game database).
- Blizzard's own translations of "Echoes of the Worldcore" and "Talebound", where the game database has them.