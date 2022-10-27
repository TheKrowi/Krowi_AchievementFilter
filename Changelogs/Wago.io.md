### Added
- Option to hide Not Earned By if current character earned the achievement in tooltip
- Exclude character from Earned By section in tooltips via the Data manager
- Completely ignore character via the Data manager
- ElvUI support for the Data manager
- Plugin to rename Exploration -> Dragon Isles Category to Dragonflight

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

### Fixed (45.1)
- Clicking the Track checkbox on an achievement should no longer cause an error