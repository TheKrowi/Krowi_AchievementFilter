# Inventory: today's saved settings layout

Generated on a headless whole-addon load (`.claude/tools/headless/options-env.lua`) from `main` at 72c80618, with the saved-settings proof's `SavedKeys` (`.claude/tools/headless/settings-proof.lua`). Each option that stores a value was set once and the saved path it wrote recorded. Labels are the headless stand-ins for global strings, such as `ACHIEVEMENTS_GUILD_TAB`. Paths under `KrowiAF_Options` are shown without `KrowiAF_Options.profiles.<profile>.`; other saved variables keep their name, such as `SavedData...`.

## Top-level saved keys and the sections that write under them (Retail)

| Saved key (profile) | Options | Sections |
|---|---|---|
| `AchievementPoints` | 30 | Tooltips, Window |
| `Achievements` | 35 | Achievement guides, Achievements, Keys and clicks, Pop Out, Reward preview, Window |
| `AddAddonNameToWorldMapIcon` | 1 | World map and minimap |
| `AdjustableCategories` | 40 | Categories |
| `Calendar` | 6 | Calendar, Window |
| `Categories` | 9 | Categories |
| `CenterHeader` | 1 | Window |
| `DataManager` | 1 | Window |
| `EnableDebugInfo` | 1 | Advanced |
| `EnableTaintDiagnostics` | 1 | Advanced |
| `EnableTraceInfo` | 1 | Advanced |
| `EventReminders` | 213 | Event reminders, Reminder events |
| `Features` | 3 | Pop Out, Reward preview, Right-click menu |
| `Filters` | 1 | Filtering and sorting |
| `MicroButtonTab` | 1 | Window |
| `Plugins` | 2 | Other addons |
| `Popout` | 13 | Pop Out |
| `PrintMapInfo` | 1 | Advanced |
| `ResetViewOnOpen` | 1 | Window |
| `RightClickMenu` | 3 | Right-click menu |
| `SearchBox` | 7 | Search |
| `ShowMinimapIcon` | 1 | World map and minimap |
| `ShowPlaceholdersFilter` | 1 | Advanced |
| `ShowWorldmapIcon` | 1 | World map and minimap |
| `Summary` | 3 | ACHIEVEMENT_SUMMARY_CATEGORY |
| `Tabs` | 8 | Tabs |
| `TabsGeneral` | 1 | Tabs |
| `ToggleWindow` | 1 | Window |
| `Tooltip` | 26 | Categories, Criteria on units, Tooltips |
| `TrackAchievementBrowserHistory` | 1 | Window |
| `Window` | 8 | Categories, Window |

Profile keys with defaults that no option writes: `Experimental`, `Minimap`

Filters database (`KrowiAF_Filters`, its own profiles) top-level keys: `BuildVersion`, `CollapseSeries`, `Completion`, `CurrentZone`, `EarnedBy`, `Excluded`, `Faction`, `HasReward`, `MergeSmallCategories`, `Obtainability`, `RewardType`, `SelectedZone`, `ShowPlaceholders`, `SortBy`, `Special`, `Tabs`, `Tracking`, `TrackingAchievements`

Search options database (`KrowiAF_SearchOptions`, its own profiles, no profile UI) keys: `SearchCriteria`, `SearchDescriptions`, `SearchIds`, `SearchNames`, `SearchRewards`

## Every option by section (Retail), in the options window's order

### Tabs (Achievement window)

| Option | Saved path |
|---|---|
| Achievements | `Tabs.Krowi_AchievementFilter.Achievements.Show` |
| ACHIEVEMENTS_GUILD_TAB | `Tabs.Blizzard_AchievementUI.Guild.Show` |
| STATISTICS | `Tabs.Blizzard_AchievementUI.Statistics.Show` |
| Achievements | `Tabs.Blizzard_AchievementUI.Achievements.Show` |
| Expansions | `Tabs.Krowi_AchievementFilter.Expansions.Show` |
| Events | `Tabs.Krowi_AchievementFilter.Events.Show` |
| PLAYER_V_PLAYER | `Tabs.Krowi_AchievementFilter.PvP.Show` |
| Specials | `Tabs.Krowi_AchievementFilter.Specials.Show` |
| Spacing | `TabsGeneral.Spacing` |

### Window (Achievement window)

