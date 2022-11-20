-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.Achievement = {};
local achievement = objects.Achievement;

achievement.__index = achievement;
function achievement:New(id, points, faction, otherFactionAchievementId, isRealmFirst, hasWowheadLink, customObjectives)
    local instance = setmetatable({}, achievement);

    instance.Id = id or 0;
    instance.ID = instance.Id;
    instance.Points = points or 0;
    instance.Faction = faction;
    instance.OtherFactionAchievementId = otherFactionAchievementId;
    instance.IsRealmFirst = isRealmFirst;
    instance.HasNoWowheadLink = hasWowheadLink == false and true or nil; -- We only want to set it if it has no Wowhead link, otherwise nil, by inverting this we reduce memory usage because most have a Wowhead link
    instance.CustomObjectives = customObjectives;
    return instance;
end

function achievement:GetMergedCategory()
    local categories = self.Category:GetTree(); -- Issue #43: Fix
    for _, category in next, categories do
        if category.MergedAchievements ~= nil then
            for _, ach in next, category.MergedAchievements do
                if ach.ID == self.ID then
                    return category;
                end
            end
        end
        if category.Achievements ~= nil then
            for _, ach in next, category.Achievements do
                if ach.ID == self.ID then
                    return category;
                end
            end
        end
    end
    error("The achievement with ID " .. self.ID .. " has no category."); -- Should in theory never happen, means there is a problem with the database
end

function achievement:GetRequiredForIds()
    local criteriaCache = addon.BuildCache();
    if self.RequiredForIds then -- Return cached list
        return self.RequiredForIds;
    end
    self.RequiredForIds = {};
	for _, criteria in next, criteriaCache do
		if criteria.AchievementId == self.Id then
			tinsert(self.RequiredForIds, criteria.RequiredForId);
		end
	end
    return self.RequiredForIds;
end

function achievement:GetPartOfAChainIDs(validate, filters)
    if self.PartOfAChainIDs then -- Return cached list
        return self.PartOfAChainIDs;
    end
    self.PartOfAChainIDs = {};
    if self.ID == 15077 or self.ID == 15078 then -- Issue #49 : Fix
        return self.PartOfAChainIDs;
    end
	if not addon.GetNextAchievement(self) and not GetPreviousAchievement(self.ID) then
		return self.PartOfAChainIDs;
	end
    local id = addon.GetFirstAchievementId(self.ID);
    local ach = addon.Data.Achievements[id];
	while ach do
        if validate and filters then
            if validate(filters, ach, true) > 0 then
                tinsert(self.PartOfAChainIDs, id);
            end
        else
            tinsert(self.PartOfAChainIDs, id);
        end
		ach = addon.GetNextAchievement(ach);
	end
    return self.PartOfAChainIDs;
end

function achievement:AddCategory(category)
    if self.Category == nil then
        self.Category = category;
    else
        self.MoreCategories = self.MoreCategories or {};
        tinsert(self.MoreCategories, category);
    end
end

function achievement:AddSpecialCategory(categories, category)
    categories = categories or {};
    tinsert(categories, category);
end

function achievement:AddWatchListCategory(category)
    self.WatchListCategories = self.WatchListCategories or {};
    self:AddSpecialCategory(self.WatchListCategories, category);
end

function achievement:AddExcludedCategory(category)
    self.ExcludedCategories = self.ExcludedCategories or {};
    self:AddSpecialCategory(self.ExcludedCategories, category);
end

function achievement:Include()
    self.Excluded = nil;
    if SavedData.ExcludedAchievements == nil then
        return;
    end
    SavedData.ExcludedAchievements[self.ID] = nil;
end

function achievement:Exclude()
    self.Excluded = true;
    SavedData.ExcludedAchievements = SavedData.ExcludedAchievements or {};
    SavedData.ExcludedAchievements[self.ID] = true;
end

function achievement:ClearWatch()
    self.IsWatched = nil;
    if SavedData.WatchedAchievements == nil then
        return;
    end
    SavedData.WatchedAchievements[self.ID] = nil;
end

function achievement:Watch()
    self.IsWatched = true;
    SavedData.WatchedAchievements = SavedData.WatchedAchievements or {};
    SavedData.WatchedAchievements[self.ID] = true;
end

function achievement:AddPrevious(ach, addBack)
    self.PreviousAchievements = self.PreviousAchievements or {};
    self.PreviousAchievements[ach.ID] = self.PreviousAchievements[ach.ID] or ach;
    if addBack then
        ach:AddNext(self);
    end
end

function achievement:AddNext(ach, addBack)
    self.NextAchievements = self.NextAchievements or {};
    self.NumNextAchievements = self.NumNextAchievements ~= nil and self.NumNextAchievements + 1 or 1;
    self.NextAchievements[ach.ID] = self.NextAchievements[ach.ID] or ach;
    if addBack then
        ach:AddPrevious(self);
    end
end

function achievement:AddTransmogSet(transmogSet)
    self.CustomObjectives = addon.Data.CustomObjectives.AddTransmogCriteriaAsync;
    self.TransmogSets = self.TransmogSets or {};
    tinsert(self.TransmogSets, transmogSet);
    return transmogSet;
end

function achievement:SetTemporaryObtainable(startInclusion, startFunction, startValue, endInclusion, endFunction, endValue)
    self.TemporaryObtainable = {};
    if startInclusion == "Never" then
        self.TemporaryObtainable.Start = {
            Function = startInclusion
        };
        self.TemporaryObtainable.End = {
            Function = startInclusion
        };
    end
    if startInclusion == "Once" then
        self.TemporaryObtainable.Start = {
            Function = startInclusion
        };
        self.TemporaryObtainable.End = {
            Function = startInclusion
        };
    end
    if startInclusion ~= nil and startFunction ~= nil and startValue ~= nil then
        self.TemporaryObtainable.Start = {
            Inclusion = startInclusion,
            Function = startFunction,
            Value = startValue
        };
    end
    if endInclusion ~= nil and endFunction ~= nil and endValue ~= nil then
        self.TemporaryObtainable.End = {
            Inclusion = endInclusion,
            Function = endFunction,
            Value = endValue
        };
    end
    local ach = self; -- Easier to debug
    self.TemporaryObtainable.Obtainable = function() return addon.Data.TemporaryObtainable:GetObtainableState(ach); end;
end