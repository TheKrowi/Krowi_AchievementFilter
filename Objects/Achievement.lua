-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.Achievement = {};
local achievement = objects.Achievement;

achievement.__index = achievement;
function achievement:New(id, points, faction, otherFactionAchievementID, obtainable, hasWowheadLink, customObjectives)
    local self = {};
    setmetatable(self, achievement);

    self.ID = id or 0;
    self.Points = points or 0;
    self.Faction = faction;
    self.OtherFactionAchievementID = otherFactionAchievementID;
    self.NotObtainable = obtainable == false and true or nil; -- We only want to set it if it's not obtainable, otherwise nil, by inverting this we reduce memory usage because most are obtainable
    self.HasNoWowheadLink = hasWowheadLink == false and true or nil; -- We only want to set it if it has no Wowhead link, otherwise nil, by inverting this we reduce memory usage because most have a Wowhead link
    self.CustomObjectives = customObjectives;
    return self;
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

function achievement:GetRequiredForIDs(validate, filters)
    local criteriaCache = addon.BuildCache();
    if self.RequiredForIDs then -- Return cached list
        return self.RequiredForIDs;
    end
    self.RequiredForIDs = {};
	for _, criteria in next, criteriaCache do
		if criteria.AchievementID == self.ID then
            if validate and filters and addon.Data.Achievements[criteria.RequiredForID] then
                if validate(filters, addon.Data.Achievements[criteria.RequiredForID], true) > 0 then
			        tinsert(self.RequiredForIDs, criteria.RequiredForID);
                end
            else
			    tinsert(self.RequiredForIDs, criteria.RequiredForID);
            end
		end
	end
    return self.RequiredForIDs;
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
    local id = addon.GetFirstAchievementID(self.ID);
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

function achievement:ClearFocus()
    self.Focused = nil;
    if SavedData.FocusedAchievements == nil then
        return;
    end
    SavedData.FocusedAchievements[self.ID] = nil;
end

function achievement:Focus()
    self.Focused = true;
    SavedData.FocusedAchievements = SavedData.FocusedAchievements or {};
    SavedData.FocusedAchievements[self.ID] = true;
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