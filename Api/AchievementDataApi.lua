local _, addon = ...;

KrowiAF.Enum = KrowiAF.Enum or {};
KrowiAF.Enum.Faction = EnumUtil.MakeEnum(
    "Alliance",
    "Horde"
);
KrowiAF.Enum.RewardType = EnumUtil.MakeEnum(
    "NotCategorized",
    "Other",
    "AlliedRace",
    "Garrison",
    "Mount",
    "Pet",
    "RemixPandariaBronze",
    "Tabard",
    "Teleport",
    "Title",
    "Toy",
    "TradersTender",
    "Transmog"
);

KrowiAF.AchievementData = {};

local achievementPatch;
function KrowiAF.SetAchievementPatch(major, minor, patch)
    achievementPatch = KrowiAF.GetBuildVersion(major, minor, patch);
end

local function AddAchievementData(id, faction, otherFactionAchievementId, rewardType, isPvP, isRealmFirst, temporaryObtainables)
    addon.Data.Achievements[id] = addon.Objects.Achievement:New(id, achievementPatch, faction, otherFactionAchievementId, rewardType, isPvP, isRealmFirst);
    tinsert(addon.Data.AchievementIds, id);
    if not temporaryObtainables then
        return;
    end
    for _, temporaryObtainable in next, temporaryObtainables do
        addon.Data.Achievements[id]:SetTemporaryObtainable(unpack(temporaryObtainable));
    end
end

local function ParseAddAchievementData(id, faction, otherFactionAchievementId, isPvP, isRealmFirst)
    local temporaryObtainables;
    if addon.Util.IsTable(faction) then
        temporaryObtainables = faction;
        faction = nil;
    end
    if addon.Util.IsTable(otherFactionAchievementId) then
        temporaryObtainables = otherFactionAchievementId;
        otherFactionAchievementId = nil;
    end
    if addon.Util.IsTable(isPvP) then
        temporaryObtainables = isPvP;
        isPvP = nil;
    end
    if addon.Util.IsTable(isRealmFirst) then
        temporaryObtainables = isRealmFirst;
        isRealmFirst = nil;
    end

    local rewardType;
    if temporaryObtainables and temporaryObtainables.RewardType then
        rewardType = temporaryObtainables.RewardType;
        temporaryObtainables.RewardType = nil;
    end
    if temporaryObtainables and temporaryObtainables.IsPvP then
        isPvP = true;
        temporaryObtainables.IsPvP = nil;
    end
    if temporaryObtainables and temporaryObtainables.IsRealmFirst then
        isRealmFirst = true;
        temporaryObtainables.IsRealmFirst = nil;
    end

    return id, faction, otherFactionAchievementId, rewardType, isPvP, isRealmFirst, temporaryObtainables;
end

function KrowiAF.AddAchievementData(id, faction, otherFactionAchievementId, isPvP, isRealmFirst)
    AddAchievementData(ParseAddAchievementData(id, faction, otherFactionAchievementId, isPvP, isRealmFirst));
end