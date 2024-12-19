local _, addon = ...;
local data = addon.Data;
addon.SpecialCategories = {};
local specialCategories = addon.SpecialCategories;

local function LoadAchievements(sourceTable, func)
    if sourceTable == nil or type(sourceTable) ~= "table" then
        return;
    end

    for achievementId, _ in next, sourceTable do
        if data.Achievements[achievementId] then
            func(data.Achievements[achievementId], false);
        else -- This is to clean up achievements that are no longer in the dataset
            sourceTable[achievementId] = nil;
        end
    end
end

local specialCategoriesMatrix = { -- Order of this list is important
    {
        CategoryType = "Summary",
        Text = addon.L["Summary"],
        Side = "TOP",
        PostLoad = function(category, index)
            local value = addon.Options.db.profile.AdjustableCategories.Summary[index];
            category:SetAlwaysVisible(value);
            category.IsSummary = true;
        end,
        ShowByDefault = true
    },
    {
        CategoryType = "WatchList",
        Text = addon.L["Watch List"],
        Side = "TOP",
        PostLoad = function(category)
            category:SetFlexibleData(true);
            category.IsWatchList = true;
        end,
        LoadData = function()
            addon.Data.SavedData.AchievementData.LoadWatchedAchievements();
            addon.Diagnostics.Trace("Watched achievements loaded");
        end
    },
    {
        CategoryType = "CurrentZone",
        Text = addon.L["Current Zone"],
        Side = "TOP",
        PostLoad = function(category)
            category:SetFlexibleData(true);
            category.IsCurrentZone = true;
        end
    },
    {
        CategoryType = "SelectedZone",
        Text = addon.L["Selected Zone"],
        Side = "TOP",
        PostLoad = function(category)
            category:SetFlexibleData(true);
            category.IsSelectedZone = true;
        end
    },
    {
        CategoryType = "SearchResults",
        Text = addon.L["Search Results"],
        Side = "TOP",
        PostLoad = function(category)
            category:SetFlexibleData(true);
        end
    },
    {
        CategoryType = "TrackingAchievements",
        Text = addon.L["Tracking Achievements"],
        Side = "BOTTOM",
        PostLoad = function(category)
            category:SetFlexibleData(true);
            category.IsTracking = true;
        end,
        LoadData = function()
            LoadAchievements(addon.TrackingAchievements, addon.AddToTrackingAchievementsCategories);
            addon.Diagnostics.Trace("Watched achievements loaded");
        end
    },
    {
        CategoryType = "Excluded",
        Text = addon.L["Excluded"],
        Side = "BOTTOM",
        PostLoad = function(category)
            category:SetFlexibleData(true);
        end,
        LoadData = function()
            LoadAchievements(KrowiAF_SavedData.ExcludedAchievements, addon.ExcludeAchievement);
            addon.Diagnostics.Trace("Watched achievements loaded");
        end
    },
    {
        CategoryType = "Uncategorized",
        Text = addon.L["Uncategorized"],
        Side = "BOTTOM",
        PostLoad = function(category)
            category:SetFlexibleData(true);
        end
    },
};

local function AddCategory(id, specialCategory, categoryTypeTable, tab, categoryOrder)
    data.Categories[id] = addon.Objects.Category:New(id, specialCategory.Text);
    if specialCategory.Side == "TOP" then
        data.Categories[tab.Category.Id]:InsertCategory(data.Categories[id], categoryOrder);
    else
        data.Categories[tab.Category.Id]:AddCategory(data.Categories[id]);
    end
    tinsert(categoryTypeTable, data.Categories[id]);
    if specialCategory.PostLoad then
        specialCategory.PostLoad(data.Categories[id], #categoryTypeTable);
    end
end

function specialCategories:Load()
    local categoryOrder = 0;
    for _, specialCategory in next, specialCategoriesMatrix do
        specialCategories[specialCategory.CategoryType] = specialCategories[specialCategory.CategoryType] or {};
        wipe(specialCategories[specialCategory.CategoryType]);
        categoryOrder = categoryOrder + 1;
        for _, tabName in next, addon.TabsOrder do
            AddCategory(data.GetNextFreeCategoryId(), specialCategory, specialCategories[specialCategory.CategoryType], addon.Tabs[tabName], categoryOrder);
        end
    end
end

function specialCategories.InjectDynamicOptions()
    for _, specialCategory in next, specialCategoriesMatrix do
        for index, tabName in next, addon.TabsOrder do
            addon.Options.Layout.InjectDynamicAdjustableCategoryOptions(
                specialCategory.CategoryType,
                specialCategory.Text,
                index,
                tabName,
                addon.Tabs[tabName].Text,
                specialCategory.ShowByDefault or tabName == "Specials"
            );
        end
    end
end

function specialCategories.LoadData()
    for _, specialCategory in next, specialCategoriesMatrix do
        if specialCategory.LoadData then
            specialCategory.LoadData();
        end
    end
end