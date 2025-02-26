local _, addon = ...;

for k1, v1 in next, KrowiAF.TransmogSetData do
    for k2, v2 in next, v1 do
        if addon.Util.IsTable(v2) and not addon.Util.IsFunction(v2[1]) then
            tinsert(KrowiAF.TransmogSetData[k1][k2], 1, KrowiAF.AddTransmogSetData);
        end
    end
end