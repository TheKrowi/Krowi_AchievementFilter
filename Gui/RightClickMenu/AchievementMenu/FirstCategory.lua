local _, addon = ...;
local section = {};

function section.CheckAdd(achievement)
    local selectedCategory = addon.Gui.SelectedTab and addon.Gui.SelectedTab.SelectedCategory or nil;
    return selectedCategory and (selectedCategory.IsCurrentZone or selectedCategory.IsSelectedZone);
end

function section.Add(menu, achievement)
	menu:AddFull({Text = achievement.Category:GetPath(), IsTitle = true});
	addon.Gui.RightClickMenu.AchievementMenu.AddGoToAchievementLine(menu, achievement.Id);
end

tinsert(addon.Gui.RightClickMenu.AchievementMenu:GetLastSection().Sections, section);