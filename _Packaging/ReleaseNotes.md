### Changed
- Wrath of the Lich King, Cataclysm, and Mists of Pandaria achievement and event data internally migrated to shared files (dev note: invisible change for users; eliminates duplicate data between Retail and Classic clients)
- Vanilla, The Burning Crusade, Wrath of the Lich King, Cataclysm, and Mists of Pandaria category data internally migrated to shared files (dev note: same as above)
- Achievement data corrections from a comprehensive QA pass across WotLK, Cataclysm, Mists of Pandaria, Warlords of Draenor, Legion, Battle for Azeroth, Shadowlands, Dragonflight, The War Within, and Midnight — faction splits, reward types, and obtainability flags corrected
- esES, esMX, itIT, and koKR locale files are now properly registered and loaded (the files existed but were not listed in the manifest and were therefore silently ignored)
- Common category name strings (Player vs. Player, Quests, Battlegrounds, Arena, Dungeons & Raids, Professions, Reputation, etc.) are now sourced from WoW's own GlobalStrings in `Shared.lua` instead of being duplicated in every locale file, making them automatically correct in all languages
- Updated and expanded translations across multiple locales including a large new koKR translation batch

### Fixed
- Further taint fix attempt: tooltip positioning for achievement tooltips, browsing history navigation buttons, and event reminder alerts now uses built-in WoW anchor types instead of manual `SetPoint` calls, which should prevent taint propagation (dev note: replaced `ANCHOR_NONE` + `SetPoint` with `ANCHOR_BOTTOMRIGHT`/`ANCHOR_BOTTOMLEFT` with offsets across all affected `GameTooltip:SetOwner` calls)
- Category, instance, and map name lookup fallbacks now safely convert the ID to a string, preventing potential type errors when a lookup returns nil