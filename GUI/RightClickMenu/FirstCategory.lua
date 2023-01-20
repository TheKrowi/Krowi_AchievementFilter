-- [[ Namespaces ]] --
local _, addon = ...;
local section = {};

function section.CheckAdd(achievement)
    local selectedCategory = addon.GUI.SelectedTab.SelectedCategory;
    return selectedCategory.IsCurrentZone or selectedCategory.IsSelectedZone;
end

function section.Add(menu, achievement)
	menu:AddFull({Text = achievement.Category:GetPath(), IsTitle = true});
	addon.GUI.RightClickMenu.AchievementMenu.AddGoToAchievementLine(menu, achievement.Id);
end

local numSections = #addon.GUI.RightClickMenu.AchievementMenu.Sections;
tinsert(addon.GUI.RightClickMenu.AchievementMenu.Sections[numSections].Sections, section);