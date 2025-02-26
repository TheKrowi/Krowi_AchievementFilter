local _, addon = ...;

-- for k1, v1 in next, KrowiAF.BuildVersionData do
--     for k2, v2 in next, v1 do
--         if addon.Util.IsTable(v2) and not addon.Util.IsFunction(v2[1]) then
--             tinsert(KrowiAF.BuildVersionData[k1][k2], 1, KrowiAF.AddBuildVersionData);
--         end
--     end
-- end