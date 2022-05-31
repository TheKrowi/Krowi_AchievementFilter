-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;

options.Defaults = {
    profile = {
        ShowMinimapIcon = false,
        ResetViewOnOpen = false,
        EnableDebugInfo = false,
        EnableTraceInfo = false,
        ShowPlaceholdersFilter = false,
        Window = {
            Movable = true,
            CategoriesFrameWidthOffset = 25,
            AchievementFrameHeightOffset = 250,
            MergeSmallCategoriesThreshold = 10
        },
        AchievementPoints = {
            Format = 2,
            Tooltip = {
                AlwaysShowRealm = false
            }
        },
        Tabs = {
            Blizzard_AchievementUI = {
                Achievements = true,
                Guild = true,
                Statistics = true
            }
        },
        Categories = {
            Focused = {
                ShowSubCategories = false
            },
            Excluded = {
                Show = true,
                ShowSubCategories = false
            }
        },
        Achievements = {
            Compact = false,
            ButtonCollapsedHeight = ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT or 84 -- can return nil
        },
        RightClickMenu = {
            ShowButtonOnAchievement = false
        },
        Tooltip = {
            Categories = {
                ShowNotObtainable = true
            },
            Achievements = {
                EarnedBy = {
                    Characters = 1,
                    NotCharacters = 1,
                    AlwaysShowRealm = false
                },
                ShowPartOfAChain = true,
                ShowRequiredFor = true,
                ShowCurrentCharacterIconsPartOfAChain = false,
                ShowCurrentCharacterIconsRequiredFor = false,
                ObjectivesProgress = {
                    Show = true,
                    ShowWhenAchievementCompleted = true,
                    SecondColumnThreshold = 25
                },
                ShowOtherFaction = true
            }
        },
        Minimap = {
            hide = true -- not ShowMinimapIcon
        },
        SearchBox = {
            MinimumCharactersToSearch = 3,
            NumberOfSearchPreviews = 5,
            ClearOnRightClick = true,
            ExcludeExcluded = true,
            OnlySearchFiltered = false
        },
        EventReminders = {
            ShowPopUps = true,
            FadeDelay = 30,
            DateTimeFormat = {
                StartTimeAndEndTime = "%d/%m/%Y %R"
            },
            TimeDisplay = {
                Line1 = 2,
                Line2 = 4
            },
            Compact = false,
            MaxAlerts = 5
        },
        Filters = {
            ResetFactionFilters = true
        },
        Plugins = {}
    }
};