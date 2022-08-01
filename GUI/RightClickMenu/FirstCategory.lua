-- [[ Namespaces ]] --
local _, addon = ...;
local section = {};

function section.CheckAdd(achievement)
    local selectedCategory = addon.GUI.SelectedTab.SelectedCategory;
    return selectedCategory == addon.Data.CurrentZoneCategory or selectedCategory == addon.Data.SelectedZoneCategory;
end

function section.Add(menu, achievement)
	menu:AddFull({Text = achievement.Category:GetPath(), IsTitle = true});
	addon.GUI.RightClickMenu.AchievementMenu.AddGoToAchievementLine(menu, achievement.ID);
end

local numSections = #addon.GUI.RightClickMenu.AchievementMenu.Sections;
tinsert(addon.GUI.RightClickMenu.AchievementMenu.Sections[numSections].Sections, section);