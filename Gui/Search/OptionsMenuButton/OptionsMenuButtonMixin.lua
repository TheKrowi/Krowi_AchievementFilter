-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_SearchOptionsMenuButtonMixin = {};

function KrowiAF_SearchOptionsMenuButtonMixin:AddCheckBox(_menu, text, options, keys, ignoreAsMenuSelection)
    _menu:AddFull({	Text = text,
                    Checked = function() -- Using function here, we force the GUI to get the value again instead of only once (caused visual bugs)
                        return addon.Util.ReadNestedKeys(options, keys); -- e.g.: return filters.Completion.Completed;
                    end,
                    Func = function()
						addon.Util.WriteNestedKeys(options, keys, not addon.Util.ReadNestedKeys(options, keys));
                        addon.SearchOptions.Changed = true;
						if addon.IsWrathClassic then
							KrowiAF_SearchBoxFrame_OnFocusGained(addon.GUI.Search.BoxFrame);
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
	menu:AddFull({	Text = addon.L["Search options"],
					IsTitle = true
				});

	local profile = addon.SearchOptions.db.profile;
	self:AddCheckBox(menu, addon.L["Search IDs"] .. " (#)", profile, {"SearchIds"});
	self:AddCheckBox(menu, addon.L["Search Names"], profile, {"SearchNames"});
	self:AddCheckBox(menu, addon.L["Search Descriptions"], profile, {"SearchDescriptions"});
	self:AddCheckBox(menu, addon.L["Search Criteria"] .. " (@)", profile, {"SearchCriteria"});
	self:AddCheckBox(menu, addon.L["Search Rewards"], profile, {"SearchRewards"});

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