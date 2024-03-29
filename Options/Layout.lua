-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;
options.Layout = {};
local layout = options.Layout;
tinsert(options.OptionsTables, layout);

local OrderPP = addon.InjectOptions.AutoOrderPlusPlus;
local AdjustedWidth = addon.InjectOptions.AdjustedWidth;

function layout.RegisterOptionsTable()
    LibStub("AceConfig-3.0"):RegisterOptionsTable(addon.Metadata.Prefix .. "_Layout", options.OptionsTable.args.Layout);
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addon.Metadata.Prefix .. "_Layout", addon.L["Layout"], addon.Metadata.Title);
end

function layout.PostLoad()
    if addon.Options.db.profile.Calendar.FirstWeekDay < 1 or addon.Options.db.profile.Calendar.FirstWeekDay > 7 then
        if not IsAddOnLoaded("Blizzard_Calendar") then -- This is to make sure we get the 1st day of the week correct
            LoadAddOn("Blizzard_Calendar"); -- breaks Blizzard_Calendar
        end
        addon.Options.db.profile.Calendar.FirstWeekDay = CALENDAR_FIRST_WEEKDAY;
    end

    options.SetMaxNumberOfSearchPreviews();
end

local RefreshOptions; -- Assigned at the end of the file
function layout.OnProfileChanged(db, newProfile)
    RefreshOptions();
end

function layout.OnProfileCopied(db, sourceProfile)
    RefreshOptions();
end

function layout.OnProfileReset(db)
    RefreshOptions();
end

-- [[ InjectDynamicFixedWatchListOptions ]]
local function DrawSubCategories(categories)
    if addon.Gui.SelectedTab == nil then
        return;
    end

    -- Reset all
    for i = 1, #categories do
        categories[i].Achievements = nil;
        categories[i].Children = nil;
    end
    KrowiAF_CategoriesFrame:Update(true);
    KrowiAF_AchievementsFrame:ForceUpdate();

    -- Draw again
    addon.Data.LoadWatchedAchievements();
end

local function WatchListClearAllFunc()
    if not addon.Data.WatchListCategories then
        LoadAddOn("Blizzard_AchievementUI");
    end
    for i = 1, #addon.Data.WatchListCategories do
        addon.Data.WatchListCategories[i].Achievements = nil;
        addon.Data.WatchListCategories[i].Children = nil;
    end
    if addon.Gui.SelectedTab ~= nil then -- If nil, not yet loaded
        if KrowiAF_SavedData.WatchedAchievements then
            for id, _ in next, KrowiAF_SavedData.WatchedAchievements do
                addon.Data.Achievements[id]:ClearWatch();
            end
        end
        KrowiAF_CategoriesFrame:Update(true);
        KrowiAF_AchievementsFrame:ForceUpdate();
    end
    KrowiAF_SavedData.WatchedAchievements = nil;
end

local function InjectDynamicFixedWatchListOptions()
    if addon.InjectOptions:TableExists("Layout.args.AdjustableCategories.args.WatchList.args.ShowWatchedSubCategories") then
        return;
    end

    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.WatchList.args", "ShowWatchedSubCategories", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = addon.L["Show Sub Categories"],
        desc = addon.L["Show Sub Categories Desc"]:K_ReplaceVars(addon.L["Watch List"]):KAF_AddDefaultValueText("Categories.WatchList.ShowSubCategories"),
        get = function() return addon.Options.db.profile.Categories.WatchList.ShowSubCategories; end,
        set = function(_, value)
            addon.Options.db.profile.Categories.WatchList.ShowSubCategories = value;
            DrawSubCategories(addon.Data.WatchListCategories);
        end
    });
    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.WatchList.args", "Blank1", {
        order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""
    });
    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.WatchList.args", "ClearAll", {
        order = OrderPP(), type = "execute", width = AdjustedWidth(),
        name = addon.L["Clear all"],
        desc = addon.L["Clear all Desc"],
        func = WatchListClearAllFunc
    });
    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.WatchList.args", "IgnoreFilters", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = addon.L["Ignore Filters"],
        desc = addon.L["Ignore Filters Desc"]:K_ReplaceVars(addon.L["Watch List"]):KAF_AddDefaultValueText("Categories.WatchList.IgnoreFilters"),
        get = function() return addon.Options.db.profile.Categories.WatchList.IgnoreFilters; end,
        set = function(_, value)
            addon.Options.db.profile.Categories.WatchList.IgnoreFilters = value;
            DrawSubCategories(addon.Data.WatchListCategories);
        end
    });
end

-- [[ InjectMoreDynamicTrackingAchievementsOptions ]]
local function InjectMoreDynamicTrackingAchievementsOptions()
    if addon.InjectOptions:TableExists("Layout.args.AdjustableCategories.args.TrackingAchievements.args.LoadTrackingAchievements") then
        return;
    end

    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.TrackingAchievements.args", "LoadTrackingAchievements", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(2),
        name = addon.L["Load Tracking Achievements"],
        desc = addon.L["Load Tracking Achievements Desc"]:KAF_AddDefaultValueText("Categories.TrackingAchievements.DoLoad"):K_AddReloadRequired(),
        get = function() return addon.Options.db.profile.Categories.TrackingAchievements.DoLoad; end,
        set = function(_, value) addon.Options.db.profile.Categories.TrackingAchievements.DoLoad = value; end
    });

    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.TrackingAchievements.args", "ShowTrackingSubCategories", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = addon.L["Show Sub Categories"],
        desc = addon.L["Show Sub Categories Desc"]:K_ReplaceVars(addon.L["Tracking Achievements"]):KAF_AddDefaultValueText("Categories.TrackingAchievements.ShowSubCategories"),
        get = function() return addon.Options.db.profile.Categories.TrackingAchievements.ShowSubCategories; end,
        set = function(_, value)
            addon.Options.db.profile.Categories.TrackingAchievements.ShowSubCategories = value;
            DrawSubCategories(addon.Data.TrackingAchievementsCategories);
        end
    });
end

-- [[ InjectMoreDynamicExcludedOptions ]]
local function ShowExcludedCategory()
    if addon.Gui.SelectedTab == nil then -- If nil, not yet loaded
        return;
    end
    if addon.Options.db.profile.Categories.Excluded.Show then
        addon.Data.LoadExcludedAchievements();
    else
        for i = 1, #addon.Data.ExcludedCategories do
            addon.Data.ExcludedCategories[i].Achievements = nil;
            addon.Data.ExcludedCategories[i].Children = nil;
        end
        KrowiAF_CategoriesFrame:Update(true);
        KrowiAF_AchievementsFrame:ForceUpdate();
    end
end

local function ExcludedIncludeAllFunc()
    if not addon.Data.ExcludedCategories then
        LoadAddOn("Blizzard_AchievementUI");
    end

    for i = 1, #addon.Data.ExcludedCategories do
        addon.Data.ExcludedCategories[i].Achievements = nil;
        addon.Data.ExcludedCategories[i].Children = nil;
    end
    if addon.Gui.SelectedTab == nil then -- If nil, not yet loaded
        KrowiAF_SavedData.ExcludedAchievements = nil;
        return;
    end
    if KrowiAF_SavedData.ExcludedAchievements then
        for id, _ in next, KrowiAF_SavedData.ExcludedAchievements do
            addon.Data.Achievements[id]:Include();
        end
    end
    KrowiAF_CategoriesFrame:Update(true);
    KrowiAF_AchievementsFrame:ForceUpdate();
    KrowiAF_SavedData.ExcludedAchievements = nil;
end

