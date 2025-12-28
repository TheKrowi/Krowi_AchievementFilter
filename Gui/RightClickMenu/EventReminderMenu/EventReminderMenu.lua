local _, addon = ...;
addon.Gui.RightClickMenu.EventReminderMenu = {
	Sections = {}
};
local eventReminderMenu = addon.Gui.RightClickMenu.EventReminderMenu;
local menuBuilder = addon.MenuBuilder:New({});

local function CreateMenuFunc(builder, event)
	local menu = builder:GetMenu();
	
	menuBuilder:CreateTitle(menu, event.EventDetails and event.EventDetails.Name or addon.L["Unknown"]);

	for _, section in next, eventReminderMenu.Sections do
		if section:CheckAdd(event) then
			section:Add(menu, event, menuBuilder);
		end
	end
end

function eventReminderMenu:Open(caller, event, anchor, offsetX, offsetY, point, relativePoint, frameStrata, frameLevel)
	menuBuilder:ShowPopup(function(builder)
		CreateMenuFunc(builder, event);
	end);
end

function eventReminderMenu:GetLastSection()
	local sections = self.Sections;
	return sections[#sections];
end