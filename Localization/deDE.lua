-- German Translation by Ta, 31.05.2022 
-- Filters, Categories, Menus, Tooltips
-- Calendar Events
-- Widget Events
-- World Events

-- [[ Namespaces ]] --
local addonName, addon = ...;
local L = LibStub(addon.Libs.AceLocale):NewLocale(addonName, "deDE");
if not L then return end

local tab = "|T:1:8|t"; -- DO NOT TRANSLATE
L["TAB"] = tab; -- DO NOT TRANSLATE

-- Load strings into the localization that are already localized by Blizzard
addon.GlobalStrings.Load(L);
addon.Plugins:LoadLocalization(L);

-- Filters, Categories, Menus, Tooltips
L["Account"] = "Account";
L["Achievement points earned by"] = "Erfolgspunkte erzielt durch";
L["Achievements"] = "Erfolge";
L["Brawler's Guild"] = "Kampfgilde";
L["Buildings"] = "Gebäude";
L["Bur's Mount Collection"] = "Bur's Reittier Collection";
L["Character"] = "Charakter";
L["Class Hall"] = "Ordenshalle";
L["Clear focus"] = "Fokus Filter löschen.";
L["Collapse Chain"] = "Folgequest Einklappen";
L["Completion"] = "Komplettierung";
L["Covenant"] = "Pakt";
L["Covenant Assaults"] = "Paktangriffe";
L["Current Zone"] = "Aktuelle Zone";
L["Drops"] = "Beute";
L["Dueler's Guild"] = "Duellantengilde";
L["Earned By"] = "Erzielt durch";
L["Events"] = "Events";
L["Exclude"] = "Ausblenden";
L["Excluded"] = "Zu Filter Ausgeblendet hinzugefügt.";
L["Expansions"] = "Addons";
L["Faction Assaults"] = "Fraktionsübergriffe";
L["Focus"] = "Fokus";
L["Focused"] = "Zu Fokus Filter hinzugefügt.";
L["Gifts"] = "Geschenke"
L["Gladiator's Sanctum"] = "Heiligtum des Gladiators";
L["Glory"] = "Standard";
L["Go to"] = "Gehe zu";
L["Holidays"] = "Feiertage";
L["ID"] = "ID";
L["Include"] = "Hinzufügen";
L["Installed"] = "Installiert";
L["Invasions"] = "Invasionen";
L["Legion Assaults"] = "Angriffe der Legion";
L["Merge Small Categories"] = "Kleine Kategorien zusammenführen";
L["More"] = "Mehr...";
L["N'Zoth Assaults"] = "Angriffe von N'Zoth";
L["Necrolords Assault"] = "Necrolord Paktangriff";
L["No achievements are available with the current set of filters"] = "Es können keine Erfolge mit den von dir gesetzten Filtern angezeigt werden.";
L["Not installed"] = "Nicht Installiert";
L["Not Obtainable"] = "Nicht Verfügbar";
L["Objectives progress"] = "Erfolgs-Fortschritt";
L["Obtainable"] = "Verfügbar";
L["Other"] = "Andere";
L["Other locations"] = "Weitere...";
L["Other wings"] = "Weitere Flügel";
L["Part of a chain"] = "Teil einer Folgequest";
L["Pirates' Day"] = "Piratentag";
L["Player vs. Player"] = "Spieler gegen Spieler";
L["PvP"] = "PvP";
L["Profession"] = "Berufe";
L["Rated"] = "Gewertet";
L["Recruit-a-Friend"] = "Werbt einen Freund";
L["Required for"] = "Wird benötigt für...";
L["Reverse Sort"] = "Umgekehrte Sortierung";
L["Select all"] = "Alle auswählen";
L["Selected Zone"] = "Ausgewählte Zone";
L["Shipyard"] = "Werft";
L["Southshore vs. Tarren Mill"] = "Süderstade vs. Tarrens Mühle";
L["Special Categories"] = "Spezial Kategorie";
L["Specials"] = "Spezial";
L["Stables"] = "Ställe";
L["Strand of the Ancients"] = "Strand der Uralten";
L["Tabs"] = "Tabs";
L["The Entitled"] = "Der/die Titulierte";
L["This achievement is no longer obtainable"] = "Dieser Erfolg kann nicht länger erzielt werden.";
L["Torghast"] = "Torghast";
L["Vendor"] = "Verkäufer";
L["Wowhead"] = "Wowhead";
L["Xu-Fu's Pet Guides"] = "Xu-Fu's Pet Guides";
L["Zones"] = "Zones";
L["Not earned by: "] = "Nicht erzielt durch: ";
L["Collecting data"] = "Collecting data";
L["Transmog Sets"] = "Transmog-Sets";
L["Other faction"] = "Andere Fraktion";
L["Not part of set"] = "Nicht Teil des Transmog-Sets";
L["This achievement can't be earned by this character."] = "Der Erfolg kann nicht von diesem Charakter erzielt werden.";
L["This character's class has no transmog set that meet the requirements."] = "Die Klasse deines Charakters erfüllt nicht die Anforderungen für dieses Transmog-Set.";
L["Realm First!"] = "Realm First!";
L["Leveling"] = "Level";
L["Level 80"] = "Level 80";
L["Level 85"] = "Level 85";
L["Level 90"] = "Level 90";
L["450 skill"] = "Fertigkeit 450";
L["525 skill"] = "Fertigkeit 525";
L["600 skill"] = "Fertigkeit 600";
L["BlizzCon"] = "BlizzCon";
L["Collector's Edition"] = "Collector's Edition";
L["Diablo III"] = "Diablo III";
L["Overwatch"] = "Overwatch";
L["StarCraft II"] = "StarCraft II";
L["Hearthstone"] = "Hearthstone";
L["Heroes of the Storm"] = "Heroes of the Storm";
L["Warcraft III: Reforged"] = "Warcraft III: Reforged";
L["Plugins"] = "Plugins";
L["Blizzard"] = "Blizzard";
L["View Tutorial"] = "Tutorial anzeigen";
L["WoW's Anniversary"] = "WoW's Geburtstag";
L["WoW's 18th Anniversary"] = "WoW's 18. Geburtstag";
L["Season"] = "Saison";

