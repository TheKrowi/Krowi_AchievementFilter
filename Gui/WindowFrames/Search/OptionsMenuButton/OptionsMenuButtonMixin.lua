local _, addon = ...;

KrowiAF_SearchOptionsMenuButtonMixin = {};

local function AddCheckBox(_menu, text, options, keys, ignoreAsMenuSelection)
    _menu:AddFull({
		Text = text,
		Checked = function() -- Using function here, we force the Gui to get the value again instead of only once (caused visual bugs)
			return addon.Util.ReadNestedKeys(options, keys); -- e.g.: return filters.Completion.Completed;
		end,
		Func = function()
			addon.Util.WriteNestedKeys(options, keys, not addon.Util.ReadNestedKeys(options, keys));
			addon.SearchOptions.Changed = true;
			if addon.Util.IsWrathClassic then
				KrowiAF_SearchBoxFrame:Focus();
			end
		end,
		IsNotRadio = true,
		NotCheckable = false,
		KeepShownOnClick = true,
		IgnoreAsMenuSelection = ignoreAsMenuSelection
	});
end

local menu = LibStub("Krowi_Menu-1.0");
function KrowiAF_SearchOptionsMenuButtonMixin:OnMouseDown()
    UIMenuButtonStretchMixin.OnMouseDown(self);
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);

	-- Reset menu
	menu:Clear();

	-- Always add header
	menu:AddFull({
		Text = addon.L["Search options"],
		IsTitle = true
	});

	local profile = addon.SearchOptions.db.profile;
	AddCheckBox(menu, addon.L["Search IDs"] .. " (#)", profile, {"SearchIds"});
	AddCheckBox(menu, addon.L["Search Names"], profile, {"SearchNames"});
	AddCheckBox(menu, addon.L["Search Descriptions"], profile, {"SearchDescriptions"});
	AddCheckBox(menu, addon.L["Search Criteria"] .. " (@)", profile, {"SearchCriteria"});
	AddCheckBox(menu, addon.L["Search Rewards"], profile, {"SearchRewards"});

	menu:Toggle(self);
end

function KrowiAF_SearchOptionsMenuButtonMixin:OnEnter()
	-- GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	-- GameTooltip_SetTitle(GameTooltip, addon.L["Search Options"]);
	-- GameTooltip:AddLine(addon.L["Search Options Tip Line 1"]);
	-- GameTooltip:AddLine(addon.L["Search Options Tip Line 2"]);
	-- GameTooltip:AddLine(addon.L["Search Options Tip Line 3"]);
	-- GameTooltip:Show();
end

function KrowiAF_SearchOptionsMenuButtonMixin:OnLeave()
	-- GameTooltip:Hide();
end