| Option | Saved path |
|---|---|
| Categories width offset | `Window.CategoriesFrameWidthOffset` |
| Achievements width offset | `Window.AchievementsFrameWidthOffset` |
| Achievement window height offset | `Window.AchievementFrameHeightOffset` |
| Make windows movable | `Window.Movable` |
| Remember Achievement Window position | `Window.RememberLastPosition.AchievementWindow` |
| Remember Achievement Calendar position | `Window.RememberLastPosition.Calendar` |
| Remember Data Manager position | `Window.RememberLastPosition.DataManager` |
| Reset view on open | `ResetViewOnOpen` |
| Toggle window once opened | `ToggleWindow` |
| Rebind Micro Button | `MicroButtonTab` |
| Enable Tab Priority | `Achievements.EnableTabPriority` |
| Tab Priority | `Achievements.TabPriority` |
| Center header | `CenterHeader` |
| ACHIEVEMENT_POINTS - Format | `AchievementPoints.Format` |
| Track achievement browsing history | `TrackAchievementBrowserHistory` |
| Calendar button: horizontal position | `Calendar.ButtonOffsetX` |
| Calendar button: vertical position | `Calendar.ButtonOffsetY` |
| Mouse Wheel Scroll Speed | `DataManager.MouseWheelPanScalar` |

### Categories (Achievement window)

| Option | Saved path |
|---|---|
| Indentation | `Categories.Indentation` |
| Merge small categories threshold | `Window.MergeSmallCategoriesThreshold` |
| Mouse Wheel Scroll Speed | `Categories.MouseWheelPanScalar` |
| Show Not Obtainable | `Tooltip.Categories.ShowNotObtainable` |
| Achievements | `AdjustableCategories.Summary.1` |
| Expansions | `AdjustableCategories.Summary.2` |
| Events | `AdjustableCategories.Summary.3` |
| PLAYER_V_PLAYER | `AdjustableCategories.Summary.4` |
| Specials | `AdjustableCategories.Summary.5` |
| Achievements | `AdjustableCategories.WatchList.1` |
| Expansions | `AdjustableCategories.WatchList.2` |
| Events | `AdjustableCategories.WatchList.3` |
| PLAYER_V_PLAYER | `AdjustableCategories.WatchList.4` |
| Specials | `AdjustableCategories.WatchList.5` |
| Achievements | `AdjustableCategories.CurrentZone.1` |
| Expansions | `AdjustableCategories.CurrentZone.2` |
| Events | `AdjustableCategories.CurrentZone.3` |
| PLAYER_V_PLAYER | `AdjustableCategories.CurrentZone.4` |
| Specials | `AdjustableCategories.CurrentZone.5` |
| Achievements | `AdjustableCategories.SelectedZone.1` |
| Expansions | `AdjustableCategories.SelectedZone.2` |
| Events | `AdjustableCategories.SelectedZone.3` |
| PLAYER_V_PLAYER | `AdjustableCategories.SelectedZone.4` |
| Specials | `AdjustableCategories.SelectedZone.5` |
| Achievements | `AdjustableCategories.SearchResults.1` |
| Expansions | `AdjustableCategories.SearchResults.2` |
| Events | `AdjustableCategories.SearchResults.3` |
| PLAYER_V_PLAYER | `AdjustableCategories.SearchResults.4` |
| Specials | `AdjustableCategories.SearchResults.5` |
| Achievements | `AdjustableCategories.TrackingAchievements.1` |
| Expansions | `AdjustableCategories.TrackingAchievements.2` |
| Events | `AdjustableCategories.TrackingAchievements.3` |
| PLAYER_V_PLAYER | `AdjustableCategories.TrackingAchievements.4` |
| Specials | `AdjustableCategories.TrackingAchievements.5` |
| Achievements | `AdjustableCategories.Excluded.1` |
| Expansions | `AdjustableCategories.Excluded.2` |
| Events | `AdjustableCategories.Excluded.3` |
| PLAYER_V_PLAYER | `AdjustableCategories.Excluded.4` |
| Specials | `AdjustableCategories.Excluded.5` |
| Achievements | `AdjustableCategories.Uncategorized.1` |
| Expansions | `AdjustableCategories.Uncategorized.2` |
| Events | `AdjustableCategories.Uncategorized.3` |
| PLAYER_V_PLAYER | `AdjustableCategories.Uncategorized.4` |
| Specials | `AdjustableCategories.Uncategorized.5` |
| Show Sub Categories | `Categories.WatchList.ShowSubCategories` |
| Ignore Filters | `Categories.WatchList.IgnoreFilters` |
| Character Specific | `Categories.WatchList.CharacterSpecific` |
| Show Excluded Category | `Categories.Excluded.Show` |
| Show Sub Categories | `Categories.Excluded.ShowSubCategories` |
| Load Tracking Achievements | `Categories.TrackingAchievements.DoLoad` |
| Show Sub Categories | `Categories.TrackingAchievements.ShowSubCategories` |

