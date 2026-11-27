-- [[ Namespaces ]] --
local _, addon = ...
local options = addon.Options
options.Layout = {}
local layout = options.Layout
tinsert(options.OptionsTables, layout)

local OrderPP = addon.InjectOptions.AutoOrderPlusPlus
local AdjustedWidth = addon.InjectOptions.AdjustedWidth

function layout.RegisterOptionsTable()
    options.Registry.Register(addon.Metadata.Prefix .. "_Layout", options.OptionsTable.args.Layout)
end

function layout.PostLoad()
    if addon.Settings.Get("calendar.firstWeekDay") < 1 or addon.Settings.Get("calendar.firstWeekDay") > 7 then
        if not C_AddOns.IsAddOnLoaded("Blizzard_Calendar") then -- This is to make sure we get the 1st day of the week correct
            C_AddOns.LoadAddOn("Blizzard_Calendar") -- breaks Blizzard_Calendar
        end
        addon.Settings.Set("calendar.firstWeekDay", CALENDAR_FIRST_WEEKDAY)
    end

    options.SetMaxNumberOfSearchPreviews()
end

local RefreshOptions -- Assigned at the end of the file
-- After an options profile switch, copy or reset (Options/Options.lua, Load)
function layout.OnProfileChanged()
    RefreshOptions()
end

-- [[ InjectDynamicFixedWatchListOptions ]]
local function DrawSubCategories(reset, load) -- Rebuilds a special category tree from its saved achievements
    if addon.Gui.SelectedTab == nil then
        return
    end

    -- Reset all
    reset()
    KrowiAF_CategoriesFrame:Update(true)
    KrowiAF_AchievementsFrame:ForceUpdate()

    -- Draw again
    load()
end

local function DrawWatchListSubCategories()
    DrawSubCategories(addon.ResetWatchListCategories, addon.Data.SavedData.AchievementData.LoadWatchedAchievements)
end

local function DrawExcludedSubCategories()
    DrawSubCategories(addon.ResetExcludedCategories, addon.SpecialCategories.LoadExcludedAchievements)
end

local function DrawTrackingAchievementsSubCategories()
    DrawSubCategories(addon.ResetTrackingAchievementsCategories, addon.SpecialCategories.LoadTrackingAchievements)
end

local function WatchListClearAllFunc()
    if not addon.SpecialCategories.WatchList then
        C_AddOns.LoadAddOn("Blizzard_AchievementUI")
    end
    addon.ResetWatchListCategories()
    if addon.Gui.SelectedTab ~= nil then -- If nil, not yet loaded
        KrowiAF_CategoriesFrame:Update(true)
        KrowiAF_AchievementsFrame:ForceUpdate()
    end
    addon.Data.SavedData.AchievementData:ClearWatchedAchievements()
end

local function InjectDynamicFixedWatchListOptions()
    if addon.InjectOptions:TableExists("Layout.args.AdjustableCategories.args.WatchList.args.ShowWatchedSubCategories") then
        return
    end

    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.WatchList.args", "ShowWatchedSubCategories", addon.Settings.Row("categories.watchList.showSubCategories", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = addon.L["Show Sub Categories"],
        desc = addon.L["Show Sub Categories Desc"]:K_ReplaceVars(addon.L["Watch List"]):KAF_AddDefaultValueText("categories.watchList.showSubCategories"),
        set = function(_, value)
            addon.Settings.Set("categories.watchList.showSubCategories", value)
            DrawWatchListSubCategories()
        end
    }))
    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.WatchList.args", "Blank1", {
        order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""
    })
    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.WatchList.args", "ClearAll", {
        order = OrderPP(), type = "execute", width = AdjustedWidth(),
        name = addon.L["Clear all"],
        desc = addon.L["Clear all Desc"],
        func = WatchListClearAllFunc
    })
    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.WatchList.args", "IgnoreFilters", addon.Settings.Row("categories.watchList.ignoreFilters", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = addon.L["Ignore Filters"],
        desc = addon.L["Ignore Filters Desc"]:K_ReplaceVars(addon.L["Watch List"]):KAF_AddDefaultValueText("categories.watchList.ignoreFilters"),
        set = function(_, value)
            addon.Settings.Set("categories.watchList.ignoreFilters", value)
            DrawWatchListSubCategories()
        end
    }))
    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.WatchList.args", "Blank2", {
        order = OrderPP(), type = "description", width = AdjustedWidth(2), name = ""
    })
    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.WatchList.args", "CharacterSpecific", addon.Settings.Row("categories.watchList.characterSpecific", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = addon.L["Character Specific"],
        desc = addon.L["Character Specific Desc"]:K_ReplaceVars(addon.L["Watch List"]):KAF_AddDefaultValueText("categories.watchList.characterSpecific"),
        set = function (_, value)
            addon.Settings.Set("categories.watchList.characterSpecific", value)
            addon.Data.SavedData.AchievementData.ReloadWatchedAchievements()
        end
    }))
    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.WatchList.args", "Blank3", {
        order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""
    })
    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.WatchList.args", "CopyAccountWideToCharacter", {
        order = OrderPP(), type = "execute", width = AdjustedWidth(),
        name = addon.L["Copy Account Wide to Character"],
        desc = addon.L["Copy Account Wide to Character Desc"]:K_ReplaceVars(addon.L["Watch List"]),
        func = addon.Data.SavedData.AchievementData.CopyAccountWideToCharacter,
        disabled = function() return not addon.Settings.Get("categories.watchList.characterSpecific"); end
    })
end

-- [[ InjectMoreDynamicTrackingAchievementsOptions ]]
local function InjectMoreDynamicTrackingAchievementsOptions()
    if addon.InjectOptions:TableExists("Layout.args.AdjustableCategories.args.TrackingAchievements.args.LoadTrackingAchievements") then
        return
    end

    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.TrackingAchievements.args", "LoadTrackingAchievements", addon.Settings.Row("categories.trackingAchievements.doLoad", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(2),
        name = addon.L["Load Tracking Achievements"],
        desc = addon.L["Load Tracking Achievements Desc"]:KAF_AddDefaultValueText("categories.trackingAchievements.doLoad"):K_AddReloadRequired(),
    }))

    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.TrackingAchievements.args", "ShowTrackingSubCategories", addon.Settings.Row("categories.trackingAchievements.showSubCategories", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = addon.L["Show Sub Categories"],
        desc = addon.L["Show Sub Categories Desc"]:K_ReplaceVars(addon.L["Tracking Achievements"]):KAF_AddDefaultValueText("categories.trackingAchievements.showSubCategories"),
        set = function(_, value)
            addon.Settings.Set("categories.trackingAchievements.showSubCategories", value)
            DrawTrackingAchievementsSubCategories()
        end
    }))
end

-- [[ InjectMoreDynamicExcludedOptions ]]
local function ShowExcludedCategory()
    if addon.Gui.SelectedTab == nil then -- If nil, not yet loaded
        return
    end
    if addon.Settings.Get("categories.excluded.show") then
        addon.SpecialCategories.LoadExcludedAchievements()
    else
        addon.ResetExcludedCategories()
    end
    KrowiAF_CategoriesFrame:Update(true)
    KrowiAF_AchievementsFrame:ForceUpdate()
end

local function ExcludedIncludeAllFunc()
    if not addon.SpecialCategories.Excluded then
        C_AddOns.LoadAddOn("Blizzard_AchievementUI")
    end

    addon.ResetExcludedCategories()
    if addon.Gui.SelectedTab == nil then -- If nil, not yet loaded
        KrowiAF_SavedData.ExcludedAchievements = nil
        return
    end
    if KrowiAF_SavedData.ExcludedAchievements then
        for id, _ in next, KrowiAF_SavedData.ExcludedAchievements do
            addon.Data.Achievements[id]:Include()
        end
    end
    KrowiAF_CategoriesFrame:Update(true)
    KrowiAF_AchievementsFrame:ForceUpdate()
    KrowiAF_SavedData.ExcludedAchievements = nil
end

local function InjectMoreDynamicExcludedOptions()
    if addon.InjectOptions:TableExists("Layout.args.AdjustableCategories.args.Excluded.args.ShowExcludedSubCategories") then
        return
    end

    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.Excluded.args", "Show", addon.Settings.Row("categories.excluded.show", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = addon.L["Show Excluded Category"],
        desc = addon.L["Show Excluded Category Desc"]:K_ReplaceVars(addon.L["Excluded"]):KAF_AddDefaultValueText("categories.excluded.show"),
        set = function(_, value)
            addon.Settings.Set("categories.excluded.show", value)
            ShowExcludedCategory()
        end
    }))
    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.Excluded.args", "Blank1", {
        order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""
    })
    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.Excluded.args", "IncludeAll", {
        order = OrderPP(), type = "execute", width = AdjustedWidth(),
        name = addon.L["Include all"],
        desc = addon.L["Include all Desc"],
        func = ExcludedIncludeAllFunc
    })
    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.Excluded.args", "ShowExcludedSubCategories", addon.Settings.Row("categories.excluded.showSubCategories", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = addon.L["Show Sub Categories"],
        desc = addon.L["Show Sub Categories Desc"]:K_ReplaceVars(addon.L["Excluded"]):KAF_AddDefaultValueText("categories.excluded.showSubCategories"),
        set = function()
            addon.Settings.Set("categories.excluded.showSubCategories", not addon.Settings.Get("categories.excluded.showSubCategories"))
            DrawExcludedSubCategories()
        end,
        disabled = function() return not addon.Settings.Get("categories.excluded.show"); end
    }))
