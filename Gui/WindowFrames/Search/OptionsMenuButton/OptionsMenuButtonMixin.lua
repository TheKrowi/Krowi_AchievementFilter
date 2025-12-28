local _, addon = ...;

local MenuBuilder = LibStub("Krowi_MenuBuilder-1.0");
local isModern = addon.Util.IsMainline;

KrowiAF_SearchOptionsMenuButtonMixin = {};

local function CreateSearchOptionsMenuFunc(builder)
    local menu = builder:GetMenu();
    
    -- Always add header
    builder:CreateTitle(menu, addon.L["Search options"]);
    
    local profile = addon.SearchOptions.db.profile;
    builder:CreateCheckbox(menu, addon.L["Search Ids"] .. " (#)", profile, {"SearchIds"});
    builder:CreateCheckbox(menu, addon.L["Search Names"], profile, {"SearchNames"});
    builder:CreateCheckbox(menu, addon.L["Search Descriptions"], profile, {"SearchDescriptions"});
    builder:CreateCheckbox(menu, addon.L["Search Criteria"] .. " (@)", profile, {"SearchCriteria"});
    builder:CreateCheckbox(menu, addon.L["Search Rewards"], profile, {"SearchRewards"});
end

function KrowiAF_SearchOptionsMenuButtonMixin:OnLoad()
    -- Initialize MenuBuilder with callbacks
    local config = {
        callbacks = {
            KeyIsTrue = function(options, keys)
                return addon.Util.ReadNestedKeys(options, keys);
            end,
            OnCheckboxSelect = function(options, keys)
                addon.Util.WriteNestedKeys(options, keys, not addon.Util.ReadNestedKeys(options, keys));
                addon.SearchOptions.Changed = true;
                if addon.Util.IsClassicWithAchievements then
                    KrowiAF_SearchBoxFrame:Focus();
                end
            end,
        }
    };
    
    self.menuBuilder = MenuBuilder:New(config);
end

function KrowiAF_SearchOptionsMenuButtonMixin:OnMouseDown()
    if not isModern then
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
	end
    UIMenuButtonStretchMixin.OnMouseDown(self);
    self.menuBuilder:ShowPopup(CreateSearchOptionsMenuFunc, self);
end