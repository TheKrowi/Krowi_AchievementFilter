local _, addon = ...;

KrowiAF.CustomCriteriaData = {};

function KrowiAF.AddCustomCriteriaData(achievementId, customCriteria)
    if not addon.Data.Achievements[achievementId] then
        return;
    end

    addon.Data.Achievements[achievementId]:SetCustomCriteria(customCriteria);
end