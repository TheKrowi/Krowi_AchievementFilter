local _, addon = ...;
local section = {};

section.Sections = {};
local sections = section.Sections;

function section.CheckAdd(achievement)
	for _, sect in next, sections do
		if sect.CheckAdd(achievement) then
			return true;
		end
	end
	return false;
end

function section.Add(menu, achievement)
	local childMenu = addon.Objects.MenuItem:New({Text = addon.L["Go to"]});
	local addSeparator = nil;

	for _, sect in next, sections do
		if sect.CheckAdd(achievement) then
			if addSeparator then
				childMenu:AddSeparator();
			end
			sect.Add(childMenu, achievement);
			addSeparator = true;
		end
	end

	menu:Add(childMenu);
end

tinsert(addon.Gui.RightClickMenu.AchievementMenu.Sections, section);