end

-- [[ InjectDynamicAdjustableCategoryOptions ]]
local function InjectDynamicFixedAdjustableCategoriesOptions(category)
    if category == "WatchList" then
        InjectDynamicFixedWatchListOptions()
    elseif category == "TrackingAchievements" then
        InjectMoreDynamicTrackingAchievementsOptions()
    elseif category == "Excluded" then
        InjectMoreDynamicExcludedOptions()
    end
end

function layout.InjectDynamicAdjustableCategoryOptions(category, categoryDisplayName, tabIndex, tab, tabDisplayName, defaultValue)
    addon.Settings.RegisterEntryDefault("categories.shownOnTab", category, tabIndex, defaultValue)

    if not addon.InjectOptions:TableExists("Layout.args.AdjustableCategories.args." .. category) then
        addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args", category, {
            order = OrderPP(), type = "group",
            name = categoryDisplayName,
            args = {}
        })
    end

    InjectDynamicFixedAdjustableCategoriesOptions(category)

    if not addon.InjectOptions:TableExists("Layout.args.AdjustableCategories.args." .. category .. ".args.Tabs") then
        addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args." .. category .. ".args", "Tabs", {
            order = OrderPP(), type = "header",
            name = addon.L["Tabs"]
        })
    end

    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args." .. category .. ".args", tab, {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = tabDisplayName,
        desc = addon.Util.L["Requires a reload"]:KAF_AddDefaultValueText("categories.shownOnTab", nil, category, tabIndex),
        get = function() return addon.Settings.GetEntry("categories.shownOnTab", category, tabIndex) end,
        set = function(_, value) addon.Settings.SetEntry("categories.shownOnTab", category, tabIndex, value) end
    })
end

-- The dropdowns' choices, each text under the number it saves (addon.Enum, Settings/Enum.lua); shown in number
-- order unless a row gives its own sorting
local enum = addon.Enum

local achievementPointsDisplays = {
    [enum.PointsFormat.Account] = addon.L["Account wide (default)"],
    [enum.PointsFormat.CharacterAndAccount] = addon.L["Character / Account wide"],
    [enum.PointsFormat.Character] = addon.L["Character only"]
}

local criteriaBehaviour = {
    [enum.CriteriaBehaviour.Overflow] = addon.L["Overflow"],
    [enum.CriteriaBehaviour.Truncate] = addon.L["Truncate"],
    [enum.CriteriaBehaviour.Flexible] = addon.L["Flexible"]
}

local guideWaypointProviders = {
    [enum.GuideWaypointProvider.Both] = addon.L["Map pin and TomTom"],
    [enum.GuideWaypointProvider.MapPin] = addon.L["Map pin"],
    [enum.GuideWaypointProvider.TomTom] = "TomTom"
}

local guideActionStyles = {
    [enum.GuideActionStyle.Icons] = addon.L["Icons"],
    [enum.GuideActionStyle.Links] = addon.L["Text links"]
}

local function MovableSwitchMovableSet(_, value)
    if addon.Settings.Get("window.movable") == value then return; end
    addon.Settings.Set("window.movable", value)
    if addon.Settings.Get("window.movable") then
        addon.MakeWindowMovable()
    else
        addon.MakeWindowStatic()
    end
end

local function MovableAchievementWindowRememberLastPositionSet(_, value)
    if addon.Settings.Get("window.rememberPosition.achievementWindow") == value then return; end
    addon.Settings.Set("window.rememberPosition.achievementWindow", value)
    if not addon.Settings.Get("window.rememberPosition.achievementWindow") then
        if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
            C_AddOns.LoadAddOn("Blizzard_AchievementUI")
        end
        AchievementFrame:ResetPosition()
    end
end

local function MovableCalendarRememberLastPositionSet(_, value)
    if addon.Settings.Get("window.rememberPosition.calendar") == value then return; end
    addon.Settings.Set("window.rememberPosition.calendar", value)
    if not addon.Settings.Get("window.rememberPosition.calendar") then
        if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
            C_AddOns.LoadAddOn("Blizzard_AchievementUI")
        end
        KrowiAF_AchievementCalendarFrame:ResetPosition()
    end
end

local function MovableDataManagerRememberLastPositionSet(_, value)
    if addon.Settings.Get("window.rememberPosition.dataManager") == value then return; end
    addon.Settings.Set("window.rememberPosition.dataManager", value)
    if not addon.Settings.Get("window.rememberPosition.dataManager") then
        if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
            C_AddOns.LoadAddOn("Blizzard_AchievementUI")
        end
        KrowiAF_DataManagerFrame:ResetPosition()
    end
end

local function OffsetsCategoriesFrameWidthSet(_, value)
    if addon.Settings.Get("window.categoriesFrameWidthOffset") == value then return; end
    addon.Settings.Set("window.categoriesFrameWidthOffset", value)
    if addon.Gui.SelectedTab then
        addon.Gui:SetAchievementFrameWidth()
    end
end

local function OffsetsAchievementsFrameWidthSet(_, value)
    if addon.Settings.Get("window.achievementsFrameWidthOffset") == value then return; end
    addon.Settings.Set("window.achievementsFrameWidthOffset", value)
    if addon.Gui.SelectedTab then
        addon.Gui:SetAchievementFrameWidth()
        if addon.Gui.SelectedTab.SelectedCategory.IsSummary then
            KrowiAF_SummaryFrame:Update()
        end
    end
end

local function SetMaxNumberOfSearchPreviews()
    local numberOfSearchPreviews = options.SetMaxNumberOfSearchPreviews()
    if numberOfSearchPreviews.get() > numberOfSearchPreviews.max then
        numberOfSearchPreviews.set(nil, numberOfSearchPreviews.max)
    end
end

local function OffsetsAchievementFrameHeightSet(_, value)
    if addon.Settings.Get("window.achievementFrameHeightOffset") == value then return; end
    addon.Settings.Set("window.achievementFrameHeightOffset", value)
    SetMaxNumberOfSearchPreviews()
    if addon.Gui.SelectedTab then
        addon.Gui:SetAchievementFrameHeight()
    end
end

local function CenterHeaderSet(_, value)
    addon.Settings.Set("window.centerHeader", value)
    addon.Gui.AchievementFrameHeader:AnchorHeader()
end

local function BrowserHistoryTrackSet(_, value)
    addon.Settings.Set("window.trackBrowsingHistory", value)
    if not KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton or not KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButton then
        return
    end

    KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton:Hide()
    KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButton:Hide()
    if value then
        KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton:Show()
        KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButton:Show()
    end
end

local function CalendarButtonOffsetSet()
    if not KrowiAF_AchievementFrameCalendarButton then
        return

    end
    KrowiAF_AchievementFrameCalendarButton:SetPoint("LEFT", AchievementFrame.Header.PointBorder, "RIGHT", addon.Settings.Get("window.calendarButton.offsetX"), addon.Settings.Get("window.calendarButton.offsetY"))
end

local function CalendarButtonOffsetXSet(_, value)
    if addon.Settings.Get("window.calendarButton.offsetX") == value then return; end
    addon.Settings.Set("window.calendarButton.offsetX", value)
    CalendarButtonOffsetSet()
end

local function CalendarButtonOffsetYSet(_, value)
    if addon.Settings.Get("window.calendarButton.offsetY") == value then return; end
    addon.Settings.Set("window.calendarButton.offsetY", value)
    CalendarButtonOffsetSet()
end

local function SetSearchBoxMouseWheelPanScalar(_, value)
    if addon.Settings.Get("searchBox.mouseWheelPanScalar") == value then return; end
    addon.Settings.Set("searchBox.mouseWheelPanScalar", value)
    if KrowiAF_SearchBoxFrame.ResultsFrame.ScrollBox then
        KrowiAF_SearchBoxFrame.ResultsFrame.ScrollBox.wheelPanScalar = value
    end
    if KrowiAF_SearchBoxFrame.ResultsFrame.ScrollBar then
        KrowiAF_SearchBoxFrame.ResultsFrame.ScrollBar.wheelPanScalar = value
    end
end

local function SetSummaryMouseWheelPanScalar(_, value)
    if addon.Settings.Get("summary.mouseWheelPanScalar") == value then return; end
    addon.Settings.Set("summary.mouseWheelPanScalar", value)
    if KrowiAF_SummaryFrame.AchievementsFrame.ScrollBox then
        KrowiAF_SummaryFrame.AchievementsFrame.ScrollBox.wheelPanScalar = value
    end
    if KrowiAF_SummaryFrame.AchievementsFrame.ScrollBar then
        KrowiAF_SummaryFrame.AchievementsFrame.ScrollBar.wheelPanScalar = value
    end
end

local function SetCategoryIndentation(_, value)
    if addon.Settings.Get("categories.indentation") == value then return; end
    addon.Settings.Set("categories.indentation", value)
    if KrowiAF_CategoriesFrame.ScrollView then
        KrowiAF_CategoriesFrame.ScrollView:Layout()
    end
end

local function SetCategoriesMouseWheelPanScalar(_, value)
    if addon.Settings.Get("categories.mouseWheelPanScalar") == value then return; end
    addon.Settings.Set("categories.mouseWheelPanScalar", value)
    if KrowiAF_CategoriesFrame.ScrollBox then
        KrowiAF_CategoriesFrame.ScrollBox.wheelPanScalar = value
    end
    if KrowiAF_CategoriesFrame.ScrollBar then
        KrowiAF_CategoriesFrame.ScrollBar.wheelPanScalar = value
    end
