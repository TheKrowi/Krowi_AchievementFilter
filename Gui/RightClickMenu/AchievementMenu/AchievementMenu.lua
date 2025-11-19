local _, addon = ...;
addon.Gui.RightClickMenu.AchievementMenu = {
	Sections = {}
};
local achievementMenu = addon.Gui.RightClickMenu.AchievementMenu;

local rightClickMenu = LibStub("Krowi_Menu-1.0");
function achievementMenu:CloseMenu()
	rightClickMenu:Close();
end

function achievementMenu:AddGoToAchievementLine(menu, id, nameSuffix)
	nameSuffix = nameSuffix or "";
	local name = addon.GetAchievmentName(id);
	local disabled;
	if not addon.Data.Achievements[id] then -- Catch missing achievements from the addon to prevent errors
		name = name .. " (" .. addon.L["Missing"] .. ")";
		disabled = true;
	end
	addon.MenuUtil:CreateButtonAndAdd(
		menu,
		name .. nameSuffix,
		function()
			KrowiAF_SelectAchievementFromID(id);
			rightClickMenu:Close();
		end,
		disabled
	);
end

function achievementMenu:AddGoToAchievementWithCategoryLine(menu, achievement, category)
	addon.MenuUtil:CreateButtonAndAdd(
		menu,
		category:GetPath(),
		function()
			KrowiAF_SelectAchievementWithCategory(achievement, category);
			rightClickMenu:Close();
		end
	);
end

local function CreateMenu(self, menu, achievement)
	addon.MenuUtil:CreateTitle(menu, addon.GetAchievmentName(achievement.Id));

	for _, section in next, self.Sections do
		if section:CheckAdd(achievement) then
			section:Add(menu, achievement);
		end
	end

	KrowiAF.PluginsApi:AddAchievementRightClickMenuItems(menu, achievement);
end

if addon.Util.IsMainline then
	function achievementMenu:Open(caller, achievement, anchor, offsetX, offsetY, point, relativePoint, frameStrata, frameLevel)
		MenuUtil.CreateContextMenu(caller, function(owner, menu)
			menu:SetTag("RIGHT_CLICK_MENU_ACHIEVEMENT");

			CreateMenu(self, menu, achievement);
		end);
	end
else
	function achievementMenu:Open(caller, achievement, anchor, offsetX, offsetY, point, relativePoint, frameStrata, frameLevel)
		rightClickMenu:Clear();

		CreateMenu(self, rightClickMenu, achievement);

		rightClickMenu:Open(anchor, offsetX, offsetY, point, relativePoint, frameStrata, frameLevel);
	end
end

function achievementMenu:GetLastSection()
	local sections = self.Sections;
	return sections[#sections];
end