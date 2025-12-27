local _, addon = ...;

KrowiAF.ZoneData = {};

local function AddAchievements(zoneAchievements, achievementIds)
    if not achievementIds then
        return;
    end

    for _, achievementId in next, achievementIds do
        if addon.Util.IsTable(achievementId) then
            AddAchievements(zoneAchievements, achievementId);
        else
            tinsert(zoneAchievements, addon.Data.Achievements[achievementId]);
        end
    end
end

function KrowiAF.AddZoneData(zoneIds, achievementIds, achievement10Ids, achievement25Ids)
    if not addon.Util.IsTable(zoneIds) then
        zoneIds = {zoneIds};
    end
    if achievementIds and not addon.Util.IsTable(achievementIds) then
        achievementIds = {achievementIds};
    end
    if achievement10Ids and not addon.Util.IsTable(achievement10Ids) then
        achievement10Ids = {achievement10Ids};
    end
    if achievement25Ids and not addon.Util.IsTable(achievement25Ids) then
        achievement25Ids = {achievement25Ids};
    end

    for _, zoneId in next, zoneIds do
        addon.Data.Maps[zoneId] = addon.Data.Maps[zoneId] or {};
        local zone = addon.Data.Maps[zoneId];
        addon.Data.Maps[zoneId].Achievements = addon.Data.Maps[zoneId].Achievements or ((achievementIds and #achievementIds > 0) and {} or nil);
        addon.Data.Maps[zoneId].Achievements10 = addon.Data.Maps[zoneId].Achievements10 or ((achievement10Ids and #achievement10Ids > 0) and {} or nil);
        addon.Data.Maps[zoneId].Achievements25 = addon.Data.Maps[zoneId].Achievements25 or ((achievement25Ids and #achievement25Ids > 0) and {} or nil);

        AddAchievements(zone.Achievements, achievementIds);
        AddAchievements(zone.Achievements10, achievement10Ids);
        AddAchievements(zone.Achievements25, achievement25Ids);
    end
end