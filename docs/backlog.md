# Backlog

Follow-ups that are not a work item yet. When one is taken up, it gets its own work folder under `docs/work/` (`docs/sdlc-playbook.md`) and leaves this list.

## From the achievement guides (2026-10-11, PR #338)

- **Archivist Zubashi's name in other locales.** The 60962 guide names the NPC through `addon.L["Archivist Zubashi"]`, which is `= true` (the English name) in all ten other locales. The game API cannot return creature names, and the official translations are not known yet. Source each locale's name from a client in that locale or a trusted database, and fill it in `Localization/*.lua`.
- **About 50 draft translations to review.** Every guide string in the ten non-English locale files is an agent draft:
  - the `Guide ...` and `Show Guide ...` keys;
  - `Map pin`, `Map pin and TomTom`, `Icons` and `Text links`.

  A native speaker checks them, with the game's own terms first: tier, class hall upgrade, Order Resources, waypoint, map pin.
- **The eleven sibling Legendary Research guides.** 60963 to 60973, one per class, as data only in `DataAddons/Retail/07_Legion/GuideData.lua`. Step 0 of `docs/work/2026-10-11-achievement-guides/plan.md` holds everything they need:
  - every class hall's research NPC with its id, map and spot;
  - the travel spell or entrance;
  - both factions' Dalaran portals as area POIs.

  The Paladin and Priest portals differ per faction, so their guides take one `:Poi(...):Faction(...)` step per faction.

## From the latent-bugs review (2026-10-13, PR #339)

- **A "go to" entry for an id the game does not know breaks the whole right-click menu.** `AchievementMenu:AddGoToAchievementLine` concatenates the name `addon.GetAchievmentName(id)` returns. That is nil when `GetAchievementInfo` does not know the id, so both `name .. " (Missing)"` and `name .. nameSuffix` raise "attempt to concatenate a nil value".
  - The callers pass ids from the data: `OtherFaction.lua`, `RequiredFor.lua`, `PartOfAChain.lua` and `FirstCategory.lua`. An id one client lacks, or a removed achievement still in the data, is enough.
  - The menu suite (`Tests/Menu.lua`) takes a third scenario for an id the game does not know, recorded "error". Its in-game before-run comes before the fix.
- **`addon.Util.IsWrathClassic` is never defined.** Krowi_Util defines `IsClassicEra`, `IsBCCClassic`, `IsMistsClassic`, `IsClassicWithAchievements`, `IsTheWarWithin`, `IsMidnight` and `IsMainline` (`Libs/Krowi_Util/Krowi_Util.lua:18-24`).
  - 18 reads in the addon's own code therefore always take their non-Wrath branch: the achievement tab indices and tab buttons, the Guild tab, the Wowhead link, the plus/minus and shield textures, and the ElvUI world map fix. `Libs/Krowi_Util/Options/Options.lua:83` has the same dead branch.
  - The `.toc` still lists 38002, a Wrath client. Decide whether that client is still supported:
    - if it is, restore the flag in Krowi_Util and check those branches in game;
    - if it isn't, remove the branches and the interface version.
  - The taint review of the 2026-10-11-latent-bugs work found it, while that fix dropped the two branches in `Options/General.lua`.