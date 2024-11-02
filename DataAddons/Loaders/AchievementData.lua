local _, addon = ...;

for k1, v1 in next, KrowiAF.AchievementData do
    for k2, v2 in next, v1 do
        if addon.Util.IsTable(v2) and not addon.Util.IsFunction(v2[1]) then
            tinsert(KrowiAF.AchievementData[k1][k2], 1, KrowiAF.AddAchievementData);
        end
    end
end