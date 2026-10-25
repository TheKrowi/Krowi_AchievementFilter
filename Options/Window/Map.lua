local _, addon = ...
local L = addon.L

-- Where every AceConfig option of the six option pages shows in the options window, per feature section
-- (docs/work/2026-10-25-options-revamp). Paths are AceConfig key paths into addon.Options.OptionsTable, the form
-- InjectOptions uses. An entry is a Path (one option), a Group (every option of a group, or with Header the ones
-- under that header; "" = before the first header), or Families (each child group, a heading with All/None).
-- The options suite (Tests/Options.lua) fails when an option is unmapped or mapped twice.
addon.Options.Window = addon.Options.Window or {}
addon.Options.Window.Map = {
    Groups = {
        { Name = L["Achievement window"], Tiles = true, Sections = { "tabs", "window", "categories", "summary", "achievements", "filters", "search", "tooltips", "rightclick", "popout", "rewards", "guides", "calendar" } },
        { Name = L["Around the game"], Tiles = true, Sections = { "maps", "criteria", "events", "eventlist" } },
        { Name = L["This addon"], Tiles = false, Sections = { "keys", "plugins", "profiles", "advanced", "about" } },
    },
    Sections = {
        { Id = "tabs", Name = L["Tabs"], Tile = "TabButton", Groups = {
            { Header = L["Tabs and their order"], Note = L["Uncheck a tab to hide it. The arrows move it in the tab strip."], Kind = "TabList", Order = "Layout.args.Tabs.args.Order.args.Order", Show = "Layout.args.Tabs.args.Show.args.Show" },
            { Header = L["Tab strip"], Entries = {
                { Path = "Layout.args.Tabs.args.General.args.General.args.Spacing" },
            } },
        } },
        { Id = "window", Name = L["Window"], Groups = {
            { Header = L["Size"], Entries = {
                { Group = "Layout.args.Window.args.Offsets" },
            } },
            { Header = L["Position"], Entries = {
                { Path = "Layout.args.Window.args.Movable.args.SwitchMovable" },
                { Path = "Layout.args.Window.args.Movable.args.AchievementWindowRememberLastPosition" },
                { Path = "Layout.args.Window.args.Movable.args.AchievementWindowResetPosition", Label = L["Reset window position"], Button = L["Reset"] },
                { Path = "Layout.args.Window.args.Movable.args.CalendarRememberLastPosition" },
                { Path = "Layout.args.Window.args.Movable.args.CalendarResetPosition", Label = L["Reset calendar position"], Button = L["Reset"] },
                { Path = "Layout.args.Window.args.Movable.args.DataManagerRememberLastPosition" },
                { Path = "Layout.args.Window.args.Movable.args.DataManagerResetPosition", Label = L["Reset Data Manager position"], Button = L["Reset"] },
            } },
            { Header = L["Opening the window"], Entries = {
                { Path = "General.args.KeyBinding.args.General.args.ResetView.args.ResetViewOnOpen" },
                { Path = "General.args.KeyBinding.args.General.args.ResetView.args.ToggleWindow" },
                { Path = "General.args.KeyBinding.args.General.args.MicroButton.args.Rebind" },
                { Path = "General.args.KeyBinding.args.General.args.MicroButton.args.SetKeybind", Button = L["Bind to Y"] },
                { Path = "Layout.args.Achievements.args.Style.args.TabPriority.args.EnableTabPriority" },
                { Path = "Layout.args.Achievements.args.Style.args.TabPriority.args.TabPriority", Parent = "Layout.args.Achievements.args.Style.args.TabPriority.args.EnableTabPriority" },
            } },
            { Header = L["Header"], Entries = {
                { Path = "Layout.args.Header.args.General.args.CenterHeader" },
                { Path = "Layout.args.Header.args.General.args.AchievementPointsFormat" },
                { Path = "Layout.args.Header.args.BrowserHistory.args.Track" },
                { Path = "Layout.args.Header.args.CalendarButton.args.OffsetX", Label = L["Calendar button: horizontal position"] },
                { Path = "Layout.args.Header.args.CalendarButton.args.OffsetY", Label = L["Calendar button: vertical position"] },
            } },
            { Header = L["Data Manager"], Entries = {
                { Path = "Layout.args.DataManager.args.MouseWheelPanScalar.args.MouseWheelPanScalar" },
            } },
        } },
        { Id = "categories", Name = L["Categories"], Tile = "Categories", Groups = {
            { Header = L["Category list"], Entries = {
                { Path = "Layout.args.Categories.args.Indentation.args.Indentation" },
                { Path = "Layout.args.Categories.args.Merge.args.MergeSmallCategoriesThreshold" },
                { Path = "Layout.args.Categories.args.MouseWheelPanScalar.args.MouseWheelPanScalar" },
                { Path = "Layout.args.Categories.args.Tooltip.args.ShowNotObtainable" },
            } },
            { Header = L["Special categories per tab"], Note = L["Changes need a reload."], Kind = "Grid", Columns = { L["Achievements"], L["Expansions"], L["Events"], L["PvP"], L["Specials"] }, Rows = {
                { Label = L["Summary"], Group = "Layout.args.AdjustableCategories.args.Summary", Header = "Tabs" },
                { Label = L["Watch List"], Group = "Layout.args.AdjustableCategories.args.WatchList", Header = "Tabs" },
                { Label = L["Current Zone"], Group = "Layout.args.AdjustableCategories.args.CurrentZone", Header = "Tabs" },
                { Label = L["Selected Zone"], Group = "Layout.args.AdjustableCategories.args.SelectedZone", Header = "Tabs" },
                { Label = L["Search Results"], Group = "Layout.args.AdjustableCategories.args.SearchResults", Header = "Tabs" },
                { Label = L["Tracking Achievements"], Group = "Layout.args.AdjustableCategories.args.TrackingAchievements", Header = "Tabs" },
                { Label = L["Excluded"], Group = "Layout.args.AdjustableCategories.args.Excluded", Header = "Tabs" },
                { Label = L["Uncategorized"], Group = "Layout.args.AdjustableCategories.args.Uncategorized", Header = "Tabs" },
            } },
            { Header = L["Watch List"], Entries = {
                { Group = "Layout.args.AdjustableCategories.args.WatchList", Header = "" },
            } },
            { Header = L["Excluded"], Entries = {
                { Group = "Layout.args.AdjustableCategories.args.Excluded", Header = "" },
            } },
            { Header = L["Tracking Achievements"], Entries = {
                { Group = "Layout.args.AdjustableCategories.args.TrackingAchievements", Header = "" },
            } },
        } },
        { Id = "summary", Name = L["Summary"], Tile = "Summary", Groups = {
            { Header = L["Summary"], Entries = {
                { Group = "Layout.args.Summary.args.Summary" },
                { Path = "Layout.args.Summary.args.MouseWheelPanScalar.args.MouseWheelPanScalar" },
            } },
        } },
        { Id = "achievements", Name = L["Achievements"], Tile = "CompactAchievements", Groups = {
            { Header = L["Style and icons"], Entries = {
                { Group = "Layout.args.Achievements.args.Style.args.Style", Header = "" },
            } },
            { Header = L["Objectives"], Entries = {
                { Group = "Layout.args.Achievements.args.Style.args.Style", Header = "Objectives" },
            } },
            { Header = L["Scrolling"], Entries = {
                { Path = "Layout.args.Achievements.args.Style.args.MouseWheelPanScalar.args.MouseWheelPanScalar" },
            } },
        } },
        { Id = "filters", Name = L["Filtering and sorting"], Tile = "FilteringSorting", Groups = {
            { Header = L["Filters"], Entries = {
                { Path = "General.args.Filters.args.ResetFilters.args.ResetFactionFilter" },
            } },
        } },
        { Id = "search", Name = L["Search"], Tile = "QuickSearch", Groups = {
            { Header = L["Search field"], Entries = {
                { Group = "Layout.args.Search.args.SearchField" },
            } },
            { Header = L["Preview"], Entries = {
                { Group = "Layout.args.Search.args.SearchPreview" },
            } },
            { Header = L["Scrolling"], Entries = {
                { Path = "Layout.args.Search.args.MouseWheelPanScalar.args.MouseWheelPanScalar" },
            } },
        } },
        { Id = "tooltips", Name = L["Tooltips"], Tile = "TooltipAchievements", Groups = {
            { Header = L["Earned By"], Entries = {
                { Group = "Layout.args.Achievements.args.Tooltip.args.Tooltip", Header = "EarnedBy" },
            } },
            { Header = L["Shown in the tooltip"], Entries = {
                { Group = "Layout.args.Achievements.args.Tooltip.args.Tooltip", Header = "AddedInVersion" },
                { Group = "Layout.args.Achievements.args.Tooltip.args.Tooltip", Header = "Rewards" },
                { Group = "Layout.args.Achievements.args.Tooltip.args.Tooltip", Header = "PartOfAChain" },
                { Group = "Layout.args.Achievements.args.Tooltip.args.Tooltip", Header = "RequiredFor" },
                { Group = "Layout.args.Achievements.args.Tooltip.args.Tooltip", Header = "OtherFaction" },
                { Group = "Layout.args.Achievements.args.Tooltip.args.Tooltip", Header = "ObjectivesProgress" },
            } },
            { Header = L["Most progress"], Entries = {
                { Group = "Layout.args.Achievements.args.Tooltip.args.Tooltip", Header = "MostProgress" },
            } },
            { Header = L["Temporarily obtainable"], Entries = {
                { Group = "Layout.args.Achievements.args.TemporarilyObtainable.args.TemporarilyObtainable" },
                { Group = "Layout.args.Achievements.args.TemporarilyObtainable.args.StartTimeAndEndTime" },
            } },
            { Header = L["Achievement points tooltip"], Entries = {
                { Group = "Layout.args.Header.args.Tooltip" },
                { Path = "Layout.args.Header.args.Tooltip.args.SortPriority.args.Priority1", Label = L["Sort 1"] },
                { Path = "Layout.args.Header.args.Tooltip.args.SortPriority.args.Reverse1", Label = L["Reverse"], Indent = 1 },
                { Path = "Layout.args.Header.args.Tooltip.args.SortPriority.args.Priority2", Label = L["Sort 2"] },
                { Path = "Layout.args.Header.args.Tooltip.args.SortPriority.args.Reverse2", Label = L["Reverse"], Indent = 1 },
                { Path = "Layout.args.Header.args.Tooltip.args.SortPriority.args.Priority3", Label = L["Sort 3"] },
                { Path = "Layout.args.Header.args.Tooltip.args.SortPriority.args.Reverse3", Label = L["Reverse"], Indent = 1 },
                { Path = "Layout.args.Header.args.Tooltip.args.SortPriority.args.Priority4", Label = L["Sort 4"] },
                { Path = "Layout.args.Header.args.Tooltip.args.SortPriority.args.Reverse4", Label = L["Reverse"], Indent = 1 },
                { Path = "Layout.args.Header.args.Tooltip.args.SortPriority.args.Priority5", Label = L["Sort 5"] },
                { Path = "Layout.args.Header.args.Tooltip.args.SortPriority.args.Reverse5", Label = L["Reverse"], Indent = 1 },
            } },
        } },
        { Id = "rightclick", Name = L["Right-click menu"], Tile = "RightClickMenu", Groups = {
            { Header = L["Button"], Entries = {
                { Group = "Layout.args.RightClickMenu.args.Button" },
            } },
            { Header = L["Wowhead link"], Entries = {
                { Group = "Layout.args.RightClickMenu.args.Wowhead" },
            } },
        } },
        { Id = "popout", Name = L["Pop Out"], Groups = {
            { Header = L["Pop Outs"], Entries = {
                { Group = "Layout.args.Popout.args.General" },
            } },
            { Header = L["Buttons"], Entries = {
                { Group = "Layout.args.Popout.args.Buttons" },
            } },
            { Header = L["Appearance"], Entries = {
                { Group = "Layout.args.Popout.args.Appearance" },
            } },
        } },
        { Id = "rewards", Name = L["Reward preview"], Groups = {
            { Header = L["Reward preview"], Entries = {
                { Group = "Layout.args.Achievements.args.Style.args.Style", Header = "RewardPreview" },
            } },
        } },
        { Id = "guides", Name = L["Achievement guides"], ChangedIn = "104.0", Groups = {
            { Header = L["Where guides show"], Entries = {
                { Group = "Layout.args.Achievements.args.Style.args.Style", Header = "Guide" },
            } },
        } },
        { Id = "calendar", Name = L["Calendar"], Tile = "Calendar", Groups = {
            { Header = L["Calendar"], Entries = {
                { Group = "Layout.args.Calendar.args.General" },
                { Group = "Layout.args.Calendar.args.Weekdays" },
                { Group = "Layout.args.Calendar.args.SideFrameMouseWheelPanScalar" },
            } },
        } },
        { Id = "maps", Name = L["World map and minimap"], Tile = "WorldMapButton", Groups = {
            { Header = L["World map"], Entries = {
                { Group = "General.args.Icon.args.WorldMap" },
            } },
            { Header = L["Minimap"], Entries = {
                { Group = "General.args.Icon.args.Minimap" },
            } },
        } },
        { Id = "criteria", Name = L["Criteria on units"], Groups = {
            { Header = L["Unit tooltips"], Entries = {
                { Group = "Layout.args.Criteria.args.Tooltip", Header = "" },
            } },
            { Header = L["Show criteria if"], Entries = {
                { Group = "Layout.args.Criteria.args.Tooltip", Header = "ShowCriteriaIf", Parent = "Layout.args.Criteria.args.Tooltip.args.ShowCriteria" },
            } },
        } },
        { Id = "events", Name = L["Event reminders"], Tile = "EventReminder", Groups = {
            { Header = L["Reminders"], Entries = {
                { Group = "EventReminders.args.General.args.Style" },
            } },
            { Header = L["Time display"], Entries = {
                { Group = "EventReminders.args.General.args.TimeDisplay" },
            } },
            { Header = L["Pop ups for active events"], Kind = "Grid", Chain = true, Columns = { L["Show"], L["In instances"], L["Only with a time"] }, Rows = {
                { Label = L["On login"], Group = "EventReminders.args.PopUps.args.ActiveEvents.args.OnLogin" },
                { Label = L["On reload"], Group = "EventReminders.args.PopUps.args.ActiveEvents.args.OnReload" },
                { Label = L["When an event starts"], Group = "EventReminders.args.PopUps.args.ActiveEvents.args.OnEventStart" },
            } },
            { Header = L["Pop ups for upcoming calendar events"], Kind = "Grid", Chain = true, Columns = { L["Show"], L["In instances"] }, Rows = {
                { Label = L["On login"], Group = "EventReminders.args.PopUps.args.UpcomingCalendarEvents.args.OnLogin" },
                { Label = L["On reload"], Group = "EventReminders.args.PopUps.args.UpcomingCalendarEvents.args.OnReload" },
                { Label = L["When an event starts"], Group = "EventReminders.args.PopUps.args.UpcomingCalendarEvents.args.OnEventStart" },
            } },
            { Header = L["Pop up position"], Entries = {
                { Group = "EventReminders.args.PopUps.args.Location", Button = L["Show"] },
            } },
            { Header = L["Pop up behaviour"], Entries = {
                { Group = "EventReminders.args.PopUps.args.Other" },
            } },
            { Header = L["Chat messages for active events"], Kind = "Grid", Chain = true, Columns = { L["Show"], L["In instances"], L["Only with a time"] }, Rows = {
                { Label = L["On login"], Group = "EventReminders.args.ChatMessages.args.ActiveEvents.args.OnLogin" },
                { Label = L["On reload"], Group = "EventReminders.args.ChatMessages.args.ActiveEvents.args.OnReload" },
                { Label = L["When an event starts"], Group = "EventReminders.args.ChatMessages.args.ActiveEvents.args.OnEventStart" },
            } },
            { Header = L["Chat messages for upcoming calendar events"], Kind = "Grid", Chain = true, Columns = { L["Show"], L["In instances"] }, Rows = {
                { Label = L["On login"], Group = "EventReminders.args.ChatMessages.args.UpcomingCalendarEvents.args.OnLogin" },
                { Label = L["On reload"], Group = "EventReminders.args.ChatMessages.args.UpcomingCalendarEvents.args.OnReload" },
                { Label = L["When an event starts"], Group = "EventReminders.args.ChatMessages.args.UpcomingCalendarEvents.args.OnEventStart" },
            } },
            { Header = L["Timing"], Entries = {
                { Group = "EventReminders.args.General.args.Other" },
            } },
            { Header = L["Date and time format"], Entries = {
                { Group = "EventReminders.args.DateTimeFormat.args.StartTimeAndEndTime" },
            } },
        } },
        { Id = "eventlist", Name = L["Reminder events"], ChangedIn = "104.0", Groups = {
            { Header = L["Holidays"], AllNone = L["All holidays"], Entries = {
                { Group = "EventReminders.args.CalendarEvents.args.Holidays" },
            } },
            { Header = L["Other calendar events"], AllNone = L["All other calendar events"], Entries = {
                { Group = "EventReminders.args.CalendarEvents.args.Other", Retail = true },
            } },
            { Header = L["World events: Midnight"], Entries = {
                { Families = "EventReminders.args.WorldEvents.args.EXPANSION_NAME11", Retail = true },
            } },
            { Header = L["World events: The War Within"], Entries = {
                { Families = "EventReminders.args.WorldEvents.args.EXPANSION_NAME10", Retail = true },
            } },
            { Header = L["World events: Dragonflight"], Entries = {
                { Families = "EventReminders.args.WorldEvents.args.EXPANSION_NAME9", Retail = true },
            } },
            { Header = L["World events: Shadowlands"], Entries = {
                { Families = "EventReminders.args.WorldEvents.args.EXPANSION_NAME8", Retail = true },
            } },
            { Header = L["World events: Battle for Azeroth"], Entries = {
                { Families = "EventReminders.args.WorldEvents.args.EXPANSION_NAME7", Retail = true },
            } },
            { Header = L["World events: Legion"], Entries = {
                { Families = "EventReminders.args.WorldEvents.args.EXPANSION_NAME6", Retail = true },
            } },
        } },
        { Id = "keys", Name = L["Keys and clicks"], Groups = {
            { Header = L["Click modifiers"], Entries = {
                { Group = "General.args.KeyBinding.args.General.args.Modifiers" },
            } },
            { Header = L["Blizzard's tabs"], Entries = {
                { Group = "General.args.KeyBinding.args.Keybindings.args.Tabs", Header = "Blizzard_AchievementUIHeader" },
            } },
            { Header = L["This addon's tabs"], Entries = {
                { Group = "General.args.KeyBinding.args.Keybindings.args.Tabs", Header = "Krowi_AchievementFilterHeader" },
            } },
            { Header = L["Categories"], Entries = {
                { Group = "General.args.KeyBinding.args.Keybindings.args.Custom" },
            } },
        } },
        { Id = "plugins", Name = L["Other addons"], Groups = {
            { Kind = "EachChild", Group = "Plugins" },
        } },
        { Id = "profiles", Name = L["Profiles"], Groups = {
            { Header = L["Settings profile"], Kind = "Profiles", Database = "Options" },
            { Header = L["Filters profile"], Kind = "Profiles", Database = "Filters" },
        } },
        { Id = "advanced", Name = L["Advanced"], Groups = {
            { Header = L["Experimental"], Entries = {
                { Group = "General.args.Experimental.args.Experimental" },
            } },
            { Header = L["Debug"], Entries = {
                { Path = "General.args.Debug.args.Debug.args.EnableDebugInfo" },
                { Path = "General.args.Debug.args.Debug.args.ScreenshotMode" },
                { Path = "General.args.Debug.args.Debug.args.EnableTraceInfo", ShowIf = "General.args.Debug.args.Debug.args.EnableDebugInfo" },
                { Path = "General.args.Debug.args.Debug.args.ExportCriteria", ShowIf = "General.args.Debug.args.Debug.args.EnableDebugInfo" },
                { Path = "General.args.Debug.args.Debug.args.ShowPlaceholdersFilter", ShowIf = "General.args.Debug.args.Debug.args.EnableDebugInfo" },
                { Path = "General.args.Debug.args.Debug.args.ExportMissingAchievements", ShowIf = "General.args.Debug.args.Debug.args.EnableDebugInfo" },
                { Path = "General.args.Debug.args.Debug.args.PrintMapInfo", ShowIf = "General.args.Debug.args.Debug.args.EnableDebugInfo" },
                { Path = "General.args.Debug.args.Debug.args.ExportRemovedAchievements", ShowIf = "General.args.Debug.args.Debug.args.EnableDebugInfo" },
                { Path = "General.args.Debug.args.Debug.args.PrintMapInfoWithoutReload", ShowIf = "General.args.Debug.args.Debug.args.EnableDebugInfo" },
                { Path = "General.args.Debug.args.Debug.args.Experimental", ShowIf = "General.args.Debug.args.Debug.args.EnableDebugInfo" },
                { Path = "General.args.Debug.args.Debug.args.EnableTaintDiagnostics" },
                { Path = "General.args.Debug.args.Debug.args.ExportTaintDiagnostics" },
                { Path = "General.args.Debug.args.Debug.args.MapVerifier", ShowIf = "General.args.Debug.args.Debug.args.EnableDebugInfo" },
            } },
        } },
        { Id = "about", Name = L["About"], Groups = {
            { Header = L["Links"], Entries = {
                { Path = "General.args.Info.args.General.args.Discord", Button = L["Discord"] },
                { Path = "General.args.Info.args.Sources.args.CurseForge", Button = L["CurseForge"] },
                { Path = "General.args.Info.args.Sources.args.Wago", Button = L["Wago"] },
            } },
            { Header = L["Special thanks"], Entries = {
                { Group = "Credits.args.SpecialThanks" },
            } },
            { Header = L["Donations"], Entries = {
                { Group = "Credits.args.Donations" },
            } },
            { Header = L["Translations"], Entries = {
                { Group = "Credits.args.Localizations" },
            } },
        } },
    },
}