local _, addon = ...;
local menuUtil = addon.Gui.MenuUtil;
local section = {
	Sections = {}
};
tinsert(addon.Gui.RightClickMenu.AchievementMenu.Sections, section);

function section:CheckAdd(achievement)
	for _, sect in next, self.Sections do
		if sect:CheckAdd(achievement) then
			return true;
		end
	end
	return false;
end

function section:Add(menu, achievement)
	local childMenu = menuUtil:CreateButton(menu, addon.L["Go to"]);
	local addSeparator = nil;

	for _, sect in next, self.Sections do
		if sect:CheckAdd(achievement) then
			if addSeparator then
				menuUtil:CreateDivider(childMenu);
			end
			sect:Add(childMenu, achievement);
			addSeparator = true;
		end
	end

    menuUtil:AddChildMenu(menu, childMenu);
end