### ACHIEVEMENT_SUMMARY_CATEGORY (Achievement window)

| Option | Saved path |
|---|---|
| Auto number of summary achievements | `Summary.AutoNumAchievements` |
| Number of summary achievements | `Summary.NumAchievements` |
| Mouse Wheel Scroll Speed | `Summary.MouseWheelPanScalar` |

### Achievements (Achievement window)

| Option | Saved path |
|---|---|
| Compact Achievements | `Achievements.Compact` |
| Center Header | `Achievements.CenterHeader` |
| Hide completion date | `Achievements.HideDateCompleted` |
| Show FACTION_ALLIANCE Faction Icon | `Achievements.ShowAllianceFactionIcon` |
| Show FACTION_HORDE Faction Icon | `Achievements.ShowHordeFactionIcon` |
| Faction Icon Transparency | `Achievements.FactionIconAlpha` |
| Show Temporarily obtainable Icon | `Achievements.ShowTemporarilyObtainableIcon` |
| Temporarily obtainable Header Colors | `Achievements.TemporarilyObtainableHeaderColors` |
| Show REPUTATION_SORT_TYPE_ACCOUNT Icon | `Achievements.ShowWarbandIcon` |
| REPUTATION_SORT_TYPE_ACCOUNT Header Colors | `Achievements.WarbandHeaderColor` |
| Force two columns | `Achievements.Objectives.ForceTwoColumns` |
| Force two columns threshold | `Achievements.Objectives.ForceTwoColumnsThreshold` |
| Criteria Behaviour | `Achievements.Objectives.CriteriaBehaviour` |
| Mouse Wheel Scroll Speed | `Achievements.MouseWheelPanScalar` |

### Filtering and sorting (Achievement window)

| Option | Saved path |
|---|---|
| Reset Faction Filters | `Filters.ResetFactionFilters` |

### Search (Achievement window)

| Option | Saved path |
|---|---|
| Clear search field on Right Click | `SearchBox.ClearOnRightClick` |
| Exclude Excluded achievements | `SearchBox.ExcludeExcluded` |
| Only search filtered achievements | `SearchBox.OnlySearchFiltered` |
| Minimum characters to search | `SearchBox.MinimumCharactersToSearch` |
| Number of search previews | `SearchBox.NumberOfSearchPreviews` |
| Show All Results in Category | `SearchBox.ShowAllResultsInCategory` |
| Mouse Wheel Scroll Speed | `SearchBox.MouseWheelPanScalar` |

### Tooltips (Achievement window)

| Option | Saved path |
|---|---|
| Number of Earned By characters | `Tooltip.Achievements.EarnedBy.Characters` |
| Number of Not Earned By characters | `Tooltip.Achievements.EarnedBy.NotCharacters` |
| Always show realm | `Tooltip.Achievements.EarnedBy.AlwaysShowRealm` |
| Hide Not Earned By if current character earned the achievement | `Tooltip.Achievements.EarnedBy.HideNotEarnedByIfEarnedByCurrentCharacter` |
| Show Added in version | `Tooltip.Achievements.ShowAddedInVersion` |
| Show Rewards | `Tooltip.Achievements.ShowRewards` |
| Show Part of a chain | `Tooltip.Achievements.ShowPartOfAChain` |
| Show current character icons | `Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain` |
| Show Required for | `Tooltip.Achievements.ShowRequiredFor` |
| Show current character icons | `Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor` |
| Show Other faction | `Tooltip.Achievements.ShowOtherFaction` |
| Show Objectives progress | `Tooltip.Achievements.ObjectivesProgress.Show` |
| When achievement completed | `Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted` |
| Second column threshold | `Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold` |
| Always show realm | `Tooltip.Achievements.MostProgress.AlwaysShowRealm` |
| Number of Most progress characters | `Tooltip.Achievements.MostProgress.Characters` |
| Show Temporarily obtainable | `Tooltip.Achievements.TemporarilyObtainable.Show` |
| Show Start Time & End Time | `Tooltip.Achievements.TemporarilyObtainable.ShowDateTime` |
| Number of lines | `Tooltip.Achievements.TemporarilyObtainable.NumberOfLines` |
| Presets | `Tooltip.Achievements.TemporarilyObtainable.DateTimeFormat.StartTimeAndEndTime` |
| Custom | `Tooltip.Achievements.TemporarilyObtainable.DateTimeFormat.StartTimeAndEndTime` |
| Always show realm | `AchievementPoints.Tooltip.AlwaysShowRealm` |
| Show faction icon | `AchievementPoints.Tooltip.ShowFaction` |
| Maximum number of characters | `AchievementPoints.Tooltip.MaxNumCharacters` |
| Keep current character | `AchievementPoints.Tooltip.KeepCurrentCharacter` |
| Sort priority 1 | `AchievementPoints.Tooltip.Sort.Priority.1` and 3 more |
| Reverse Sort | `AchievementPoints.Tooltip.Sort.Reverse.1` |
| Sort priority 2 | `AchievementPoints.Tooltip.Sort.Priority.1` and 3 more |
| Reverse Sort | `AchievementPoints.Tooltip.Sort.Reverse.2` |
| Sort priority 3 | `AchievementPoints.Tooltip.Sort.Priority.1` and 3 more |
| Reverse Sort | `AchievementPoints.Tooltip.Sort.Reverse.3` |
| Sort priority 4 | `AchievementPoints.Tooltip.Sort.Priority.1` and 3 more |
| Reverse Sort | `AchievementPoints.Tooltip.Sort.Reverse.4` |
| Sort priority 5 | `AchievementPoints.Tooltip.Sort.Priority.1` and 3 more |
| Reverse Sort | `AchievementPoints.Tooltip.Sort.Reverse.5` |

