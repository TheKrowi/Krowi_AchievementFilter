local _, addon = ...;

KrowiAF.TransmogSetData = {};

function KrowiAF.AddTransmogSetData(achievementId, transmogSetIds)
    if not addon.Data.Achievements[achievementId] then
        return;
    end
    addon.Data.Achievements[achievementId].TransmogSetIds = transmogSetIds;
end