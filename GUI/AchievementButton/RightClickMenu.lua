-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.AchievementButton.RightClickMenu = {};
local rightClickMenu = addon.GUI.AchievementButton.RightClickMenu;

local menu = LibStub("Krowi_Menu-1.0");
local popupDialog = LibStub("Krowi_PopopDialog-1.0");

local function AddWowheadLink(achievement)
	if achievement.HasNoWowheadLink then
		return;
	end

	local locale = "";
	if addon.Options.db.RightClickMenu.WowheadLink.AddLocale then
		locale = GetLocale();
		locale = locale:sub(1, 2);
		if locale == "zh" then
			locale = "cn"
		end
		locale = locale .. ".";
	end

	local addRelatedTab = addon.Options.db.RightClickMenu.WowheadLink.AddRelatedTab;
	local relatedTab = "";
	if addRelatedTab == 1 then -- None
	elseif addRelatedTab == 2 then
		relatedTab = "#criteria-of"
	elseif addRelatedTab == 3 then
		relatedTab = "#guides"
	elseif addRelatedTab == 4 then
		relatedTab = "#news"
	elseif addRelatedTab == 5 then
		relatedTab = "#comments"
	elseif addRelatedTab == 6 then
		relatedTab = "#screenshots"
	end

	local externalLink = "https://" .. locale .. "wowhead.com/achievement=" .. achievement.Id .. relatedTab;
	menu:AddFull({Text = addon.L["Wowhead"], Func = function() popupDialog.ShowExternalLink(externalLink); end});
end

local function AddSeparator(goTo, addSeparator)
	if addSeparator then
		goTo:AddSeparator();
	end
	return nil;
end

local function AddGoToAchievementLine(goTo, id, nameSuffix)
	nameSuffix = nameSuffix or "";
	local _, name = addon.GetAchievementInfo(id);
	local disabled;
	if not addon.Data.Achievements[id] then -- Catch missing achievements from the addon to prevent errors
		name = name .. " (" .. addon.L["Missing"] .. ")";
		disabled = true;
	end
	goTo:AddFull({
		Text = name .. nameSuffix,
		Func = function()
			KrowiAF_SelectAchievementFromID(id, nil, true);
			menu:Close();
		end,
		Disabled = disabled
	});
end

local function AddPartOfAChainAchievement(goTo, id, nameSuffix)
	AddGoToAchievementLine(goTo, id, nameSuffix);
	local achievement = addon.Data.Achievements[id];
	local nextAchievements = achievement.NextAchievements;
	if nextAchievements == nil then
		return;
	end
	for nextId, _ in next, nextAchievements do
		if achievement.NumNextAchievements > 1 then
			if addon.Data.Achievements[nextId].Faction then
				nameSuffix = " (" .. addon.L[addon.Objects.Faction[addon.Data.Achievements[nextId].Faction]] .. ")";
			end
		end
		AddPartOfAChainAchievement(goTo, nextId, nameSuffix);
	end
end

local function AddRequiredForIds(goTo, requiredForIds, id)
	for _, requiredForId in next, requiredForIds do
		if requiredForId ~= id then
			AddGoToAchievementLine(goTo, requiredForId);
		end
	end
end

local function AddGoToAchievementWithCategoryLine(goTo, achievement, category)
	goTo:AddFull({
		Text = category:GetPath(),
		Func = function()
			KrowiAF_SelectAchievementWithCategory(achievement, category, nil, true);
			menu:Close();
		end
	});
end

local function AddOtherLocations(goTo, selectedCategory, achievement)
	if selectedCategory ~= achievement.Category then
		AddGoToAchievementWithCategoryLine(goTo, achievement, achievement.Category);
	end
	for _, category in next, achievement.MoreCategories do				
		if selectedCategory ~= category then
			AddGoToAchievementWithCategoryLine(goTo, achievement, category);
		end
	end
end