end

local function MergeMergeSmallCategoriesThresholdSet(_, value)
    if addon.Settings.Get("categories.mergeSmallThreshold") == value then return; end
    addon.Settings.Set("categories.mergeSmallThreshold", value)
    KrowiAF_CategoriesFrame:Update(true)
end

local function ShowAllianceFactionIconSet(_, value)
    addon.Settings.Set("achievements.showAllianceFactionIcon", value)
    if not KrowiAF_AchievementsFrame then
        return
    end
    KrowiAF_SummaryFrame:UpdateAchievementsOnNextShow()
    KrowiAF_AchievementsFrame:ForceUpdate()
end

local function ShowHordeFactionIconSet(_, value)
    addon.Settings.Set("achievements.showHordeFactionIcon", value)
    if not KrowiAF_AchievementsFrame then
        return
    end
    KrowiAF_SummaryFrame:UpdateAchievementsOnNextShow()
    KrowiAF_AchievementsFrame:ForceUpdate()
end

local function FactionIconAlphaSet(_, value)
    addon.Settings.Set("achievements.factionIconAlpha", value)
    if not KrowiAF_AchievementsFrame then
        return
    end
    KrowiAF_SummaryFrame:UpdateAchievementsOnNextShow()
    KrowiAF_AchievementsFrame:ForceUpdate()
end

local function ShowTemporarilyObtainableIconSet(_, value)
    addon.Settings.Set("achievements.showTemporarilyObtainableIcon", value)
    if not KrowiAF_AchievementsFrame then
        return
    end
    KrowiAF_SummaryFrame:UpdateAchievementsOnNextShow()
    KrowiAF_AchievementsFrame:ForceUpdate()
end

local function TemporarilyObtainableHeaderColorsSet(_, value)
    addon.Settings.Set("achievements.temporarilyObtainableHeaderColors", value)
    if not KrowiAF_AchievementsFrame then
        return
    end
    KrowiAF_SummaryFrame:UpdateAchievementsOnNextShow()
    KrowiAF_AchievementsFrame:ForceUpdate()
end

local function ShowWarbandIconSet(_, value)
    addon.Settings.Set("achievements.showWarbandIcon", value)
    if not KrowiAF_AchievementsFrame then
        return
    end
    KrowiAF_SummaryFrame:UpdateAchievementsOnNextShow()
    KrowiAF_AchievementsFrame:ForceUpdate()
end

local function WarbandHeaderColorSet(_, value)
    addon.Settings.Set("achievements.warbandHeaderColor", value)
    if not KrowiAF_AchievementsFrame then
        return
    end
    KrowiAF_SummaryFrame:UpdateAchievementsOnNextShow()
    KrowiAF_AchievementsFrame:ForceUpdate()
end

-- A guide option that changes what is drawn: the setter redraws an open guide panel and the achievement list (the row
-- icon and the block under the selected achievement)
local function GuideOptionSetter(key)
    return function(_, value)
        addon.Settings.Set("guides." .. key:sub(1, 1):lower() .. key:sub(2), value) -- "ExpandedRow" is guides.expandedRow
        local panel = addon.Gui.Guide.Panel
        if panel.Frame and panel.Frame:IsShown() then
            panel:Render()
        end
        if not KrowiAF_AchievementsFrame then
            return
        end
        KrowiAF_SummaryFrame:UpdateAchievementsOnNextShow()
        KrowiAF_AchievementsFrame:ForceUpdate()
    end
end

local function SetAchievementsMouseWheelPanScalar(_, value)
    if addon.Settings.Get("achievements.mouseWheelPanScalar") == value then return; end
    addon.Settings.Set("achievements.mouseWheelPanScalar", value)
    if not KrowiAF_AchievementsFrame then
        return
    end
    if KrowiAF_AchievementsFrame.ScrollBox then
        KrowiAF_AchievementsFrame.ScrollBox.wheelPanScalar = value
    end
    if KrowiAF_AchievementsFrame.ScrollBar then
        KrowiAF_AchievementsFrame.ScrollBar.wheelPanScalar = value
    end
end

local startTimeAndEndTimeDateTimeFormats, startTimeAndEndTimeDateTimeValues = {}, {}

local function AddFormat(formats, values, format)
    tinsert(formats, format)
    tinsert(values, date(format, time()))
end

local function AddStartTimeAndEndTimeFormat(format)
    AddFormat(startTimeAndEndTimeDateTimeFormats, startTimeAndEndTimeDateTimeValues, format)
end

AddStartTimeAndEndTimeFormat(addon.Settings.Declaration("tooltips.temporarilyObtainable.dateTimeFormat.startTimeAndEndTime").Default)
AddStartTimeAndEndTimeFormat(addon.L["%d/%m/%Y %I:%M %p"])
AddStartTimeAndEndTimeFormat(addon.L["%m/%d/%Y %R"])
AddStartTimeAndEndTimeFormat(addon.L["%m/%d/%Y %I:%M %p"])
AddStartTimeAndEndTimeFormat(addon.L["%Y/%m/%d %R"])
AddStartTimeAndEndTimeFormat(addon.L["%Y/%m/%d %I:%M %p"])
AddStartTimeAndEndTimeFormat(addon.L["%c"])
tinsert(startTimeAndEndTimeDateTimeValues, "Custom")
tinsert(startTimeAndEndTimeDateTimeFormats, addon.L["%m/%d/%Y %R"])

local function StartTimeAndEndTimePresetsGet()
    for i, format in next, startTimeAndEndTimeDateTimeFormats do
        if format == addon.Settings.Get("tooltips.temporarilyObtainable.dateTimeFormat.startTimeAndEndTime") then
            return i
        end
    end
    return #startTimeAndEndTimeDateTimeFormats
end

local function StartTimeAndEndTimeCustomSet(_, value)
    if addon.Settings.Get("tooltips.temporarilyObtainable.dateTimeFormat.startTimeAndEndTime") == value then return; end
    addon.Settings.Set("tooltips.temporarilyObtainable.dateTimeFormat.startTimeAndEndTime", value)
end

local function SetCalendarMouseWheelPanScalar(_, value)
    if addon.Settings.Get("calendar.mouseWheelPanScalar") == value then return; end
    addon.Settings.Set("calendar.mouseWheelPanScalar", value)
    if KrowiAF_AchievementCalendarFrame.SideFrame.AchievementsFrame.ScrollBox then
        KrowiAF_AchievementCalendarFrame.SideFrame.AchievementsFrame.ScrollBox.wheelPanScalar = value
    end
    if KrowiAF_AchievementCalendarFrame.SideFrame.AchievementsFrame.ScrollBar then
        KrowiAF_AchievementCalendarFrame.SideFrame.AchievementsFrame.ScrollBar.wheelPanScalar = value
    end
end

local function SetDataManagerMouseWheelPanScalar(_, value)
    if addon.Settings.Get("dataManager.mouseWheelPanScalar") == value then return; end
    addon.Settings.Set("dataManager.mouseWheelPanScalar", value)
    if KrowiAF_DataManagerFrame.CharacterList.ScrollBox then
        KrowiAF_DataManagerFrame.CharacterList.ScrollBox.wheelPanScalar = value
    end
    if KrowiAF_DataManagerFrame.CharacterList.ScrollBar then
        KrowiAF_DataManagerFrame.CharacterList.ScrollBar.wheelPanScalar = value
    end
end

