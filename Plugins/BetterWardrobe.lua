local _, addon = ...;
local bwr = {};
KrowiAF.PluginsApi:RegisterPlugin("BetterWardrobe", bwr);
KrowiAF.PluginsApi:RegisterEvent("ADDON_LOADED");

local function IsLoaded()
    return C_AddOns.IsAddOnLoaded("BetterWardrobe");
end

local function ReplaceOpenTransmogLink()
    WardrobeCollectionFrame.OpenTransmogLink = function(_, link)
        BetterWardrobeCollectionFrame:OpenTransmogLink(link);
        BetterWardrobeCollectionFrame:OpenTransmogLink(link);
    end
end

function bwr:OnEvent(event, arg1, arg2)
    if not IsLoaded() or event ~= "ADDON_LOADED" or arg1 ~= "Blizzard_Collections" then
        return;
    end

    ReplaceOpenTransmogLink()
end

function bwr:InjectOptions()
    KrowiAF.UtilApi.InjectOptions:AddPluginTable(
        "BetterWardrobe",
        addon.L["Better Wardrobe"],
        addon.L["Better Wardrobe Desc"]:K_ReplaceVars(addon.L["Better Wardrobe"]),
        function()
            return IsLoaded();
        end
    );
end

function bwr:Load()
    if not IsLoaded() then
        return;
    end
    if WardrobeCollectionFrame then
        ReplaceOpenTransmogLink();
    end
end