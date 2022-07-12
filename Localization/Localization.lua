-- [[ Namespaces ]] --
local addonName, addon = ...;
addon.Localization = {};
local localization = addon.Localization;

function localization.SetColors(L)
    L["Requires a reload"] = L["Requires a reload"]:SetColorOrange();
    L["Not earned by:"] = L["Not earned by:"]:SetColorRed() .. " %s";
end