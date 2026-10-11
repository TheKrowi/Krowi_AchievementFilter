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