local windowOptions = {
    order = OrderPP(), type = "group",
    name = addon.L["Window"],
    args = {
        Movable = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.L["Movable"],
            args = {
                SwitchMovable = addon.Settings.Row("window.movable", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(2),
                    name = addon.L["Make windows movable"],
                    desc = addon.L["Make windows movable Desc"]:KAF_AddDefaultValueText("window.movable"),
                    set = MovableSwitchMovableSet
                }),
                Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""},
                AchievementWindowRememberLastPosition = addon.Settings.Row("window.rememberPosition.achievementWindow", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(2),
                    name = addon.L["Remember frame position"]:K_ReplaceVars(addon.L["Achievement Window"]),
                    desc = addon.L["Remember frame position Desc"]:K_ReplaceVars(addon.L["Achievement Window"]):KAF_AddDefaultValueText("window.rememberPosition.achievementWindow"),
                    set = MovableAchievementWindowRememberLastPositionSet
                }),
                AchievementWindowResetPosition = {
                    order = OrderPP(), type = "execute", width = AdjustedWidth(),
                    name = addon.L["Reset position"],
                    desc = addon.L["Reset position Desc"]:K_ReplaceVars(addon.L["Achievement Window"]),
                    func = function()
                        if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
                            C_AddOns.LoadAddOn("Blizzard_AchievementUI")
                        end
                        AchievementFrame:ResetPosition()
                    end
                },
                CalendarRememberLastPosition = addon.Settings.Row("window.rememberPosition.calendar", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(2),
                    name = addon.L["Remember frame position"]:K_ReplaceVars(addon.L["Achievement Calendar"]),
                    desc = addon.L["Remember frame position Desc"]:K_ReplaceVars(addon.L["Achievement Calendar"]):KAF_AddDefaultValueText("window.rememberPosition.calendar"),
                    set = MovableCalendarRememberLastPositionSet
                }),
                CalendarResetPosition = {
                    order = OrderPP(), type = "execute", width = AdjustedWidth(),
                    name = addon.L["Reset position"],
                    desc = addon.L["Reset position Desc"]:K_ReplaceVars(addon.L["Achievement Calendar"]),
                    func = function()
                        if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
                            C_AddOns.LoadAddOn("Blizzard_AchievementUI")
                        end
                        KrowiAF_AchievementCalendarFrame:ResetPosition()
                    end
                },
                DataManagerRememberLastPosition = addon.Settings.Row("window.rememberPosition.dataManager", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(2),
                    name = addon.L["Remember frame position"]:K_ReplaceVars(addon.L["Data Manager"]),
                    desc = addon.L["Remember frame position Desc"]:K_ReplaceVars(addon.L["Data Manager"]):KAF_AddDefaultValueText("window.rememberPosition.dataManager"),
                    set = MovableDataManagerRememberLastPositionSet
                }),
                DataManagerResetPosition = {
                    order = OrderPP(), type = "execute", width = AdjustedWidth(),
                    name = addon.L["Reset position"],
                    desc = addon.L["Reset position Desc"]:K_ReplaceVars(addon.L["Data Manager"]),
                    func = function()
                        if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
                            C_AddOns.LoadAddOn("Blizzard_AchievementUI")
                        end
                        KrowiAF_DataManagerFrame:ResetPosition()
                    end
                }
            }
        },
        Offsets = {
            order = OrderPP(), type = "group",
            name = addon.L["Offsets"],
            inline = true,
            args = {
                CategoriesFrameWidth = addon.Settings.Row("window.categoriesFrameWidthOffset", {
                    order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                    name = addon.L["Categories width offset"],
                    desc = addon.L["Categories width offset Desc"]:KAF_InjectAddonName():K_ReplaceVars(string.format(addon.Util.Colors.Yellow, addon.L["Expansions"])):KAF_AddDefaultValueText("window.categoriesFrameWidthOffset"),
                    set = OffsetsCategoriesFrameWidthSet
                }),
                AchievementsFrameWidth = addon.Settings.Row("window.achievementsFrameWidthOffset", {
                    order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                    name = addon.L["Achievements width offset"],
                    desc = addon.L["Achievements width offset Desc"]:KAF_InjectAddonName():K_ReplaceVars(string.format(addon.Util.Colors.Yellow, addon.L["Expansions"])):KAF_AddDefaultValueText("window.achievementsFrameWidthOffset"),
                    set = OffsetsAchievementsFrameWidthSet
                }),
                AchievementFrameHeight = addon.Settings.Row("window.achievementFrameHeightOffset", {
                    order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                    name = addon.L["Achievement window height offset"],
                    desc = addon.L["Achievement window height offset Desc"]:KAF_InjectAddonName():K_ReplaceVars(string.format(addon.Util.Colors.Yellow, addon.L["Expansions"])):KAF_AddDefaultValueText("window.achievementFrameHeightOffset"):K_AddReloadRequired(),
                    set = OffsetsAchievementFrameHeightSet
                })
            }
        }
    }
}

local tabsOptions = {
    order = OrderPP(), type = "group", childGroups = "tab",
    name = addon.L["Tabs"],
    args = {
        General = {
            order = OrderPP(), type = "group",
            name = addon.Util.L["General"],
            args = {
                General = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.Util.L["General"],
                    args = {
                        Spacing = addon.Settings.Row("tabs.spacing", {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Spacing"],
                            desc = addon.L["Spacing Desc"]:KAF_AddDefaultValueText("tabs.spacing"),
                            set = function (_, value)
                                addon.Settings.Set("tabs.spacing", value)
                                addon.Gui:ShowHideTabs()
                            end
                        })
                    }
                }
            }
        },
        Order = {
            order = OrderPP(), type = "group",
            name = addon.L["Order"],
            args = {
                Order = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Order"],
                    args = { --[[ Dynamically build via KrowiAF_RegisterTabOptions ]] }
                },
            }
        },
        Show = {
            order = OrderPP(), type = "group",
            name = addon.L["Show"],
            args = {
                Show = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Show"],
                    args = { --[[ Dynamically build via KrowiAF_RegisterTabOptions ]] }
                },
            }
        }
    }
}

local headerOptions = {
    order = OrderPP(), type = "group",
    name = addon.L["Header"],
    args = {
        General = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.Util.L["General"],
            args = {
                CenterHeader = addon.Settings.Row("window.centerHeader", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.45),
                    name = addon.L["Center header"],
                    desc = addon.L["Center header Desc"]:KAF_AddDefaultValueText("window.centerHeader"),
                    set = CenterHeaderSet
                }),
                AchievementPointsFormat = addon.Settings.Row("window.pointsFormat", {
                    order = OrderPP(), type = "select", width = AdjustedWidth(1.45),
                    name = addon.L["Achievement Points"] .. " - " .. addon.L["Format"],
                    desc = (""):KAF_AddDefaultValueText("window.pointsFormat", achievementPointsDisplays),
                    values = achievementPointsDisplays,
                    set = function (_, value) addon.Settings.Set("window.pointsFormat", value); end
                })
            }
        },
        BrowserHistory = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.L["Achievement browsing history"],
            args = {
                Track = addon.Settings.Row("window.trackBrowsingHistory", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.45),
                    name = addon.L["Track achievement browsing history"],
                    desc = addon.L["Track achievement browsing history Desc"]:KAF_AddDefaultValueText("window.trackBrowsingHistory"),
                    set = BrowserHistoryTrackSet
                })
            }
        },
        CalendarButton = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.L["Calendar button"],
            args = {
                OffsetX = addon.Settings.Row("window.calendarButton.offsetX", {
                    order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                    name = addon.L["Horizontal position"],
                    desc = addon.L["Calendar button horizontal position Desc"]:K_ReplaceVars(addon.L["Calendar button"]):KAF_AddDefaultValueText("window.calendarButton.offsetX"),
                    set = CalendarButtonOffsetXSet
                }),
                OffsetY = addon.Settings.Row("window.calendarButton.offsetY", {
                    order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                    name = addon.L["Vertical position"],
                    desc = addon.L["Calendar button vertical position Desc"]:K_ReplaceVars(addon.L["Calendar button"]):KAF_AddDefaultValueText("window.calendarButton.offsetY"),
                    set = CalendarButtonOffsetYSet
                })
            }
        },
        Tooltip = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.L["Tooltip"],
            args = {
                AlwaysShowRealm = addon.Settings.Row("tooltips.points.alwaysShowRealm", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.45),
                    name = addon.L["Always show realm"],
                    desc = addon.L["Always show realm Desc"]:KAF_AddDefaultValueText("tooltips.points.alwaysShowRealm"),
                }),
                ShowFaction = addon.Settings.Row("tooltips.points.showFaction", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.45),
                    name = addon.L["Show faction icon"],
                    desc = addon.L["Show faction icon Desc"]:KAF_AddDefaultValueText("tooltips.points.showFaction"),
                }),
                MaxNumCharacters = addon.Settings.Row("tooltips.points.maxNumCharacters", {
                    order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                    name = addon.L["Maximum number of characters"],
                    desc = addon.L["Maximum number of characters Desc"]:KAF_AddDefaultValueText("tooltips.points.maxNumCharacters"),
                }),
                KeepCurrentCharacter = addon.Settings.Row("tooltips.points.keepCurrentCharacter", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.45),
                    name = addon.L["Keep current character"],
                    desc = addon.L["Keep current character Desc"]:K_ReplaceVars(addon.L["Maximum number of characters"]):KAF_AddDefaultValueText("tooltips.points.keepCurrentCharacter"),
                }),
                SortPriority = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Sort priority"],
                    args = { --[[ Dynamically build via addon.Gui.AchievementFrameHeader.InjectDynamicOptions ]] }
                }
            }
        }
    }
}

local searchOptions = {
    order = OrderPP(), type = "group",
    name = addon.L["Search"],
    args = {
        SearchField = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.L["Search field"],
            args = {
                ClearOnRightClick = addon.Settings.Row("searchBox.clearOnRightClick", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                    name = addon.L["Clear search field on Right Click"],
                    desc = addon.L["Clear search field on Right Click Desc"]:KAF_AddDefaultValueText("searchBox.clearOnRightClick"),
                }),
                ExcludeExcluded = addon.Settings.Row("searchBox.excludeExcluded", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                    name = addon.L["Exclude Excluded achievements"],
                    desc = addon.L["Exclude Excluded achievements Desc"]:KAF_AddDefaultValueText("searchBox.excludeExcluded"),
                }),
                OnlySearchFiltered = addon.Settings.Row("searchBox.onlySearchFiltered", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                    name = addon.L["Only search filtered achievements"],
                    desc = addon.L["Only search filtered achievements Desc"]:KAF_AddDefaultValueText("searchBox.onlySearchFiltered"),
                }),
                Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
                MinimumCharactersToSearch = addon.Settings.Row("searchBox.minimumCharactersToSearch", {
                    order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                    name = addon.L["Minimum characters to search"],
                    desc = addon.L["Minimum characters to search Desc"]:KAF_AddDefaultValueText("searchBox.minimumCharactersToSearch"),
                })
            }
        },
        SearchPreview = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.L["Search preview"],
            args = {
                NumberOfSearchPreviews = addon.Settings.Row("searchBox.numberOfSearchPreviews", {
                    order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                    name = addon.L["Number of search previews"],
                    desc = addon.L["Number of search previews Desc"]:KAF_AddDefaultValueText("searchBox.numberOfSearchPreviews"):K_AddReloadRequired(),
                    min = 1, max = 1000, step = 1, -- max set via PostLoad
                }),
                Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
                ShowAllResultsInCategory = addon.Settings.Row("searchBox.showAllResultsInCategory", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                    name = addon.L["Show All Results in Category"],
                    desc = addon.L["Show All Results in Category Desc"]:KAF_AddDefaultValueText("searchBox.showAllResultsInCategory"),
                }),
            }
        },
        MouseWheelPanScalar = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.L["Mouse Wheel Scroll Speed"],
            args = {
                MouseWheelPanScalar = addon.Settings.Row("searchBox.mouseWheelPanScalar", {
                    order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                    name = addon.L["Mouse Wheel Scroll Speed"],
                    desc = addon.L["Mouse Wheel Scroll Speed Desc"]:K_ReplaceVars(addon.L["Achievements"]):KAF_AddDefaultValueText("searchBox.mouseWheelPanScalar"),
                    set = SetSearchBoxMouseWheelPanScalar
                })
            }
        },
    }
}

