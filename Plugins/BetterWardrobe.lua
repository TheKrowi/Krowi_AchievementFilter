-- [[ Namespaces ]] --
local _, addon = ...;
local plugins = addon.Plugins;
plugins.BetterWardrobe = {};
local betterWardrobe = plugins.BetterWardrobe;
tinsert(plugins.Plugins, betterWardrobe);

plugins.LoadHelper:RegisterEvent("ADDON_LOADED");
function betterWardrobe:OnEvent(event, arg1, arg2)
    if event == "ADDON_LOADED" then
        if arg1 == "Blizzard_Collections" then
            if not C_AddOns.IsAddOnLoaded("BetterWardrobe") then
                return;
            end
            hooksecurefunc(WardrobeCollectionFrame, "GoToSet", function(self, setId)
                BetterWardrobeCollectionFrame:GoToSet(setId);
            end);
        end
    end
end

function betterWardrobe.InjectOptions()
    addon.InjectOptions:AddPluginTable("BetterWardrobe", addon.L["Better Wardrobe"], addon.L["Better Wardrobe Desc"]:K_ReplaceVars(addon.L["Better Wardrobe"]), function()
        return C_AddOns.IsAddOnLoaded("BetterWardrobe");
    end);
end