local _, addon = ...;
addon.Gui.RightClickMenu.AchievementMenu = {
	Sections = {}
};
local achievementMenu = addon.Gui.RightClickMenu.AchievementMenu;
local menuBuilder = addon.MenuBuilder:New({});

function achievementMenu:CloseMenu()
	menuBuilder:Close();
end

function achievementMenu:AddGoToAchievementLine(menu, id, nameSuffix)
	nameSuffix = nameSuffix or "";
	local name = addon.GetAchievmentName(id);
	local disabled;
	if not addon.Data.Achievements[id] then -- Catch missing achievements from the addon to prevent errors
		name = name .. " (" .. addon.L["Missing"] .. ")";
		disabled = true;
	end
	menuBuilder:CreateButtonAndAdd(
		menu,
		name .. nameSuffix,
		function()
			KrowiAF_SelectAchievementFromID(id);
			menuBuilder:Close();
		end,
		disabled
	);
end

function achievementMenu:AddGoToAchievementWithCategoryLine(menu, achievement, category)
	menuBuilder:CreateButtonAndAdd(
		menu,
		category:GetPath(),
		function()
			KrowiAF_SelectAchievementWithCategory(achievement, category);
			menuBuilder:Close();
		end
	);
end

local function CreateMenu(menuObj, achievement)
	menuBuilder:CreateTitle(menuObj, addon.GetAchievmentName(achievement.Id));

	for _, section in next, achievementMenu.Sections do
		if section:CheckAdd(achievement) then
			section:Add(menuObj, achievement, menuBuilder);
		end
	end

	KrowiAF.PluginsApi:AddAchievementRightClickMenuItems(menuObj, achievement);
end

function achievementMenu:Open(caller, achievement, anchor, offsetX, offsetY, point, relativePoint, frameStrata, frameLevel)
	menuBuilder:ShowPopup(function()
		local menuObj = menuBuilder:GetMenu();
		CreateMenu(menuObj, achievement);
	end);
end

function achievementMenu:GetLastSection()
	local sections = self.Sections;
	return sections[#sections];
end