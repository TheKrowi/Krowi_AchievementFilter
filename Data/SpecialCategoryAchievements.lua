local _, addon = ...

-- Mirrors sourceCategory's chain (tab category down to the achievement's own category) under the special
-- category and returns the leaf, reusing nodes of the same name that are already there
local function AddCategoriesTree(category, sourceCategory, extraFunc)
    local categories = sourceCategory:GetTree()
    for _, cat in next, categories do
        local alreadyAdded
        if category.Children then
            for _, child in next, category.Children do
                if child.Name == cat.Name then
                    alreadyAdded = true
                    category = child
                end
            end
        end
        if alreadyAdded == nil then
            -- Mirror nodes get a fresh id from the shared counter; an offset on the source id overlapped the
            -- auto-generated and Blizzard category ranges and was reused for every tab and every special tree
            local newId = addon.Data.GetNextFreeCategoryId()
            local newCategory = addon.Objects.Category:New(newId, cat.Name)
            addon.Data.Categories[newId] = newCategory
            extraFunc(newCategory)
            category = category:AddCategory(newCategory)
        end
        alreadyAdded = nil
    end
    return category
end

local function AddWatchListCategoriesTree(watchListCategory, achievement)
    if not addon.Options.db.profile.Categories.WatchList.ShowSubCategories then
        return watchListCategory
    end
    return AddCategoriesTree(watchListCategory, achievement.Category, function(newCategory)
        newCategory.IsWatchList = true
    end)
end

-- category: the achievement's data category, or nil for an uncategorized tracking achievement. Passed in
-- rather than read from the achievement because AddAchievement on the first root makes that root the
-- Category of an uncategorized one, and the next root would then mirror the first root's chain under itself
local function AddTrackingAchievementsCategoriesTree(trackingAchievementsCategory, category)
    if not addon.Options.db.profile.Categories.TrackingAchievements.ShowSubCategories or category == nil then
        return trackingAchievementsCategory
    end
    return AddCategoriesTree(trackingAchievementsCategory, category, function(newCategory)
        newCategory.IsTracking = true
    end)
end

local function AddExcludedCategoriesTree(excludedCategory, achievement)
    if not addon.Options.db.profile.Categories.Excluded.ShowSubCategories then
        return excludedCategory
    end
    return AddCategoriesTree(excludedCategory, achievement.Category, function(newCategory)
        newCategory.Excluded = true
    end)
end

local function ClearTree(categories)
    for i = #categories, 1, -1 do
        if categories[i].Achievements == nil or #categories[i].Achievements == 0 then -- No more achievements
            if categories[i].Children == nil or #categories[i].Children == 0 then -- And no more children
                if categories[i].Parent.TabName == nil then -- Do not remove the special category
                    categories[i].Parent:RemoveCategory(categories[i])
                end
            end
        end
    end
end

-- The Watch List and Excluded trees are rebuilt from the saved variables when a layout option changes. A rebuild
-- drops the roots' achievements and mirrored sub-categories, so the lists each achievement keeps of the mirror
-- nodes it was added to are dropped with them; a later unwatch or include would otherwise walk an orphaned tree
local function ClearAchievementCategoryLists(category, listName)
    if category.Achievements then
        for _, achievement in next, category.Achievements do
            achievement[listName] = nil
        end
    end
    if category.Children then
        for _, child in next, category.Children do
            ClearAchievementCategoryLists(child, listName)
        end
    end
end

local function ResetCategories(categories, listName)
    for i = 1, #categories do
        ClearAchievementCategoryLists(categories[i], listName)
        categories[i].Achievements = nil
        categories[i].Children = nil
    end
end

function addon.ResetWatchListCategories()
    ResetCategories(addon.SpecialCategories.WatchList, "WatchListCategories")
end

function addon.ResetExcludedCategories()
    ResetCategories(addon.SpecialCategories.Excluded, "ExcludedCategories")
end

-- Tracking achievements are added with the plain AddAchievement, which registers the node as the achievement's
-- Category or in its MoreCategories, so a rebuild unlinks those before the roots are dropped
local function UnlinkTrackingCategories(category)
    if category.Achievements then
        for _, achievement in next, category.Achievements do
            if achievement.Category == category then
                achievement.Category = nil
            elseif achievement.MoreCategories then
                for i = #achievement.MoreCategories, 1, -1 do
                    if achievement.MoreCategories[i] == category then
                        tremove(achievement.MoreCategories, i)
                    end
                end
            end
        end
    end
    if category.Children then
        for _, child in next, category.Children do
            UnlinkTrackingCategories(child)
        end
    end
end

function addon.ResetTrackingAchievementsCategories()
    local categories = addon.SpecialCategories.TrackingAchievements
    for i = 1, #categories do
        UnlinkTrackingCategories(categories[i])
        categories[i].Achievements = nil
        categories[i].Children = nil
    end
end

