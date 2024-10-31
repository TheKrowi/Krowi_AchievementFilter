local _, addon = ...;

for k1, v1 in next, KrowiAF.EventData do
    for k2, v2 in next, v1 do
        if addon.Util.IsTable(v2) and not addon.Util.IsFunction(v2[1]) then
            tinsert(KrowiAF.EventData[k1][k2], 1, KrowiAF.AddEventData);
        end
    end
end