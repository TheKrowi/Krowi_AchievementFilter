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