local _, addon = ...;
local section = {};
tinsert(addon.Gui.RightClickMenu.AchievementMenu.Sections, section);

function section:CheckAdd(achievement)
	return true;
end

function section:Add(menu, achievement, menuBuilder, caller)
	local achievementPopout = addon.Gui.AchievementPopout;

	if achievementPopout:IsPopoutButton(caller, achievement.Id) then
		menuBuilder:CreateButtonAndAdd(
			menu,
			addon.L["Close Popout"],
			function()
				achievementPopout:Close(achievement.Id);
				addon.Gui.RightClickMenu.AchievementMenu:CloseMenu();
			end
		);
		return;
	end

	menuBuilder:CreateButtonAndAdd(
		menu,
		addon.L["Pop Out"],
		function()
			achievementPopout:Open(achievement);
			addon.Gui.RightClickMenu.AchievementMenu:CloseMenu();
		end
	);
end
