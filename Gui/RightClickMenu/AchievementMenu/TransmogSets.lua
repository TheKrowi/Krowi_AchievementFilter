local _, addon = ...;
local section = {};
tinsert(addon.Gui.RightClickMenu.AchievementMenu.Sections, section);

function section:CheckAdd(achievement)
    return achievement.TransmogSets ~= nil;
end

function section:Add(menu, achievement)
	local transmogSets = addon.MenuUtil:CreateButton(menu, addon.L["Transmog Sets"]);

	local tSets = addon.GetUsableSets(achievement.TransmogSets);
	for _, set in next, tSets do
		local setInfo = C_TransmogSets.GetSetInfo(set.Id);
		addon.MenuUtil:CreateButtonAndAdd(
			transmogSets,
			setInfo.name .. " (" .. setInfo.description .. ")",
			function()
				if not C_AddOns.IsAddOnLoaded("Blizzard_Collections") then
					C_AddOns.LoadAddOn("Blizzard_Collections");
				end
				CollectionsJournal:Show();
				CollectionsJournal_SetTab(CollectionsJournal, 5);
				WardrobeCollectionFrame:GoToSet(set.Id);
				menu:Close();
			end
		);
	end

    addon.MenuUtil:AddChildMenu(menu, transmogSets);
end