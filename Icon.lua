local _, addon = ...;
local icon = addon.Icon;

function icon.SetMoreTooltipContent(tooltip)
    tooltip:AddLine(addon.L["Left click"] .. " " .. addon.L["Icon Left click"]:SetColorAddonBlue());
    tooltip:AddLine(addon.L["Right click"] .. " "  .. addon.L["Icon Right click"]:SetColorAddonBlue());
end

function icon.OnLeftClick()
    local tab = KrowiAF_SavedData.Tabs[addon.Options.db.profile.MicroButtonTab];
    addon.GUI.ToggleAchievementFrame(tab.AddonName, tab.Name);
end

function icon.OnRightClick()
    addon.Options:Open();
end