local summaryOptions = {
    order = OrderPP(), type = "group",
    name = addon.L["Summary"],
    args = {
        Summary = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.L["Summary"],
            args = {
                AutoNumAchievements = addon.Settings.Row("summary.autoNumAchievements", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                    name = addon.L["Auto number of summary achievements"],
                    desc = addon.L["Auto number of summary achievements Desc"]:KAF_AddDefaultValueText("summary.autoNumAchievements"),
                }),
                NumAchievements = addon.Settings.Row("summary.numAchievements", {
                    order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                    name = addon.L["Number of summary achievements"],
                    desc = addon.L["Number of summary achievements Desc"]:KAF_AddDefaultValueText("summary.numAchievements"),
                    set = function(_, value)
                        addon.Settings.Set("summary.numAchievements", value)
                        KrowiAF_SummaryFrame:UpdateAchievementsOnNextShow()
                    end,
                    disabled = function() return addon.Settings.Get("summary.autoNumAchievements") end
                })
            }
        },
        MouseWheelPanScalar = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.L["Mouse Wheel Scroll Speed"],
            args = {
                MouseWheelPanScalar = addon.Settings.Row("summary.mouseWheelPanScalar", {
                    order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                    name = addon.L["Mouse Wheel Scroll Speed"],
                    desc = addon.L["Mouse Wheel Scroll Speed Desc"]:K_ReplaceVars(addon.L["Achievements"]):KAF_AddDefaultValueText("summary.mouseWheelPanScalar"),
                    set = SetSummaryMouseWheelPanScalar
                })
            }
        }
    }
}

local categoriesOptions = {
    order = OrderPP(), type = "group",
    name = addon.L["Categories"],
    args = {
        Indentation = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.L["Indentation"],
            args = {
                Indentation = addon.Settings.Row("categories.indentation", {
                    order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                    name = addon.L["Indentation"],
                    desc = addon.L["Indentation Desc"]:KAF_AddDefaultValueText("categories.indentation"),
                    set = SetCategoryIndentation
                })
            }
        },
        MouseWheelPanScalar = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.L["Mouse Wheel Scroll Speed"],
            args = {
                MouseWheelPanScalar = addon.Settings.Row("categories.mouseWheelPanScalar", {
                    order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                    name = addon.L["Mouse Wheel Scroll Speed"],
                    desc = addon.L["Mouse Wheel Scroll Speed Desc"]:K_ReplaceVars(addon.L["Categories"]):KAF_AddDefaultValueText("categories.mouseWheelPanScalar"),
                    set = SetCategoriesMouseWheelPanScalar
                })
            }
        },
        Tooltip = {
            order = OrderPP(), type = "group",
            name = addon.L["Tooltip"],
            inline = true,
            args = {
                ShowNotObtainable = addon.Settings.Row("categories.tooltip.showNotObtainable", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                    name = addon.L["Show Not Obtainable"]:K_ReplaceVars(addon.L["Not Obtainable"]),
                    desc = addon.L["Show Not Obtainable Desc"]:K_ReplaceVars(addon.L["Not Obtainable"]):KAF_AddDefaultValueText("categories.tooltip.showNotObtainable"),
                })
            }
        },
        Merge = {
            order = OrderPP(), type = "group",
            name = addon.L["Merge Small Categories"],
            inline = true,
            args = {
                MergeSmallCategoriesThreshold = addon.Settings.Row("categories.mergeSmallThreshold", {
                    order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                    name = addon.L["Merge small categories threshold"],
                    desc = addon.L["Merge small categories threshold Desc"]:KAF_AddDefaultValueText("categories.mergeSmallThreshold"),
                    set = MergeMergeSmallCategoriesThresholdSet
                })
            }
        }
    }
}

local adjustableCategoriesOptions = {
    order = OrderPP(), type = "group", childGroups = "tab",
    name = addon.L["Adjustable Categories"],
    args = { --[[ Dynamically build via InjectDynamicAdjustableCategoryOptions ]] }
}

