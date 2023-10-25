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

function section:Add(menu, achievement)
	local childMenu = addon.Objects.MenuItem:New(addon.L["Go to"]);
	local addSeparator = nil;

	for _, sect in next, self.Sections do
		if sect:CheckAdd(achievement) then
			if addSeparator then
				childMenu:AddSeparator();
			end
			sect:Add(childMenu, achievement);
			addSeparator = true;
		end
	end

	menu:Add(childMenu);
end