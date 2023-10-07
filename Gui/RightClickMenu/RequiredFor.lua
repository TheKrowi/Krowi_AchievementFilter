-- [[ Namespaces ]] --
local _, addon = ...;
local section = {};

local requiredForIds;
function section.CheckAdd(achievement)
    requiredForIds = achievement:GetRequiredForIds();
    return #requiredForIds ~= 0;
end

function section.Add(menu, achievement)
	menu:AddFull({Text = addon.L["Required for"], IsTitle = true});
	for _, id in next, requiredForIds do
		if id ~= achievement.Id then
			addon.GUI.RightClickMenu.AchievementMenu.AddGoToAchievementLine(menu, id);
		end
	end
end

local numSections = #addon.GUI.RightClickMenu.AchievementMenu.Sections;
tinsert(addon.GUI.RightClickMenu.AchievementMenu.Sections[numSections].Sections, section);