local achievementsOptions = {
    order = OrderPP(), type = "group", childGroups = "tab",
    name = addon.L["Achievements"],
    args = {
        Style = {
            order = OrderPP(), type = "group",
            name = addon.L["Style"],
            args = {
                Style = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Style"],
                    args = {
                        CompactAchievements = addon.Settings.Row("achievements.compact", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Compact Achievements"],
                            desc = addon.L["Compact Achievements Desc"]:KAF_AddDefaultValueText("achievements.compact"):K_AddReloadRequired(),
                        }),
                        CenterHeader = addon.Settings.Row("achievements.centerHeader", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Center Header"],
                            desc = addon.L["Center Header Desc"]:KAF_AddDefaultValueText("achievements.centerHeader"):K_AddReloadRequired(),
                        }),
                        HideDateCompleted = addon.Settings.Row("achievements.hideDateCompleted", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Hide Date Completed"],
                            desc = addon.L["Hide Date Completed Desc"]:KAF_AddDefaultValueText("achievements.hideDateCompleted"):K_AddReloadRequired(),
                        }),
                        -- ShowOtherFactionWarbandAsCompleted = {
                        --     order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                        --     name = addon.L["Show Other Faction Warband as Completed"],
                        --     desc = function() return addon.L["Show Other Faction Warband as Completed Desc"]:K_ReplaceVars{
                        --             hordeIntro = addon.GetAchievmentName(12555),
                        --             allianceIntro = addon.GetAchievmentName(12582),
                        --             warStories = addon.GetAchievmentName(40955),
                        --         }:KAF_AddDefaultValueText("Achievements.ShowOtherFactionWarbandAsCompleted")
                        --     end,
                        --     get = function() return addon.Options.db.profile.Achievements.ShowOtherFactionWarbandAsCompleted; end,
                        --     set = function(_, value) addon.Options.db.profile.Achievements.ShowOtherFactionWarbandAsCompleted = value; end,
                        -- },
                        Blank0 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.35), name = ""},
                        ShowAllianceFactionIcon = addon.Settings.Row("achievements.showAllianceFactionIcon", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Faction Faction Icon"]:K_ReplaceVars(addon.L["Alliance"]),
                            desc = addon.L["Show Faction Faction Icon Desc"]:K_ReplaceVars(addon.L["Alliance"]):KAF_AddDefaultValueText("achievements.showAllianceFactionIcon"),
                            set = ShowAllianceFactionIconSet,
                        }),
                        ShowHordeFactionIcon = addon.Settings.Row("achievements.showHordeFactionIcon", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Faction Faction Icon"]:K_ReplaceVars(addon.L["Horde"]),
                            desc = addon.L["Show Faction Faction Icon Desc"]:K_ReplaceVars(addon.L["Horde"]):KAF_AddDefaultValueText("achievements.showHordeFactionIcon"),
                            set = ShowHordeFactionIconSet,
                        }),
                        FactionIconAlpha = addon.Settings.Row("achievements.factionIconAlpha", {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.35),
                            name = addon.L["Faction Icon Transparency"],
                            desc = addon.L["Faction Icon Transparency Desc"]:KAF_AddDefaultValueText("achievements.factionIconAlpha"),
                            set = FactionIconAlphaSet,
                            disabled = function() return not addon.Settings.Get("achievements.showAllianceFactionIcon") and not addon.Settings.Get("achievements.showHordeFactionIcon"); end
                        }),
                        Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.35), name = ""},
                        ShowTemporarilyObtainableIcon = addon.Settings.Row("achievements.showTemporarilyObtainableIcon", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Temporarily obtainable Icon"]:K_ReplaceVars(addon.L["Temporarily obtainable"]),
                            desc = addon.L["Show Temporarily obtainable Icon Desc"]:K_ReplaceVars(addon.L["Temporarily obtainable"]):KAF_AddDefaultValueText("achievements.showTemporarilyObtainableIcon"),
                            set = ShowTemporarilyObtainableIconSet,
                        }),
                        TemporarilyObtainableHeaderColors = addon.Settings.Row("achievements.temporarilyObtainableHeaderColors", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Temporarily obtainable Header Colors"]:K_ReplaceVars(addon.L["Temporarily obtainable"]),
                            desc = addon.L["Temporarily obtainable Header Colors Desc"]:KAF_AddDefaultValueText("achievements.temporarilyObtainableHeaderColors"),
                            set = TemporarilyObtainableHeaderColorsSet,
                        }),
                        ShowWarbandIcon = addon.Settings.Row("achievements.showWarbandIcon", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Warband Icon"]:K_ReplaceVars(addon.L["Warband"]),
                            desc = addon.L["Show Warband Icon Desc"]:K_ReplaceVars(addon.L["Warband"]):KAF_AddDefaultValueText("achievements.showWarbandIcon"),
                            set = ShowWarbandIconSet,
                        }),
                        WarbandHeaderColor = addon.Settings.Row("achievements.warbandHeaderColor", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Warband Header Color"]:K_ReplaceVars(addon.L["Warband"]),
                            desc = addon.L["Warband Header Color Desc"]:K_ReplaceVars(addon.L["Show Warband Icon"]:K_ReplaceVars(addon.L["Warband"])):KAF_AddDefaultValueText("achievements.warbandHeaderColor"),
                            set = WarbandHeaderColorSet,
                        }),
                        Guide = {
                            order = OrderPP(), type = "header",
                            name = addon.L["Guide"]
                        },
                        GuideTooltip = addon.Settings.Row("guides.tooltip", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Guide in Tooltip"],
                            desc = addon.L["Show Guide in Tooltip Desc"]:KAF_AddDefaultValueText("guides.tooltip"),
                        }),
                        GuideRightClickMenu = addon.Settings.Row("guides.rightClickMenu", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Guide in Right Click Menu"],
                            desc = addon.L["Show Guide in Right Click Menu Desc"]:KAF_AddDefaultValueText("guides.rightClickMenu"),
                        }),
                        GuideIcon = addon.Settings.Row("guides.icon", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Guide Icon"],
                            desc = addon.L["Show Guide Icon Desc"]:KAF_AddDefaultValueText("guides.icon"),
                            set = GuideOptionSetter("Icon")
                        }),
                        GuideMouseoverShow = addon.Settings.Row("guides.mouseoverShow", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Guide on Mouseover"],
                            desc = addon.L["Show Guide on Mouseover Desc"]:KAF_AddDefaultValueText("guides.mouseoverShow"),
                            disabled = function() return not addon.Settings.Get("guides.icon") end
                        }),
                        GuideExpandedRow = addon.Settings.Row("guides.expandedRow", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Guide in Expanded Achievement"],
                            desc = addon.L["Show Guide in Expanded Achievement Desc"]:KAF_AddDefaultValueText("guides.expandedRow"),
                            set = GuideOptionSetter("ExpandedRow")
                        }),
                        GuideActionStyle = addon.Settings.Row("guides.actionStyle", {
                            order = OrderPP(), type = "select", width = AdjustedWidth(1.35),
                            name = addon.L["Guide Action Style"],
                            desc = addon.L["Guide Action Style Desc"]:KAF_AddDefaultValueText("guides.actionStyle", guideActionStyles),
                            values = guideActionStyles,
                            set = GuideOptionSetter("ActionStyle")
                        }),
                        GuideWaypointProvider = addon.Settings.Row("guides.waypointProvider", {
                            order = OrderPP(), type = "select", width = AdjustedWidth(1.35),
                            name = addon.L["Guide Waypoint"],
                            desc = addon.L["Guide Waypoint Desc"]:KAF_AddDefaultValueText("guides.waypointProvider", guideWaypointProviders),
                            values = guideWaypointProviders,
                            set = GuideOptionSetter("WaypointProvider")
                        }),
                        Objectives = {
                            order = OrderPP(), type = "header",
                            name = addon.L["Objectives"]
                        },
                        ForceTwoColumns = addon.Settings.Row("achievements.objectives.forceTwoColumns", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Force two columns"],
                            desc = addon.L["Force two columns Desc"]:KAF_AddDefaultValueText("achievements.objectives.forceTwoColumns"),
                        }),
                        ForceTwoColumnsThreshold = addon.Settings.Row("achievements.objectives.forceTwoColumnsThreshold", {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.35),
                            name = addon.L["Force two columns threshold"],
                            desc = addon.L["Force two columns threshold Desc"]:KAF_AddDefaultValueText("achievements.objectives.forceTwoColumnsThreshold"),
                            disabled = function() return not addon.Settings.Get("achievements.objectives.forceTwoColumns"); end
                        }),
                        CriteriaBehaviour = addon.Settings.Row("achievements.objectives.criteriaBehaviour", {
                            order = OrderPP(), type = "select", style = "radio",
                            name = addon.L["Criteria Behaviour"],
                            desc = addon.L["Criteria Behaviour Desc"]:K_ReplaceVars{
                                overflow = addon.L["Overflow"],
                                truncate = addon.L["Truncate"],
                                flexible = addon.L["Flexible"]
                            }:KAF_AddDefaultValueText("achievements.objectives.criteriaBehaviour", criteriaBehaviour),
                            values = criteriaBehaviour,
                            set = function (_, value) addon.Settings.Set("achievements.objectives.criteriaBehaviour", value); end
                        })
                    }
                },
                MouseWheelPanScalar = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Mouse Wheel Scroll Speed"],
                    args = {
                        MouseWheelPanScalar = addon.Settings.Row("achievements.mouseWheelPanScalar", {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Mouse Wheel Scroll Speed"],
                            desc = addon.L["Mouse Wheel Scroll Speed Desc"]:K_ReplaceVars(addon.L["Achievements"]):KAF_AddDefaultValueText("achievements.mouseWheelPanScalar"),
                            set = SetAchievementsMouseWheelPanScalar
                        })
                    }
                },
                TabPriority = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Tab Priority"],
                    args = {
                        EnableTabPriority = addon.Settings.Row("window.tabPriority.enabled", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Enable Tab Priority"],
                            desc = addon.L["Enable Tab Priority Desc"]:KAF_AddDefaultValueText("window.tabPriority.enabled"),
                        }),
                        TabPriority = addon.Settings.Row("window.tabPriority.tab", {
                            order = OrderPP(), type = "select", width = AdjustedWidth(1.5),
                            name = addon.L["Tab Priority"],
                            desc = function() return addon.L["Tab Priority Desc"]:K_ReplaceVars(addon.L["Achievements"]):KAF_AddDefaultValueText("window.tabPriority.tab", KrowiAF_SavedData.TabKeys) end,
                            values = function() return KrowiAF_SavedData.TabKeys; end,
                            set = function (_, value) addon.Settings.Set("window.tabPriority.tab", value); end
                        })
                    }
                }
            }
        },
        Tooltip = {
            order = OrderPP(), type = "group",
            name = addon.L["Tooltip"],
            args = {
                Tooltip = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Tooltip"],
                    args = {
                        EarnedBy = {
                            order = OrderPP(), type = "header",
                            name = addon.L["Earned By"] .. " / " .. addon.L["Not Earned By"]
                        },
                        EarnedByCharacters = addon.Settings.Row("tooltips.earnedBy.characters", {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.35),
                            name = addon.L["Number of Earned By characters"]:K_ReplaceVars(addon.L["Earned By"]),
                            desc = addon.L["Number of Earned By characters Desc"]:KAF_AddDefaultValueText("tooltips.earnedBy.characters"),
                        }),
                        EarnedByNotCharacters = addon.Settings.Row("tooltips.earnedBy.notCharacters", {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.35),
                            name = addon.L["Number of Not Earned By characters"]:K_ReplaceVars(addon.L["Not Earned By"]),
                            desc = addon.L["Number of Not Earned By characters Desc"]:KAF_AddDefaultValueText("tooltips.earnedBy.notCharacters"),
                            set = function(_, value)addon.Settings.Set("tooltips.earnedBy.notCharacters", value);end
                        }),
                        EarnedByAlwaysShowRealm = addon.Settings.Row("tooltips.earnedBy.alwaysShowRealm", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Always show realm"],
                            desc = addon.L["Always show realm Desc"]:KAF_AddDefaultValueText("tooltips.earnedBy.alwaysShowRealm"),
                        }),
                        Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.35), name = ""},
                        HideNotEarnedByIfEarnedByCurrentCharacter = addon.Settings.Row("tooltips.earnedBy.hideNotEarnedByIfEarnedByCurrentCharacter", {
                            order = OrderPP(), type = "toggle", width = "full",
                            name = addon.L["Hide Not Earned By if current character earned the achievement"]:K_ReplaceVars(addon.L["Not Earned By"]),
                            desc = addon.L["Hide Not Earned By if current character earned the achievement Desc"]:K_ReplaceVars{
                                notEarnedBy = addon.L["Not Earned By"],
                                earnedBy = addon.L["Earned By"]
                            }:KAF_AddDefaultValueText("tooltips.earnedBy.hideNotEarnedByIfEarnedByCurrentCharacter"),
                        }),
                        AddedInVersion = {
                            order = OrderPP(), type = "header",
                            name = addon.L["Added in version"]
                        },
                        ShowAddedInVersion = addon.Settings.Row("tooltips.showAddedInVersion", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Added in version"]:K_ReplaceVars(addon.L["Added in version"]),
                            desc = addon.L["Show Added in version Desc"]:K_ReplaceVars(addon.L["Added in version"]):KAF_AddDefaultValueText("tooltips.showAddedInVersion"),
                        }),
                        Rewards = {
                            order = OrderPP(), type = "header",
                            name = addon.L["Rewards"]
                        },
                        ShowRewards = addon.Settings.Row("tooltips.showRewards", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Rewards"]:K_ReplaceVars(addon.L["Rewards"]),
                            desc = addon.L["Show Rewards Desc"]:K_ReplaceVars(addon.L["Rewards"]):KAF_AddDefaultValueText("tooltips.showRewards"),
                        }),
                        PartOfAChain = {
                            order = OrderPP(), type = "header",
                            name = addon.L["Part of a chain"]
                        },
                        ShowPartOfAChain = addon.Settings.Row("tooltips.showPartOfAChain", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Part of a chain"]:K_ReplaceVars(addon.L["Part of a chain"]),
                            desc = addon.L["Show Part of a chain Desc"]:K_ReplaceVars(addon.L["Part of a chain"]):KAF_AddDefaultValueText("tooltips.showPartOfAChain"),
                        }),
                        ShowCurrentCharacterIconsPartOfAChain = addon.Settings.Row("tooltips.showCurrentCharacterIconsPartOfAChain", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show current character icons"],
                            desc = addon.L["Show current character icons Desc"]:K_ReplaceVars{
                                partOfAChain = addon.L["Part of a chain"],
                                requiredFor = addon.L["Required for"]
                            }:KAF_AddDefaultValueText("tooltips.showCurrentCharacterIconsPartOfAChain"),
                            disabled = function() return not addon.Settings.Get("tooltips.showPartOfAChain"); end
                        }),
                        RequiredFor = {
                            order = OrderPP(), type = "header",
                            name = addon.L["Required for"]
                        },
                        ShowRequiredFor = addon.Settings.Row("tooltips.showRequiredFor", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Required for"]:K_ReplaceVars(addon.L["Required for"]),
                            desc = addon.L["Show Required for Desc"]:K_ReplaceVars(addon.L["Required for"]):KAF_AddDefaultValueText("tooltips.showRequiredFor"),
                        }),
                        ShowCurrentCharacterIconsRequiredFor = addon.Settings.Row("tooltips.showCurrentCharacterIconsRequiredFor", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show current character icons"],
                            desc = addon.L["Show current character icons Desc"]:K_ReplaceVars{
                                partOfAChain = addon.L["Part of a chain"],
                                requiredFor = addon.L["Required for"]
                            }:KAF_AddDefaultValueText("tooltips.showCurrentCharacterIconsRequiredFor"),
                            disabled = function() return not addon.Settings.Get("tooltips.showRequiredFor"); end
                        }),
                        OtherFaction = {
                            order = OrderPP(), type = "header",
                            name = addon.L["Other faction"]
                        },
                        ShowOtherFaction = addon.Settings.Row("tooltips.showOtherFaction", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Other faction"]:K_ReplaceVars(addon.L["Other faction"]),
                            desc = addon.L["Show Other faction Desc"]:K_ReplaceVars(addon.L["Other faction"]):KAF_AddDefaultValueText("tooltips.showOtherFaction"),
                        }),
                        ObjectivesProgress = {
                            order = OrderPP(), type = "header",
                            name = addon.L["Objectives progress"]
                        },
                        ObjectivesProgressShow = addon.Settings.Row("tooltips.objectivesProgress.show", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Objectives progress"]:K_ReplaceVars(addon.L["Objectives progress"]),
                            desc = addon.L["Show Objectives progress Desc"]:K_ReplaceVars(addon.L["Objectives progress"]):KAF_AddDefaultValueText("tooltips.objectivesProgress.show"),
                        }),
                        ObjectivesProgressShowWhenAchievementCompleted = addon.Settings.Row("tooltips.objectivesProgress.showWhenAchievementCompleted", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["When achievement completed"]:K_ReplaceVars(addon.L["Objectives progress"]),
                            desc = addon.L["When achievement completed Desc"]:K_ReplaceVars(addon.L["Objectives progress"]):KAF_AddDefaultValueText("tooltips.objectivesProgress.showWhenAchievementCompleted"),
                            disabled = function() return not addon.Settings.Get("tooltips.objectivesProgress.show"); end
                        }),
                        ObjectivesProgressSecondColumnThreshold = addon.Settings.Row("tooltips.objectivesProgress.secondColumnThreshold", {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.35),
                            name = addon.L["Second column threshold"],
                            desc = addon.L["Second column threshold Desc"]:KAF_AddDefaultValueText("tooltips.objectivesProgress.secondColumnThreshold"),
                            disabled = function() return not addon.Settings.Get("tooltips.objectivesProgress.show"); end
                        }),
                        MostProgress = {
                            order = OrderPP(), type = "header",
                            name = addon.L["Most progress"]
                        },
                        MostProgressAlwaysShowRealm = addon.Settings.Row("tooltips.mostProgress.alwaysShowRealm", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Always show realm"],
                            desc = addon.L["Always show realm Desc"]:KAF_AddDefaultValueText("tooltips.mostProgress.alwaysShowRealm"),
                        }),
                        MostProgressCharacters = addon.Settings.Row("tooltips.mostProgress.characters", {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.35),
                            name = addon.L["Number of Most progress characters"]:K_ReplaceVars(addon.L["Most progress"]),
                            desc = addon.L["Number of Most progress characters Desc"]:KAF_AddDefaultValueText("tooltips.mostProgress.characters"),
                        })
                    }
                }
            }
        },
        TemporarilyObtainable = {
            order = OrderPP(), type = "group",
            name = addon.L["Tooltip"] .. " - " .. addon.L["Temporarily obtainable"],
            args = {
                TemporarilyObtainable = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Tooltip"] .. " - " .. addon.L["Temporarily obtainable"],
                    args = {
                        Show = addon.Settings.Row("tooltips.temporarilyObtainable.show", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Temporarily obtainable"]:K_ReplaceVars(addon.L["Temporarily obtainable"]),
                            desc = addon.L["Show Temporarily obtainable Desc"]:K_ReplaceVars(addon.L["Temporarily obtainable"]):KAF_AddDefaultValueText("tooltips.temporarilyObtainable.show"),
                        }),
                        ShowDateTime = addon.Settings.Row("tooltips.temporarilyObtainable.showDateTime", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                            name = addon.L["Show Start Time & End Time"]:K_ReplaceVars{
                                startTime = addon.L["Start Time"],
                                endTime = addon.L["End Time"]
                            },
                            desc = addon.L["Show Start Time & End Time Desc"]:K_ReplaceVars{
                                startTime = addon.L["Start Time"],
                                endTime = addon.L["End Time"],
                                temporarilyObtainable = addon.L["Temporarily obtainable"]
                            }:KAF_AddDefaultValueText("tooltips.temporarilyObtainable.showDateTime"),
                            disabled = function() return not addon.Settings.Get("tooltips.temporarilyObtainable.show") end
                        }),
                        EarnedByCharacters = addon.Settings.Row("tooltips.temporarilyObtainable.numberOfLines", {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.35),
                            name = addon.L["Number of lines"],
                            desc = addon.L["Number of Temporarily obtainable lines Desc"]:K_ReplaceVars(addon.L["Temporarily obtainable"]):KAF_AddDefaultValueText("tooltips.temporarilyObtainable.numberOfLines"),
                        }),
                    }
                },
                StartTimeAndEndTime = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Start Time"] .. " & " .. addon.L["End Time"],
                    args = {
                        Presets = {
                            order = OrderPP(), type = "select", width = AdjustedWidth(1.35),
                            name = addon.L["Presets"],
                            values = startTimeAndEndTimeDateTimeValues,
                            get = StartTimeAndEndTimePresetsGet,
                            set = function(_, value)
                                local custom = addon.Options.Registry.Get(addon.Metadata.Prefix .. "_Layout").args.Achievements.args.TemporarilyObtainable.args.StartTimeAndEndTime.args.Custom
                                custom.set(nil, startTimeAndEndTimeDateTimeFormats[value])
                            end
                        },
                        Custom = addon.Settings.Row("tooltips.temporarilyObtainable.dateTimeFormat.startTimeAndEndTime", {
                            order = OrderPP(), type = "input", width = AdjustedWidth(1.35),
                            name = addon.L["Custom"],
                            set = StartTimeAndEndTimeCustomSet
                        })
                    }
                },
                DateTimeFormattingGuideLine = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Date and Time formatting guide"],
                    args = {
                        DateTimeFormattingGuide = {
                            order = OrderPP(), type = "description",
                            name = addon.L["Date and Time formatting guide Desc"]:K_ReplaceVars {
                                addon.L["Date and Time formatting guide Desc"],
                                a = string.format(addon.Util.Colors.Yellow, "%a"),
                                A = string.format(addon.Util.Colors.Yellow, "%A"),
                                b = string.format(addon.Util.Colors.Yellow, "%b"),
                                B = string.format(addon.Util.Colors.Yellow, "%B"),
                                c = string.format(addon.Util.Colors.Yellow, "%c"),
                                C = string.format(addon.Util.Colors.Yellow, "%C"),
                                d = string.format(addon.Util.Colors.Yellow, "%d"),
                                D = string.format(addon.Util.Colors.Yellow, "%D"),
                                e = string.format(addon.Util.Colors.Yellow, "%e"),
                                H = string.format(addon.Util.Colors.Yellow, "%H"),
                                I = string.format(addon.Util.Colors.Yellow, "%I"),
                                j = string.format(addon.Util.Colors.Yellow, "%j"),
                                k = string.format(addon.Util.Colors.Yellow, "%k"),
                                l = string.format(addon.Util.Colors.Yellow, "%l"),
                                m = string.format(addon.Util.Colors.Yellow, "%m"),
                                M = string.format(addon.Util.Colors.Yellow, "%M"),
                                p = string.format(addon.Util.Colors.Yellow, "%p"),
                                P = string.format(addon.Util.Colors.Yellow, "%P"),
                                R = string.format(addon.Util.Colors.Yellow, "%R"),
                                s = string.format(addon.Util.Colors.Yellow, "%s"),
                                S = string.format(addon.Util.Colors.Yellow, "%S"),
                                u = string.format(addon.Util.Colors.Yellow, "%u"),
                                U = string.format(addon.Util.Colors.Yellow, "%U"),
                                w = string.format(addon.Util.Colors.Yellow, "%w"),
                                W = string.format(addon.Util.Colors.Yellow, "%W"),
                                x = string.format(addon.Util.Colors.Yellow, "%x"),
                                X = string.format(addon.Util.Colors.Yellow, "%X"),
                                y = string.format(addon.Util.Colors.Yellow, "%y"),
                                Y = string.format(addon.Util.Colors.Yellow, "%Y"),
                                z = string.format(addon.Util.Colors.Yellow, "%z"),
                                Z = string.format(addon.Util.Colors.Yellow, "%Z")
                            }
                        }
                    }
                }
            }
        }
    }
}

