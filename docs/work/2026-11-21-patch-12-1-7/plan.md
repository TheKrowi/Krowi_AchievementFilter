# Plan: 12.1.7 "Echoes of the Worldcore" achievements
Spec: [spec.md](spec.md). Status: draft

## Files that change
- `Api/AchievementDataApi.lua`: `"TaleboundSilver"` appended after `"KeystoneResilience"` in `KrowiAF.Enum.RewardType`; the builder gets `:TaleboundSilver()` from the enum.
- `Gui/WindowFrames/FilterButton/FilterButtonRewardTypes.lua`: `TaleboundSilver` in `rewardTypeSpecialCases` and a row after Remix Infinite Knowledge, labelled with `C_CurrencyInfo.GetCurrencyInfo(3361)`'s name, else `L["Bound Silver"]`.
- `Localization/Shared.lua`: `addon.GetCategoryName(categoryId, fallback)`, Blizzard's category title through `GetCategoryInfo`, else the fallback, beside `GetLFGDungeonInfo` and `GetMapName`.
- `DataAddons/Retail/12_Midnight/AchievementData.lua`: the `12_01_07` block, the 119 ids ascending, built by `add-achievement-data` from `_lookup_ids.ps1` on the PTR (mount id for Markeet of the Infinite, decor ids for the four Lorewalking, `:WarbandCampsite()`, the four titles, `:TaleboundSilver()` on the Bound Silver rewards, `:Toy()` on 64464 and 64465, `:Other()` on the other Raven rewards, `Obtainable("Event", 141)` on the six neighborhood Winter Veil achievements as on 62502, `Obtainable("Event", 1425)` on Timeways VI as on V).
- `DataAddons/Retail/12_Midnight/BuildVersionData.lua`: `minor:Patch(7, addon.L["Echoes of the Worldcore"])`.
- `DataAddons/Retail/CategoryData_Specials.lua`: Talebound after Mythic+, with `:Key("Talebound")`, named `addon.GetCategoryName(15625, addon.L["Talebound"])`; Bosses (15627), Levels (15628) and `L["Traveling Raven"]` under it.
- `DataAddons/Shared/CategoryData.lua`: the four Lorewalking in cross-expansion Lorewalking. `DataAddons/Retail/CategoryData_Events.lua`: the six neighborhood in Winter Veil, Bow Go and Let's Put A Bow On It in Winter Veil > Gifts, Timeways VI in Timewalking > Turbulent Timeways. `DataAddons/Retail/12_Midnight/CategoryData.lua`: The Coreway Advance in Midnight's quests where `add-category-data` places it.
- Zone data: none in this work item; the Talebound tales, The Coreway Advance and the holiday rows are logged in `raw/ZoneDataDecisions.md` as waiting for Map Verifier verdicts or skipped, as 12.1.5 did.
- `Localization/*.lua` (11 base files): "Echoes of the Worldcore", "Talebound", "Bosses", "Levels", "Traveling Raven", "Bound Silver", below the `Exported at` line, translated into every language (the last four as fallbacks for Blizzard's runtime names).
- `.claude/tools/headless/client-env.lua`: one added line giving `addon.GetCategoryName` an id-encoded stub, as the other name helpers have (an addition, so the snapshots stay locale-free).
- Snapshots: Achievements, Registries, CategoryTree (Retail); `Tests/Options.lua` only if the options fingerprint moves.
- `_Packaging/Changelog.md`: "12.1.7 patch data" with the parts as sub-bullets, and the Bound Silver reward filter.

## Order of work
1. Enum, builder check, filter row, name helper, headless stub; `load-data.lua Both`.
2. The achievement block and BuildVersionData; `Verify-AchievementData.ps1` on the Midnight file against the PTR (`KAF_RETAIL_PRODUCT=wowt` in each call); Achievements snapshot and its diff.
3. The categories; `_evaluate_coverage.ps1 -PatchKey 12_01_07`; CategoryTree and Registries snapshots and their diffs.
4. The locale lines, the changelog, `Check-Repo.ps1`; `data-verifier` on the block.
5. Look first (Krowi, 2026-11-09): deploy to Retail, the reward filter's Bound Silver row and Specials > Talebound on screen, Krowi judges. The live client lacks the 12.1.7 ids and categories, so the tree shows the fallback names and hides ids the game does not know yet; the PTR client (`_ptr_`, 12.1.7) shows the real thing if Krowi has a character there.
6. After the look: the `options`, `special` and `navigation` suites on Retail, `Read-GameErrors.ps1`; Mists only for the filter row (the shared enum and menu).
7. PR, `/code-review`, `krowi:taint-reviewer` on the filter change; the merge gate. On 1 December, the live diff and verify again before the release.

## Risks
- PTR ids and rewards change before 1 December: the recheck in step 7.
- `GetCategoryInfo(15625)` on the live 12.1.5 client returns nothing until 12.1.7: the fallbacks show, so the names are right for English and mine for the others until then.
- An appended reward type with no achievements on Mists leaves an empty filter row there, as the Remix rows already are.

## Proof
Requirements 1, 3 and 4 by the Achievements snapshot diff and verify; 2 by the headless load (an unregistered patch fails it); 5 and 6 by the coverage check and the CategoryTree diff; 7 by the checks themselves; the filter and the tab by the look gate and the suites.