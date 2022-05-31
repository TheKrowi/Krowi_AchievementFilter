-- [[ Namespaces ]] --
local _, addon = ...;

addon.Tutorials = LibStub("Krowi_Tutorials-2.0");
local tutorials = addon.Tutorials;

local media = "Interface\\AddOns\\Krowi_AchievementFilter\\Media\\";

local function ReplaceVarsWithMenu(str, vars)
    if not vars then
        vars = type(str) == "table" and str or {str};
        str = vars[1];
    end
    vars["arrow"] = "|T" .. media .. "ui-backarrow:0|t";
    vars["gameMenu"] = addon.L["Game Menu"];
    vars["interface"] = addon.L["Interface"];
    vars["addOns"] = addon.L["AddOns"];
    vars["addonName"] = addon.MetaData.Title;
    return addon.Util.ReplaceVars(str, vars);
end
string.ReplaceVarsWithMenu = ReplaceVarsWithMenu;

local pages = {};
function tutorials.Load()
    local options = addon.Options.db;
    local colors = addon.Colors;
    local L = addon.L;

    tinsert(pages, { -- TabButtons
        Image = media .. "TabButton",
        ImageSize = {930, 158},
        SubTitle = L["New achievement window tabs"]:SetColorYellow(),
        Text = L["New achievement window tabs Desc"]:ReplaceVarsWithMenu
        {
            achievements = L["Achievements"]:SetColorYellow(),
            expansions = L["Expansions"]:SetColorYellow(),
            expansionsTabTutorial = L["Expansions tab"]:SetColorYellow(),
            events = L["Events"]:SetColorYellow(),
            pvp = L["Player vs. Player"]:SetColorYellow(),
            specials = L["Specials"]:SetColorYellow(),
            addonName_y = addon.MetaData.Title:SetColorYellow(),
            layout = L["Layout"],
            tabs = L["Tabs"],
            pluginText = ""
        }
    });
    tinsert(pages, { -- ExpansionsTab
        Layout = "HORIZONTAL",
        Image = media .. "Categories",
        ImageSize = {361, 512},
        SubTitle = L["Expansions tab"]:SetColorYellow(),
        Text = L["Expansions tab Desc"]:ReplaceVarsWithMenu
        {
            expansion = L["Expansion"],
            zones = L["Zones"],
            quests = (GetCategoryInfo(15447)),
            exploration = (GetCategoryInfo(97)),
            pvp = (GetCategoryInfo(15270)),
            reputation = (GetCategoryInfo(15273)),
            dungeons = (GetCategoryInfo(15272)),
            raids = (GetCategoryInfo(15271)),
            petBattles = (GetCategoryInfo(15117)),
            expansionFeatures = (GetCategoryInfo(15301)),
            currentZone = L["Current Zone"]:SetColorYellow(),
            selectedZone = L["Selected Zone"]:SetColorYellow(),
            focusedCategory = L["Focused"]:SetColorYellow(),
            excludedCategory = L["Excluded"]:SetColorYellow(),
            layout = L["Layout"],
            categories = L["Categories"]
        }
    });
    tinsert(pages, { -- FilteringSorting
        Layout = "HORIZONTAL",
        Image = media .. "FilteringSorting",
        ImageSize = {587, 720},
        SubTitle = L["Enhanced filtering and sorting"]:SetColorYellow(),
        Text = L["Enhanced filtering and sorting Desc"]:ReplaceVarsWithMenu
        {
            mergeSmallCategories = L["Merge Small Categories"]:SetColorYellow(),
            completed = L["Completed"]:SetColorYellow(),
            notCompleted = L["Not Completed"]:SetColorYellow(),
            obtainable = L["Obtainable"]:SetColorYellow(),
            notObtainable = L["Not Obtainable"]:SetColorYellow(),
            faction = addon.L["Faction"],
            resetFactionFilters = addon.L["Reset Faction Filters"],
            neutral = L["Neutral"]:SetColorYellow(),
            alliance = L["Alliance"]:SetColorYellow(),
            alliance_wc = addon.L["Alliance"],
            horde = L["Horde"]:SetColorYellow(),
            horde_wc = addon.L["Horde"],
            covenant = addon.L["Covenant"],
            kyrian = L["Kyrian"]:SetColorYellow(),
            kyrian_wc = addon.L["Kyrian"],
            venthyr = L["Venthyr"]:SetColorYellow(),
            venthyr_wc = addon.L["Venthyr"],
            nightfae = L["Night Fae"]:SetColorYellow(),
            nightfae_wc = addon.L["Night Fae"],
            necrolord = L["Necrolord"]:SetColorYellow(),
            necrolord_wc = addon.L["Necrolord"],
            excluded = L["Excluded"]:SetColorYellow(),
            collapseChain = L["Collapse Chain"]:SetColorYellow(),
            noSorting = L["Default"]:SetColorYellow(),
            sortByName = L["Name"]:SetColorYellow(),
            sortByCompletion = L["Completion"]:SetColorYellow(),
            sortByID = L["ID"]:SetColorYellow(),
            reverseSort = L["Reverse Sort"]:SetColorYellow(),
            tabs = addon.L["Tabs"],
            specialCategories = addon.L["Special Categories"],
            earnedBy = addon.L["Earned By"],
            earnedByTutorial = L["Earned By"]:SetColorYellow(),
            account = L["Account"]:SetColorYellow(),
            character = L["Character"]:SetColorYellow(),
            help = L["Help"]:SetColorYellow(),
            options = L["Options"]:SetColorYellow(),
            discord = addon.L["Discord"],
            curseForge = addon.L["CurseForge"],
            layout = addon.L["Layout"],
            categories = addon.L["Categories"]
        },
        OnShow = function(self)
            self.Text = self.Text:ReplaceVars
            {
                mergeSmallCategoriesNumber = tostring(addon.Options.db.Window.MergeSmallCategoriesThreshold):SetColorYellow(),
                resetFactionFiltersEnabled = addon.GetText1Or2(addon.Options.db.Filters.ResetFactionFilters, L["Enabled"], true, colors.Green, L["Disabled"], nil, colors.Red)
            };
        end
    });
    tinsert(pages, { -- QuickSearch
        Layout = "HORIZONTAL",
        Image = media .. "QuickSearch",
        ImageSize = {358, 324},
        SubTitle = L["Quick Search"]:SetColorYellow(),
        Text = L["Quick Search Desc"]:ReplaceVarsWithMenu
        {
            clearOnRightClick = L["Clear search field on Right Click"],
            excludeExcludedAchievements = L["Exclude Excluded achievements"],
            searchFilteredAchievements = L["Only search filtered achievements"],
            minCharToSearch = L["Minimum characters to search"],
            numSearchPreviews = L["Number of search previews"]
        },
        TextSize = {358, 0},
        OnShow = function(self)
            self.Text = self.Text:ReplaceVars
            {
                clearOnRightClickEnabled = addon.GetText1Or2(options.SearchBox.ClearOnRightClick, L["Enabled"], true, colors.Green, L["Disabled"], nil, colors.Red),
                excludeExcludedAchievementsEnabled = addon.GetText1Or2(options.SearchBox.ExcludeExcluded, L["Exclude"], true, colors.Yellow, L["Include"]),
                excludeExcludedAchievementsFrom = addon.GetText1Or2(options.SearchBox.ExcludeExcluded, L["from"], true, nil, L["in"]),
                searchFilteredAchievementsEnabled = addon.GetText1Or2(options.SearchBox.OnlySearchFiltered, L["Enabled"], true, colors.Green, L["Disabled"], nil, colors.Red),
                minCharToSearchNumber = tostring(addon.Options.db.SearchBox.MinimumCharactersToSearch):SetColorYellow(),
                numSearchPreviewsNumber = tostring(addon.Options.db.SearchBox.NumberOfSearchPreviews):SetColorYellow()
            };
        end
    });
    tinsert(pages, { -- FullSearch
        Image = media .. "FullSearch",
        ImageSize = {826, 512},
        SubTitle = L["Full Search"]:SetColorYellow(),
        Text = L["Full Search Desc"]:ReplaceVars
        {
            showAllResults = string.gsub(L["Show All %d Results"], "%%d", "X"),
            quickSearchTutorial = L["Quick Search"]:SetColorYellow()
        }
    });
    tinsert(pages, { -- AchievementColors
        Image = media .. "NewAchievementColors",
        ImageSize = {722, 499},
        SubTitle = L["New Achievement Colors"]:SetColorYellow(),
        Text = L["New Achievement Colors Desc"]
    });
    tinsert(pages, { -- EarnedBy
        Image = media .. "EarnedBy",
        ImageSize = {1018, 473},
        SubTitle = L["Earned By"]:SetColorYellow(),
        Text = L["Earned By Desc"]:ReplaceVarsWithMenu
        {
            achievementPointsEarnedBy = L["Achievement points earned by"]:SetColorYellow(),
            achievementPointsEarnedBy_wc = L["Achievement points earned by"],
            achievementPointsEarnedByFormat = string.format(addon.Colors.Yellow, LibStub("AceConfigRegistry-3.0"):GetOptionsTable(addon.L["Layout"], "cmd", "KROWIAF-0.0").args.Header.args.AchievementPoints.args.Format.values[addon.Options.db.AchievementPoints.Format]),
            tooltip = L["Tooltip"]:SetColorYellow(),
            account = L["Account"]:SetColorYellow(),
            character = L["Character"]:SetColorYellow(),
            earnedBy = L["Earned By"]:SetColorYellow(),
            notEarnedBy = L["Not Earned By"]:SetColorYellow(),
            layout = L["Layout"],
            header = L["Header"],
            achievements = L["Achievements"]
        },
        OnShow = function(self)
            self.Text = self.Text:ReplaceVars
            {
                earnedByNumber = tostring(addon.Options.db.Tooltip.Achievements.EarnedBy.Characters):SetColorYellow(),
                notEarnedByNumber = tostring(addon.Options.db.Tooltip.Achievements.EarnedBy.NotCharacters):SetColorYellow(),
            };
        end
    });
    tinsert(pages, { -- CompactAchievements
        Image = media .. "CompactAchievements",
        ImageSize = {722, 385},
        SubTitle = L["Compact Achievements T"]:SetColorYellow(),
        Text = L["Compact Achievements T Desc"]:ReplaceVarsWithMenu
        {
            layout = L["Layout"],
            achievements = L["Achievements"]
        },
        OnShow = function(self)
            self.Text = self.Text:ReplaceVars
            {
                compactEnabled = addon.GetText1Or2(options.Achievements.Compact, L["Enabled"], true, colors.Green, L["Disabled"], nil, colors.Red)
            };
        end
    });
    tinsert(pages, { -- TooltipCategories
        Image = media .. "TooltipCategories",
        ImageSize = {554, 154},
        SubTitle = (L["Enhanced tooltip"] .. " (" .. L["Categories"] .. ")"):SetColorYellow(),
        Text = L["Enhanced tooltip Categories Desc"]:ReplaceVarsWithMenu
        {
            oc = L["OC"]:SetColorGreen(),
            nonc = L["NONC"]:SetColorRed(),
            green = L["Green"]:SetColorGreen(),
            red = L["Red"]:SetColorRed(),
            notObtainable = L["Not Obtainable"]:SetColorYellow(),
            layout = L["Layout"],
            categories = L["Categories"]
        },
        OnShow = function(self)
            self.Text = self.Text:ReplaceVars
            {
                showNotObtainable = addon.GetText1Or2(options.Tooltip.Categories.ShowNotObtainable, L["Enabled"], true, colors.Green, L["Disabled"], nil, colors.Red)
            };
        end
    });
    tinsert(pages, { -- TooltipAchievements
        Image = media .. "TooltipAchievements",
        ImageSize = {1016, 381},
        SubTitle = (L["Enhanced tooltip"] .. " (" .. L["Achievements"] .. ")"):SetColorYellow(),
        Text = L["Enhanced tooltip Achievements Desc"]:ReplaceVarsWithMenu
        {
            notObtainable = L["Not Obtainable"]:SetColorYellow(),
            noLongerObtainable = L["This achievement is no longer obtainable"]:SetColorRed(),
            earnedBy = L["Earned By"]:SetColorYellow(),
            partOfAChain = L["Part of a chain"]:SetColorYellow(),
            requiredFor = L["Required for"]:SetColorYellow(),
            otherFaction = L["Other faction"]:SetColorYellow(),
            objectivesProgress = L["Objectives progress"]:SetColorYellow(),
            ready = "|T136814:0|t",
            waiting = "|T136815:0|t",
            notready = "|T136813:0|t",
            green = L["Green"]:SetColorGreen(),
            grey = L["Grey"]:SetColorGrey(),
            red = L["Red"]:SetColorRed(),
            lightGreen = L["Green"]:SetColorLightGreen(),
            lightGrey = L["Grey"]:SetColorLightGrey(),
            lightRed = L["Red"]:SetColorLightRed(),
            discord = L["Discord"],
            curseForge = L["CurseForge"],
            layout = L["Layout"],
            achievements = L["Achievements"]
        },
        OnShow = function(self)
            self.Text = self.Text:ReplaceVars
            {
                partOfAChainEnabled = addon.GetText1Or2(options.Tooltip.Achievements.ShowPartOfAChain, L["Enabled"], true, colors.Green, L["Disabled"], nil, colors.Red),
                requiredForEnabled = addon.GetText1Or2(options.Tooltip.Achievements.ShowRequiredFor, L["Enabled"], true, colors.Green, L["Disabled"], nil, colors.Red),
                otherFactionEnabled = addon.GetText1Or2(options.Tooltip.Achievements.ShowOtherFaction, L["Enabled"], true, colors.Green, L["Disabled"], nil, colors.Red),
                objectivesProgressEnabled = addon.GetText1Or2(options.Tooltip.Achievements.ObjectivesProgress.Show, L["Enabled"], true, colors.Green, L["Disabled"], nil, colors.Red),
                currentCharacterIconEnabled = addon.GetText1Or2(options.Tooltip.Achievements.ShowCurrentCharacterIcons, L["Enabled"], true, colors.Green, L["Disabled"], nil, colors.Red)
            };
        end
    });
    tinsert(pages, { -- WorldMapButton
        Image = media .. "WorldMapButton",
        ImageSize = {433, 392},
        SubTitle = L["World Map Button"]:SetColorYellow(),
        Text = L["World Map Button Desc"]:ReplaceVars
        {
            enhancedTooltipCategories = (L["Enhanced tooltip"] .. " (" .. L["Categories"] .. ")"):SetColorYellow(),
            selectedZone = L["Selected Zone"]:SetColorYellow(),
            enhancedFilteringAndSorting = L["Enhanced filtering and sorting"]:SetColorYellow()
        }
    });
    tinsert(pages, { -- RightClickMenu
        Image = media .. "RightClickMenu",
        ImageSize = {772, 340},
        SubTitle = L["Right Click Menu"]:SetColorYellow(),
        Text = L["Right Click Menu Desc"]:ReplaceVarsWithMenu
        {
            rightClickMenu = addon.L["Right Click Menu"],
            wowhead = L["Wowhead"]:SetColorYellow(),
            goTo = L["Go to"]:SetColorYellow(),
            partOfAChain = L["Part of a chain"]:SetColorYellow(),
            require = L["Required for"]:SetColorYellow(),
            currentZone = addon.L["Current Zone"],
            xuFuPetGuides = L["Xu-Fu's Pet Guides"]:SetColorYellow(),
            petBattles = (GetCategoryInfo(15117)),
            more = L["More"]:SetColorYellow(),
            focus = L["Focus"]:SetColorYellow(),
            clearFocus = L["Clear focus"]:SetColorYellow(),
            focused = L["Focused"]:SetColorYellow(),
            include = L["Include"]:SetColorYellow(),
            exclude = L["Exclude"]:SetColorYellow(),
            layout = addon.L["Layout"],
            pluginText = ""
        },
        OnShow = function(self)
            self.Text = self.Text:ReplaceVars
            {
                enabled = addon.GetText1Or2(options.RightClickMenu.ShowButtonOnAchievement, L["Enabled"], true, colors.Green, L["Disabled"], nil, colors.Red)
            };
        end
    });
    tinsert(pages, { -- EventReminder
        Layout = "HORIZONTAL",
        Image = media .. "EventReminder",
        ImageSize = {391, 486},
        SubTitle = L["Event Reminder"]:SetColorYellow(),
        Text = L["Event Reminder Desc"]:ReplaceVarsWithMenu
        {
            events = L["Events"],
            calendarEvents = L["Calendar Events"],
            widgetEvents = L["Widget Events"],
            worldEvents = L["World Events"],
            eventReminders = L["Event Reminders"]
        },
        TextSize = {391, 0},
        OnShow = function(self)
            self.Text = self.Text:ReplaceVars
            {
                popUpEnabled = addon.GetText1Or2(options.EventReminders.ShowPopUps, L["Enabled"], true, colors.Green, L["Disabled"], nil, colors.Red),
                numPopUps = tostring(addon.Options.db.EventReminders.MaxAlerts):SetColorYellow(),
                compactEnabled = addon.GetText1Or2(options.EventReminders.Compact, L["Enabled"], true, colors.Green, L["Disabled"], nil, colors.Red),
                eventAlertFadeDelay = tostring(addon.Options.db.EventReminders.FadeDelay):SetColorYellow()
            };
        end
    });

    tutorials.FeaturesTutorial = tutorials:New("FeaturesTutorial", SavedData);
    tutorials.FeaturesTutorial:SetFrameTitle(addon.MetaData.Title .. " - " .. addon.MetaData.BuildVersion);
    tutorials.FeaturesTutorial:SetPages(pages);
    tutorials.FeaturesTutorial:SetImageMargin(10);
    tutorials.FeaturesTutorial:SetTextMargin({10, 0, 10, 20});

    addon.Diagnostics.Debug("Tutorial loaded");
end