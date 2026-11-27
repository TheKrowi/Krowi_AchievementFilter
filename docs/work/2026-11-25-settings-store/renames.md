# Renames: every saved setting's old path and new key
Spec: [spec.md](spec.md). Generated on 2026-11-27 from a headless whole-addon load of Retail and Classic (every path an option writes, through the saved-settings proof's `SavedKeys`), then the rows no option writes added by hand (end of the options part). Grouped by the options window's sections, in its order.

Checks the generator ran:
- no two old paths share a new key;
- every leaf of the old defaults tree (`KrowiAF_Options` defaults, every dynamic entry included) has a new key;
- every saved option value in Krowi's six real saved-variable files (five Retail accounts, last written between 2024-05 and 2026-11, and one Mists) has a new key: 0 left over.

Kinds: **value** one setting; **map** one setting with an entry per id (event, tab, category and tab), only entries that differ from their default saved; **list** a fixed list, saved whole when any element differs; **object** a table edited in place, saved as its difference from the default.

## The options (options profiles, `KrowiAF_Options` today)

### Tabs

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `Tabs.<addon>.<tab>.Show (8 entries)` | `tabs.show` | map | profile | both |
| `TabsGeneral.Spacing` | `tabs.spacing` | value | profile | both |

### Window

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `Window.CategoriesFrameWidthOffset` | `window.categoriesFrameWidthOffset` | value | profile | both |
| `Window.AchievementsFrameWidthOffset` | `window.achievementsFrameWidthOffset` | value | profile | both |
| `Window.AchievementFrameHeightOffset` | `window.achievementFrameHeightOffset` | value | profile | both |
| `Window.Movable` | `window.movable` | value | profile | both |
| `Window.RememberLastPosition.AchievementWindow` | `window.rememberPosition.achievementWindow` | value | profile | both |
| `Window.RememberLastPosition.Calendar` | `window.rememberPosition.calendar` | value | profile | both |
| `Window.RememberLastPosition.DataManager` | `window.rememberPosition.dataManager` | value | profile | both |
| `ResetViewOnOpen` | `window.resetViewOnOpen` | value | profile | both |
| `ToggleWindow` | `window.toggleWindow` | value | profile | both |
| `MicroButtonTab` | `window.microButtonTab` | value | profile | both |
| `Achievements.EnableTabPriority` | `window.tabPriority.enabled` | value | profile | both |
| `Achievements.TabPriority` | `window.tabPriority.tab` | value | profile | both |
| `CenterHeader` | `window.centerHeader` | value | profile | both |
| `AchievementPoints.Format` | `window.pointsFormat` | value | profile | both |
| `TrackAchievementBrowserHistory` | `window.trackBrowsingHistory` | value | profile | both |
| `Calendar.ButtonOffsetX` | `window.calendarButton.offsetX` | value | profile | both |
| `Calendar.ButtonOffsetY` | `window.calendarButton.offsetY` | value | profile | both |
| `DataManager.MouseWheelPanScalar` | `dataManager.mouseWheelPanScalar` | value | profile | both |

### Categories

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `Categories.Indentation` | `categories.indentation` | value | profile | both |
| `Window.MergeSmallCategoriesThreshold` | `categories.mergeSmallThreshold` | value | profile | both |
| `Categories.MouseWheelPanScalar` | `categories.mouseWheelPanScalar` | value | profile | both |
| `Tooltip.Categories.ShowNotObtainable` | `categories.tooltip.showNotObtainable` | value | profile | both |
| `AdjustableCategories.<category>.<tab> (40 entries)` | `categories.shownOnTab` | map | profile | both |
| `Categories.WatchList.ShowSubCategories` | `categories.watchList.showSubCategories` | value | profile | both |
| `Categories.WatchList.IgnoreFilters` | `categories.watchList.ignoreFilters` | value | profile | both |
| `Categories.WatchList.CharacterSpecific` | `categories.watchList.characterSpecific` | value | profile | both |
| `Categories.Excluded.Show` | `categories.excluded.show` | value | profile | both |
| `Categories.Excluded.ShowSubCategories` | `categories.excluded.showSubCategories` | value | profile | both |
| `Categories.TrackingAchievements.DoLoad` | `categories.trackingAchievements.doLoad` | value | profile | both |
| `Categories.TrackingAchievements.ShowSubCategories` | `categories.trackingAchievements.showSubCategories` | value | profile | both |

### Summary

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `Summary.AutoNumAchievements` | `summary.autoNumAchievements` | value | profile | both |
| `Summary.NumAchievements` | `summary.numAchievements` | value | profile | both |
| `Summary.MouseWheelPanScalar` | `summary.mouseWheelPanScalar` | value | profile | both |

### Achievements

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `Achievements.Compact` | `achievements.compact` | value | profile | both |
| `Achievements.CenterHeader` | `achievements.centerHeader` | value | profile | both |
| `Achievements.HideDateCompleted` | `achievements.hideDateCompleted` | value | profile | both |
| `Achievements.ShowAllianceFactionIcon` | `achievements.showAllianceFactionIcon` | value | profile | both |
| `Achievements.ShowHordeFactionIcon` | `achievements.showHordeFactionIcon` | value | profile | both |
| `Achievements.FactionIconAlpha` | `achievements.factionIconAlpha` | value | profile | both |
| `Achievements.ShowTemporarilyObtainableIcon` | `achievements.showTemporarilyObtainableIcon` | value | profile | both |
| `Achievements.TemporarilyObtainableHeaderColors` | `achievements.temporarilyObtainableHeaderColors` | value | profile | both |
| `Achievements.ShowWarbandIcon` | `achievements.showWarbandIcon` | value | profile | both |
| `Achievements.WarbandHeaderColor` | `achievements.warbandHeaderColor` | value | profile | both |
| `Achievements.Objectives.ForceTwoColumns` | `achievements.objectives.forceTwoColumns` | value | profile | both |
| `Achievements.Objectives.ForceTwoColumnsThreshold` | `achievements.objectives.forceTwoColumnsThreshold` | value | profile | both |
| `Achievements.Objectives.CriteriaBehaviour` | `achievements.objectives.criteriaBehaviour` | value | profile | both |
| `Achievements.MouseWheelPanScalar` | `achievements.mouseWheelPanScalar` | value | profile | both |

### Filtering and sorting

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `Filters.ResetFactionFilters` | `filtering.resetFactionFilters` | value | profile | both |

### Search

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `SearchBox.ClearOnRightClick` | `searchBox.clearOnRightClick` | value | profile | both |
| `SearchBox.ExcludeExcluded` | `searchBox.excludeExcluded` | value | profile | both |
| `SearchBox.OnlySearchFiltered` | `searchBox.onlySearchFiltered` | value | profile | both |
| `SearchBox.MinimumCharactersToSearch` | `searchBox.minimumCharactersToSearch` | value | profile | both |
| `SearchBox.NumberOfSearchPreviews` | `searchBox.numberOfSearchPreviews` | value | profile | both |
| `SearchBox.ShowAllResultsInCategory` | `searchBox.showAllResultsInCategory` | value | profile | both |
| `SearchBox.MouseWheelPanScalar` | `searchBox.mouseWheelPanScalar` | value | profile | both |

### Tooltips

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `Tooltip.Achievements.EarnedBy.Characters` | `tooltips.earnedBy.characters` | value | profile | both |
| `Tooltip.Achievements.EarnedBy.NotCharacters` | `tooltips.earnedBy.notCharacters` | value | profile | both |
| `Tooltip.Achievements.EarnedBy.AlwaysShowRealm` | `tooltips.earnedBy.alwaysShowRealm` | value | profile | both |
| `Tooltip.Achievements.EarnedBy.HideNotEarnedByIfEarnedByCurrentCharacter` | `tooltips.earnedBy.hideNotEarnedByIfEarnedByCurrentCharacter` | value | profile | both |
| `Tooltip.Achievements.ShowAddedInVersion` | `tooltips.showAddedInVersion` | value | profile | both |
| `Tooltip.Achievements.ShowRewards` | `tooltips.showRewards` | value | profile | both |
| `Tooltip.Achievements.ShowPartOfAChain` | `tooltips.showPartOfAChain` | value | profile | both |
| `Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain` | `tooltips.showCurrentCharacterIconsPartOfAChain` | value | profile | both |
| `Tooltip.Achievements.ShowRequiredFor` | `tooltips.showRequiredFor` | value | profile | both |
| `Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor` | `tooltips.showCurrentCharacterIconsRequiredFor` | value | profile | both |
| `Tooltip.Achievements.ShowOtherFaction` | `tooltips.showOtherFaction` | value | profile | both |
| `Tooltip.Achievements.ObjectivesProgress.Show` | `tooltips.objectivesProgress.show` | value | profile | both |
| `Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted` | `tooltips.objectivesProgress.showWhenAchievementCompleted` | value | profile | both |
| `Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold` | `tooltips.objectivesProgress.secondColumnThreshold` | value | profile | both |
| `Tooltip.Achievements.MostProgress.AlwaysShowRealm` | `tooltips.mostProgress.alwaysShowRealm` | value | profile | both |
| `Tooltip.Achievements.MostProgress.Characters` | `tooltips.mostProgress.characters` | value | profile | both |
| `Tooltip.Achievements.TemporarilyObtainable.Show` | `tooltips.temporarilyObtainable.show` | value | profile | both |
| `Tooltip.Achievements.TemporarilyObtainable.ShowDateTime` | `tooltips.temporarilyObtainable.showDateTime` | value | profile | both |
| `Tooltip.Achievements.TemporarilyObtainable.NumberOfLines` | `tooltips.temporarilyObtainable.numberOfLines` | value | profile | both |
| `Tooltip.Achievements.TemporarilyObtainable.DateTimeFormat.StartTimeAndEndTime` | `tooltips.temporarilyObtainable.dateTimeFormat.startTimeAndEndTime` | value | profile | both |
| `AchievementPoints.Tooltip.AlwaysShowRealm` | `tooltips.points.alwaysShowRealm` | value | profile | both |
| `AchievementPoints.Tooltip.ShowFaction` | `tooltips.points.showFaction` | value | profile | both |
| `AchievementPoints.Tooltip.MaxNumCharacters` | `tooltips.points.maxNumCharacters` | value | profile | both |
| `AchievementPoints.Tooltip.KeepCurrentCharacter` | `tooltips.points.keepCurrentCharacter` | value | profile | both |
| `AchievementPoints.Tooltip.Sort.Priority.1-5` | `tooltips.points.sortPriority` | list | profile | both |
| `AchievementPoints.Tooltip.Sort.Reverse.1-5` | `tooltips.points.sortReverse` | list | profile | both |

### Achievement guides

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `Achievements.Guide.Tooltip` | `guides.tooltip` | value | profile | both |
| `Achievements.Guide.RightClickMenu` | `guides.rightClickMenu` | value | profile | both |
| `Achievements.Guide.Icon` | `guides.icon` | value | profile | both |
| `Achievements.Guide.MouseoverShow` | `guides.mouseoverShow` | value | profile | both |
| `Achievements.Guide.ExpandedRow` | `guides.expandedRow` | value | profile | both |
| `Achievements.Guide.ActionStyle` | `guides.actionStyle` | value | profile | both |
| `Achievements.Guide.WaypointProvider` | `guides.waypointProvider` | value | profile | both |

### Calendar

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `Calendar.LockAchievementMonth` | `calendar.lockAchievementMonth` | value | profile | both |
| `Calendar.LockMonth` | `calendar.lockMonth` | value | profile | both |
| `Calendar.FirstWeekDay` | `calendar.firstWeekDay` | value | profile | both |
| `Calendar.MouseWheelPanScalar` | `calendar.mouseWheelPanScalar` | value | profile | both |

### World map and minimap

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `ShowWorldmapIcon` | `worldMap.showIcon` | value | profile | both |
| `AddAddonNameToWorldMapIcon` | `worldMap.addAddonName` | value | profile | both |
| `ShowMinimapIcon` | `minimap.showIcon` | value | profile | both |

### Criteria on units

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `Tooltip.Criteria.Show` | `unitTooltips.criteria.show` | value | profile | both |
| `Tooltip.Criteria.ShowIf.AchievementIsCompleted` | `unitTooltips.criteria.showIf.achievementIsCompleted` | value | profile | both |
| `Tooltip.Criteria.ShowIf.AchievementWasNotEarnedByMe` | `unitTooltips.criteria.showIf.achievementWasNotEarnedByMe` | value | profile | both |
| `Tooltip.Criteria.ShowIf.CriteriaIsCompleted` | `unitTooltips.criteria.showIf.criteriaIsCompleted` | value | profile | both |

### Keys and clicks

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `Achievements.Modifiers.PasteToChat` | `keys.modifiers.pasteToChat` | value | profile | both |
| `Achievements.Modifiers.ToggleTracking` | `keys.modifiers.toggleTracking` | value | profile | both |
| `Achievements.Modifiers.ToggleWatchList` | `keys.modifiers.toggleWatchList` | value | profile | both |
| `Achievements.Modifiers.ToggleExcluded` | `keys.modifiers.toggleExcluded` | value | profile | both |

### Other addons

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `Plugins.AchievementsTabFixes.RenameExplorationDragonIslesCategory` | `plugins.achievementsTabFixes.renameExplorationDragonIslesCategory` | value | profile | both |
| `Plugins.InstanceAchievementTracker.AddToRightClickMenu` | `plugins.instanceAchievementTracker.addToRightClickMenu` | value | profile | both |

### Advanced

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `EnableDebugInfo` | `advanced.debugInfo` | value | account | both |
| `EnableTraceInfo` | `advanced.traceInfo` | value | account | both |
| `ShowPlaceholdersFilter` | `advanced.placeholdersFilter` | value | account | both |
| `PrintMapInfo` | `advanced.printMapInfo` | value | account | both |
| `EnableTaintDiagnostics` | `advanced.taintDiagnostics` | value | account | both |

### Reward preview

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `Features.RewardPreview` | `rewardPreview.enabled` | value | profile | both |
| `Achievements.ShowRewardPreviewIcon` | `rewardPreview.showIcon` | value | profile | both |
| `Achievements.RewardPreviewMouseoverShow` | `rewardPreview.mouseoverShow` | value | profile | both |
| `Achievements.RewardPreviewInvertVerticalRotation` | `rewardPreview.invertVerticalRotation` | value | profile | both |
| `Achievements.RewardPreviewMaxIndividualIcons` | `rewardPreview.maxIndividualIcons` | value | profile | both |
| `Achievements.RewardPreviewDefaultWidth` | `rewardPreview.defaultWidth` | value | profile | both |
| `Achievements.RewardPreviewDefaultHeight` | `rewardPreview.defaultHeight` | value | profile | both |

### Right-click menu

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `Features.RightClickMenu` | `rightClickMenu.enabled` | value | profile | both |
| `RightClickMenu.ShowButtonOnAchievement` | `rightClickMenu.showButtonOnAchievement` | value | profile | both |
| `RightClickMenu.WowheadLink.AddLocale` | `rightClickMenu.wowheadLink.addLocale` | value | profile | both |
| `RightClickMenu.WowheadLink.AddRelatedTab` | `rightClickMenu.wowheadLink.addRelatedTab` | value | profile | both |

### Pop Out

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `Features.PopOut` | `popOut.enabled` | value | profile | both |
| `Achievements.Modifiers.PopOut` | `popOut.modifier` | value | profile | both |
| `Popout.PersistAcrossSessions` | `popOut.persistAcrossSessions` | value | profile | both |
| `Popout.RememberSize` | `popOut.rememberSize` | value | profile | both |
| `Popout.RememberLastPosition` | `popOut.rememberLastPosition` | value | profile | both |
| `Popout.DefaultWidth` | `popOut.defaultWidth` | value | profile | both |
| `Popout.CloseOnEarn` | `popOut.closeOnEarn` | value | profile | both |
| `Popout.CloseOnEarnDelay` | `popOut.closeOnEarnDelay` | value | profile | both |
| `Popout.EnableSnapping` | `popOut.enableSnapping` | value | profile | both |
| `Popout.SnapDistance` | `popOut.snapDistance` | value | profile | both |
| `Popout.AutoHideCloseButton` | `popOut.autoHideCloseButton` | value | profile | both |
| `Popout.AutoHideResizeButton` | `popOut.autoHideResizeButton` | value | profile | both |
| `Popout.FadeWhenNotHovered` | `popOut.fadeWhenNotHovered` | value | profile | both |
| `Popout.FadedOpacity` | `popOut.fadedOpacity` | value | profile | both |
| `Popout.FadeSpeed` | `popOut.fadeSpeed` | value | profile | both |

### Event reminders

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `EventReminders.Enabled` | `eventReminders.enabled` | value | profile | both |
| `EventReminders.UpcomingCalendarEvents.Enabled` | `eventReminders.upcomingCalendarEvents.enabled` | value | profile | both |
| `EventReminders.Compact` | `eventReminders.compact` | value | profile | both |
| `EventReminders.SideButtonsAnchor` | `eventReminders.sideButtonsAnchor` | value | profile | both |
| `EventReminders.TimeDisplay.Line1` | `eventReminders.timeDisplay.line1` | value | profile | both |
| `EventReminders.TimeDisplay.Line2` | `eventReminders.timeDisplay.line2` | value | profile | both |
| `EventReminders.PopUps.OnLogin.Show` | `eventReminders.popUps.onLogin.show` | value | profile | both |
| `EventReminders.PopUps.OnLogin.ShowInInstances` | `eventReminders.popUps.onLogin.showInInstances` | value | profile | both |
| `EventReminders.PopUps.OnLogin.ShowOnlyWhenTimeDataIsAvailable` | `eventReminders.popUps.onLogin.showOnlyWhenTimeDataIsAvailable` | value | profile | both |
| `EventReminders.PopUps.OnReload.Show` | `eventReminders.popUps.onReload.show` | value | profile | both |
| `EventReminders.PopUps.OnReload.ShowInInstances` | `eventReminders.popUps.onReload.showInInstances` | value | profile | both |
| `EventReminders.PopUps.OnReload.ShowOnlyWhenTimeDataIsAvailable` | `eventReminders.popUps.onReload.showOnlyWhenTimeDataIsAvailable` | value | profile | both |
| `EventReminders.PopUps.OnEventStart.Show` | `eventReminders.popUps.onEventStart.show` | value | profile | both |
| `EventReminders.PopUps.OnEventStart.ShowInInstances` | `eventReminders.popUps.onEventStart.showInInstances` | value | profile | both |
| `EventReminders.PopUps.OnEventStart.ShowOnlyWhenTimeDataIsAvailable` | `eventReminders.popUps.onEventStart.showOnlyWhenTimeDataIsAvailable` | value | profile | both |
| `EventReminders.PopUps.OnLoginUpcoming.Show` | `eventReminders.popUps.onLoginUpcoming.show` | value | profile | both |
| `EventReminders.PopUps.OnLoginUpcoming.ShowInInstances` | `eventReminders.popUps.onLoginUpcoming.showInInstances` | value | profile | both |
| `EventReminders.PopUps.OnReloadUpcoming.Show` | `eventReminders.popUps.onReloadUpcoming.show` | value | profile | both |
| `EventReminders.PopUps.OnReloadUpcoming.ShowInInstances` | `eventReminders.popUps.onReloadUpcoming.showInInstances` | value | profile | both |
| `EventReminders.PopUps.OnEventStartUpcoming.Show` | `eventReminders.popUps.onEventStartUpcoming.show` | value | profile | both |
| `EventReminders.PopUps.OnEventStartUpcoming.ShowInInstances` | `eventReminders.popUps.onEventStartUpcoming.showInInstances` | value | profile | both |
| `EventReminders.PopUps.AppliesTo` | `eventReminders.popUps.appliesTo` | value | profile | both |
| `EventReminders.PopUps.GrowDirection` | `eventReminders.popUps.growDirection` | value | profile | both |
| `EventReminders.PopUps.Spacing` | `eventReminders.popUps.spacing` | value | profile | both |
| `EventReminders.PopUps.OffsetX` | `eventReminders.popUps.offsetX` | value | profile | both |
| `EventReminders.PopUps.OffsetY` | `eventReminders.popUps.offsetY` | value | profile | both |
| `EventReminders.PopUps.MaxAlerts` | `eventReminders.popUps.maxAlerts` | value | profile | both |
| `EventReminders.PopUps.FadeDelay` | `eventReminders.popUps.fadeDelay` | value | profile | both |
| `EventReminders.ChatMessages.OnLogin.Show` | `eventReminders.chatMessages.onLogin.show` | value | profile | both |
| `EventReminders.ChatMessages.OnLogin.ShowInInstances` | `eventReminders.chatMessages.onLogin.showInInstances` | value | profile | both |
| `EventReminders.ChatMessages.OnLogin.ShowOnlyWhenTimeDataIsAvailable` | `eventReminders.chatMessages.onLogin.showOnlyWhenTimeDataIsAvailable` | value | profile | both |
| `EventReminders.ChatMessages.OnReload.Show` | `eventReminders.chatMessages.onReload.show` | value | profile | both |
| `EventReminders.ChatMessages.OnReload.ShowInInstances` | `eventReminders.chatMessages.onReload.showInInstances` | value | profile | both |
| `EventReminders.ChatMessages.OnReload.ShowOnlyWhenTimeDataIsAvailable` | `eventReminders.chatMessages.onReload.showOnlyWhenTimeDataIsAvailable` | value | profile | both |
| `EventReminders.ChatMessages.OnEventStart.Show` | `eventReminders.chatMessages.onEventStart.show` | value | profile | both |
| `EventReminders.ChatMessages.OnEventStart.ShowInInstances` | `eventReminders.chatMessages.onEventStart.showInInstances` | value | profile | both |
| `EventReminders.ChatMessages.OnEventStart.ShowOnlyWhenTimeDataIsAvailable` | `eventReminders.chatMessages.onEventStart.showOnlyWhenTimeDataIsAvailable` | value | profile | both |
| `EventReminders.ChatMessages.OnLoginUpcoming.Show` | `eventReminders.chatMessages.onLoginUpcoming.show` | value | profile | both |
| `EventReminders.ChatMessages.OnLoginUpcoming.ShowInInstances` | `eventReminders.chatMessages.onLoginUpcoming.showInInstances` | value | profile | both |
| `EventReminders.ChatMessages.OnReloadUpcoming.Show` | `eventReminders.chatMessages.onReloadUpcoming.show` | value | profile | both |
| `EventReminders.ChatMessages.OnReloadUpcoming.ShowInInstances` | `eventReminders.chatMessages.onReloadUpcoming.showInInstances` | value | profile | both |
| `EventReminders.ChatMessages.OnEventStartUpcoming.Show` | `eventReminders.chatMessages.onEventStartUpcoming.show` | value | profile | both |
| `EventReminders.ChatMessages.OnEventStartUpcoming.ShowInInstances` | `eventReminders.chatMessages.onEventStartUpcoming.showInInstances` | value | profile | both |
| `EventReminders.OnLoginDelay` | `eventReminders.onLoginDelay` | value | profile | both |
| `EventReminders.OnLoginUpcomingDelay` | `eventReminders.onLoginUpcomingDelay` | value | profile | both |
| `EventReminders.RefreshInterval` | `eventReminders.refreshInterval` | value | profile | both |
| `EventReminders.UpcomingCalendarEvents.Days` | `eventReminders.upcomingCalendarEvents.days` | value | profile | both |
| `EventReminders.DateTimeFormat.StartTimeAndEndTime` | `eventReminders.dateTimeFormat.startTimeAndEndTime` | value | profile | both |

### Reminder events

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `EventReminders.CalendarEvents.<id> (68 entries)` | `eventReminders.calendarEvents` | map | profile | both |
| `EventReminders.WorldEvents.<id> (87 entries)` | `eventReminders.worldEvents` | map | profile | Retail |
| `EventReminders.WidgetEvents.<id> (9 entries)` | `eventReminders.widgetEvents` | map | profile | Retail |

### Rows no option writes (added by hand)

| Old path (in each profile) | New key | Kind | Scope | Clients |
|---|---|---|---|---|
| `Tabs.<addon>.<tab>.Order` | `tabs.order` | map | profile | both |
| `Minimap.*` (LibDBIcon's own table: `hide`, `minimapPos`, ...) | `minimap.icon` | object | profile | both |
| `Experimental.CollectionsAchievementWindow` | `advanced.experimental.collectionsAchievementWindow` | value | account | both |

## The filters and search toggles (filter profiles)

The filter menu and the search menu write into nested tables by key path (`Gui/WindowFrames/FilterButton/FilterButtonMixin.lua:70`, `Gui/WindowFrames/Search/OptionsMenuButton/OptionsMenuButtonMixin.lua:13`), and `Filters.Validate` reads them for every achievement. They become two object settings in each filter profile, their inner shape unchanged.

| Old | New key | Kind |
|---|---|---|
| `KrowiAF_Filters.profiles.<profile>`: the whole profile (`MergeSmallCategories`, `EarnedBy`, `ShowPlaceholders`, the all-tabs filter set, `Tabs.<tab>`, `CurrentZone`, `SelectedZone`, `TrackingAchievements`) | `filters` | object |
| `KrowiAF_Filters.profileKeys.<character>` | the character's filter profile choice | |
| `KrowiAF_SearchOptions.profiles.Default` (`SearchIds`, `SearchNames`, `SearchDescriptions`, `SearchCriteria`, `SearchRewards`) | `search`, copied into every filter profile | object |

## Not carried over

| Old | Why |
|---|---|
| `EventReminders.WorldEvents.5177`, `.5178`, `.5210` in each options profile | Merged into 5175 by the Legion Assaults step (104.0) before the move, for a player returning from before 104.0 |
| `KrowiAF_SavedData.AlertSystem` | The pop-ups' old position copy (the 105.0 step) |
| `KrowiAF_SavedData.Build`, `Version`, `Fixes`, `Verifications` | The DataIntegrityManager's bookkeeping; the runner's version number replaces it |
| `KrowiAF_SavedData.CalendarEventsCache`, `CalendarEventsCacheTest`, `DFHashVerify`, `VerifyHash`, `ElvUISkin`, `GW2_UISkin`, `FeaturesTutorial`, `WatchedAchievements`, `ActiveEvents`, `DebugTable` | No code reads them any more (found in Krowi's real files, 2026-11-27); removed only if Krowi agrees at the spec gate |