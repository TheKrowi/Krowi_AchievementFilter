# Changelog
All notable changes to this project will be documented in this file.

## 85.2 - 2025-07-19
### Fixed
- GW2_UI compatibility issue when disabling Event Reminders

## 85.1 - 2025-07-02
### Mists Classic
- Version 5.5.0 filtering

## 85.0 - 2025-06-27
### Added
- More tooltip data for Mists of Pandaria content

### Changed
- General achievements cleanup

### Mists Classic
- Added support

### Cata Classic
- Removed support

## 84.0 - 2025-06-18
### Added
- Missing 11.1.5 The Enterprising Dungeon Master achievements
- Turbulent Timeways achievements (1)
- Rise of the Red Dawn achievements (2)
- Legion raid achievements (4)
- Lorewalking achievements (3)
- D.I.S.C. and Overcharged Delve achievements (2)
- Version 11.1.7 filtering

## 83.4 - 2025-06-06
### Added
- Dastardly Duos zone data
- A lot of Pet Battle tooltip data provided by Silden
- Credits for Malivil and Silden for contributing to the addon

### Fixed
- Only temporarily obtainable achievements that are currently obtainable should have a green header color

## 83.3 - 2025-06-03
### Added
- Flame Warden of Khaz Algar to the Midsummer category
- Flame Warden of Khaz Algar is now temporarily obtainable
- Dastardly Duos achievements are now temporarily obtainable
- Export to CSV (dev note: this is an experimental feature available in the options under General -> Debug -> Export to CSV)
- Isle of Dorn Skyriding Races tooltip data

### Fixed
- Dastardly Duos event reminder (EU)

## 83.2 - 2025-05-29
### Added
- Dastardly Duos event reminder

## 83.1 - 2025-05-17
### Added
- Portuguese (Brazilian) translations

### Fixed
- Version 11.1.5 should now also be available for filtering

## 83.0 - 2025-04-22
### Added
- Nightfall event achievements (4)
- Dastardly Duos event achievements (19)
- Horrific Visions Revisited achievements (29)

## 82.4 - 2025-04-14
### Fixed
- The default Blizzard Achievements tab should once again know all its categories
- Tasks should no longer be empty (dev note: this is a "temporary" fix until I have more time to find the source of the issue)

## 82.3 - 2025-03-01
### Added
- Addon category

## 82.2 - 2025-02-26
### Fixed
- Another potential memory leak addressed

## 82.1 - 2025-02-26
### Changed
- Upgraded the world map button library to reflect the now vertical layout

### Fixed
- Potential memory leak addressed

## 82.0 - 2025-02-10
### Added
- 11.1 achievement (159)
- New Warband Campsite achievement reward filter

### Fixed
- Master of the Turbulent Timeways is no longer obtainable even when the Turbulent Timeways event is active
- Delve category names should no longer have the tier in the name
- Uncategorized category should be working again

## 81.4 - 2025-01-21
### Fixed
- Achievement points should once again be counted "correctly" (dev note: a feature to show other faction achievements as completed for meta achievements resulted in also counting those as completed resulting in high numbers; this feature is removed for the time being until a proper fix can be developed)

## 81.3 - 2025-01-16
### Fixed
- Resolved an error when both the Achievement Window and the Calendar are open

### Removed
- Plunderstorm event

## 81.2 - 2025-01-11
### Added
- Option to change the transparency of the faction icon

### Fixed
- Plugin options should no longer cause errors for ElvUI and GW2_UI

## 81.1 - 2025-01-10
### Fixed
- Resolved some loading order issues related to ElvUI and event reminders

## 81.0 - 2025-01-09
### Added
- The watch list can now be a mix of account wide achievements for one character, character specific achievements for another character or all account wide or character specific
- Shadowlands Mythic+ season categories in the Specials tab
- Achievements can now have multiple moments when they were available to earn
- Cross-Expansion - Delves category is now moved from The War Within to Cross-Expansion
- Has Reward filter with additional reward type filters
- Show Other Faction Warband as Completed option (dev note: see loc for details)
- Plunderstorm and Turbulent Timeways events
- Upcoming Calendar Event Reminders with a lot of options

### Changed
- Factions and EventType are now accessible trough the API system

### Fixed
- When marking an achievement as watched, the view should no longer completely reset
- Side buttons are once again skinned when using GW2 UI

## 80.2 - 2024-12-18
### Added
- Lingering Shadows achievement

## 80.1 - 2024-12-18
### Added
- Patch 11.0.7 to the filters

## 80.0 - 2024-12-17
### Added
- Achievements added in 11.0.7
- Feature to prioritize which tab is used when getting redirected to an achievement
- Has Reward filter (dev note: reward type filters will come in a later version)
- Option to show a Warband icon on Warband achievements
- Option to hide the blue Warband achievement color
- Option to completely turn off the Event Reminders Module with 1 option

## 79.0 - 2024-11-15
### Added
- Guild achievements tab keybind
- WoW's 20th Anniversary achievement

### Changed
- Achievements and Categories are now moved to the new API system
- Data loading time is reduced by 50%

### Cata Classic
- Additional (promotional) achievements marked as unobtainable

## 78.0 - 2024-11-01
### Added
- Transmog sets for The War Within raid and season 1

### Changed
- Transmog sets are now moved to the new API system

### Removed
- Khaz Algar Lore Hunter achievement

## 77.0 - 2024-10-31
### Changed
- Backend data is now prepared to be more API friendly (in case KAF support ever stops)

### Cata Classic
- Opening a category from the event reminders or going to an achievement from a link, tracker, ... should once again work without errors

## 76.2 - 2024-10-27
### Fixed
- Compatibility with GW2_UI and BetterWardrobe addons

## 76.1 - 2024-10-24
### Fixed
- Loading of KAF should once again load everything

## 76.0 - 2024-10-23
### Added
- Storm Rider races tooltip data
- WoW's 20th Anniversary achievements 

### Changed
- Event Data rework

### Cata Classic
- Added Protocol Inferno achievements

## 75.8 - 2024-09-02
### Added
- Categorized more achievements (thank you Seb)

## 75.7 - 2024-08-23
### Added
- Missing map data for the 4 main zones

## 75.6 - 2024-08-21
### Added
- Achievements added in 11.0.2

### Fixed
- Tracking achievements should once again show as a category when it's enabled
- Temporarily shown achievements icon is not update and no longer uses the flight path icon
- Achievements without a category should no longer cause an error

## 75.5 - 2024-08-15
### Fixed
- Library bug

## 75.4 - 2024-08-12
### Fixed
- Turned off errors again when translations are missing

## 75.3 - 2024-08-12
### Changed
- Updated all localization

## 75.2 - 2024-07-31
### Added
- Radiant Echoes are now available as Event Reminders

## 75.1 - 2024-07-30
### Cata Classic
- Fixed an issue during loading
- Fixed an issue with the Right Click Menu of the Achievements

## 75.0 - 2024-07-30
### Changed
- Updated the Right Click Menu of the Achievements to use the new DropDown system
- Pet Battle Link Data rework
- Tooltip Data is now included in KAF and is no longer a separate addon

## 74.4 - 2024-07-25
### Fixed
- The Browsing History will now also work for the Achievements tab

## 74.3 - 2024-07-24
### Changed
- Updated the Right Click Menu of the Event Reminders to use the new DropDown system

### Fixed
- GW2_UI compatibility

## 74.2 - 2024-07-24
### Changed
- The Browsing History will now track the actual achievement's category if the achievement was selected in a category with flexible data like the Adjustable Categories

### Fixed
- Uncategorized should once again load properly

## 74.1 - 2024-07-24
### Fixed
- All data should once again load properly

### Cata Classic
- Achievements tab should once again know which achievements to show