### Achievement guides (Achievement window)

| Option | Saved path |
|---|---|
| Show in Tooltip | `Achievements.Guide.Tooltip` |
| Show in Right Click Menu | `Achievements.Guide.RightClickMenu` |
| Show Icon | `Achievements.Guide.Icon` |
| Show on Mouseover | `Achievements.Guide.MouseoverShow` |
| Show in Selected Achievement | `Achievements.Guide.ExpandedRow` |
| Waypoint Buttons | `Achievements.Guide.ActionStyle` |
| Waypoint | `Achievements.Guide.WaypointProvider` |

### Calendar (Achievement window)

| Option | Saved path |
|---|---|
| Lock month when closed by achievement | `Calendar.LockAchievementMonth` |
| Lock month | `Calendar.LockMonth` |
| First day of the week | `Calendar.FirstWeekDay` |
| Mouse Wheel Scroll Speed | `Calendar.MouseWheelPanScalar` |

### World map and minimap (Around the game)

| Option | Saved path |
|---|---|
| Show world map icon | `ShowWorldmapIcon` |
| Add addon name to world map icon | `AddAddonNameToWorldMapIcon` |
| Show minimap icon | `ShowMinimapIcon` |

### Criteria on units (Around the game)

| Option | Saved path |
|---|---|
| Show Criteria | `Tooltip.Criteria.Show` |
| Achievement is Completed | `Tooltip.Criteria.ShowIf.AchievementIsCompleted` |
| Achievement was Not Earned by Me | `Tooltip.Criteria.ShowIf.AchievementWasNotEarnedByMe` |
| Criteria is Completed | `Tooltip.Criteria.ShowIf.CriteriaIsCompleted` |

### Keys and clicks (This addon)

| Option | Saved path |
|---|---|
| Paste to Chat | `Achievements.Modifiers.PasteToChat` |
| Toggle Tracking | `Achievements.Modifiers.ToggleTracking` |
| Add to / Remove from Watch List | `Achievements.Modifiers.ToggleWatchList` |
| Include / Exclude | `Achievements.Modifiers.ToggleExcluded` |
| Pop Out | `Achievements.Modifiers.PopOut` |

### Other addons (This addon)

| Option | Saved path |
|---|---|
| Rename Exploration -> Dragon Isles Category to Dragonflight | `Plugins.AchievementsTabFixes.RenameExplorationDragonIslesCategory` |
| Add To Right Click Menu | `Plugins.InstanceAchievementTracker.AddToRightClickMenu` |

### Advanced (This addon)

| Option | Saved path |
|---|---|
| Enable debug info | `EnableDebugInfo` |
| Enable trace info | `EnableTraceInfo` |
| Show placeholders filter | `ShowPlaceholdersFilter` |
| Print map info | `PrintMapInfo` |
| Enable taint diagnostics | `EnableTaintDiagnostics` |

### Reward preview (Achievement window)