-- Calendar Events
L["Feast of Winter Veil"] = "Winterhauch";
L["Noblegarden"] = "Nobelgarten";
L["Children's Week"] = "Kinderwoche";
L["Hallow's End"] = "Schlotternächte";
L["Lunar Festival"] = "Mondfest";
L["Midsummer Fire Festival"] = "Sonnenwende";
L["Brewfest"] = "Braufest";
L["Pirates' Day"] = "Piratentag";
L["Pilgrim's Bounty"] = "Die Pilgerfreuden";
L["Day of the Dead"] = "Tag der Toten";
L["Love is in the Air"] = "Liebe liegt in der Luft";
L["Darkmoon Faire"] = "Dunkelmond-Jahrmarkt";

-- Widget Events
L["Soulforges"] = "Die Seelenschmieden";
L["Fracture Chambers"] = "Frakturkammern";
L["Skoldus Hall"] = "Skoldushalle";
L["Coldheart Interstitia"] = "Kaltherzinterstitia";
L["Mort'regar"] = "Mort'regar";
L["Upper Reaches"] = "Die Oberen Ebenen";

-- World Events
L["Assault on Azsuna"] = "Schlacht um Azsuna";
L["Assault on Highmountain"] = "Schlacht um den Hochberg";
L["Assault on Stormheim"] = "Schlacht um Sturmheim";
L["Assault on Val'sharah"] = "Schlacht um Val'sharah";
L["Assault on Tiragarde Sound"] = "Angriff Tiragardesund";
L["Assault on Drustvar"] = "Angriff Drustvar";
L["Assault on Stormsong Valley"] = "Angriff Sturmsangtal";
L["Assault on Nazmir"] = "Angriff Nazmir";
L["Assault on Vol'dun"] = "Angriff Vol'dun";
L["Assault on Zuldazar"] = "Angriff Zuldazar";
L["Assault: N'Zoth (Uldum)"] = "Angriffe von N'Zoth (Uldum)";
L["Assault: Amathet"] = "Angriff: Vorstoß der Amathet (Amathet)";
L["Assault: Aqir"] = "Angriff: Ausgegrabene Aqir (Aqir)";
L["Assault: N'Zoth (Vale of Eternal Blossoms)"] = "Angriffe von N'Zoth (Das Tal der ewigen Blüten)";
L["Assault: Mogu"] = "Angriff: Die verfeindeten Klans (Mogu)";
L["Assault: Mantid"] = "Angriff: Der unendliche Schwarm (Mantid)";
L["Necrolord Assault"] = "Necrolord Paktangriff";
L["Venthyr Assault"] = "Venthyr Paktangriff";
L["Kyrian Assault"] = "Kyrian Paktangriff";
L["Night Fae Assault"] = "Night Fae Paktangriff";

-- Options
L["Requires a reload"] = "Requires a reload to take full effect.";

-- Plugins
L["Loaded"] = "Loaded";
L["Loaded Desc"] = "Indicates if the addon related to the plugin is loaded or not.";
L["Enable"] = "Enable";
L["Enable Desc"] = "Enable / Disable the plugin. Having the plugin disabled if the addon is active, unpredictable things might happen.";
L["Not loaded"] = "Not loaded";

-- Options General Info
L["Build"] = "Build";
L["Author"] = "Author";
L["Tutorial"] = "Tutorial";
L["Tutorial Desc"] = "Open the tutorials from the start.";
L["Discord"] = "Discord";
L["Discord Desc"] = "Open a popup dialog with a link to the {serverName} Discord server. Here you can post comments, reports, remarks, ideas or anything else related.";
L["CurseForge"] = "CurseForge";
L["CurseForge Desc"] = "Open a popup dialog with a link to the {addonName} {curseForge} page.";
L["Wago"] = "Wago";
L["Wago Desc"] = "Open a popup dialog with a link to the {addonName} {wago} page.";
L["WoWInterface"] = "WoWInterface";
L["WoWInterface Desc"] = "Open a popup dialog with a link to the {addonName} {woWInterface} page.";

-- Options General Icon
L["Show minimap icon"] = "Show minimap icon";
L["Show minimap icon Desc"] = "Show / hide the minimap icon.";

