# Spec: 12.1.7 "Echoes of the Worldcore" achievements
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. A `12_01_07` block in `DataAddons/Retail/12_Midnight/AchievementData.lua` holds the 119 achievements `Find-NewAchievements.ps1` lists for 12.1.7.71087 against 12.1.5.70961, in the V2 format, each with the rewards, factions and `Obtainable()` records the data skills give it; 63685 BlizzCon 2026 stays in 12.1.5.
2. `BuildVersionData.lua` registers 12.1.7 as "Echoes of the Worldcore", with the name in every locale file.
3. A reward type for Bound Silver, appended after `KeystoneResilience` in `KrowiAF.Enum.RewardType` (so every saved filter keeps its meaning), with its builder method, set on the Talebound achievements whose reward is a Pile of Bound Silver; the reward filter lists it beside Remix Bronze and Remix Infinite Knowledge.
4. Each "Traveling Raven: <item>" reward is typed by the item: the two toys (64464 Hexed Tiny Tome 288899, 64465 Wood-Cursed Hearthstone 288912) as `:Toy()`, the rest (containers of Voidlight Marl, Season 2 gear, Venomstones, Mistcrests or crafting materials, and the four Wisdom consumables) as `:Other()`.
5. Talebound is a new node in the Specials tab, in the shape the decision names; every one of its 105 achievements is placed once.
6. The other 14 are placed where their siblings are: Lorewalking (4), The Coreway Advance in Midnight's quests, the Winter Veil eight in Events > Winter Veil, Master of the Turbulent Timeways VI beside Timeways V.
7. `verify-achievement-data` and the headless pipeline pass; the snapshots' diff shows exactly the new ids; the category coverage check places the whole block.

## Design
The new achievements, by Blizzard's category on the PTR (12.1.7.71087):

| Blizzard's category | Count | Rewards |
|---|---|---|
| Talebound (15625, top level) | 22 | Bound Silver; Stories to Share: Title "Listener" |
| Talebound > Bosses (15627) | 38 | Bound Silver; The Final Confrontation: Warband Campsite "The Fate of Quillgrave"; three Heroic Final Confrontations: titles Monster Hunter, of the Crooked Path, of the Sacred Flame |
| Talebound > Levels (15628) | 15 | Bound Silver |
| Expansion Features > Talebound (15631) | 30 | 28 "Traveling Raven: <item>" trackers (silent, `flags` 0x4, duplicates of the achievements above that unlock an item at the Traveling Raven vendor), Tapping at the Trader's Door, Delving into a Tale (a quest) |
| Expansion Features > Lorewalking (15552) | 4 | decor |
| Quests > Midnight (15547) | 1 | The Coreway Advance |
| World Events > Winter Veil (156) | 7 | the six neighborhood achievements and Let's Put A Bow On It |
| Feats of Strength > Events (15274) | 1 | Bow Go (the 2026 Winter Veil gift) |
| World Events > Timewalking (15454) | 1 | Master of the Turbulent Timeways VI: mount Markeet of the Infinite |

