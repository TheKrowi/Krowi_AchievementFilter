local _, addon = ...
addon.Gui.RightClickMenu.AchievementMenu = {
	Sections = {}
}
local achievementMenu = addon.Gui.RightClickMenu.AchievementMenu
local menuBuilder

-- From the feature's Start (RightClickMenu.lua): loading the file makes nothing
function achievementMenu.Create()
	menuBuilder = menuBuilder or addon.MenuBuilder:New({modern = addon.Util.IsModern})
end

function achievementMenu:AddGoToAchievementLine(menu, id, nameSuffix)
	nameSuffix = nameSuffix or ""
	local _, name = addon.GetAchievementInfo(id) -- The placeholder name for an id the game does not know, never nil
	local isEnabled
	if not addon.Data.Achievements[id] then -- Catch missing achievements from the addon to prevent errors
		name = name .. " (" .. addon.L["Missing"] .. ")"
		isEnabled = false
	end
	menuBuilder:CreateButtonAndAdd(
		menu,
		name .. nameSuffix,
		function()
			KrowiAF_SelectAchievementFromID(id)
			menuBuilder:Close()
		end,
		isEnabled
	)
end

function achievementMenu:AddGoToAchievementWithCategoryLine(menu, achievement, category)
	menuBuilder:CreateButtonAndAdd(
		menu,
		category:GetPath(),
		function()
			KrowiAF_SelectAchievementWithCategory(achievement, category)
			menuBuilder:Close()
		end
	)
end

-- Builds the menu into menuObj without showing it, so the menu suite (Tests/Menu.lua) can build one into a root of its own
function achievementMenu:CreateMenu(menuObj, achievement, caller)
	local _, name = addon.GetAchievementInfo(achievement.Id)
	menuBuilder:CreateTitle(menuObj, name)

	-- The menu's own sections and the features' entries (Slots.lua, AchievementMenu), each list in Order, merged by it
	local own, added = achievementMenu.Sections, addon.Slots.AchievementMenu.Entries
	local i, j = 1, 1
	while own[i] or added[j] do
		local section
		if added[j] and (not own[i] or (added[j].Order or 0) < (own[i].Order or 0)) then
			section, j = added[j], j + 1
		else
			section, i = own[i], i + 1
		end
		if section:CheckAdd(achievement) then
			section:Add(menuObj, achievement, menuBuilder, caller)
		end
	end

	KrowiAF.PluginsApi:AddAchievementRightClickMenuItems(menuObj, achievement, menuBuilder)
end

function achievementMenu:Open(caller, achievement)
	menuBuilder:ShowPopup(function()
		local menuObj = menuBuilder:GetMenu()
		achievementMenu:CreateMenu(menuObj, achievement, caller)
	end)
end

function achievementMenu:GetLastSection()
	local sections = self.Sections
	return sections[#sections]
end