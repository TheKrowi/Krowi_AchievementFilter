local _, addon = ...;
addon.Localization = {};
local localization = addon.Localization;

function localization.SetColors(L)
    L["Not earned by:"] = L["Not earned by:"]:SetColorRed() .. " %s";
end