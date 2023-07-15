-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;

options.Defaults = {
    profile = {
        ShowMinimapIcon = false,
        ShowWorldmapIcon = true,
        ResetViewOnOpen = false,
        ToggleWindow = true,
        MicroButtonTab = 1,
        EnableDebugInfo = false,
        EnableTraceInfo = false,
        ShowPlaceholdersFilter = false,
        Window = {
            Movable = true,
            RememberLastPosition = {
                AchievementWindow = false,
                Calendar = false,
                DataManager = false
            },
            CategoriesFrameWidthOffset = 50,
            AchievementFrameHeightOffset = 250,
            MergeSmallCategoriesThreshold = 10
        },
        AchievementPoints = {
            Format = 2,
            Tooltip = {
                AlwaysShowRealm = false,
                ShowFaction = true,
                Sort = {
                    Priority = { 1, 2, 3, 4, 5 },
                    Reverse = { true, false, false, false, false }
                },
                MaxNumCharacters = 50,
                KeepCurrentCharacter = true
            }
        },
        Tabs = { --[[ Dynamically build via KrowiAF_RegisterTabOptions ]] },
        TabsGeneral = {
            Spacing = 0
        },
        Categories = {
            WatchList = {
                ShowSubCategories = false,
                IgnoreFilters = true
            },
            TrackingAchievements = {
                DoLoad = false,
                ShowSubCategories = false
            },
            Excluded = {
                Show = true,
                ShowSubCategories = false
            },
            Indentation = 10,
            MouseWheelPanScalar = 1
        },
        Summary = {
            NumAchievements = 25,
            MouseWheelPanScalar = 1
        },
        AdjustableCategories = { --[[ Dynamically build via ExportedCategories ]] },
        Achievements = {
            Compact = false,
            HideDateCompleted = false,
            ShowAllianceFactionIcon = false,
            ShowHordeFactionIcon = false,
            Objectives = {
                ForceTwoColumns = true,
                ForceTwoColumnsThreshold = 20,
                CriteriaBehaviour = 2
            },
            Modifiers = {
                PasteToChat = 4,
                ToggleTracking = 4,
                ToggleWatchList = 2,
                ToggleExcluded = 1
            },
            MouseWheelPanScalar = 1
        },
        RightClickMenu = {
            ShowButtonOnAchievement = false,
            WowheadLink = {
                AddLocale = true,
                AddRelatedTab = 1
            }
        },
        Tooltip = {
            Categories = {
                ShowNotObtainable = true
            },
            Achievements = {
                EarnedBy = {
                    Characters = 1,
                    NotCharacters = 1,
                    AlwaysShowRealm = false,
                    HideNotEarnedByIfEarnedByCurrentCharacter = false
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
                ShowOtherFaction = true,
                MostProgress = {
                    Characters = 1,
                    AlwaysShowRealm = false
                }
            },
            Criteria = {
                Show = true,
                ShowForAchievement = true,
                ShowIf = {
                    AchievementIsCompleted = false,
                    AchievementWasNotEarnedByMe = true,
                    CriteriaIsCompleted = false
                }
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
            OnlySearchFiltered = false,
            ShowAllResultsInCategory = true
        },
        EventReminders = {
            PopUps = {
                FadeDelay = 10,
                MaxAlerts = 5,
                OffsetX = 0,
                OffsetY = 128,
                GrowDirection = 1,
                Spacing = 10,
                OnLogin = {
                    Show = true,
                    ShowInInstances = false,
                    ShowOnlyWhenTimeDataIsAvailable = true
                },
                OnReload = {
                    Show = true,
                    ShowInInstances = false,
                    ShowOnlyWhenTimeDataIsAvailable = true
                },
                OnEventStart = {
                    Show = true,
                    ShowInInstances = false,
                    ShowOnlyWhenTimeDataIsAvailable = true
                },
            },
            ChatMessages = {
                OnLogin = {
                    Show = false,
                    ShowInInstances = false,
                    ShowOnlyWhenTimeDataIsAvailable = true
                },
                OnReload = {
                    Show = false,
                    ShowInInstances = false,
                    ShowOnlyWhenTimeDataIsAvailable = true
                },
                OnEventStart = {
                    Show = false,
                    ShowInInstances = false,
                    ShowOnlyWhenTimeDataIsAvailable = true
                },
            },
            DateTimeFormat = {
                StartTimeAndEndTime = "%d/%m/%Y %R"
            },
            TimeDisplay = {
                Line1 = 1,
                Line2 = 3
            },
            Compact = false,
            RefreshInterval = 60,
            OnLoginDelay = 5,
            SideButtonsAnchor = 1
        },
        Filters = {
            ResetFactionFilters = true
        },
        Calendar = {
            FirstWeekDay = -1,
            LockAchievementMonth = true,
            LockMonth = false,
            MouseWheelPanScalar = 1
        },
        Plugins = {}
    }
};