local function AddGoTo(achievement)
	local firstId = addon.GetFirstAchievementId(achievement.Id);
	local requiredForIds = achievement:GetRequiredForIds();

	local firstAchievement = addon.Data.Achievements[firstId];
	local selectedCategory = addon.GUI.SelectedTab.SelectedCategory;
	if firstAchievement.NextAchievements == nil
	and #requiredForIds == 0
	and achievement.MoreCategories == nil
	and selectedCategory ~= addon.Data.CurrentZoneCategory
	and selectedCategory ~= addon.Data.SelectedZoneCategory then -- Others can be added here later
		return;
	end

	local goTo = addon.Objects.MenuItem:New({Text = addon.L["Go to"]});
	local addSeparator = nil;

	-- Part of a chain
	if firstAchievement.NextAchievements ~= nil then
		goTo:AddFull({Text = addon.L["Part of a chain"], IsTitle = true});
		AddPartOfAChainAchievement(goTo, firstId);
		addSeparator = true;
	end

	-- Required for
	if #requiredForIds ~= 0 then
		addSeparator = AddSeparator(goTo, addSeparator);
		goTo:AddFull({Text = addon.L["Required for"], IsTitle = true});
		AddRequiredForIds(goTo, requiredForIds, achievement.Id);
		addSeparator = true;
	end

	-- Other faction
	if achievement.OtherFactionAchievementId then
		addSeparator = AddSeparator(goTo, addSeparator);
		local faction = addon.L["Neutral"];
		if addon.Faction.IsAlliance then
			faction = addon.L["Horde"];
		elseif addon.Faction.IsHorde then
			faction = addon.L["Alliance"];
		end
		goTo:AddFull({Text = addon.L["Other faction"] .. " (" .. faction .. ")", IsTitle = true});
		AddGoToAchievementLine(goTo, achievement.OtherFactionAchievementId);
		addSeparator = true;
	end

	-- First category with achievement
	if selectedCategory == addon.Data.CurrentZoneCategory or selectedCategory == addon.Data.SelectedZoneCategory then
		addSeparator = AddSeparator(goTo, addSeparator);
		goTo:AddFull({Text = achievement.Category:GetPath(), IsTitle = true});
		AddGoToAchievementLine(goTo, achievement.ID);
		addSeparator = true;
	end

	-- Other locations
	if achievement.MoreCategories then
		addSeparator = AddSeparator(goTo, addSeparator);
		goTo:AddFull({Text = addon.L["Other locations"], IsTitle = true});
		AddOtherLocations(goTo, selectedCategory, achievement);
		addSeparator = true;
	end

	menu:Add(goTo); -- Add Go to menu to the right click menu
end

local function AddTransmogSets(achievement)
	if achievement.TransmogSets == nil then
		return;
	end

	local transmogSets = addon.Objects.MenuItem:New({Text = addon.L["Transmog Sets"]});

	local tSets = addon.GetUsableSets(achievement.TransmogSets);
	for _, set in next, tSets do
		local setInfo = C_TransmogSets.GetSetInfo(set.Id);
		if setInfo.requiredFaction == nil or setInfo.requiredFaction == UnitFactionGroup("player") then
			transmogSets:AddFull({
				Text = setInfo.name .. " (" .. setInfo.description .. ")",
				Func = function()
					if not IsAddOnLoaded("Blizzard_Collections") then
						LoadAddOn("Blizzard_Collections");
					end
					CollectionsJournal:Show();
					CollectionsJournal_SetTab(CollectionsJournal, 5);
					WardrobeCollectionFrame:GoToSet(set.Id);
					menu:Close();
				end
			});
		end
	end

	menu:Add(transmogSets);
end

local function AddClearFocusFocus(more, achievement)
	if achievement.Focused then
		more:AddFull({
			Text = addon.L["Clear focus"], Func = function()
			addon.ClearFocusAchievement(achievement);
			more:Close();
		end});
	else
		more:AddFull({
			Text = addon.L["Focus"], Func = function()
			addon.FocusAchievement(achievement);
			more:Close();
		end});
	end
end

local function AddIncludeExclude(more, achievement)
	if achievement.Excluded then
		more:AddFull({
			Text = addon.L["Include"], Func = function()
			addon.IncludeAchievement(achievement);
			more:Close();
		end});
	else
		more:AddFull({
			Text = addon.L["Exclude"], Func = function()
			addon.ExcludeAchievement(achievement);
			more:Close();
		end});
	end
end

local function AddMore(achievement)
	local more = addon.Objects.MenuItem:New({Text = addon.L["More"]});

	AddClearFocusFocus(more, achievement);
	AddIncludeExclude(more, achievement);

	menu:Add(more);
end

function rightClickMenu.Open(self, anchor, offsetX, offsetY)
	local achievement = self.Achievement;

	-- Reset menu
	menu:Clear();

	-- Always add header
	local _, name = addon.GetAchievementInfo(achievement.Id);
	menu:AddFull({Text = name, IsTitle = true});

	AddWowheadLink(achievement);
	AddGoTo(achievement);
	AddTransmogSets(achievement);

	-- Extra menu defined at the achievement self including pet battles
	if addon.Data.RCMenuExtras[achievement.Id] ~= nil then
		menu:Add(addon.Data.RCMenuExtras[achievement.Id]);
	end

	addon.Plugins:AddRightClickMenuItems(menu, achievement);

	AddMore(achievement);

	menu:Open(anchor, offsetX, offsetY);
end