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
    name = addon.MetaData.Title,
    type = "group",
    childGroups = "tab",
    args = {}
};

function options.SetMaxNumberOfSearchPreviews()
    local numberOfSearchPreviews = KrowiAF_GetOptions.GetTable(addon.MetaData.Title, "args.Search.args.SearchPreview.args.NumberOfSearchPreviews");
    numberOfSearchPreviews.max = 17 + math.floor(addon.Options.db.Window.AchievementFrameHeightOffset / 29);
    return numberOfSearchPreviews;
end

local function Open()
    if addon.IsWrathClassic then
        InterfaceAddOnsList_Update(); -- This way the correct category will be shown when calling InterfaceOptionsFrame_OpenToCategory
        InterfaceOptionsFrame_OpenToCategory(addon.MetaData.Title);
        for _, button in next, InterfaceOptionsFrameAddOns.buttons do
            if button.element and button.element.name == addon.MetaData.Title and button.element.collapsed then
                OptionsListButtonToggle_OnClick(button.toggle);
                break;
            end
        end
        return;
    end

    Settings.GetCategory(addon.MetaData.Title).expanded = true;
    Settings.OpenToCategory(addon.MetaData.Title, true);
end

-- Load the options
function options.Load()
    addon.Options = LibStub("AceDB-3.0"):New("Options", options.Defaults, true);
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

string["AddDefaultValueText"] = function(self, valuePath, values)
    local value = options.Defaults.profile;
    local pathParts = strsplittable(".", valuePath);
    for _, part in next, pathParts do
        part = tonumber(part) and tonumber(part) or part;
        value = value[part];
    end
    if type(value) == "boolean" then
        value = value and addon.L["Checked"] or addon.L["Unchecked"];
    end
    if values then
        value = values[value];
    end
    return self .. "\n\n" .. addon.L["Default value"] .. ": " .. tostring(value);
end

string["AddReloadRequired"] = function(self)
    return self .. "\n\n" .. addon.L["Requires a reload"];
end