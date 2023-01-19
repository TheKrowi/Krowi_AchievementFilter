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
            if not IsAddOnLoaded("BetterWardrobe") then
                return;
            end
            hooksecurefunc(WardrobeCollectionFrame, "GoToSet", function(self, setId)
                BetterWardrobeCollectionFrame:GoToSet(setId);
            end);
        end
    end
end

function betterWardrobe.LoadLocalization(L)
    L["Better Wardrobe"] = "Better Wardrobe";
    L["Better Wardrobe Desc"] = "This plugin fixes the link to the wardrobe that is broken by {betterWardrobe}.\n\nThere are no options.";
end

function betterWardrobe.InjectOptions()
    KrowiAF_InjectOptions.AddPluginTable("BetterWardrobe", addon.L["Better Wardrobe"], addon.L["Better Wardrobe Desc"], function()
        return IsAddOnLoaded("BetterWardrobe");
    end);
end