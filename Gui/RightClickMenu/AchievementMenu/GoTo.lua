local _, addon = ...;
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

function section:Add(menu, achievement, menuBuilder)
	local childMenu = menuBuilder:CreateSubmenuButton(menu, addon.L["Go to"]);
	local addSeparator = nil;

	for _, sect in next, self.Sections do
		if sect:CheckAdd(achievement) then
			if addSeparator then
				menuBuilder:CreateDivider(childMenu);
			end
			sect:Add(childMenu, achievement, menuBuilder);
			addSeparator = true;
		end
	end

    menuBuilder:AddChildMenu(menu, childMenu);
end