-- Options General Key Binding
L["Reset view on open"] = "Reset view on open";
L["Reset view on open Desc"] = "Collapse all categories and select the first category\nor\nKeep the last selected category when last closed.";

-- Options General Search
L["Search"] = "Search";
L["Clear search field on Right Click"] = "Clear search field on Right Click";
L["Clear search field on Right Click Desc"] = "Enable / disable clearing the search field when Right Clicking in it.";
L["Exclude Excluded achievements"] = "Exclude Excluded achievements";
L["Exclude Excluded achievements Desc"] = "Exclude / include Excluded achievements from / in the search results.";
L["Only search filtered achievements"] = "Only search filtered achievements";
L["Only search filtered achievements Desc"] = "Only search achievements that are visible with the set filters.";
L["Minimum characters to search"] = "Minimum characters to search";
L["Minimum characters to search Desc"] = "The number of characters needed in order to start searching for achievements matching the query.\n" ..
                                            "The smaller the number, the greater the impact (1) on the game.\n\n" ..
                                            "(1) FPS drops and stuttering while searching";
L["Number of search previews"] = "Number of search previews";
L["Number of search previews Desc"] = "The numbers of achievements shown as a preview of the full list of found achievements.\n\n{reloadRequired}";

-- Options General Filters
L["Filters"] = "Filters";
L["Reset Faction Filters"] = "Reset Faction Filters";
L["Reset Faction Filters Desc"] = "Reset / keep the Faction Filters.\n\n" ..
                                    "This means that when you're i.e. logging in on an {alliance} character and any of the {neutral}, {alliance} or {horde} " ..
                                    "Faction Filters are checked / unchecked, only the {neutral} and {alliance} Faction Filters will be checked and the {horde} " ..
                                    "Faction Filter will be unckecked.\n\n" ..
                                    "This is preferred when switching a lot between {alliance} and {horde}.";

-- Options General Debug
L["Debug"] = "Debug";
L["Debug Desc"] = "Each of the options below are available for debugging and testing purposes. Use at your own risk!";
L["Enable debug info"] = "Enable debug info";
L["Enable debug info Desc"] = "Enable / disable debug info.";
L["Screenshot Mode"] = "Screenshot Mode";
L["Screenshot Mode Desc"] = "Adds a black frame above everything. Only newly opened windows are visible. This is used for taking screenshots.\n\nA reload is required to remove the black frame!";
L["Enable trace info"] = "Enable trace info";
L["Enable trace info Desc"] = "Enable / disable trace info.";
L["Show placeholders filter"] = "Show placeholders filter";
L["Show placeholders filter Desc"] = "Show / hide the placeholder filter in the filters. This is used to show achievements not yet in game.\n\nMay contain spoilers if enabled!";

-- Options Event Reminders
L["Event Reminders"] = "Event Reminders";

L["Time display"] = "Time display";
L["Line"] = "Line";
L["None"] = "None";
L["Start Time"] = "Start Time";
L["End Time"] = "End Time";
L["Time Left"] = "Time Left";

-- Options Event Reminders General
L["Pop ups"] = "Pop ups";
L["Show pop ups"] = "Show pop ups";
L["Show pop ups Desc"] = "Show / hide event pop ups when reloading or joining the game. This option has no effect on the event reminders next to the achievements window.";

L["Max number of alerts"] = "Max number of alerts";
L["Max number of alerts Desc"] = "The maximum number of alerts shown at once.";

L["Fade delay"] = "Fade delay";
L["Fade delay Desc"] = "The time in seconds it takes for the alert to fade when it's ignored. Right clicking will close it immidiatly.";

L["Style"] = "Style";
L["Compact"] = "Compact";
L["Compact Desc"] = "Use a more compact version with only a single line of time display.\n\n{reloadRequired}";

-- Options Event Reminders Events
L["Calendar Events"] = "Calendar Events";
L["Widget Events"] = "Widget Events";
L["World Events"] = "World Events";

-- Options Event Reminders Date and Time format
L["Date and Time format"] = "Date and Time format";
L["Presets"] = "Presets";
L["Custom"] = "Custom";