local function InjectMoreDynamicExcludedOptions()
    if addon.InjectOptions:TableExists("Layout.args.AdjustableCategories.args.Excluded.args.ShowExcludedSubCategories") then
        return;
    end

    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.Excluded.args", "Show", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = addon.L["Show Excluded Category"],
        desc = addon.L["Show Excluded Category Desc"]:K_ReplaceVars(addon.L["Excluded"]):KAF_AddDefaultValueText("Categories.Excluded.Show"),
        get = function() return addon.Options.db.profile.Categories.Excluded.Show; end,
        set = function(_, value)
            addon.Options.db.profile.Categories.Excluded.Show = value;
            ShowExcludedCategory();
        end
    });
    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.Excluded.args", "Blank1", {
        order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""
    });
    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.Excluded.args", "IncludeAll", {
        order = OrderPP(), type = "execute", width = AdjustedWidth(),
        name = addon.L["Include all"],
        desc = addon.L["Include all Desc"],
        func = ExcludedIncludeAllFunc
    });
    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args.Excluded.args", "ShowExcludedSubCategories", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = addon.L["Show Sub Categories"],
        desc = addon.L["Show Sub Categories Desc"]:K_ReplaceVars(addon.L["Excluded"]):KAF_AddDefaultValueText("Categories.Excluded.ShowSubCategories"),
        disabled = function() return not addon.Options.db.profile.Categories.Excluded.Show; end,
        get = function() return addon.Options.db.profile.Categories.Excluded.ShowSubCategories; end,
        set = function()
            addon.Options.db.profile.Categories.Excluded.ShowSubCategories = not addon.Options.db.profile.Categories.Excluded.ShowSubCategories;
            DrawSubCategories(addon.Data.ExcludedCategories);
        end
    });
end

-- [[ InjectDynamicAdjustableCategoryOptions ]]
local function InjectDynamicFixedAdjustableCategoriesOptions(category)
    if category == "WatchList" then
        InjectDynamicFixedWatchListOptions();
    elseif category == "TrackingAchievements" then
        InjectMoreDynamicTrackingAchievementsOptions();
    elseif category == "Excluded" then
        InjectMoreDynamicExcludedOptions();
    end
end

function layout.InjectDynamicAdjustableCategoryOptions(category, categoryDisplayName, tabIndex, tab, tabDisplayName, defaultValue)
    if not addon.InjectOptions:DefaultsExists("AdjustableCategories." .. category) then
        addon.InjectOptions:AddDefaults("AdjustableCategories", category, { });
    end

    addon.InjectOptions:AddDefaults("AdjustableCategories." .. category, tabIndex, defaultValue);

    if not addon.InjectOptions:TableExists("Layout.args.AdjustableCategories.args." .. category) then
        addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args", category, {
            order = OrderPP(), type = "group",
            name = categoryDisplayName,
            args = {}
        });
    end

    InjectDynamicFixedAdjustableCategoriesOptions(category);

    if not addon.InjectOptions:TableExists("Layout.args.AdjustableCategories.args." .. category .. ".args.Tabs") then
        addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args." .. category .. ".args", "Tabs", {
            order = OrderPP(), type = "header",
            name = addon.L["Tabs"]
        });
    end

    addon.InjectOptions:AddTable("Layout.args.AdjustableCategories.args." .. category .. ".args", tab, {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = tabDisplayName,
        desc = addon.Util.L["Requires a reload"]:KAF_AddDefaultValueText("AdjustableCategories." .. category .. "." .. tabIndex),
        get = function() return addon.Options.db.profile.AdjustableCategories[category][tabIndex]; end,
        set = function(_, value) addon.Options.db.profile.AdjustableCategories[category][tabIndex] = value; end
    });
end

local achievementPointsDisplays = {
    addon.L["Account wide (default)"],
    addon.L["Character / Account wide"],
    addon.L["Character only"]
};

local criteriaBehaviour = {
    addon.L["Overflow"],
    addon.L["Truncate"],
    addon.L["Flexible"],
    -- addon.L["Wrap"]
};

local wowheadRelatedTabs = {
    addon.L["None"],
    addon.L["Criteria of"],
    addon.L["Guides"],
    addon.L["News"],
    addon.L["Comments"],
    addon.L["Screenshots"]
};

local function MovableSwitchMovableSet(_, value)
    if addon.Options.db.profile.Window.Movable == value then return; end
    addon.Options.db.profile.Window.Movable = value;
    if addon.Options.db.profile.Window.Movable then
        addon.MakeWindowMovable();
    else
        addon.MakeWindowStatic();
    end
end

local function MovableAchievementWindowRememberLastPositionSet(_, value)
    if addon.Options.db.profile.Window.RememberLastPosition.AchievementWindow == value then return; end
    addon.Options.db.profile.Window.RememberLastPosition.AchievementWindow = value;
    if not addon.Options.db.profile.Window.RememberLastPosition.AchievementWindow then
        if not IsAddOnLoaded("Blizzard_AchievementUI") then
            LoadAddOn("Blizzard_AchievementUI");
        end
        AchievementFrame:ResetPosition();
    end
end

local function MovableCalendarRememberLastPositionSet(_, value)
    if addon.Options.db.profile.Window.RememberLastPosition.Calendar == value then return; end
    addon.Options.db.profile.Window.RememberLastPosition.Calendar = value;
    if not addon.Options.db.profile.Window.RememberLastPosition.Calendar then
        if not IsAddOnLoaded("Blizzard_AchievementUI") then
            LoadAddOn("Blizzard_AchievementUI");
        end
        KrowiAF_AchievementCalendarFrame:ResetPosition();
    end
end

local function MovableDataManagerRememberLastPositionSet(_, value)
    if addon.Options.db.profile.Window.RememberLastPosition.DataManager == value then return; end
    addon.Options.db.profile.Window.RememberLastPosition.DataManager = value;
    if not addon.Options.db.profile.Window.RememberLastPosition.DataManager then
        if not IsAddOnLoaded("Blizzard_AchievementUI") then
            LoadAddOn("Blizzard_AchievementUI");
        end
        KrowiAF_DataManagerFrame:ResetPosition();
    end
end

local function OffsetsCategoriesFrameWidthSet(_, value)
    if addon.Options.db.profile.Window.CategoriesFrameWidthOffset == value then return; end
    addon.Options.db.profile.Window.CategoriesFrameWidthOffset = value;
    if addon.Gui.SelectedTab then
        addon.Gui:SetAchievementFrameWidth();
    end
end

local function OffsetsAchievementsFrameWidthSet(_, value)
    if addon.Options.db.profile.Window.AchievementsFrameWidthOffset == value then return; end
    addon.Options.db.profile.Window.AchievementsFrameWidthOffset = value;
    if addon.Gui.SelectedTab then
        addon.Gui:SetAchievementFrameWidth();
        if addon.Gui.SelectedTab.SelectedCategory.IsSummary then
            KrowiAF_SummaryFrame:Update();
        end
    end
end

local function SetMaxNumberOfSearchPreviews()
    local numberOfSearchPreviews = options.SetMaxNumberOfSearchPreviews()
    if numberOfSearchPreviews.get() > numberOfSearchPreviews.max then
        numberOfSearchPreviews.set(nil, numberOfSearchPreviews.max);
    end
end

local function OffsetsAchievementFrameHeightSet(_, value)
    if addon.Options.db.profile.Window.AchievementFrameHeightOffset == value then return; end
    addon.Options.db.profile.Window.AchievementFrameHeightOffset = value;
    SetMaxNumberOfSearchPreviews();
    if addon.Gui.SelectedTab then
        addon.Gui:SetAchievementFrameHeight();
    end
end

local function SetSearchBoxMouseWheelPanScalar(_, value)
    if addon.Options.db.profile.SearchBox.MouseWheelPanScalar == value then return; end
    addon.Options.db.profile.SearchBox.MouseWheelPanScalar = value;
    if KrowiAF_SearchBoxFrame.ResultsFrame.ScrollBox then
        KrowiAF_SearchBoxFrame.ResultsFrame.ScrollBox.wheelPanScalar = value;
    end
    if KrowiAF_SearchBoxFrame.ResultsFrame.ScrollBar then
        KrowiAF_SearchBoxFrame.ResultsFrame.ScrollBar.wheelPanScalar = value;
    end
