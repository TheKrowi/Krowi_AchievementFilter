local addonName, addon = ...;
local icon = addon.Icon;

function icon.SetMoreTooltipContent(tooltip)
    tooltip:AddLine(addon.L["Left click"] .. " " .. addon.L["Icon Left click"]:SetColorAddonBlue());
    tooltip:AddLine(addon.L["Right click"] .. " "  .. addon.L["Icon Right click"]:SetColorAddonBlue());
end

function icon.OnLeftClick()
    addon.GUI.ToggleAchievementFrame(addonName, addon.L["Expansions"]);
end

function icon.OnRightClick()
    addon.Options:Open();
end