-- [[ Namespaces ]] --
local _, addon = ...;
local section = {};

function section.CheckAdd(achievement)
    return achievement.TransmogSets ~= nil;
end

function section.Add(menu, achievement)
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

tinsert(addon.GUI.RightClickMenu.AchievementMenu.Sections, section);