end

local function SetSummaryMouseWheelPanScalar(_, value)
    if addon.Options.db.profile.Summary.MouseWheelPanScalar == value then return; end
    addon.Options.db.profile.Summary.MouseWheelPanScalar = value;
    if KrowiAF_SummaryFrame.AchievementsFrame.ScrollBox then
        KrowiAF_SummaryFrame.AchievementsFrame.ScrollBox.wheelPanScalar = value;
    end
    if KrowiAF_SummaryFrame.AchievementsFrame.ScrollBar then
        KrowiAF_SummaryFrame.AchievementsFrame.ScrollBar.wheelPanScalar = value;
    end
end

local function SetCategoryIndentation(_, value)
    if addon.Options.db.profile.Categories.Indentation == value then return; end
    addon.Options.db.profile.Categories.Indentation = value;
    if KrowiAF_CategoriesFrame.ScrollView then
        KrowiAF_CategoriesFrame.ScrollView:Layout();
    end
end

local function SetCategoriesMouseWheelPanScalar(_, value)
    if addon.Options.db.profile.Categories.MouseWheelPanScalar == value then return; end
    addon.Options.db.profile.Categories.MouseWheelPanScalar = value;
    if KrowiAF_CategoriesFrame.ScrollBox then
        KrowiAF_CategoriesFrame.ScrollBox.wheelPanScalar = value;
    end
    if KrowiAF_CategoriesFrame.ScrollBar then
        KrowiAF_CategoriesFrame.ScrollBar.wheelPanScalar = value;
    end
end

local function MergeMergeSmallCategoriesThresholdSet(_, value)
    if addon.Options.db.profile.Window.MergeSmallCategoriesThreshold == value then return; end
    addon.Options.db.profile.Window.MergeSmallCategoriesThreshold = value;
    KrowiAF_CategoriesFrame:Update(true);
end

local function SetAchievementsMouseWheelPanScalar(_, value)
    if addon.Options.db.profile.Achievements.MouseWheelPanScalar == value then return; end
    addon.Options.db.profile.Achievements.MouseWheelPanScalar = value;
    if KrowiAF_AchievementsFrame.ScrollBox then
        KrowiAF_AchievementsFrame.ScrollBox.wheelPanScalar = value;
    end
    if KrowiAF_AchievementsFrame.ScrollBar then
        KrowiAF_AchievementsFrame.ScrollBar.wheelPanScalar = value;
    end
end

local function SetCalendarMouseWheelPanScalar(_, value)
    if addon.Options.db.profile.Calendar.MouseWheelPanScalar == value then return; end
    addon.Options.db.profile.Calendar.MouseWheelPanScalar = value;
    if KrowiAF_AchievementCalendarFrame.SideFrame.AchievementsFrame.ScrollBox then
        KrowiAF_AchievementCalendarFrame.SideFrame.AchievementsFrame.ScrollBox.wheelPanScalar = value;
    end
    if KrowiAF_AchievementCalendarFrame.SideFrame.AchievementsFrame.ScrollBar then
        KrowiAF_AchievementCalendarFrame.SideFrame.AchievementsFrame.ScrollBar.wheelPanScalar = value;
    end
end

local function SetDataManagerMouseWheelPanScalar(_, value)
    if addon.Options.db.profile.DataManager.MouseWheelPanScalar == value then return; end
    addon.Options.db.profile.DataManager.MouseWheelPanScalar = value;
    if KrowiAF_DataManagerFrame.CharacterList.ScrollBox then
        KrowiAF_DataManagerFrame.CharacterList.ScrollBox.wheelPanScalar = value;
    end
    if KrowiAF_DataManagerFrame.CharacterList.ScrollBar then
        KrowiAF_DataManagerFrame.CharacterList.ScrollBar.wheelPanScalar = value;
    end
end

