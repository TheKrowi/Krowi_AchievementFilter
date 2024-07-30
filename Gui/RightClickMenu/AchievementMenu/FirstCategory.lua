local _, addon = ...;
local section = {};
tinsert(addon.Gui.RightClickMenu.AchievementMenu:GetLastSection().Sections, section);

function section:CheckAdd()
    local selectedCategory = addon.Gui.SelectedTab and addon.Gui.SelectedTab.SelectedCategory or nil;
    return selectedCategory and (selectedCategory.IsCurrentZone or selectedCategory.IsSelectedZone);
end

function section:Add(menu, achievement)
	addon.MenuUtil:CreateTitle(menu, achievement.Category:GetPath());
	addon.Gui.RightClickMenu.AchievementMenu:AddGoToAchievementLine(menu, achievement.Id);
end