local calendarOptions = {
    order = OrderPP(), type = "group",
    name = addon.L["Calendar"],
    args = {
        General = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.Util.L["General"],
            args = {
                LockAchievementMonth = addon.Settings.Row("calendar.lockAchievementMonth", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                    name = addon.L["Lock month when closed by achievement"],
                    desc = addon.L["Lock month when closed by achievement Desc"]:KAF_AddDefaultValueText("calendar.lockAchievementMonth"),
                }),
                Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
                LockMonth = addon.Settings.Row("calendar.lockMonth", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                    name = addon.L["Lock month"],
                    desc = addon.L["Lock month Desc"]:KAF_AddDefaultValueText("calendar.lockMonth"),
                })
            }
        },
        Weekdays = {
            order = OrderPP(), type = "group",
            name = addon.L["Weekdays"],
            inline = true,
            args = {
                FirstDayOfTheWeek = addon.Settings.Row("calendar.firstWeekDay", {
                    order = OrderPP(), type = "select", width = AdjustedWidth(1.5),
                    name = addon.L["First day of the week"],
                    desc = addon.L["First day of the week Desc"],
                    values = CALENDAR_WEEKDAY_NAMES,
                    set = function (_, value)
                        addon.Settings.Set("calendar.firstWeekDay", value)
                        KrowiAF_AchievementCalendarFrame:Update()
                    end
                })
            }
        },
        SideFrameMouseWheelPanScalar = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.L["Side Window"] .. " " .. addon.L["Mouse Wheel Scroll Speed"],
            args = {
                MouseWheelPanScalar = addon.Settings.Row("calendar.mouseWheelPanScalar", {
                    order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                    name = addon.L["Mouse Wheel Scroll Speed"],
                    desc = addon.L["Mouse Wheel Scroll Speed Desc"]:K_ReplaceVars(addon.L["Achievements"]):KAF_AddDefaultValueText("calendar.mouseWheelPanScalar"),
                    set = SetCalendarMouseWheelPanScalar
                })
            }
        }
    }
}