L["Date and Time formatting guide"] = "Date and Time Formatting Guide";
L["Date and Time formatting guide Desc"] =  "{a} - Abbreviated weekday name (eg. Wed)\n" ..
                                            "{A} - Full weekday name (eg. Wednesday)\n" ..
                                            "{b} - Abbreviated month name (eg. Sep)\n" ..
                                            "{B} - Full month name (eg. September)\n" ..
                                            "{c} - Date and time representation appropriate for locale (eg. 23/04/07 10:20:41)\n" ..
                                            "{C} - The century number (year/100) (eg. 20)\n" ..
                                            "{d} - Day of month as decimal number (01 - 31)\n" ..
                                            "{D} - Equivalent to %m/%d/%y (eg. 04/23/07)\n" ..
                                            "{e} - Day of month as decimal number (1 - 31)\n" ..
                                            "{H} - Hour in 24-hour format (00 - 23)\n" ..
                                            "{I} - Hour in 12-hour format (01 - 12)\n" ..
                                            "{j} - Day of year as decimal number (001 - 366)\n" ..
                                            "{k} - Hour in 24-hour format (0 - 23)\n" ..
                                            "{l} - Hour in 12-hour format (1 - 12)\n" ..
                                            "{m} - Month as decimal number (01 - 12)\n" ..
                                            "{M} - Minute as decimal number (00 - 59)\n" ..
                                            "{p} - Current locale's A.M./P.M. indicator for 12-hour clock (eg. AM/PM)\n" ..
                                            "{P} - Current locale's A.M./P.M. indicator for 12-hour clock (eg. am/pm)\n" ..
                                            "{R} - Equivalent to %H:%M (eg. 10:20)\n" ..
                                            "{s} - Number of second since Epoch, i.e., since 1970-01-01 00:00:00 UTC (1177323641)\n" ..
                                            "{S} - Second as decimal number (00 - 59)\n" ..
                                            "{u} - Weekday as decimal number (1 - 7; Monday is 1)\n" ..
                                            "{U} - Week of year as decimal number, with Sunday as first day of week 1 (00 - 53)\n" ..
                                            "{w} - Weekday as decimal number (0 - 6; Sunday is 0)\n" ..
                                            "{W} - Week of year as decimal number, with Monday as first day of week 1 (00 - 53)\n" ..
                                            "{x} - Date representation for current locale (Standard date string)\n" ..
                                            "{X} - Time representation for current locale (Standard time string)\n" ..
                                            "{y} - Year without century, as decimal number (00 - 99)  (eg. 07)\n" ..
                                            "{Y} - Year with century, as decimal number (eg. 2007)\n" ..
                                            "{z} - Time-zone as hour offset from GMT (eg. +0200)\n" ..
                                            "{Z} - Time-zone name or abbreviation; no characters if time zone is unknown";

-- Options Layout
L["Layout"] = "Layout";

-- Options Layout Window
L["Window"] = "Window";
L["Make window movable"] = "Make window movable";
L["Make window movable Desc"] = "Make window movable/not movable.\n\n" ..
                                "When checked, keeping the left mouse button pressed moves the Achievement window. This works on the header and borders.\n\n{reloadRequired}";
L["Categories width offset"] = "Categories width offset";
L["Categories width offset Desc"] = "The width that will be added to or subtracted from the default categories width.\n\n" ..
                                    "This value can be changed while the achievement window is open and having one of the tabs selected added by {addonName}. This might have an impact (1) on the game.\n\n" ..
                                    "(1) FPS drops and stuttering while adjusting the value, NOT during normal addon use";
L["Achievement window height offset"] = "Achievement window height offset";
L["Achievement window height offset Desc"] = "The height that will be added to or subtracted from the default achievement window height.\n\n" ..
                                                "This value can be changed while the achievement window is open and having one of the tabs selected added by {addonName}. This might have an impact (1) on the game.\n\n" ..
                                                "(1) FPS drops and stuttering while adjusting the value, NOT during normal addon use\n\n{reloadRequired}";
L["Merge small categories threshold"] = "Merge small categories threshold";
L["Merge small categories threshold Desc"] = "Categories with a number of achievements lower than this number will merge into the parent category.\n\n" ..
                                                "Only preset categories can merge (mostly child categories from zones). This might have an impact (1) on the game.\n\n" ..
                                                "(1) FPS drops and stuttering while adjusting the value, NOT during normal addon use";

-- Options Layout Achievement points
L["Header"] = "Header";
L["Format"] = "Format";
L["Account wide (default)"] = "Account wide (default)";
L["Character / Account wide"] = "Character / Account wide";
L["Character only"] = "Character only";
L["Tooltip"] = "Tooltip";
L["Always show realm"] = "Always show realm";
L["Always show realm Desc"] = "Always show the character's realm regardless if the character is on the same realm as this character.";

-- Options Layout Categories
L["Show Sub Categories"] = "Show Sub Categories";
L["Show Sub Categories Desc"] = "Show / hide sub categories.\n\nWhen checked, the achievements will be placed under their original sub categories instead of all together under the single {category} category.";
L["Clear all"] = "Clear all";
L["Clear all Desc"] = "Clear all focused achievements.";
L["Show Excluded Category"] = "Show Excluded Category";
L["Show Excluded Category Desc"] = "Show / hide {excluded} category.\n\nWhen checked, the category is only shown when there are actually excluded achievements and the set filters allow showing them.\n\n" ..
                                    "When not checked, the category is always hidden and the filters are hidden too.";
L["Include all"] = "Include all";
L["Include all Desc"] = "Include all excluded achievements.";
L["Show Not Obtainable"] = "Show {notObtainable}";
L["Show Not Obtainable Desc"] = "Show / hide {notObtainable} achievements in red on the progress bar.";

