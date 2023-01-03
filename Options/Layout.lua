-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;
options.Layout = {};
local layout = options.Layout;
local widthMultiplier = addon.Options.WidthMultiplier;

function layout.InjectDynamicCategoryOptions(categoryIndex, category, categoryDisplayName, tabIndex, tab, tabDisplayName, defaultValue)
    if not KrowiAF_InjectOptions.DefaultsExists("AdjustableCategories." .. category) then
        KrowiAF_InjectOptions.AddDefaults("AdjustableCategories", category, { });
    end

    KrowiAF_InjectOptions.AddDefaults("AdjustableCategories." .. category, tabIndex, defaultValue);

    if not KrowiAF_InjectOptions.TableExists("Layout.args.AdjustableCategories.args." .. category) then
        KrowiAF_InjectOptions.AddTable("Layout.args.AdjustableCategories.args", category, {
            order = categoryIndex, type = "group",
            name = categoryDisplayName,
            args = {}
        });
    end

    if not KrowiAF_InjectOptions.TableExists("Layout.args.AdjustableCategories.args." .. category .. ".args.Tabs") then
        KrowiAF_InjectOptions.AddTable("Layout.args.AdjustableCategories.args." .. category .. ".args", "Tabs", {
            order = tabIndex + 9, type = "header",
            name = addon.L["Tabs"]
        });
    end

    KrowiAF_InjectOptions.AddTable("Layout.args.AdjustableCategories.args." .. category .. ".args", tab, {
        order = tabIndex + 10, type = "toggle", width = 1 * widthMultiplier,
        name = tabDisplayName,
        desc = addon.L["Requires a reload"]:AddDefaultValueText("AdjustableCategories." .. category .. "." .. tabIndex),
        get = function() return addon.Options.db.AdjustableCategories[category][tabIndex]; end,
        set = function()
            addon.Options.db.AdjustableCategories[category][tabIndex] = not addon.Options.db.AdjustableCategories[category][tabIndex];
        end
    });
end

local function DrawWatchListSubCategories()
    if addon.GUI.SelectedTab == nil then -- If nil, not yet loaded
        return;
    end
    -- Reset all
    for i = 1, #addon.Data.WatchListCategories do
        addon.Data.WatchListCategories[i].Achievements = nil;
        addon.Data.WatchListCategories[i].Children = nil;
    end
    addon.GUI.CategoriesFrame:Update(true);
    addon.GUI.AchievementsFrame:ForceUpdate();
    -- Draw again
    addon.Data.LoadWatchedAchievements();
end

local function SetShowWatchListSubCategories()
    addon.Options.db.Categories.WatchList.ShowSubCategories = not addon.Options.db.Categories.WatchList.ShowSubCategories;
    DrawWatchListSubCategories();
    options.Debug(addon.L["Show Sub Categories"], addon.Options.db.Categories.WatchList.ShowSubCategories);
end

local function ClearAllWatched()
    for i = 1, #addon.Data.WatchListCategories do
        addon.Data.WatchListCategories[i].Achievements = nil;
        addon.Data.WatchListCategories[i].Children = nil;
    end
    if addon.GUI.SelectedTab ~= nil then -- If nil, not yet loaded
        if SavedData.WatchedAchievements then
            for id, _ in next, SavedData.WatchedAchievements do
                addon.Data.Achievements[id]:DoNotWatch();
            end
        end
        addon.GUI.CategoriesFrame:Update(true);
        addon.GUI.AchievementsFrame:ForceUpdate();
    end
    SavedData.WatchedAchievements = nil;
end

local function DrawTrackingAchievementsSubCategories()
    if addon.GUI.SelectedTab == nil then -- If nil, not yet loaded
        return;
    end
    -- Reset all
    for i = 1, #addon.Data.TrackingAchievementsCategories do
        addon.Data.TrackingAchievementsCategories[i].Achievements = nil;
        addon.Data.TrackingAchievementsCategories[i].Children = nil;
    end
    addon.GUI.CategoriesFrame:Update(true);
    addon.GUI.AchievementsFrame:ForceUpdate();
    -- Draw again
    addon.Data.LoadTrackingAchievements();
end

local function SetShowTrackingAchievementsSubCategories()
    addon.Options.db.Categories.TrackingAchievements.ShowSubCategories = not addon.Options.db.Categories.TrackingAchievements.ShowSubCategories;
    DrawTrackingAchievementsSubCategories();
    options.Debug(addon.L["Show Sub Categories"], addon.Options.db.Categories.TrackingAchievements.ShowSubCategories);
end

local function ShowExcludedCategory()
    if addon.GUI.SelectedTab == nil then -- If nil, not yet loaded
        return;
    end
    if addon.Options.db.Categories.Excluded.Show then
        addon.Data.LoadExcludedAchievements();
    else
        for i = 1, #addon.Data.ExcludedCategories do
            addon.Data.ExcludedCategories[i].Achievements = nil;
            addon.Data.ExcludedCategories[i].Children = nil;
        end
        addon.GUI.CategoriesFrame:Update(true);
        addon.GUI.AchievementsFrame:ForceUpdate();
    end
end

local function SetShowExcludedCategory()
    addon.Options.db.Categories.Excluded.Show = not addon.Options.db.Categories.Excluded.Show;
    ShowExcludedCategory();
    options.Debug(addon.L["Show Excluded Category"] .. " " .. addon.L["Excluded"], addon.Options.db.Categories.Excluded.Show);
end

local function IncludeAllExcluded()
    for i = 1, #addon.Data.ExcludedCategories do
        addon.Data.ExcludedCategories[i].Achievements = nil;
        addon.Data.ExcludedCategories[i].Children = nil;
    end
    if addon.GUI.SelectedTab == nil then -- If nil, not yet loaded
        SavedData.ExcludedAchievements = nil;
        return;
    end
    if SavedData.ExcludedAchievements then
        for id, _ in next, SavedData.ExcludedAchievements do
            addon.Data.Achievements[id]:Include();
        end
    end
    addon.GUI.CategoriesFrame:Update(true);
    addon.GUI.AchievementsFrame:ForceUpdate();
    SavedData.ExcludedAchievements = nil;
end

local function DrawExcludedSubCategories()
    if addon.GUI.SelectedTab == nil then -- If nil, not yet loaded
        return;
    end
    -- Reset all
    for i = 1, #addon.Data.ExcludedCategories do
        addon.Data.ExcludedCategories[i].Achievements = nil;
        addon.Data.ExcludedCategories[i].Children = nil;
    end
    addon.GUI.CategoriesFrame:Update(true);
    addon.GUI.AchievementsFrame:ForceUpdate();
    -- Draw again
    addon.Data.LoadExcludedAchievements();
