-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;

local achievementPointsDisplays = {
    addon.L["Account wide (default)"],
    addon.L["Character / Account wide"],
    addon.L["Character only"]
};

local function SetCategoriesFrameWidthOffset(_, value)
    if addon.Options.db.Window.CategoriesFrameWidthOffset == value then return; end
    addon.Options.db.Window.CategoriesFrameWidthOffset = value;
    addon.Event:SendMessage("UpdateAchievementFrameWidth", addon.Options.db.Window.CategoriesFrameWidthOffset);
    options.Debug(addon.L["Categories width offset"], addon.Options.db.Window.CategoriesFrameWidthOffset);
end

local function SetMaxNumberOfSearchPreviews()
    local numberOfSearchPreviews = LibStub("AceConfigRegistry-3.0"):GetOptionsTable(addon.MetaData.Title, "cmd", "KROWIAF-0.0").args.Search.args.NumberOfSearchPreviews; -- cmd and KROWIAF-0.0 are just to make the function work
    numberOfSearchPreviews.max = options.MaxNumberOfSearchPreviews();
    if numberOfSearchPreviews.get() > numberOfSearchPreviews.max then
        numberOfSearchPreviews.set(nil, numberOfSearchPreviews.max);
    end
end

local function SetAchievementFrameHeightOffset(_, value)
    if addon.Options.db.Window.AchievementFrameHeightOffset == value then return; end
    addon.Options.db.Window.AchievementFrameHeightOffset = value;
    SetMaxNumberOfSearchPreviews();
    addon.Event:SendMessage("UpdateAchievementFrameHeight", addon.Options.db.Window.AchievementFrameHeightOffset);
    options.Debug(addon.L["Achievement window height offset"], addon.Options.db.Window.AchievementFrameHeightOffset);
end

local function SetMergeSmallCategoriesThreshold(_, value)
    if addon.Options.db.Window.MergeSmallCategoriesThreshold == value then return; end
    addon.Options.db.Window.MergeSmallCategoriesThreshold = value;
    addon.GUI.CategoriesFrame:Update(true);
    options.Debug(addon.L["Categories width offset"], addon.Options.db.Window.MergeSmallCategoriesThreshold);
end

local function DrawFocusedSubCategories()
    if addon.GUI.SelectedTab == nil then -- If nil, not yet loaded
        return;
    end
    -- Reset all
    addon.Data.FocusedCategory.Achievements = nil;
    addon.Data.FocusedCategory.Children = nil;
    addon.GUI.CategoriesFrame:Update(true);
    addon.GUI.AchievementsFrame:ForceUpdate();
    -- Draw again
    addon.Data.LoadFocusedAchievements(addon.Data.Achievements);
end

local function SetShowFocusedSubCategories()
    addon.Options.db.Categories.Focused.ShowSubCategories = not addon.Options.db.Categories.Focused.ShowSubCategories;
    DrawFocusedSubCategories();
    options.Debug(addon.L["Show Sub Categories"], addon.Options.db.Categories.Focused.ShowSubCategories);
end

local function ClearAllFocused()
    addon.Data.FocusedCategory.Achievements = nil;
    addon.Data.FocusedCategory.Children = nil;
    if addon.GUI.SelectedTab ~= nil then -- If nil, not yet loaded
        if SavedData.FocusedAchievements then
            for id, _ in next, SavedData.FocusedAchievements do
                addon.Data.Achievements[id]:ClearFocus();
            end
        end
        addon.GUI.CategoriesFrame:Update(true);
        addon.GUI.AchievementsFrame:ForceUpdate();
    end
    SavedData.FocusedAchievements = nil;
end

local function ShowExcludedCategory()
    if addon.GUI.SelectedTab == nil then -- If nil, not yet loaded
        return;
    end
    if addon.Options.db.Categories.Excluded.Show then
        addon.Data.LoadExcludedAchievements(addon.Data.Achievements);
    else
        addon.Data.ExcludedCategory.Achievements = nil;
        addon.Data.ExcludedCategory.Children = nil;
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
    addon.Data.ExcludedCategory.Achievements = nil;
    addon.Data.ExcludedCategory.Children = nil;
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
    addon.Data.ExcludedCategory.Achievements = nil;
    addon.Data.ExcludedCategory.Children = nil;
    addon.GUI.CategoriesFrame:Update(true);
    addon.GUI.AchievementsFrame:ForceUpdate();
    -- Draw again
    addon.Data.LoadExcludedAchievements(addon.Data.Achievements);