-- Options Layout Achievements
L["Compact Achievements"] = "Compact Achievements";
L["Compact Achievements Desc"] = "Achievements are 2/3rd the size, similar to the summary achievements.\n\n{reloadRequired}";
L["Not Earned By"] = "Not Earned By";
L["Number of Earned By characters"] = "Number of {earnedBy} characters";
L["Number of Earned By characters Desc"] = "The number of characters that will be displayed that have earned the achievement.\n\nSetting it to 0 will disable this feature.";
L["Number of Not Earned By characters"] = "Number of {notEarnedBy} characters";
L["Number of Not Earned By characters Desc"] = "The number of characters that will be displayed that not have earned the achievement.\n\nSetting it to 0 will disable this feature.";
L["Show Part of a Chain"] = "Show {partOfAChain}";
L["Show Part of a Chain Desc"] = "Show / hide {partOfAChain}.\n\nWhen checked, the chain the achievment is part of will be visible in the tooltip.";
L["Show Required for"] = "Show {requiredFor}";
L["Show Required for Desc"] = "Show / hide {requiredFor}.\n\nWhen checked, the achievement that requires the selected achievement to be completed will be visible in the tooltip.";
L["Show current character icons"] = "Show current character icons";
L["Show current character icons Desc"] = "Show / hide current character icons.\n\nWhen checked, a second icon will appear in front of {partOfAChain} and {requiredFor} achievements that indicates the current character's progress.";
L["Other faction"] = "Other faction";
L["Show Other faction"] = "Show Other faction";
L["Show Other faction Desc"] = "Show / hide {otherFaction}.\n\nWhen checked and if available, the other faction's achievement will be visible in the tooltip. This might make it more clear why your fresh Horde character has certain achievements if you only played Alliance before.";
L["Show Objectives progress"] = "Show {objectivesProgress}";
L["Show Objectives progress Desc"] = "Show / hide {objectivesProgress}.\n\nWhen checked, the {objectivesProgress} of the achievements will be visible in the tooltip.";
L["When achievement completed"] = "When achievement completed";
L["When achievement completed Desc"] = "Show / hide {objectivesProgress} when achievement is completed.\n\nWhen checked, the {objectivesProgress} of the achievements will be visible in the tooltip regardless if the achievement is completed or not.";
L["Second column threshold"] = "Second column threshold";
L["Second column threshold Desc"] = "Achievements with more objectives than this number will be visible in two columns instead of one.";

-- Options Layout Right Click Menu
L["Right Click Menu"] = "Right Click Menu";
L["Show Right Click Menu"] = "Show {rightClickMenu} button";
L["Show Right Click Menu Desc"] = "Show / hide {rightClickMenu} button on each achievement.\n\nThis serves as an alternative for right clicking the achievement.\n\n{reloadRequired}";

-- Options Credits
L["Credits"] = "Credits";
L["Special thanks"] = "Special thanks";
L["Donations"] = "Donations";
L["Localizations"] = "Localizations";

-- Keybindings
L["Toggle "] = "Toggle ";
L[" tab"] = " tab";

-- Icon
L["Left click"] = "Left click";
L["Right click"] = "Right click";
L["Icon Left click"] = "to open the Achievement window.";
L["Icon Right click"] = "for Options.";

-- Tutorials
-- Features tutorial
L["New achievement window tabs"] = "New achievement window tabs";
L["New achievement window tabs Desc"] = "New tabs are added to the achievement window.\nThis offers a new way of displaying achievements " ..
                                        "in a familiar fashion without interfering with the default tabs.\n\n" ..
                                        "Tabs:\n" ..
                                        tab .. "- {achievements}: A copy from the default {achievements} tab but with all the new features added by {addonName_y}.\n" ..
                                        tab .. "- {expansions}: Achievements are grouped in categories per expansion with a more logic hierarchy. See the {expansionsTabTutorial} tutorial for more details.\n" ..
                                        tab .. "- {events}: Achievements are grouped in categories per event. This goes from holidays to world events like assaults.\n" ..
                                        tab .. "- {pvp}: Achievements are grouped in categories per battleground.\n" ..
                                        tab .. "- {specials}: These categories are collections of achievements that award mounts, titles, transmog and others that not realy fit anywhere else.\n\n" ..
                                        "Both default tabs and tabs added by {addonName_y} can be hidden from the options (1).\n" ..
                                        "{pluginText}\n" ..
                                        "(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {tabs}";

L["Expansions tab"] = "Expansions tab";
L["Expansions tab Desc"] = "Achievements are grouped in categories per expansion with a more logic hierarchy.\n\n" ..
                            "The hierarchy is as follow:\n" ..
                            tab .. "- {expansion}\n" ..
                            tab .. tab .. "- {zones}\n" ..
                            tab .. tab .. tab .. "- {quests}\n" ..
                            tab .. tab .. tab .. "- {exploration}\n" ..
                            tab .. tab .. tab .. "- {pvp}\n" ..
                            tab .. tab .. tab .. "- {reputation}\n" ..
                            tab .. tab .. "- {dungeons}\n" ..
                            tab .. tab .. "- {raids}\n" ..
                            tab .. tab .. "- {petBattles}\n" ..
                            tab .. tab .. "- {expansionFeatures}\n\n" ..
                            "Special categories:\n" ..
                            tab .. "- {currentZone}: Shows the achievements linked to the current zone you're in.\n" ..
                            tab .. "- {selectedZone}: Shows the achievements linked to the selected zone from the world map.\n" ..
                            tab .. "- {focusedCategory}: Shows the focused achievements. Achievements can be displayed with or without their subcategories (1).\n" ..
                            tab .. "- {excludedCategory}: Shows the excluded achievements. Achievements can be displayed with or without their subcategories (1). Can be permanently hidden from the options (1).\n\n" ..
                            "(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {categories}";

