# Gates: 2026-11-21-patch-12-1-7
Class: fix/gui

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-21 | scope | Where players find Talebound (90 achievements: 60 in Blizzard's Talebound category, 30 Traveling Raven trackers) | Midnight > Talebound, all 90 | "Specials tab" | other |
| 2026-11-21 | scope | Reward types for Bound Silver and the Traveling Raven items | Bound Silver as Other, the Raven items as NotCategorized | "identify the items for the raven. TailboundSilver like the remix currencies" | own |
| 2026-11-21 | scope | Add 12.1.7 now from the PTR or wait for live | Now from the PTR, provisional, named "Echoes of the Worldcore", recheck on 1 Dec | "Now from the PTR (Recommended)" | took |
| 2026-11-21 | intent | Accept the intent for 12.1.7 | Accept as written | "ok go" | took |
| 2026-11-21 | design | Talebound's shape in the Specials tab (count corrected to 105: 75 in Blizzard's Talebound, 30 under Expansion Features) | Blizzard's shape, the 28 Raven trackers in a subcategory | "Blizzard's shape + Raven sub (Recommended)" | took |
| 2026-11-21 | design | Names in other languages: Blizzard's at runtime or L[] strings | Blizzard's names at runtime, the patch name translated | "Blizzard's names at runtime (Recommended)" | took |
| 2026-11-21 | design | The Raven items' types | The two toys (288899, 288912) as Toy, the containers and Wisdom consumables as Other (item classes 15 and 0 in itemsparse/item) | - | auto |
| 2026-11-22 | plan | The plan (code first, the block, the categories, six strings, look first on Retail, three suites, PR, recheck on 1 Dec) | Approve | "Approve (Recommended)" | took |
| 2026-11-22 | build | Krowi's "set toc to 120107" | 120107 added beside 120105 instead of replacing it, so live Retail does not mark KAF out of date before 1 December | - | auto |
| 2026-11-22 | look | 12.1.7 on the PTR (https://claude.ai/artifact/8t4xLG9MNnAW2SxZHgpMCX): Specials > Talebound with Bosses, Levels, Traveling Raven; Bound Silver in Has Reward | Approve | "Looks good." (asked about the Raven types: 26 Other, 2 Toy, as Remix typed its non-currency rewards; kept) | took |
| 2026-11-22 | test | Quit the PTR and run the Retail and Mists suites | Run them | "Quit ptr and start" (Mists needed Krowi's Social Contract click first: "done") | took |
| 2026-11-22 | design | /code-review (medium): the tooltip's Rewards line showed "TaleboundSilver"; a missing normal Giant; Bound Silver on the campsite and title achievements; the cached filter label; a second category-title helper; "Levels" read as character levels | Fix the tooltip (one GetRewardTypeName for filter and tooltip), the label cache, the helper (GetCategoryInfoTitle takes the fallback) and deDE "Level"; no change for the Giant (63733/63736 do not exist on the PTR) or the four reward lines (their Reward_lang is the campsite or the title alone) | - | auto |
| 2026-11-22 | design | Taint review of the filter, enum and name helper | none found; the cached-label note fixed with the review | - | auto |