end

local function SetShowExcludedSubCategories()
    addon.Options.db.Categories.Excluded.ShowSubCategories = not addon.Options.db.Categories.Excluded.ShowSubCategories;
    DrawExcludedSubCategories();
    options.Debug(addon.L["Show Sub Categories"], addon.Options.db.Categories.Excluded.ShowSubCategories);
end

function layout.AddMoreWatchListOptions()
    options.InjectOptionsTableAdd({
        order = 1.1, type = "toggle", width = 1 * widthMultiplier,
        name = addon.L["Show Sub Categories"],
        desc = addon.Util.ReplaceVars
        {
            addon.L["Show Sub Categories Desc"],
            category = addon.L["Watch List"]
        },
        get = function() return addon.Options.db.Categories.WatchList.ShowSubCategories; end,
        set = SetShowWatchListSubCategories
    }, "ShowWatchedSubCategories", "args", "Layout", "args", "AdjustableCategories", "args", "WatchList");

    options.InjectOptionsTableAdd({
        order = 1.2, type = "execute", width = 1 * widthMultiplier,
        name = addon.L["Clear all"],
        desc = addon.L["Clear all Desc"],
        func = ClearAllWatched
    }, "ClearAll", "args", "Layout", "args", "AdjustableCategories", "args", "WatchList");
end

function layout.AddMoreTrackingAchievementsOptions()
    options.InjectOptionsTableAdd({
        order = 1.1, type = "toggle", width = 1 * widthMultiplier,
        name = addon.L["Load Tracking Achievements"],
        desc = addon.L["Load Tracking Achievements Desc"],
        get = function() return addon.Options.db.Categories.TrackingAchievements.DoLoad; end,
        set = function()
            addon.Options.db.Categories.TrackingAchievements.DoLoad = not addon.Options.db.Categories.TrackingAchievements.DoLoad;
            options.Debug(addon.L["Load Tracking Achievements"], addon.Options.db.Categories.TrackingAchievements.DoLoad);
        end
    }, "LoadTrackingAchievements", "args", "Layout", "args", "AdjustableCategories", "args", "TrackingAchievements");

    options.InjectOptionsTableAdd({
        order = 1.2, type = "toggle", width = 1 * widthMultiplier,
        name = addon.L["Show Sub Categories"],
        desc = addon.Util.ReplaceVars
        {
            addon.L["Show Sub Categories Desc"],
            category = addon.L["Tracking Achievements"]
        },
        get = function() return addon.Options.db.Categories.TrackingAchievements.ShowSubCategories; end,
        set = SetShowTrackingAchievementsSubCategories
    }, "ShowTrackingSubCategories", "args", "Layout", "args", "AdjustableCategories", "args", "TrackingAchievements");
end

function layout.AddMoreExcludedOptions()
    options.InjectOptionsTableAdd({
        order = 1.1, type = "toggle", width = 1 * widthMultiplier,
        name = addon.L["Show Excluded Category"],
        desc = addon.Util.ReplaceVars
        {
            addon.L["Show Excluded Category Desc"],
            excluded = addon.L["Excluded"]
        },
        get = function() return addon.Options.db.Categories.Excluded.Show; end,
        set = SetShowExcludedCategory
    }, "ShowExcludedSubCategories", "args", "Layout", "args", "AdjustableCategories", "args", "Excluded");

    options.InjectOptionsTableAdd({
        order = 1.2, type = "execute", width = 1 * widthMultiplier,
        name = addon.L["Include all"],
        desc = addon.L["Include all Desc"],
        func = IncludeAllExcluded
    }, "IncludeAll", "args", "Layout", "args", "AdjustableCategories", "args", "Excluded");

    options.InjectOptionsTableAdd({
        order = 2.1, type = "toggle", width = 1 * widthMultiplier,
        name = addon.L["Show Sub Categories"],
        desc = addon.Util.ReplaceVars
        {
            addon.L["Show Sub Categories Desc"],
            category = addon.L["Excluded"]
        },
        disabled = function() return not addon.Options.db.Categories.Excluded.Show; end,
        get = function() return addon.Options.db.Categories.Excluded.ShowSubCategories; end,
        set = SetShowExcludedSubCategories
    }, "ShowExcludedSubCategories", "args", "Layout", "args", "AdjustableCategories", "args", "Excluded");
end

local achievementPointsDisplays = {
    addon.L["Account wide (default)"],
    addon.L["Character / Account wide"],
    addon.L["Character only"]
};

local function SetCompactAchievements()
    addon.Options.db.Achievements.Compact = not addon.Options.db.Achievements.Compact;
    options.Debug(addon.L["Compact Achievements"], addon.Options.db.Achievements.Compact);
end

local function SetObjectivesProgressShow()
    addon.Options.db.Tooltip.Achievements.ObjectivesProgress.Show = not addon.Options.db.Tooltip.Achievements.ObjectivesProgress.Show;
    local objectivesProgressShowWhenAchievementCompleted = LibStub("AceConfigRegistry-3.0"):GetOptionsTable(addon.L["Layout"], "cmd", "KROWIAF-0.0").args.Achievements.args.Tooltip.args.ObjectivesProgressShowWhenAchievementCompleted; -- cmd and KROWIAF-0.0 are just to make the function work
    objectivesProgressShowWhenAchievementCompleted.disabled = not addon.Options.db.Tooltip.Achievements.ObjectivesProgress.Show;                        
    options.Debug(addon.L["Show Objectives progress"], addon.Options.db.Tooltip.Achievements.ObjectivesProgress.Show);
end

local wowheadRelatedTabs = {
    addon.L["None"],
    addon.L["Criteria of"],
    addon.L["Guides"],
    addon.L["News"],
    addon.L["Comments"],
    addon.L["Screenshots"]
};

local criteriaBehaviour = {
    addon.L["Overflow"],
    addon.L["Truncate"],
    addon.L["Flexible"],
    -- addon.L["Wrap"]
};

local function SwitchMovable()
    addon.Options.db.Window.Movable = not addon.Options.db.Window.Movable;
    if addon.Options.db.Window.Movable then
        addon.MakeWindowMovable();
    else
        addon.MakeWindowStatic();
    end
end

local function SwitchRememberLastPositionAchievementWindow()
    addon.Options.db.Window.RememberLastPosition.AchievementWindow = not addon.Options.db.Window.RememberLastPosition.AchievementWindow;
    if not addon.Options.db.Window.RememberLastPosition.AchievementWindow then
        addon.GUI.ResetAchievementWindowPosition();
    end
