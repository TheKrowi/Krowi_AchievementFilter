-- [[ Namespaces ]] --
local _, addon = ...;
local section = {};

function section.CheckAdd(achievement)
    return achievement.MoreCategories;
end

function section.Add(menu, achievement)
    menu:AddFull({Text = addon.L["Other locations"], IsTitle = true});
	local selectedCategory = addon.GUI.SelectedTab and addon.GUI.SelectedTab.SelectedCategory or nil;
	if selectedCategory ~= achievement.Category then
		addon.GUI.RightClickMenu.AchievementMenu.AddGoToAchievementWithCategoryLine(menu, achievement, achievement.Category);
	end
	for _, category in next, achievement.MoreCategories do
		if selectedCategory ~= category then
			addon.GUI.RightClickMenu.AchievementMenu.AddGoToAchievementWithCategoryLine(menu, achievement, category);
		end
	end
end

local numSections = #addon.GUI.RightClickMenu.AchievementMenu.Sections;
tinsert(addon.GUI.RightClickMenu.AchievementMenu.Sections[numSections].Sections, section);