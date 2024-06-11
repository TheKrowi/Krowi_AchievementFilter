local _, addon = ...;
local section = {};
tinsert(addon.Gui.RightClickMenu.AchievementMenu.Sections, section);

function section:CheckAdd(achievement)
    return achievement.TransmogSets ~= nil;
end

function section:Add(menu, achievement)
	local transmogSets = addon.Objects.MenuItem:New(addon.L["Transmog Sets"]);

	local tSets = addon.GetUsableSets(achievement.TransmogSets);
	for _, set in next, tSets do
		local setInfo = C_TransmogSets.GetSetInfo(set.Id);
		transmogSets:AddFull({ 
			Text = setInfo.name .. " (" .. setInfo.description .. ")",
			Func = function()
				if not C_AddOns.IsAddOnLoaded("Blizzard_Collections") then
					C_AddOns.LoadAddOn("Blizzard_Collections");
				end
				CollectionsJournal:Show();
				CollectionsJournal_SetTab(CollectionsJournal, 5);
				WardrobeCollectionFrame:GoToSet(set.Id);
				menu:Close();
			end
		});
	end

	menu:Add(transmogSets);
end