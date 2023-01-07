-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;
options.Layout = {};
local layout = options.Layout;
tinsert(options.OptionsTables, layout);

local OrderPP = KrowiAF_InjectOptions.AutoOrderPlusPlus;
local AdjustedWidth = KrowiAF_InjectOptions.AdjustedWidth;

function layout.RegisterOptionsTable()
    LibStub("AceConfig-3.0"):RegisterOptionsTable(options.OptionsTable.args.Layout.name, options.OptionsTable.args.Layout);
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(options.OptionsTable.args.Layout.name, options.OptionsTable.args.Layout.name, addon.MetaData.Title);
end

function layout.PostLoad()
    if addon.Options.db.Calendar.FirstWeekDay < 1 or addon.Options.db.Calendar.FirstWeekDay > 7 then
        if not IsAddOnLoaded("Blizzard_Calendar") then -- This is to make sure we get the 1st day of the week correct
            LoadAddOn("Blizzard_Calendar"); -- breaks Blizzard_Calendar
        end
        addon.Options.db.Calendar.FirstWeekDay = CALENDAR_FIRST_WEEKDAY;
    end
end

-- [[ InjectDynamicFixedWatchListOptions ]]
local function DrawSubCategories(categories)
    if addon.GUI.SelectedTab == nil then
        return;
    end

    -- Reset all
    for i = 1, #categories do
        categories[i].Achievements = nil;
        categories[i].Children = nil;
    end
    addon.GUI.CategoriesFrame:Update(true);
    addon.GUI.AchievementsFrame:ForceUpdate();

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
    if addon.GUI.SelectedTab ~= nil then -- If nil, not yet loaded
        if SavedData.WatchedAchievements then
            for id, _ in next, SavedData.WatchedAchievements do
                addon.Data.Achievements[id]:ClearWatch();
            end
        end
        addon.GUI.CategoriesFrame:Update(true);
        addon.GUI.AchievementsFrame:ForceUpdate();
    end
    SavedData.WatchedAchievements = nil;
end

local function InjectDynamicFixedWatchListOptions()
    if KrowiAF_InjectOptions.TableExists("Layout.args.AdjustableCategories.args.WatchList.args.ShowWatchedSubCategories") then
        return;
    end

    KrowiAF_InjectOptions.AddTable("Layout.args.AdjustableCategories.args.WatchList.args", "ShowWatchedSubCategories", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = addon.L["Show Sub Categories"],
        desc = addon.L["Show Sub Categories Desc"]:ReplaceVars(addon.L["Watch List"]):AddDefaultValueText("Categories.WatchList.ShowSubCategories"),
        get = function() return addon.Options.db.Categories.WatchList.ShowSubCategories; end,
        set = function()
            addon.Options.db.Categories.WatchList.ShowSubCategories = not addon.Options.db.Categories.WatchList.ShowSubCategories;
            DrawSubCategories(addon.Data.WatchListCategories);
        end
    });
    KrowiAF_InjectOptions.AddTable("Layout.args.AdjustableCategories.args.WatchList.args", "Blank1", {
        order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""
    });
    KrowiAF_InjectOptions.AddTable("Layout.args.AdjustableCategories.args.WatchList.args", "ClearAll", {
        order = OrderPP(), type = "execute", width = AdjustedWidth(),
        name = addon.L["Clear all"],
        desc = addon.L["Clear all Desc"],
        func = WatchListClearAllFunc
    });
end

-- [[ InjectMoreDynamicTrackingAchievementsOptions ]]
local function InjectMoreDynamicTrackingAchievementsOptions()
    if KrowiAF_InjectOptions.TableExists("Layout.args.AdjustableCategories.args.TrackingAchievements.args.LoadTrackingAchievements") then
        return;
    end

    KrowiAF_InjectOptions.AddTable("Layout.args.AdjustableCategories.args.TrackingAchievements.args", "LoadTrackingAchievements", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(2),
        name = addon.L["Load Tracking Achievements"],
        desc = addon.L["Load Tracking Achievements Desc"]:AddDefaultValueText("Categories.TrackingAchievements.DoLoad"),
        get = function() return addon.Options.db.Categories.TrackingAchievements.DoLoad; end,
        set = function() addon.Options.db.Categories.TrackingAchievements.DoLoad = not addon.Options.db.Categories.TrackingAchievements.DoLoad; end
    });

    KrowiAF_InjectOptions.AddTable("Layout.args.AdjustableCategories.args.TrackingAchievements.args", "ShowTrackingSubCategories", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = addon.L["Show Sub Categories"],
        desc = addon.L["Show Sub Categories Desc"]:ReplaceVars(addon.L["Tracking Achievements"]):AddDefaultValueText("Categories.TrackingAchievements.ShowSubCategories"),
        get = function() return addon.Options.db.Categories.TrackingAchievements.ShowSubCategories; end,
        set = function()
            addon.Options.db.Categories.TrackingAchievements.ShowSubCategories = not addon.Options.db.Categories.TrackingAchievements.ShowSubCategories;
            DrawSubCategories(addon.Data.TrackingAchievementsCategories);
        end
    });
