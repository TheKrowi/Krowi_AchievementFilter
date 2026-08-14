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
    assert(addon.Data.Achievements[id] == nil, "Achievement " .. id .. " is already registered. Check for duplicate entries or AutoFactionSplit conflicts.")
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
    if extras.HousingDecorId then
        if addon.Util.IsTable(extras.HousingDecorId) then
            for _, previewId in next, extras.HousingDecorId do
                KrowiAF.AddRewardPreviewData(id, KrowiAF.Enum.RewardPreviewType.HousingDecorId, previewId)
            end
        else
            KrowiAF.AddRewardPreviewData(id, KrowiAF.Enum.RewardPreviewType.HousingDecorId, extras.HousingDecorId)
        end
    end
    if extras.MountId then
        if addon.Util.IsTable(extras.MountId) then
            for _, previewId in next, extras.MountId do
                KrowiAF.AddRewardPreviewData(id, KrowiAF.Enum.RewardPreviewType.MountId, previewId)
            end
        else
            KrowiAF.AddRewardPreviewData(id, KrowiAF.Enum.RewardPreviewType.MountId, extras.MountId)
        end
    end
    if extras.PetSpeciesId then
        if addon.Util.IsTable(extras.PetSpeciesId) then
            for _, previewId in next, extras.PetSpeciesId do
                KrowiAF.AddRewardPreviewData(id, KrowiAF.Enum.RewardPreviewType.PetSpeciesId, previewId)
            end
        else
            KrowiAF.AddRewardPreviewData(id, KrowiAF.Enum.RewardPreviewType.PetSpeciesId, extras.PetSpeciesId)
        end
    end
    if extras.CreatureDisplayId then
        for _, preview in next, extras.CreatureDisplayId do
            KrowiAF.AddRewardPreviewData(id, KrowiAF.Enum.RewardPreviewType.CreatureDisplayId, preview.Id, nil, preview.SpellId)
        end
    end
    if extras.AutoPair and extras.AltId and extras.Faction then
        local mirrorFaction = extras.Faction == KrowiAF.Enum.Faction.Alliance
            and KrowiAF.Enum.Faction.Horde
            or KrowiAF.Enum.Faction.Alliance
        AddAchievementData(extras.AltId, mirrorFaction, id, extras.RewardType, extras.IsPvP, extras.IsRealmFirst, temporaryObtainables)
    end
end