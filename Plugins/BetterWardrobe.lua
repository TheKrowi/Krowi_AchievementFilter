local _, addon = ...;
local plugins = addon.Plugins;
plugins.BetterWardrobe = {};
local betterWardrobe = plugins.BetterWardrobe;
tinsert(plugins.Plugins, betterWardrobe);

local function ReplaceOpenTransmogLink()
    WardrobeCollectionFrame.OpenTransmogLink = function(_, link)
        BetterWardrobeCollectionFrame:OpenTransmogLink(link);
        BetterWardrobeCollectionFrame:OpenTransmogLink(link);
    end
end

plugins.LoadHelper:RegisterEvent("ADDON_LOADED");
function betterWardrobe:OnEvent(event, arg1, arg2)
    if not self.IsLoaded() then
        return;
    end
    if event == "ADDON_LOADED" and arg1 == "Blizzard_Collections" then
        ReplaceOpenTransmogLink()
    end
end

function betterWardrobe:InjectOptions()
    addon.InjectOptions:AddPluginTable("BetterWardrobe", addon.L["Better Wardrobe"], addon.L["Better Wardrobe Desc"]:K_ReplaceVars(addon.L["Better Wardrobe"]), function()
        return self.IsLoaded();
    end);
end

function betterWardrobe:Load()
    if not self.IsLoaded() then
        return;
    end
    if WardrobeCollectionFrame then
        ReplaceOpenTransmogLink();
    end
end

function betterWardrobe.IsLoaded()
    return C_AddOns.IsAddOnLoaded("BetterWardrobe");
end