end

-- [[ InjectMoreDynamicExcludedOptions ]]
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

local function ExcludedIncludeAllFunc()
    if not addon.Data.ExcludedCategories then
        LoadAddOn("Blizzard_AchievementUI");
    end

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

local function InjectMoreDynamicExcludedOptions()
    if KrowiAF_InjectOptions.TableExists("Layout.args.AdjustableCategories.args.Excluded.args.ShowExcludedSubCategories") then
        return;
    end

    KrowiAF_InjectOptions.AddTable("Layout.args.AdjustableCategories.args.Excluded.args", "Show", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = addon.L["Show Excluded Category"],
        desc = addon.L["Show Excluded Category Desc"]:ReplaceVars(addon.L["Excluded"]):AddDefaultValueText("Categories.Excluded.Show"),
        get = function() return addon.Options.db.Categories.Excluded.Show; end,
        set = function()
            addon.Options.db.Categories.Excluded.Show = not addon.Options.db.Categories.Excluded.Show;
            ShowExcludedCategory();
        end
    });
    KrowiAF_InjectOptions.AddTable("Layout.args.AdjustableCategories.args.Excluded.args", "Blank1", {
        order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""
    });
    KrowiAF_InjectOptions.AddTable("Layout.args.AdjustableCategories.args.Excluded.args", "IncludeAll", {
        order = OrderPP(), type = "execute", width = AdjustedWidth(),
        name = addon.L["Include all"],
        desc = addon.L["Include all Desc"],
        func = ExcludedIncludeAllFunc
    });
    KrowiAF_InjectOptions.AddTable("Layout.args.AdjustableCategories.args.Excluded.args", "ShowExcludedSubCategories", {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = addon.L["Show Sub Categories"],
        desc = addon.L["Show Sub Categories Desc"]:ReplaceVars(addon.L["Excluded"]):AddDefaultValueText("Categories.Excluded.ShowSubCategories"),
        disabled = function() return not addon.Options.db.Categories.Excluded.Show; end,
        get = function() return addon.Options.db.Categories.Excluded.ShowSubCategories; end,
        set = function()
            addon.Options.db.Categories.Excluded.ShowSubCategories = not addon.Options.db.Categories.Excluded.ShowSubCategories;
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
    if not KrowiAF_InjectOptions.DefaultsExists("AdjustableCategories." .. category) then
        KrowiAF_InjectOptions.AddDefaults("AdjustableCategories", category, { });
    end

    KrowiAF_InjectOptions.AddDefaults("AdjustableCategories." .. category, tabIndex, defaultValue);

    if not KrowiAF_InjectOptions.TableExists("Layout.args.AdjustableCategories.args." .. category) then
        KrowiAF_InjectOptions.AddTable("Layout.args.AdjustableCategories.args", category, {
            order = OrderPP(), type = "group",
            name = categoryDisplayName,
            args = {}
        });
    end

    InjectDynamicFixedAdjustableCategoriesOptions(category);

    if not KrowiAF_InjectOptions.TableExists("Layout.args.AdjustableCategories.args." .. category .. ".args.Tabs") then
        KrowiAF_InjectOptions.AddTable("Layout.args.AdjustableCategories.args." .. category .. ".args", "Tabs", {
            order = OrderPP(), type = "header",
            name = addon.L["Tabs"]
        });
    end

    KrowiAF_InjectOptions.AddTable("Layout.args.AdjustableCategories.args." .. category .. ".args", tab, {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = tabDisplayName,
        desc = addon.L["Requires a reload"]:AddDefaultValueText("AdjustableCategories." .. category .. "." .. tabIndex),
        get = function() return addon.Options.db.AdjustableCategories[category][tabIndex]; end,
        set = function() addon.Options.db.AdjustableCategories[category][tabIndex] = not addon.Options.db.AdjustableCategories[category][tabIndex]; end
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

local function MovableSwitchMovableSet()
    addon.Options.db.Window.Movable = not addon.Options.db.Window.Movable;
    if addon.Options.db.Window.Movable then
        addon.MakeWindowMovable();
    else
        addon.MakeWindowStatic();
    end
end

local function MovableAchievementWindowRememberLastPositionSet()
    addon.Options.db.Window.RememberLastPosition.AchievementWindow = not addon.Options.db.Window.RememberLastPosition.AchievementWindow;
    if not addon.Options.db.Window.RememberLastPosition.AchievementWindow then
        addon.GUI.ResetAchievementWindowPosition();
    end
end

local function MovableCalendarRememberLastPositionSet()
    addon.Options.db.Window.RememberLastPosition.Calendar = not addon.Options.db.Window.RememberLastPosition.Calendar;
    if not addon.Options.db.Window.RememberLastPosition.Calendar then
        addon.GUI.Calendar.Frame:ResetPosition();
    end
end

local function MovableDataManagerRememberLastPositionSet()
    addon.Options.db.Window.RememberLastPosition.DataManager = not addon.Options.db.Window.RememberLastPosition.DataManager;
    if not addon.Options.db.Window.RememberLastPosition.DataManager then
        addon.GUI.DataManagerFrame:ResetPosition();
    end
end

local function OffsetsCategoriesFrameWidthSet(_, value)
    if addon.Options.db.Window.CategoriesFrameWidthOffset == value then return; end
    addon.Options.db.Window.CategoriesFrameWidthOffset = value;
    if addon.GUI.SelectedTab then
        addon.GUI.CategoriesFrame:Hide();
        addon.GUI.SetAchievementFrameWidth();
        addon.GUI.CategoriesFrame:Show();
    end
end

local function SetMaxNumberOfSearchPreviews()
    local numberOfSearchPreviews = options.SetMaxNumberOfSearchPreviews()
    if numberOfSearchPreviews.get() > numberOfSearchPreviews.max then
        numberOfSearchPreviews.set(nil, numberOfSearchPreviews.max);
    end
end

local function OffsetsAchievementFrameHeightSet(_, value)
    if addon.Options.db.Window.AchievementFrameHeightOffset == value then return; end
    addon.Options.db.Window.AchievementFrameHeightOffset = value;
    SetMaxNumberOfSearchPreviews();
    if addon.GUI.SelectedTab then
        addon.GUI.SetAchievementFrameHeight();
    end
end

local function SetCategoryIndentation(_, value)
    if addon.Options.db.Categories.Indentation == value then return; end
    addon.Options.db.Categories.Indentation = value;
    local buttons = addon.GUI.CategoriesFrame.ScrollFrame.buttons;
    for _, button in next, buttons do
        button:SetIndentation(addon.Options.db.Categories.Indentation);
    end
end

local function MergeMergeSmallCategoriesThresholdSet(_, value)
    if addon.Options.db.Window.MergeSmallCategoriesThreshold == value then return; end
    addon.Options.db.Window.MergeSmallCategoriesThreshold = value;
    addon.GUI.CategoriesFrame:Update(true);
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
                            desc = addon.L["Make windows movable Desc"]:AddDefaultValueText("Window.Movable"),
                            get = function() return addon.Options.db.Window.Movable; end,
                            set = MovableSwitchMovableSet
                        },
                        Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""},
                        AchievementWindowRememberLastPosition = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(2),
                            name = addon.L["Remember frame position"]:ReplaceVars(addon.L["Achievement Window"]),
                            desc = addon.L["Remember frame position Desc"]:ReplaceVars(addon.L["Achievement Window"]):AddDefaultValueText("Window.RememberLastPosition.AchievementWindow"),
                            get = function() return addon.Options.db.Window.RememberLastPosition.AchievementWindow; end,
                            set = MovableAchievementWindowRememberLastPositionSet
                        },
                        AchievementWindowResetPosition = {
                            order = OrderPP(), type = "execute", width = AdjustedWidth(),
                            name = addon.L["Reset position"],
                            desc = addon.L["Reset position Desc"]:ReplaceVars(addon.L["Achievement Window"]),
                            func = function() addon.GUI.ResetAchievementWindowPosition(); end
                        },
                        CalendarRememberLastPosition = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(2),
                            name = addon.L["Remember frame position"]:ReplaceVars(addon.L["Achievement Calendar"]),
                            desc = addon.L["Remember frame position Desc"]:ReplaceVars(addon.L["Achievement Calendar"]):AddDefaultValueText("Window.RememberLastPosition.Calendar"),
                            get = function() return addon.Options.db.Window.RememberLastPosition.Calendar; end,
                            set = MovableCalendarRememberLastPositionSet
                        },
                        CalendarResetPosition = {
                            order = OrderPP(), type = "execute", width = AdjustedWidth(),
                            name = addon.L["Reset position"],
                            desc = addon.L["Reset position Desc"]:ReplaceVars(addon.L["Achievement Calendar"]),
                            func = function() addon.GUI.Calendar.Frame:ResetPosition(); end
                        },
                        DataManagerRememberLastPosition = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(2),
                            name = addon.L["Remember frame position"]:ReplaceVars(addon.L["Data Manager"]),
                            desc = addon.L["Remember frame position Desc"]:ReplaceVars(addon.L["Data Manager"]):AddDefaultValueText("Window.RememberLastPosition.DataManager"),
                            get = function() return addon.Options.db.Window.RememberLastPosition.DataManager; end,
                            set = MovableDataManagerRememberLastPositionSet
                        },
                        DataManagerResetPosition = {
                            order = OrderPP(), type = "execute", width = AdjustedWidth(),
                            name = addon.L["Reset position"],
                            desc = addon.L["Reset position Desc"]:ReplaceVars(addon.L["Data Manager"]),
                            func = function() addon.GUI.DataManagerFrame:ResetPosition(); end
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
                            desc = addon.L["Categories width offset Desc"]:InjectAddonName():ReplaceVars(string.format(addon.Colors.Yellow, addon.L["Expansions"])):AddDefaultValueText("Window.CategoriesFrameWidthOffset"),
                            min = -125, max = 250, step = 1,
                            get = function() return addon.Options.db.Window.CategoriesFrameWidthOffset; end,
                            set = OffsetsCategoriesFrameWidthSet
                        },
                        AchievementFrameHeight = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Achievement window height offset"],
                            desc = addon.L["Achievement window height offset Desc"]:InjectAddonName():ReplaceVars(string.format(addon.Colors.Yellow, addon.L["Expansions"])):AddDefaultValueText("Window.AchievementFrameHeightOffset"):AddReloadRequired(),
                            min = -50, max = 750, step = 1,
                            get = function() return addon.Options.db.Window.AchievementFrameHeightOffset; end,
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
                                    desc = addon.L["Spacing Desc"]:AddDefaultValueText("TabsGeneral.Spacing"),
                                    min = -50, max = 50, step = 1,
                                    get = function() return addon.Options.db.TabsGeneral.Spacing; end,
                                    set = function (_, value)
                                        addon.Options.db.TabsGeneral.Spacing = value;
                                        addon.GUI.ShowHideTabs();
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
                            desc = (""):AddDefaultValueText("AchievementPoints.Format", achievementPointsDisplays),
                            values = achievementPointsDisplays,
                            get = function() return addon.Options.db.AchievementPoints.Format; end,
                            set = function (_, value) addon.Options.db.AchievementPoints.Format = value; end
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
                            desc = addon.L["Always show realm Desc"]:AddDefaultValueText("AchievementPoints.Tooltip.AlwaysShowRealm"),
                            get = function() return addon.Options.db.AchievementPoints.Tooltip.AlwaysShowRealm; end,
                            set = function() addon.Options.db.AchievementPoints.Tooltip.AlwaysShowRealm = not addon.Options.db.AchievementPoints.Tooltip.AlwaysShowRealm; end
                        },
                        ShowFaction = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Show faction icon"],
                            desc = addon.L["Show faction icon Desc"]:AddDefaultValueText("AchievementPoints.Tooltip.ShowFaction"),
                            get = function() return addon.Options.db.AchievementPoints.Tooltip.ShowFaction; end,
                            set = function() addon.Options.db.AchievementPoints.Tooltip.ShowFaction = not addon.Options.db.AchievementPoints.Tooltip.ShowFaction; end
                        },
                        MaxNumCharacters = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Maximum number of characters"],
                            desc = addon.L["Maximum number of characters Desc"]:AddDefaultValueText("AchievementPoints.Tooltip.MaxNumCharacters"),
                            min = 0, max = 100, step = 1,
                            get = function() return addon.Options.db.AchievementPoints.Tooltip.MaxNumCharacters; end,
                            set = function(_, value) addon.Options.db.AchievementPoints.Tooltip.MaxNumCharacters = value; end
                        },
                        KeepCurrentCharacter = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Keep current character"],
                            desc = addon.L["Keep current character Desc"]:ReplaceVars(addon.L["Maximum number of characters"]):AddDefaultValueText("AchievementPoints.Tooltip.KeepCurrentCharacter"),
                            get = function() return addon.Options.db.AchievementPoints.Tooltip.KeepCurrentCharacter; end,
                            set = function() addon.Options.db.AchievementPoints.Tooltip.KeepCurrentCharacter = not addon.Options.db.AchievementPoints.Tooltip.KeepCurrentCharacter; end
                        },
                        SortPriority = {
                            order = OrderPP(), type = "group", inline = true,
                            name = addon.L["Sort priority"],
                            args = { --[[ Dynamically build via addon.GUI.AchievementFrameHeader.InjectDynamicOptions ]] }
                        }
                    }
                }
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
                        NumAchievements = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Number of summary achievements"],
                            desc = addon.L["Number of summary achievements Desc"]:AddDefaultValueText("Categories.Summary.NumAchievements"),
                            min = 1, max = 25, step = 1,
                            get = function() return addon.Options.db.Categories.Summary.NumAchievements; end,
                            set = function(_, value) addon.Options.db.Categories.Summary.NumAchievements = value; end
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
                            desc = addon.L["Indentation Desc"]:AddDefaultValueText("Categories.Indentation"),
                            min = 1, max = 50, step = 1,
                            get = function() return addon.Options.db.Categories.Indentation; end,
                            set = SetCategoryIndentation
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
                            name = addon.L["Show Not Obtainable"]:ReplaceVars(addon.L["Not Obtainable"]),
                            desc = addon.L["Show Not Obtainable Desc"]:ReplaceVars(addon.L["Not Obtainable"]):AddDefaultValueText("Tooltip.Categories.ShowNotObtainable"),
                            get = function() return addon.Options.db.Tooltip.Categories.ShowNotObtainable; end,
                            set = function() addon.Options.db.Tooltip.Categories.ShowNotObtainable = not addon.Options.db.Tooltip.Categories.ShowNotObtainable; end
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
                            desc = addon.L["Merge small categories threshold Desc"]:AddDefaultValueText("Window.MergeSmallCategoriesThreshold"),
                            min = 1, max = 50, step = 1,
                            get = function() return addon.Options.db.Window.MergeSmallCategoriesThreshold; end,
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
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                                    name = addon.L["Compact Achievements"],
                                    desc = addon.L["Compact Achievements Desc"]:AddDefaultValueText("Achievements.Compact"):AddReloadRequired(),
                                    get = function() return addon.Options.db.Achievements.Compact; end,
                                    set = function() addon.Options.db.Achievements.Compact = not addon.Options.db.Achievements.Compact; end,
                                },
                                HideDateCompleted = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                                    name = addon.L["Hide Date Completed"],
                                    desc = addon.L["Hide Date Completed Desc"]:AddDefaultValueText("Achievements.HideDateCompleted"):AddReloadRequired(),
                                    get = function() return addon.Options.db.Achievements.HideDateCompleted; end,
                                    set = function() addon.Options.db.Achievements.HideDateCompleted = not addon.Options.db.Achievements.HideDateCompleted; end,
                                },
                                Objectives = {
                                    order = OrderPP(), type = "header",
                                    name = addon.L["Objectives"]
                                },
                                ForceTwoColumns = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                                    name = addon.L["Force two columns"],
                                    desc = addon.L["Force two columns Desc"]:AddDefaultValueText("Achievements.Objectives.ForceTwoColumns"),
                                    get = function() return addon.Options.db.Achievements.Objectives.ForceTwoColumns; end,
                                    set = function() addon.Options.db.Achievements.Objectives.ForceTwoColumns = not addon.Options.db.Achievements.Objectives.ForceTwoColumns; end
                                },
                                ForceTwoColumnsThreshold = {
                                    order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                                    name = addon.L["Force two columns threshold"],
                                    desc = addon.L["Force two columns threshold Desc"]:AddDefaultValueText("Achievements.Objectives.ForceTwoColumnsThreshold"),
                                    min = 0, max = 50, step = 1,
                                    get = function() return addon.Options.db.Achievements.Objectives.ForceTwoColumnsThreshold; end,
                                    set = function(_, value) addon.Options.db.Achievements.Objectives.ForceTwoColumnsThreshold = value; end,
                                    disabled = function() return not addon.Options.db.Achievements.Objectives.ForceTwoColumns; end
                                },
                                CriteriaBehaviour = {
                                    order = OrderPP(), type = "select", style = "radio",
                                    name = addon.L["Criteria Behaviour"],
                                    desc = addon.L["Criteria Behaviour Desc"]:ReplaceVars{
                                        overflow = addon.L["Overflow"],
                                        truncate = addon.L["Truncate"],
                                        flexible = addon.L["Flexible"]
                                    }:AddDefaultValueText("Achievements.Objectives.CriteriaBehaviour", criteriaBehaviour),
                                    values = criteriaBehaviour,
                                    get = function() return addon.Options.db.Achievements.Objectives.CriteriaBehaviour; end,
                                    set = function (_, value) addon.Options.db.Achievements.Objectives.CriteriaBehaviour = value; end
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
                                    order = OrderPP(), type = "range", width = AdjustedWidth(1.4),
                                    name = addon.L["Number of Earned By characters"]:ReplaceVars(addon.L["Earned By"]),
                                    desc = addon.L["Number of Earned By characters Desc"]:AddDefaultValueText("Tooltip.Achievements.EarnedBy.Characters"),
                                    min = 0, max = 100, step = 1,
                                    get = function() return addon.Options.db.Tooltip.Achievements.EarnedBy.Characters; end,
                                    set = function(_, value) addon.Options.db.Tooltip.Achievements.EarnedBy.Characters = value; end
                                },
                                EarnedByNotCharacters = {
                                    order = OrderPP(), type = "range", width = AdjustedWidth(1.4),
                                    name = addon.L["Number of Not Earned By characters"]:ReplaceVars(addon.L["Not Earned By"]),
                                    desc = addon.L["Number of Not Earned By characters Desc"]:AddDefaultValueText("Tooltip.Achievements.EarnedBy.NotCharacters"),
                                    min = 0, max = 100, step = 1,
                                    get = function() return addon.Options.db.Tooltip.Achievements.EarnedBy.NotCharacters; end,
                                    set = function(_, value)addon.Options.db.Tooltip.Achievements.EarnedBy.NotCharacters = value;end
                                },
                                AlwaysShowRealm = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                                    name = addon.L["Always show realm"],
                                    desc = addon.L["Always show realm Desc"]:AddDefaultValueText("Tooltip.Achievements.EarnedBy.AlwaysShowRealm"),
                                    get = function() return addon.Options.db.Tooltip.Achievements.EarnedBy.AlwaysShowRealm; end,
                                    set = function() addon.Options.db.Tooltip.Achievements.EarnedBy.AlwaysShowRealm = not addon.Options.db.Tooltip.Achievements.EarnedBy.AlwaysShowRealm; end
                                },
                                Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.4), name = ""},
                                HideNotEarnedByIfEarnedByCurrentCharacter = {
                                    order = OrderPP(), type = "toggle", width = "full",
                                    name = addon.L["Hide Not Earned By if current character earned the achievement"]:ReplaceVars(addon.L["Not Earned By"]),
                                    desc = addon.L["Hide Not Earned By if current character earned the achievement Desc"]:ReplaceVars{
                                        notEarnedBy = addon.L["Not Earned By"],
                                        earnedBy = addon.L["Earned By"]
                                    }:AddDefaultValueText("Tooltip.Achievements.EarnedBy.HideNotEarnedByIfEarnedByCurrentCharacter"),
                                    get = function() return addon.Options.db.Tooltip.Achievements.EarnedBy.HideNotEarnedByIfEarnedByCurrentCharacter; end,
                                    set = function() addon.Options.db.Tooltip.Achievements.EarnedBy.HideNotEarnedByIfEarnedByCurrentCharacter = not addon.Options.db.Tooltip.Achievements.EarnedBy.HideNotEarnedByIfEarnedByCurrentCharacter; end
                                },
                                PartOfAChain = {
                                    order = OrderPP(), type = "header",
                                    name = addon.L["Part of a chain"]
                                },
                                ShowPartOfAChain = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                                    name = addon.L["Show Part of a Chain"]:ReplaceVars(addon.L["Part of a chain"]),
                                    desc = addon.L["Show Part of a Chain Desc"]:ReplaceVars(addon.L["Part of a chain"]):AddDefaultValueText("Tooltip.Achievements.ShowPartOfAChain"),
                                    get = function() return addon.Options.db.Tooltip.Achievements.ShowPartOfAChain; end,
                                    set = function() addon.Options.db.Tooltip.Achievements.ShowPartOfAChain = not addon.Options.db.Tooltip.Achievements.ShowPartOfAChain; end
                                },
                                ShowCurrentCharacterIconsPartOfAChain = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                                    name = addon.L["Show current character icons"],
                                    desc = addon.L["Show current character icons Desc"]:ReplaceVars{
                                        partOfAChain = addon.L["Part of a chain"],
                                        requiredFor = addon.L["Required for"]
                                    }:AddDefaultValueText("Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain"),
                                    get = function() return addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain; end,
                                    set = function() addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain = not addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain; end,
                                    disabled = function() return not addon.Options.db.Tooltip.Achievements.ShowPartOfAChain; end
                                },
                                RequiredFor = {
                                    order = OrderPP(), type = "header",
                                    name = addon.L["Required for"]
                                },
                                ShowRequiredFor = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                                    name = addon.L["Show Required for"]:ReplaceVars(addon.L["Required for"]),
                                    desc = addon.L["Show Required for Desc"]:ReplaceVars(addon.L["Required for"]):AddDefaultValueText("Tooltip.Achievements.ShowRequiredFor"),
                                    get = function() return addon.Options.db.Tooltip.Achievements.ShowRequiredFor; end,
                                    set = function() addon.Options.db.Tooltip.Achievements.ShowRequiredFor = not addon.Options.db.Tooltip.Achievements.ShowRequiredFor; end
                                },
                                ShowCurrentCharacterIconsRequiredFor = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                                    name = addon.L["Show current character icons"],
                                    desc = addon.L["Show current character icons Desc"]:ReplaceVars{
                                        partOfAChain = addon.L["Part of a chain"],
                                        requiredFor = addon.L["Required for"]
                                    }:AddDefaultValueText("Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor"),
                                    get = function() return addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor; end,
                                    set = function() addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor = not addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor; end,
                                    disabled = function() return not addon.Options.db.Tooltip.Achievements.ShowRequiredFor; end
                                },
                                OtherFaction = {
                                    order = OrderPP(), type = "header",
                                    name = addon.L["Other faction"]
                                },
                                ShowOtherFaction = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                                    name = addon.L["Show Other faction"]:ReplaceVars(addon.L["Other faction"]),
                                    desc = addon.L["Show Other faction Desc"]:ReplaceVars(addon.L["Other faction"]):AddDefaultValueText("Tooltip.Achievements.ShowOtherFaction"),
                                    get = function() return addon.Options.db.Tooltip.Achievements.ShowOtherFaction; end,
                                    set = function() addon.Options.db.Tooltip.Achievements.ShowOtherFaction = not addon.Options.db.Tooltip.Achievements.ShowOtherFaction; end
                                },
                                ObjectivesProgress = {
                                    order = OrderPP(), type = "header",
                                    name = addon.L["Objectives progress"]
                                },
                                ObjectivesProgressShow = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                                    name = addon.L["Show Objectives progress"]:ReplaceVars(addon.L["Objectives progress"]),
                                    desc = addon.L["Show Objectives progress Desc"]:ReplaceVars(addon.L["Objectives progress"]):AddDefaultValueText("Tooltip.Achievements.ObjectivesProgress.Show"),
                                    get = function() return addon.Options.db.Tooltip.Achievements.ObjectivesProgress.Show; end,
                                    set = function() addon.Options.db.Tooltip.Achievements.ObjectivesProgress.Show = not addon.Options.db.Tooltip.Achievements.ObjectivesProgress.Show; end
                                },
                                ObjectivesProgressShowWhenAchievementCompleted = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                                    name = addon.L["When achievement completed"]:ReplaceVars(addon.L["Objectives progress"]),
                                    desc = addon.L["When achievement completed Desc"]:ReplaceVars(addon.L["Objectives progress"]):AddDefaultValueText("Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted"),
                                    get = function() return addon.Options.db.Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted; end,
                                    set = function() addon.Options.db.Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted = not addon.Options.db.Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted; end,
                                    disabled = function() return not addon.Options.db.Tooltip.Achievements.ObjectivesProgress.Show; end
                                },
                                ObjectivesProgressSecondColumnThreshold = {
                                    order = OrderPP(), type = "range", width = AdjustedWidth(1.4),
                                    name = addon.L["Second column threshold"],
                                    desc = addon.L["Second column threshold Desc"]:AddDefaultValueText("Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold"),
                                    min = 0, max = 100, step = 1,
                                    get = function() return addon.Options.db.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold; end,
                                    set = function(_, value) addon.Options.db.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold = value; end,
                                    disabled = function() return not addon.Options.db.Tooltip.Achievements.ObjectivesProgress.Show; end
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
                            name = addon.L["Show Right Click Menu"]:ReplaceVars(addon.L["Right Click Menu"]),
                            desc = addon.L["Show Right Click Menu Desc"]:ReplaceVars(addon.L["Right Click Menu"]):AddDefaultValueText("RightClickMenu.ShowButtonOnAchievement"):AddReloadRequired(),
                            get = function() return addon.Options.db.RightClickMenu.ShowButtonOnAchievement; end,
                            set = function() addon.Options.db.RightClickMenu.ShowButtonOnAchievement = not addon.Options.db.RightClickMenu.ShowButtonOnAchievement; end
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
                            desc = addon.L["Add Locale Desc"]:ReplaceVars(addon.L["Wowhead Link"]):AddDefaultValueText("RightClickMenu.WowheadLink.AddLocale"),
                            get = function() return addon.Options.db.RightClickMenu.WowheadLink.AddLocale; end,
                            set = function() addon.Options.db.RightClickMenu.WowheadLink.AddLocale = not addon.Options.db.RightClickMenu.WowheadLink.AddLocale; end
                        },
                        Blank12 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
                        AddRelatedTab = {
                            order = OrderPP(), type = "select", width = AdjustedWidth(1.5),
                            name = addon.L["Related Tab"],
                            desc = addon.L["Related Tab Desc"]:ReplaceVars(addon.L["Wowhead Link"]):AddDefaultValueText("RightClickMenu.WowheadLink.AddRelatedTab", wowheadRelatedTabs),
                            values = wowheadRelatedTabs,
                            get = function() return addon.Options.db.RightClickMenu.WowheadLink.AddRelatedTab; end,
                            set = function (_, value) addon.Options.db.RightClickMenu.WowheadLink.AddRelatedTab = value; end
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
                            desc = addon.L["Lock month when closed by achievement Desc"]:AddDefaultValueText("Calendar.LockAchievementMonth"),
                            get = function() return addon.Options.db.Calendar.LockAchievementMonth; end,
                            set = function() addon.Options.db.Calendar.LockAchievementMonth = not addon.Options.db.Calendar.LockAchievementMonth; end
                        },
                        Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
                        LockMonth = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Lock month"],
                            desc = addon.L["Lock month Desc"]:AddDefaultValueText("Calendar.LockMonth"),
                            get = function() return addon.Options.db.Calendar.LockMonth; end,
                            set = function() addon.Options.db.Calendar.LockMonth = not addon.Options.db.Calendar.LockMonth; end
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
                            get = function() return addon.Options.db.Calendar.FirstWeekDay; end,
                            set = function (_, value)
                                addon.Options.db.Calendar.FirstWeekDay = value;
                                addon.GUI.Calendar.Frame:Update();
                            end
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
                            desc = function() return addon.L["Show Criteria Desc"]:ReplaceVars{
                                criteria = (GetAchievementCriteriaInfo(1206, 1)),
                                achievement = (select(2, addon.GetAchievementInfo(1206)))
                            }:AddDefaultValueText("Tooltip.Criteria.Show"); end,
                            get = function() return addon.Options.db.Tooltip.Criteria.Show; end,
                            set = function() addon.Options.db.Tooltip.Criteria.Show = not addon.Options.db.Tooltip.Criteria.Show; end
                        },
                        ShowForAchievement = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Show For Achievement"],
                            desc = function() return addon.L["Show For Achievement Desc"]:ReplaceVars{
                                criteria = (GetAchievementCriteriaInfo(1206, 1)),
                                achievement = (select(2, addon.GetAchievementInfo(1206)))
                            }:AddDefaultValueText("Tooltip.Criteria.ShowForAchievement"); end,
                            get = function() return addon.Options.db.Tooltip.Criteria.ShowForAchievement; end,
                            set = function() addon.Options.db.Tooltip.Criteria.ShowForAchievement = not addon.Options.db.Tooltip.Criteria.ShowForAchievement; end
                        },
                        ShowCriteriaIf = {
                            order = OrderPP(), type = "header",
                            name = addon.L["Show Criteria If"]
                        },
                        ShowCriteriaIfAchievementIsCompleted = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Achievement is Completed"],
                            desc = addon.L["Achievement is Completed Desc"]:AddDefaultValueText("Tooltip.Criteria.ShowIf.AchievementIsCompleted"),
                            get = function() return addon.Options.db.Tooltip.Criteria.ShowIf.AchievementIsCompleted; end,
                            set = function() addon.Options.db.Tooltip.Criteria.ShowIf.AchievementIsCompleted = not addon.Options.db.Tooltip.Criteria.ShowIf.AchievementIsCompleted; end
                        },
                        ShowCriteriaIfAchievementWasNotEarnedByMe = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Achievement was Not Earned by Me"],
                            desc = addon.L["Achievement was Not Earned by Me Desc"]:AddDefaultValueText("Tooltip.Criteria.ShowIf.AchievementWasNotEarnedByMe"),
                            get = function() return addon.Options.db.Tooltip.Criteria.ShowIf.AchievementWasNotEarnedByMe; end,
                            set = function() addon.Options.db.Tooltip.Criteria.ShowIf.AchievementWasNotEarnedByMe = not addon.Options.db.Tooltip.Criteria.ShowIf.AchievementWasNotEarnedByMe; end
                        },
                        ShowCriteriaIfCriteriaIsCompleted = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Criteria is Completed"],
                            desc = addon.L["Criteria is Completed Desc"]:AddDefaultValueText("Tooltip.Criteria.ShowIf.CriteriaIsCompleted"),
                            get = function() return addon.Options.db.Tooltip.Criteria.ShowIf.CriteriaIsCompleted; end,
                            set = function() addon.Options.db.Tooltip.Criteria.ShowIf.CriteriaIsCompleted = not addon.Options.db.Tooltip.Criteria.ShowIf.CriteriaIsCompleted; end
                        },
                        Blank42 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
                    }
                }
            }
        }
    }
};