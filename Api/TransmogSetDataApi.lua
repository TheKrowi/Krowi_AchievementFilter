local _, addon = ...

KrowiAF.TransmogSetData = {}

function KrowiAF.AddTransmogSetData(achievementId, transmogSetIds)
    if not addon.Data.Achievements[achievementId] then
        addon.Data.LoadDiagnostics:Report(addon.Data.LoadDiagnostics.Kind.UnregisteredAchievement, achievementId, "transmog set data")
        return
    end
    addon.Data.Achievements[achievementId].TransmogSetIds = transmogSetIds
end