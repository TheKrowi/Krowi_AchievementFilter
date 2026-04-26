local _, addon = ...

KrowiAF.Enum = KrowiAF.Enum or {}
KrowiAF.Enum.Faction = EnumUtil.MakeEnum(
    "Alliance",
    "Horde"
)
-- EnumUtil.GenerateNameTranslation
KrowiAF.Enum.RewardType = EnumUtil.MakeEnum(
    "NotCategorized",
    "Other",
    "AlliedRace",
    "Garrison",
    "Mount",
    "Pet",
    "RemixBronze",
    "Tabard",
    "Teleport",
    "Title",
    "Toy",
    "TradersTender",
    "Transmog",
    "WarbandCampsite",
    "RemixInfiniteKnowledge",
    "HousingDecor",
    "KeystoneResilience"
)

KrowiAF.AchievementData = {}

local achievementPatch
function KrowiAF.SetAchievementPatch(major, minor, patch)
    achievementPatch = KrowiAF.GetBuildVersion(major, minor, patch)
end

local function AddAchievementData(id, faction, otherFactionAchievementId, rewardType, isPvP, isRealmFirst, temporaryObtainables)
    addon.Data.Achievements[id] = addon.Objects.Achievement:New(id, achievementPatch, faction, otherFactionAchievementId, rewardType, isPvP, isRealmFirst)
    tinsert(addon.Data.AchievementIds, id)
    if not temporaryObtainables then
        return
    end
    for _, temporaryObtainable in next, temporaryObtainables do
        addon.Data.Achievements[id]:SetTemporaryObtainable(unpack(temporaryObtainable))
    end
end

function KrowiAF.AddAchievementData(id, extras)
    if not extras then
        AddAchievementData(id)
        return
    end
    local temporaryObtainables
    if #extras > 0 then
        temporaryObtainables = {}
        for i = 1, #extras do
            tinsert(temporaryObtainables, extras[i])
        end
    end
    AddAchievementData(id, extras.Faction, extras.AltId, extras.RewardType, extras.IsPvP, extras.IsRealmFirst, temporaryObtainables)
    if extras.AutoPair and extras.AltId and extras.Faction then
        local mirrorFaction = extras.Faction == KrowiAF.Enum.Faction.Alliance
            and KrowiAF.Enum.Faction.Horde
            or KrowiAF.Enum.Faction.Alliance
        AddAchievementData(extras.AltId, mirrorFaction, id, extras.RewardType, extras.IsPvP, extras.IsRealmFirst, temporaryObtainables)
    end
end