options.OptionsTable.args["Layout"] = {
    type = "group", childGroups = "tab",
    name = addon.L["Layout"],
    args = {
        Window = {
            order = OrderPP(), type = "group",
            name = addon.L["Window"],
            args = {
                Movable = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Movable"],
                    args = {
                        SwitchMovable = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(2),
                            name = addon.L["Make windows movable"],
                            desc = addon.L["Make windows movable Desc"]:KAF_AddDefaultValueText("Window.Movable"),
                            get = function() return addon.Options.db.profile.Window.Movable; end,
                            set = MovableSwitchMovableSet
                        },
                        Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""},
                        AchievementWindowRememberLastPosition = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(2),
                            name = addon.L["Remember frame position"]:K_ReplaceVars(addon.L["Achievement Window"]),
                            desc = addon.L["Remember frame position Desc"]:K_ReplaceVars(addon.L["Achievement Window"]):KAF_AddDefaultValueText("Window.RememberLastPosition.AchievementWindow"),
                            get = function() return addon.Options.db.profile.Window.RememberLastPosition.AchievementWindow; end,
                            set = MovableAchievementWindowRememberLastPositionSet
                        },
                        AchievementWindowResetPosition = {
                            order = OrderPP(), type = "execute", width = AdjustedWidth(),
                            name = addon.L["Reset position"],
                            desc = addon.L["Reset position Desc"]:K_ReplaceVars(addon.L["Achievement Window"]),
                            func = function()
                                if not IsAddOnLoaded("Blizzard_AchievementUI") then
                                    LoadAddOn("Blizzard_AchievementUI");
                                end
                                AchievementFrame:ResetPosition();
                            end
                        },
                        CalendarRememberLastPosition = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(2),
                            name = addon.L["Remember frame position"]:K_ReplaceVars(addon.L["Achievement Calendar"]),
                            desc = addon.L["Remember frame position Desc"]:K_ReplaceVars(addon.L["Achievement Calendar"]):KAF_AddDefaultValueText("Window.RememberLastPosition.Calendar"),
                            get = function() return addon.Options.db.profile.Window.RememberLastPosition.Calendar; end,
                            set = MovableCalendarRememberLastPositionSet
                        },
                        CalendarResetPosition = {
                            order = OrderPP(), type = "execute", width = AdjustedWidth(),
                            name = addon.L["Reset position"],
                            desc = addon.L["Reset position Desc"]:K_ReplaceVars(addon.L["Achievement Calendar"]),
                            func = function()
                                if not IsAddOnLoaded("Blizzard_AchievementUI") then
                                    LoadAddOn("Blizzard_AchievementUI");
                                end
                                KrowiAF_AchievementCalendarFrame:ResetPosition();
                            end
                        },
                        DataManagerRememberLastPosition = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(2),
                            name = addon.L["Remember frame position"]:K_ReplaceVars(addon.L["Data Manager"]),
                            desc = addon.L["Remember frame position Desc"]:K_ReplaceVars(addon.L["Data Manager"]):KAF_AddDefaultValueText("Window.RememberLastPosition.DataManager"),
                            get = function() return addon.Options.db.profile.Window.RememberLastPosition.DataManager; end,
                            set = MovableDataManagerRememberLastPositionSet
                        },
                        DataManagerResetPosition = {
                            order = OrderPP(), type = "execute", width = AdjustedWidth(),
                            name = addon.L["Reset position"],
                            desc = addon.L["Reset position Desc"]:K_ReplaceVars(addon.L["Data Manager"]),
                            func = function()
                                if not IsAddOnLoaded("Blizzard_AchievementUI") then
                                    LoadAddOn("Blizzard_AchievementUI");
                                end
                                KrowiAF_DataManagerFrame:ResetPosition();
                            end
                        }
                    }
                },
                Offsets = {
                    order = OrderPP(), type = "group",
                    name = addon.L["Offsets"],
                    inline = true,
                    args = {
                        CategoriesFrameWidth = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Categories width offset"],
                            desc = addon.L["Categories width offset Desc"]:KAF_InjectAddonName():K_ReplaceVars(string.format(addon.Util.Colors.Yellow, addon.L["Expansions"])):KAF_AddDefaultValueText("Window.CategoriesFrameWidthOffset"),
                            min = -125, max = 250, step = 1,
                            get = function() return addon.Options.db.profile.Window.CategoriesFrameWidthOffset; end,
                            set = OffsetsCategoriesFrameWidthSet
                        },
                        AchievementsFrameWidth = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Achievements width offset"],
                            desc = addon.L["Achievements width offset Desc"]:KAF_InjectAddonName():K_ReplaceVars(string.format(addon.Util.Colors.Yellow, addon.L["Expansions"])):KAF_AddDefaultValueText("Window.AchievementsFrameWidthOffset"),
                            min = 0, max = 500, step = 1,
                            get = function() return addon.Options.db.profile.Window.AchievementsFrameWidthOffset; end,
                            set = OffsetsAchievementsFrameWidthSet
                        },
                        AchievementFrameHeight = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Achievement window height offset"],
                            desc = addon.L["Achievement window height offset Desc"]:KAF_InjectAddonName():K_ReplaceVars(string.format(addon.Util.Colors.Yellow, addon.L["Expansions"])):KAF_AddDefaultValueText("Window.AchievementFrameHeightOffset"):K_AddReloadRequired(),
                            min = -50, max = 750, step = 1,
                            get = function() return addon.Options.db.profile.Window.AchievementFrameHeightOffset; end,
                            set = OffsetsAchievementFrameHeightSet
                        }
                    }
                }
            }
        },
        Tabs = {
            order = OrderPP(), type = "group", childGroups = "tab",
            name = addon.L["Tabs"],
            args = {
                General = {
                    order = OrderPP(), type = "group",
                    name = addon.L["General"],
                    args = {
                        General = {
                            order = OrderPP(), type = "group", inline = true,
                            name = addon.L["General"],
                            args = {
                                Spacing = {
                                    order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                                    name = addon.L["Spacing"],
                                    desc = addon.L["Spacing Desc"]:KAF_AddDefaultValueText("TabsGeneral.Spacing"),
                                    min = -50, max = 50, step = 1,
                                    get = function() return addon.Options.db.profile.TabsGeneral.Spacing; end,
                                    set = function (_, value)
                                        addon.Options.db.profile.TabsGeneral.Spacing = value;
                                        addon.Gui:ShowHideTabs();
                                    end
                                }
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
        },
        Header = {
            order = OrderPP(), type = "group",
            name = addon.L["Header"],
            args = {
                AchievementPoints = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Achievement Points"],
                    args = {
                        Format = {
                            type = "select", width = AdjustedWidth(1.5),
                            name = addon.L["Format"],
                            desc = (""):KAF_AddDefaultValueText("AchievementPoints.Format", achievementPointsDisplays),
                            values = achievementPointsDisplays,
                            get = function() return addon.Options.db.profile.AchievementPoints.Format; end,
                            set = function (_, value) addon.Options.db.profile.AchievementPoints.Format = value; end
                        }
                    }
                },
                Tooltip = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Tooltip"],
                    args = {
                        AlwaysShowRealm = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Always show realm"],
                            desc = addon.L["Always show realm Desc"]:KAF_AddDefaultValueText("AchievementPoints.Tooltip.AlwaysShowRealm"),
                            get = function() return addon.Options.db.profile.AchievementPoints.Tooltip.AlwaysShowRealm; end,
                            set = function(_, value) addon.Options.db.profile.AchievementPoints.Tooltip.AlwaysShowRealm = value; end
                        },
                        ShowFaction = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Show faction icon"],
                            desc = addon.L["Show faction icon Desc"]:KAF_AddDefaultValueText("AchievementPoints.Tooltip.ShowFaction"),
                            get = function() return addon.Options.db.profile.AchievementPoints.Tooltip.ShowFaction; end,
                            set = function(_, value) addon.Options.db.profile.AchievementPoints.Tooltip.ShowFaction = value; end
                        },
                        MaxNumCharacters = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Maximum number of characters"],
                            desc = addon.L["Maximum number of characters Desc"]:KAF_AddDefaultValueText("AchievementPoints.Tooltip.MaxNumCharacters"),
                            min = 0, max = 100, step = 1,
                            get = function() return addon.Options.db.profile.AchievementPoints.Tooltip.MaxNumCharacters; end,
                            set = function(_, value) addon.Options.db.profile.AchievementPoints.Tooltip.MaxNumCharacters = value; end
                        },
                        KeepCurrentCharacter = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Keep current character"],
                            desc = addon.L["Keep current character Desc"]:K_ReplaceVars(addon.L["Maximum number of characters"]):KAF_AddDefaultValueText("AchievementPoints.Tooltip.KeepCurrentCharacter"),
                            get = function() return addon.Options.db.profile.AchievementPoints.Tooltip.KeepCurrentCharacter; end,
                            set = function(_, value) addon.Options.db.profile.AchievementPoints.Tooltip.KeepCurrentCharacter = value; end
                        },
                        SortPriority = {
                            order = OrderPP(), type = "group", inline = true,
                            name = addon.L["Sort priority"],
                            args = { --[[ Dynamically build via addon.Gui.AchievementFrameHeader.InjectDynamicOptions ]] }
                        }
                    }
                }
            }
        },
        Search = {
            order = OrderPP(), type = "group",
            name = addon.L["Search"],
            args = {
                SearchField = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Search field"],
                    args = {
                        ClearOnRightClick = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Clear search field on Right Click"],
                            desc = addon.L["Clear search field on Right Click Desc"]:KAF_AddDefaultValueText("SearchBox.ClearOnRightClick"),
                            get = function() return addon.Options.db.profile.SearchBox.ClearOnRightClick; end,
                            set = function(_, value) addon.Options.db.profile.SearchBox.ClearOnRightClick = value; end
                        },
                        ExcludeExcluded = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Exclude Excluded achievements"],
                            desc = addon.L["Exclude Excluded achievements Desc"]:KAF_AddDefaultValueText("SearchBox.ExcludeExcluded"),
                            get = function() return addon.Options.db.profile.SearchBox.ExcludeExcluded; end,
                            set = function(_, value) addon.Options.db.profile.SearchBox.ExcludeExcluded = value; end
                        },
                        OnlySearchFiltered = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Only search filtered achievements"],
                            desc = addon.L["Only search filtered achievements Desc"]:KAF_AddDefaultValueText("SearchBox.OnlySearchFiltered"),
                            get = function() return addon.Options.db.profile.SearchBox.OnlySearchFiltered; end,
                            set = function(_, value) addon.Options.db.profile.SearchBox.OnlySearchFiltered = value; end
                        },
                        Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
                        MinimumCharactersToSearch = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Minimum characters to search"],
                            desc = addon.L["Minimum characters to search Desc"]:KAF_AddDefaultValueText("SearchBox.MinimumCharactersToSearch"),
                            min = 1, max = 10, step = 1,
                            get = function() return addon.Options.db.profile.SearchBox.MinimumCharactersToSearch; end,
                            set = function(_, value) addon.Options.db.profile.SearchBox.MinimumCharactersToSearch = value; end
                        }
                    }
                },
                SearchPreview = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Search preview"],
                    args = {
                        NumberOfSearchPreviews = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Number of search previews"],
                            desc = addon.L["Number of search previews Desc"]:KAF_AddDefaultValueText("SearchBox.NumberOfSearchPreviews"):K_AddReloadRequired(),
                            min = 1, max = 1000, step = 1, -- max set via PostLoad
                            get = function() return addon.Options.db.profile.SearchBox.NumberOfSearchPreviews; end,
                            set = function(_, value) addon.Options.db.profile.SearchBox.NumberOfSearchPreviews = value; end
                        },
                        Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
                        ShowAllResultsInCategory = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Show All Results in Category"],
                            desc = addon.L["Show All Results in Category Desc"]:KAF_AddDefaultValueText("SearchBox.ShowAllResultsInCategory"),
                            get = function() return addon.Options.db.profile.SearchBox.ShowAllResultsInCategory; end,
                            set = function(_, value) addon.Options.db.profile.SearchBox.ShowAllResultsInCategory = value; end
                        },
                    }
                },
                MouseWheelPanScalar = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Mouse Wheel Scroll Speed"],
                    args = {
                        MouseWheelPanScalar = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Mouse Wheel Scroll Speed"],
                            desc = addon.L["Mouse Wheel Scroll Speed Desc"]:K_ReplaceVars(addon.L["Achievements"]):KAF_AddDefaultValueText("SearchBox.MouseWheelPanScalar"),
                            min = 1, max = 50, step = 1,
                            get = function() return addon.Options.db.profile.SearchBox.MouseWheelPanScalar; end,
                            set = SetSearchBoxMouseWheelPanScalar
                        }
                    }
                },
            }
        },
        Summary = {
            order = OrderPP(), type = "group",
            name = addon.L["Summary"],
            args = {
                Summary = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Summary"],
                    args = {
                        AutoNumAchievements = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Auto number of summary achievements"],
                            desc = addon.L["Auto number of summary achievements Desc"]:KAF_AddDefaultValueText("Summary.AutoNumAchievements"),
                            get = function() return addon.Options.db.profile.Summary.AutoNumAchievements; end,
                            set = function(_, value) addon.Options.db.profile.Summary.AutoNumAchievements = value; end
                        },
                        NumAchievements = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Number of summary achievements"],
                            desc = addon.L["Number of summary achievements Desc"]:KAF_AddDefaultValueText("Summary.NumAchievements"),
                            min = 1, max = 25, step = 1,
                            get = function() return addon.Options.db.profile.Summary.NumAchievements; end,
                            set = function(_, value)
                                addon.Options.db.profile.Summary.NumAchievements = value;
                                KrowiAF_SummaryFrame:UpdateAchievementsOnNextShow();
                            end,
                            disabled = function() return addon.Options.db.profile.Summary.AutoNumAchievements end
                        }
                    }
                },
                MouseWheelPanScalar = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Mouse Wheel Scroll Speed"],
                    args = {
                        MouseWheelPanScalar = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Mouse Wheel Scroll Speed"],
                            desc = addon.L["Mouse Wheel Scroll Speed Desc"]:K_ReplaceVars(addon.L["Achievements"]):KAF_AddDefaultValueText("Summary.MouseWheelPanScalar"),
                            min = 1, max = 50, step = 1,
                            get = function() return addon.Options.db.profile.Summary.MouseWheelPanScalar; end,
                            set = SetSummaryMouseWheelPanScalar
                        }
                    }
                }
            }
        },
        Categories = {
            order = OrderPP(), type = "group",
            name = addon.L["Categories"],
            args = {
                Indentation = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Indentation"],
                    args = {
                        Indentation = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Indentation"],
                            desc = addon.L["Indentation Desc"]:KAF_AddDefaultValueText("Categories.Indentation"),
                            min = 1, max = 50, step = 1,
                            get = function() return addon.Options.db.profile.Categories.Indentation; end,
                            set = SetCategoryIndentation
                        }
                    }
                },
                MouseWheelPanScalar = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Mouse Wheel Scroll Speed"],
                    args = {
                        MouseWheelPanScalar = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Mouse Wheel Scroll Speed"],
                            desc = addon.L["Mouse Wheel Scroll Speed Desc"]:K_ReplaceVars(addon.L["Categories"]):KAF_AddDefaultValueText("Categories.MouseWheelPanScalar"),
                            min = 1, max = 50, step = 1,
                            get = function() return addon.Options.db.profile.Categories.MouseWheelPanScalar; end,
                            set = SetCategoriesMouseWheelPanScalar
                        }
                    }
                },
                Tooltip = {
                    order = OrderPP(), type = "group",
                    name = addon.L["Tooltip"],
                    inline = true,
                    args = {
                        ShowNotObtainable = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Show Not Obtainable"]:K_ReplaceVars(addon.L["Not Obtainable"]),
                            desc = addon.L["Show Not Obtainable Desc"]:K_ReplaceVars(addon.L["Not Obtainable"]):KAF_AddDefaultValueText("Tooltip.Categories.ShowNotObtainable"),
                            get = function() return addon.Options.db.profile.Tooltip.Categories.ShowNotObtainable; end,
                            set = function(_, value) addon.Options.db.profile.Tooltip.Categories.ShowNotObtainable = value; end
                        }
                    }
                },
                Merge = {
                    order = OrderPP(), type = "group",
                    name = addon.L["Merge Small Categories"],
                    inline = true,
                    args = {
                        MergeSmallCategoriesThreshold = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Merge small categories threshold"],
                            desc = addon.L["Merge small categories threshold Desc"]:KAF_AddDefaultValueText("Window.MergeSmallCategoriesThreshold"),
                            min = 1, max = 50, step = 1,
                            get = function() return addon.Options.db.profile.Window.MergeSmallCategoriesThreshold; end,
                            set = MergeMergeSmallCategoriesThresholdSet
                        }
                    }
                }
            }
        },
        AdjustableCategories = {
            order = OrderPP(), type = "group", childGroups = "tab",
            name = addon.L["Adjustable Categories"],
            args = { --[[ Dynamically build via InjectDynamicAdjustableCategoryOptions ]] }
        },
        Achievements = {
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
                                CompactAchievements = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                                    name = addon.L["Compact Achievements"],
                                    desc = addon.L["Compact Achievements Desc"]:KAF_AddDefaultValueText("Achievements.Compact"):K_AddReloadRequired(),
                                    get = function() return addon.Options.db.profile.Achievements.Compact; end,
                                    set = function(_, value) addon.Options.db.profile.Achievements.Compact = value; end,
                                },
                                CenterHeader = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                                    name = addon.L["Center Header"],
                                    desc = addon.L["Center Header Desc"]:KAF_AddDefaultValueText("Achievements.CenterHeader"):K_AddReloadRequired(),
                                    get = function() return addon.Options.db.profile.Achievements.CenterHeader; end,
                                    set = function(_, value) addon.Options.db.profile.Achievements.CenterHeader = value; end,
                                },
                                HideDateCompleted = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                                    name = addon.L["Hide Date Completed"],
                                    desc = addon.L["Hide Date Completed Desc"]:KAF_AddDefaultValueText("Achievements.HideDateCompleted"):K_AddReloadRequired(),
                                    get = function() return addon.Options.db.profile.Achievements.HideDateCompleted; end,
                                    set = function(_, value) addon.Options.db.profile.Achievements.HideDateCompleted = value; end,
                                },
                                ShowAllianceFactionIcon = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                                    name = addon.L["Show Faction Faction Icon"]:K_ReplaceVars(addon.L["Alliance"]),
                                    desc = addon.L["Show Faction Faction Icon Desc"]:K_ReplaceVars(addon.L["Alliance"]):KAF_AddDefaultValueText("Achievements.ShowAllianceFactionIcon"),
                                    get = function() return addon.Options.db.profile.Achievements.ShowAllianceFactionIcon; end,
                                    set = function(_, value) addon.Options.db.profile.Achievements.ShowAllianceFactionIcon = value; end,
                                },
                                ShowHordeFactionIcon = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                                    name = addon.L["Show Faction Faction Icon"]:K_ReplaceVars(addon.L["Horde"]),
                                    desc = addon.L["Show Faction Faction Icon Desc"]:K_ReplaceVars(addon.L["Horde"]):KAF_AddDefaultValueText("Achievements.ShowHordeFactionIcon"),
                                    get = function() return addon.Options.db.profile.Achievements.ShowHordeFactionIcon; end,
                                    set = function(_, value) addon.Options.db.profile.Achievements.ShowHordeFactionIcon = value; end,
                                },
                                Objectives = {
                                    order = OrderPP(), type = "header",
                                    name = addon.L["Objectives"]
                                },
                                ForceTwoColumns = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                                    name = addon.L["Force two columns"],
                                    desc = addon.L["Force two columns Desc"]:KAF_AddDefaultValueText("Achievements.Objectives.ForceTwoColumns"),
                                    get = function() return addon.Options.db.profile.Achievements.Objectives.ForceTwoColumns; end,
                                    set = function(_, value) addon.Options.db.profile.Achievements.Objectives.ForceTwoColumns = value; end
                                },
                                ForceTwoColumnsThreshold = {
                                    order = OrderPP(), type = "range", width = AdjustedWidth(1.35),
                                    name = addon.L["Force two columns threshold"],
                                    desc = addon.L["Force two columns threshold Desc"]:KAF_AddDefaultValueText("Achievements.Objectives.ForceTwoColumnsThreshold"),
                                    min = 0, max = 50, step = 1,
                                    get = function() return addon.Options.db.profile.Achievements.Objectives.ForceTwoColumnsThreshold; end,
                                    set = function(_, value) addon.Options.db.profile.Achievements.Objectives.ForceTwoColumnsThreshold = value; end,
                                    disabled = function() return not addon.Options.db.profile.Achievements.Objectives.ForceTwoColumns; end
                                },
                                CriteriaBehaviour = {
                                    order = OrderPP(), type = "select", style = "radio",
                                    name = addon.L["Criteria Behaviour"],
                                    desc = addon.L["Criteria Behaviour Desc"]:K_ReplaceVars{
                                        overflow = addon.L["Overflow"],
                                        truncate = addon.L["Truncate"],
                                        flexible = addon.L["Flexible"]
                                    }:KAF_AddDefaultValueText("Achievements.Objectives.CriteriaBehaviour", criteriaBehaviour),
                                    values = criteriaBehaviour,
                                    get = function() return addon.Options.db.profile.Achievements.Objectives.CriteriaBehaviour; end,
                                    set = function (_, value) addon.Options.db.profile.Achievements.Objectives.CriteriaBehaviour = value; end
                                }
                            }
                        },
                        MouseWheelPanScalar = {
                            order = OrderPP(), type = "group", inline = true,
                            name = addon.L["Mouse Wheel Scroll Speed"],
                            args = {
                                MouseWheelPanScalar = {
                                    order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                                    name = addon.L["Mouse Wheel Scroll Speed"],
                                    desc = addon.L["Mouse Wheel Scroll Speed Desc"]:K_ReplaceVars(addon.L["Achievements"]):KAF_AddDefaultValueText("Achievements.MouseWheelPanScalar"),
                                    min = 1, max = 50, step = 1,
                                    get = function() return addon.Options.db.profile.Achievements.MouseWheelPanScalar; end,
                                    set = SetAchievementsMouseWheelPanScalar
                                }
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
                                EarnedByCharacters = {
                                    order = OrderPP(), type = "range", width = AdjustedWidth(1.35),
                                    name = addon.L["Number of Earned By characters"]:K_ReplaceVars(addon.L["Earned By"]),
                                    desc = addon.L["Number of Earned By characters Desc"]:KAF_AddDefaultValueText("Tooltip.Achievements.EarnedBy.Characters"),
                                    min = 0, max = 100, step = 1,
                                    get = function() return addon.Options.db.profile.Tooltip.Achievements.EarnedBy.Characters; end,
                                    set = function(_, value) addon.Options.db.profile.Tooltip.Achievements.EarnedBy.Characters = value; end
                                },
                                EarnedByNotCharacters = {
                                    order = OrderPP(), type = "range", width = AdjustedWidth(1.35),
                                    name = addon.L["Number of Not Earned By characters"]:K_ReplaceVars(addon.L["Not Earned By"]),
                                    desc = addon.L["Number of Not Earned By characters Desc"]:KAF_AddDefaultValueText("Tooltip.Achievements.EarnedBy.NotCharacters"),
                                    min = 0, max = 100, step = 1,
                                    get = function() return addon.Options.db.profile.Tooltip.Achievements.EarnedBy.NotCharacters; end,
                                    set = function(_, value)addon.Options.db.profile.Tooltip.Achievements.EarnedBy.NotCharacters = value;end
                                },
                                EarnedByAlwaysShowRealm = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                                    name = addon.L["Always show realm"],
                                    desc = addon.L["Always show realm Desc"]:KAF_AddDefaultValueText("Tooltip.Achievements.EarnedBy.AlwaysShowRealm"),
                                    get = function() return addon.Options.db.profile.Tooltip.Achievements.EarnedBy.AlwaysShowRealm; end,
                                    set = function(_, value) addon.Options.db.profile.Tooltip.Achievements.EarnedBy.AlwaysShowRealm = value; end
                                },
                                Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.35), name = ""},
                                HideNotEarnedByIfEarnedByCurrentCharacter = {
                                    order = OrderPP(), type = "toggle", width = "full",
                                    name = addon.L["Hide Not Earned By if current character earned the achievement"]:K_ReplaceVars(addon.L["Not Earned By"]),
                                    desc = addon.L["Hide Not Earned By if current character earned the achievement Desc"]:K_ReplaceVars{
                                        notEarnedBy = addon.L["Not Earned By"],
                                        earnedBy = addon.L["Earned By"]
                                    }:KAF_AddDefaultValueText("Tooltip.Achievements.EarnedBy.HideNotEarnedByIfEarnedByCurrentCharacter"),
                                    get = function() return addon.Options.db.profile.Tooltip.Achievements.EarnedBy.HideNotEarnedByIfEarnedByCurrentCharacter; end,
                                    set = function(_, value) addon.Options.db.profile.Tooltip.Achievements.EarnedBy.HideNotEarnedByIfEarnedByCurrentCharacter = value; end
                                },
                                AddedInVersion = {
                                    order = OrderPP(), type = "header",
                                    name = addon.L["Added in version"]
                                },
                                ShowAddedInVersion = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                                    name = addon.L["Show Added in version"]:K_ReplaceVars(addon.L["Added in version"]),
                                    desc = addon.L["Show Added in version Desc"]:K_ReplaceVars(addon.L["Added in version"]):KAF_AddDefaultValueText("Tooltip.Achievements.ShowAddedInVersion"),
                                    get = function() return addon.Options.db.profile.Tooltip.Achievements.ShowAddedInVersion; end,
                                    set = function(_, value) addon.Options.db.profile.Tooltip.Achievements.ShowAddedInVersion = value; end
                                },
                                PartOfAChain = {
                                    order = OrderPP(), type = "header",
                                    name = addon.L["Part of a chain"]
                                },
                                ShowPartOfAChain = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                                    name = addon.L["Show Part of a chain"]:K_ReplaceVars(addon.L["Part of a chain"]),
                                    desc = addon.L["Show Part of a chain Desc"]:K_ReplaceVars(addon.L["Part of a chain"]):KAF_AddDefaultValueText("Tooltip.Achievements.ShowPartOfAChain"),
                                    get = function() return addon.Options.db.profile.Tooltip.Achievements.ShowPartOfAChain; end,
                                    set = function(_, value) addon.Options.db.profile.Tooltip.Achievements.ShowPartOfAChain = value; end
                                },
                                ShowCurrentCharacterIconsPartOfAChain = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                                    name = addon.L["Show current character icons"],
                                    desc = addon.L["Show current character icons Desc"]:K_ReplaceVars{
                                        partOfAChain = addon.L["Part of a chain"],
                                        requiredFor = addon.L["Required for"]
                                    }:KAF_AddDefaultValueText("Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain"),
                                    get = function() return addon.Options.db.profile.Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain; end,
                                    set = function(_, value) addon.Options.db.profile.Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain = value; end,
                                    disabled = function() return not addon.Options.db.profile.Tooltip.Achievements.ShowPartOfAChain; end
                                },
                                RequiredFor = {
                                    order = OrderPP(), type = "header",
                                    name = addon.L["Required for"]
                                },
                                ShowRequiredFor = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                                    name = addon.L["Show Required for"]:K_ReplaceVars(addon.L["Required for"]),
                                    desc = addon.L["Show Required for Desc"]:K_ReplaceVars(addon.L["Required for"]):KAF_AddDefaultValueText("Tooltip.Achievements.ShowRequiredFor"),
                                    get = function() return addon.Options.db.profile.Tooltip.Achievements.ShowRequiredFor; end,
                                    set = function(_, value) addon.Options.db.profile.Tooltip.Achievements.ShowRequiredFor = value; end
                                },
                                ShowCurrentCharacterIconsRequiredFor = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                                    name = addon.L["Show current character icons"],
                                    desc = addon.L["Show current character icons Desc"]:K_ReplaceVars{
                                        partOfAChain = addon.L["Part of a chain"],
                                        requiredFor = addon.L["Required for"]
                                    }:KAF_AddDefaultValueText("Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor"),
                                    get = function() return addon.Options.db.profile.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor; end,
                                    set = function(_, value) addon.Options.db.profile.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor = value; end,
                                    disabled = function() return not addon.Options.db.profile.Tooltip.Achievements.ShowRequiredFor; end
                                },
                                OtherFaction = {
                                    order = OrderPP(), type = "header",
                                    name = addon.L["Other faction"]
                                },
                                ShowOtherFaction = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                                    name = addon.L["Show Other faction"]:K_ReplaceVars(addon.L["Other faction"]),
                                    desc = addon.L["Show Other faction Desc"]:K_ReplaceVars(addon.L["Other faction"]):KAF_AddDefaultValueText("Tooltip.Achievements.ShowOtherFaction"),
                                    get = function() return addon.Options.db.profile.Tooltip.Achievements.ShowOtherFaction; end,
                                    set = function(_, value) addon.Options.db.profile.Tooltip.Achievements.ShowOtherFaction = value; end
                                },
                                ObjectivesProgress = {
                                    order = OrderPP(), type = "header",
                                    name = addon.L["Objectives progress"]
                                },
                                ObjectivesProgressShow = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                                    name = addon.L["Show Objectives progress"]:K_ReplaceVars(addon.L["Objectives progress"]),
                                    desc = addon.L["Show Objectives progress Desc"]:K_ReplaceVars(addon.L["Objectives progress"]):KAF_AddDefaultValueText("Tooltip.Achievements.ObjectivesProgress.Show"),
                                    get = function() return addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.Show; end,
                                    set = function(_, value) addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.Show = value; end
                                },
                                ObjectivesProgressShowWhenAchievementCompleted = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                                    name = addon.L["When achievement completed"]:K_ReplaceVars(addon.L["Objectives progress"]),
                                    desc = addon.L["When achievement completed Desc"]:K_ReplaceVars(addon.L["Objectives progress"]):KAF_AddDefaultValueText("Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted"),
                                    get = function() return addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted; end,
                                    set = function(_, value) addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted = value; end,
                                    disabled = function() return not addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.Show; end
                                },
                                ObjectivesProgressSecondColumnThreshold = {
                                    order = OrderPP(), type = "range", width = AdjustedWidth(1.35),
                                    name = addon.L["Second column threshold"],
                                    desc = addon.L["Second column threshold Desc"]:KAF_AddDefaultValueText("Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold"),
                                    min = 0, max = 100, step = 1,
                                    get = function() return addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold; end,
                                    set = function(_, value) addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold = value; end,
                                    disabled = function() return not addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.Show; end
                                },
                                MostProgress = {
                                    order = OrderPP(), type = "header",
                                    name = addon.L["Most progress"]
                                },
                                MostProgressAlwaysShowRealm = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.35),
                                    name = addon.L["Always show realm"],
                                    desc = addon.L["Always show realm Desc"]:KAF_AddDefaultValueText("Tooltip.Achievements.MostProgress.AlwaysShowRealm"),
                                    get = function() return addon.Options.db.profile.Tooltip.Achievements.MostProgress.AlwaysShowRealm; end,
                                    set = function(_, value) addon.Options.db.profile.Tooltip.Achievements.MostProgress.AlwaysShowRealm = value; end
                                },
                                MostProgressCharacters = {
                                    order = OrderPP(), type = "range", width = AdjustedWidth(1.35),
                                    name = addon.L["Number of Most progress characters"]:K_ReplaceVars(addon.L["Most progress"]),
                                    desc = addon.L["Number of Most progress characters Desc"]:KAF_AddDefaultValueText("Tooltip.Achievements.MostProgress.Characters"),
                                    min = 0, max = 100, step = 1,
                                    get = function() return addon.Options.db.profile.Tooltip.Achievements.MostProgress.Characters; end,
                                    set = function(_, value) addon.Options.db.profile.Tooltip.Achievements.MostProgress.Characters = value; end
                                }
                            }
                        }
                    }
                }
            }
        },
        RightClickMenu = {
            order = OrderPP(), type = "group",
            name = addon.L["Right Click Menu"],
            args = {
                Button = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Button"],
                    args = {
                        ShowButtonOnAchievement = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Show Right Click Menu"]:K_ReplaceVars(addon.L["Right Click Menu"]),
                            desc = addon.L["Show Right Click Menu Desc"]:K_ReplaceVars(addon.L["Right Click Menu"]):KAF_AddDefaultValueText("RightClickMenu.ShowButtonOnAchievement"):K_AddReloadRequired(),
                            get = function() return addon.Options.db.profile.RightClickMenu.ShowButtonOnAchievement; end,
                            set = function(_, value) addon.Options.db.profile.RightClickMenu.ShowButtonOnAchievement = value; end
                        }
                    }
                },
                Wowhead = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Wowhead Link"],
                    args = {
                        AddLocale = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Add Locale"],
                            desc = addon.L["Add Locale Desc"]:K_ReplaceVars(addon.L["Wowhead Link"]):KAF_AddDefaultValueText("RightClickMenu.WowheadLink.AddLocale"),
                            get = function() return addon.Options.db.profile.RightClickMenu.WowheadLink.AddLocale; end,
                            set = function(_, value) addon.Options.db.profile.RightClickMenu.WowheadLink.AddLocale = value; end
                        },
                        Blank12 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
                        AddRelatedTab = {
                            order = OrderPP(), type = "select", width = AdjustedWidth(1.5),
                            name = addon.L["Related Tab"],
                            desc = addon.L["Related Tab Desc"]:K_ReplaceVars(addon.L["Wowhead Link"]):KAF_AddDefaultValueText("RightClickMenu.WowheadLink.AddRelatedTab", wowheadRelatedTabs),
                            values = wowheadRelatedTabs,
                            get = function() return addon.Options.db.profile.RightClickMenu.WowheadLink.AddRelatedTab; end,
                            set = function (_, value) addon.Options.db.profile.RightClickMenu.WowheadLink.AddRelatedTab = value; end
                        }
                    }
                },
            }
        },
        Calendar = {
            order = OrderPP(), type = "group",
            name = addon.L["Calendar"],
            args = {
                General = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["General"],
                    args = {
                        LockAchievementMonth = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Lock month when closed by achievement"],
                            desc = addon.L["Lock month when closed by achievement Desc"]:KAF_AddDefaultValueText("Calendar.LockAchievementMonth"),
                            get = function() return addon.Options.db.profile.Calendar.LockAchievementMonth; end,
                            set = function(_, value) addon.Options.db.profile.Calendar.LockAchievementMonth = value; end
                        },
                        Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
                        LockMonth = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Lock month"],
                            desc = addon.L["Lock month Desc"]:KAF_AddDefaultValueText("Calendar.LockMonth"),
                            get = function() return addon.Options.db.profile.Calendar.LockMonth; end,
                            set = function(_, value) addon.Options.db.profile.Calendar.LockMonth = value; end
                        }
                    }
                },
                Weekdays = {
                    order = OrderPP(), type = "group",
                    name = addon.L["Weekdays"],
                    inline = true,
                    args = {
                        FirstDayOfTheWeek = {
                            order = OrderPP(), type = "select", width = AdjustedWidth(1.5),
                            name = addon.L["First day of the week"],
                            desc = addon.L["First day of the week Desc"],
                            values = CALENDAR_WEEKDAY_NAMES,
                            get = function() return addon.Options.db.profile.Calendar.FirstWeekDay; end,
                            set = function (_, value)
                                addon.Options.db.profile.Calendar.FirstWeekDay = value;
                                KrowiAF_AchievementCalendarFrame:Update();
                            end
                        }
                    }
                },
                SideFrameMouseWheelPanScalar = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Side Window"] .. " " .. addon.L["Mouse Wheel Scroll Speed"],
                    args = {
                        MouseWheelPanScalar = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Mouse Wheel Scroll Speed"],
                            desc = addon.L["Mouse Wheel Scroll Speed Desc"]:K_ReplaceVars(addon.L["Achievements"]):KAF_AddDefaultValueText("Calendar.MouseWheelPanScalar"),
                            min = 1, max = 50, step = 1,
                            get = function() return addon.Options.db.profile.Calendar.MouseWheelPanScalar; end,
                            set = SetCalendarMouseWheelPanScalar
                        }
                    }
                }
            }
        },
        Criteria = {
            order = OrderPP(), type = "group",
            name = addon.L["Criteria"],
            args = {
                Tooltip = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Tooltip"],
                    args = {
                        ShowCriteria = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Show Criteria"],
                            desc = function() return addon.L["Show Criteria Desc"]:K_ReplaceVars{
                                criteria = (addon.GetAchievementCriteriaInfo(1206, 1)),
                                achievement = (select(2, addon.GetAchievementInfo(1206)))
                            }:KAF_AddDefaultValueText("Tooltip.Criteria.Show"); end,
                            get = function() return addon.Options.db.profile.Tooltip.Criteria.Show; end,
                            set = function(_, value) addon.Options.db.profile.Tooltip.Criteria.Show = value; end
                        },
                        ShowForAchievement = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Show For Achievement"],
                            desc = function() return addon.L["Show For Achievement Desc"]:K_ReplaceVars{
                                criteria = (addon.GetAchievementCriteriaInfo(1206, 1)),
                                achievement = (select(2, addon.GetAchievementInfo(1206)))
                            }:KAF_AddDefaultValueText("Tooltip.Criteria.ShowForAchievement"); end,
                            get = function() return addon.Options.db.profile.Tooltip.Criteria.ShowForAchievement; end,
                            set = function(_, value) addon.Options.db.profile.Tooltip.Criteria.ShowForAchievement = value; end
                        },
                        ShowCriteriaIf = {
                            order = OrderPP(), type = "header",
                            name = addon.L["Show Criteria If"]
                        },
                        ShowCriteriaIfAchievementIsCompleted = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Achievement is Completed"],
                            desc = addon.L["Achievement is Completed Desc"]:KAF_AddDefaultValueText("Tooltip.Criteria.ShowIf.AchievementIsCompleted"),
                            get = function() return addon.Options.db.profile.Tooltip.Criteria.ShowIf.AchievementIsCompleted; end,
                            set = function(_, value) addon.Options.db.profile.Tooltip.Criteria.ShowIf.AchievementIsCompleted = value; end
                        },
                        ShowCriteriaIfAchievementWasNotEarnedByMe = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Achievement was Not Earned by Me"],
                            desc = addon.L["Achievement was Not Earned by Me Desc"]:KAF_AddDefaultValueText("Tooltip.Criteria.ShowIf.AchievementWasNotEarnedByMe"),
                            get = function() return addon.Options.db.profile.Tooltip.Criteria.ShowIf.AchievementWasNotEarnedByMe; end,
                            set = function(_, value) addon.Options.db.profile.Tooltip.Criteria.ShowIf.AchievementWasNotEarnedByMe = value; end
                        },
                        ShowCriteriaIfCriteriaIsCompleted = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Criteria is Completed"],
                            desc = addon.L["Criteria is Completed Desc"]:KAF_AddDefaultValueText("Tooltip.Criteria.ShowIf.CriteriaIsCompleted"),
                            get = function() return addon.Options.db.profile.Tooltip.Criteria.ShowIf.CriteriaIsCompleted; end,
                            set = function(_, value) addon.Options.db.profile.Tooltip.Criteria.ShowIf.CriteriaIsCompleted = value; end
                        },
                        Blank42 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
                    }
                }
            }
        },
        DataManager = {
            order = OrderPP(), type = "group",
            name = addon.L["Data Manager"],
            args = {
                MouseWheelPanScalar = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Mouse Wheel Scroll Speed"],
                    args = {
                        MouseWheelPanScalar = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Mouse Wheel Scroll Speed"],
                            desc = addon.L["Mouse Wheel Scroll Speed Desc"]:K_ReplaceVars(addon.L["Characters"]):KAF_AddDefaultValueText("DataManager.MouseWheelPanScalar"),
                            min = 1, max = 50, step = 1,
                            get = function() return addon.Options.db.profile.DataManager.MouseWheelPanScalar; end,
                            set = SetDataManagerMouseWheelPanScalar
                        }
                    }
                }
            }
        }
    }
};

