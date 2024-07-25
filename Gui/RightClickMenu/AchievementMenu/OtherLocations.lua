local _, addon = ...;
local menuUtil = addon.Gui.MenuUtil;
local section = {};
tinsert(addon.Gui.RightClickMenu.AchievementMenu:GetLastSection().Sections, section);

function section:CheckAdd(achievement)
    return achievement.MoreCategories;
end

function section:Add(menu, achievement)
	menuUtil:CreateTitle(menu, addon.L["Other locations"]);
	local selectedCategory = addon.Gui.SelectedTab and addon.Gui.SelectedTab.SelectedCategory or nil;
	if selectedCategory ~= achievement.Category then
		addon.Gui.RightClickMenu.AchievementMenu:AddGoToAchievementWithCategoryLine(menu, achievement, achievement.Category);
	end
	for _, category in next, achievement.MoreCategories do
		if selectedCategory ~= category then
			addon.Gui.RightClickMenu.AchievementMenu:AddGoToAchievementWithCategoryLine(menu, achievement, category);
		end
	end
end