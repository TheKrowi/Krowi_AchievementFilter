# Plan: 12.1.7 "Echoes of the Worldcore" achievements
Spec: [spec.md](spec.md). Status: done

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

## Where the build departed
- The category names go through the existing `addon.GetCategoryInfoTitle`, which now takes a fallback (not cached, so Blizzard's title wins once the client has it), instead of a new `GetCategoryName` (code review).
- `addon.GetRewardTypeName` and `addon.GetCurrencyName` (`Localization/Shared.lua`) name Bound Silver for both the filter and the achievement tooltip's Rewards lines, which otherwise showed "TaleboundSilver" (code review); the filter reads the name each time its menu is built.
- The TOC lists 120107 beside 120105 (Krowi's "set toc to 120107"), so the PTR loads it without "Load out of date AddOns" and live Retail still does.
- The work folder is `2026-11-21-patch-12-1-7`: the `work-items` rule takes no dots in a slug.
- `Evaluate-FindNewAchievements.ps1` ran after the insert, so it reported the 119 as duplicates and 63685 as missing: its 120 ids are the 119 plus BlizzCon 2026, already in 12.1.5, all in the file.
- `Verify-AchievementData.ps1` flags 64464 and 64465 (`:Toy()` on "Traveling Raven: <toy>"), which it does not know yet; teaching it that and `:TaleboundSilver()` is the harness pull request after this one. Its ten other findings are older lines ("Season One" comments the game now writes "Season 1", three unlock-for-purchase rewards), out of scope.
- No zone data, as planned; the normal-difficulty Giant of Greenthistle Wood does not exist on the PTR (63733, 63736 not found), so Bosses has 38.

## Results
- Headless: `load-data.lua Both` 0 problems; the snapshot diffs are the 119 ids in 12.1.7 with their rewards and records, VERSION 12.1.7, four new categories (Specials > Talebound, Bosses, Levels, Traveling Raven) and the 14 other placements; coverage passes; `Check-Repo.ps1` 0 errors; tooltip, options and special green headless on both clients.
- Look gate on the 12.1.7 PTR (Krowiwo, 2026-11-22): approved.
- In game: Retail 12.1.5 options 37, special 27, navigation 10, tooltip 4 passed; Mists 5.5.4 options 37, special 27 passed; nothing failed; no addon error in BugGrabber on either.
- Taint review: none found.