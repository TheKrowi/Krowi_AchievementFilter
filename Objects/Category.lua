-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.Category = {};
local category = objects.Category;

category.__index = category;
function category:New(name, canMerge)
    local instance = setmetatable({}, category);
    instance.Name = name or "Unknown";
    instance.CanMerge = canMerge;
    instance.Level = 0;
    instance.NotHidden = true;
    return instance;
end

function category:AddCategory(cat)
    self.Children = self.Children or {}; -- By creating the children table here we reduce memory usage because not every category has children
    tinsert(self.Children, cat);
    cat.Parent = self;
    cat.Level = self.Level + 1;
    cat.NotHidden = self.TabName; -- Has parent so initially we are hidden
    return cat;
end

function category:InsertCategory(cat, pos)
	self.Children = self.Children or {}; -- By creating the children table here we reduce memory usage because not every category has children
    tinsert(self.Children, pos, cat);
    cat.Parent = self;
    cat.Level = self.Level + 1;
    cat.NotHidden = self.TabName; -- Has parent so initially we are hidden
    return cat;
end

function category:RemoveCategory(cat)
    if self.Children == nil then
        return;
    end
    for i, _ in next, self.Children do
        if self.Children[i].Name == cat.Name and self.Children[i].Level == cat.Level then
            tremove(self.Children, i);
            return;
        end
    end
end

function category:MergeAchievement(achievement)
    self.MergedAchievements = self.MergedAchievements or {}; -- By creating the achievements table here we reduce memory usage because not every category has achievements
    tinsert(self.MergedAchievements, achievement);
    return achievement;
end

function category:UnMergeAchievements()
    self.MergedAchievements = nil;
end

function category:AddAchievement(achievement)
    self.Achievements = self.Achievements or {}; -- By creating the achievements table here we reduce memory usage because not every category has achievements
    achievement:AddCategory(self);
    tinsert(self.Achievements, achievement);
    return achievement;
end

function category:AddWatchedAchievement(achievement)
    self.Achievements = self.Achievements or {}; -- By creating the achievements table here we reduce memory usage because not every category has achievements
    achievement:AddWatchListCategory(self);
    tinsert(self.Achievements, achievement);
    return achievement;
end

function category:AddExcludedAchievement(achievement)
    self.Achievements = self.Achievements or {}; -- By creating the achievements table here we reduce memory usage because not every category has achievements
    achievement:AddExcludedCategory(self);
    tinsert(self.Achievements, achievement);
    return achievement;
end

function category:RemoveAchievement(achievement)
    if self.Achievements == nil then
        return;
    end
    for i, _ in next, self.Achievements do
        if self.Achievements[i].Id == achievement.Id then
            tremove(self.Achievements, i);
            return;
        end
    end
end

function category:RemoveWatchedAchievement(achievement)
    self:RemoveAchievement(achievement);
end

function category:RemoveExcludedAchievement(achievement)
    self:RemoveAchievement(achievement);
end

function category:GetTree()
	local categories = {};
    tinsert(categories, 1, self);
	local parent = self.Parent;
	while parent ~= nil do
		tinsert(categories, 1, parent);
		parent = parent.Parent;
    end
    return categories;
end

function category:GetPath()
    local categoriesTree = self:GetTree();
    local path = categoriesTree[1].Name;
    for j = 2, #categoriesTree do
        path = path .. " > " .. categoriesTree[j].Name;
    end
    return path;
end

local function GetFilteredAchievementNumbers(achievements, filters, numOfAch, numOfCompAch, numOfNotObtAch) -- , numOfIncompAch
	if not achievements then
		return numOfAch, numOfCompAch, numOfNotObtAch;
	end
	for _, achievement in next, achievements do
		numOfAch, numOfCompAch, numOfNotObtAch = addon.GetAchievementNumbers(filters, achievement, numOfAch, numOfCompAch, numOfNotObtAch); -- , numOfIncompAch
	end
	return numOfAch, numOfCompAch, numOfNotObtAch;
end

function category:GetAchievementNumbers()
    -- numOfIncompAch is not used right now so we can leave this one out untill needed
	local numOfAch, numOfCompAch, numOfNotObtAch = 0, 0, 0; -- , numOfIncompAch = 0

	if not self then
		return numOfAch, numOfCompAch, numOfNotObtAch;
	end

	self:UnMergeAchievements();
	self.Merged = nil;

	local showCollapseIcon = false;
	local children = self.Children;
	if children then
		for _, child in next, children do
			local childNumOfAch, childNumOfCompAch, childNumOfNotObtAch = child:GetAchievementNumbers(); -- , childNumOfIncompAch
			numOfAch = numOfAch + childNumOfAch;
			numOfCompAch = numOfCompAch + childNumOfCompAch;
			numOfNotObtAch = numOfNotObtAch + childNumOfNotObtAch;
			-- numOfIncompAch = numOfIncompAch + childNumOfIncompAch;
			showCollapseIcon = showCollapseIcon or childNumOfAch > 0;
		end
	end

	local filters = addon.Filters;
	local filters2;
	if filters then
		filters2 = filters:GetFilters(self);
	end

	numOfAch, numOfCompAch, numOfNotObtAch = GetFilteredAchievementNumbers(self.Achievements, filters2, numOfAch, numOfCompAch, numOfNotObtAch); -- , numOfIncompAch
	numOfAch, numOfCompAch, numOfNotObtAch = GetFilteredAchievementNumbers(self.MergedAchievements, filters2, numOfAch, numOfCompAch, numOfNotObtAch); -- , numOfIncompAch

	local mergeSmallCategories = false;
	if filters then
		mergeSmallCategories = filters.db.MergeSmallCategories;
	end
	if mergeSmallCategories then
		local mergeSmallCategoriesThreshold = addon.Options.db.Window.MergeSmallCategoriesThreshold;
		if self.Parent and self.CanMerge then
			if self.Achievements then
				if numOfAch < mergeSmallCategoriesThreshold then
					if not self.Merged then
						for _, achievement in next, self.Achievements do
							self.Parent:MergeAchievement(achievement);
						end
						self.Merged = true;
					end
					numOfAch, numOfCompAch, numOfNotObtAch = 0, 0, 0;
				end
			end
		end
	end

	-- Caching the data in the category increases memory usage but improves performance which is more important here
	self.NumOfAch = numOfAch;
	self.NumOfCompAch = numOfCompAch;
	self.NumOfNotObtAch = numOfNotObtAch;
	-- category.NumOfIncompAch = numOfIncompAch;
	self.ShowCollapseIcon = showCollapseIcon;

	return numOfAch, numOfCompAch, numOfNotObtAch; -- , numOfIncompAch
end

function category:GetMergedCategory()
	local cat = self;
	if addon.Filters.db.MergeSmallCategories then
		while cat.Merged do
			cat = cat.Parent;
		end
	end
	return cat;
end