| Option | Saved path |
|---|---|
| Enable | `Features.RewardPreview` |
| Show Icon on Achievements | `Achievements.ShowRewardPreviewIcon` |
| Preview on Mouseover | `Achievements.RewardPreviewMouseoverShow` |
| Invert Up and Down When Turning | `Achievements.RewardPreviewInvertVerticalRotation` |
| Max Number of Icons | `Achievements.RewardPreviewMaxIndividualIcons` |
| Starting Width | `Achievements.RewardPreviewDefaultWidth` |
| Starting Height | `Achievements.RewardPreviewDefaultHeight` |

### Right-click menu (Achievement window)

| Option | Saved path |
|---|---|
| Enable | `Features.RightClickMenu` |
| Show Menu Button | `RightClickMenu.ShowButtonOnAchievement` |
| Use Game Language | `RightClickMenu.WowheadLink.AddLocale` |
| Open on Tab | `RightClickMenu.WowheadLink.AddRelatedTab` |

### Pop Out (Achievement window)

| Option | Saved path |
|---|---|
| Enable | `Features.PopOut` |
| Click Modifier | `Achievements.Modifiers.PopOut` |
| Reopen After Login | `Popout.PersistAcrossSessions` |
| Remember Size | `Popout.RememberSize` |
| Open Where Last Moved | `Popout.RememberLastPosition` |
| Starting Width | `Popout.DefaultWidth` |
| Close When Earned | `Popout.CloseOnEarn` |
| Close Delay | `Popout.CloseOnEarnDelay` |
| Snap into Stacks | `Popout.EnableSnapping` |
| Snap Distance | `Popout.SnapDistance` |
| Close Button on Mouseover | `Popout.AutoHideCloseButton` |
| Resize Button on Mouseover | `Popout.AutoHideResizeButton` |
| Fade without Mouseover | `Popout.FadeWhenNotHovered` |
| Faded Opacity | `Popout.FadedOpacity` |
| Fade Time | `Popout.FadeSpeed` |

### Event reminders (Around the game)

| Option | Saved path |
|---|---|
| Enable | `EventReminders.Enabled` |
| Upcoming Holidays | `EventReminders.UpcomingCalendarEvents.Enabled` |
| Compact Reminders | `EventReminders.Compact` |
| Side Buttons Beside | `EventReminders.SideButtonsAnchor` |
| First Line | `EventReminders.TimeDisplay.Line1` |
| Second Line | `EventReminders.TimeDisplay.Line2` |
| Show | `EventReminders.PopUps.OnLogin.Show` |
| In instances | `EventReminders.PopUps.OnLogin.ShowInInstances` |
| Only when time data is available | `EventReminders.PopUps.OnLogin.ShowOnlyWhenTimeDataIsAvailable` |
| Show | `EventReminders.PopUps.OnReload.Show` |
| In instances | `EventReminders.PopUps.OnReload.ShowInInstances` |
| Only when time data is available | `EventReminders.PopUps.OnReload.ShowOnlyWhenTimeDataIsAvailable` |
| Show | `EventReminders.PopUps.OnEventStart.Show` |
| In instances | `EventReminders.PopUps.OnEventStart.ShowInInstances` |
| Only when time data is available | `EventReminders.PopUps.OnEventStart.ShowOnlyWhenTimeDataIsAvailable` |
| Show | `EventReminders.PopUps.OnLoginUpcoming.Show` |
| In instances | `EventReminders.PopUps.OnLoginUpcoming.ShowInInstances` |
| Show | `EventReminders.PopUps.OnReloadUpcoming.Show` |
| In instances | `EventReminders.PopUps.OnReloadUpcoming.ShowInInstances` |
| Show | `EventReminders.PopUps.OnEventStartUpcoming.Show` |
| In instances | `EventReminders.PopUps.OnEventStartUpcoming.ShowInInstances` |
| Position Applies To | `EventReminders.PopUps.AppliesTo` |
| Grow Direction | `EventReminders.PopUps.GrowDirection` |
| Spacing | `EventReminders.PopUps.Spacing` |
| Horizontal Position | `EventReminders.PopUps.OffsetX` |
| Vertical Position | `EventReminders.PopUps.OffsetY` |
| Pop-Ups at Once | `EventReminders.PopUps.MaxAlerts` |
| Fade After | `EventReminders.PopUps.FadeDelay` |
| Show | `EventReminders.ChatMessages.OnLogin.Show` |
| In instances | `EventReminders.ChatMessages.OnLogin.ShowInInstances` |
| Only when time data is available | `EventReminders.ChatMessages.OnLogin.ShowOnlyWhenTimeDataIsAvailable` |
| Show | `EventReminders.ChatMessages.OnReload.Show` |
| In instances | `EventReminders.ChatMessages.OnReload.ShowInInstances` |
| Only when time data is available | `EventReminders.ChatMessages.OnReload.ShowOnlyWhenTimeDataIsAvailable` |
| Show | `EventReminders.ChatMessages.OnEventStart.Show` |
| In instances | `EventReminders.ChatMessages.OnEventStart.ShowInInstances` |
| Only when time data is available | `EventReminders.ChatMessages.OnEventStart.ShowOnlyWhenTimeDataIsAvailable` |
| Show | `EventReminders.ChatMessages.OnLoginUpcoming.Show` |
| In instances | `EventReminders.ChatMessages.OnLoginUpcoming.ShowInInstances` |
| Show | `EventReminders.ChatMessages.OnReloadUpcoming.Show` |
| In instances | `EventReminders.ChatMessages.OnReloadUpcoming.ShowInInstances` |
| Show | `EventReminders.ChatMessages.OnEventStartUpcoming.Show` |
| In instances | `EventReminders.ChatMessages.OnEventStartUpcoming.ShowInInstances` |
| Delay for Active Events | `EventReminders.OnLoginDelay` |
| Delay for Upcoming Holidays | `EventReminders.OnLoginUpcomingDelay` |
| Refresh Every | `EventReminders.RefreshInterval` |
| Days Ahead | `EventReminders.UpcomingCalendarEvents.Days` |
| Presets | `EventReminders.DateTimeFormat.StartTimeAndEndTime` |
| Custom | `EventReminders.DateTimeFormat.StartTimeAndEndTime` |

