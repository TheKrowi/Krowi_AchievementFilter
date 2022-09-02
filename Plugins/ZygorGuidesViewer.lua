-- [[ Namespaces ]] --
local _, addon = ...;
local plugins = addon.Plugins;
plugins.ZygorGuidesViewer = {};
local zygorGuidesViewer = plugins.ZygorGuidesViewer;
tinsert(plugins.Plugins, zygorGuidesViewer);

plugins.LoadHelper:RegisterEvent("ADDON_LOADED");
function zygorGuidesViewer:OnEvent(event, arg1, arg2)
    if event == "ADDON_LOADED" then
        if arg1 == "ZygorGuidesViewer" then
            local preHookFunction = addon.GUI.ToggleAchievementFrame;
            function addon.GUI.ToggleAchievementFrame(_addonName, tabName, resetView, forceOpen)
                preHookFunction(_addonName, tabName, resetView, forceOpen);
                ZGV.Achievement:IconSetup();
            end
        end
    end
end

function zygorGuidesViewer.LoadLocalization(L)
    L["Zygor Guides Viewer"] = "Zygor Guides Viewer";
    L["Zygor Guides Viewer Desc"] = "This plugin adds the magnifying glasses again to the Blizzard Achievements tab.\n\nThere are no options.";
end

function zygorGuidesViewer.InjectOptions()
    local optionsTable = {
        type = "group",
        name = addon.L["Zygor Guides Viewer"],
        args = {
            Loaded = {
                order = 1, type = "toggle", width = "full",
                name = addon.L["Loaded"],
                desc = addon.L["Loaded Desc"],
                descStyle = "inline",
                get = function() return IsAddOnLoaded("ZygorGuidesViewer") end,
                disabled = true
            },
            Line = {
                order = 2, type = "header", width = "full",
                name = ""
            },
            Description = {
                order = 3, type = "description", width = "full",
                name = addon.L["Zygor Guides Viewer Desc"],
                fontSize = "medium"
            }
        }
    };

    addon.Options.InjectOptionsTable(optionsTable, "ZygorGuidesViewer", "Plugins", "args");
end