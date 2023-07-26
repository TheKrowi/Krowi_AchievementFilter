-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
addon.Options = {}; -- Will be overwritten in Load (intended)
local options = addon.Options;
options.OptionsTables = {};

if addon.IsWrathClassic then
    options.WidthMultiplier = 1;
else
    options.WidthMultiplier = 200 / 170; -- 170 comes from AceConfigDialog-3.0.lua, 200 fits better on the screen in DF
end

options.OptionsTable = {
    name = addon.Metadata.Title,
    type = "group",
    childGroups = "tab",
    args = {}
};

addon.InjectOptions:SetWidthMultiplier(options.WidthMultiplier);

function options.SetMaxNumberOfSearchPreviews()
    local numberOfSearchPreviews = KrowiAF_GetOptions.GetTable(addon.Metadata.Title, "args.Search.args.SearchPreview.args.NumberOfSearchPreviews");
    numberOfSearchPreviews.max = 17 + math.floor(addon.Options.db.Window.AchievementFrameHeightOffset / 29);
    return numberOfSearchPreviews;
end

local function Open()
    if addon.IsWrathClassic then
        InterfaceAddOnsList_Update(); -- This way the correct category will be shown when calling InterfaceOptionsFrame_OpenToCategory
        InterfaceOptionsFrame_OpenToCategory(addon.Metadata.Title);
        for _, button in next, InterfaceOptionsFrameAddOns.buttons do
            if button.element and button.element.name == addon.Metadata.Title and button.element.collapsed then
                OptionsListButtonToggle_OnClick(button.toggle);
                break;
            end
        end
        return;
    end

    Settings.GetCategory(addon.Metadata.Title).expanded = true;
    Settings.OpenToCategory(addon.Metadata.Title, true);
end

-- Load the options
function options.Load()
    addon.Options = LibStub("AceDB-3.0"):New("KrowiAF_Options", options.Defaults, true);
    addon.Options.WidthMultiplier = options.WidthMultiplier;
    addon.Options.Open = Open;
    addon.Options.db = addon.Options.profile;

    for _, optionsTable in next, options.OptionsTables do
        optionsTable.RegisterOptionsTable();
    end

    for _, optionsTable in next, options.OptionsTables do
        optionsTable.PostLoad();
    end

    diagnostics.Debug("Options loaded");
end

string.KAF_InjectAddonName = function(str)
    return str:K_ReplaceVars{addonName = addon.Metadata.Title};
end

string.KAF_AddDefaultValueText = function(str, valuePath, values)
    return str:K_AddDefaultValueText(options.Defaults.profile, valuePath, values);
end