L["Enhanced filtering and sorting"] = "Enhanced filtering and sorting";
L["Enhanced filtering and sorting Desc"] = "Filtering and sorting of achievements is enhanced with following features.\n\n" ..
                                            "Categories:\n" ..
                                            tab .. "- {mergeSmallCategories}: Merge categories if allowed with less than {mergeSmallCategoriesNumber} achievements (1).\n\n" ..
                                            "Filtering (multiple filters can be selected at the same time):\n" ..
                                            tab .. "- {completed}: Show completed achievements.\n" ..
                                            tab .. "- {notCompleted}: Show not completed achievements.\n" ..
                                            tab .. "- {obtainable}: Show obtainable achievements.\n" ..
                                            tab .. "- {notObtainable}: Show not obtainable achievements.\n" ..
                                            tab .. "- {faction} ({resetFactionFilters} {resetFactionFiltersEnabled}) (2)\n" ..
                                            tab .. tab .. "- {neutral}: Show achievements that both {alliance_wc} and {horde_wc} can earn.\n" ..
                                            tab .. tab .. "- {alliance}: Show achievements only {alliance_wc} can earn.\n" ..
                                            tab .. tab .. "- {horde}: Show achievements only {horde_wc} can earn.\n" ..
                                            tab .. "- {covenant}\n" ..
                                            tab .. tab .. "- {neutral}: Show achievements that all covenants can earn.\n" ..
                                            tab .. tab .. "- {kyrian}: Show achievements only {kyrian_wc} can earn.\n" ..
                                            tab .. tab .. "- {venthyr}: Show achievements only {venthyr_wc} can earn.\n" ..
                                            tab .. tab .. "- {nightfae}: Show achievements only {nightfae_wc} can earn.\n" ..
                                            tab .. tab .. "- {necrolord}: Show achievements only {necrolord_wc} can earn.\n" ..
                                            tab .. "- {excluded}: Show excluded achievements.\n" ..
                                            tab .. "- {collapseChain}: Show only the last completed and first not completed achievement in a chain.\n\n" ..
                                            "Sorting:\n" ..
                                            tab .. "- {noSorting}: No sorting applied.\n" ..
                                            tab .. "- {sortByName}: Sort achievements based on their names.\n" ..
                                            tab .. "- {sortByCompletion}: Sort achievements based on if they are completed or not.\n" ..
                                            tab .. "- {sortByID}: Sort achievements based on their ID.\n" ..
                                            tab .. "- {reverseSort}: When this is selected, invert the order of the sorted achievements.\n\n" ..
                                            "{tabs}:\n" ..
                                            tab .. "- These have all the filtering and sorting features mentioned above but can be changed independent from the others.\n" ..
                                            tab .. "- Changing any of the above filters will overwrite the individial tab's filtering and sorting.\n\n" ..
                                            "{specialCategories}:\n" ..
                                            tab .. "- These have all the filtering and sorting features mentioned above but can be changed independent from the others.\n\n" ..
                                            "{earnedBy} (see {earnedByTutorial} for more details)\n" ..
                                            tab .. "- {account}: Achevements are saturated if earned on any character on your account.\n" ..
                                            tab .. "- {character}: Achievements are saturated if earned by your current character and partially saturated if earned on another character on your account but not the current one.\n\n" ..
                                            "Other:\n" ..
                                            tab .. "- {help}: Start the tutorial from the start and reset what you've viewed.\n" ..
                                            tab .. tab .. "- Shows the specific tutorial page without resetting what you've viewed.\n" ..
                                            tab .. "- {options}: Open the addon's options (2).\n\n" ..
                                            "More filters and sorting options can be requested on {discord} or {curseForge} (links in the options).\n\n" ..
                                            "(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {categories}\n" ..
                                            "(2) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName}";

L["Quick Search"] = "Quick Search";
L["Quick Search Desc"] = "Searches for achievements in the tabs added by {addonName}. This does not search the default tabs.\n\n" ..
                            "Features:\n" ..
                            tab .. "- Search by achievement title and description, alphabetically sorted by title.\n" ..
                            tab .. "- Search by achievement ID by starting the search query with '#', ordered by ascending ID.\n\n" ..
                            "Options (1):\n" ..
                            tab .. "- {clearOnRightClick} ({clearOnRightClickEnabled})\n" ..
                            tab .. "- {excludeExcludedAchievements} ({excludeExcludedAchievementsEnabled} excluded achievements {excludeExcludedAchievementsFrom} the search results)\n" ..
                            tab .. "- {searchFilteredAchievements} ({searchFilteredAchievementsEnabled})\n" ..
                            tab .. "- {minCharToSearch} ({minCharToSearchNumber})\n" ..
                            tab .. "- {numSearchPreviews} ({numSearchPreviewsNumber})\n\n" ..
                            "(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName}";
L["from"] = "from";
L["in"] = "in";

L["Full Search"] = "Full Search";
L["Full Search Desc"] = "By selecting \"{showAllResults}\" you're able to view all search results. See the {quickSearchTutorial} tutorial for more details.";