end

local function SwitchRememberLastPositionCalendar()
    addon.Options.db.Window.RememberLastPosition.Calendar = not addon.Options.db.Window.RememberLastPosition.Calendar;
    if not addon.Options.db.Window.RememberLastPosition.Calendar then
        addon.GUI.Calendar.Frame:ResetPosition();
    end
end

local function SwitchRememberLastPositionDataManager()
    addon.Options.db.Window.RememberLastPosition.DataManager = not addon.Options.db.Window.RememberLastPosition.DataManager;
    if not addon.Options.db.Window.RememberLastPosition.DataManager then
        addon.GUI.DataManagerFrame:ResetPosition();
    end
end

local function SetCategoriesFrameWidthOffset(_, value)
    if addon.Options.db.Window.CategoriesFrameWidthOffset == value then return; end
    addon.Options.db.Window.CategoriesFrameWidthOffset = value;
    if addon.GUI.SelectedTab then -- Need to check if it exists since this can be triggered before it's created
        addon.GUI.CategoriesFrame:Hide();
        addon.GUI.SetAchievementFrameWidth();
        addon.GUI.CategoriesFrame:Show();
    end
end

local function SetMaxNumberOfSearchPreviews()
    local numberOfSearchPreviews = LibStub("AceConfigRegistry-3.0"):GetOptionsTable(addon.MetaData.Title, "cmd", "KROWIAF-0.0").args.Search.args.SearchPreview.args.NumberOfSearchPreviews; -- cmd and KROWIAF-0.0 are just to make the function work
    numberOfSearchPreviews.max = options.MaxNumberOfSearchPreviews();
    if numberOfSearchPreviews.get() > numberOfSearchPreviews.max then
        numberOfSearchPreviews.set(nil, numberOfSearchPreviews.max);
    end
end

local function SetAchievementFrameHeightOffset(_, value)
    if addon.Options.db.Window.AchievementFrameHeightOffset == value then return; end
    addon.Options.db.Window.AchievementFrameHeightOffset = value;
    SetMaxNumberOfSearchPreviews();
    if addon.GUI.SelectedTab then -- Need to check if it exists since this can be triggered before it's created
        addon.GUI.SetAchievementFrameHeight();
    end
end

local function SetTabsSpacing(_, value)
    if addon.Options.db.TabsGeneral.Spacing == value then return; end
    addon.Options.db.TabsGeneral.Spacing = value;
    addon.GUI.ShowHideTabs();
end

local function SetCategoryIndentation(_, value)
    if addon.Options.db.Categories.Indentation == value then return; end
    addon.Options.db.Categories.Indentation = value;
    local buttons = addon.GUI.CategoriesFrame.ScrollFrame.buttons;
    for _, button in next, buttons do
        button:SetIndentation(addon.Options.db.Categories.Indentation);
    end
end

local function SetMergeSmallCategoriesThreshold(_, value)
    if addon.Options.db.Window.MergeSmallCategoriesThreshold == value then return; end
    addon.Options.db.Window.MergeSmallCategoriesThreshold = value;
    addon.GUI.CategoriesFrame:Update(true);
end

