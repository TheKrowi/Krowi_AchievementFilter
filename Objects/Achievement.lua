-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.Achievement = {};
local achievement = objects.Achievement;

achievement.__index = achievement;
function achievement:New(id, buildVersion, faction, otherFactionAchievementId, rewardType, isPvP, isRealmFirst)
    local instance = setmetatable({}, achievement);
    instance.Id = id or 0;
    instance.BuildVersion = buildVersion;
    -- buildVersion:SetInUse();
    instance.Faction = faction;
    instance.OtherFactionAchievementId = otherFactionAchievementId;
    instance.RewardType = rewardType;
    instance.IsPvP = isPvP;
    instance.IsRealmFirst = isRealmFirst;
    return instance;
end

function achievement:GetMergedCategory()
    if not self.Category then
        return;
    end
    local categories = self.Category:GetTree(); -- Issue #43: Fix
    for _, category in next, categories do
        if category.MergedAchievements ~= nil then
            for _, ach in next, category.MergedAchievements do
                if ach.Id == self.Id then
                    return category;
                end
            end
        end
        if category.Achievements ~= nil then
            for _, ach in next, category.Achievements do
                if ach.Id == self.Id then
                    return category;
                end
            end
        end
    end
end

function achievement:GetRequiredForIds()
    local criteriaCache = {};
    addon.BuildCacheAsync(function(_criteriaCache)
        criteriaCache = _criteriaCache;
    end);
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
    if self.Id == 15077 or self.Id == 15078 then -- Issue #49 : Fix
        return self.PartOfAChainIDs;
    end
	if not addon.GetNextAchievement(self) and not addon.GetPreviousAchievement(self.Id) then
		return self.PartOfAChainIDs;
	end
    local id = addon.GetFirstAchievementId(self.Id);
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
    self.IsExcluded = nil;
    if KrowiAF_SavedData.ExcludedAchievements == nil then
        return;
    end
    KrowiAF_SavedData.ExcludedAchievements[self.Id] = nil;
end

function achievement:Exclude()
    self.IsExcluded = true;
    KrowiAF_SavedData.ExcludedAchievements = KrowiAF_SavedData.ExcludedAchievements or {};
    KrowiAF_SavedData.ExcludedAchievements[self.Id] = true;
end

function achievement:ClearWatch()
    addon.Data.SavedData.AchievementData.SetWatched(self, false);
end

function achievement:Watch()
    addon.Data.SavedData.AchievementData.SetWatched(self, true);
end

function achievement:AddPrevious(ach, addBack)
    self.PreviousAchievements = self.PreviousAchievements or {};
    self.PreviousAchievements[ach.Id] = self.PreviousAchievements[ach.Id] or ach;
    if addBack then
        ach:AddNext(self);
    end
end

function achievement:AddNext(ach, addBack)
    self.NextAchievements = self.NextAchievements or {};
    self.NumNextAchievements = self.NumNextAchievements ~= nil and self.NumNextAchievements + 1 or 1;
    self.NextAchievements[ach.Id] = self.NextAchievements[ach.Id] or ach;
    if addBack then
        ach:AddPrevious(self);
    end
end

function achievement:AddTransmogSet(transmogSet)
    self.TransmogSets = self.TransmogSets or {};
    tinsert(self.TransmogSets, transmogSet);
    return transmogSet;
end

function achievement:GetObtainableState()
    return addon.Data.TemporaryObtainable:GetObtainableState(self);
end

local function GetStartValue(startFunction, startValue)
    if startFunction == "Version" and addon.Util.IsTable(startValue) then
        return KrowiAF.GetBuildVersionId(unpack(startValue));
    end
    return startValue;
end

function achievement:SetTemporaryObtainableStart(record, startInclusion, startFunction, startValue)
    record.Start = {
        Inclusion = startInclusion,
        Function = startFunction,
        Value = startValue
    };
end

function achievement:SetTemporaryObtainableEnd(record, endInclusion, endFunction, endValue)
    record.End = {
        Inclusion = endInclusion,
        Function = endFunction,
        Value = endValue
    };
end

function achievement:SetTemporaryObtainableNeverOnce(startFunction)
    local record = {};
    self:SetTemporaryObtainableStart(record, nil, startFunction, nil);
    tinsert(self.TemporaryObtainable, record);
end