function RefreshOptions()
    local profile = addon.Options.db.profile;
    MovableSwitchMovableSet(nil, profile.Window.Movable);
    MovableAchievementWindowRememberLastPositionSet(nil, profile.Window.RememberLastPosition.AchievementWindow);
    MovableCalendarRememberLastPositionSet(nil, profile.Window.RememberLastPosition.Calendar);
    MovableDataManagerRememberLastPositionSet(nil, profile.Window.RememberLastPosition.DataManager);
    OffsetsCategoriesFrameWidthSet(nil, profile.Window.CategoriesFrameWidthOffset);
    OffsetsAchievementsFrameWidthSet(nil, profile.Window.AchievementsFrameWidthOffset);
    OffsetsAchievementFrameHeightSet(nil, profile.Window.AchievementFrameHeightOffset);
    addon.Gui:ShowHideTabs(); -- Dynamic Tab Order and Visibility is handled by this one
    SetSearchBoxMouseWheelPanScalar(nil, profile.SearchBox.MouseWheelPanScalar);
    SetSummaryMouseWheelPanScalar(nil, profile.Summary.MouseWheelPanScalar);
    SetCategoryIndentation(nil, profile.Categories.Indentation);
    SetCategoriesMouseWheelPanScalar(nil, profile.Categories.MouseWheelPanScalar);
    MergeMergeSmallCategoriesThresholdSet(nil, profile.Window.MergeSmallCategoriesThreshold);
    DrawSubCategories(addon.Data.WatchListCategories);
    DrawSubCategories(addon.Data.TrackingAchievementsCategories);
    ShowExcludedCategory();
    DrawSubCategories(addon.Data.ExcludedCategories);
    SetAchievementsMouseWheelPanScalar(nil, profile.Achievements.MouseWheelPanScalar);
    SetCalendarMouseWheelPanScalar(nil, profile.Calendar.MouseWheelPanScalar);
    SetDataManagerMouseWheelPanScalar(nil, profile.DataManager.MouseWheelPanScalar);
end