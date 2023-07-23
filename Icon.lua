-- [[ Namespaces ]] --
local addonName, addon = ...;
local diagnostics = addon.Diagnostics;

-- Using LibDBIcon instead of creating the icon from scratch is the automatic integration with other addons that also use LibDataBroker
addon.Icon = LibStub("LibDBIcon-1.0"); -- Global icon object
local icon = addon.Icon; -- Local icon object

local function CreateIcon()
    icon.AchievementFilterLDB = LibStub("LibDataBroker-1.1"):NewDataObject("Krowi_AchievementFilterLDB", {
        type = "launcher",
        label = addon.Metadata.Title,
        icon = "Interface/Icons/achievement_dungeon_heroic_gloryoftheraider",
        OnClick = function(self, button)
            -- diagnostics.Debug("Icon clicked with " .. button);
            if button == "LeftButton" then
                diagnostics.Trace("icon.AchievementFilterLDB.OnClick with LeftButton");
                addon.GUI.ToggleAchievementFrame(addonName, addon.L["Expansions"]);
            elseif button == "RightButton" then
                diagnostics.Trace("icon.AchievementFilterLDB.OnClick with RightButton");
                addon.Options.Open();
            end
        end,
        OnTooltipShow = function(tt)
            tt:ClearLines();
            tt:AddDoubleLine(addon.Metadata.Title, addon.Metadata.BuildVersion);
            -- tt:AddLine(" "); -- Empty line
		    GameTooltip_AddBlankLineToTooltip(tt);
            tt:AddLine(addon.L["Left click"] .. " " .. addon.L["Icon Left click"]:SetColorAddonBlue());
            tt:AddLine(addon.L["Right click"] .. " "  .. addon.L["Icon Right click"]:SetColorAddonBlue());
        end,
    });
end

-- Load the icon
function icon.Load()
    CreateIcon();

    local db = addon.Options.db;
    db.Minimap.hide = not db.ShowMinimapIcon;
    icon:Register("Krowi_AchievementFilterLDB", icon.AchievementFilterLDB, db.Minimap);
    diagnostics.Debug("Icon loaded");
end