## 74.0 - 2024-07-24
### Added
- The War Within category and subcategories in the Expansions tab with all the new achievements (371)
- Deephaul Ravine achievements (8)
- Worldsoul Memory event achievements (5)
- Misc achievements (4)
- Map data for most new achievements
- Summary category is now part of the Adjustable Categories group and can be shown or hidden (dev note: Game Menu -> Options -> AddOns -> Krowi's Achievement Filter -> Layout -> Adjustable Categories -> Summary)

### Fixed
- Several bugs in preparation for The War Within (Beta) changes

### Changed
- Draconically Superior and Draconically Epic are now temporarily obtainable
- Draconically Superior and Draconically Epic, Dreaming of Drakes, Dreaming of Wyrns and Dreaming of the Aspects moved from the Cross-Expansion Character category to the Dragonflight Character category
- Trading Post: Dragonflight moved from the Cross-Expansion Character category to the Promotions
- Renamed category The Temple of Atal'hakkar to Sunken Temple
- Renamed The Stockade to Stormwind Stockades
- Updated the Filter in the Achievement Window to use the new DropDown system (dev note: will most likely cause errors with ElvUI and GW2_UI the first few days)
- Data clean up after the migration to the new data structure last year (dev note: a new expansion is the best moment to do this, especially with all the changes Blizzard made to achievements) (dev note 2: should result in 50-63% less duplicate data and potentially memory usage)
- Cleaned up Event Reminders naming and should now be more consistent
- Adjustable Categories rework for better maintainability

### Wrath Classic
- No longer supported

## 73.6 - 2024-06-27
### Fixed
- Several bugs in preperation for The War Within (Beta) changes

## 73.5 - 2024-06-25
### Fixed
- Fate of Nathria and Fate of Domination chains should now be correct
- Most progress section in the achievement tooltip will no longer show for past achievements that are now unobtainable

## 73.4 - 2024-06-23
### Fixed
- GW2 UI skin
- Tabs order options

## 73.3 - 2024-06-23
### Cata Classic
- Fixed hooksecurefunc error

## 73.2 - 2024-06-22
### Added
- Temporary obtainable achievements now have the option to show an extra icon indicating if it is / was / will be obtainable
- Temporary obtainable achievements header color can now be removed

### Fixed
- Several bugs in preperation for The War Within (Beta) changes

## 73.1 - 2024-06-15
### Cata Classic
- Added several missing achievements
- Corrected several achievements faction

## 73.0 - 2024-06-11
### Fixed
- Several bugs in preperation for The War Within (Beta) changes

## 72.5 - 2024-06-09
### Added
- Temporary obtainable achievements that require a calendar event to be active now have an icon on the achievement making it more obvious

### Cata Classic
- I Can't Hear You Over the Sound of How Awesome I Am is once again obtainable

## 72.4 - 2024-05-25
### Fixed
- Remix: Pandaria achievements now show the remix icon on the achievement with the duration of the event

## 72.3 - 2024-05-23
### Fixed
- Superior (Shadowlands) and Epic (Shadowlands) are now marked as no longer obtainable
- Watch List and Excluded categories no longer show Unknown as their names

## 72.2 - 2024-05-21
### Added
- Remix: Pandaria achievements now show the remix icon on the achievement

## 72.1 - 2024-05-20
### Added
- Map data to Remix: Pandaria achievements

### Tooltip Data
- Code cleanup and API improvements

## 72.0 - 2024-05-12
### Added
- Hunt the Harbinger achievement
- Past, Current and Future Obtainable filters (dev note: replace the old Obtainable and Not Obtainable filters)

### Fixed
- WoW Remix: Mists of Pandaria (formerly Pandaria: Remix) should now be correctly track

### Cata Classic
- Fixed missing criteria info for The Cataclysmic Gourmet (30)

### Tooltip Data
- Added Dragon Racing Challenges
- Added Northrend Cup
- Now shows the achievement > criteria

## 71.0 - 2024-05-08
### Added
- Browse now your previously selected achievements if you want to go back and forward with ease
- Option to move the calendar button to open the achievement calendar

### Fixed
- Errors occurring during combat should be drastically reduced when opening the achievements window
- Strange behavior where more than one achievement is selected should be resolved

### Cata Classic
- Fixed ElvUI skinning bug
- Fixed issues with missing linked Silverpine Forest Quests and Ghostlands Quests achievements

## 70.0 - 2024-05-01
### Added
- Pandaria: Remix achievements (157)
- Achievements that require a calendar event to be active now show this in their tooltip
- Taintless library to hopefully eliminate some occurrences of "Interface action failed because of an AddOn" and "AddOn has been blocked from an action only available to the Blizzard UI" error messages
- Awakened Raids achievements to the corresponding raids so they show up in the current zone

### Fixed
- Placeholder achievements filtering (dev note: mainly used for development and adding achievements that will be added in a later patch)
- Toggling the Achievement window when on the Guild tab now properly shows the Guild achievement points

### Changed
- Moved Many Boxes, Many Rockses from Dragonflight - Zones - Dragon Isles - Exploration to Dragonflight - Zones - The Waking Shores - Exploration

### Removed
- Ui Maps linked to Profession achievements for all expansions (dev note: it does not feel right to see profession achievements when you want to see which achievements you could do in the current zone you're in)

### Cata Classic
- First port from Wrath Classic
- Classic, TBC, WotLK and Cata achievements and categories adjusted and dynamic obtainability added
- MoP, WoD, Legion, BfA, SL and DF categories removed
- Realm First! achievements and categories adjusted and dynamic obtainability added
- PvP achievements and categories adjusted and dynamic obtainability added

## 69.9 - 2024-04-05
### Fixed
- Dreaming Hero: Dragonflight Season 3 is now in the correct category and is no longer flagged as PvP
- Draconic Hero: Dragonflight Season 4 is now in the correct category
- Dragonflight Season 4 PvP achievements are now correctly flagged as PvP
- Ahead of the Curve: Fyrakk the Blazing and Cutting Edge: Fyrakk the Blazing are now correctly flagged obtainable only during Dragonflight Season 3

## 69.8 - 2024-04-05
### Changed
- Dreaming of Drakes, Dreaming of Wyrms and Dreaming of the Aspects are now flagged obtainable only during Dragonflight Season 3

## 69.7 - 2024-04-03
### Added
- Option to center the achievements window header

## 69.6 - 2024-03-31
### Fixed
- The calendar should show achievements on the correct date when DST changes

## 69.5 - 2024-03-31
### Fixed
- Removed end spaces of all German translations

## 69.4 - 2024-03-25
### Changed
- Primal Storm event icons now match the achievement icons

## 69.3 - 2024-03-23
### Added
- Progress on Events -> Miscellaneous -> Plunderkind

## 69.2 - 2024-03-21
### Changed
- Bumped toc to 10.2.6 for Dragonflight

## 69.1 - 2024-03-20
### Fixed
- Localization

## 69.0 - 2024-03-20
### Added
- New Back from the Beyond achievement
- Plunderstorm achievements (2)
- Noblegarden achievements (1)
- Dragonflight Mythic+ Season 4 achievements (13)
- Dragonflight PvP Season 4 achievements (18)
- Awakened Raids achievements (12)
- Misc achievements (9)
- Dragon racing achievements (1)

### Changed
- Back from the Beyond is now a legacy achievement

## 68.4 - 2024-03-12
### Fixed
- Moved Just an Ordinary Gas Cloud from Dragonflight - Profession - Engineering to The Burning Crusade - Profession - Engineering

## 68.3 - 2024-02-08
### Fixed
- Nation of Adoration, Flirt With Disaster and Charming are now realy no longer obtainable

## 68.2 - 2024-02-07
### Added
- Russian localization
- 10.2.5 Reclamation of Gilneas and Champion of the Dragonflights

### Fixed
- In the Hall of the Thunder King is once again obtainable

### Changed
- Nation of Adoration, Flirt With Disaster and Charming are no longer obtainable

## 68.1 - 2024-01-17
### Fixed
- Intarface bumped to 10.2.5

## 68.0 - 2024-01-16
### Added
- Added in version now shows the name of the patch if it's known
- Fyr'alath the Dreamrender and Of the Tyr's Guard
- 10.2.5 Northrend Cup achievements (12) and event
- New 10.2.5 Love is in the Air achievements (2)
- 10.2.5 Hearthstone's 10th Anniversary achievements (3)
- Other Promotional achievements (1)

### Fixed
- Primal Storm events should once again show when tracked
- Moved Petty Theft Mammoth and Grand Theft Mammoth from Ohn'ahran Plains to The Waking Shores
- Amirdrassil raid achievements should now correctly be linked to the raid zone
- ElvUI compatibility
- An error could occur when you click an achievement in the tracker to show it in the achievement window

## 67.2 - 2023-12-13
### Fixed
- When the option to automatically limit the number of summary achievements is enabled, the calendar side window should not be affected

## 67.1 - 2023-11-19
### Fixed
- ElvUI skin bug

### Wrath Classic
- Fixed a an error that occured when opening the data manager

## 67.0 - 2023-11-18
### Added
- Import and export character data from the data manager

### Fixed
- Watched and Excluded achievements should no longer reset unexpectedly
- Uncategorized category should once again only have uncategorized achievements

## 66.2 - 2023-11-12
### Wrath Classic
- Summary categories should once again group by 2 if the achievements and summary width is not changed

## 66.1 - 2023-11-12
### Changed
- Wrath of the Lich King achievements Added in version should now more reflect the actual version they were added in and not all 3.4.0 Wrath Classic

### Fixed
- Not English clients should once again work

## 66.0 - 2023-11-11
### Added
- Outland Cup event
- Adjustable width for the achievements and summary

### Changed
- Both Researchers Under Fire events are now showing the 'Next' and 'Active' timers instead of the entire week when in Zaralek Cavern (outside will show that no time data is available)
- Dreamsurges are now showing the 'Next' timer for the next portal instead of the entire week
- Widget events are now also grouped under the world events as this makes more sense for the end user
- Events are now grouped per expansion instead of having a prefix

### Fixed
- Dreamsurges are now properly tracked (new Ids so settings might need to be reapplied)
- Fyrakk Assaults should once again properly track
- Potential fix for Excluded achievements resetting
- Tracking achievements that show as meta achievements should no longer throw an error when tracking achievements are not loaded
- Linked Hail to the Chef (again)
- ElvUI skin should now once again apply to event reminders

## 65.0 - 2023-11-07
### Added
- The Lick King, Lil' Maggz and Ysergle The Dreamurk
- The tooltip opened by clicking an achievement link from chat for example now also reacts to right clicks
- Filter on "Added in version"
- Option to automatically adjust the summary achievements list to fit the space without showing a scroll bar
- Right clicking an event reminder on the side of the Achievement Window or the World Map will show a menu with the option to stop tracking that specific event
- Uncategorized category as an adjustable category which shows achievements not added to KAF yet
- PvP Dragonflight Season 3 achievements (19)
- Mythic Plus Dragonflight Season 3 achievements (11)
- Amirdrassil, the Dream's Hope raid achievements (30)
- Emerald Dream zone achievements (38)
- Superbloom event achievements (4) and event reminders
- More PvP achievements (6)
- Pet Battle achievements (1)
- Misc achievements (7)
- Collector's Edition achievements (5)
- Transmog sets to the 3 dragonflight pvp season achievements and the new raid
- More French and German translations

### Changed
- Tons of back end changes
- Moved The Horseman's Reins achievement to Events - Holidays - Hallow's End
- Last completed achievements in the summary view should now be more accurate for the 5 last earned achievements
- Transmog set data handling is now more streamlined

### Fixed
- Whenever the tooltip refreshes when mousing over achievements with transmog data is loaded, all lines will remember their color
- When mousing over categories, the progress bar should now fill properly
- When in combat, closing the windows by pressing Escape (button to toggle the game menu) should no longer result in errors
- Forge and Befuddle now has a faction linked to it
- Linked Forge and Befuddle
- Event Reminder localization of time left should now be working correctly
- Event Reminder localization of end time when using a custom format containing %a, %A, %b or %B should now be working correctly
- Event Reminders should now always have a category linked and no longer cause errors
- Event Reminders should now more reliably register a mouse click
- Current Zone category should now show more reliably
- Cosmic Chic should no longer cause errors when mousing over is

### Wrath Classic
- Bumped version
- Translations should once again be in the correct language
- Linked Hail to the Chef

## 64.1 - 2023-10-05
### Added
- Warcraft Rumble promotion achievements (17)

### Wrath Classic
- German language problems should be resolved

## 64.0 - 2023-09-30
### Changed
- Certain events that are different per region (EU, US, ...) are now handled as one
- Data structure for events

### Fixed
- Turbulent Timeways event is now working for all regions
- Pre-emptive fix for GW2 UI plugin in 10.2

### Wrath Classic
- Defense Protocol Gamma achievements (16)

## 63.2 - 2023-09-21
### Fixed
- Earned By and Not Earned By in the achievement tooltip should once again work correctly

## 63.1 - 2023-09-20
### Added
- Seeing Red

### Fixed
- Achievements with no "Added in version" should no longer cause errors

## 63.0 - 2023-09-17
### Added
- Missing translation
- "Added in version" to the tooltip with options to disable it (filters coming later)

### Changed
- Loading cache data is now more efficient and should not cause any frame drops
- Updated German translations
- Flagged Arcane Influence as Unobtainable (Never for now as I have no other way to flag event related achievements)

## 62.4 - 2023-09-11
### Added
- Option to add Krowi's Achievement Filter to the world map icon tooltip
- Arcane Influence to the Secrets of Azeroth event

### Changed
- Left clicking the minimap icon will now open the tab the micro button would

### Fixed
- Rebinding the Micro Button now also works for the default Blizzard tabs
- Earned By filter

## 62.3 - 2023-09-07
### Added
- Lil' Frostwing (new), A Blue Dawn achievements

### Fixed
- Now able to handle existing achievements that are not yet added to KAF but that are in game already

### Removed
- Lil' Frostwing (old) achievement

## 62.2 - 2023-09-06
### Changed
- Updated German translations

### Fixed
- Untracking achievements should once again work
- Certain achievements should no longer give errors when mousing over them

## 62.1 - 2023-09-06
### Fixed
- Searching achievements should once again work without errors
- No more errors should occur on login/reload when Tracking achievements are enabled 

### Wrath Classic
- Loading Pet Battles is skipped

## 62.0 - 2023-09-04
### Added
- New profession achievements (113)
- Eastern Kingdoms Cup achievements (12) and event
- Outland Cup achievements (no event yet) (12)
- WoW's 19th Anniversary achievements (2)
- Dragon Racing Challenge achievements for each Dragon Isles zone (18)
- Hallow's End achievements (3)
- Additional Fyrakk Assault achievement (1)
- Dreamsurge achievement (1) and events (only Ohn'ahran Plains verified)
- Turbulent Timeways achievement (1) and event
- Brewfest achievement (1)
- Neltharion's Legacy achievement

### Fixed
- Earned By visualization should once again color achievements correctly
- Stocking Up, Preparing for Disaster and Ultimate Triage are once again obtainable
- WoW's 18th Anniversary is no longer obtainable

### Changed
- Data structure of saved characters and achievements
- Subdivided most profession achievements per profession
- Optimized exports
- Now using CurseForge for localization

## 61.0 - 2023-08-15
### Added
- Implemented proper handling of profile change, copy and reset
- Introduced Profiles for the Filters (these are not tied to the Options)

### Fixed
- Search Options are now saved to the correct Saved Variables
- Options now have proper unique names

### Changed
- Cleaned up toggles in code

### Removed
- Kalimdor Cup World events (Calendar event still exists)

## 60.2 - 2023-08-11
### Changed
- Updated Util lib

## 60.1 - 2023-08-09
### Fixed
- Searching achievements should no longer cause an error

## 60.0 - 2023-08-09
### Added
- Now uses the Addon compartment (minimap button is still available for those who use it)
- Introduced Profiles

### Changed
- Lots of backend code is now shared between all my addons

## 59.4 - 2023-07-23
### Fixed
- GW2 UI plugin

## 59.3 - 2023-07-21
### Fixed
- Zygor Guides Viewer should once again give a proper message when a guide is not found

## 59.2 - 2023-07-18
### Added
- Sort achievements by points

## 59.1 - 2023-07-15
### Added
- Option to select the window the Side Buttons will attach to on the right side

### Fixed
- Community Feast should once again have timers

## 59.0 - 2023-07-14
### Added
- Map data to the Dawn of the Infinite dungeon and Time Rift event

### Changed
- Moved the Memory of Scholomance and Leaders of Scholomance achievements to Classic - Dungeons - Scholomance
- Moved Wards of the Dread Citadel, 'Never Bothered, Anyway' and Putting Wilhelm Out of Business to Classic - Raids - Naxxramas
- Moderately reduced the memory and Exported Map file sizes

### Fixed
- Removed rounding on Event Reminder end times; end times should now better match the actual timers
- Community Feast and Time Rifts should no longer bug out when in the last minute of the count down

## 58.1 - 2023-07-12
### Fixed
- Tracking achievements should once again work

## 58.0 - 2023-07-11
### Added
- Kalimdor Racing achievements
- Dawn of the Infinite dungeon achievements
- Tons of other achievements
- Missing and new x Exalted Reputations achievements
- Secrets of Azeroth event
- Time Rift event
- Kalimdor Cup (no event yet)
- Reintroduced Widget Events (Community Feast and Time Rifts)
- A bunch of new texts for French by Astiraïs
- The tooltip opened by clicking an achievement link from chat for example will now close when pressing escape
- Event Reminders with names that not fit the pop up or sidebar now show a tooltip when mousing over

### Changed
- Updated Ace3 libraries
- Mapped the new C_ContentTracking.IsTracking(Enum.ContentTrackingType.Achievement, id) to IsTrackedAchievement(id)
- Credits are now handled per row and no longer per section (allows for mix of fonts)
- Updated the API to handle adding things to the options post load

### Removed
- Community Feast events (not longer working as World Events)

## 57.1 - 2023-06-15
### Fixed
- Searching guild achievements should once again work in the Guild tab

### Wrath Classic
- Added Defense Protocol Beta achievements

## 57.0 - 2023-06-07
### Added
- PvP filter

### Wrath Classic
- Fixed the character deletion confirmation

## 56.5 - 2023-05-29
### Added
- Tooltip data for Battle on the Dragon Isles II and Family Battler of Zaralek Cavern
- Moved Expansions - Other to Expansions - Cross-Expansion
- Expansion Profession achievements moved to the Expansion
- Most Profession achievements are now linked to a zone
- A bunch of other achievements are moved around and more are marked unobtainable
- Nasz'uro, the Unbound Legacy to the Aberrus, the Shadowed Crucible raid

### Fixed
- An error could occur when mousing over one of the season 2 m+ rating achievements

### Removed
- Court is Now in Session and Good Things Come in Small Packages (removed before 10.0.2)

## 56.4 - 2023-05-12
### Fixed
- Zaqali Ruin Investigation and Titan Lockdown events should now have a working icon

## 56.3 - 2023-05-07
### Removed
- Rogue print statement

## 56.2 - 2023-05-06
### Fixed
- Hertz Locker is marked as unobtainable
- Bug related to porting tabs order from older versions

## 56.1 - 2023-05-05
### Fixed
- The tooltip opened by clicking an achievement link from chat for example now has a a clickable link to open the achievement window like the battle pet journal does show now actually open the achievement window

## 56.0 - 2023-05-02
### Added
- Scroll speed of the categories list, achievements list, summary list and calendar side window is now adjustable
- The tooltip opened by clicking an achievement link from chat for example now has a a clickable link to open the achievement window like the battle pet journal does (ElvUI and GW2 UI supported)
- 10.1 map data (10), categories (18), achievements (over 160+) and events (6)
- Transmog sets for What We Wear In The Shadowflame
- New pet battle achievement links to Xu-Fu's Pet Battle Strategies

### Changed
- Updated the categories list, achievements list, summary list and calendar side window to the new DF scroll bars
- Moves Summary options to its own section (backend)

### Fixed
- When GW2 UI skin is enable, the right click menu button (if shown) is now also skinned
- When (un)tracking achievements while the achievement is visible in the achievement window, the tracked state of the achievement now also updated
- Wildfire for Global Swarming now has the correct npc id
- When GW2 UI skin is enable, the summary status bars now have the proper background

## 55.0 - 2023-04-01
### Added
- Possibility to show a faction icon on the achievement if the achievement is faction specific
- More sub zones for The Forbidden Reach
- Tooltip data for the new Forbidden Reach Dragon Races
- Pet Battle Links and tooltips for the new Forbidden Reach Pet Battle Achievements
- GW2 UI support

### Fixed
- Removed a ton of achievements from the new zone
- Rare error when an achievement of the opposing faction has more criteria than is visible by the current faction
- Keybindings names
- Achievements trakced by other addons or in previous sessions are not properly tracked when opening the achievement window

## 54.1 - 2023-03-22
### Fixed
- New user should no longer get errors for the old SavedData object (again)

## 54.0 - 2023-03-21
### Added
- Filter to always show completed achievements; overwrites all other filters if checked and the achievement is completed
- 10.0.7 achievements (over 40+ new ones)
- A bunch of missing world map - achievement links

### Changed
- Select All and Deselect All buttons for events are now right aligned

### Fixed
- A bunch of wrong world map - achievement links

## 53.1 - 2023-03-08
### Fixed
- New user should no longer get errors for the old SavedData object

## 53.0 - 2023-03-04
### Added
- See the characters with the most progress for a given achievement in its tooltip
- Additional options and data management
- Option to ignore filters in the Watch List

### Changed
- Custom objectives are now handled in a different way to allow more flexibility in the future
- Moved SavedVariables Options, SavedData and Filters to KrowiAF_Options, KrowiAF_SavedData, KrowiAF_Filters

### Fixed
- Achievement objectives in the tooltip for completed achievements should once again listen to the settings
- Added a bunch of checks for the Selected Tab

### Wrath Classic
- Fixed an error with the Keybindings and Enabled localization

## 52.4 - 2023-02-23
### Wrath Classic
- Bumped Krowi_WorldMapButtons to 1.4.4 (1.5 does no longer exist)

## 52.3 - 2023-02-21
### Wrath Classic
- Bumped Krowi_WorldMapButtons to 1.5
- Fixed Leatrix Maps compatibility

## 52.2 - 2023-02-18
### Fixed
- Saved Data loading

## 52.1 - 2023-02-18
### Added
- Drop It Like It's Hot and The Future We Make to the The Primalist Future map
- 10.0.7 achievements (WIP)

## 52.0 - 2023-02-02
### Added
- Trying to track/untrack an earned achievement will now untrack it (solution for completed tracked achievements)
- The Earned By filter now has effect on the ability to track or untrack achievements (more logical behavior)
- Feats of Strength filter
- Option to only show events that have time data available (will prevent showing events saying 'No time data available')
- Dragonrider Racing tooltip data

### Changed
- Split on login and on reload pop ups and chat messages options (settings might be corrupt and need to be reconfigured once)

### Fixed
- Earning a tracked achievement should now also untrack the achievement
- Famliar Skies points is now 0 again instead of the previous 5

## 51.4 - 2023-01-25
### Added
- Tooltip data for the The Winter Veil Gourmet achievement
- Realm First! Dragonflight Keystone Hero

## 51.3 - 2023-01-21
### Fixed
- Loading achievements that are watched/excluded but are removed from the database should no longer cause an error

## 51.2 - 2023-01-20
### Changed
- Backend plugin options
- Code cleanup
- Moved plugin localization into separate file; allows for the plugin texts also to be localized

### Fixed
- Talking head frame should once again be independent

### Removed
- Overachiever compatibility

## 51.1 - 2023-01-17
### Fixed
- Blizzard Achievement tab is once again able to be hidden/shown from the options

## 51.0 - 2023-01-16
### Added
- 10.0.5 achievements
- 3.4.1 achievements
- Event Reminder when a new event starts while playing (on by default)
- Adjustable interval to check for new events and clean up ended events (default 60 seconds)
- Option to show/hide event reminders inside instances
- Default values to the options
- Tooltip data for Great Gourmand of The Ruby Feast
- Option to hide the completion date of the achievements
- Option to delay the initial Event Reminders on login (default 5 seconds)
- Movable Event Reminder Pop Ups
- Event Reminders as Chat Messages

### Changed
- Optimized the Event Handling
- Moved Prosperously Bloody before Blood Bank
- WoW's Anniversary Calendar Events are now under Other

### Fixed
- Backend split between Wrath Classic and Retail resulting in smaller export for Wrath Classic
- Backend split between Wrath Classic and Retail resulting in automatic removal of removed achievements
- Error when making the windows movable/static when the Achievement UI is not yet loaded
- Bug when remembering the achievement window's location and making the windows static again, the achievement window would snap to it's default location
- Error when clearing the watch list or including all excluded achievements from the options if the achievement UI was not yet opened at least once
- Moved Are You My Broodmother? from Neltharus to Ruby Life Pools
- Moved Soupervisor from Ohn'ahran Plains to The Azure Span
- Great Gourmand of The Ruby Feast is now linked to Valdrakken instead of the Dragon Isles since the starting quests for these items is from Valdrakken

### Removed
- Individual Dragon Racing achievements as they are now marked as tracking achievements
- Start Time display for Event Reminders (This reduces the manual data collection on my end and has little to no importance)
- Fated Raids Calendar Events
- Going away with Dragonflight category

## 50.0 - 2022-12-26
### Added
- Toggle window once opened option
- Option for localization team to localize time formats for event reminders
- Option (on by default) to open the search results in a category instead of the inline window
- Searching criteria can now be done without prefix if checked in the options
- Ability to remove cached characters through the data manager window

### Fixed
- Clicking the World Map Button will now properly update the category when it's already selected
- When opening the achievement window, the selected achievement's objectives should update more reliably

## 49.5 - 2022-12-14
### Fixed
- Primal Storm events should now correctly appear as a reminder
- Community Feast: Soon should now track the remaining time correctly

## 49.4 - 2022-12-13
### Added
- Siege on Dragonbane Keep and Community Feast Event Reminders
- Tooltip data for Who's a Good Bakar?
- Experimental searching of achievement criteria; Use @ as a prefix

## 49.3 - 2022-12-09
### Added
- Grand Hunts Event Reminders

### Fixed
- Leftovers' Revenge moved from Ohn'arhran Plains Reputation to The Azure Span Reputation

## 49.2 - 2022-12-04
### Wrath Classic
- Pet Battle links should no longer cause an error

## 49.1 - 2022-12-03
### Added
- Tooltip data for the Dragonflight Pet Battle achievements
- Tooltip data now always display the achievement icon (especially useful for pet battle achievements)

### Fixed
- 3rd level Right Click Menu pet links are on the 2nd level
- Loremaster of the Dragon Isles moved from Dragonflight - Zones to Dragonflight - Zones - Dragon Isles - Quests

## 49.0 - 2022-11-30
### Added
- Pet Battle Links for Dragonflight Pet Battle Achievements
- Transmog sets for Vaulternative Fashion

### Fixed
- Achievements should now be correctly marked as completed if prior to earning the achievement it was visible in the achievement window
- Cataclysm, Mists of Pandaria, Warlords of Dreanor and Dragonflight raids should now show all achievements in the Current and Selected Zone categories

## 48.5 - 2022-11-26
### Removed
- Rogue print

## 48.4 - 2022-11-26
### Fixed
- Error on login/reload when another addon did some achievement loading in a strange order

## 48.3 - 2022-11-23
### Fixed
- Error on first login after updating to 48.2 when the alert system tries to load but not all data is available

## 48.2 - 2022-11-22
### Fixed
- The ElvUI skins should no longer be applied to the side buttons if the rest of the achievement window is not skinned

## 48.1 - 2022-11-22
### Fixed
- Error skinning side buttons when ElvUI is enabled

## 48.0 - 2022-11-22
### Added
- Primal storm event reminders when the boss is up
- Keybindings in the options (they are still available under the normal key bindings)
- Adjustable key modifiers to paste an achievement to chat (default Shift), to track an achievement in the quest log (default Shift)
- Adjustable key modifier to add/remove an achievement to/from the watch list (default Alt)
- Adjustable key modifier to include/exclude an achievement (default not set)

### Changed
- Rewritten the side button feature to be more reliable, will now clean old and add new events properly
- Event Reminders now try to get the time information again if not available the first time
- Renamed everything related to focusing an achievement to watching an achievement
- Calendar Events should refresh more reliably

### Fixed
- Some missing and wrong achievements causing search errors
- No more accidentally closing side buttons when right clicking
- Switched Primal Thunderstorm and Primal Snowstorm icons

### Removed
- Primal storm achievement and events from Tirisfal Glades
- Snake for Pest Control in Dragon Isles

### Wrath Classic
- Ulduar 10 and 25 achievements are obtainable, just like the other raid achievements
- Tooltip data should now validate correctly

## 47.0 - 2022-11-18
### Added
- Search options to additionally search Ids and Rewards without prefixing the search request (planning to expand this feature in future releases)
- New achievements

### Changed
- Achievements and categories

## 46.4 - 2022-11-15
### Added
- Tooltip data for items and recipes for Draenor Cuisine and Drown Your Sorrows
- ItemRefTooltip now also shows tooltip data (the one you see when you click an item from chat)
- Option to hide the World Map icon

### Changed
- Showing Tooltip Criteria if the achievement was not earned by the current character is checked by default
- Tooltip Criteria is shown by default if the achievement is not completed

### Fixed
- Recipes should no longer show tooltip data more than once
- A nil item should no longer cause any errors

### Wrath Classic
- Added some missing texts
- Disabled the plugin to rename a dragonflight category there isn't

## 46.3 - 2022-11-09
### Added
- Tooltip data for items and recipes for Second That Emotion, Cataclysmically Delicious, Pandaren Cuisine and Pandaren Delicacies

### Changed
- Somewhat reduced the size of the exports

### Fixed
- First time user have an initial login error once should no longer happen

## 46.2 - 2022-11-07
### Fixed
- Possible error when a character's save data is corrupt

### Removed
- Print statement when mousing over the achievement points

## 46.1 - 2022-11-07
### Added
- Tooltip data for items and recipes for The Legion Menu

### Fixed
- On rare occasions a character does not have a realm associated
- When Blizzard_AchievementUI is loaded first, opening the achievement window should no longer trigger an error
- When Blizzard_AchievementUI is loaded first, clicking an event reminder should no longer trigger an error

### Removed
- WoWUnit (dev unit testing)

## 46.0 - 2022-11-06
### Added
- Zygor achievement button icons on KAF tabs
- Tooltip data for units needing /love for To All The Squirrels I've Loved Before, To All The Squirrels Who Shared My Life, To All the Squirrels Who Cared for Me, To All the Squirrels I Once Caressed?, To All the Squirrels Through Time and Space, To All the Squirrels I Love Despite Their Scars, To All the Squirrels I Set Sail to See, To All the Squirrels I've Loved and Lost and To All the Squirrels Hidden Till Now
- Tooltip data for units needing to be killed for Pest Control
- Tooltip data for items and recipes for The Outland Gourmet, The Northrend Gourmet, The Cataclysmic Gourmet, The Pandaren Gourmet, The Draenor Gourmet, The Kul Tiran Menu and The Zandalari Menu
- New Credits

### Changed
- Unchecking Make windows movable now properly makes the affected windows static again

### Fixed
- Make windows movable should no longer throw errors
- Including the last excluded achievement could prevent showing the Excluded category again when excluding another achievement during the same session
- Clearing focus of the last focused achievement could prevent showing the Focused category again when focusing another achievement during the same session
- Excluding, including, focusing and clearing focus should now properly update numbers
- TW region should no longer have errors when clicking an achievement with text criteria

## 45.4 - 2022-10-28
### Wrath Classic
- ElvUI plugin should no longer cause errors when ElvUI is not enabled

## 45.3 - 2022-10-28
### Removed
- Debug messages

## 45.2 - 2022-10-28
### Fixed
- Enabling Reset view on open causes a stack overflow
- Opening a tutorial throws an error due to frame changes
- ElvUI compatibility
- The achievement points do not return when going from Guild to Statistics tab

### Wrath Classic
- Fixed an error when opening Options -> Layout -> Tabs
- World Map Button should stay on top once again when ElvUI is enabled

## 45.1 - 2022-10-27
### Fixed
- Clicking the Track checkbox on an achievement should no longer cause an error

## 45.0 - 2022-10-25
### Added
- Option to hide Not Earned By if current character earned the achievement in tooltip
- Exclude character from Earned By section in tooltips via the Data manager
- Completely ignore character via the Data manager
- ElvUI support for the Data manager
- Plugin to rename Exploration -> Dragon Isles Category to Dragonflight
- Dragonflight pre-patch events

### Changed
- Further optimized performance when multiple achievements are earned, added a 1 second delay to catch all achievement earned events and only reload data once at the end
- Pre-patch event achievement is now in the correct categories

### Fixed
- Dragonflight ElvUI compatibility issues
- Data manager misalignments
- Some more unobtainable achievements have more detailed start and end conditions
- Data manager character checkboxes should now keep their state after re-opening the window

### Wrath Classic
- Temporary obtainable achievements during Wrath of the Lich King are now adjusted to the new patch numbers

## 44.2 - 2022-10-14
### Fixed
- Temporary obtainable account wide achievements should no longer display the Earned By section

### Wrath Classic
- Fixed ElvUI compatibility

## 44.1 - 2022-10-13
### Fixed
- Silent World Map Buttons

## 44.0 - 2022-10-12
### Added
- Dragonflight Dungeons, Raids, Dragonriding, Dragon Racing and Primal Storms data
- Adjustable Category feature for Focused and Excluded achievements
- Primal Storm world events data
- Tracking Achievements category with all the tracking achievements and other hidden ones usually not visible to players
- New credits

### Changed
- Default fade delay for event reminder pop ups changed to 10 seconds (down from 30)
- Localization of the temporarily obtainable string can now be reordered
- Calendar events and World events options are now grouped via a sidebar instead of a big list
- World events are now rounded to 5 minutes instead of 1 hour
- Moved some options from Layout - Categories to Layout - Adjustable Categories
- Statistics and Guild tabs can now occur in any order
- Optimized performance when an achievement is earned, still noticeable fps lag when a Summary view is open (might look for optimizations later)

### Fixed
- Dragonflight compatibility changes
- Earned By filter should update on change again
- Users with a different UTC offset than the server should now correctly display calendar events
- Attempt to fix World Map Buttons

### Removed
- Excluded category filter
- Widget events

### Wrath Classic
- All categories should have a meaningful text now
- Compatibility fixes

## 43.0 - 2022-09-22
### Fixed
- In some cases the game menu would not open anymore after closing the Achievement Window when pressing escape

### Wrath Classic
- On rare occasions, an error could trigger when no tab is selected, but the categories window is shown
- On rare occasions, an error could trigger when no tab is selected, but a category is clicked
- On rare occasions, an error could trigger when an achievement button is entered by the mouse but there is no achievement

## 42.2 - 2022-09-21
### Wrath Classic
- Fixed KAF tabs not showing when the default tab is the Blizzard Achievements
- Fixed an issue that could cause errors in rare occasions when the Achievement Window was forced to update but no KAF tab was selected
- Down With The Dark Iron should be marked as obtainable

## 42.1 - 2022-09-18
### Fixed
- Options

## 42.0 - 2022-09-18
### Added
- Missing map data to Ironforge and The Exodar

### Wrath Classic
- Added Stranglethorn Vale zone
- Added the World Map Button
- Fixed category names (actually now)
- Removed Northern Stranglethorn and The Cape of Stranglethorn zones

## 41.0 - 2022-09-17
### Added
- Some missing German translations
- New credits

### Wrath Classic
- Added a bunch of missing achievements
- Right click menu Wowhead link should link to the correct pages now
- Fixed category names

## 40.7 - 2022-09-16
### Added
- Temporary obtainability to We Are All Made of Stars (Heroic) and We Are All Made of Stars (Mythic)
- A category under the Specials tab with all the achievements stopping being obtainable with Dragonflight and the pre-patch

### Fixed
- Sometimes, achievement points in the shield could be yellow instead of white
- Progressive achievements could show points and a FoS shield at the same time if a previous achievement gave points but the achievement in question does not
- Moved Higher Learning from Ta's Pet Collection Legion to Wrath of the Lich King

## 40.6 - 2022-09-11
### Added
- More translations

### Fixed
- On rare occasions, the math to show achievement criteria could return 0 and throw an error when clicking an achievement (discovered with We Are All Made of Stars)

## 40.5 - 2022-09-07
### Added
- We Are All Made of Stars, We Are All Made of Stars (Heroic) and We Are All Made of Stars (Mythic) to SotFO raid
- A new pets category in Specials

## 40.4 - 2022-09-07
### Added
- A bunch of new German translations

### Fixed
- Switched the tooltip for Fated SoD and Fated SotFO weekly events

## 40.3 - 2022-09-04
### Fixed
- Cleaned up the Adjustable Categories section in the options again

## 40.2 - 2022-09-04
### Changed
- Only events relevant to the version will be toggleable

### Wrath Classic
- Fixed the Darkmoon Faire event Id
- Removed world events

## 40.1 - 2022-09-04
### Fixed
- Cleaned up the Adjustable Categories section in the options

## 40.0 - 2022-09-02
### Added
- Compatibility with Zygor Guides Viewer for the Blizzard Achievements tab
- Focused, Current Zone, Selected Zone and Excluded category to every tab (option to hide them in unwanted tabs to be added)
- Refresh to World and Widget Event Reminder options
- Options to keep the Achievement Window, Achievement Calendar and/or Data Manager at the last position between sessions

### Fixed
- When an achievement is selected and a criteria is completed, the criteria should show as completed without having to toggle the achievement
- World events should always show time data again (until Blizzard breaks the API again)
- Opening the Achievement Window during combat is now always possible, even with rebound micro button
- Some bugs new users can experience because some tables do not yet exist

### Wrath Classic
- Enabled the data manager frame

## 39.3 - 2022-08-21
### Fixed
- Event reminders could sometimes print debug text

### Wrath Classic
- Error when loading into the game should be fixed
- Event reminders should no longer cause errors

## 39.2 - 2022-08-20
### Fixed
- Workaround until Blizzard fixes C_AreaPoiInfo.GetAreaPOISecondsLeft not returning seconds left anymore; handled by adding active events and showing no time data

## 39.1 - 2022-08-17
### Fixed
- Achievements that were never obtainable or only once (Realm First!) should be flagged correct again

## 39.0 - 2022-08-16
### Added
- 3000 quests completed
- Realm First! filter

### Fixed
- x quests completed not finding 3000 quests completed when chains collapsed

### Removed
- Glory of the Tomb Raider from Mount special

### Wrath Classic
- Added translations for all missing texts in English, German and Chinese (Simplified)

## 9.2.5.38.1 - 2022-08-12
### Added
- Chinese Id's for Fated Raids Calendar events
- Chinese localization updated

## 9.2.5.38.0 - 2022-08-10
### Added
- Data manager that can be opened by clicking on the achievement points in the header to show/hide characters in/from the header tooltip, no ElvUI skin yet
- Dynamic obtainability (replaces the previous yes/no obtainable flag which opens new possibilities) - NOT ALL DATA UPDATED YET, 7% special ones to do
- Fated Raids Calendar events and reminders for EU and US (no CN data available at this point)

### Changed
- Most BlizzCon achievements are marked obtainable again although expensive!
- Salute to StarCraft and Herald of Flames are marked as unobtainable

### Wrath Classic
- First port from retail
- All features except event reminders, world map button and data manager are ported
- Classic, TBC and WotLK achievements and categories adjusted and dynamic obtainability added
- Cata, MoP, WoD, Legion, BfA and SL categories removed
- Realm First! achievements and categories adjusted and dynamic obtainability added
- PvP achievements and categories adjusted and dynamic obtainability added

## 9.2.5.37.0 - 2022-08-01
### Added
- Faction icon in front of characters in the achievement window header tooltip (enabled by default)
- Configurable sorting for characters in the achievement window header tooltip
- Option to limit the maximum number of characters in the tooltip with the option to keep the current character in the list regardless if it normally would or not
- Option to change the category indentation
- Clicking an event reminder that has no achievements visible due to the filters will show the empty category with a text informing the user
- Mini achievements (shown when opening an achievement part of a chain) can now be clicked and have a highlight when moving the mouse over
- Mini achievements (shown when opening an achievement part of a chain) and meta achievements (shown when opening an achievement that requires achievements) now also have a right click menu
- When getting redirected to a normally invisble achievement (due to the filters), the achievement will be shown and a green exclamation mark will be shown
- Options to display achievement objectives
- Protection so Blizzard Statistics can not be in front of Guild, would result in errors
- When a criteria updates for an achievement or you earn an achievement, this will also visually update without having to manually refresh the window
- Keybind to open the current zone
- Right click menu to the summary achievements and calendar side window achievements

### Changed
- Tabs are now handled by addon and tab name and API is accessible by other addons (see Plugins/Overachiever.lua for example or ask for assistance on discord)
- Focused, Current Zone, Selected Zone and Excluded categories are moved to Specials tab
- Rearanged general options to be more in line with the rest
- Renamed Earned by filter 'Character' to 'Character only'
- Character only filter now handles completed achievements by checking if it was earned by the current character compared to checking if it is completed on any character
- All Realm First! achievements are set to unobtainable
- Backend stuff
- Filters do not automatically change anymore when you would be redirected to an achievement that would not be visible with set filters
- Moved the Right Click Menu button to the top right of the achievement
- German translation for almost everything
- The following achievements are unobtainable: Ahead of the Curve: The Jailer, Cutting Edge: The Jailer, Shadowlands Keystone Explorer: Season Three, Shadowlands Keystone Conqueror: Season Three, Shadowlands Keystone Master: Season Three, Shadowlands Keystone Hero: Season Three, Cryptic Hero: Shadowlands Season 3, Keystone Hero: De Other Side, Keystone Hero: Mists of Tirna Scithe, Keystone Hero: The Necrotic Wake, Keystone Hero: Spires of Ascension, Keystone Hero: Halls of Atonement, Keystone Hero: Sanguine Depths, Keystone Hero: Theater of Pain, Keystone Hero: Plaguefall, Combatant I: Shadowlands Season 3, Combatant II: Shadowlands Season 3, Challenger I: Shadowlands Season 3, Challenger II: Shadowlands Season 3, Rival I: Shadowlands Season 3, Rival II: Shadowlands Season 3, Duelist: Shadowlands Season 3, Elite: Shadowlands Season 3, Gladiator: Shadowlands Season 3, Cosmic Gladiator: Shadowlands Season 3

### Fixed
- Sometimes an achievement did not display anything and was not interactable after switching tabs
- Achievement is not selected again when leaving tab and going back if it was selected before
- Achievement objective and meta texts should now be white instead of the hard to read black
- When in combat and using ElvUI (skinned), no more errors should appear (but skinning might not happen)
- Clicking an event reminder that has no achievements visible due to the filters will show the empty category instead of doing nothing
- Opening the achievement window for the first time while in combat should not trigger an error anymore
- Achievement objectives should no longer stay visible in some cases
- Getting redirected to an invisble achievement (due to the filters), no errors should be triggered anymore
- Categories watermark should now show again after hiding and showing the achievement window
- Opening the calendar for the first time when locking the month does not show achievements
- On rare occasions, the selected button can't be found and triggers and error

## 9.2.5.36.3 - 2022-07-13
### Fixed
- Earning an achievement should no longer cause an error with the calendar

## 9.2.5.36.2 - 2022-07-12
### Fixed
- Visual bug that can show an achievements tooltip when clicking the tabs
- Several issues with Overachiever tabs

## 9.2.5.36.1 - 2022-07-12
### Fixed
- Large event reminders should once again work without errors

## 9.2.5.36.0 - 2022-07-12
### Added
- Summary view for each new tab that shows the last 25 (default) earned achievements and the category's progress with optional ElvUI skin
- Option to add your current locale to the Wowhead link (active by default)
- Option to add a related tab to the Wowhead link
- Days on the calendar with more than 4 achievements earned now show an arrow to have a visual indication for the user
- Side window in the calendar with a list of all the earned achievements on the selected day
- New Earned by Character filter to fully desaturate achievements not earned on the active character
- Option to set the first day of the week independent from the build in calendar (defaults to it)
- Option to keep the last selected month visible on reopening the calendar or go to the current month
- ElvUI skin for the calendar
- Selecting achievements should redirect to the new tabs (excluding guild achievements)
- ElvUI skin for the progress bar in the tooltips
- Tutorial for the summary and calendar
- Tutorial is now movable, can be scrolled through with the mouse wheel and can be closed by pressing the escape key

### Changed
- Power Unbound and Power Unleashed are obtainable again
- Calendar is now movable
- Earned by Character filter is now Earned by Character / Account

### Fixed
- A visual bug that would paint accountwide unobtainable achievements blue instead of red
- When earning an achievement, the GUI should now properly reflect that
- Tracked compact achievements should now properly hide their Track button when collapsed
- Current character should always show first in (not) earned by tooltip list

### Removed
- Achievements on the calendar view do not show their tooltip anymore and can't be clicked

## 9.2.5.35.2 - 2022-06-28
### Added
- Monthly achievements earned and the number of points to the calendar view

### Fixed
- Calendar button overlapping achievement points when ElvUI is enabled and the achievement window is skinned
- Issue that could cause errors when re-ordering tabs

## 9.2.5.35.1 - 2022-06-26
### Fixed
- Couple of errors for new users or users that deleted their saved variables

### Removed
- Achievement covenant information
- Covenant filters

## 9.2.5.35.0 - 2022-06-25
### Added
- Calendar view for earned achievements (only 1st 4 per day for now)
- Select All and Deselect All buttons for Event Reminders
- Hide and order tabs

### Changed
- Allied race achievements now have a faction tied to them
- Split the Event Reminders Events tab into separate tabs per event type

### Fixed
- Error when selecting a differnt preset for the start time and end time for the event reminders
- Error when deselecting objectives progress

### Removed
- Torcanata because it's a tracking achievement

## 9.2.5.34.2 - 2022-06-05

### Changed
- Torghast widget events are now by default not active for new users since all wings are always open

### Fixed
- First time users get lua error because certain variables are not yet created

## 9.2.5.34.1 - 2022-06-01
### Added
- German localization
- Localizers to Credits
- Return to Lordaeron achievement

### Changed
- Localization optimization
- License

### Fixed
- Small non-breaking bugs

## 9.2.5.34.0 - 2022-05-29
### Added
- Mount achievements to the Specials tab
- Enhanced tooltip features added to the default Blizzard achievements
- Torghast as a widget event reminder
- Shadowlands Season 4 mount achievements
- Winter Veil 2022 gift achievement and related
- Covenant achievements
- Overarching Maw and Shadowlands achievements
- New Specials list for titles: The Entitled Player which contains all achievements that award a title
- Tab specific filters
- Compact event reminders and side buttons
- Option to only search achievements that are visible with set filters
- Part of a Chain in tooltip now shows both horde and alliance chains
- Right Click option Goto now shows both horde and alliance chains
- Enhanced (not) earned by information with options
- Transmog achievements can now show the progress of a set that would grant the achievement
- Transmog achievements can now have a link in the right click menu to go to the set itself (compatible with BetterWardrobe)
- Faction exclusive achievements with a counterpart in the other faction can now be shown on the tooltip and the right click menu, most should have it
- Pursuing Loyalty to Expansions - Shadowlands - Covenant Sanctums - Kyrian
- New Specials list for realm first schievements: Realm First! which contains all achievements that relate to realm first stuff
- New Specials list for transmog: Player the Fabulous which contains all achievements that are earned by collecting transmog
- New Specials list for promotions: Promotions which contains all achievements that are earned trough promotions
- Resetting Faction Filters can now be disabled in the options
- A small exclamation mark to the help menu item under the filters if one of the tutorials is not viewed
- A small exclamation mark to the tutorials button in the general options if one of the tutorials is not viewed
- A copy of the achievements tab with more features compared to the default one (still work in progress)
- Most achievements in the achievements tab copy should have faction data
- Most achievements in the achievements tab copy should have obtainability data
- New Specials list for professions: Professions which contains all achievements that are earned by doing professions
- WoW's 18th Anniversary event
- WoW's Anniversary to Events
- All the missing achievements that still needed to be added

### Changed
- Events reminder / sidebuttons backend
- Grouped event alerts together in the options
- ~~Shadowlands Season 3 mount achievements no longer obtainable~~
- The covenants filter will not revert back to the one you are currently part of but instead keep the selected ones (easier to keep track of cross covenant achievements this late into Shadowlands)
- Optimizasions in the database tool and complete rewrite of data handling
- Options should not force the user into a reload anymore (strange behaviour and errors might occur)
- Optimizations on how tabs are handled
- Complate options revamp
- Moved ElvUI, Overachiever and Instance Achievement Tracker integration into plugins which are less coupled to the code
- Tutorials no longer pop up and have to be manually opened
- Updated the existing tutorials to reflect the changes made

### Fixed
- Expansion naming mismatch
- Showing event alerts is now more consistent when they're shown; Should be roughly 5 seconds after the loading screen has finished
- When a Calendar event ends before the end of the day, the event would still show up in the active events
- In rare cases, selecting an achievement could cause an endless loop
- In rare cases, the achievement would not be selected when searching
- In rare cases, the achievements would scroll to a state where the top one is not completely visible
- In rare cases, searching achievements would cause an error
- Shadowlands - Zones - Zerith Mortis subcategories can now merge
- Placement of the right click button when using the compact achievements style
- Shadowlands Season 3 dungeon achievements now also added to the Tazavesh maps
- Full size achievements sometimes show no description
- Added missing texts

### Removed
- Unused Legion timewalking event IDs

## 9.2.0.33.2 - 2022-03-23
### Added
- Option to display the achievement points in several formats

### Changed
- Slightly reorganised the new dancing game achievements
- Toggling the event reminders no longer forces a reload per event but instead shows a warning in the tooltip

## 9.2.0.33.1 - 2022-03-04
### Added
- Toggle to turn off event reminders but keep them visible next to the achievement window

### Fixed
- An error occured when toggling event reminders

## 9.2.0.33.0 - 2022-02-19
### Added
- Sepulcher of the First Ones raid (33 achievements)
- Zereth Mortis (25 achievements)
- Torghast achievements + new wing (15 achievements)
- New PvP Season 3 mount (1 achievement)
- Events - Darkmoon Faire, new dancing game (9 achievements)
- Character specific achievement points are now shown in front of your total achievement points
- Filter to show achievements as completed by either your account or your character
- Hovering your mouse over the achievement points will now show how many achievement points each character has earned
- Now also available on Wago.io
- Tutorial for the new character specific achievement saturation and achievement points tooltip

### Changed
- Shadowlands Season 2 PvP mount is no longer obtainable
- Shadowlands Season 2 Keystone Master is no longer obtainable
- Ahead of the Curve and Cutting Edge Sylvanas Windrunner is no longer obtainable
- Searching achievements by ID will now be listed from smallest to highest ID instead of a random order
- Searching achievements by text will now be listed alphabetically by name
- The achievement path in the full search window is now wider
- The achievement status in the full search window is moved to give the path more space
- Updated the tutorial to reflect the changes
- Moved Fungal Terminus map ID from Ardenweald to Heart of the Forest

### Fixed
- 9.2 does no longer allow division by 0
- Kyrian Covenant achievements are now also linked to the Ascension Coliseum
- Black is the New Black is once again obtainable
- Searching achievements by ID is now possible from a single digit
- The achievement path in the full search window does no longer wrap but is truncated
- Taint caused by Krowi_WorldMapButtons

## 9.1.5.32.0 - 2021-12-07
### Added
- A total of over 250 achievements (details below)
- Raiding with Leashes V: Cuteaclysm to the Cataclysm raids
- Raiding with Leashes IV: Wrath of the Lick King to the Wrath of the Lich King raids
- Stand Against the Legion and Defender of Azeroth: Legion Invasions to the corresponding zones (both unobtainable)
- It All Makes Sense Now to Stormwind City and Orgrimmar
- Raiding with Leashes II: Attunement Edition and Raiding with Leashes III: Drinkin' From the Sunwell to The Burning Crusade raids
- Raiding with Leashes to the Classic raids and Naxxramas
- Operation: Gnomeregan to Dun Morogh (unobtainable)
- Zalazane's Fall to Durotat (unobtainable)
- New PvP tab with Alterac Valley, Arathi Basin, Ashran, Battle for Gilneas, Deepwind Gorge, Eye of the Storm, Isle of Conquest, Seething Shore, Silvershard Mines, Strand of the Ancients (Legacy), Temple of Kotmogu, Twin Peaks, Warsong Gulch and Wintergrasp
- Putting Out the Light, For the Horde! and The Exodar city to The Burning Crusade - Zones
- Overthrow the Council, For the Horde! and Ironforge city to Classic - Eastern Kingdoms - Zones
- For the Alliane! and Wrath of the Alliance to The Burning Crusade - Zones - Silvermoon City
- For the Alliane! and Wrath of the Alliance to Classic - Zones - Kalimdor - Orgrimmar
- Wrath of the Alliance and Undercity to Classic - Eastern Kingdoms - Zones
- Wrath of the Alliance to Classic - Kalimdor - Zones - Thunder Bluff
- Wrath of the Horde to Stormwind City and Ironforge in Classic - Zones - Eastern Kingdoms
- Wrath of the Horde to The Burning Crusade - Zones - The Exodar
- Wrath of the Horde and Darnassus to Classic - Kalimdor - Zones
- Slightly added more width to the achievement description space, also changes dynamically when the achievement width changes due to the scrollbar
- New compact achievements view available that are half the size of the regular ones, toggleable in options
- Queen's Conservatory only shows Night Fae specific achievements
- New Specials tab with custom categories requested by users
- Achievements that can be found at multiple locations now have a Go To entry in the right click menu
- Ambassador of the Alliance and Ambassador of the Horde to multiple zones
- Avast Ye, Admiral! to Classic - Zones - The Cape of Stranglethorn - Reputation
- Insane in the Membrane to multiple zones
- Pest Control to Wrath of the Lich King - Zones
- Local Pet Mauler, Traveling Pet Mauler and World Pet Mauler to multiple zones
- Taming the Wild, Taming the Great Outdoors and Taming the World to multiple zones
- Zone data for Taming Kalimdor, Taming Eastern Kingdoms, Taming Outland, Taming Northrend, Taming Cataclysm, Taming Pandaria and Taming Azeroth
- Available in Eight Colors to Battle for Azeroth - Zones - Mechagon Island - Exploration
- Tripping the Rifts (unobtainable) to Cataclysm
- Big City Pet Brawlin' - Alliance, Big City Pet Brawlin' - Horde and Big City Pet Brawler to Class - and The Burning Crusade - Pet Battles
- Victory in Hillsbrad (unobtainable) to Southshore vs. Tarren Mill
- Hordebreaker and Darkspear Revolutionary (both unobtainable) to Pandaria
- Zone data for Pandaria Tamer, Pandaria Safari, Northrend Safari, Northrend Tamer, Outland Safari, Outland Tamer, Eastern Kingdoms Safari, Eastern Kingdoms Tamer, Kalimdor Safari and Kalimdor Tamer
- World Safari to multiple Pet Battles categories
- The Loremaster to multiple zones
- Field Photographer to multiple zones
- Wintergrasp under Wrath of the Lich King - Zones for Field Photographer
- The Longest Day to multiple zones
- New tutorial page for Compact Achievements

### Fixed
- Undying Aesthetic is once again marked as obtainable
- The Burning Crusade - Zones - Bloodmyst Isle - Quests can now merge

## 9.1.5.31.0 - 2021-11-04
### Added
- ~~Raiding with Leashes V: Cuteaclysm to the Cataclysm raids~~
- ~~Raiding with Leashes IV: Wrath of the Lick King to the Wrath of the Lich King raids~~
- ~~Stand Against the Legion and Defender of Azeroth: Legion Invasions to the corresponding zones (unobtainable)~~
- ~~It All Makes Sense Now to Stormwind City and Orgrimmar~~
- ~~Raiding with Leashes II: Attunement Edition and Raiding with Leashes III: Drinkin' From the Sunwell to The Burning Crusade raids~~
- ~~Raiding with Leashes to the Classic raids and Naxxramas~~
- ~~Operation: Gnomeregan to Dun Morogh (unobtainable)~~
- ~~Zalazane's Fall to Durotat (unobtainable)~~

### Fixed
- Calendar events did not refresh properly

## 9.1.5.30.0 - 2021-11-02
### Added
- Winter Veil gift achievements under Events - Holidays - Winter Veil - Gifts
- Legion Timewalking event and achievements under Events - Legion - Timewalking
- Renowned achievement under Expansions - Shadowlands - Covenant Sanctums
- Doomsoul Surprise achievement under Events - Battle for Azeroth - Faction Assaults - Assault on Drustvar
- Pet Battle Challenge achievements to Expansions - Classic - Dungeons - Deadmines, - Wailing Caverns, - Gnomeregan, - Blackrock Depths and - Stratholme

### Fixed
- Brawler's Guild category was removed, added category name as localisable text
- Unobtainable achievements now also have a red background color when ElvUI's Blizzard Skins and Achievements are selected
- Event Reminders next to the Achievement window are now skinned when ElvUI's Blizzard Skins and Achievements are selected
- Event Reminders pop ups are now skinned when ElvUI's Blizzard Skins and Alert Frames are selected

## 9.1.0.29.1 - 2021-09-07
### Fixed
- Map button overwrites Current Zone category and shows that one instead of Selected Zone 

## 9.1.0.29.0 - 2021-09-07
### Added
- Focus achievements
- Focused category has to option to show achievements under their sub categories
- Focused category can be cleared with a single button in the options
- Excluded category now has to option to show achievements under their sub categories
- Excluded category can now be cleared with a single button in the options
- Option to make the Achievement window movable

### Changed
- Rewritten options to make it more maintainable and increase performance a little

## 9.1.0.28.1 - 2021-08-18
### Fixed
- Issue #54: First time user get these errors

## 9.1.0.28.0 - 2021-08-16
### Added
- Shadowlands Covenant Assaults as Event Reminders
- Battle for Azeroth Faction Assaults and N'Zoth Assaults as Event Reminders
- Options to set the date and time format of the event reminders
- Options to show Start Time, End Time and Time Left on the Event Reminders
- Options to enable/disable specific Event Reminders

### Changed
- Moved Battle for Azeroth - Dueler's Guild - Frontline Veteran and - Frontline Slayer to Battle for Azeroth - Zones - Kul Tiras & Zandalar - Player vs. Player

### Fixed
- Shadowlands - Zones - Korthia, Shadowlands - Dungeons - Tazavesh, the Veiled Market and Shadowlands - Raids - Sanctum of Domination now all should localize properly
- When switching between new tabs, achievements would sometimes be selected wrongly, not visible or have no content (still some wierd behaviour when the selected achievement in one tab is lower than the last achievement in the other tab - not addon breaking, might fix later)
- The Events tab should now properly skin with ElvUI

### Removed
- Option to set the number of times the active events should be shown

## 9.1.0.27.1 - 2021-08-04
### Fixed
- Issue #52: attempt to index field 'EventDetails'

## 9.1.0.27.0 - 2021-08-03
### Added
- 2nd tab added with Event achievements (WIP)
- Search is now possible from any tab (Expansions and Events)
- Even more zone data for multi-zone achievements for Legion and Battle for Azeroth
- More zone data for multi-zone achievements for Classic, The Burning Crusade, Wrath of the Lich King, Cataclysm, Mists of Pandaria and Warlords of Dreanor
- Split Raids into Glory and Mythic/Heroic categories for Cataclysm, Mists of Pandaria and Warlords of Dreanor
- Glamour of Twilight in Cataclysm - Raids - Blackwing Descent
- Sha of Fabulous in Mists of Pandaria - Raids - Terrace of Endless Spring
- Second keybinding under Game Menu -> Key Bindings -> AddOns to toggle the Achievement Window to the new Events tab
- Classic - Zones - Eastern Kingdoms - Stormwind City, Classic - Zones - Kalimdor - Orgrimmar and - Thunder Bluff achievements
- The Burning Crusade - Zones - Silvermoon City achievements
- Battle for Azeroth - Zones - Universal Explorer
- All Holidays and Darkmoon Faire
- Shadowlands - Dungeons - Keystone Initiate, Challenger, Conqueror and Master
- Alert to notify if a holiday or event is active (will be expanded upon in the future)
- Clicking this alert will open the related category
- This alert is also present on the right side of the achievement window
- The tooltip when hovering an achievement in a meta achievement now has more information

### Changed
- Categories are now only stored hierarchical in preperation of new features; Reduced memory usage by 1%
- Achievement Filter tab renamed to Expansions
- Moved Operation: Shieldwall Campaign and Dominance Offensive Campaign from Mists of Pandaria - Zones - Pandaria - Quests to Mists of Pandaria - Zones - Krasarang Wilds - Quests
- Moved Stood in the Fire from Cataclysm - Zones to Cataclysm - Raids - Dragon Soul
- Keybinding under Game Menu -> Key Bindings -> AddOns to toggle the Achievement Window to the new tab has been renamed and might need rebinding

### Fixed
- Glamour of Twilight in Cataclysm - Raids - The Bastion of Twilight is obtainable
- Possible duplicates of achievements in the Current Zone and Selected Zone categories resolved

## 9.1.0.26.0 - 2021-07-14
### Added
- More item in the Right Click Menu to group things under to not clutter the main Right Click Menu
- Exclude achievements you have no interest in seeing
- Options to show / hide the Excluded category and to include (reset) them all at once
- Options to Exclude Excluded achievements from the search results
- (Not) obtained not obtainable achievements now have a red header
- The Achievement Tooltip will now clearly tell if an achievement is no longer obtainable
- More zone data for multi-zone achievements for Legion
- Split Raids into Glory and Mythic categories for Legiom, Battle for Azeroth and Shadowlands

### Changed
- Tutorials Page 2's selected category is now the same as in the image
- Shadowlands - Pet Battles - A Sly Fox should now be visible in the Current Zone and Selected Zone when in The Maw or when it's selected
- Remade all Tutorial images with higher compression rate so their size is smaller
- Restructured Data for better maintainability
- Restructured GUI for better maintainability
- Tutorials Pages 2, 3, 4 and 6 to reflect the new Exclude feature
- Obtained not account-wide obtainable achievements now have a golden border instead of the default red one
- Obtained not obtainable achievements now have a red border
- Tutorials Page 8 to add that the achievements tooltip will now show more clearly if the achievement is not obtainable

### Fixed
- Achievements in the Selected Zone category now properly always have a Go To item so you can easily go to the achievement in the categories tree
- Showing the Enhanced Filtering and Sorting Tutorial Page should no longer write numbers to the chat window
- Issue #49: Shadowlands Keystone Conqueror: Season Two and Shadowlands Keystone Master: Season Two in Shadowlands - Dungeons appear as part of a wrong chain

## 9.1.0.25.1 - 2021-07-07
### Fixed
- Opening the Tutorial Pages should not spam the chat window with numbers anymore

## 9.1.0.25.0 - 2021-07-07
### Added
- Worldmap button that will show the achievements progress for the current viewed zone
- Clicking the worldmap button will bring you to a new Selected Zone category
- When a zone has no achievements the button will be disabled
- Selected Zone category has a seperate filter similar to the Current Zone category
- Achievements in the Selected Zone category always have a Go To item so you can easily go to the achievement in the categories tree
- Current Zone and Selected Zone categories have independent filtering and sorting
- More zone data for multi-zone achievements for Shadowlands
- More zone data for multi-zone achievements for Battle for Azeroth
- World Map Button Tutorial Page

### Changed
- Updated the Enhanced filtering and sorting tutorial page
- If an achievement is in multiple categories, searching for it will return the first category match
- Moved Death's Advance from Shadowlands - Zones - The Maw - Reputation to Shadowlands - Zones - Korthia - Reputation
- Moved Conquiring Korthia from Shadowlands - Zones to Shadowlands - Zones - The Maw - Exploration and - Korthia - Exploration
- Shadowlands Keystone Explorer: Season One, Shadowlands Keystone Conqueror: Season One and Shadowlands Keystone Master: Season One in Shadowlands - Dungeons are no longer obtainable
- Ahead of the Curve: Sire Denathrius and Cutting Edge: Sire Denathrius in Shadowlands - Raids are no longer obtainable
- Moved achievements related to the Dueler's Guild from Battle for Azeroth - Kul Tiras & Zandalar - PvP to Battle for Azeroth - Dueler's Guild
- Moved No Shellfish Endeavor from Legion - Zones - Broken Isles - Quests to Legion - Zones - Highmountain - Quests, Stormheim - Quests and Surumar - Quests
- Moved What A Strange, Interdimensional Trip It's Been from Warlords of Dreanor - Zones - Dreanor to Warlords of Dreanor
- Split Warlords of Dreanor - Garrison in Dreanor - Garrison - Buildings and - Invasions and - Buildings further into Buildings - Stables, - Gladiator's Sanctum and - Shipyard
- Moved Chapter I: Call of the Archmage, Chapter II: Gul'dan Strikes Back, Chapter III: The Foundry Falls and Chapter IV: Darkness Incarnate from Warlords of Dreanor - Garrison to Warlords of Dreanor
- Moved Tranquil Master from Mists of Pandaria - Zones - Pandaria to Mists of Pandaria
- Moved Chapter I: Trial of the Black Prince, A Test of Valor, Chapter II: Wrathion's War, Chapter III: Two Princes, Chapter IV: Celestial Blessings and Chapter V: Judgment of the Black Prince from Mists of Pandaria - Zones - The Veiled Stair to Mists of Pandaria
- Criteria cache now excludes statistics, guild and tracking achievements
- Improved already great performance of getting Required For and Part of a Chain achievements

### Fixed
- When Merge Small Categories was selected, the 2nd tutorial page would not show the correct achievements
- Legion Keymaster is not obtainable
- Achievement Button Tooltip and Achievement Button Right Click Menu did not take filters into account
- Problems with showing achievements in the Current Zone category when instances have 10 and 25 man difficulties

### Removed
- What A Strange, Interdimensional Trip It's Been from Warlords of Dreanor - Dungeons and - Raids
- Tranquil Master from Mists of Pandaria - Dungeons and - Raids
- Wrath of the Lich King - Zones - Grizzly Hills - Quests - Guru of Drakuru (Still available in Wrath of the Lich King - Zones - Zul'Drak - Quests - Guru of Drakuru)

## 9.1.0.24.0 - 2021-06-29
### Added
- More zone data for multi-zone achievements for Shadowlands
- Current Zone category now has a seperate filter in preparation for the World Map Button coming in a later version
- Sort By Completion and Sort By ID

### Changed
- Backend data structure completely rewritten in preperation for new features
- Coming in 9.1 merged into the other categories
- Moved Covenant Campaign achievement from Shadowlands - Zones to Shadowlands - Covenant Sanctum
- Filter settings stored in new location (reset of saved settings unfortunatly)
- Torghast wings are split into separate categories but can merged into the main one 

### Fixed
- Northrend Explorer now shows for both factions
- Guardian of Cenarius now shows for both factions
- Page 6's text of the tutorials could be outside the frame with certain text fonts
- Northrend Safari, Northrend Tamer and Taming Northrend are now obtainable
- Discord link replaced with one that does not expire

## 9.0.5.23.0 - 2021-05-27
### Added
- Achievements in the Current Zone category now always have a Go To item so you can easily go to the achievement in the categories tree
- Button to each achievement to show the Right Click Menu (disabled by default)
- Categories tooltip can now show the number of not obtainable achievements and also adds a red part to the progress bar
- New Coming in 9.1 (24 achievements)
- Tutorial button in Options and Help under Filters now has a second menu with links directly to each tutorial page
- This second menu for tutorial pages now shows an exclamation mark if the page was not viewed before
- Tutorial page for Categories tooltip
- Credits with special thanks and donations
- Donation from Bur - Frostmane EU
- Donation from Ta - Der Rat von Dalaran EU
- Achievements tooltip can now show the objectives progress (some wierd texts might exist)

### Changed
- Unobtainable achievements now show as red in the tooltip for Part of a chain and Required for sections
- Colors in the tooltip for the Part of a chain and Required for sections are now based on the quest difficulty colors
- Full rewrite of the 3rd party tutorial library to further tailor it to my own needs
- Tutorial progress has been reset since a new way of tracking what is viewed is used
- Categories tooltip is now shown on the right side of the category similar to achievements

### Fixed
- Taming Eastern Kingdoms now only shows for Alliance players
- Taming Kalimdor now only shows for Horde players
- Special case when turning off ElvUI might cause an error
- Issue #42: When achievements with same objective types are shown in default and new tab, both objectives would stay hidden
- Issue #43: Go to in Current Zone and searching does not properly work when Merge Small Categories is checked

## 9.0.5.22.0 - 2021-05-13
### Added
- New Coming in 9.1 (25 achievements)
- Tutorial page related to the tooltip

### Changed
- Cleaned up the Search code
- Cleaned up the AchievementButton code
- Somewhat cleaned up the Localization

### Fixed
- Tooltip should not dissapear anymore when hovering over achievement criteria
- Clicking on an achievement in a meta achievement will now select the achievement in the new tab

## 9.0.5.21.0 - 2021-05-08
### Added
- Option to select wether using the Key Binding will keep the last selected category or collapse all categories and select the first category
- Tooltip shows the chain if an achievement is part of it with additional options
- Tooltip shows the achievement the highlighted achievement requires to be completed with additional options
- Tooltip shows not only an account wide but also a character specific icon for the Part of a chain and Required for sections with additional options
- Tooltips refresh when scrolling (improvement over default Blizzard)
- Right Click Menu has a Go To item so you can easily go to related achievements
- Search by achievement ID by starting the search query with '#'
- Option to exclude Coming in 9.1 from search results (default exclude)

### Changed
- Coming in 9.1 should not add achievements to the Current Zone anymore
- ElvUI Skins Status options are moved to a seperate tab
- Layout options are moved to a seperate tab
- Renamed 'Collapse Series' to 'Collapse Chain'

## 9.0.5.20.0 - 2021-05-01
### Added
- Classic Pet Battles (6 achievements)
- Classic Dungeons Upper Blackrock Spire (Legacy) (2 achievements)
- Classic Raids Naxxramas (Legacy) (1 achievement)
- The Burning Crusade Pet Battles (3 achievements)
- The Burning Crusade Cities Shattrath City (3 achievements)
- Wrath of the Lich King Pet Battles (3 achievements)
- Wrath of the Lich King Argent Tournament (35 achievements)
- Cataclysm Pet Battles (1 achievement)
- Mists of Pandaria Zones The Veiled Stair (8 achievements)
- Mists of Pandaria Brawler's Guild (16 achievements)
- Warlords of Draenor Brawler's Guild (19 achievements)
- Legion Brawler's Guild (6 achievements)
- Battle for Azeroth Brawler's Guild (6 achievements)
- Coming in 9.1 (40 achievements)
- Coming in 9.1 category has a * SPOILER WARNING *
- Missing Classic Zones (2 achievements)
- Missing Classic Zones Eastern Kingdoms (1 achievement)
- Missing Classic Zones Eastern Kingdoms Dun Morogh (1 achievement)
- Missing Classic Zones Eastern Kingdoms Eastern Plaguelands Reputation (1 achievement)
- Missing Classic Zones Eastern Kingdoms Northern Stranglethorn Quests (1 achievement)
- Missing Classic Zones Eastern Kingdoms Blasted Lands (1 achievement)
- Missing Classic Zones Kalimdor (1 achievement)
- Missing Classic Zones Kalimdor Durotar (1 achievement)
- Missing Classic Zones Kalimdor Un'Goro Crater (1 achievement)
- Missing Classic Zones Kalimdor Silithus (1 achievement)
- Missing Classic Zones Kalimdor Silithus Reputation (1 achievement)
- Missing Classic Zones Kalimdor Winterspring (1 achievement)
- Missing Classic Dungeons Blackrock Depths (1 achievement)
- Missing Classic Dungeons Dire Maul (1 achievement)
- Missing Classic Raids Molten Core (4 achievements)
- Missing Classic Raids Blackwing Lair (1 achievement)
- Missing Classic Raids Zul'Gurub Reputation (1 achievement)
- Missing Classic Raids Ruins of Ahn'Qiraj Reputation (1 achievement)
- Missing Classic Raids Temple of Ahn'Qiraj (1 achievement)
- Missing The Burning Crusade Zones (1 achievement)
- Missing The Burning Crusade Zones Zangarmarsh Reputation (3 achievements)
- Missing The Burning Crusade Zones Nagrand Quests (3 achievements)
- Missing The Burning Crusade Zones Nagrand Reputation (2 achievements)
- Missing The Burning Crusade Raids Karazhan (2 achievements)
- Missing The Burning Crusade Raids Gruul's Lair (1 achievement)
- Missing The Burning Crusade Raids Magtheridon's Lair (1 achievement)
- Missing The Burning Crusade Raids Serpentshrine Cavern (1 achievement)
- Missing The Burning Crusade Raids Black Temple (4 achievements)
- Missing The Burning Crusade Raids Sunwell Plateau (2 achievements)
- Missing Wrath of the Lich King Zones (1 achievement)
- Missing Wrath of the Lich King Zones Dalaran (4 achievement)
- Missing Wrath of the Lich King Zones Grizzly Hills PvP (2 achievements)
- Missing Wrath of the Lich King Zones Zul'Drak Quests (2 achievements)
- Missing Wrath of the Lich King Zones Sholazar Basin Quests (1 achievement)
- Missing Wrath of the Lich King Zones Icecrown (1 achievement)
- Missing Wrath of the Lich King Zones Icecrown Reputation (1 achievement)
- Missing Wrath of the Lich King Dungeons (3 achievement)
- Missing Wrath of the Lich King Raids (1 achievement)
- Missing Wrath of the Lich King Raids Vault of Archavon (1 achievement)
- Missing Wrath of the Lich King Raids Naxxramas (1 achievement)
- Missing Wrath of the Lich King Raids Ulduar (4 achievements)
- Missing Wrath of the Lich King Raids Ulduar Ulduar 10 (2 achievements)
- Missing Wrath of the Lich King Raids Ulduar Ulduar 25 (2 achievements)
- Missing Wrath of the Lich King Raids Trial of the Crusader(1 achievement)
- Missing Wrath of the Lich King Raids Icecrown Citadel (3 achievements)
- Missing Cataclysm Zones (1 achievement)
- Missing Cataclysm Zones Uldum (1 achievement)
- Missing Cataclysm Dungeons and Raids (1 achievement)
- Missing Cataclysm Dungeons Shadowfang Keep (1 achievement)
- Missing Cataclysm Raids The Bastion of Twilight (1 achievement)
- Missing Cataclysm Raids Firelands (2 achievements)
- Missing Cataclysm Raids Dragon Soul (2 achievements)
- Missing Mists of Pandaria Zones (1 achievement)
- Missing Mists of Pandaria Zones Pandaria (1 achievement)
- Missing Mists of Pandaria Zones Pandaria Exploration (1 achievement)
- Missing Mists of Pandaria Zones Kun-Lai Summit (1 achievement)
- Missing Mists of Pandaria Zones Vale of Eternal Blossoms Quests (1 achievement)
- Missing Mists of Pandaria Zones Isle of Thunder Exploration (1 achievement)
- Missing Mists of Pandaria Zones Timeless Isle (2 achievements)
- Missing Mists of Pandaria Zones Timeless Isle Exploration (1 achievement)
- Missing Mists of Pandaria Dungeons (6 achievements)
- Missing Mists of Pandaria Pet Battles (3 achievements)
- Missing Mists of Pandaria Proving Grounds (2 achievements)
- Missing Mists of Pandaria Raids (1 achievement)
- Missing Mists of Pandaria Raids Heart of Fear (1 achievements)
- Missing Mists of Pandaria Raids Throne of Thunder (1 achievements)
- Missing Mists of Pandaria Raids Siege of Orgrimmar (1 achievements)
- Missing Warlords of Draenor Zones Draenor (2 achievement)
- Missing Warlords of Draenor Zones Draenor Exploration (1 achievement)
- Missing Warlords of Draenor Zones Gorgrond (1 achievement)
- Missing Warlords of Draenor Zones Spires of Arak (1 achievement)
- Missing Warlords of Draenor Zones Tanaan Jungle (1 achievement)
- Missing Warlords of Draenor Dungeons (6 achievement)
- Missing Warlords of Draenor Raids (2 achievement)
- Missing Warlords of Draenor Raids Blackrock Foundry (1 achievement)
- Missing Warlords of Draenor Raids Hellfire Citadel (1 achievement)
- Missing Legion Zones Broken Isles (1 achievement)
- Missing Legion Zones Broken Isles Exploration (1 achievement)
- Missing Legion Zones Dalaran (1 achievement)
- Missing Legion Zones Broken Shore (1 achievement)
- Missing Legion Dungeons (1 achievement)
- Missing Legion Dungeons Return to Karazhan (1 achievement)
- Missing Legion Raids The Nighthold (1 achievement)
- Missing Legion Raids Trial of Valor (1 achievement)
- Missing Legion Raids Tomb of Sargeras (1 achievement)
- Missing Legion Raids Antorus, the Burning Throne (1 achievement)
- Missing Legion Class Hall (1 achievement)
- Missing Battle for Azeroth Zones Kul Tiras & Zandalar Exploration (1 achievement)
- Missing Battle for Azeroth Zones Mechagon Island (2 achievements)
- Missing Battle for Azeroth Raids Uldir (1 achievement)
- Missing Battle for Azeroth Raids Battle of Dazar'alor (1 achievement)
- Missing Battle for Azeroth Raids The Eternal Palace (1 achievement)
- Missing Battle for Azeroth Raids Ny'alotha, the Waking City (1 achievement)
- Missing Battle for Azeroth Island Expeditions (3 achievements)
- Missing Shadowlands Raids Castle Nathria (1 achievement)

### Fixed
- Issue #37: All Pet Battle links link to the same url

### Removed
- Shadowlands Torghast (1 achievement, in preperation for 9.1)

## 9.0.5.19.0 - 2021-04-27
### Added
- Filter to merge small categories into the parent category
- Tutorial (Help) and Options can now be opened from the Filter menu for easy access
- Classic Zones (97 achievements) + zone data except for the shared zone group
- The Burning Crusade Zones (44 achievements) + zone data except for the shared zone group
- Wrath of the Lich King Zones (49 achievements) + zone data except for the shared zone group

### Changed
- Better filtering performance by adding additional checks for getting the number of achievements per category
- Moved achievement Crypt Couture from Shadowlands Zones Maldraxxus Exploration to Shadowlands Covenant Sanctums Necrolord
- Optimized data file sizes
- Backend database optimized

## 9.0.5.18.0 - 2021-04-13
### Added
- Classic Dungeons and Raids zone data
- The Burning Crusade Dungeons and Raids zone data
- Wrath of the Lich King Dungeons and Raids zone data including difficulty filtering
- Missing Classic Dungeon Stratholme (1 achievement)
- Missing Cataclysm Uldum (1 achievement)
- Missing Mists of Pandaria Isle of Giants (1 achievement)
- Missing Warlords of Draenor Tanaan Jungle (1 achievement)
- Missing Legion Zone Argus Map ID
- Missing Shadowlands Zone The Maw Map IDs
- New Shadowlands Covenant (3 achievements)

### Changed
- Code cleanup
- Removed Classic Dungeons Deadmines, Shadowfang Keep, Scarlet Halls, Scarlet Monastery and Scholomance

## 9.0.5.17.0 - 2021-04-06
### Added
- Cataclysm Zones (145 achievements) + zone data except for the shared zone group
- Missing Cataclysm Tol Barad (3 achievements)

### Changed
- Cataclysm Tol Barad moved to Zones

### Fixed
- Issue #33: Random numbers in chat

## 9.0.5.16.0 - 2021-04-02
### Added
- Cataclysm Dungeons and Raids zone data
- Cataclysm Tol Barad (11 achievements) + zone data
- Mists of Pandaria Zones (145 achievements) + zone data except for the shared zone group
- Mists of Pandaria Dungeons, Raids and Scenarios have zone data
- Mists of Pandaria Pet Battles (7 achievements)
- Missing Mists of Pandaria Scenario A Little Patience (6 achievements) + zone data
- Mists of Pandaria Proving Grounds (38 achievements) + zone data
- Warlords of Draenor Zones (109 achievements) + zone data except for the shared zone group
- Warlords of Draenor Pet Battles (5 achievements)

### Fixed
- 2 wrong achievements in The Nighthold raid

## 9.0.5.15.0 - 2021-03-23
### Added
- Warlords of Draenor Garrison (151 achievements) + zone data
- Missing Legion Legion Class Hall (1 achievement)
- Current Zone category (for now always visible and need to close/open the window or select the category again in order to refresh)
- All Warlords of Draenor achievements should have zone data except for Pet Battles
- All Legion achievements should have zone data except for Pet Battles and the shared zone group
- All Battle for Azeroth achievements should have zone data except for Pet Battles and the shared zone group
- All Shadowlands achievements should have zone data except for Pet Battles
- Filter to collapse a series of achievements so only the last completed and first not completed are visible

### Changed
- Battle for Azeroth Island Expeditions are now split per Island Expeditions
- Battle for Azeroth War Effort are now split per War Effort

## 9.0.5.14.0 - 2021-03-10
### Added
- Legion Pet Battles (with external links) (25 achievements)
- Legion Legion Class Hall (38 achievements)
- Missing Battle for Azeroth Pet Battles (1 achievement)
- Battle for Azeroth Island Expeditions (64 achievements)
- Battle for Azeroth War Effort (34 achievements)
- Battle for Azeroth Heart of Azeroth (11 achievements)
- Battle for Azeroth Visions of N'Zoth (21 achievements)

### Changed
- Battle for Azeroth Pet Battles and Shadowlands Pet Battles external links

## 9.0.2.13.0 - 2021-02-24
### Added
- Legion Zones (90 achievements)
- Shadowlands Torghast (30 achievements)
- Shadowlands Covenant Sanctums (42 achievements)
- Filtering by Neutral, Kyrian, Venthyr, Night Fae and Necrolord achievements now possible
- The Achievement window is now skinned when ElvUI's Blizzard Skins and Achievements are selected (Compatibility #7)
- Right Click Menu, Filter Menu and Popup Dialog for copying links are skinned when ElvUI's Blizzard Skins and Misc Frames are selected (Compatibility #7)
- Options are skinned when ElvUI's Ace3 Skins are selected (Compatibility #7)
- Tutorials are skinned when ElvUI's Blizzard Skins and Tutorials are selected (Compatibility #7)

### Changed
- Updated all tutorial images to have a fade to transparent instead of fade to black to better work with ElvUI's Blizzard Skins and Tutorials (Compatibility #7)

## 9.0.2.12.0 - 2021-02-15
### Added
- Filtering by Neutral, Alliance and Horde achievements now possible

### Changed
- Category tooltip info is now cached instead of fetching it every time resulting in huge performance increases to up to 10 times faster GUI loading
- Data is now stored and maintained in a SQLite database with an export to lua if new data is added
- IAT v3.18.0 or higher required

## 9.0.2.11.0 - 2021-02-05
### Added
- Filtering and Sorting achievements in the new tab (Features #16 and #18)
- Tutorial added explaining the filtering and search features
- When filters are applied and certain categories would be empty, these categories are now hidden
- When searching for an achievement that is hidden due to a filter, filters will automatically get adjusted to show the achievement

### Changed
- Right click menu items have no bullets in front of their names anymore

## 9.0.2.10.1 - 2021-02-02
### Fixed
- Issue #25: Tutorial step 3 does not toggle the correct categories to show the right click menu
- Issue #26: Going through the tutorial, the Achievement Window toggles instead of staying open

## 9.0.2.10.0 - 2021-02-02
### Added
- Achievement window height can now be changed up to double the original height
- Right clicking the search box will clear it (option)
- Left Click on minimap icon will toggle the Achievement Window to the new tab
- Keybinding under Game Menu -> Key Bindings -> AddOns to toggle the Achievement Window to the new tab

### Changed
- Changing the width of the categories now also changes the width of the achievement window instead of making the achievements smaller
- Tutorial page 4 has additional information about the options related to it

### Fixed
- Issue #21: Selecting the same achievement multiple times during search toggles the selection state
- Issue #22: Visual bugs
- Issue #23: Searching achievement in category that is selected and not collapsed will trigger error
- Issue #24: When Ace3 libraries are not installed as an addon, loading this addon causes errors

## 9.0.2.9.0 - 2021-01-27
### Added
- Searching achievements in the new tab (Feature #17)
- Options related to the new search feature
- Tutorials explaining the search feature
- Battle for Azeroth Pet Battles (18 achievements)
- Missing Shadowlands Pet Battles (1 achievement)

### Changed
- Moved some code build frames into Templates.xml
- Refactored functions to select categories and achievements (needed for searching achievements)
- Moved code into libraries for other addons

### Fixed
- Issue #20: The Ruby Sanctum category has the name of Icecrown Citadel under WotLK Raids

## 9.0.2.8.1 - 2021-01-16
### Fixed
- Issue #19: 'Overachiever' (a nil value)

## 9.0.2.8.0 - 2021-01-15
### Added
- Battle for Azeroth Zones (222 achievements for either Horde and Alliance)
- The width of the categories list can be adjusted in options; negative values will narrow it, positive values will widen it
- Tutorial explaining the features of the addon; showed when opening the new achievement window tab for the first time or when clicking the Help button in Interface -> Addons -> Options (Feature #14)

### Changed
- Interface -> Addons -> Options is now handled by Ace3
- SavedVariables are now handled by Ace3
- Localization is now handled by Ace3

### Fixed
- Issue #13: Updating addon in the past could lead to errors if new SavedVariables were added

## v9.0.2.7.0 - 2021-01-09
### Added
- Addon compatibility with Instance Achievement Tracker (3.14.1 and above), achievements with info in IAT will have an option in their right click menu
- Pet battle achievements (Shadowlands only right now) has a link to https://www.wow-petguide.com/ in their right click menu

### Changed
- Complete GUI rewrite
- Addon for settings and addon for GUI have been consolidated into 1
- Memory optimization under the hood
- Minimap icon hidden by default for fresh installs since it's not doing much right now

### Fixed
- Issue #9: Cataclysm - Blackwing Decent is missing
- Issue #10: Toggling achievement tracking in Blizzard tab does not remove check mark from our tab
- Issue #11: Revisit issue #2
- Issue #12: Button loses state of IsSelected when categories are updated by selecting a category and by the scrollbar

## 90002.6.0 - 2021-01-02
### Added
- Right click menu for every achievement in the new tab with a link to Wowhead.

## 90002.5.0 - 2020-12-29
### Added
- Shadowlands pet battles (13 achievements)

## 90002.4.0 - 2020-12-26
### Added
- Split Shadowlands zones achievements in their respective zones
- More distinctive visual between collapsed and not collapsed categories

## 90002.3.0 - 2020-11-27
### Added
- Shadowlands zones (93 achievements)

## 90002.2.0 - 2020-11-23
### Added
- Mists of Pandaria scenarios (60 achievements)

### Fixed
- Issue #8: Toggling achievement tracking does not update the achievement for Blizzard achievement tracking

## 90002.1.0 - 2020-11-22
### Added
- Classic dungeons (60 achievements)
- Classic raids (11 achievements)
- The Burning Crusade dungeons (36 achievements)
- The Burning Crusade raids (13 achievements)
- Wrath of the Lich King dungeons (80 achievements)
- Wrath of the Lich King raids (366 achievements, including 136 legacy Ulduar achievements)

### Fixed
- Issue #1: Overachiever_Tabs overwrites AchievementFrame_UpdateTabs breaking our hook
- Issue #2: Overachiever_Tabs LeftFrame_OnHide shows a frame we need hidden
- Issue #3: Toggling achievement tracking does not update the achievement
- Issue #4: Tooltip only shows when hovering the shield, not the entire achievement
- Issue #6: Error GetNextAchievement(achievementID)

## 90002.0.2 Beta - 2020-11-20
### Added
- Cataclysm dungeons (66 achievements)
- Cataclysm raids (69 achievements)
- Mists of Pandaria dungeons (94 achievements)
- Mists of Pandaria raids (117 achievements)
- Warlords of Draenor dungeons (91 achievements)
- Warlords of Draenor raids (81 achievements)
- Legion dungeons (72 achievements)
- Legion raids (111 achievements)

## 90002.Beta 0.1 - 2020-11-19
### Added
- Battle for Azeroth dungeons (63 achievements)
- Battle for Azeroth raids (106 achievements)
- Shadowlands dungeons (50 achievements)
- Shadowlands raids (26 achievements)

### Removed
- The need for almost all localization