function achievement:SetTemporaryObtainableDuring(startFunction, startValue, isObtainable)
    local record = {};
    self:SetTemporaryObtainableStart(record, "From", startFunction, GetStartValue(startFunction, startValue));
    self:SetTemporaryObtainableEnd(record, "Until", startFunction, GetStartValue(startFunction, startValue));
    if isObtainable == false then
        record.IsNotObtainable = true;
    end
    tinsert(self.TemporaryObtainable, record);
end

function achievement:SetTemporaryObtainableFromVersionToEnd(startInclusion, startFunction, startValue)
    local record = {};
    self:SetTemporaryObtainableStart(record, "From", "Version", self.BuildVersion.Id);
    self:SetTemporaryObtainableEnd(record, startInclusion, startFunction, GetStartValue(startFunction, startValue));
    tinsert(self.TemporaryObtainable, record);
end

function achievement:SetTemporaryObtainableStartOnly(startInclusion, startFunction, startValue)
    local record = {};
    self:SetTemporaryObtainableStart(record, startInclusion, startFunction, GetStartValue(startFunction, startValue));
    self:SetTemporaryObtainableEnd(record, "Until", "Date", GetStartValue("Date", {2100, 1, 1}));
    tinsert(self.TemporaryObtainable, record);
end

function achievement:SetTemporaryObtainableFull(startInclusion, startFunction, startValue, endInclusion, endFunction, endValue)
    local record = {};
    self:SetTemporaryObtainableStart(record, startInclusion, startFunction, GetStartValue(startFunction, startValue));
    self:SetTemporaryObtainableEnd(record, endInclusion, endFunction, GetStartValue(endFunction, endValue));
    tinsert(self.TemporaryObtainable, record);
end

function achievement:SetTemporaryObtainable(startInclusion, startFunction, startValue, endInclusion, endFunction, endValue)
    self.TemporaryObtainable = self.TemporaryObtainable or {};

    if not startInclusion then
        tinsert(self.TemporaryObtainable, {});
        return;
    end

    -- Case 1: Never or Once - [startInclusion]
    if startInclusion == "Never" or startInclusion == "Once" then
        self:SetTemporaryObtainableNeverOnce(startInclusion);
        return;
    end

    -- Case 2: During - [startInclusion, startFunction]
    if startInclusion and startFunction and not startValue then
        self:SetTemporaryObtainableDuring(startInclusion, startFunction, startValue);
        return;
    end

    -- Case 3: Only handle "Before" cutoff (temporary until a future version) - [Before, startFunction, startValue]
    if startInclusion == "Before" and startFunction and startValue and not endInclusion then
        self:SetTemporaryObtainableFromVersionToEnd(startInclusion, startFunction, startValue);
        return;
    end

    -- Case 4: Open-ended start only - [startInclusion, startFunction, startValue]
    if startInclusion and startFunction and startValue and not endInclusion then
        self:SetTemporaryObtainableStartOnly(startInclusion, startFunction, startValue);
        return;
    end

    -- Case 5: Everything defined - [startInclusion, startFunction, startValue, endInclusion, endFunction, endValue]
    if startInclusion and startFunction and startValue and endInclusion and endFunction and endValue then
        self:SetTemporaryObtainableFull(startInclusion, startFunction, startValue, endInclusion, endFunction, endValue);
        return;
    end
end

function achievement:SetCustomCriteria(customCriteria)
    self.GetCustomCriteria = function(criteriaIndex)
        local numCriteria = customCriteria.NumCriteria or KrowiAF_origGetAchievementNumCriteria(self.Id);
        if criteriaIndex == nil then
            return numCriteria;
        elseif criteriaIndex >= 1 and criteriaIndex <= numCriteria then
            if customCriteria.ReturnFunc then
                return customCriteria.ReturnFunc(criteriaIndex);
            end

            local quantity = customCriteria.QuantityFunc();
            local reqQuantity = customCriteria.ReqQuantity;
            return
            "", -- criteriaString
            nil, -- criteriaType
            customCriteria.CompletedFunc and customCriteria.CompletedFunc() or quantity >= reqQuantity, -- completed
            quantity, -- quantity
            reqQuantity, -- reqQuantity
            nil, -- charName
            0x00000001, -- flags
            0, -- assetId
            quantity .. " / " .. reqQuantity, -- quantityString
            0, -- criteriaId
            true, -- eligible
            nil, -- duration
            nil; -- elapsed
        end
    end;
end