local _, addon = ...;
local section = {};
tinsert(addon.Gui.RightClickMenu.AchievementMenu.Sections, section);

function section:CheckAdd()
    return true;
end

local function AddClearWatch(menu, achievement)
	if achievement.IsWatched then
		addon.MenuUtil:CreateButtonAndAdd(
			menu,
			addon.L["Remove from Watch List"]:K_ReplaceVars(addon.L["Watch List"]),
			function()
				addon.ClearWatchAchievement(achievement);
				addon.Gui.RightClickMenu.AchievementMenu:CloseMenu();
			end
		);
	else
		addon.MenuUtil:CreateButtonAndAdd(
			menu,
			addon.L["Add to Watch List"]:K_ReplaceVars(addon.L["Watch List"]),
			function()
				addon.WatchAchievement(achievement);
				addon.Gui.RightClickMenu.AchievementMenu:CloseMenu();
			end
		);
	end
end

local function AddIncludeExclude(menu, achievement)
	if achievement.IsExcluded then
		addon.MenuUtil:CreateButtonAndAdd(
			menu,
			addon.L["Include"],
			function()
				addon.IncludeAchievement(achievement);
				addon.Gui.RightClickMenu.AchievementMenu:CloseMenu();
			end
		);
	else
		addon.MenuUtil:CreateButtonAndAdd(
			menu,
			addon.L["Exclude"],
			function()
				addon.ExcludeAchievement(achievement);
				addon.Gui.RightClickMenu.AchievementMenu:CloseMenu();
			end
		);
	end
end

function section:Add(menu, achievement)
	local more = addon.MenuUtil:CreateButton(menu, addon.L["More"]);

	AddClearWatch(more, achievement);
	AddIncludeExclude(more, achievement);

    addon.MenuUtil:AddChildMenu(menu, more);
end