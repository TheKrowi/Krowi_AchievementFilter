local _, addon = ...;

KrowiAF.TooltipData = {};

local function AddTooltipDatum(objectId, objectType, achievementId, criteriaIndex, faction)
    addon.Data.TooltipData[objectId] = addon.Data.TooltipData[objectId] or {};
    tinsert(addon.Data.TooltipData[objectId], {
        ObjectType = objectType,
        AchievementId = achievementId,
        CriteriaIndex = criteriaIndex,
        Faction = faction
    });
end

function KrowiAF.AddTooltipDatum(achievementId, criteriaIndex, objectType, objectIds, faction)
    if not addon.Util.IsTable(objectIds) then
        objectIds = {objectIds};
    end

    for _, objectId in next, objectIds do
        AddTooltipDatum(objectId, objectType, achievementId, criteriaIndex, faction);
    end
end

local function AddTooltipData(achievementId, properties, criteria)
    -- if not addon.Util.IsTable(criteria) then
    --     criteria = {{0, criteria}};
    -- end
    for _, criterium in next, criteria do
        KrowiAF.AddTooltipDatum(achievementId, criterium[1], criterium[3] or properties.ObjectType, criterium[2], criterium[4] or properties.Faction);
    end
end

function KrowiAF.AddTooltipData(achievementIds, properties, criteria)
    if criteria == nil then
        criteria = properties;
        properties = nil;
    end

    if not addon.Util.IsTable(properties) then
        properties = {
            ObjectType = properties
        };
    end

    if not addon.Util.IsTable(achievementIds) then
        achievementIds = {achievementIds};
    end

    if addon.Util.IsTable(achievementIds) then
        for _, achievementId in next, achievementIds do
            AddTooltipData(achievementId, properties, criteria);
        end
    end
end