options.OptionsTable.args["Layout"] = {
    type = "group",
    childGroups = "tab",
    name = addon.L["Layout"],
    args = {
        Window = {
            order = 1, type = "group",
            name = addon.L["Window"],
            args = {
                Movable = {
                    order = 1, type = "group",
                    name = addon.L["Movable"],
                    inline = true,
                    args = {
                        Movable = {
                            order = 1.1, type = "toggle", width = 2 * widthMultiplier,
                            name = addon.L["Make windows movable"],
                            desc = addon.L["Make windows movable Desc"]:AddDefaultValueText("Window.Movable"),
                            get = function() return addon.Options.db.Window.Movable; end,
                            set = SwitchMovable
                        },
                        Blank12 = {order = 1.2, type = "description", width = 1 * widthMultiplier, name = ""},
                        AchievementWindow = {
                            order = 2.1, type = "toggle", width = 2 * widthMultiplier,
                            name = addon.L["Remember frame position"]:ReplaceVars {
                                frame = addon.L["Achievement Window"]
                            },
                            desc = addon.L["Remember frame position Desc"]:ReplaceVars {
                                frame = addon.L["Achievement Window"]
                            }:AddDefaultValueText("Window.RememberLastPosition.AchievementWindow"),
                            get = function() return addon.Options.db.Window.RememberLastPosition.AchievementWindow; end,
                            set = SwitchRememberLastPositionAchievementWindow
                        },
                        AchievementWindowReset = {
                            order = 2.2, type = "execute", width = 1 * widthMultiplier,
                            name = addon.L["Reset position"],
                            desc = addon.L["Reset position Desc"]:ReplaceVars {
                                frame = addon.L["Achievement Window"]
                            },
                            func = function()
                                addon.GUI.ResetAchievementWindowPosition();
                            end
                        },
                        Calendar = {
                            order = 3.1, type = "toggle", width = 2 * widthMultiplier,
                            name = addon.L["Remember frame position"]:ReplaceVars {
                                frame = addon.L["Achievement Calendar"]
                            },
                            desc = addon.L["Remember frame position Desc"]:ReplaceVars {
                                frame = addon.L["Achievement Calendar"]
                            }:AddDefaultValueText("Window.RememberLastPosition.Calendar"),
                            get = function() return addon.Options.db.Window.RememberLastPosition.Calendar; end,
                            set = SwitchRememberLastPositionCalendar
                        },
                        CalendarReset = {
                            order = 3.2, type = "execute", width = 1 * widthMultiplier,
                            name = addon.L["Reset position"],
                            desc = addon.L["Reset position Desc"]:ReplaceVars {
                                frame = addon.L["Achievement Calendar"]
                            },
                            func = function()
                                addon.GUI.Calendar.Frame:ResetPosition();
                            end
                        },
                        DataManager = {
                            order = 4.1, type = "toggle", width = 2 * widthMultiplier,
                            name = addon.L["Remember frame position"]:ReplaceVars {
                                frame = addon.L["Data Manager"]
                            },
                            desc = addon.L["Remember frame position Desc"]:ReplaceVars {
                                frame = addon.L["Data Manager"]
                            }:AddDefaultValueText("Window.RememberLastPosition.DataManager"),
                            get = function() return addon.Options.db.Window.RememberLastPosition.DataManager; end,
                            set = SwitchRememberLastPositionDataManager
                        },
                        DataManagerReset = {
                            order = 4.2, type = "execute", width = 1 * widthMultiplier,
                            name = addon.L["Reset position"],
                            desc = addon.L["Reset position Desc"]:ReplaceVars {
                                frame = addon.L["Data Manager"]
                            },
                            func = function()
                                addon.GUI.DataManagerFrame:ResetPosition();
                            end
                        },
                    }
                },
                Offsets = {
                    order = 2, type = "group",
                    name = addon.L["Offsets"],
                    inline = true,
                    args = {
                        CategoriesFrameWidthOffset = {
                            order = 2.1, type = "range", width = 1.5 * widthMultiplier,
                            name = addon.L["Categories width offset"],
                            desc = addon.L["Categories width offset Desc"]:ReplaceVars {
                                addonName = addon.MetaData.Title,
                                tabName = string.format(addon.Colors.Yellow, addon.L["Expansions"])
                            }:AddDefaultValueText("Window.CategoriesFrameWidthOffset"),
                            min = -125, max = 250, step = 1,
                            get = function() return addon.Options.db.Window.CategoriesFrameWidthOffset; end,
                            set = SetCategoriesFrameWidthOffset
                        },
                        AchievementFrameHeightOffset = {
                            order = 2.2, type = "range", width = 1.5 * widthMultiplier,
                            name = addon.L["Achievement window height offset"],
                            desc = addon.L["Achievement window height offset Desc"]:ReplaceVars {
                                addonName = addon.MetaData.Title,
                                tabName = string.format(addon.Colors.Yellow, addon.L["Expansions"])
                            }:AddDefaultValueText("Window.AchievementFrameHeightOffset"):AddReloadRequired(),
                            min = -50, max = 750, step = 1,
                            get = function() return addon.Options.db.Window.AchievementFrameHeightOffset; end,
                            set = SetAchievementFrameHeightOffset
                        }
                    }
                }
            }
        },
        Tabs = {
            order = 2, type = "group",
            name = addon.L["Tabs"],
            args = {
                General = {
                    order = 1, type = "group",
                    name = addon.L["General"],
                    inline = true,
                    args = {
                        Spacing = {
                            order = 1, type = "range", width = 1.5 * widthMultiplier,
                            name = addon.L["Spacing"],
                            desc = addon.L["Spacing Desc"]:AddDefaultValueText("TabsGeneral.Spacing"),
                            min = -50, max = 50, step = 1,
                            get = function() return addon.Options.db.TabsGeneral.Spacing; end,
                            set = SetTabsSpacing
                        },
                    }
                },
                Order = {
                    order = 2, type = "group",
                    name = addon.L["Order"],
                    inline = true,
                    args = { --[[ Dynamically build via KrowiAF_RegisterTabOptions ]] }
                },
                --[[ Addon specific tab options dynamically build via KrowiAF_RegisterTabOptions ]]
            }
        },
        Header = {
            order = 3, type = "group",
            name = addon.L["Header"],
            args = {
                AchievementPoints = {
                    order = 1, type = "group",
                    name = addon.L["Achievement Points"],
                    inline = true,
                    args = {
                        Format = {
                            type = "select", width = 1.5 * widthMultiplier,
                            name = addon.L["Format"],
                            desc = (""):AddDefaultValueText("AchievementPoints.Format", achievementPointsDisplays),
                            values = achievementPointsDisplays,
                            get = function() return addon.Options.db.AchievementPoints.Format; end,
                            set = function (_, value)
                                if addon.Options.db.AchievementPoints.Format == value then return; end;
                                addon.Options.db.AchievementPoints.Format = value;
                            end
                        }
                    }
                },
                Tooltip = {
                    order = 2, type = "group",
                    name = addon.L["Tooltip"],
                    inline = true,
                    args = {
                        AlwaysShowRealm = {
                            order = 1.1, type = "toggle", width = 1.5 * widthMultiplier,
                            name = addon.L["Always show realm"],
                            desc = addon.L["Always show realm Desc"]:AddDefaultValueText("AchievementPoints.Tooltip.AlwaysShowRealm"),
                            get = function() return addon.Options.db.AchievementPoints.Tooltip.AlwaysShowRealm; end,
                            set = function()
                                addon.Options.db.AchievementPoints.Tooltip.AlwaysShowRealm = not addon.Options.db.AchievementPoints.Tooltip.AlwaysShowRealm;
                            end
                        },
                        ShowFaction = {
                            order = 1.2, type = "toggle", width = 1.5 * widthMultiplier,
                            name = addon.L["Show faction icon"],
                            desc = addon.L["Show faction icon Desc"]:AddDefaultValueText("AchievementPoints.Tooltip.ShowFaction"),
                            get = function() return addon.Options.db.AchievementPoints.Tooltip.ShowFaction; end,
                            set = function()
                                addon.Options.db.AchievementPoints.Tooltip.ShowFaction = not addon.Options.db.AchievementPoints.Tooltip.ShowFaction;
                            end
                        },
                        MaxNumCharacters = {
                            order = 2.1, type = "range", width = 1.5 * widthMultiplier,
                            name = addon.L["Maximum number of characters"],
                            desc = addon.L["Maximum number of characters Desc"]:AddDefaultValueText("AchievementPoints.Tooltip.MaxNumCharacters"),
                            min = 0, max = 100, step = 1,
                            get = function() return addon.Options.db.AchievementPoints.Tooltip.MaxNumCharacters; end,
                            set = function(_, value)
                                if addon.Options.db.AchievementPoints.Tooltip.MaxNumCharacters == value then return; end
                                addon.Options.db.AchievementPoints.Tooltip.MaxNumCharacters = value;
                            end
                        },
                        KeepCurrentCharacter = {
                            order = 2.2, type = "toggle", width = 1.5 * widthMultiplier,
                            name = addon.L["Keep current character"],
                            desc = addon.L["Keep current character Desc"]:ReplaceVars {
                                maxNumChar = addon.L["Maximum number of characters"]
                            }:AddDefaultValueText("AchievementPoints.Tooltip.KeepCurrentCharacter"),
                            get = function() return addon.Options.db.AchievementPoints.Tooltip.KeepCurrentCharacter; end,
                            set = function()
                                addon.Options.db.AchievementPoints.Tooltip.KeepCurrentCharacter = not addon.Options.db.AchievementPoints.Tooltip.KeepCurrentCharacter;
                            end
                        },
                        SortPriority = {
                            order = 3, type = "group",
                            name = addon.L["Sort priority"],
                            inline = true,
                            args = { --[[ Dynamically build via addon.GUI.AchievementFrameHeader.InjectDynamicOptions ]] }
                        }
                    }
                }
            }
        },
        Summary = {
            order = 4, type = "group",
            name = addon.L["Summary"],
            args = {
                Summary = {
                    order = 5, type = "group",
                    name = addon.L["Summary"],
                    inline = true,
                    args = {
                        NumAchievements = {
                            order = 1.1, type = "range", width = 1.5 * widthMultiplier,
                            name = addon.L["Number of summary achievements"],
                            desc = addon.L["Number of summary achievements Desc"]:AddDefaultValueText("Categories.Summary.NumAchievements"),
                            min = 1, max = 25, step = 1,
                            get = function() return addon.Options.db.Categories.Summary.NumAchievements; end,
                            set = function(_, value)
                                if addon.Options.db.Categories.Summary.NumAchievements == value then return; end
                                addon.Options.db.Categories.Summary.NumAchievements = value;
                            end
                        }
                    }
                }
            }
        },
        Categories = {
            order = 5, type = "group",
            name = addon.L["Categories"],
            args = {
                Indentation = {
                    order = 1, type = "group",
                    name = addon.L["Indentation"],
                    inline = true,
                    args = {
                        Indentation = {
                            order = 1.1, type = "range", width = 1.5 * widthMultiplier,
                            name = addon.L["Indentation"],
                            desc = addon.L["Indentation Desc"]:AddDefaultValueText("Categories.Indentation"):AddReloadRequired(),
                            min = 1, max = 50, step = 1,
                            get = function() return addon.Options.db.Categories.Indentation; end,
                            set = SetCategoryIndentation
                        }
                    }
                },
                Tooltip = {
                    order = 2, type = "group",
                    name = addon.L["Tooltip"],
                    inline = true,
                    args = {
                        ShowNotObtainable = {
                            order = 1, type = "toggle", width = 1.5 * widthMultiplier,
                            name = addon.L["Show Not Obtainable"]:ReplaceVars {
                                notObtainable = addon.L["Not Obtainable"]
                            },
                            desc = addon.L["Show Not Obtainable Desc"]:ReplaceVars {
                                notObtainable = addon.L["Not Obtainable"]
                            }:AddDefaultValueText("Tooltip.Categories.ShowNotObtainable"),
                            get = function() return addon.Options.db.Tooltip.Categories.ShowNotObtainable; end,
                            set = function()
                                addon.Options.db.Tooltip.Categories.ShowNotObtainable = not addon.Options.db.Tooltip.Categories.ShowNotObtainable;
                            end
                        }
                    }
                },
                Merge = {
                    order = 3, type = "group",
                    name = addon.L["Merge Small Categories"],
                    inline = true,
                    args = {
                        MergeSmallCategoriesThreshold = {
                            order = 1.1, type = "range", width = 1.5 * widthMultiplier,
                            name = addon.L["Merge small categories threshold"],
                            desc = addon.L["Merge small categories threshold Desc"]:AddDefaultValueText("Window.MergeSmallCategoriesThreshold"):AddReloadRequired(),
                            min = 1, max = 50, step = 1,
                            get = function() return addon.Options.db.Window.MergeSmallCategoriesThreshold; end,
                            set = SetMergeSmallCategoriesThreshold
                        }
                    }
                }
            }
        },
        AdjustableCategories = {
            order = 6, type = "group",
            name = addon.L["Adjustable Categories"],
            args = { --[[ Dynamically build ]] }
        },
        Achievements = {
            order = 7, type = "group",
            name = addon.L["Achievements"],
            args = {
                Style = {
                    order = 1, type = "group",
                    name = addon.L["Style"],
                    inline = true,
                    args = {
                        CompactAchievements = {
                            order = 1, type = "toggle", width = 1.5 * widthMultiplier,
                            name = addon.L["Compact Achievements"],
                            desc = addon.ReplaceVarsWithReloadReq(addon.L["Compact Achievements Desc"]),
                            get = function() return addon.Options.db.Achievements.Compact; end,
                            set = SetCompactAchievements,
                        },
                        Objectives = {
                            order = 2, type = "header",
                            name = addon.L["Objectives"]
                        },
                        ForceTwoColumns = {
                            order = 2.1, type = "toggle", width = 1.5 * widthMultiplier,
                            name = addon.L["Force two columns"],
                            desc = addon.L["Force two columns Desc"],
                            get = function() return addon.Options.db.Achievements.Objectives.ForceTwoColumns; end,
                            set = function()
                                addon.Options.db.Achievements.Objectives.ForceTwoColumns = not addon.Options.db.Achievements.Objectives.ForceTwoColumns;
                                options.Debug(addon.L["Force two columns"], addon.Options.db.Achievements.Objectives.ForceTwoColumns);
                            end
                        },
                        ForceTwoColumnsThreshold = {
                            order = 2.2, type = "range", width = 1.5 * widthMultiplier,
                            name = addon.L["Force two columns threshold"],
                            desc = addon.L["Force two columns threshold Desc"],
                            min = 0, max = 50, step = 1,
                            get = function() return addon.Options.db.Achievements.Objectives.ForceTwoColumnsThreshold; end,
                            set = function(_, value)
                                if addon.Options.db.Achievements.Objectives.ForceTwoColumnsThreshold == value then return; end
                                addon.Options.db.Achievements.Objectives.ForceTwoColumnsThreshold = value;
                                options.Debug(addon.L["Force two columns threshold"], addon.Options.db.Achievements.Objectives.ForceTwoColumnsThreshold);
                            end,
                            disabled = function() return not addon.Options.db.Achievements.Objectives.ForceTwoColumns; end
                        },
                        CriteriaBehaviour = {
                            order = 3.1, type = "select", style = "radio",
                            name = addon.L["Criteria Behaviour"],
                            desc = addon.L["Criteria Behaviour Desc"]:ReplaceVars
                            {
                                overflow = addon.L["Overflow"],
                                truncate = addon.L["Truncate"],
                                flexible = addon.L["Flexible"]
                            },
                            values = criteriaBehaviour,
                            get = function() return addon.Options.db.Achievements.Objectives.CriteriaBehaviour; end,
                            set = function (_, value)
                                if addon.Options.db.Achievements.Objectives.CriteriaBehaviour == value then return; end;
                                addon.Options.db.Achievements.Objectives.CriteriaBehaviour = value;
                                options.Debug(addon.L["Criteria Behaviour"], addon.Options.db.Achievements.Objectives.CriteriaBehaviour);
                            end
                        }
                    }
                },
                Tooltip = {
                    order = 2, type = "group",
                    name = addon.L["Tooltip"],
                    inline = true,
                    args = {
                        EarnedBy = {
                            order = 1, type = "header",
                            name = addon.L["Earned By"] .. " / " .. addon.L["Not Earned By"]
                        },
                        EarnedByCharacters = {
                            order = 2.1, type = "range", width = 1.45 * widthMultiplier,
                            name = addon.L["Number of Earned By characters"]:ReplaceVars
                            {
                                earnedBy = addon.L["Earned By"]
                            },
                            desc = addon.L["Number of Earned By characters Desc"],
                            min = 0, max = 100, step = 1,
                            get = function() return addon.Options.db.Tooltip.Achievements.EarnedBy.Characters; end,
                            set = function(_, value)
                                if addon.Options.db.Tooltip.Achievements.EarnedBy.Characters == value then return; end
                                addon.Options.db.Tooltip.Achievements.EarnedBy.Characters = value;
                                options.Debug(addon.L["Number of Earned By characters"], addon.Options.db.Tooltip.Achievements.EarnedBy.Characters);
                            end
                        },
                        EarnedByNotCharacters = {
                            order = 2.2, type = "range", width = 1.45 * widthMultiplier,
                            name = addon.L["Number of Not Earned By characters"]:ReplaceVars
                            {
                                notEarnedBy = addon.L["Not Earned By"]
                            },
                            desc = addon.L["Number of Not Earned By characters Desc"],
                            min = 0, max = 100, step = 1,
                            get = function() return addon.Options.db.Tooltip.Achievements.EarnedBy.NotCharacters; end,
                            set = function(_, value)
                                if addon.Options.db.Tooltip.Achievements.EarnedBy.NotCharacters == value then return; end
                                addon.Options.db.Tooltip.Achievements.EarnedBy.NotCharacters = value;
                                options.Debug(addon.L["Number of Not Earned By characters"], addon.Options.db.Tooltip.Achievements.EarnedBy.NotCharacters);
                            end
                        },
                        AlwaysShowRealm = {
                            order = 3.1, type = "toggle", width = 1.45 * widthMultiplier,
                            name = addon.L["Always show realm"],
                            desc = addon.L["Always show realm Desc"],
                            get = function() return addon.Options.db.Tooltip.Achievements.EarnedBy.AlwaysShowRealm; end,
                            set = function()
                                addon.Options.db.Tooltip.Achievements.EarnedBy.AlwaysShowRealm = not addon.Options.db.Tooltip.Achievements.EarnedBy.AlwaysShowRealm;
                                options.Debug(addon.L["Always show realm"], addon.Options.db.Tooltip.Achievements.EarnedBy.AlwaysShowRealm);
                            end
                        },
                        Blank31 = {order = 3.2, type = "description", width = 1.45 * widthMultiplier, name = ""},
                        HideNotEarnedByIfEarnedByCurrentCharacter = {
                            order = 4, type = "toggle", width = "full",
                            name = addon.L["Hide Not Earned By if current character earned the achievement"]:ReplaceVars
                            {
                                notEarnedBy = addon.L["Not Earned By"]
                            },
                            desc = addon.L["Hide Not Earned By if current character earned the achievement Desc"]:ReplaceVars
                            {
                                notEarnedBy = addon.L["Not Earned By"],
                                earnedBy = addon.L["Earned By"]
                            },
                            get = function() return addon.Options.db.Tooltip.Achievements.EarnedBy.HideNotEarnedByIfEarnedByCurrentCharacter; end,
                            set = function()
                                addon.Options.db.Tooltip.Achievements.EarnedBy.HideNotEarnedByIfEarnedByCurrentCharacter = not addon.Options.db.Tooltip.Achievements.EarnedBy.HideNotEarnedByIfEarnedByCurrentCharacter;
                                options.Debug(addon.L["Hide Not Earned By if current character earned the achievement"], addon.Options.db.Tooltip.Achievements.EarnedBy.HideNotEarnedByIfEarnedByCurrentCharacter);
                            end
                        },
                        PartOfAChain = {
                            order = 5, type = "header",
                            name = addon.L["Part of a chain"]
                        },
                        ShowPartOfAChain = {
                            order = 6.1, type = "toggle", width = 1.45 * widthMultiplier,
                            name = addon.Util.ReplaceVars
                            {
                                addon.L["Show Part of a Chain"],
                                partOfAChain = addon.L["Part of a chain"]
                            },
                            desc = addon.Util.ReplaceVars
                            {
                                addon.L["Show Part of a Chain Desc"],
                                partOfAChain = addon.L["Part of a chain"]
                            },
                            get = function() return addon.Options.db.Tooltip.Achievements.ShowPartOfAChain; end,
                            set = function()
                                addon.Options.db.Tooltip.Achievements.ShowPartOfAChain = not addon.Options.db.Tooltip.Achievements.ShowPartOfAChain;
                                options.Debug(addon.L["Show Part of a Chain"], addon.Options.db.Tooltip.Achievements.ShowPartOfAChain);
                            end
                        },
                        ShowCurrentCharacterIconsPartOfAChain = {
                            order = 6.2, type = "toggle", width = 1.45 * widthMultiplier,
                            name = addon.L["Show current character icons"],
                            desc = addon.Util.ReplaceVars
                            {
                                addon.L["Show current character icons Desc"],
                                partOfAChain = addon.L["Part of a chain"],
                                requiredFor = addon.L["Required for"]
                            },
                            get = function() return addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain; end,
                            set = function()
                                addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain = not addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain;
                                options.Debug(addon.L["Show current character icons"], addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain);
                            end
                        },
                        RequiredFor = {
                            order = 7, type = "header",
                            name = addon.L["Required for"]
                        },
                        ShowRequiredFor = {
                            order = 8.1, type = "toggle", width = 1.45 * widthMultiplier,
                            name = addon.Util.ReplaceVars
                            {
                                addon.L["Show Required for"],
                                requiredFor = addon.L["Required for"]
                            },
                            desc = addon.Util.ReplaceVars
                            {
                                addon.L["Show Required for Desc"],
                                requiredFor = addon.L["Required for"]
                            },
                            get = function() return addon.Options.db.Tooltip.Achievements.ShowRequiredFor; end,
                            set = function()
                                addon.Options.db.Tooltip.Achievements.ShowRequiredFor = not addon.Options.db.Tooltip.Achievements.ShowRequiredFor;
                                options.Debug(addon.L["Show Required for"], addon.Options.db.Tooltip.Achievements.ShowRequiredFor);
                            end
                        },
                        ShowCurrentCharacterIconsRequiredFor = {
                            order = 8.2, type = "toggle", width = 1.45 * widthMultiplier,
                            name = addon.L["Show current character icons"],
                            desc = addon.Util.ReplaceVars
                            {
                                addon.L["Show current character icons Desc"],
                                partOfAChain = addon.L["Part of a chain"],
                                requiredFor = addon.L["Required for"]
                            },
                            get = function() return addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor; end,
                            set = function()
                                addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor = not addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor;
                                options.Debug(addon.L["Show current character icons"], addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor);
                            end
                        },
                        OtherFaction = {
                            order = 9, type = "header",
                            name = addon.L["Other faction"]
                        },
                        ShowOtherFaction = {
                            order = 10.1, type = "toggle", width = 1.5 * widthMultiplier,
                            name = addon.Util.ReplaceVars
                            {
                                addon.L["Show Other faction"],
                                requiredFor = addon.L["Other faction"]
                            },
                            desc = addon.Util.ReplaceVars
                            {
                                addon.L["Show Other faction Desc"],
                                requiredFor = addon.L["Other faction"]
                            },
                            get = function() return addon.Options.db.Tooltip.Achievements.ShowOtherFaction; end,
                            set = function()
                                addon.Options.db.Tooltip.Achievements.ShowOtherFaction = not addon.Options.db.Tooltip.Achievements.ShowOtherFaction;
                                options.Debug(addon.L["Show Other faction"], addon.Options.db.Tooltip.Achievements.ShowOtherFaction);
                            end
                        },
                        ObjectivesProgress = {
                            order = 11, type = "header",
                            name = addon.L["Objectives progress"]
                        },
                        ObjectivesProgressShow = {
                            order = 12.1, type = "toggle", width = 1.45 * widthMultiplier,
                            name = addon.Util.ReplaceVars
                            {
                                addon.L["Show Objectives progress"],
                                objectivesProgress = addon.L["Objectives progress"]
                            },
                            desc = addon.Util.ReplaceVars
                            {
                                addon.L["Show Objectives progress Desc"],
                                objectivesProgress = addon.L["Objectives progress"]
                            },
                            get = function() return addon.Options.db.Tooltip.Achievements.ObjectivesProgress.Show; end,
                            set = SetObjectivesProgressShow
                        },
                        ObjectivesProgressShowWhenAchievementCompleted = {
                            order = 12.2, type = "toggle", width = 1.45 * widthMultiplier,
                            name = addon.Util.ReplaceVars
                            {
                                addon.L["When achievement completed"],
                                objectivesProgress = addon.L["Objectives progress"]
                            },
                            desc = addon.Util.ReplaceVars
                            {
                                addon.L["When achievement completed Desc"],
                                objectivesProgress = addon.L["Objectives progress"]
                            },
                            get = function() return addon.Options.db.Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted; end,
                            set = function()
                                addon.Options.db.Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted = not addon.Options.db.Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted;
                                options.Debug(addon.L["When achievement completed"], addon.Options.db.Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted);
                            end
                        },
                        ObjectivesProgressSecondColumnThreshold = {
                            order = 13, type = "range", width = 1.45 * widthMultiplier,
                            name = addon.L["Second column threshold"],
                            desc = addon.L["Second column threshold Desc"],
                            min = 0, max = 100, step = 1,
                            get = function() return addon.Options.db.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold; end,
                            set = function(_, value)
                                if addon.Options.db.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold == value then return; end
                                addon.Options.db.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold = value;
                                options.Debug(addon.L["Second column threshold"], addon.Options.db.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold);
                            end
                        },
                    }
                }
            }
        },
        RightClickMenu = {
            order = 8, type = "group",
            name = addon.L["Right Click Menu"],
            args = {
                Button = {
                    order = 1, type = "group",
                    name = addon.L["Button"],
                    inline = true,
                    args = {
                        ShowButtonOnAchievement = {
                            order = 1, type = "toggle", width = 1.5 * widthMultiplier,
                            name = addon.Util.ReplaceVars
                            {
                                addon.L["Show Right Click Menu"],
                                rightClickMenu = addon.L["Right Click Menu"]
                            },
                            desc = addon.ReplaceVarsWithReloadReq
                            {
                                addon.L["Show Right Click Menu Desc"],
                                rightClickMenu = addon.L["Right Click Menu"]
                            },
                            get = function() return addon.Options.db.RightClickMenu.ShowButtonOnAchievement; end,
                            set = function()
                                addon.Options.db.RightClickMenu.ShowButtonOnAchievement = not addon.Options.db.RightClickMenu.ShowButtonOnAchievement;
                                options.Debug(addon.L["Show Right Click Menu"], addon.Options.db.RightClickMenu.ShowButtonOnAchievement);
                            end
                        }
                    }
                },
                Wowhead = {
                    order = 2, type = "group",
                    name = addon.L["Wowhead Link"],
                    inline = true,
                    args = {
                        AddLocale = {
                            order = 1.1, type = "toggle", width = 1.5 * widthMultiplier,
                            name = addon.L["Add Locale"],
                            desc = addon.Util.ReplaceVars
                            {
                                addon.L["Add Locale Desc"],
                                wowheadLink = addon.L["Wowhead Link"]
                            },
                            get = function() return addon.Options.db.RightClickMenu.WowheadLink.AddLocale; end,
                            set = function()
                                addon.Options.db.RightClickMenu.WowheadLink.AddLocale = not addon.Options.db.RightClickMenu.WowheadLink.AddLocale;
                                options.Debug(addon.L["Add Locale"], addon.Options.db.RightClickMenu.WowheadLink.AddLocale);
                            end
                        },
                        Blank12 = {order = 1.2, type = "description", width = 1.5 * widthMultiplier, name = ""},
                        AddRelatedTab = {
                            order = 2, type = "select", width = 1.5 * widthMultiplier,
                            name = addon.L["Related Tab"],
                            desc = addon.Util.ReplaceVars
                            {
                                addon.L["Related Tab Desc"],
                                wowheadLink = addon.L["Wowhead Link"]
                            },
                            values = wowheadRelatedTabs,
                            get = function() return addon.Options.db.RightClickMenu.WowheadLink.AddRelatedTab; end,
                            set = function (_, value)
                                if addon.Options.db.RightClickMenu.WowheadLink.AddRelatedTab == value then return; end;
                                addon.Options.db.RightClickMenu.WowheadLink.AddRelatedTab = value;
                                options.Debug(addon.L["Related Tab"], addon.Options.db.RightClickMenu.WowheadLink.AddRelatedTab);
                            end
                        }
                    }
                },
            }
        },
        Calendar = {
            order = 9, type = "group",
            name = addon.L["Calendar"],
            args = {
                General = {
                    order = 1, type = "group",
                    name = addon.L["General"],
                    inline = true,
                    args = {
                        LockAchievementMonth = {
                            order = 1.1, type = "toggle", width = 1.5 * widthMultiplier,
                            name = addon.L["Lock month when closed by achievement"],
                            desc = addon.L["Lock month when closed by achievement Desc"],
                            get = function() return addon.Options.db.Calendar.LockAchievementMonth; end,
                            set = function()
                                addon.Options.db.Calendar.LockAchievementMonth = not addon.Options.db.Calendar.LockAchievementMonth;
                                options.Debug(addon.L["Lock month when closed by achievement"], addon.Options.db.Calendar.LockAchievementMonth);
                            end
                        },
                        Blank12 = {order = 1.2, type = "description", width = 1.5 * widthMultiplier, name = ""},
                        LockMonth = {
                            order = 2, type = "toggle", width = 1.5 * widthMultiplier,
                            name = addon.L["Lock month"],
                            desc = addon.L["Lock month Desc"],
                            get = function() return addon.Options.db.Calendar.LockMonth; end,
                            set = function()
                                addon.Options.db.Calendar.LockMonth = not addon.Options.db.Calendar.LockMonth;
                                options.Debug(addon.L["Lock month"], addon.Options.db.Calendar.LockMonth);
                            end
                        }
                    }
                },
                Weekdays = {
                    order = 2, type = "group",
                    name = addon.L["Weekdays"],
                    inline = true,
                    args = {
                        FirstDayOfTheWeek = {
                            order = 1, type = "select", width = 1.5 * widthMultiplier,
                            name = addon.L["First day of the week"],
                            desc = addon.L["First day of the week Desc"],
                            values = CALENDAR_WEEKDAY_NAMES,
                            get = function() return addon.Options.db.Calendar.FirstWeekDay; end,
                            set = function (_, value)
                                if addon.Options.db.Calendar.FirstWeekDay == value then return; end;
                                addon.Options.db.Calendar.FirstWeekDay = value;
                                addon.GUI.Calendar.Frame:Update();
                                options.Debug(addon.L["First day of the week"], addon.Options.db.Calendar.FirstWeekDay);
                            end
                        }
                    }
                }
            }
        },
        Criteria = {
            order = 10, type = "group",
            name = addon.L["Criteria"],
            args = {
                Tooltip = {
                    order = 1, type = "group",
                    name = addon.L["Tooltip"],
                    inline = true,
                    args = {
                        ShowCriteria = {
                            order = 1.1, type = "toggle", width = 1.5 * widthMultiplier,
                            name = addon.L["Show Criteria"],
                            desc = function() return addon.L["Show Criteria Desc"]:ReplaceVars{
                                criteria = (GetAchievementCriteriaInfo(1206, 1)),
                                achievement = (select(2, addon.GetAchievementInfo(1206)))
                            }; end,
                            get = function() return addon.Options.db.Tooltip.Criteria.Show; end,
                            set = function()
                                addon.Options.db.Tooltip.Criteria.Show = not addon.Options.db.Tooltip.Criteria.Show;
                                options.Debug(addon.L["Show Criteria"], addon.Options.db.Tooltip.Criteria.Show);
                            end
                        },
                        ShowForAchievement = {
                            order = 1.2, type = "toggle", width = 1.5 * widthMultiplier,
                            name = addon.L["Show For Achievement"],
                            desc = function() return addon.L["Show For Achievement Desc"]:ReplaceVars{
                                criteria = (GetAchievementCriteriaInfo(1206, 1)),
                                achievement = (select(2, addon.GetAchievementInfo(1206)))
                            }; end,
                            get = function() return addon.Options.db.Tooltip.Criteria.ShowForAchievement; end,
                            set = function()
                                addon.Options.db.Tooltip.Criteria.ShowForAchievement = not addon.Options.db.Tooltip.Criteria.ShowForAchievement;
                                options.Debug(addon.L["Show For Achievement"], addon.Options.db.Tooltip.Criteria.ShowForAchievement);
                            end
                        },
                        -- Blank12 = {order = 1.3, type = "description", width = 1 * widthMultiplier, name = ""},
                        ShowCriteriaIf = {
                            order = 2, type = "header",
                            name = addon.L["Show Criteria If"]
                        },
                        ShowCriteriaIfAchievementIsCompleted = {
                            order = 3.1, type = "toggle", width = 1.5 * widthMultiplier,
                            name = addon.L["Achievement is Completed"],
                            desc = addon.L["Achievement is Completed Desc"],
                            get = function() return addon.Options.db.Tooltip.Criteria.ShowIf.AchievementIsCompleted; end,
                            set = function()
                                addon.Options.db.Tooltip.Criteria.ShowIf.AchievementIsCompleted = not addon.Options.db.Tooltip.Criteria.ShowIf.AchievementIsCompleted;
                                options.Debug(addon.L["Achievement is Completed"], addon.Options.db.Tooltip.Criteria.ShowIf.AchievementIsCompleted);
                            end
                        },
                        ShowCriteriaIfAchievementWasNotEarnedByMe = {
                            order = 3.2, type = "toggle", width = 1.5 * widthMultiplier,
                            name = addon.L["Achievement was Not Earned by Me"],
                            desc = addon.L["Achievement was Not Earned by Me Desc"],
                            get = function() return addon.Options.db.Tooltip.Criteria.ShowIf.AchievementWasNotEarnedByMe; end,
                            set = function()
                                addon.Options.db.Tooltip.Criteria.ShowIf.AchievementWasNotEarnedByMe = not addon.Options.db.Tooltip.Criteria.ShowIf.AchievementWasNotEarnedByMe;
                                options.Debug(addon.L["Achievement was Not Earned by Me"], addon.Options.db.Tooltip.Criteria.ShowIf.AchievementWasNotEarnedByMe);
                            end
                        },
                        ShowCriteriaIfCriteriaIsCompleted = {
                            order = 4.1, type = "toggle", width = 1.5 * widthMultiplier,
                            name = addon.L["Criteria is Completed"],
                            desc = addon.L["Criteria is Completed Desc"],
                            get = function() return addon.Options.db.Tooltip.Criteria.ShowIf.CriteriaIsCompleted; end,
                            set = function()
                                addon.Options.db.Tooltip.Criteria.ShowIf.CriteriaIsCompleted = not addon.Options.db.Tooltip.Criteria.ShowIf.CriteriaIsCompleted;
                                options.Debug(addon.L["Criteria is Completed"], addon.Options.db.Tooltip.Criteria.ShowIf.CriteriaIsCompleted);
                            end
                        },
                        Blank42 = {order = 4.2, type = "description", width = 1.5 * widthMultiplier, name = ""},
                    }
                }
            }
        }
    }
};