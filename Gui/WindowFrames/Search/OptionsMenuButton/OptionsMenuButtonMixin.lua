local _, addon = ...;

KrowiAF_SearchOptionsMenuButtonMixin = {};

local menuBuilder;

function KrowiAF_SearchOptionsMenuButtonMixin:OnLoad()
	menuBuilder = addon.MenuBuilder:New({
		uniqueTag = "KAF_SEARCH_OPTIONS",
        callbacks = {
            OnCheckboxSelect = function(options, keys)
                addon.Util.WriteNestedKeys(options, keys, not menuBuilder:KeyIsTrue(options, keys));
                addon.SearchOptions.Changed = true;
                if addon.Util.IsClassicWithAchievements then
                    KrowiAF_SearchBoxFrame:Focus();
                end
            end,
        }
    });
end

local function CreateMenu(menuObj)
    menuBuilder:CreateTitle(menuObj, addon.L["Search options"]);

    local profile = addon.SearchOptions.db.profile;
    menuBuilder:CreateCheckbox(menuObj, addon.L["Search Ids"] .. " (#)", profile, {"SearchIds"});
    menuBuilder:CreateCheckbox(menuObj, addon.L["Search Names"], profile, {"SearchNames"});
    menuBuilder:CreateCheckbox(menuObj, addon.L["Search Descriptions"], profile, {"SearchDescriptions"});
    menuBuilder:CreateCheckbox(menuObj, addon.L["Search Criteria"] .. " (@)", profile, {"SearchCriteria"});
    menuBuilder:CreateCheckbox(menuObj, addon.L["Search Rewards"], profile, {"SearchRewards"});
end

function KrowiAF_SearchOptionsMenuButtonMixin:OnMouseDown()
    if not addon.Util.IsMainline then
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
	end
    UIMenuButtonStretchMixin.OnMouseDown(self);
    menuBuilder:ShowPopup(function()
		local menuObj = menuBuilder:GetMenu();
		CreateMenu(menuObj);
	end);
end