local criteriaOptions = {
    order = OrderPP(), type = "group",
    name = addon.L["Criteria"],
    args = {
        Tooltip = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.L["Tooltip"],
            args = {
                ShowCriteria = addon.Settings.Row("unitTooltips.criteria.show", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                    name = addon.L["Show Criteria"],
                    desc = function() return addon.L["Show Criteria Desc"]:K_ReplaceVars{
                        criteria = (GetAchievementCriteriaInfo(1206, 1)),
                        achievement = addon.GetAchievmentName(1206)
                    }:KAF_AddDefaultValueText("unitTooltips.criteria.show"); end,
                }),
                Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
                ShowCriteriaIf = {
                    order = OrderPP(), type = "header",
                    name = addon.L["Show Criteria If"]
                },
                ShowCriteriaIfAchievementIsCompleted = addon.Settings.Row("unitTooltips.criteria.showIf.achievementIsCompleted", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                    name = addon.L["Achievement is Completed"],
                    desc = addon.L["Achievement is Completed Desc"]:KAF_AddDefaultValueText("unitTooltips.criteria.showIf.achievementIsCompleted"),
                }),
                ShowCriteriaIfAchievementWasNotEarnedByMe = addon.Settings.Row("unitTooltips.criteria.showIf.achievementWasNotEarnedByMe", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                    name = addon.L["Achievement was Not Earned by Me"],
                    desc = addon.L["Achievement was Not Earned by Me Desc"]:KAF_AddDefaultValueText("unitTooltips.criteria.showIf.achievementWasNotEarnedByMe"),
                }),
                ShowCriteriaIfCriteriaIsCompleted = addon.Settings.Row("unitTooltips.criteria.showIf.criteriaIsCompleted", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                    name = addon.L["Criteria is Completed"],
                    desc = addon.L["Criteria is Completed Desc"]:KAF_AddDefaultValueText("unitTooltips.criteria.showIf.criteriaIsCompleted"),
                }),
                Blank2 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
            }
        }
    }
}

local dataManagerOptions = {
    order = OrderPP(), type = "group",
    name = addon.L["Data Manager"],
    args = {
        MouseWheelPanScalar = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.L["Mouse Wheel Scroll Speed"],
            args = {
                MouseWheelPanScalar = addon.Settings.Row("dataManager.mouseWheelPanScalar", {
                    order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                    name = addon.L["Mouse Wheel Scroll Speed"],
                    desc = addon.L["Mouse Wheel Scroll Speed Desc"]:K_ReplaceVars(addon.L["Characters"]):KAF_AddDefaultValueText("dataManager.mouseWheelPanScalar"),
                    set = SetDataManagerMouseWheelPanScalar
                })
            }
        }
    }
}

options.OptionsTable.args["Layout"] = {
    type = "group", childGroups = "tab",
    name = addon.L["Layout"],
    args = {
        Window = windowOptions,
        Tabs = tabsOptions,
        Header = headerOptions,
        Search = searchOptions,
        Summary = summaryOptions,
        Categories = categoriesOptions,
        AdjustableCategories = adjustableCategoriesOptions,
        Achievements = achievementsOptions,
        Calendar = calendarOptions,
        Criteria = criteriaOptions,
        DataManager = dataManagerOptions
    }
}

function RefreshOptions()
    -- Before Blizzard_AchievementUI loads, the window's frames do not exist yet (switching profiles from the options
    -- window right after a /reload); each one reads the profile when it is built, so only the options table follows now
    if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
        SetMaxNumberOfSearchPreviews()
        return
    end
    MovableSwitchMovableSet(_, addon.Settings.Get("window.movable"))
    MovableAchievementWindowRememberLastPositionSet(_, addon.Settings.Get("window.rememberPosition.achievementWindow"))
    MovableCalendarRememberLastPositionSet(_, addon.Settings.Get("window.rememberPosition.calendar"))
    MovableDataManagerRememberLastPositionSet(_, addon.Settings.Get("window.rememberPosition.dataManager"))
    OffsetsCategoriesFrameWidthSet(_, addon.Settings.Get("window.categoriesFrameWidthOffset"))
    OffsetsAchievementsFrameWidthSet(_, addon.Settings.Get("window.achievementsFrameWidthOffset"))
    OffsetsAchievementFrameHeightSet(_, addon.Settings.Get("window.achievementFrameHeightOffset"))
    addon.Gui:ShowHideTabs() -- Dynamic Tab Order and Visibility is handled by this one
    CenterHeaderSet(_, addon.Settings.Get("window.centerHeader"))
    CalendarButtonOffsetXSet(_, addon.Settings.Get("window.calendarButton.offsetX"))
    CalendarButtonOffsetYSet(_, addon.Settings.Get("window.calendarButton.offsetY"))
    SetSearchBoxMouseWheelPanScalar(_, addon.Settings.Get("searchBox.mouseWheelPanScalar"))
    SetSummaryMouseWheelPanScalar(_, addon.Settings.Get("summary.mouseWheelPanScalar"))
    SetCategoryIndentation(_, addon.Settings.Get("categories.indentation"))
    SetCategoriesMouseWheelPanScalar(_, addon.Settings.Get("categories.mouseWheelPanScalar"))
    MergeMergeSmallCategoriesThresholdSet(_, addon.Settings.Get("categories.mergeSmallThreshold"))
    DrawWatchListSubCategories()
    DrawTrackingAchievementsSubCategories()
    ShowExcludedCategory() -- Resets or reloads the Excluded tree for the new profile, so no separate redraw is needed
    SetAchievementsMouseWheelPanScalar(_, addon.Settings.Get("achievements.mouseWheelPanScalar"))
    StartTimeAndEndTimeCustomSet(_, addon.Settings.Get("tooltips.temporarilyObtainable.dateTimeFormat.startTimeAndEndTime"))
    SetCalendarMouseWheelPanScalar(_, addon.Settings.Get("calendar.mouseWheelPanScalar"))
    SetDataManagerMouseWheelPanScalar(_, addon.Settings.Get("dataManager.mouseWheelPanScalar"))
end