local _, addon = ...;
local data = addon.Data;
data.ExportedTooltipData = {};
local exportedTooltipData = data.ExportedTooltipData;

function exportedTooltipData.Load(d)
    for i, _ in next, d do
        d[i] = nil;
    end
end