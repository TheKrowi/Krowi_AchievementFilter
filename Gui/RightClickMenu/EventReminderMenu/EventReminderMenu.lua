local _, addon = ...;
local menuUtil = addon.Gui.MenuUtil;
addon.Gui.RightClickMenu.EventReminderMenu = {
	Sections = {}
};
local eventReminderMenu = addon.Gui.RightClickMenu.EventReminderMenu;

local function CreateMenu(self, menu, event)
	menuUtil:CreateTitle(menu, event.EventDetails and event.EventDetails.Name or addon.L["Unknown"]);

	for _, section in next, self.Sections do
		if section:CheckAdd(event) then
			section:Add(menu, event);
		end
	end
end

if addon.Util.IsTheWarWithin then
	function eventReminderMenu:Open(caller, event, anchor, offsetX, offsetY, point, relativePoint, frameStrata, frameLevel)
		MenuUtil.CreateContextMenu(caller, function(owner, menu)
			menu:SetTag("RIGHT_CLICK_MENU_EVENT_REMINDER");

			CreateMenu(self, menu, event);
		end);
	end
else
	local rightClickMenu = LibStub("Krowi_Menu-1.0");
	function eventReminderMenu:Open(caller, event, anchor, offsetX, offsetY, point, relativePoint, frameStrata, frameLevel)
		rightClickMenu:Clear();

		CreateMenu(self, rightClickMenu, event);

		rightClickMenu:Open(anchor, offsetX, offsetY, point, relativePoint, frameStrata, frameLevel);
	end
end

function eventReminderMenu:GetLastSection()
	local sections = self.Sections;
	return sections[#sections];
end