### Reminder events (Around the game)

| Option | Saved path |
|---|---|
| Winds of Mysterious Fortune | `EventReminders.CalendarEvents.1636` and 4 more |
| Darkmoon Faire | `EventReminders.CalendarEvents.374`, `EventReminders.CalendarEvents.479` |
| Pilgrim's Bounty | `EventReminders.CalendarEvents.404` |
| Day of the Dead | `EventReminders.CalendarEvents.409` |
| Feast of Winter Veil | `EventReminders.CalendarEvents.141` |
| Noblegarden | `EventReminders.CalendarEvents.181` |
| Children's Week | `EventReminders.CalendarEvents.201` |
| Hallow's End | `EventReminders.CalendarEvents.324` |
| Lunar Festival | `EventReminders.CalendarEvents.327` |
| Midsummer Fire Festival | `EventReminders.CalendarEvents.341` |
| Love is in the Air | `EventReminders.CalendarEvents.423` |
| Brewfest | `EventReminders.CalendarEvents.372` |
| Pirates' Day | `EventReminders.CalendarEvents.398` |
| WoW's Anniversary | `EventReminders.CalendarEvents.1181` and 25 more |
| Kalimdor Cup | `EventReminders.CalendarEvents.1395` |
| Secrets of Azeroth | `EventReminders.CalendarEvents.1396`, `EventReminders.CalendarEvents.1398`, `EventReminders.CalendarEvents.1399` |
| Eastern Kingdoms Cup | `EventReminders.CalendarEvents.1400` |
| Outland Cup | `EventReminders.CalendarEvents.1407` |
| Turbulent Timeways | `EventReminders.CalendarEvents.1425` and 3 more |
| Northrend Cup | `EventReminders.CalendarEvents.1429` |
| Hearthstone's 10th Anniversary | `EventReminders.CalendarEvents.1462` |
| WoW Remix: Mists of Pandaria | `EventReminders.CalendarEvents.1514` and 3 more |
| Dastardly Duos | `EventReminders.CalendarEvents.1599`, `EventReminders.CalendarEvents.1689` |
| Legion: Remix | `EventReminders.CalendarEvents.1640` and 5 more |
| Curse Surges | `EventReminders.WorldEvents.8936` |
| Curse Surges | `EventReminders.WorldEvents.8937` |
| Curse Surges | `EventReminders.WorldEvents.8938` |
| Curse Surges | `EventReminders.WorldEvents.8939` |
| Curse Surges | `EventReminders.WorldEvents.8940` |
| The Wanderer: Next | `EventReminders.WorldEvents.7943` |
| The Cruelty of Dornic: Next | `EventReminders.WorldEvents.8076` |
| The Rivals: Next | `EventReminders.WorldEvents.8077` |
| Forget Me Not: Next | `EventReminders.WorldEvents.8078` |
| The Thraegar's Descent: Next | `EventReminders.WorldEvents.8079` |
| Active | `EventReminders.WorldEvents.7104` |
| Gathering | `EventReminders.WorldEvents.7267` |
| Next | `EventReminders.WidgetEvents.4729` |
| Active | `EventReminders.WidgetEvents.4731` |
| Ohn'ahran Plains | `EventReminders.WorldEvents.7342` |
| The Waking Shore | `EventReminders.WorldEvents.7343` |
| Thaldraszus | `EventReminders.WorldEvents.7344` |
| The Azure Span | `EventReminders.WorldEvents.7345` |
| Nokhudon Hold | `EventReminders.WorldEvents.7221` |
| Ohn'iri Springs | `EventReminders.WorldEvents.7225` |
| Brackenhide Hollow | `EventReminders.WorldEvents.7229` |
| Cobalt Assembly | `EventReminders.WorldEvents.7233` |
| Imbu | `EventReminders.WorldEvents.7237` |
| Tyrhold | `EventReminders.WorldEvents.7245` |
| Dragonbane Keep | `EventReminders.WorldEvents.7249` |
| Slagmire | `EventReminders.WorldEvents.7253` |
| Scalecracker Keep | `EventReminders.WorldEvents.7257` |
| Primalist Tomorrow | `EventReminders.WorldEvents.7298` |
| Nokhudon Hold | `EventReminders.WorldEvents.7222` |
| Ohn'iri Springs | `EventReminders.WorldEvents.7226` |
| Brackenhide Hollow | `EventReminders.WorldEvents.7230` |
| Cobalt Assembly | `EventReminders.WorldEvents.7234` |
| Imbu | `EventReminders.WorldEvents.7238` |
| Tyrhold | `EventReminders.WorldEvents.7246` |
| Dragonbane Keep | `EventReminders.WorldEvents.7250` |
| Slagmire | `EventReminders.WorldEvents.7254` |
| Scalecracker Keep | `EventReminders.WorldEvents.7258` |
| Primalist Tomorrow | `EventReminders.WorldEvents.7299` |
| Nokhudon Hold | `EventReminders.WorldEvents.7223` |
| Ohn'iri Springs | `EventReminders.WorldEvents.7227` |
| Brackenhide Hollow | `EventReminders.WorldEvents.7231` |
| Cobalt Assembly | `EventReminders.WorldEvents.7235` |
| Imbu | `EventReminders.WorldEvents.7239` |
| Tyrhold | `EventReminders.WorldEvents.7247` |
| Dragonbane Keep | `EventReminders.WorldEvents.7251` |
| Slagmire | `EventReminders.WorldEvents.7255` |
| Scalecracker Keep | `EventReminders.WorldEvents.7259` |
| Primalist Tomorrow | `EventReminders.WorldEvents.7300` |
| Nokhudon Hold | `EventReminders.WorldEvents.7224` |
| Ohn'iri Springs | `EventReminders.WorldEvents.7228` |
| Brackenhide Hollow | `EventReminders.WorldEvents.7232` |
| Cobalt Assembly | `EventReminders.WorldEvents.7236` |
| Imbu | `EventReminders.WorldEvents.7240` |
| Tyrhold | `EventReminders.WorldEvents.7248` |
| Dragonbane Keep | `EventReminders.WorldEvents.7252` |
| Slagmire | `EventReminders.WorldEvents.7256` |
| Scalecracker Keep | `EventReminders.WorldEvents.7260` |
| Primalist Tomorrow | `EventReminders.WorldEvents.7301` |
| Azure Span | `EventReminders.WorldEvents.7433` |
| Ohn'ahran Plains | `EventReminders.WorldEvents.7471` |
| Titan Lockdown: Next | `EventReminders.WorldEvents.7459` |
| Zaqali Ruin Investigation: Next | `EventReminders.WorldEvents.7460` |
| Titan Lockdown: Active | `EventReminders.WorldEvents.7461` |
| Zaqali Ruin Investigation: Active | `EventReminders.WorldEvents.7462` |
| Active | `EventReminders.WidgetEvents.4987` |
| Next | `EventReminders.WidgetEvents.4992` |
| Thaldraszus: Next | `EventReminders.WorldEvents.7553`, `EventReminders.WorldEvents.7602` |
| Azure Span: Next | `EventReminders.WorldEvents.7554`, `EventReminders.WorldEvents.7605` |
| Ohn'ahran Plains: Next | `EventReminders.WorldEvents.7555`, `EventReminders.WorldEvents.7604` |
| Waking Shores: Next | `EventReminders.WorldEvents.7556`, `EventReminders.WorldEvents.7603` |
| Next | `EventReminders.WidgetEvents.5157` |
| Active | `EventReminders.WidgetEvents.5323` |
| Next | `EventReminders.WidgetEvents.5584` |
| Soon | `EventReminders.WidgetEvents.5585` |
| Active | `EventReminders.WidgetEvents.5592` |
| Necrolord | `EventReminders.WorldEvents.6989` |
| Venthyr | `EventReminders.WorldEvents.6990` |
| Kyrian | `EventReminders.WorldEvents.6991` |
| Night Fae | `EventReminders.WorldEvents.6992` |
| Tiragarde Sound | `EventReminders.WorldEvents.5896` |
| Drustvar | `EventReminders.WorldEvents.5964` |
| Stormsong Valley | `EventReminders.WorldEvents.5966` |
| Nazmir | `EventReminders.WorldEvents.5969` |
| Vol'dun | `EventReminders.WorldEvents.5970` |
| Zuldazar | `EventReminders.WorldEvents.5973` |
| N'Zoth (Uldum) | `EventReminders.WorldEvents.6486` |
| Amathet | `EventReminders.WorldEvents.6487` |
| Aqir | `EventReminders.WorldEvents.6488` |
| N'Zoth (Vale of Eternal Blossoms) | `EventReminders.WorldEvents.6489` |
| Mogu | `EventReminders.WorldEvents.6490` |
| Mantid | `EventReminders.WorldEvents.6491` |
| Legion Assaults | `EventReminders.WorldEvents.5175` |


