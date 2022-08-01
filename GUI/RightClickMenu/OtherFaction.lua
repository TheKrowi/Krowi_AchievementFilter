-- [[ Namespaces ]] --
local _, addon = ...;
local section = {};

function section.CheckAdd(achievement)
    return achievement.OtherFactionAchievementId;
end

function section.Add(menu, achievement)
	local faction = addon.L["Neutral"];
	if addon.Faction.IsAlliance then
		faction = addon.L["Horde"];
	elseif addon.Faction.IsHorde then
		faction = addon.L["Alliance"];
	end
	menu:AddFull({Text = addon.L["Other faction"] .. " (" .. faction .. ")", IsTitle = true});
	addon.GUI.RightClickMenu.AchievementMenu.AddGoToAchievementLine(menu, achievement.OtherFactionAchievementId);
end

local numSections = #addon.GUI.RightClickMenu.AchievementMenu.Sections;
tinsert(addon.GUI.RightClickMenu.AchievementMenu.Sections[numSections].Sections, section);