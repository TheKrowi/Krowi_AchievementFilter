local _, addon = ...;
local section = {};

function section.CheckAdd(achievement)
    return achievement.MoreCategories;
end

function section.Add(menu, achievement)
    menu:AddFull({Text = addon.L["Other locations"], IsTitle = true});
	local selectedCategory = addon.Gui.SelectedTab and addon.Gui.SelectedTab.SelectedCategory or nil;
	if selectedCategory ~= achievement.Category then
		addon.Gui.RightClickMenu.AchievementMenu.AddGoToAchievementWithCategoryLine(menu, achievement, achievement.Category);
	end
	for _, category in next, achievement.MoreCategories do
		if selectedCategory ~= category then
			addon.Gui.RightClickMenu.AchievementMenu.AddGoToAchievementWithCategoryLine(menu, achievement, category);
		end
	end
end

tinsert(addon.Gui.RightClickMenu.AchievementMenu:GetLastSection().Sections, section);