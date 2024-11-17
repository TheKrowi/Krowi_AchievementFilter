local _, addon = ...;

KrowiAF.CategoryData = {};

local function AddToTab(id, tabName)
    addon.Data.Categories[id]:SetTabName(tabName);
    addon.Tabs[tabName].Categories = addon.Data.Categories[id].Children;
    addon.Tabs[tabName].Category = addon.Data.Categories[id];
end

local function AddAchievements(categoryId, achievementIds)
    for _, achievementId in next, achievementIds do
        if addon.Data.Achievements[achievementId] then
            addon.Data.Categories[categoryId]:AddAchievement(addon.Data.Achievements[achievementId]);
        end
    end
end

function KrowiAF.AddIfNewCategoryData(id, name, canMerge)
    if addon.Data.Categories[id] then
        addon.Data.Categories[id]:PostNewFix(name);
        return;
    end
    addon.Data.Categories[id] = addon.Objects.Category:New(id, name, canMerge);
end

local ParseCategory;
local function ParseChild(category, index)
    local categoryData = category[index];

    if not addon.Util.IsTable(categoryData) then
        return;
    end

    if categoryData.IsTab then
        AddToTab(category[1], categoryData.TabName);
    end

    if categoryData.IgnoreFactionFilter then
        addon.Data.Categories[category[1]].IgnoreFilters = addon.Data.Categories[category[1]].IgnoreFilters or {};
        addon.Data.Categories[category[1]].IgnoreFilters.FactionFilter = true;
    end

    if categoryData.IgnoreCollapsedChainFilter then
        addon.Data.Categories[category[1]].IgnoreFilters = addon.Data.Categories[category[1]].IgnoreFilters or {};
        addon.Data.Categories[category[1]].IgnoreFilters.CollapsedChainFilter = true;
    end

    if categoryData.IsTab or categoryData.IgnoreFactionFilter or categoryData.IgnoreCollapsedChainFilter then
        return;
    end

    if #categoryData > 2 and addon.Util.IsString(categoryData[2]) then
        ParseCategory(categoryData, addon.Data.Categories[category[1]]);
        return;
    end

    if (#categoryData == 1 or addon.Util.IsNumber(categoryData[2])) then
        AddAchievements(category[1], categoryData);
        return;
    end
end

function ParseCategory(category, parent)
    KrowiAF.AddIfNewCategoryData(category[1], category[2], addon.Util.IsBoolean(category[3]) and category[3] or nil);

    if parent then
        parent:AddCategory(addon.Data.Categories[category[1]]);
        parent:PostAddCategoryFix();
    end

    local index = addon.Util.IsBoolean(category[3]) and 4 or 3;

    while category[index] do
        ParseChild(category, index);
        index = index + 1;
    end
end

function KrowiAF.CreateCategories()
    for _, root in next, KrowiAF.CategoryData do
        ParseCategory(root);
    end
end