## Top-level saved keys and the sections that write under them (Classic)

| Saved key (profile) | Options | Sections |
|---|---|---|
| `AchievementPoints` | 30 | Tooltips, Window |
| `Achievements` | 35 | Achievement guides, Achievements, Keys and clicks, Pop Out, Reward preview, Window |
| `AddAddonNameToWorldMapIcon` | 1 | World map and minimap |
| `AdjustableCategories` | 40 | Categories |
| `Calendar` | 6 | Calendar, Window |
| `Categories` | 9 | Categories |
| `CenterHeader` | 1 | Window |
| `DataManager` | 1 | Window |
| `EnableDebugInfo` | 1 | Advanced |
| `EnableTaintDiagnostics` | 1 | Advanced |
| `EnableTraceInfo` | 1 | Advanced |
| `EventReminders` | 62 | Event reminders, Reminder events |
| `Features` | 3 | Pop Out, Reward preview, Right-click menu |
| `Filters` | 1 | Filtering and sorting |
| `MicroButtonTab` | 1 | Window |
| `Plugins` | 2 | Other addons |
| `Popout` | 13 | Pop Out |
| `PrintMapInfo` | 1 | Advanced |
| `ResetViewOnOpen` | 1 | Window |
| `RightClickMenu` | 3 | Right-click menu |
| `SearchBox` | 7 | Search |
| `ShowMinimapIcon` | 1 | World map and minimap |
| `ShowPlaceholdersFilter` | 1 | Advanced |
| `ShowWorldmapIcon` | 1 | World map and minimap |
| `Summary` | 3 | ACHIEVEMENT_SUMMARY_CATEGORY |
| `Tabs` | 8 | Tabs |
| `TabsGeneral` | 1 | Tabs |
| `ToggleWindow` | 1 | Window |
| `Tooltip` | 26 | Categories, Criteria on units, Tooltips |
| `TrackAchievementBrowserHistory` | 1 | Window |
| `Window` | 8 | Categories, Window |

Profile keys with defaults that no option writes: `Experimental`, `Minimap`

Filters database (`KrowiAF_Filters`, its own profiles) top-level keys: `BuildVersion`, `CollapseSeries`, `Completion`, `CurrentZone`, `EarnedBy`, `Excluded`, `Faction`, `HasReward`, `MergeSmallCategories`, `Obtainability`, `RewardType`, `SelectedZone`, `ShowPlaceholders`, `SortBy`, `Special`, `Tabs`, `Tracking`, `TrackingAchievements`

Search options database (`KrowiAF_SearchOptions`, its own profiles, no profile UI) keys: `SearchCriteria`, `SearchDescriptions`, `SearchIds`, `SearchNames`, `SearchRewards`

## Every option by section (Classic), in the options window's order

### Tabs (Achievement window)