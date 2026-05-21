### Added
- Mythic+ seasons for Shadowlands and Dragonflight are now listed under their respective expansion's Dungeons category (in addition to the Specials tab)
- Midnight Keystone Myth: Season One

### Changed
- Wrath of the Lich King, Cataclysm, Mists of Pandaria, Warlords of Draenor, Legion, Battle for Azeroth, Shadowlands and Dragonflight achievement data internally migrated to a new fluent V2 builder format (dev note: this is an invisible change for users; the new format uses method chaining instead of nested tables — e.g. `Ach(12345):Mount():PvE(13)` — which greatly improves readability and reduces data entry errors)
- WoW Anniversary achievements for the 16th through 21st anniversaries now use explicit date-based obtainability windows instead of calendar event IDs, making them more reliable
- Enhanced the achievement reward to be more performant (dev note: filtering and tooltips should be more responsive)

### Fixed
- Attempted fix for a recurring Lua error that could appear in the chat frame after hovering over a category or the world map icon (dev note: WoW 12.0.0 introduced "secret number values" — a security mechanism that marks frame measurements as tainted when addon code writes into Blizzard-owned frames; the progress bar was permanently parented to Blizzard's `GameTooltip`, and calls to `SetParent`, `SetHeight`, `SetPoint`, and `GameTooltip_AddBlankLinesToTooltip` against it were corrupting its layout state; the fix moves the progress bar into a library-owned `Krowi_ProgressBarTooltip` frame so Blizzard's `GameTooltip` is never touched by KAF's tooltip code)

### Removed
- "Ta's Pet Collection" removed from the Specials tab (dev note: this category was no longer maintained and is now part of [Khamuls Housing/Toys/Mounts/Pets Collections Plugin](https://github.com/KhamulAT/Krowi_AchievementFilter_Khamuls_ExpMetaAchievementFilter))
- WoW Anniversary events (18th, 19th, 20th, 21st) removed from the Events reminder system; obtainability is now tracked via date ranges directly on the achievements instead
- Removed obsolete localization strings for anniversary event category names that are no longer needed (10th, 18th, 19th, 21st)

### Mists Classic
- Changed Wrath of the Lich King, Cataclysm and Mists of Pandaria achievement data internally migrated to a new fluent V2 builder format (dev note: this is an invisible change for users; the new format uses method chaining instead of nested tables — e.g. `Ach(12345):Mount():PvE(13)` — which greatly improves readability and reduces data entry errors)
- Fixed Mists of Pandaria 5.5.3 missing build version