### Added
- Achievement guides for the other eleven Legendary Research achievements, one per class hall
- Curse Surge event reminders, wherever you are, with the surge's name and time left; each surge can be turned off under Event Reminders > World Events > Midnight
- Tracking an achievement while 10 are tracked now first stops tracking the ones you already completed, and names them in chat

### Changed
- Achievement guides now name the people to talk to in your game's language
- The Legendary Research of the Ebon Blade guide now starts with where to go, with Death Gate under it
- Legion Assaults are now one reminder with one toggle, instead of one per zone
- Covenant assault reminders now only show for characters who finished chapter 2 of Chains of Domination
- Krowi_Menu library updated to 2.2
- Krowi_Util library updated to 2.8
- Krowi_WorldMapButtons library updated to 1.4.12

### Fixed
- Let Her Solo Me shows as obtainable again, since it can still be earned
- The Track check in the achievement window and in popped-out achievements now updates when an achievement is tracked or untracked elsewhere, such as from the objective tracker
- Pasting an achievement link into chat with the paste-to-chat modifier no longer gives an error when the game's deprecated API fallbacks are turned off
- The addon's memory no longer keeps climbing in addon memory displays while you play: the taint diagnostics no longer create garbage in the background, and the event reminders create far less
- Community Feast reminders now show wherever you are, not only in the Azure Span: Next in the 15 minutes before the cooking starts, Active while it cooks
- Time Rift, Superbloom and Azerothian Archives reminders now show wherever you are, not only in their zones, each with a Next shortly before it starts
- Superbloom: Active now shows its time left instead of "No time data available"
- Dreamsurge reminders show in their zones again
- Tooltips no longer keep giving "secret number value" errors after you hover a category on the Guild tab or on Blizzard's own Achievements tab; on Retail those categories now show the addon's progress tooltip
- The Event Reminders tutorial page now shows whether the compact reminder is turned on, and names the event types
- Some tutorial and option texts in German, French, Russian and Korean no longer show a placeholder such as {addon} instead of the text, and the Remix Bronze reward filter no longer reads "RemixBronze" in German