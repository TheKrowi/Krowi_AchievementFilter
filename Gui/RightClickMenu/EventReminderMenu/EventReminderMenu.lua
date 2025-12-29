local _, addon = ...;
addon.Gui.RightClickMenu.EventReminderMenu = {
	Sections = {}
};
local eventReminderMenu = addon.Gui.RightClickMenu.EventReminderMenu;
local menuBuilder = addon.MenuBuilder:New({});

local function CreateMenu(menuObj, event)
	menuBuilder:CreateTitle(menuObj, event.EventDetails and event.EventDetails.Name or addon.L["Unknown"]);

	for _, section in next, eventReminderMenu.Sections do
		if section:CheckAdd(event) then
			section:Add(menuObj, event, menuBuilder);
		end
	end
end

function eventReminderMenu:Open(caller, event, anchor, offsetX, offsetY, point, relativePoint, frameStrata, frameLevel)
	menuBuilder:ShowPopup(function()
		local menuObj = menuBuilder:GetMenu();
		CreateMenu(menuObj, event);
	end);
end

function eventReminderMenu:GetLastSection()
	local sections = self.Sections;
	return sections[#sections];
end