end

local function SetShowExcludedSubCategories()
    addon.Options.db.Categories.Excluded.ShowSubCategories = not addon.Options.db.Categories.Excluded.ShowSubCategories;
    DrawExcludedSubCategories();
    options.Debug(addon.L["Show Sub Categories"], addon.Options.db.Categories.Excluded.ShowSubCategories);
end

local function SetCompactAchievements()
    addon.Options.db.Achievements.Compact = not addon.Options.db.Achievements.Compact;
    if addon.Options.db.Achievements.Compact then
        addon.Options.db.Achievements.ButtonCollapsedHeight = 48; -- reward height = 20
    else
        addon.Options.db.Achievements.ButtonCollapsedHeight = ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT;
    end
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
                    order = 1.1, type = "toggle", width = 1.5,
                    name = addon.L["Make window movable"],
                    desc = addon.ReplaceVarsWithReloadReq(addon.L["Make window movable Desc"]),
                    get = function() return addon.Options.db.Window.Movable; end,
                    set = function()
                        addon.Options.db.Window.Movable = not addon.Options.db.Window.Movable;
                        addon.MakeWindowMovable();
                        options.Debug(addon.L["Make window movable"], addon.Options.db.Window.Movable);
                    end
                },
                Blank12 = {order = 1.2, type = "description", width = 1.5, name = ""},
                CategoriesFrameWidthOffset = {
                    order = 2.1, type = "range", width = 1.5,
                    name = addon.L["Categories width offset"],
                    desc = addon.Util.ReplaceVars {
                        addon.L["Categories width offset Desc"],
                        addonName = addon.MetaData.Title,
                        tabName = string.format(addon.Colors.Yellow, addon.L["Expansions"])
                    },
                    min = -125, max = 250, step = 1,
                    get = function() return addon.Options.db.Window.CategoriesFrameWidthOffset; end,
                    set = SetCategoriesFrameWidthOffset
                },
                AchievementFrameHeightOffset = {
                    order = 2.2, type = "range", width = 1.5,
                    name = addon.L["Achievement window height offset"],
                    desc = addon.ReplaceVarsWithReloadReq {
                        addon.L["Achievement window height offset Desc"],
                        addonName = addon.MetaData.Title,
                        tabName = string.format(addon.Colors.Yellow, addon.L["Expansions"])
                    },
                    min = -250, max = 500, step = 1,
                    get = function() return addon.Options.db.Window.AchievementFrameHeightOffset; end,
                    set = SetAchievementFrameHeightOffset
                }
            }
        },
        Tabs = {
            order = 2, type = "group",
            name = addon.L["Tabs"],
            args = {
                Order = {
                    order = 1, type = "group",
                    name = addon.L["Order"],
                    inline = true,
                    args = {
                        -- Dynamically added
                    }
                },
                Blizzard_AchievementUI = {
                    order = 2, type = "group",
                    name = addon.L["Blizzard"],
                    inline = true,
                    args = {
                        Achievements = {
                            type = "toggle",
                            name = addon.L["Achievements"],
                            get = function() return addon.Options.db.Tabs[1].Show; end,
                            set = function() addon.GUI.ShowHideTabs(1); end
                        },
                        Guild = {
                            type = "toggle",
                            name = addon.L["Guild"],
                            get = function() return addon.Options.db.Tabs[2].Show; end,
                            set = function() addon.GUI.ShowHideTabs(2); end
                        },
                        Statistics = {
                            type = "toggle",
                            name = addon.L["Statistics"],
                            get = function() return addon.Options.db.Tabs[3].Show; end,
                            set = function() addon.GUI.ShowHideTabs(3); end
                        }
                    }
                },
                -- More dynamically added
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
                            type = "select", width = 1.5,
                            name = addon.L["Format"],
                            values = achievementPointsDisplays,
                            get = function() return addon.Options.db.AchievementPoints.Format; end,
                            set = function (_, value)
                                if addon.Options.db.AchievementPoints.Format == value then return; end;
                                addon.Options.db.AchievementPoints.Format = value;
                                options.Debug(addon.L["Format"], addon.Options.db.AchievementPoints.Format);
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
                            type = "toggle", width = 1.5,
                            name = addon.L["Always show realm"],
                            desc = addon.L["Always show realm Desc"],
                            get = function() return addon.Options.db.AchievementPoints.Tooltip.AlwaysShowRealm; end,
                            set = function()
                                addon.Options.db.AchievementPoints.Tooltip.AlwaysShowRealm = not addon.Options.db.AchievementPoints.Tooltip.AlwaysShowRealm;
                                options.Debug(addon.L["Always show realm"], addon.Options.db.AchievementPoints.Tooltip.AlwaysShowRealm);
                            end
                        }
                    }
                }
            }
        },
        Categories = {
            order = 4, type = "group",
            name = addon.L["Categories"],
            args = {
                Focused = {
                    order = 1, type = "group",
                    name = addon.L["Focused"],
                    inline = true,
                    args = {
                         ShowFocusedSubCategories = {
                            order = 1.1, type = "toggle", width = "normal",
                            name = addon.L["Show Sub Categories"],
                            desc = addon.Util.ReplaceVars {
                                addon.L["Show Sub Categories Desc"],
                                category = addon.L["Focused"]
                            },
                            get = function() return addon.Options.db.Categories.Focused.ShowSubCategories; end,
                            set = SetShowFocusedSubCategories
                        },
                        Blank12 = {order = 1.2, type = "description", width = "normal", name = ""},
                        ClearAll = {
                            order = 1.3, type = "execute",
                            name = addon.L["Clear all"],
                            desc = addon.L["Clear all Desc"],
                            func = ClearAllFocused
                        }
                    }
                },
                Excluded = {
                    order = 2, type = "group",
                    name = addon.L["Excluded"],
                    inline = true,
                    args = {
                        ShowExcludedCategory = {
                            order = 1.1, type = "toggle", width = "normal",
                            name = addon.L["Show Excluded Category"],
                            desc = addon.Util.ReplaceVars
                            {
                                addon.L["Show Excluded Category Desc"],
                                excluded = addon.L["Excluded"]
                            },
                            get = function() return addon.Options.db.Categories.Excluded.Show; end,
                            set = SetShowExcludedCategory
                        },
                        Blank12 = {order = 1.2, type = "description", width = "normal", name = ""},
                        IncludeAll = {
                            order = 1.3, type = "execute",
                            name = addon.L["Include all"],
                            desc = addon.L["Include all Desc"],
                            func = IncludeAllExcluded
                        },
                        ShowExcludedSubCategories = {
                            order = 2, type = "toggle", width = "normal",
                            name = addon.L["Show Sub Categories"],
                            desc = addon.Util.ReplaceVars {
                                addon.L["Show Sub Categories Desc"],
                                category = addon.L["Excluded"]
                            },
                            disabled = function() return not addon.Options.db.Categories.Excluded.Show; end,
                            get = function() return addon.Options.db.Categories.Excluded.ShowSubCategories; end,
                            set = SetShowExcludedSubCategories
                        },
                    }
                },
                Tooltip = {
                    order = 3, type = "group",
                    name = addon.L["Tooltip"],
                    inline = true,
                    args = {
                        ShowNotObtainable = {
                            order = 1, type = "toggle", width = 1.5,
                            name = addon.Util.ReplaceVars
                            {
                                addon.L["Show Not Obtainable"],
                                notObtainable = addon.L["Not Obtainable"]
                            },
                            desc = addon.Util.ReplaceVars
                            {
                                addon.L["Show Not Obtainable Desc"],
                                notObtainable = addon.L["Not Obtainable"]
                            },
                            get = function() return addon.Options.db.Tooltip.Categories.ShowNotObtainable; end,
                            set = function()
                                addon.Options.db.Tooltip.Categories.ShowNotObtainable = not addon.Options.db.Tooltip.Categories.ShowNotObtainable;
                                options.Debug(addon.L["Show Not Obtainable"], addon.Options.db.Tooltip.Categories.ShowNotObtainable);
                            end
                        }
                    }
                },
                Merge = {
                    order = 4, type = "group",
                    name = addon.L["Merge Small Categories"],
                    inline = true,
                    args = {
                        MergeSmallCategoriesThreshold = {
                            order = 1.1, type = "range", width = 1.5,
                            name = addon.L["Merge small categories threshold"],
                            desc = addon.ReplaceVarsWithReloadReq(addon.L["Merge small categories threshold Desc"]),
                            min = 1, max = 50, step = 1,
                            get = function() return addon.Options.db.Window.MergeSmallCategoriesThreshold; end,
                            set = SetMergeSmallCategoriesThreshold
                        }
                    }
                },
                Summary = {
                    order = 5, type = "group",
                    name = addon.L["Summary"],
                    inline = true,
                    args = {
                        NumAchievements = {
                            order = 1.1, type = "range", width = 1.5,
                            name = addon.L["Number of summary achievements"],
                            desc = addon.L["Number of summary achievements Desc"],
                            min = 1, max = 25, step = 1,
                            get = function() return addon.Options.db.Categories.Summary.NumAchievements; end,
                            set = function(_, value)
                                if addon.Options.db.Categories.Summary.NumAchievements == value then return; end
                                addon.Options.db.Categories.Summary.NumAchievements = value;
                                options.Debug(addon.L["Number of summary achievements"], addon.Options.db.Categories.Summary.NumAchievements);
                            end
                        }
                    }
                }
            }
        },
        Achievements = {
            order = 5, type = "group",
            name = addon.L["Achievements"],
            args = {
                Style = {
                    order = 1, type = "group",
                    name = addon.L["Style"],
                    inline = true,
                    args = {
                        CompactAchievements = {
                            type = "toggle", width = 1.5,
                            name = addon.L["Compact Achievements"],
                            desc = addon.ReplaceVarsWithReloadReq(addon.L["Compact Achievements Desc"]),
                            get = function() return addon.Options.db.Achievements.Compact; end,
                            set = SetCompactAchievements,
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
                            order = 2.1, type = "range", width = 1.5,
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
                            order = 2.2, type = "range", width = 1.5,
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
                            order = 3, type = "toggle", width = 1.5,
                            name = addon.L["Always show realm"],
                            desc = addon.L["Always show realm Desc"],
                            get = function() return addon.Options.db.Tooltip.Achievements.EarnedBy.AlwaysShowRealm; end,
                            set = function()
                                addon.Options.db.Tooltip.Achievements.EarnedBy.AlwaysShowRealm = not addon.Options.db.Tooltip.Achievements.EarnedBy.AlwaysShowRealm;
                                options.Debug(addon.L["Always show realm"], addon.Options.db.Tooltip.Achievements.EarnedBy.AlwaysShowRealm);
                            end
                        },
                        PartOfAChain = {
                            order = 4, type = "header",
                            name = addon.L["Part of a chain"]
                        },
                        ShowPartOfAChain = {
                            order = 5.1, type = "toggle", width = 1.5,
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
                            order = 5.2, type = "toggle", width = 1.5,
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
                            order = 6, type = "header",
                            name = addon.L["Required for"]
                        },
                        ShowRequiredFor = {
                            order = 7.1, type = "toggle", width = 1.5,
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
                            order = 7.2, type = "toggle", width = 1.5,
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
                            order = 8, type = "header",
                            name = addon.L["Other faction"]
                        },
                        ShowOtherFaction = {
                            order = 9.1, type = "toggle", width = 1.5,
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
                            order = 10, type = "header",
                            name = addon.L["Objectives progress"]
                        },
                        ObjectivesProgressShow = {
                            order = 11.1, type = "toggle", width = 1.5,
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
                            order = 11.2, type = "toggle", width = 1.5,
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
                            order = 12, type = "range", width = 1.5,
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
            order = 6, type = "group",
            name = addon.L["Right Click Menu"],
            args = {
                Button = {
                    order = 1, type = "group",
                    name = addon.L["Button"],
                    inline = true,
                    args = {
                        ShowButtonOnAchievement = {
                            order = 1, type = "toggle", width = "full",
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
                            order = 1, type = "toggle", width = "full",
                            name = addon.L["Add Locale"],
                            desc = addon.Util.ReplaceVars {
                                addon.L["Add Locale Desc"],
                                wowheadLink = addon.L["Wowhead Link"]
                            },
                            get = function() return addon.Options.db.RightClickMenu.WowheadLink.AddLocale; end,
                            set = function()
                                addon.Options.db.RightClickMenu.WowheadLink.AddLocale = not addon.Options.db.RightClickMenu.WowheadLink.AddLocale;
                                options.Debug(addon.L["Add Locale"], addon.Options.db.RightClickMenu.WowheadLink.AddLocale);
                            end
                        },
                        AddRelatedTab = {
                            order = 2, type = "select", width = 1.5,
                            name = addon.L["Related Tab"],
                            desc = addon.Util.ReplaceVars {
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
            order = 7, type = "group",
            name = addon.L["Calendar"],
            args = {
                Weekdays = {
                    order = 1, type = "group",
                    name = addon.L["Weekdays"],
                    inline = true,
                    args = {
                        FirstDayOfTheWeek = {
                            order = 1, type = "select", width = 1.5,
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
        }
    }
};