local _, addon = ...;

KrowiAF.AdditionalTooltipData = {};

function KrowiAF.GetGetFactions()
    return addon.Objects.Faction;
end

local function AddTooltipData(objectId, objectType, achievementId, criteriaIndex, faction)
    addon.Data.TooltipData[objectId] = addon.Data.TooltipData[objectId] or {};
    tinsert(addon.Data.TooltipData[objectId], {
        ObjectType = objectType,
        AchievementId = achievementId,
        CriteriaIndex = criteriaIndex,
        Faction = faction
    });
end

function KrowiAF.AddTooltipData(achievementId, criteriaIndex, objectType, objectIds, faction)
    if type(objectIds) ~= "table" then
        objectIds = {objectIds};
    end

    for _, objectId in next, objectIds do
        AddTooltipData(objectId, objectType, achievementId, criteriaIndex, faction);
    end
end

local function AddTooltipDataTable(achievementId, properties, criteria)
    for _, criterium in next, criteria do
        KrowiAF.AddTooltipData(achievementId, criterium[1], criterium[3] or properties.ObjectType, criterium[2], criterium[4] or properties.Faction);
    end
end

function KrowiAF.AddTooltipDataTable(achievementIds, properties, criteria)
    if criteria == nil then
        criteria = properties;
        properties = nil;
    end

    if type(properties) ~= "table" then
        properties = {
            ObjectType = properties
        };
    end

    if type(achievementIds) ~= "table" then
        achievementIds = {achievementIds};
    end

    if type(achievementIds) == "table" then
        for _, achievementId in next, achievementIds do
            AddTooltipDataTable(achievementId, properties, criteria);
        end
    end
end