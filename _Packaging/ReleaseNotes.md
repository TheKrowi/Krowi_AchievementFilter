### Added
- 12.0.7 "Revelations" patch data
    - Sporefall raid instance: Rotmire, Heroic: Rotmire, Mythic: Rotmire
    - Goal! housing decor achievement
    - Big Prey Hunter (Season 1) delve achievement
    - Ritual Sites 612: Practical Ritual Work, Pinnacle Ritual Work, Advanced Ritual Site Studies
    - The Curse of Ula'tek mapped to Zul'Aman
    - Omnium Folio void assault subcategory: The Sunstrider Omnium, Omnium Folio Studies
    - Val and Naigtal void assault subcategory with all associated achievements
    - Master of the Turbulent Timeways V added to Turbulent Timeways event
    - Flame Keeper / Flame Warden of Midnight added to Midsummer Fire Festival

### Changed
- Lorewalking subcategory moved from The War Within to Cross-Expansion and extended with Lorewalking: The Loa from Midnight
- Master of the Turbulent Timeways IV marked as no longer obtainable (event ended)

### Fixed (98.1)
- Further taint fix attempt: recurring `attempt to compare a secret number value` and `attempt to perform arithmetic on local 'textHeight'` errors that appeared after hovering over transmog achievements (dev note: the transmog coroutine's owner guard evaluated to false on a nil owner, letting `CopyPrevTooltipLines` write to `GameTooltip` from addon code after the user moved away; fix aborts when owner is nil or not a KAF frame)
- Reverted the `securecall(GameTooltip.Hide, GameTooltip)` workaround added in 97.3 now that the actual root cause is fixed

### Fixed (98.2)
- Instance Achievement Tracker plugin should no longer throw "attempt to call a nil value" when right-clicking an achievement

### Changed (98.2)
- Midnight 12.0.7 achievement reward types corrected: A Trip Around the Stars and A Trip Through the Stars tagged as Mount, Showdown Success: Val and Showdown Success: Naigtal tagged as Pet, Showdown Slugger: Val tagged as Transmog, Ultradon Carnage tagged as Pet

### Mists Classic (98.2)
- Added missing 5.5.3 build version
- Bumped toc to use 5.5.4 as in some rare occasions KAF did not show up in the addon list

### Fixed (98.3)
- Taint fix attempt: `attempt to compare a secret number value (execution tainted by 'Krowi_AchievementFilter')`

### Removed (98.3)
- Abyss Anglers: Heavy Harpoon Cannon (62215) and Abyss Anglers: Hollowcore Harpoon Turret (62216) — these are tracking achievements which are not supported

### Fixed (98.4)
- Taint fix attempt 666?: `attempt to compare a secret number value (execution tainted by 'Krowi_AchievementFilter')`