function addon.ClearWatchAchievement(achievement, update)
    achievement:ClearWatch()
    local numWatchListCategories = achievement.WatchListCategories and #achievement.WatchListCategories or 0
    for i = 1, numWatchListCategories do
        achievement.WatchListCategories[i]:RemoveWatchedAchievement(achievement)
    end
    if addon.Options.db.profile.Categories.WatchList.ShowSubCategories then
        for i = 1, numWatchListCategories do
            ClearTree(achievement.WatchListCategories[i]:GetTree())
        end
    end
    achievement.WatchListCategories = nil
    if update ~= false then
        addon.Gui:RefreshView()
    end
    for i = 1, #addon.SpecialCategories.WatchList do
        if (addon.SpecialCategories.WatchList[i].Achievements and #addon.SpecialCategories.WatchList[i].Achievements == 0) or (addon.SpecialCategories.WatchList[i].Children and #addon.SpecialCategories.WatchList[i].Children == 0) then
            addon.Data.SavedData.AchievementData:ClearWatchedAchievements()
            addon.SpecialCategories.WatchList[i].Achievements = nil
        end
    end
end

function addon.WatchAchievement(achievement, update)
    achievement:Watch()
    for i = 1, #addon.SpecialCategories.WatchList do
        if addon.Options.db.profile.AdjustableCategories.WatchList[i] then
            local watchListCategory = AddWatchListCategoriesTree(addon.SpecialCategories.WatchList[i], achievement)
            watchListCategory:AddWatchedAchievement(achievement)
        end
	end
    if update ~= false then
        local scrollPercentage = KrowiAF_AchievementsFrame.ScrollBox:GetScrollPercentage()
        addon.Gui:RefreshView()
        KrowiAF_AchievementsFrame.ScrollBox:SetScrollPercentage(scrollPercentage)
    end
end

function addon.AddToTrackingAchievementsCategories(achievement, update)
    local category = achievement.Category -- before the first root's AddAchievement can claim it, see AddTrackingAchievementsCategoriesTree
    for i = 1, #addon.SpecialCategories.TrackingAchievements do
        if addon.Options.db.profile.AdjustableCategories.TrackingAchievements[i] then
            local trackingAchievementsCategory = AddTrackingAchievementsCategoriesTree(addon.SpecialCategories.TrackingAchievements[i], category)
            trackingAchievementsCategory:AddAchievement(achievement)
            trackingAchievementsCategory.CountsDirty = true
        end
    end
    if update ~= false then
        KrowiAF_CategoriesFrame:Update(true)
        KrowiAF_AchievementsFrame:ForceUpdate()
    end
end

function addon.AddToUncategorizedAchievementsCategories(achievement, update)
    for i = 1, #addon.SpecialCategories.Uncategorized do
        if addon.Options.db.profile.AdjustableCategories.Uncategorized[i] then
            local category = addon.SpecialCategories.Uncategorized[i]
            category:AddAchievement(achievement)
            category.CountsDirty = true
        end
    end
    if update ~= false then
        KrowiAF_CategoriesFrame:Update(true)
        KrowiAF_AchievementsFrame:ForceUpdate()
    end
end

function addon.IncludeAchievement(achievement, update)
    achievement:Include()
    local numExcludedCategories = achievement.ExcludedCategories and #achievement.ExcludedCategories or 0
    for i = 1, numExcludedCategories do
        achievement.ExcludedCategories[i]:RemoveExcludedAchievement(achievement)
    end
    if addon.Options.db.profile.Categories.Excluded.ShowSubCategories then
        for i = 1, numExcludedCategories do
            ClearTree(achievement.ExcludedCategories[i]:GetTree())
        end
    end
    achievement.ExcludedCategories = nil
    if update ~= false then
        addon.Gui:RefreshView()
    end
    for i = 1, #addon.SpecialCategories.Excluded do
        if (addon.SpecialCategories.Excluded[i].Achievements and #addon.SpecialCategories.Excluded[i].Achievements == 0) or (addon.SpecialCategories.Excluded[i].Children and #addon.SpecialCategories.Excluded[i].Children == 0) then
            addon.SpecialCategories.Excluded[i].Achievements = nil
        end
    end
    if KrowiAF_SavedData.ExcludedAchievements then
        for _, _ in next, KrowiAF_SavedData.ExcludedAchievements do
            return
        end
        KrowiAF_SavedData.ExcludedAchievements = nil
    end
end

function addon.ExcludeAchievement(achievement, update)
    achievement:Exclude()
    if addon.Options.db.profile.Categories.Excluded.Show then
        for i = 1, #addon.SpecialCategories.Excluded do
            if addon.Options.db.profile.AdjustableCategories.Excluded[i] then
                local excludedCategory = AddExcludedCategoriesTree(addon.SpecialCategories.Excluded[i], achievement)
                excludedCategory:AddExcludedAchievement(achievement)
            end
        end
        if update ~= false then
            addon.Gui:RefreshView()
        end
    else
        addon.Gui:RefreshView()
    end
end