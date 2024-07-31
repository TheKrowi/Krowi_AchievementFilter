local _, addon = ...;
local L = addon.Localization.GetDefaultLocale();
addon.L = L;

addon.Plugins:LoadLocalization(L);

-- [[ https://legacy.curseforge.com/wow/addons/krowi-achievement-filter/localization ]] --
-- [[ Everything after this line is automatically generated from CurseForge and is not meant for manual edit - SOURCETOKEN - AUTOGENTOKEN ]] --

-- [[ Exported at 2024-07-31 20-11-34 ]] --
L["%c"] = true
L["%d/%m/%Y %I:%M %p"] = true
L["%m/%d/%Y %I:%M %p"] = true
L["%m/%d/%Y %R"] = true
L["%Y/%m/%d %I:%M %p"] = true
L["%Y/%m/%d %R"] = true
L["10th Anniversary"] = true
L["450 skill"] = true
L["525 skill"] = true
L["600 skill"] = true
L["Academy Ascent"] = true
L["Account"] = true
L["Account wide (default)"] = true
L["Achievement browsing history"] = true
L["Achievement Calendar"] = true
L["Achievement is Completed"] = true
L["Achievement is Completed Desc"] = "Show Achievement Criteria even if the Achievement is already completed."
L["Achievement is excluded"] = "This achievement is excluded."
L["Achievement is watched"] = "This achievement is in your {watchList}."
L["Achievement points earned by"] = true
L["Achievement shown temporarily"] = "This achievement is shown temporarily because it does not match any set filters."
L["Achievement was Not Earned by Me"] = true
L["Achievement was Not Earned by Me Desc"] = "Show Achievement Criteria if the Achievement was not yet earned by the current character. This allows for more control if you play multiple characters."
L["Achievement Window"] = true
L["Achievement window height offset"] = true
L["Achievement window height offset Desc"] = [=[The height that will be added to or subtracted from the default achievement window height.

This value can be changed while the achievement window is open and having one of the tabs selected added by {addonName}. This might have an impact (1) on the game.

(1) FPS drops and stuttering while adjusting the value, NOT during normal addon use]=]
L["Achievements"] = true
L["Achievements width offset"] = true
L["Achievements width offset Desc"] = [=[The width that will be added to the default achievements width.

This value can be changed while the achievement window is open and having one of the tabs selected added by {addonName}. This might have an impact (1) on the game.

(1) FPS drops and stuttering while adjusting the value, NOT during normal addon use]=]
L["Active"] = true
L["Active events"] = true
L["Add addon name to world map icon"] = true
L["Add addon name to world map icon Desc"] = "Add '{addonName}' to the bottom of the tooltip when mousing over the icon."
L["Add Locale"] = true
L["Add Locale Desc"] = "Add the current game's locale to the {wowheadLink}."
L["Add to / Remove from Watch List"] = true
L["Add to Watch List"] = "Add to {watchList}"
L["Added in version"] = true
L["Adjustable Categories"] = true
L["Aki the Chosen"] = true
L["Alt"] = true
L["Always Show Completed"] = true
L["Always show realm"] = true
L["Always show realm Desc"] = "Always show the character's realm regardless if the character is on the same realm as this character."
L["Amathet"] = true
L["Andurs"] = true
L["Apex Canopy River Run"] = true
L["Aqir"] = true
L["Archive Ambit"] = true
L["Are you sure you want to delete character?"] = "Are you sure you want to delete {character}? This character will be added again if you log in to it. If you don't want to see this character, check the {ignore} flag."
L["Assault on Azsuna"] = true
L["Assault on Drustvar"] = true
L["Assault on Highmountain"] = true
L["Assault on Nazmir"] = true
L["Assault on Stormheim"] = true
L["Assault on Stormsong Valley"] = true
L["Assault on Tiragarde Sound"] = true
L["Assault on Val'sharah"] = true
L["Assault on Vol'dun"] = true
L["Assault on Zuldazar"] = true
L["Assault: Amathet"] = true
L["Assault: Aqir"] = true
L["Assault: Mantid"] = true
L["Assault: Mogu"] = true
L["Assault: N'Zoth (Uldum)"] = true
L["Assault: N'Zoth (Vale of Eternal Blossoms)"] = true
L["Author"] = true
L["Auto number of summary achievements"] = true
L["Auto number of summary achievements Desc"] = "Automatically adjust the number of achievements shown so no scroll bar is shown."
L["Awakened Raids"] = true
L["Awakening the Machine"] = true
L["Azerothian Archives"] = true
L["Azsuna"] = true
L["Azure Span"] = true
L["Azure Span: Next"] = true
L["Blizzard"] = true
L["BlizzCon"] = true
L["Brackenhide Hollow"] = true
L["Brawler's Guild"] = true
L["Brewfest"] = true
L["Broken Isles Cup"] = true
L["Build"] = true
L["Buildings"] = true
L["Burning Pandaren Spirit"] = true
L["Bur's Mount Collection"] = true
L["Button"] = true
L["Calendar"] = true
L["Calendar button"] = true
L["Calendar button horizontal position Desc"] = "Adjust the horizontal position of the {calendarButton}."
L["Calendar button vertical position Desc"] = "Adjust the vertical position of the {calendarButton}."
L["Calendar Desc"] = [=[Identical look and feel to the {calendar}.

|T:1:8|t- The number of achievements and points on top are the earned achievements and points for the current visible month, not all visible days.
|T:1:8|t- Navigate to previous and next months by clicking the buttons on the top next to the month or by using the scroll wheel.
|T:1:8|t- Mousing over a day will highlight it (day 11) and show the achievements (if any) earned on that day in the window on the side. When removing the mouse from the highlighted day, the window on the side will either close or show the achievements earned for the new day the mouse is over.
|T:1:8|t- Clicking (selecting) a day will highlight it even brighter (day 18) and keep the window on the side open (lock). This allows for the user to scroll through the achievements, mouse over them to see the tooltip or click them to find them in the achievement window (will close the calendar). Selecting a day only works if achievements are earned on that day.
|T:1:8|t- Clicking a selected day will deselect it and unlock the window on the side allowing it to act like a highlighted day again. Closing the window on the side by clicking on its close button will do the same.
|T:1:8|t- An arrow on the day indicates more than 4 achievements were earned on that day.

Options (1)
|T:1:8|t- When (re)opening the calendar, you can choose to always keep the last viewed month selected ({lockMonth}) or only when clicking an achievement ({lockAchievementMonth}).
|T:1:8|t- The first day of the week can be changed and is currently set to {firstWeekDay}.

(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {calendar}]=]
L["Calendar Events"] = true
L["Call of the Crusade"] = true
L["Cataclysm (pre-patch)"] = true
L["Categories"] = true
L["Categories not loaded"] = [=[{addonName} is not yet fully loaded.
Close and open the Achievement Window again to refresh the categories.]=]
L["Categories width offset"] = true
L["Categories width offset Desc"] = [=[The width that will be added to or subtracted from the default categories width.

This value can be changed while the achievement window is open and having one of the tabs selected added by {addonName}. This might have an impact (1) on the game.

(1) FPS drops and stuttering while adjusting the value, NOT during normal addon use]=]
L["Category shown temporarily"] = "This category was selected by clicking on the {eventName} event reminder and is shown temporarily because it has no achievements that match the set filters."
L["Caverns Criss-Cross"] = true
L["Center Header"] = true
L["Center header"] = true
L["Center header Desc"] = "Keep the header centered on the achievements window."
L["Center Header Desc"] = "Center the achievement's name on the achievement button."
L["Central Circuit"] = true
L["Chains of Domination"] = true
L["Character / Account wide"] = true
L["Character only"] = true
L["Characters"] = true
L["Chat messages"] = true
L["Checked"] = true
L["Children's Week"] = true
L["Class Hall"] = true
L["Clear all"] = true
L["Clear all Desc"] = "Clear all watched achievements."
L["Clear search field on Right Click"] = true
L["Clear search field on Right Click Desc"] = "Enable / disable clearing the search field when Right Clicking in it."
L["Click here to view in achievement window"] = true
L["Click here to view in achievements"] = true
L["Cliffside Circuit"] = true
L["Cobalt Assembly"] = true
L["Coldheart Interstitia"] = true
L["Collapse Chain"] = true
L["Collecting data"] = true
L["Collector's Edition"] = true
L["Comments"] = true
L["Community Feast"] = true
L["Community Feast: Active"] = true
L["Community Feast: Cooking"] = true
L["Community Feast: Next"] = true
L["Community Feast: Ready"] = true
L["Community Feast: Soon"] = true
L["Community Feast: Starting Soon"] = true
L["Compact"] = true
L["Compact Achievements"] = true
L["Compact Achievements Desc"] = "Achievements are 2/3rd the size, similar to the summary achievements."
L["Compact Achievements T Desc"] = [=[- Achievements are 2/3rd the size, similar to the summary achievements.
- Shows either the first line of the description or the reward.

Compact achievements can be enabled from the options ({compactEnabled}) (1).

(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}]=]
L["Compact Desc"] = [=[Use a more compact version with only a single line of time display.

{reloadRequired}]=]
L["Completion"] = true
L["Covenant"] = true
L["Covenant Assaults"] = true
L["Covenant assaults"] = true
L["Credits"] = true
L["Criteria"] = true
L["Criteria Behaviour"] = true
L["Criteria Behaviour Desc"] = [=[The way a criteria with too long text will behave.

|T:1:8|t- {overflow}: Text will display as normal and just overflow. This can result in texts overlapping.
|T:1:8|t- {truncate}: Will cut off the text and show '…' at the end.
|T:1:8|t- {flexible}: Criteria with too long texts will be placed on a new line. Other criteria will be displayed in two columns.]=]
L["Criteria is Completed"] = true
L["Criteria is Completed Desc"] = "Show Achievement Criteria even if the Achievement Criteria is already completed."
L["Criteria of"] = true
L["Cross-Expansion"] = true
L["Cross-Expansion - Delves"] = true
L["Ctrl"] = true
L["Current Obtainable"] = true
L["Current Zone"] = true
L["CurseForge"] = true
L["CurseForge Desc"] = "Open a popup dialog with a link to the {addonName} {curseForge} page."
L["Custom"] = true
L["Dark Heart"] = true
L["Darkmoon Faire"] = true
L["Data Manager"] = true
L["Date and Time format"] = true
L["Date and Time formatting guide"] = "Date and Time Formatting Guide"
L["Date and Time formatting guide Desc"] = [=[{a} - Abbreviated weekday name (eg. Wed)
{A} - Full weekday name (eg. Wednesday)
{b} - Abbreviated month name (eg. Sep)
{B} - Full month name (eg. September)
{c} - Date and time representation appropriate for locale (eg. 23/04/07 10:20:41)
{C} - The century number (year/100) (eg. 20)
{d} - Day of month as decimal number (01 - 31)
{D} - Equivalent to %m/%d/%y (eg. 04/23/07)
{e} - Day of month as decimal number (1 - 31)
{H} - Hour in 24-hour format (00 - 23)
{I} - Hour in 12-hour format (01 - 12)
{j} - Day of year as decimal number (001 - 366)
{k} - Hour in 24-hour format (0 - 23)
{l} - Hour in 12-hour format (1 - 12)
{m} - Month as decimal number (01 - 12)
{M} - Minute as decimal number (00 - 59)
{p} - Current locale's A.M./P.M. indicator for 12-hour clock (eg. AM/PM)
{P} - Current locale's A.M./P.M. indicator for 12-hour clock (eg. am/pm)
{R} - Equivalent to %H:%M (eg. 10:20)
{s} - Number of second since Epoch, i.e., since 1970-01-01 00:00:00 UTC (1177323641)
{S} - Second as decimal number (00 - 59)
{u} - Weekday as decimal number (1 - 7; Monday is 1)
{U} - Week of year as decimal number, with Sunday as first day of week 1 (00 - 53)
{w} - Weekday as decimal number (0 - 6; Sunday is 0)
{W} - Week of year as decimal number, with Monday as first day of week 1 (00 - 53)
{x} - Date representation for current locale (Standard date string)
{X} - Time representation for current locale (Standard time string)
{y} - Year without century, as decimal number (00 - 99)  (eg. 07)
{Y} - Year with century, as decimal number (eg. 2007)
{z} - Time-zone as hour offset from GMT (eg. +0200)
{Z} - Time-zone name or abbreviation; no characters if time zone is unknown]=]
L["Day of the Dead"] = true
L["Debug"] = true
L["Debug Desc"] = "Each of the options below are available for debugging and testing purposes. Use at your own risk!"
L["Default value"] = true
L["Defending Azeroth Assaults"] = true
L["Defending the Ruby Sanctum"] = true
L["Deselect All"] = true
L["Diablo"] = true
L["Diablo III"] = true
L["Diablo IV"] = true
L["Discord"] = true
L["Discord Desc"] = "Open a popup dialog with a link to the {serverName} Discord server. Here you can post comments, reports, remarks, ideas or anything else related."
L["Donations"] = true
L["Dos-Ryga"] = true
L["Down"] = true
L["Dragon Glyphs"] = true
L["Dragon Racing"] = true
L["Dragonbane Keep"] = true
L["Dragonblight"] = true
L["Dragonflight (pre-patch)"] = true
L["Dragonriding"] = true
L["Dragonriding Races"] = true
L["Dreamsurge"] = true
L["Dreamsurges"] = true
L["Drops"] = true
L["Drustvar"] = true
L["Dueler's Guild"] = true
L["during"] = true
L["Dustwallow Marsh"] = true
L["Earned By"] = true
L["Earned By Desc"] = [=[Header
|T:1:8|t- {achievementPointsEarnedBy}: Display {achievementPointsEarnedBy_wc} your current character and/or {achievementPointsEarnedBy_wc} your account ({achievementPointsEarnedByFormat}) (1).
|T:1:8|t- {tooltip}: Overview of which character has earned how many achievement points. Each character needs to be logged in at least once to be added to this list. Will show the character's realm if it's different. Can be forced to always show from the options (1).

Filters
|T:1:8|t- {account}: Achievements are saturated if earned on any character on your account (default).
|T:1:8|t- {character}: Achievements are saturated if earned by your current character and partially saturated if earned on another character on your account but not by the current one.

Tooltip
|T:1:8|t- {earnedBy}: Shows {earnedByNumber} characters that have earned this achievement (2). Faction exclusive achievements with a linked counterpart are taken into account. I.e. alliance characters might show up for horde achievements. Will show the character's realm if it's different. Can be forced to always show from the options (2).
|T:1:8|t- {notEarnedBy}: Shows {notEarnedByNumber} characters that have not yet earned this achievement (2). Faction exclusive achievements with a linked counterpart are taken into account. I.e. alliance characters might show up for horde achievements. Will show the character's realm if it's different. Can be forced to always show from the options (2).

(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {header}
(2) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}]=]
L["Eastern Kingdoms Cup"] = true
L["Echoes of Doom"] = true
L["Emberflow Flight"] = true
L["Embers of Neltharion"] = true
L["Emerald Garden Ascent"] = true
L["Enable"] = true
L["Enable debug info"] = true
L["Enable debug info Desc"] = "Enable / disable debug info."
L["Enable Desc"] = "Enable / Disable the plugin. Having the plugin disabled if the addon is active, unpredictable things might happen."
L["Enable trace info"] = true
L["Enable trace info Desc"] = "Enable / disable trace info."
L["End Time"] = true
L["Enhanced filtering and sorting"] = true
L["Enhanced filtering and sorting Desc"] = [=[Filtering and sorting of achievements is enhanced with following features.

Categories:
|T:1:8|t- {mergeSmallCategories}: Merge categories if allowed with less than {mergeSmallCategoriesNumber} achievements (1).

Filtering (multiple filters can be selected at the same time):
|T:1:8|t- {completed}: Show completed achievements.
|T:1:8|t- {notCompleted}: Show not completed achievements.
|T:1:8|t- {obtainable}: Show obtainable achievements.
|T:1:8|t- {notObtainable}: Show not obtainable achievements.
|T:1:8|t- {faction} ({resetFactionFilters} {resetFactionFiltersEnabled}) (2)
|T:1:8|t|T:1:8|t- {neutral}: Show achievements that both {alliance_wc} and {horde_wc} can earn.
|T:1:8|t|T:1:8|t- {alliance}: Show achievements only {alliance_wc} can earn.
|T:1:8|t|T:1:8|t- {horde}: Show achievements only {horde_wc} can earn.
|T:1:8|t- {excluded}: Show excluded achievements.
|T:1:8|t- {collapseChain}: Show only the last completed and first not completed achievement in a chain.

Sorting:
|T:1:8|t- {noSorting}: No sorting applied.
|T:1:8|t- {sortByName}: Sort achievements based on their names.
|T:1:8|t- {sortByCompletion}: Sort achievements based on if they are completed or not.
|T:1:8|t- {sortByID}: Sort achievements based on their ID.
|T:1:8|t- {reverseSort}: When this is selected, invert the order of the sorted achievements.

{tabs}:
|T:1:8|t- These have all the filtering and sorting features mentioned above but can be changed independent from the others.
|T:1:8|t- Changing any of the above filters will overwrite the individial tab's filtering and sorting.

{specialCategories}:
|T:1:8|t- These have all the filtering and sorting features mentioned above but can be changed independent from the others.

{earnedBy} (see {earnedByTutorial} for more details)
|T:1:8|t- {account}: Achevements are saturated if earned on any character on your account.
|T:1:8|t- {character}: Achievements are saturated if earned by your current character and partially saturated if earned on another character on your account but not the current one.

Other:
|T:1:8|t- {help}: Start the tutorial from the start and reset what you've viewed.
|T:1:8|t|T:1:8|t- Shows the specific tutorial page without resetting what you've viewed.
|T:1:8|t- {options}: Open the addon's options (2).

More filters and sorting options can be requested on {discord} or {curseForge} (links in the options).

(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {categories}
(2) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName}]=]
L["Enhanced tooltip"] = true
L["Enhanced tooltip Achievements Desc"] = [=[Each tooltip has additional information on how achievements relate to each other (if they do). Several new sections are added to it.

Features:
|T:1:8|t- {notObtainable}: Shows the text '{noLongerObtainable}' if the achievement is no longer obtainable.
|T:1:8|t- {earnedBy}: See {earnedBy} for more information.
|T:1:8|t- {partOfAChain}: Shows the list of achievements the hovered achievement is part of (1) ({partOfAChainEnabled}) (2).
|T:1:8|t- {requiredFor}: Shows a list of achievements that require the hovered achievement to be completed in order to earn it (1) ({requiredForEnabled}) (2).
|T:1:8|t- {otherFaction}: Shows the related achievement of the other faction ({otherFactionEnabled}) (2).
|T:1:8|t- {objectivesProgress}: Shows the list of objectives with progress ({objectivesProgressEnabled}) (2).
|T:1:8|t|T:1:8|t- Custom objectives: Some achievements have custom objectives like the transmog achievements showing your progress towards the related transmog sets.

Icons:
|T:1:8|t- {ready}: The achievement is completed.
|T:1:8|t- {waiting}: The achievement is not completed.
|T:1:8|t- {notready}: The achievement is not possible to obtain anymore.

Colors:
|T:1:8|t- {green}: The achievement/objective is completed.
|T:1:8|t- {grey}: The achievement/objective is not completed.
|T:1:8|t- {red}: The achievement is not possible to obtain anymore.
|T:1:8|t- Lighter {lightGreen}, {lightGrey} or {lightRed}: The hovered achievement.

More custom objectives can be requested on {discord} or {curseForge} (links in the options).

(1) Optionally, two icons can be displayed per line. The first icon is the default one, the second one is for the current character ({currentCharacterIconEnabled}) (2).
(2) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}]=]
L["Enhanced tooltip Categories Desc"] = [=[Each tooltip has additional information on how many achievements are (not) obtainable and (not) completed.

The numbers in the progress bar are in the following format:
|T:1:8|tOC (+NONC) / T
|T:1:8|t|T:1:8|t- {oc}: The (not) obtainable completed achievements.
|T:1:8|t|T:1:8|t- {nonc}: The not obtainable not completed achievements (1).
|T:1:8|t|T:1:8|t- T: Total number of achievements.

Colors:
|T:1:8|t- {green}: The (not) obtainable completed achievements.
|T:1:8|t- {red}: The not obtainable not completed achievements (1).
|T:1:8|t- Empty: The obtainable not completed achievements.

The {red} part of the progress bar and number in brackets can either be disbled in options ({showNotObtainable}) (1) or by unchecking the {notObtainable} filter.

(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {categories}]=]
L["Error Tabs Order"] = "{blizzard} tab {statistics} can not be in front of {guild}."
L["Escalation"] = true
L["Eternity's End"] = true
L["Event Reminder"] = true
L["Event Reminder Desc"] = [=[{events} are added to the new {events} tab and a reminder will pop up (max {numPopUps} at the same time) when one of the events is active ({popUpEnabled}) (1).

The event reminder has the name of the event and up to 2 lines of time display (end time of the event) (1).
The format of the time display can be chosen from presets or custom made (1).
A compact version exists with a single line for time display (compactEnabled) (1).

Clicking it will open the category with the obtainable achievements while the event is active.
It will dissapear when right clicked or after {eventAlertFadeDelay} seconds when ignored (1).

The reminder is also present on the right side of the achievement window.

Event types:
|T:1:8|t- calendarEvents (e.g.: Holidays).
|T:1:8|t- widgetEvents (e.g.: Torghast).
|T:1:8|t- worldEvents (e.g.: Assaults).

(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {eventReminders}]=]
L["Event Reminders"] = true
L["Events"] = true
L["Exclude"] = true
L["Exclude Excluded achievements"] = true
L["Exclude Excluded achievements Desc"] = "Exclude / include Excluded achievements from / in the search results."
L["Excluded"] = true
L["Expansions"] = true
L["Expansions tab"] = true
L["Expansions tab Desc"] = [=[Achievements are grouped in categories per expansion with a more logic hierarchy.

The hierarchy is as follow:
|T:1:8|t- {expansion}
|T:1:8|t|T:1:8|t- {zones}
|T:1:8|t|T:1:8|t|T:1:8|t- {quests}
|T:1:8|t|T:1:8|t|T:1:8|t- {exploration}
|T:1:8|t|T:1:8|t|T:1:8|t- {pvp}
|T:1:8|t|T:1:8|t|T:1:8|t- {reputation}
|T:1:8|t|T:1:8|t- {dungeons}
|T:1:8|t|T:1:8|t- {raids}
|T:1:8|t|T:1:8|t- {petBattles}
|T:1:8|t|T:1:8|t- {expansionFeatures}

Special categories:
|T:1:8|t- {currentZone}: Shows the achievements linked to the current zone you're in.
|T:1:8|t- {selectedZone}: Shows the achievements linked to the selected zone from the world map.
|T:1:8|t- {watchListCategory}: Shows the watched achievements. Achievements can be displayed with or without their subcategories (1).
|T:1:8|t- {excludedCategory}: Shows the excluded achievements. Achievements can be displayed with or without their subcategories (1). Can be permanently hidden from the options (1).

(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {categories}]=]
L["Export"] = true
L["Export Criteria"] = true
L["Export Criteria Desc"] = "Exports Achievement Criteria to the Saved Variables. This is used to add new content."
L["Faction Assaults"] = true
L["Fade delay"] = true
L["Fade delay Desc"] = "The time in seconds it takes for the alert to fade when it's ignored. Right clicking will close it immidiatly."
L["Fall of the Lich King"] = true
L["Fated Raids"] = true
L["Fated Raids: Castle Nathria"] = true
L["Fated Raids: Castle Nathria (CN)"] = true
L["Fated Raids: Castle Nathria (EU)"] = true
L["Fated Raids: Castle Nathria (US)"] = true
L["Fated Raids: Sanctum of Domination"] = true
L["Fated Raids: Sanctum of Domination (CN)"] = true
L["Fated Raids: Sanctum of Domination (EU)"] = true
L["Fated Raids: Sanctum of Domination (US)"] = true
L["Fated Raids: Sepulcher of the First Ones"] = true
L["Fated Raids: Sepulcher of the First Ones (CN)"] = true
L["Fated Raids: Sepulcher of the First Ones (EU)"] = true
L["Fated Raids: Sepulcher of the First Ones (US)"] = true
L["Feast of Winter Veil"] = true
L["Fen Flythrough"] = true
L["Filters"] = true
L["Firestorms"] = true
L["First day of the week"] = true
L["First day of the week Desc"] = "The first day of the week the calendar should use."
L["FixTabs"] = [=[All tabs are shown again. This was necessary to introduce the new tabs ordering feature.
Sorry for any inconvenience.]=]
L["Flashfrost Flyover"] = true
L["Flexible"] = true
L["Flowing Pandaren Spirit"] = true
L["for achievement"] = "for {achievement}"
L["Force two columns"] = true
L["Force two columns Desc"] = "Enable / disable the algorithm to force two achievement objectives columns. When enabled, if only one column of objectives would be shown due to the text of one or more objectives being too long, a second column will be forced based on the other settings."
L["Force two columns threshold"] = true
L["Force two columns threshold Desc"] = "The number of criteria the achievement must have before we force a second column if normally only one would be shown."
L["Format"] = true
L["Fracture Chambers"] = true
L["Fractures in Time"] = true
L["from"] = true
L["from the start of"] = true
L["Full Search"] = true
L["Full Search Desc"] = "By selecting '{showAllResults}' you're able to view all search results. See the {quickSearchTutorial} tutorial for more details."
L["Fury Incarnate"] = true
L["Fury of Hellfire"] = true
L["Future Obtainable"] = true
L["Fyrakk Assault"] = true
L["Fyrakk Assaults"] = true
L["Garden Gallivant"] = true
L["Garrisons Update"] = true
L["Gathering"] = true
L["Gifts"] = true
L["Gladiator's Sanctum"] = true
L["Glory"] = true
L["Go back one achievement"] = true
L["Go forward one achievement"] = true
L["Go to"] = true
L["Going away with"] = true
L["Gorespine"] = true
L["Grand Hunts"] = true
L["Grand Hunts: Ohn'ahran Plains"] = true
L["Grand Hunts: Thaldraszus"] = true
L["Grand Hunts: The Azure Span"] = true
L["Grand Hunts: The Waking Shore"] = true
L["Green"] = true
L["Grey"] = true
L["Greyhoof"] = true
L["Grow direction"] = true
L["Grow direction Desc"] = "The direction in which new reminders will be added."
L["Guardians of the Dream"] = true
L["Guides"] = true
L["Hallow's End"] = true
L["Header"] = true
L["Header tooltip"] = true
L["Hearthstone"] = true
L["Hearthstone's 10th Anniversary"] = true
L["Heroes of the Storm"] = true
L["Hide Date Completed"] = "Hide completion date"
L["Hide Date Completed Desc"] = "Hide the date the achievement was completed on."
L["Hide Not Earned By if current character earned the achievement"] = "Hide {notEarnedBy} if current character earned the achievement"
L["Hide Not Earned By if current character earned the achievement Desc"] = "Hide the {notEarnedBy} section if the current character has earned the achievement. The {earnedBy} section will still be shown as normal."
L["Highmountain"] = true
L["Holidays"] = true
L["Horizontal position"] = true
L["Hour of Twilight"] = true
L["Icon Left click"] = "to open the Achievement window."
L["Icon Right click"] = "for Options."
L["ID"] = true
L["Ignore"] = true
L["Ignore Filters"] = true
L["Ignore Filters Desc"] = "Ignore any filters and show all the achievements in the {category}."
L["Imbu"] = true
L["Import"] = true
L["in"] = true
L["In instances"] = true
L["Include"] = true
L["Include all"] = true
L["Include all Desc"] = "Include all excluded achievements."
L["Indentation"] = true
L["Indentation Desc"] = "The size of the indentation of child categories."
L["Invasions"] = true
L["is"] = true
L["Iskaara Flyover"] = true
L["Kafi"] = true
L["Kalimdor Cup"] = true
L["Ka'wi the Gorger"] = true
L["Keep current character"] = true
L["Keep current character Desc"] = "Keep the current character in the list of characters in the tooltip regardless if the character would be truncated from the list by the {maxNumChar} or not."
L["Keybindings Desc"] = "To change keybindings for {addonName}, select the Game tab in the top left of this window. Then select the {keybindings} category on the left. Lastly select AddOns in the right view."
L["Kyrian Assault"] = true
L["Landfall"] = true
L["Layout"] = true
L["Left"] = true
L["Left Alt"] = true
L["Left click"] = true
L["Left Ctrl"] = true
L["Left Shift"] = true
L["Legion Assaults"] = true
L["Level 80"] = true
L["Level 85"] = true
L["Level 90"] = true
L["Leveling"] = true
L["Line"] = true
L["Load Tracking Achievements"] = true
L["Load Tracking Achievements Desc"] = "Load achievements marked as tracking achievements normally not visible to the player. This also enables the searching and viewing of them in the achievements window."
L["Loaded"] = true
L["Loaded Desc"] = "Indicates if the addon related to the plugin is loaded or not."
L["Localizations"] = true
L["Location"] = true
L["Lock month"] = true
L["Lock month Desc"] = "Keep the last shown month as the month to show when opening the calendar again after it was closed."
L["Lock month when closed by achievement"] = true
L["Lock month when closed by achievement Desc"] = "Keep the last shown month as the month to show when opening the calendar again after it was closed by clicking an achievement on the side."
L["Login Delay"] = true
L["Love is in the Air"] = true
L["Lucky Yi"] = true
L["Lunar Festival"] = true
L["M+ Season"] = true
L["Make windows movable"] = true
L["Make windows movable Desc"] = [=[Makes the Achievement window Calendar view and Data manager movable/not movable.

When checked, keeping the left mouse button pressed moves the Achievement window. This works on the header and borders.]=]
L["Mantid"] = true
L["Maruukai Dash"] = true
L["Max number of alerts"] = true
L["Max number of alerts Desc"] = "The maximum number of alerts shown at once."
L["Maximum number of characters"] = true
L["Maximum number of characters Desc"] = "The maximum number of characters to show in the tooltip."
L["Merge Small Categories"] = true
L["Merge small categories threshold"] = true
L["Merge small categories threshold Desc"] = [=[Categories with a number of achievements lower than this number will merge into the parent category.

Only preset categories can merge (mostly child categories from zones). This might have an impact (1) on the game.

(1) FPS drops and stuttering while adjusting the value, NOT during normal addon use]=]
L["Micro Button"] = true
L["Midsummer Fire Festival"] = true
L["Minimum characters to search"] = true
L["Minimum characters to search Desc"] = [=[The number of characters needed in order to start searching for achievements matching the query.
The smaller the number, the greater the impact (1) on the game.

(1) FPS drops and stuttering while searching]=]
L["Mirror of the Sky Dash"] = true
L["Mists of Pandaria (pre-patch)"] = true
L["Modifiers"] = true
L["Mogu"] = true
L["More"] = true
L["Mort'regar"] = true
L["Most progress"] = true
L["Mouse Wheel Scroll Speed"] = true
L["Mouse Wheel Scroll Speed Desc"] = "The number of {items} that will be scrolled when clicking the scroll bar's up/down buttons or spinning the mouse wheel."
L["Movable"] = true
L["Mythic+"] = true
L["Nazmir"] = true
L["Necrolord Assault"] = true
L["Necrolords Assault"] = true
L["never obtainable"] = true
L["New Achievement Colors"] = true
L["New Achievement Colors Desc"] = [=[- The default gold of an obtained achievement. The border is changed from red to gold.
- The new red of an obtained not obtainable achievement with default red border.
- The new red of a not obtained not obtainable achievement with default grey border.
- The default blue of an obtained account-wide achievement with default blue border.]=]
L["New achievement window tabs"] = true
L["New achievement window tabs Desc"] = [=[New tabs are added to the achievement window.
This offers a new way of displaying achievements in a familiar fashion without interfering with the default tabs.

Tabs:
|T:1:8|t- {achievements}: A copy from the default {achievements} tab but with all the new features added by {addonName_y}.
|T:1:8|t- {expansions}: Achievements are grouped in categories per expansion with a more logic hierarchy. See the {expansionsTabTutorial} tutorial for more details.
|T:1:8|t- {events}: Achievements are grouped in categories per event. This goes from holidays to world events like assaults.
|T:1:8|t- {pvp}: Achievements are grouped in categories per battleground.
|T:1:8|t- {specials}: These categories are collections of achievements that award mounts, titles, transmog and others that not realy fit anywhere else.

Both default tabs and tabs added by {addonName_y} can be hidden from the options (1).
{pluginText}
(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {tabs}]=]
L["News"] = true
L["Next"] = true
L["Next from startDate until endDate"] = "Next from {startDate} until {endDate}"
L["Next occurrence unknown"] = true
L["Night Fae Assault"] = true
L["Nitun"] = true
L["No achievements are available with the current set of filters"] = true
L["No category selected"] = true
L["No characters found"] = true
L["No data found"] = true
L["No time data available"] = true
L["Noblegarden"] = true
L["Nokhudon Hold"] = true
L["NONC"] = true
L["None"] = true
L["No-No"] = true
L["Northrend Cup"] = true
L["Not Earned By"] = true
L["Not earned by:"] = true
L["Not loaded"] = true
L["Not Obtainable"] = true
L["Not part of set"] = true
L["Number of Earned By characters"] = "Number of {earnedBy} characters"
L["Number of Earned By characters Desc"] = [=[The number of characters that will be displayed that have earned the achievement.

Setting it to 0 will disable this feature.]=]
L["Number of Most progress characters"] = true
L["Number of Most progress characters Desc"] = [=[The number of characters that will be displayed that have progress towards the achievement.

Setting it to 0 will disable this feature.]=]
L["Number of Not Earned By characters"] = "Number of {notEarnedBy} characters"
L["Number of Not Earned By characters Desc"] = [=[The number of characters that will be displayed that not have earned the achievement.

Setting it to 0 will disable this feature.]=]
L["Number of search previews"] = true
L["Number of search previews Desc"] = "The numbers of achievements shown as a preview of the full list of found achievements."
L["Number of summary achievements"] = true
L["Number of summary achievements Desc"] = "The number of achievements that will be shown in the summary view of each tab."
L["N'Zoth (Uldum)"] = true
L["N'Zoth (Vale of Eternal Blossoms)"] = true
L["N'Zoth Assaults"] = true
L["Objectives"] = true
L["Objectives progress"] = true
L["Obtainable"] = true
L["OC"] = true
L["Offsets"] = true
L["Ohn'ahran Plains"] = true
L["Ohn'ahran Plains: Next"] = true
L["Ohn'iri Springs"] = true
L["On Event Start"] = true
L["On Login"] = true
L["On Reload"] = true
L["only obtainable by one player"] = true
L["Only search filtered achievements"] = true
L["Only search filtered achievements Desc"] = "Only search achievements that are visible with the set filters."
L["Only when time data is available"] = true
L["Open"] = true
L["Order"] = true
L["Other"] = true
L["Other faction"] = true
L["Other locations"] = true
L["Other wings"] = true
L["Outland Cup"] = true
L["Overflow"] = true
L["Overwatch"] = true
L["Pandaren"] = true
L["Pandaria Cup"] = true
L["Part of a chain"] = true
L["Passage Pathway"] = true
L["Past Obtainable"] = true
L["Paste to Chat"] = true
L["Patch"] = true
L["Pilgrim's Bounty"] = true
L["Pirates' Day"] = true
L["Placeholder"] = true
L["Plugins"] = true
L["Plunderstorm"] = true
L["Points"] = true
L["Pop ups"] = true
L["Pre-Patch Event"] = true
L["Presets"] = true
L["Primal Storms"] = true
L["Primalist Tomorrow"] = true
L["Print map info"] = true
L["Print map info Desc"] = "Print the map id to chat"
L["Print map info w/o reload"] = true
L["Print map info w/o reload Desc"] = "Print it directly without having to reload"
L["PvP"] = "Player vs. Player"
L["PvP Season"] = true
L["Quick Search"] = true
L["Quick Search Desc"] = [=[Searches for achievements in the tabs added by {addonName}. This does not search the default tabs.

Features:
|T:1:8|t- Search by achievement title and description, alphabetically sorted by title.
|T:1:8|t- Search by achievement ID by starting the search query with '#', ordered by ascending ID.

Options (1):
|T:1:8|t- {clearOnRightClick} ({clearOnRightClickEnabled})
|T:1:8|t- {excludeExcludedAchievements} ({excludeExcludedAchievementsEnabled} excluded achievements {excludeExcludedAchievementsFrom} the search results)
|T:1:8|t- {searchFilteredAchievements} ({searchFilteredAchievementsEnabled})
|T:1:8|t- {minCharToSearch} ({minCharToSearchNumber})
|T:1:8|t- {numSearchPreviews} ({numSearchPreviewsNumber})

(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName}]=]
L["Radiant Echoes"] = true
L["Rage of the Firelands"] = true
L["Rated"] = true
L["Ravine River Run"] = true
L["Realm"] = true
L["Realm First!"] = true
L["Rebind Micro Button"] = true
L["Rebind Micro Button Desc"] = "Rebind the Achievements micro button to open a different tab than the default one."
L["Recruit-a-Friend"] = true
L["Red"] = true
L["Refresh Events"] = true
L["Refresh interval"] = true
L["Refresh interval Desc"] = "The time in seconds between refreshing the event data. A longer time may delay creation of new pop ups and clean-up of old ones."
L["Related Tab"] = true
L["Related Tab Desc"] = "Adds an extra bit to the {wowheadLink} so another tab different than the default one will be selected."
L["Remember frame position"] = "Remember {frame} position"
L["Remember frame position Desc"] = "Remember the {frame} position. This will keep the {frame} in it's last known position the next time you log in."
L["Remove from Watch List"] = "Remove from {watchList}"
L["Required for"] = true
L["Requires"] = true
L["Researchers Under Fire"] = true
L["Reset Faction Filters"] = true
L["Reset Faction Filters Desc"] = [=[Reset / keep the Faction Filters.

This means that when you're i.e. logging in on an {alliance} character and any of the {neutral}, {alliance} or {horde} Faction Filters are checked / unchecked, only the {neutral} and {alliance} Faction Filters will be checked and the {horde} Faction Filter will be unckecked.

This is preferred when switching a lot between {alliance} and {horde}.]=]
L["Reset filters"] = true
L["Reset position"] = true
L["Reset position Desc"] = "Reset the {frame} to it's default position."
L["Reset view"] = true
L["Reset view on open"] = true
L["Reset view on open Desc"] = "Collapse all categories and select the summary."
L["Return to the Forbidden Reach"] = true
L["Reverse Sort"] = true
L["Right"] = true
L["Right Alt"] = true
L["Right click"] = true
L["Right Click Menu"] = true
L["Right Click Menu Desc"] = [=[Each achievement in the new tabs have a {rightClickMenu}.

Features:
|T:1:8|t- Link to {wowhead}.
|T:1:8|t- {goTo} shortcut to achievements that are {partOfAChain}, that are {require} this achievment to be completed or are also found under other categories. Achievements in the {currentZone} category have a shortcut to their proper location in the categories tree.
|T:1:8|t- Link to {xuFuPetGuides} if the achievement is related to {petBattles} and {xuFuPetGuides} has relevant information about it.
|T:1:8|t- Link to transmog sets if the achievement's objective is to collect one.
{pluginText}
|T:1:8|t- {more}: Groups misc. items to not clutter the main menu.
|T:1:8|t|T:1:8|t- {addToWatch}: Add the achievement to the {watchList} category. (Only available on not watched achievements).
|T:1:8|t|T:1:8|t- {removeFromWatch}: Remove the achievement from the {watchList} category. (Only available on watched achievements).
|T:1:8|t|T:1:8|t- {include}: Includes the achievement back into the normal view. (Only available on excluded achievements).
|T:1:8|t|T:1:8|t- {exclude}: Excludes the achievement from the normal view. (Only available on included achievements).

Options:
|T:1:8|t- A button can be shown on each achievement that opens the {rightClickMenu}. ({enabled}) (1)

(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {rightClickMenu}]=]
L["Right Ctrl"] = true
L["Right Shift"] = true
L["Rise of Azshara"] = true
L["Rise of the Zandalari"] = true
L["River Rapids Route"] = true
L["Ruby Lifeshrine Loop"] = true
L["Rydyr"] = true
L["Sandstorms"] = true
L["Scalecracker Keep"] = true
L["Screenshot Mode"] = true
L["Screenshot Mode Desc"] = [=[Adds a black frame above everything. Only newly opened windows are visible. This is used for taking screenshots.

A reload is required to remove the black frame!]=]
L["Screenshots"] = true
L["Search"] = true
L["Search Criteria"] = true
L["Search Descriptions"] = true
L["Search field"] = true
L["Search Ids"] = true
L["Search Names"] = true
L["Search options"] = true
L["Search preview"] = true
L["Search Results"] = true
L["Search Rewards"] = true
L["Searing Gorge"] = true
L["Season"] = true
L["Second column threshold"] = true
L["Second column threshold Desc"] = "Achievements with more objectives than this number will be visible in two columns instead of one."
L["Secrets of Azeroth"] = true
L["Secrets of Azeroth (EU)"] = true
L["Secrets of Azeroth (KR)"] = true
L["Secrets of Azeroth (US)"] = true
L["Secrets of Ulduar"] = true
L["Seeds of Renewal"] = true
L["Select achievements to see your browsing history"] = true
L["Select All"] = true
L["Selected Zone"] = true
L["Set Keybind"] = true
L["Set Keybind Desc"] = "Set the keybind for the selected tab to 'Y'. This will unbind all other actions bound to 'Y'. Different key binding can be set in the regular {keyBindings}."
L["Shadowlands (pre-patch)"] = true
L["Shadows of Argus"] = true
L["Shift"] = true
L["Shipyard"] = true
L["Show"] = true
L["Show Added in version"] = "Show {addedInVersion}"
L["Show Added in version Desc"] = [=[Show / hide {addedInVersion}.

When checked, the version of the game the achievement was added in will be visible in the tooltip.]=]
L["Show alertSystem on event start Desc"] = "Show / hide event {alertSystem} for an event when it starts."
L["Show alertSystem on event start in instances Desc"] = "Show / hide event {alertSystem} for an event when it starts while inside an instance."
L["Show alertSystem on event start only when time data is available Desc"] = "Show / hide event {alertSystem} for an event when it starts only when the remaining event time is available."
L["Show alertSystem on login Desc"] = "Show / hide event {alertSystem} when joining the game."
L["Show alertSystem on login in instances Desc"] = "Show / hide event {alertSystem} when joining the game while inside an instance."
L["Show alertSystem on login only when time data is available Desc"] = "Show / hide event {alertSystem} when joining the game only when the remaining event time is available."
L["Show alertSystem on reload Desc"] = "Show / hide event {alertSystem} when reloading the game."
L["Show alertSystem on reload in instances Desc"] = "Show / hide event {alertSystem} when reloading the game while inside an instance."
L["Show alertSystem on reload only when time data is available Desc"] = "Show / hide event {alertSystem} when reloading the game only when the remaining event time is available."
L["Show All Results in Category"] = true
L["Show All Results in Category Desc"] = "Show all the search results in a category that will persist during this session."
L["Show Criteria"] = true
L["Show Criteria Desc"] = "Show Achievement Criteria on units that are required for an achievement (e.g., /love {criteria} for {achievement})."
L["Show Criteria If"] = true
L["Show current character icons"] = true
L["Show current character icons Desc"] = [=[Show / hide current character icons.

When checked, a second icon will appear in front of {partOfAChain} and {requiredFor} achievements that indicates the current character's progress.]=]
L["Show Date Completed Time"] = true
L["Show Date Completed Time Desc"] = [=[Show the time (hours, minutes and seconds) the achievement was completed on.

Disclamer: Blizzard does not track this information so only newly earned achievements will have this data. Losing your Saved Variables files and/or folder, or the WTF folder will reset this information to the default time of noon 12:00:00.]=]
L["Show Excluded Category"] = true
L["Show Excluded Category Desc"] = [=[Show / hide {excluded} category.

When checked, the category is only shown when there are actually excluded achievements and the set filters allow showing them.

When not checked, the category is always hidden and the filters are hidden too.]=]
L["Show Faction Faction Icon"] = "Show {faction} Faction Icon"
L["Show Faction Faction Icon Desc"] = "Show the {faction} faction icon on the achievement if only {faction} players can earn it."
L["Show faction icon"] = true
L["Show faction icon Desc"] = "Show a faction icon in front of the character's name."
L["Show minimap icon"] = true
L["Show minimap icon Desc"] = "Show / hide the minimap icon."
L["Show Not Obtainable"] = "Show {notObtainable}"
L["Show Not Obtainable Desc"] = "Show / hide {notObtainable} achievements in red on the progress bar."
L["Show Objectives progress"] = "Show {objectivesProgress}"
L["Show Objectives progress Desc"] = [=[Show / hide {objectivesProgress}.

When checked, the {objectivesProgress} of the achievement will be visible in the tooltip.]=]
L["Show Other faction"] = true
L["Show Other faction Desc"] = [=[Show / hide {otherFaction}.

When checked and if available, the other faction's achievement will be visible in the tooltip. This might make it more clear why your fresh Horde character has certain achievements if you only played Alliance before.]=]
L["Show Part of a chain"] = "Show {partOfAChain}"
L["Show Part of a chain Desc"] = [=[Show / hide {partOfAChain}.

When checked, the chain the achievment is part of will be visible in the tooltip.]=]
L["Show placeholders"] = true
L["Show placeholders Desc"] = "Show a set of placeholder events so there is visual feedback of what the above settings do. They can be closed again by moving the mouse over them or right clicking them."
L["Show placeholders filter"] = true
L["Show placeholders filter Desc"] = [=[Show / hide the placeholder filter in the filters. This is used to show achievements not yet in game.

May contain spoilers if enabled!]=]
L["Show pop ups on login delay Desc"] = "Delay the initial event pop ups when loging in."
L["Show Required for"] = "Show {requiredFor}"
L["Show Required for Desc"] = [=[Show / hide {requiredFor}.

When checked, the achievement that requires the selected achievement to be completed will be visible in the tooltip.]=]
L["Show Rewards"] = true
L["Show Rewards Desc"] = [=[Show / hide {rewards},

When checked and if available, the {rewards} this achievement gives will be visible in the tooltip.]=]
L["Show Right Click Menu"] = "Show {rightClickMenu} button"
L["Show Right Click Menu Desc"] = [=[Show / hide {rightClickMenu} button on each achievement.

This serves as an alternative for right clicking the achievement.]=]
L["Show Start Time & End Time"] = "Show {startTime} & {endTime}"
L["Show Start Time & End Time Desc"] = [=[Show / hide {startTime} & {endTime}.

When checked and the achievement is {temporarilyObtainable}, the start and end time of the period when the achievement is obtainable will be visible in the tooltip.

This only applies to achievements that are {temporarilyObtainable} due to calendar events.]=]
L["Show Sub Categories"] = true
L["Show Sub Categories Desc"] = [=[Show / hide sub categories.

When checked, the achievements will be placed under their original sub categories instead of all together under the single {category} category.]=]
L["Show Temporarily obtainable"] = "Show {temporarilyObtainable}"
L["Show Temporarily obtainable Desc"] = [=[Show / hide {temporarilyObtainable}.

When checked and the achievement is {temporarilyObtainable}, this information will be visible in the tooltip.]=]
L["Show Temporarily obtainable Icon"] = "Show {tempObt} Icon"
L["Show Temporarily obtainable Icon Desc"] = "Show / hide an extra icon on the achievement when it's only {tempObt}."
L["Show world map icon"] = true
L["Show world map icon Desc"] = "Show / hide the world map icon."
L["Side Button Anchor"] = true
L["Side Button Anchor Desc"] = "The window the Side Buttons will attach to on the right side."
L["Side Window"] = true
L["Siege of Orgrimmar"] = true
L["Siege on Dragonbane Keep"] = true
L["Siege on Dragonbane Keep: Active"] = true
L["Siege on Dragonbane Keep: Gathering"] = true
L["Skitterer Xi'a"] = true
L["Skoldus Hall"] = true
L["Skyriding Races"] = true
L["Slagmire"] = true
L["Snowstorms"] = true
L["Soon"] = true
L["Sort priority"] = true
L["Soulforges"] = true
L["Sources"] = true
L["Southshore vs. Tarren Mill"] = true
L["Spacing"] = true
L["Spacing Desc"] = "The distance that will be added to or subtracted from the default distance between tabs."
L["Special Categories"] = true
L["Special thanks"] = true
L["Specials"] = true
L["Spreading the Light"] = true
L["Stables"] = true
L["StarCraft II"] = true
L["Start Time"] = true
L["Stormheim"] = true
L["Stormsong Valley"] = true
L["Strand of the Ancients"] = true
L["Style"] = true
L["Summary Desc"] = [=[{achievementsHeader}:
|T:1:8|t-Shows the last {numAchievements} earned account wide and character achievements (1).

{categoriesHeader}:
|T:1:8|t- Shows the progress for each category in the tab. This is the same progress you would see when mousing over a category on the side.

(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {categories} {arrow} {summary}]=]
L["Sundapple Copse Circuit"] = true
L["Superbloom"] = true
L["Superbloom: Active"] = true
L["Superbloom: Next"] = true
L["Tab"] = true
L["tab"] = true
L["Tabs"] = true
L["Ta's Pet Collection"] = true
L["Temporarily obtainable"] = true
L["temporarily obtainable"] = true
L["Temporarily obtainable Header Colors"] = "{tempObt} Header Colors"
L["Temporarily obtainable Header Colors Desc"] = "When enabled, the default orange and blue header colors will be extended with green, yellow, and red colors, indicating respectively that the achievement is currently obtainable, will be obtainable in the future or is no longer obtainable."
L["Temporarily Obtainable Text"] = "{isWillBeWas}{neverOnceTempObt}{startText}{startDetail}{endText}{endDetail}"
L["Thaldraszus"] = true
L["Thaldraszus: Next"] = true
L["The Azure Span"] = true
L["The Azure Span Slalom"] = true
L["The Azure Span Sprint"] = true
L["The Big Dig: Active"] = true
L["The Big Dig: Next"] = true
L["The Big Dig: Soon"] = true
L["The Entitled"] = true
L["the event name with run time"] = "the {eventName} from {startDate} until {endDate}"
L["The Flowing Forest Flight"] = true
L["The Iron Tide"] = true
L["The Shattering"] = true
L["The Thunder King"] = true
L["The Tomb of Sargeras"] = true
L["The Vakthros Ascent"] = true
L["The Waking Shore"] = true
L["The War Within (pre-patch)"] = true
L["Theater Troupe"] = true
L["This achievement"] = true
L["This achievement can't be earned by this character."] = true
L["This achievement is no longer obtainable"] = "This achievement is no longer obtainable."
L["This category has no achievements"] = true
L["This character's class has no transmog set that meet the requirements."] = true
L["Thundering Pandaren Spirit"] = true
L["Thunderstorms"] = true
L["Tides of Vengeance"] = true
L["Time display"] = true
L["Time Left"] = true
L["Time Rift"] = true
L["Time Rift: Active"] = true
L["Time Rift: Next"] = true
L["Time Rift: Starting Soon"] = true
L["Time Rifts"] = true
L["Tiragarde Sound"] = true
L["Titan Lockdown"] = true
L["Titan Lockdown: Active"] = true
L["Titan Lockdown: Next"] = true
L["Titan Lockdown: Soon"] = true
L["Titan Lockdown: Starting Soon"] = true
L["Ti'un the Wanderer"] = true
L["Toggle"] = true
L["Toggle Tracking"] = true
L["Toggle window once opened"] = true
L["Toggle window once opened Desc"] = "When the achievement window is opened the first time, open the window to the correct tab and select the summary. From the second time onwards, regardless of the keybind used, open the last view."
L["Tooltip"] = true
L["Torghast"] = true
L["Track achievement browsing history"] = true
L["Track achievement browsing history Desc"] = [=[When enabled, show a back and forward button in the achievement window header.

This allows for the navigation of your browsing history of selected achievements just like your internet browser does for visited websites.]=]
L["Tracking"] = true
L["Tracking Achievements"] = true
L["Trading Post"] = true
L["Transmog Sets"] = true
L["Truncate"] = true
L["Turbulent Timeways"] = true
L["Tutorial"] = true
L["Tutorial Desc"] = "Open the tutorials from the start."
L["Tyrhold"] = true
L["Uktulut Coaster"] = true
L["Uncategorized"] = true
L["Unchecked"] = true
L["until the end of"] = true
L["Up"] = true
L["up until the start of"] = true
L["Upper Reaches"] = true
L["Val'sharah"] = true
L["Vendor"] = true
L["Venthyr Assault"] = true
L["Vertical position"] = true
L["View Tutorial"] = true
L["Visions of N'Zoth"] = true
L["Vol'dun"] = true
L["Wago"] = true
L["Wago Desc"] = "Open a popup dialog with a link to the {addonName} {wago} page."
L["Waking Shores"] = true
L["Waking Shores: Next"] = true
L["Warcraft III: Reforged"] = true
L["Warcraft Rumble"] = true
L["was"] = true
L["Watch List"] = true
L["When achievement completed"] = true
L["When achievement completed Desc"] = [=[Show / hide {objectivesProgress} when achievement is completed.

When checked, the {objectivesProgress} of the achievements will be visible in the tooltip regardless if the achievement is completed or not.]=]
L["Whispering Pandaren Spirit"] = true
L["Widget Events"] = true
L["Wild Preserve Circuit"] = true
L["Wild Preserve Slalom"] = true
L["will be"] = true
L["Window"] = true
L["Wingrest Roundabout"] = true
L["World Events"] = true
L["World Map"] = true
L["World Map Button"] = true
L["World Map Button Desc"] = [=[Hover:
|T:1:8|t- Shows how many achievements are (not) obtainable and (not) completed like the {enhancedTooltipCategories} based on the filters set for the {selectedZone}.
|T:1:8|t- See {enhancedTooltipCategories} and {enhancedFilteringAndSorting} for more information.

Click:
|T:1:8|t- Opens the achievements window to the {selectedZone} category.]=]
L["Worldsoul Memory"] = true
L["WoW Remix: Mists of Pandaria"] = true
L["Wowhead"] = true
L["Wowhead Link"] = true
L["WoWInterface"] = true
L["WoWInterface Desc"] = "Open a popup dialog with a link to the {addonName} {woWInterface} page."
L["WoW's 10th Anniversary"] = true
L["WoW's 18th Anniversary"] = true
L["WoW's 19th Anniversary"] = true
L["WoW's 20th Anniversary"] = true
L["WoW's 21st Anniversary"] = true
L["WoW's Anniversary"] = true
L["X offset Desc"] = "The horizontal offset from the start position."
L["Xu-Fu's Pet Guides"] = true
L["XYZ offset"] = "{xyz} offset"
L["Y offset Desc"] = "The vertical offset from the start position."
L["Zaqali Ruin Investigation"] = true
L["Zaqali Ruin Investigation: Active"] = true
L["Zaqali Ruin Investigation: Next"] = true
L["Zaqali Ruin Investigation: Soon"] = true
L["Zaqali Ruin Investigation: Starting Soon"] = true
L["Zones"] = true
L["Zuldazar"] = true