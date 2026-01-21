local _, addon = ...;

KrowiAF.Enum = KrowiAF.Enum or {};
KrowiAF.Enum.Faction = EnumUtil.MakeEnum(
    "Alliance",
    "Horde"
);
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
    local moreData; -- temporaryObtainables
    if addon.Util.IsTable(faction) then
        moreData = faction;
        faction = nil;
    end
    if addon.Util.IsTable(otherFactionAchievementId) then
        moreData = otherFactionAchievementId;
        otherFactionAchievementId = nil;
    end
    if addon.Util.IsTable(isPvP) then
        moreData = isPvP;
        isPvP = nil;
    end
    if addon.Util.IsTable(isRealmFirst) then
        moreData = isRealmFirst;
        isRealmFirst = nil;
    end

    local rewardType;
    if moreData and moreData.RewardType then
        rewardType = moreData.RewardType;
        moreData.RewardType = nil;
    end
    if moreData and moreData.IsPvP then
        isPvP = true;
        moreData.IsPvP = nil;
    end
    if moreData and moreData.IsRealmFirst then
        isRealmFirst = true;
        moreData.IsRealmFirst = nil;
    end
    -- if moreData and moreData.Zones then
    --     for _, zones in next, moreData.Zones do
    --         for _, zone in next, zones do
    --             addon.Data.ZonesWithAchievements[zone] = addon.Data.ZonesWithAchievements[zone] or {};
    --             tinsert(addon.Data.ZonesWithAchievements[zone], id);
    --         end
    --     end
    --     moreData.Zones = nil;
    -- end

    return id, faction, otherFactionAchievementId, rewardType, isPvP, isRealmFirst, moreData;
end

function KrowiAF.AddAchievementData(id, faction, otherFactionAchievementId, isPvP, isRealmFirst)
    AddAchievementData(ParseAddAchievementData(id, faction, otherFactionAchievementId, isPvP, isRealmFirst));
end