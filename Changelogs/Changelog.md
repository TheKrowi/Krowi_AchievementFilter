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

### Fixed (51.1)
- Blizzard Achievement tab is once again able to be hidden/shown from the options

### Changed (51.2)
- Backend plugin options
- Code cleanup
- Moved plugin localization into separate file; allows for the plugin texts also to be localized

### Fixed (51.2)
- Talking head frame should once again be independent

### Removed (51.2)
- Overachiever compatibility

### Fixed (51.3)
- Loading achievements that are watched/excluded but are removed from the database should no longer cause an error

### Added (51.4)
- Tooltip data for the The Winter Veil Gourmet achievement
- Realm First! Dragonflight Keystone Hero