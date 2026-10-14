# Backlog

Follow-ups that are not a work item yet. When one is taken up, it gets its own work folder under `docs/work/` (`docs/sdlc-playbook.md`) and leaves this list.

## From the 103.0 release (2026-10-14)

- **`Benchmark.lua` ships but nothing loads it.** The file is tracked and goes into every release zip, yet no `.toc` line or `Files.xml` names it; it has been so since 97.2. Remove it, or register it behind `addon.Diagnostics.DebugEnabled()` if it is still wanted.

## From the reward preview Escape review (2026-10-13, PR #340)

- **Blizzard's bulk closes leave the achievement window open.** Blizzard calls `CloseAllWindows` on death, on loss of control, at a loading screen and when the store opens.
  - Each call hides `KrowiAF_SpecialFrame` once, and its `OnHide` closes only the addon's topmost registered frame (`Gui/FramesForClosing.lua`). With a side panel, the calendar or the data manager open over the window, the window stays open.
  - That has been so for every registered frame since 101.0.
  - A fix tells a bulk close from an Escape press, for example by closing every registered frame when the call is not the Escape chain's. It gets a scenario in the escape suite.
- **Re-pinning a shown side panel keeps its old place in the Escape order.** `ShowUnpinned` on a panel that is already shown fires no `OnShow`, so moving the reward preview or the guide panel to another row leaves it where it was in `framesForClosing`. Escape may then close the other panel first. A fix raises the frame in the list when it is shown again, through `gui.RegisterSidePanel` or a new `gui:RaiseFrameForClosing`.

## From the achievement guides (2026-10-11, PR #338)

- **About 50 draft translations to review.** Every guide string in the ten non-English locale files is an agent draft:
  - the `Guide ...` and `Show Guide ...` keys;
  - `Map pin`, `Map pin and TomTom`, `Icons` and `Text links`.

  A native speaker checks them, with the game's own terms first: tier, class hall upgrade, Order Resources, waypoint, map pin.
- **The eleven sibling Legendary Research guides.** 60963 to 60973, one per class, as data only in `DataAddons/Retail/07_Legion/GuideData.lua`. Step 0 of `docs/work/2026-10-11-achievement-guides/plan.md` holds everything they need:
  - every class hall's research NPC with its id, map and spot;
  - the travel spell or entrance;
  - both factions' Dalaran portals as area POIs.

  The Paladin and Priest portals differ per faction, so their guides take one `:Poi(...):Faction(...)` step per faction. Each NPC is named in English only; the guide shows the player's client's own name (`docs/work/2026-10-14-guide-npc-names`).

## From the latent-bugs review (2026-10-13, PR #339)

- **A "go to" entry for an id the game does not know breaks the whole right-click menu.** `AchievementMenu:AddGoToAchievementLine` concatenates the name `addon.GetAchievmentName(id)` returns. That is nil when `GetAchievementInfo` does not know the id, so both `name .. " (Missing)"` and `name .. nameSuffix` raise "attempt to concatenate a nil value".
  - The callers pass ids from the data: `OtherFaction.lua`, `RequiredFor.lua`, `PartOfAChain.lua` and `FirstCategory.lua`. An id one client lacks, or a removed achievement still in the data, is enough.
  - The menu suite (`Tests/Menu.lua`) takes a third scenario for an id the game does not know, recorded "error". Its in-game before-run comes before the fix.