- **Bound Silver** is currency 3361 (icon 2744751). The reward type is `TaleboundSilver` (Krowi's word), so the builder method is `:TaleboundSilver()`; the builder makes the method from the enum (`Api/AchievementDataBuilder.lua:71`). The filter (`Gui/WindowFrames/FilterButton/FilterButtonRewardTypes.lua`) lists the Remix currencies in a block of their own; Bound Silver joins that block.
- **Names in other languages:** the PTR has Talebound, Bosses, Levels and Bound Silver in English only, so the game database cannot give translations yet. The live client gives them through `GetCategoryInfo(15625)`, `GetCategoryInfo(15627)`, `GetCategoryInfo(15628)` and `C_CurrencyInfo.GetCurrencyInfo(3361)`, read when the data loads, the way the Mists scenarios read `addon.GetLFGDungeonInfo(590)` (`DataAddons/Shared/05_MistsOfPandaria/CategoryData.lua:746`); an `L[]` fallback in English covers a nil. "Echoes of the Worldcore" has no game source: an `L[]` string translated into every locale, swapped for Blizzard's names once the live client shows them (as the 12.1.5 names in `docs/backlog.md`).
- **The other placements** follow the data skills and the siblings in the files; zone data follows the zone rules (D1 to D15).
- **Provisional:** the block is PTR data; on 1 December the live build is diffed again (`Find-NewAchievements.ps1`) and `verify-achievement-data` runs on it, before the release that carries it.

## Options considered
Talebound's shape in the Specials tab:
1. **Recommended: Blizzard's shape, the trackers in a subcategory.** Specials > Talebound (the 22 general and the 2 introduction achievements) > Bosses (38), Levels (15), Traveling Raven (28). Players find each achievement under the same name as in Blizzard's window; the trackers, which complete with the achievement they mirror, sit apart so they do not double the main lists.
2. Blizzard's shape without the trackers: the 28 stay in the data (search, tooltips, the obtainable state) but in no category.
3. One flat Talebound list of 105.

The Bound Silver filter's label:
1. **Recommended: the game's own currency name** ("Bound Silver" in English, Blizzard's word in every other language), read at runtime, with an English `L[]` fallback.
2. An `L["TaleboundSilver"]` = "Talebound Silver" string, translated into every locale like "Remix Bronze".

## Areas of concern
- Taint and secret values: `GetCategoryInfo` and `C_CurrencyInfo.GetCurrencyInfo` are plain reads at load, no secret values; the filter menu code changes only its list.
- Clients: Retail data only. The reward type enum and the filter are shared, so Mists lists the Bound Silver row with nothing behind it, as it already lists the two Remix rows (`FilterButtonRewardTypes.lua` has no client check); on Mists the runtime name is nil, so the English fallback shows there.
- Blizzard API changes: none.
- Other addons, plugins and skins: plugins read `KrowiAF.Enum.RewardType`; appending keeps every existing value.
- Saved variables: the reward filter keeps a flag per reward type value; a new value appended gets its default (shown), no migration.
- Localization: "Echoes of the Worldcore" in every locale; the fallbacks for the runtime names; exported with `krowi:localization`.
- Embedded libraries: none.
- Data snapshots: Achievements, Registries and CategoryTree for Retail.
- Player-facing text: changelog lines under the next version (12.1.7 patch data; the Bound Silver reward filter).
- The skills: `add-achievement-data` lists the reward types and `Verify-AchievementData.ps1` knows each reward's text; teaching them `:TaleboundSilver()` is a harness change, in a pull request of its own after this one, with the holiday lookup's `-Locale` from the backlog.

## Verification
- Headless: `load-data.lua Both`, `snapshot-data.lua Both -write`, `snapshot-categories.lua -write` and their reviewed diffs; `_evaluate_coverage.ps1 -PatchKey 12_01_07`; `Verify-AchievementData.ps1` on the Midnight file against the PTR (`KAF_RETAIL_PRODUCT=wowt`); `Check-Repo.ps1`.
- In game on Retail (live 12.1.5, where the ids do not exist yet): the Specials tab shows Talebound with its subcategories and names, the reward filter lists Bound Silver; the `options` and `special` suites; no Lua error. The look gate on the filter row.
- On 1 December: the live diff and verify again.

## Decision
Krowi, 2026-11-21:
- Talebound: option 1, **Blizzard's shape with the trackers in a subcategory**: Specials > Talebound (22 general, 2 introduction) > Bosses (38), Levels (15), Traveling Raven (28).
- Names: **Blizzard's names at runtime** for Talebound, Bosses, Levels and the filter's Bound Silver, with English fallbacks; "Echoes of the Worldcore" and "Traveling Raven" (an NPC's name, which no load-time API gives) as `L[]` strings translated into every locale.