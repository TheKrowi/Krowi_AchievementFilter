local _, addon = ...;

KrowiAF.CategoryData = {};

local function SetCategoryRootForTab(id, tabName)
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

function KrowiAF.AddIfNewCategoryData(id, name, parent, canMerge)
    if addon.Data.Categories[id] then
        return;
    end
    addon.Data.Categories[id] = addon.Objects.Category:New(id, name, canMerge);

    local parentId = addon.Util.IsTable(parent) and parent.Id or parent;
    if parentId then
        addon.Data.Categories[parentId]:AddCategory(addon.Data.Categories[id]);
    end

    return addon.Data.Categories[id];
end

local nextCategoryId = 9000;
local ParseCategory;
local function ParseChildData(categoryId, childData)
    local index = 1;
    if addon.Util.IsNumber(childData[1]) then
        index = index + 1;
    end

    if not addon.Util.IsTable(childData) then
        return;
    end

    if childData.TabName then
        SetCategoryRootForTab(categoryId, childData.TabName);
    end

    if childData.IgnoreFactionFilter then
        addon.Data.Categories[categoryId]:SetIgnoreFactionFilter();
    end

    if childData.IgnoreCollapsedChainFilter then
        addon.Data.Categories[categoryId]:SetIgnoreCollapsedChainFilter();
    end

    if childData.Tooltip then
        addon.Data.Categories[categoryId]:SetTooltip(childData.Tooltip);
    end

    if childData.TabName or childData.IgnoreFactionFilter or childData.IgnoreCollapsedChainFilter or childData.Tooltip then
        return;
    end

    if addon.Util.IsString(childData[index]) then
        ParseCategory(childData, addon.Data.Categories[categoryId]);
        return;
    end

    if (#childData == 1 or addon.Util.IsNumber(childData[2])) then
        AddAchievements(categoryId, childData);
        return;
    end
end

local deferredCategories = {};
function ParseCategory(category, parent)
    local index = 1;
    local categoryId, categoryName, categoryCanMerge;
    if addon.Util.IsNumber(category[1]) then
        categoryId = category[1];
        index = index + 1;
    else
        categoryId = nextCategoryId;
        nextCategoryId = nextCategoryId + 1;
    end

    if addon.Util.IsString(category[index]) then
        categoryName = category[index];
        index = index + 1;
    end

    if addon.Util.IsBoolean(category[index]) then
        categoryCanMerge = category[index];
        index = index + 1;
    end

    if not addon.Data.Categories[categoryId] and not categoryName then
        deferredCategories[categoryId] = category;
        assert(parent == nil, "Error: Parent category is not nil. Verify the category hierarchy.");
        return;
    end

    KrowiAF.AddIfNewCategoryData(categoryId, categoryName, parent, categoryCanMerge);

    while category[index] do
        ParseChildData(categoryId, category[index]);
        index = index + 1;
    end

    if deferredCategories[categoryId] then
        category = deferredCategories[categoryId];
        deferredCategories[categoryId] = nil;
        ParseCategory(category);
    end
end

function KrowiAF.CreateCategories()
    for _, root in next, KrowiAF.CategoryData do
        ParseCategory(root);
    end
end