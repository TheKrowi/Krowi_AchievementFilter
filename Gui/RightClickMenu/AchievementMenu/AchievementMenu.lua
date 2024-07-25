local _, addon = ...;
local menuUtil = addon.Gui.MenuUtil;
addon.Gui.RightClickMenu.AchievementMenu = {
	Sections = {}
};
local achievementMenu = addon.Gui.RightClickMenu.AchievementMenu;

local rightClickMenu = LibStub("Krowi_Menu-1.0");
function achievementMenu:AddGoToAchievementLine(menu, id, nameSuffix)
	nameSuffix = nameSuffix or "";
	local _, name = addon.GetAchievementInfo(id);
	local disabled;
	if not addon.Data.Achievements[id] then -- Catch missing achievements from the addon to prevent errors
		name = name .. " (" .. addon.L["Missing"] .. ")";
		disabled = true;
	end
	menuUtil:CreateButtonAndAdd(
		menu,
		name .. nameSuffix,
		function()
			KrowiAF_SelectAchievementFromID(id);
			rightClickMenu:Close();
		end,
		disabled
	);
end

function achievementMenu:AddGoToAchievementWithCategoryLine(menu, achievement, category)
	menuUtil:CreateButtonAndAdd(
		menu,
		category:GetPath(),
		function()
			KrowiAF_SelectAchievementWithCategory(achievement, category);
			rightClickMenu:Close();
		end
	);
end

local function AddClearWatch(menu, achievement)
	if achievement.IsWatched then
		menuUtil:CreateButtonAndAdd(
			menu,
			addon.L["Remove from Watch List"]:K_ReplaceVars(addon.L["Watch List"]),
			function()
				addon.ClearWatchAchievement(achievement);
				rightClickMenu:Close();
			end
		);
	else
		menuUtil:CreateButtonAndAdd(
			menu,
			addon.L["Add to Watch List"]:K_ReplaceVars(addon.L["Watch List"]),
			function()
				addon.WatchAchievement(achievement);
				rightClickMenu:Close();
			end
		);
	end
end

local function AddIncludeExclude(menu, achievement)
	if achievement.IsExcluded then
		menuUtil:CreateButtonAndAdd(
			menu,
			addon.L["Include"],
			function()
				addon.IncludeAchievement(achievement);
				rightClickMenu:Close();
			end
		);
	else
		menuUtil:CreateButtonAndAdd(
			menu,
			addon.L["Exclude"],
			function()
				addon.ExcludeAchievement(achievement);
				rightClickMenu:Close();
			end
		);
	end
end

local function AddMore(menu, achievement)
	local more = menuUtil:CreateButton(menu, addon.L["More"]);

	AddClearWatch(more, achievement);
	AddIncludeExclude(more, achievement);

    menuUtil:AddChildMenu(menu, more);
end

local function CreateMenu(self, menu, achievement)
	local _, name = addon.GetAchievementInfo(achievement.Id);
	menuUtil:CreateTitle(menu, name);

	for _, section in next, self.Sections do
		if section:CheckAdd(achievement) then
			section:Add(menu, achievement);
		end
	end

	local petBattleLinkData;
	for _, v in next, KrowiAF.PetBattleLinkData do
		if v[1] == achievement.Id then
			petBattleLinkData = v;
			-- return here or better lookup if found
		end
	end
	if petBattleLinkData ~= nil then
		local petBattleLink = menuUtil:CreateButton(
			menu,
			addon.L["Xu-Fu's Pet Guides"],
			function()
				LibStub("Krowi_PopopDialog-1.0").ShowExternalLink(petBattleLinkData[2]);
			end
		);
		for _, v in next, petBattleLinkData[3] do
			local exists = select(16, addon.GetAchievementInfo(achievement.Id));
			local criteriaString;
			if exists then
				criteriaString = addon.GetAchievementCriteriaInfo(achievement.Id, v[1]);
			else
				criteriaString = "* Placeholder for " .. achievement.Id .. " and " .. v[1] .. " * ";
			end
			menuUtil:CreateButtonAndAdd(
				petBattleLink,
				criteriaString,
				function()
					LibStub("Krowi_PopopDialog-1.0").ShowExternalLink(v[2]);
				end
			);
		end
	
		menuUtil:AddChildMenu(menu, petBattleLink);
	end

	-- if addon.Data.RightClickMenuExtras[achievement.Id] ~= nil then
	-- 	rightClickMenu:Add(addon.Data.RightClickMenuExtras[achievement.Id]);
	-- end

	-- addon.Plugins:AddRightClickMenuItems(rightClickMenu, achievement);

	AddMore(menu, achievement);
end

if addon.Util.IsTheWarWithin then
	function achievementMenu:Open(caller, achievement, anchor, offsetX, offsetY, point, relativePoint, frameStrata, frameLevel)
		MenuUtil.CreateContextMenu(caller, function(owner, menu)
			menu:SetTag("RIGHT_CLICK_MENU_ACHIEVEMENT");

			CreateMenu(self, menu, achievement);
		end);
	end
else
	function achievementMenu:Open(caller, achievement, anchor, offsetX, offsetY, point, relativePoint, frameStrata, frameLevel)
		rightClickMenu:Clear();

		CreateMenu(self, rightClickMenu, achievement);

		rightClickMenu:Open(anchor, offsetX, offsetY, point, relativePoint, frameStrata, frameLevel);
	end
end

function achievementMenu:GetLastSection()
	local sections = self.Sections;
	return sections[#sections];
end