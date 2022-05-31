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
    local optionsTable = {
        type = "group",
        name = addon.L["Better Wardrobe"],
        args = {
            Loaded = {
                order = 1, type = "toggle", width = "full",
                name = addon.L["Loaded"],
                desc = addon.L["Loaded Desc"],
                descStyle = "inline",
                get = function() return IsAddOnLoaded("BetterWardrobe") end,
                disabled = true
            },
            Line = {
                order = 2, type = "header", width = "full",
                name = ""
            },
            Description = {
                order = 3, type = "description", width = "full",
                name = addon.Util.ReplaceVars
                {
                    addon.L["Better Wardrobe Desc"],
                    betterWardrobe = addon.L["Better Wardrobe"]
                },
                fontSize = "medium"
            }
        }
    };

    addon.Options.InjectOptionsTable(optionsTable, "BetterWardrobe", "Plugins", "args");
end