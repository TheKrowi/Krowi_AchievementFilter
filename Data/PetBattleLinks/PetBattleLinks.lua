local _, addon = ...;

addon.Data.PetBattleLinkData = {};

for k1, v1 in next, KrowiAF.PetBattleLinkData do
    for k2, v2 in next, v1 do
        if not addon.Util.IsFunction(v2[1]) then
            tinsert(KrowiAF.PetBattleLinkData[k1][k2], 1, function(achievementIds, text, criteria)
                addon.Data.PetBattleLinkData[achievementIds] = {
                    Text = text,
                    
                }
            end);
        end
    end
end