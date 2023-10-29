local _, addon = ...;
addon.Gui.RightClickMenu.EventReminderMenu = {
	Sections = {}
};
local eventReminderMenu = addon.Gui.RightClickMenu.EventReminderMenu;

local rightClickMenu = LibStub("Krowi_Menu-1.0");

function eventReminderMenu:Open(event, anchor, offsetX, offsetY, point, relativePoint, frameStrata, frameLevel)
	-- Reset menu
	rightClickMenu:Clear();

	-- Always add header
	rightClickMenu:AddTitle(event.EventDetails.Name);

	for _, section in next, self.Sections do
		if section:CheckAdd(event) then
			section:Add(rightClickMenu, event);
		end
	end

	rightClickMenu:Open(anchor, offsetX, offsetY, point, relativePoint, frameStrata, frameLevel);
end

function eventReminderMenu:GetLastSection()
	local sections = self.Sections;
	return sections[#sections];
end