L["New Achievement Colors"] = "New Achievement Colors";
L["New Achievement Colors Desc"] = "- The default gold of an obtained achievement. The border is changed from red to gold.\n" ..
                                    "- The new red of an obtained not obtainable achievement with default red border.\n" ..
                                    "- The new red of a not obtained not obtainable achievement with default grey border.\n" ..
                                    "- The default blue of an obtained account-wide achievement with default blue border.";

L["Earned By Desc"] = "Header\n" ..
                        tab .. "- {achievementPointsEarnedBy}: Display {achievementPointsEarnedBy_wc} your current character and/or {achievementPointsEarnedBy_wc} your account ({achievementPointsEarnedByFormat}) (1).\n" ..
                        tab .. "- {tooltip}: Overview of which character has earned how many achievement points. Each character needs to be logged in at least once to be added to this list. " ..
                        "Will show the character's realm if it's different. Can be forced to always show from the options (1).\n\n" ..
                        "Filters\n" ..
                        tab .. "- {account}: Achievements are saturated if earned on any character on your account (default).\n" ..
                        tab .. "- {character}: Achievements are saturated if earned by your current character and partially saturated if earned on another character on your account but not by the current one.\n\n" ..
                        "Tooltip\n" ..
                        tab .. "- {earnedBy}: Shows {earnedByNumber} characters that have earned this achievement (2). Faction exclusive achievements with a linked counterpart are taken into account. " ..
                        "I.e. alliance characters might show up for horde achievements. Will show the character's realm if it's different. Can be forced to always show from the options (2).\n" ..
                        tab .. "- {notEarnedBy}: Shows {notEarnedByNumber} characters that have not yet earned this achievement (2). Faction exclusive achievements with a linked counterpart are taken into account. " ..
                        "I.e. alliance characters might show up for horde achievements.  Will show the character's realm if it's different. Can be forced to always show from the options (2).\n\n" ..
                        "(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {header}\n" ..
                        "(2) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}";

L["Compact Achievements T"] = "Compact Achievements";
L["Compact Achievements T Desc"] = "- Achievements are 2/3rd the size, similar to the summary achievements.\n" ..
                                    "- Shows either the first line of the description or the reward.\n\n" ..
                                    "Compact achievements can be enabled from the options {compactEnabled} (1).\n\n" ..
                                    "(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}";

L["Enhanced tooltip"] = "Enhanced tooltip"; -- Used for categories and achievements
L["Enhanced tooltip Categories Desc"] = "Each tooltip has additional information on how many achievements are (not) obtainable and (not) completed.\n\n" ..
                                        "The numbers in the progress bar are in the following format:\n" ..
                                        tab .. "OC (+NONC) / T\n" ..
                                        tab .. tab .. "- {oc}: The (not) obtainable completed achievements.\n" ..
                                        tab .. tab .. "- {nonc}: The not obtainable not completed achievements (1).\n" ..
                                        tab .. tab .. "- T: Total number of achievements.\n\n" ..
                                        "Colors:\n" ..
                                        tab .. "- {green}: The (not) obtainable completed achievements.\n" ..
                                        tab .. "- {red}: The not obtainable not completed achievements (1).\n" ..
                                        tab .. "- Empty: The obtainable not completed achievements.\n\n" ..
                                        "The {red} part of the progress bar and number in brackets can either be disbled in options ({showNotObtainable}) (1) or by unchecking the {notObtainable} filter.\n\n" ..
                                        "(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {categories}";
L["Enhanced tooltip Achievements Desc"] = "Each tooltip has additional information on how achievements relate to each other (if they do). Several new sections are added to it.\n\n" ..
                                            "Features:\n" ..
                                            tab .. "- {notObtainable}: Shows the text \"{noLongerObtainable}\" if the achievement is no longer obtainable.\n" ..
                                            tab .. "- {earnedBy}: See {earnedBy} for more information.\n" ..
                                            tab .. "- {partOfAChain}: Shows the list of achievements the hovered achievement is part of (1) ({partOfAChainEnabled}) (2).\n" ..
                                            tab .. "- {requiredFor}: Shows a list of achievements that require the hovered achievement to be completed in order to earn it (1) ({requiredForEnabled}) (2).\n" ..
                                            tab .. "- {otherFaction}: Shows the related achievement of the other faction ({otherFactionEnabled}) (2).\n" ..
                                            tab .. "- {objectivesProgress}: Shows the list of objectives with progress ({objectivesProgressEnabled}) (2).\n" ..
                                            tab .. tab .. "- Custom objectives: Some achievements have custom objectives like the transmog achievements showing your progress towards the related transmog sets.\n\n" ..
                                            "Icons:\n" ..
                                            tab .. "- {ready}: The achievement is completed.\n" ..
                                            tab .. "- {waiting}: The achievement is not completed.\n" ..
                                            tab .. "- {notready}: The achievement is not possible to obtain anymore.\n\n" ..
                                            "Colors:\n" ..
                                            tab .. "- {green}: The achievement/objective is completed.\n" ..
                                            tab .. "- {grey}: The achievement/objective is not completed.\n" ..
                                            tab .. "- {red}: The achievement is not possible to obtain anymore.\n" ..
                                            tab .. "- Lighter {lightGreen}, {lightGrey} or {lightRed}: The hovered achievement.\n\n" ..
                                            "More custom objectives can be requested on {discord} or {curseForge} (links in the options).\n\n" ..
                                            "(1) Optionally, two icons can be displayed per line. The first icon is the default one, the second one is for the current character ({currentCharacterIconEnabled}) (2).\n" ..
                                            "(2) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}";

