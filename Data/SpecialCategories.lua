local _, addon = ...;
local data = addon.Data;
data.SpecialCategories = {};
local specialCategories = data.SpecialCategories;

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
        end
    },
    {
        CategoryType = "Excluded",
        Text = addon.L["Excluded"],
        Side = "BOTTOM",
        PostLoad = function(category)
            category:SetFlexibleData(true);
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

local function AddCategory(id, specialCategory, tab, categoryOrder)
    data.Categories[id] = addon.Objects.Category:New(id, specialCategory.Text);
    if specialCategory.Side == "TOP" then
        data.Categories[tab.Category.Id]:InsertCategory(data.Categories[id], categoryOrder);
    else
        data.Categories[tab.Category.Id]:AddCategory(data.Categories[id]);
    end
    tinsert(data[specialCategory.CategoryType .. "Categories"], data.Categories[id]);
    if specialCategory.PostLoad then
        specialCategory.PostLoad(data.Categories[id], #data[specialCategory.CategoryType .. "Categories"]);
    end
end

function specialCategories:Load()
    local categoryOrder = 0;
    for _, specialCategory in next, specialCategoriesMatrix do
        wipe(data[specialCategory.CategoryType .. "Categories"]);
        categoryOrder = categoryOrder + 1;
        for _, tabName in next, addon.TabsOrder do
            AddCategory(data.GetNextFreeCategoryId(), specialCategory, addon.Tabs[tabName], categoryOrder);
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