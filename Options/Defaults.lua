local _, addon = ...;

addon.Options.Defaults = {
    profile = {
        ShowMinimapIcon = false,
        ShowWorldmapIcon = true,
        AddAddonNameToWorldMapIcon = false,
        ResetViewOnOpen = false,
        ToggleWindow = true,
        MicroButtonTab = 1,
        EnableDebugInfo = false,
        EnableTraceInfo = false,
        ShowPlaceholdersFilter = false,
        PrintMapInfo = false,
        CenterHeader = true,
        TrackAchievementBrowserHistory = true,
        Window = {
            Movable = true,
            RememberLastPosition = {
                AchievementWindow = false,
                Calendar = false,
                DataManager = false
            },
            CategoriesFrameWidthOffset = 50,
            AchievementsFrameWidthOffset = 0,
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
            MouseWheelPanScalar = 1,
            AutoNumAchievements = false
        },
        AdjustableCategories = { --[[ Dynamically build via ExportedCategories ]] },
        Achievements = {
            Compact = false,
            CenterHeader = true,
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
            MouseWheelPanScalar = 1,
            ShowTemporarilyObtainableIcon = true,
            TemporarilyObtainableHeaderColors = true,
            EnableTabPriority = false,
            TabPriority = 5
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
                ShowAddedInVersion = true,
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
                },
                TemporarilyObtainable = {
                    Show = true,
                    ShowDateTime = true,
                    DateTimeFormat = {
                        StartTimeAndEndTime = "%d/%m/%Y %R"
                    }
                }
            },
            Criteria = {
                Show = true,
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
            ShowAllResultsInCategory = true,
            MouseWheelPanScalar = 5
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
            MouseWheelPanScalar = 1,
            ButtonOffsetX = 0,
            ButtonOffsetY = 0
        },
        DataManager = {
            MouseWheelPanScalar = 1
        },
        Plugins = {}
    }
};