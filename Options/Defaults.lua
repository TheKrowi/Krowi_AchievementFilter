local _, addon = ...

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
        EnableTaintDiagnostics = true,
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
                IgnoreFilters = true,
                CharacterSpecific = false
            },
            TrackingAchievements = {
                DoLoad = false,
                ShowSubCategories = false
            },
            Excluded = {
                Show = true,
                ShowSubCategories = false,
                CharacterSpecific = false
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
            FactionIconAlpha = 0.2,
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
            TabPriority = 5,
            ShowWarbandIcon = true,
            WarbandHeaderColor = true,
            Guide = {
                Tooltip = true,
                RightClickMenu = true,
                Icon = true, -- the row icon and the side panel it opens
                MouseoverShow = true, -- hovering the row icon shows the panel; a click pins it
                ExpandedRow = false, -- off: it makes the selected row taller
                ActionStyle = 1, -- 1 Icons, 2 Text links (addon.Gui.Guide.Content.ActionStyle)
                WaypointProvider = 1 -- 1 Map pin and TomTom, 2 Map pin, 3 TomTom (addon.Gui.Guide.Waypoint.Provider)
            }
            -- ShowOtherFactionWarbandAsCompleted = true
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
                    },
                    NumberOfLines = 5
                },
                ShowRewards = true
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
        Experimental = {
            CollectionsAchievementWindow = false,
        },
        Plugins = {}
    }
}