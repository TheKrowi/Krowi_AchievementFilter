### Added
- Zul'jarra's Forces Champion added to The Coiled Isle reputation achievements
- Captain Tokka's Crew now shows reputation progress, which Blizzard leaves out of the achievement itself
- Season limited achievements can now be narrowed down to specific weeks of a season: Fabled Let Me Solo Him: Azta'rec is marked as obtainable in week 1 of Midnight Season 2 only
- Temporarily obtainable tooltips now show a season's start and end date next to the season name (Options -> Layout -> Tooltip - Temporarily obtainable -> Show Start Time & End Time)

### Fixed
- Custom criteria, the extra objectives progress the addon adds for achievements Blizzard leaves blank, only showed up on achievement links in chat and were missing from the achievement list, the achievement tooltip and search (dev note: they used to be applied by overriding `GetAchievementCriteriaInfo` and `GetAchievementNumCriteria` globally. That was removed in 93.8 because it tainted everything reading those functions, but nothing replaced it, leaving the whole feature inert. The addon's own rendering paths now look up custom criteria directly and fall back to the game's API, so no global is touched)
- Season limited achievements showed the wrong obtainable state around a season boundary, up to two weeks either side of it (dev note: `C_MythicPlus.GetCurrentSeason` and `GetCurrentArenaSeason` report a season up to two weeks before it opens and keep reporting it up to two weeks after it closed. Season start and end dates are now registered per client through the new `KrowiAF.AddSeasonData` API and take priority over the game's own season number. An anchor is a region agnostic `{year, month, day}` marker holding the date Blizzard announced for NA, which each client snaps to its own weekly reset, so the exact instant stays correct per region and across DST)

### Fixed (100.2)
- Fixed several PvP achievements not being recognized by the PvP filter (Tour of Duty and Training Grounds achievements)