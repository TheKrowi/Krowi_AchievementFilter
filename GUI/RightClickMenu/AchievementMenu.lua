-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.RightClickMenu.AchievementMenu = {};
local achievementMenu = addon.GUI.RightClickMenu.AchievementMenu;
achievementMenu.Sections = {};
local sections = achievementMenu.Sections;

local rightClickMenu = LibStub("Krowi_Menu-1.0");

function achievementMenu.AddGoToAchievementLine(menu, id, nameSuffix)
	nameSuffix = nameSuffix or "";
	local _, name = addon.GetAchievementInfo(id);
	local disabled;
	if not addon.Data.Achievements[id] then -- Catch missing achievements from the addon to prevent errors
		name = name .. " (" .. addon.L["Missing"] .. ")";
		disabled = true;
	end
	menu:AddFull({
		Text = name .. nameSuffix,
		Func = function()
			KrowiAF_SelectAchievementFromID(id);
			rightClickMenu:Close();
		end,
		Disabled = disabled
	});
end

function achievementMenu.AddGoToAchievementWithCategoryLine(menu, achievement, category)
	menu:AddFull({
		Text = category:GetPath(),
		Func = function()
			KrowiAF_SelectAchievementWithCategory(achievement, category);
			rightClickMenu:Close();
		end,
		-- Disabled = disabled
	});
end

local function AddClearWatch(menu, achievement)
	if achievement.IsWatched then
		menu:AddFull({
			Text = addon.L["Remove from Watch List"]:ReplaceVars
			{
				watchList = addon.L["Watch List"]
			},
			Func = function()
				addon.ClearWatchAchievement(achievement);
				rightClickMenu:Close();
			end
		});
	else
		menu:AddFull({
			Text = addon.L["Add to Watch List"]:ReplaceVars
			{
				watchList = addon.L["Watch List"]
			},
			Func = function()
				addon.WatchAchievement(achievement);
				rightClickMenu:Close();
			end
		});
	end
end

local function AddIncludeExclude(menu, achievement)
	if achievement.IsExcluded then
		menu:AddFull({Text = addon.L["Include"], Func = function()
			addon.IncludeAchievement(achievement);
			rightClickMenu:Close();
		end});
	else
		menu:AddFull({Text = addon.L["Exclude"], Func = function()
			addon.ExcludeAchievement(achievement);
			rightClickMenu:Close();
		end});
	end
end

local function AddMore(achievement)
	local more = addon.Objects.MenuItem:New({Text = addon.L["More"]});

	AddClearWatch(more, achievement);
	AddIncludeExclude(more, achievement);

	rightClickMenu:Add(more);
end

function achievementMenu:Open(achievement, anchor, offsetX, offsetY)
	-- Reset menu
	rightClickMenu:Clear();

	-- Always add header
	local _, name = addon.GetAchievementInfo(achievement.Id);
	rightClickMenu:AddFull({Text = name, IsTitle = true});

	for _, section in next, sections do
		if section.CheckAdd(achievement) then
			section.Add(rightClickMenu, achievement);
		end
	end

	-- Extra menu defined at the achievement self including pet battles
	if addon.Data.RCMenuExtras[achievement.ID] ~= nil then
		rightClickMenu:Add(addon.Data.RCMenuExtras[achievement.ID]);
	end

	addon.Plugins:AddRightClickMenuItems(rightClickMenu, achievement);

	AddMore(achievement);

	rightClickMenu:Open(anchor, offsetX, offsetY);
end