L["World Map Button"] = "World Map Button";
L["World Map Button Desc"] = "Hover:\n" ..
                                tab .. "- Shows how many achievements are (not) obtainable and (not) completed like the {enhancedTooltipCategories} based on the filters set for the {selectedZone}.\n" ..
                                tab .. "- See {enhancedTooltipCategories} and {enhancedFilteringAndSorting} for more information.\n\n" ..
                                "Click:\n" ..
                                tab .. "- Opens the achievements window to the {selectedZone} category.";

-- L["Right Click Menu"] = "Right Click Menu"; -- See at Options Layout Right Click Menu
L["Right Click Menu Desc"] = "Each achievement in the new tabs have a {rightClickMenu}.\n\n" ..
                                "Features:\n" ..
                                tab .. "- Link to {wowhead}.\n" ..
                                tab .. "- {goTo} shortcut to achievements that are {partOfAChain}, that are {require} this achievment to be completed or are also found under other categories. " ..
                                "Achievements in the {currentZone} category have a shortcut to their proper location in the categories tree.\n" ..
                                tab .. "- Link to {xuFuPetGuides} if the achievement is related to {petBattles} and {xuFuPetGuides} has relevant information about it.\n" ..
                                tab .. "- Link to transmog sets if the achievement's objective is to collect one.\n" ..
                                "{pluginText}\n" ..
                                tab .. "- {more}: Groups misc. items to not clutter the main menu.\n" ..
                                tab .. tab .. "- {focus}: Add the achievement to the {focused} category. (Only available on not focused achievements).\n" ..
                                tab .. tab .. "- {clearFocus}: Remove the achievement to the {focused} category. (Only available on focused achievements).\n" ..
                                tab .. tab .. "- {include}: Includes the achievement back into the normal view. (Only available on excluded achievements).\n" ..
                                tab .. tab .. "- {exclude}: Excludes the achievement from the normal view. (Only available on included achievements).\n\n" ..
                                "Options:\n" ..
                                tab .. "- A button can be shown on each achievement that opens the {rightClickMenu}. ({enabled}) (1)\n\n" ..
                                "(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {rightClickMenu}";

L["Event Reminder"] = "Event Reminder";
L["Event Reminder Desc"] = "{events} are added to the new {events} tab and a reminder will pop up (max {numPopUps} at the same time) when one of the events is active ({popUpEnabled}) (1).\n\n" ..
                            "The event reminder has the name of the event and up to 2 lines of time display (end time of the event) (1).\n" ..
                            "The format of the time display can be chosen from presets or custom made (1).\n" ..
                            "A compact version exists with a single line for time display (compactEnabled) (1).\n\n" ..
                            "Clicking it will open the category with the obtainable achievements while the event is active.\n" ..
                            "It will dissapear when right clicked or after {eventAlertFadeDelay} seconds when ignored (1).\n\n" ..
                            "The reminder is also present on the right side of the achievement window.\n\n" ..
                            "Event types:\n" ..
                            tab .. "- calendarEvents (e.g.: Holidays).\n" ..
                            tab .. "- widgetEvents (e.g.: Torghast).\n" ..
                            tab .. "- worldEvents (e.g.: Assaults).\n\n" ..
                            "(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {eventReminders}";

L["OC"] = "OC";
L["NONC"] = "NONC";
L["Green"] = "Green";
L["Grey"] = "Grey";
L["Red"] = "Red";

-- NPC Names
L["Andurs"] = "Andurs"; -- Wowhead npc=105387
L["Rydyr"] = "Rydyr"; -- Wowhead npc=105386
L["Aki the Chosen"] = "Aki the Chosen"; -- Wowhead npc=66741
L["Burning Pandaren Spirit"] = "Burning Pandaren Spirit"; -- Wowhead npc=68463
L["Flowing Pandaren Spirit"] = "Flowing Pandaren Spirit"; -- Wowhead npc=68462
L["Thundering Pandaren Spirit"] = "Thundering Pandaren Spirit"; -- Wowhead npc=68465
L["Whispering Pandaren Spirit"] = "Whispering Pandaren Spirit"; -- Wowhead npc=68464
L["Dos-Ryga"] = "Dos-Ryga"; -- Wowhead npc=68564
L["Kafi"] = "Kafi"; -- Wowhead npc=68563
L["Ti'un the Wanderer"] = "Ti'un the Wanderer"; -- Wowhead npc=68562
L["No-No"] = "No-No"; -- Wowhead npc=68559
L["Gorespine"] = "Gorespine"; -- Wowhead npc=68558
L["Skitterer Xi'a"] = "Skitterer Xi'a"; -- Wowhead npc=68566
L["Greyhoof"] = "Greyhoof"; -- Wowhead npc=68560
L["Lucky Yi"] = "Lucky Yi"; -- Wowhead npc=68561
L["Ka'wi the Gorger"] = "Ka'wi the Gorger"; -- Wowhead npc=68555
L["Nitun"] = "Nitun"; -- Wowhead npc=68565