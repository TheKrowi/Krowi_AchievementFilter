local _, addon = ...;

for k1, v1 in next, KrowiAF.TooltipData do
    for k2, v2 in next, v1 do
        if addon.Util.IsTable(v2) and not addon.Util.IsFunction(v2[1]) then
            tinsert(KrowiAF.TooltipData[k1][k2], 1, KrowiAF.AddTooltipData);
        end
    end
end