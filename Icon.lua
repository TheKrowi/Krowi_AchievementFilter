local addonName, addon = ...;

local function SetTooltipContent(tooltip)
    tooltip:AddLine(addon.L["Left click"] .. " " .. addon.L["Icon Left click"]:SetColorAddonBlue());
    tooltip:AddLine(addon.L["Right click"] .. " "  .. addon.L["Icon Right click"]:SetColorAddonBlue());
end

local function OnLeftClick()
    addon.GUI.ToggleAchievementFrame(addonName, addon.L["Expansions"]);
end

local function OnRightClick()
    addon.Options:Open();
end

addon.Icon = addon.Util.Icon:New(addon.Metadata, SetTooltipContent, OnLeftClick, OnRightClick);
local icon = addon.Icon;

KrowiAF_OnAddonCompartmentEnter = function(...) icon:OnAddonCompartmentEnter(...); end
KrowiAF_OnAddonCompartmentLeave = function(...) icon:OnAddonCompartmentLeave(...); end
KrowiAF_OnAddonCompartmentClick = function(...) icon:OnAddonCompartmentClick(...); end