-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
addon.Options = {}; -- Will be overwritten in Load (intended)
local options = addon.Options;

options.OptionsTable = {
    name = addon.MetaData.Title,
    type = "group",
    childGroups = "tab",
    args = {}
};

options.Debug = function(parameterName, value)
    diagnostics.Debug(parameterName .. ": " .. tostring(value));
end

options.MaxNumberOfSearchPreviews = function()
    return 17 + math.floor(addon.Options.db.Window.AchievementFrameHeightOffset / 29);
end

local function Open()
    InterfaceAddOnsList_Update(); -- This way the correct category will be shown when calling InterfaceOptionsFrame_OpenToCategory
    InterfaceOptionsFrame_OpenToCategory(addon.MetaData.Title);
    for _, button in next, InterfaceOptionsFrameAddOns.buttons do
        if button.element and button.element.name == addon.MetaData.Title and button.element.collapsed then
            OptionsListButtonToggle_OnClick(button.toggle);
            break;
        end
    end
end

local function InjectDefaults(table, tableName, ...)
    local destTable = options.Defaults.profile;
    for i = 1, select("#", ...), 1 do
        destTable = destTable[select(i, ...)];
    end
    destTable[tableName] = table;
end
options.InjectDefaults = InjectDefaults;

local function InjectDefaultsAdd(table, tableName, ...)
    local destTable = options.Defaults.profile;
    for i = 1, select("#", ...), 1 do
        destTable = destTable[select(i, ...)];
    end
    tinsert(destTable[tableName], table);
    return destTable[tableName];
end
options.InjectDefaultsAdd = InjectDefaultsAdd;

local function InjectOptionsTable(table, tableName, ...)
    local destTable = options.OptionsTable.args;
    for i = 1, select("#", ...), 1 do
        destTable = destTable[select(i, ...)];
    end
    destTable[tableName] = table;
end
options.InjectOptionsTable = InjectOptionsTable;

local function InjectOptionsTableAdd(table, key, tableName, ...)
    local destTable = options.OptionsTable.args;
    for i = 1, select("#", ...), 1 do
        destTable = destTable[select(i, ...)];
    end
    destTable[tableName][key] = table;
end
options.InjectOptionsTableAdd = InjectOptionsTableAdd;

-- Load the options
function options.Load()
    addon.Options = LibStub("AceDB-3.0"):New("Options", options.Defaults, true);
    addon.Options.Open = Open;
    addon.Options.Debug = options.Debug;
    addon.Options.InjectDefaults = InjectDefaults;
    addon.Options.InjectDefaultsAdd = InjectDefaultsAdd;
    addon.Options.InjectOptionsTable = InjectOptionsTable;
    addon.Options.InjectOptionsTableAdd = InjectOptionsTableAdd;
    addon.Options.db = addon.Options.profile;

    LibStub("AceConfig-3.0"):RegisterOptionsTable(addon.MetaData.Title, options.OptionsTable.args.General);
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addon.MetaData.Title, addon.MetaData.Title, nil);

    LibStub("AceConfig-3.0"):RegisterOptionsTable(options.OptionsTable.args.Layout.name, options.OptionsTable.args.Layout);
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(options.OptionsTable.args.Layout.name, options.OptionsTable.args.Layout.name, addon.MetaData.Title);

    LibStub("AceConfig-3.0"):RegisterOptionsTable(options.OptionsTable.args.EventReminders.name, options.OptionsTable.args.EventReminders);
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(options.OptionsTable.args.EventReminders.name, options.OptionsTable.args.EventReminders.name, addon.MetaData.Title);

    LibStub("AceConfig-3.0"):RegisterOptionsTable(options.OptionsTable.args.Plugins.name, options.OptionsTable.args.Plugins);
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(options.OptionsTable.args.Plugins.name, options.OptionsTable.args.Plugins.name, addon.MetaData.Title);

    LibStub("AceConfig-3.0"):RegisterOptionsTable(options.OptionsTable.args.Credits.name, options.OptionsTable.args.Credits);
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(options.OptionsTable.args.Credits.name, options.OptionsTable.args.Credits.name, addon.MetaData.Title);

    -- Extra things to set in the options panel based loaded options we can't do while loading the addon files
    local numberOfSearchPreviews = LibStub("AceConfigRegistry-3.0"):GetOptionsTable(addon.MetaData.Title, "cmd", "KROWIAF-0.0").args.Search.args.SearchPreview.args.NumberOfSearchPreviews; -- cmd and KROWIAF-0.0 are just to make the function work
    numberOfSearchPreviews.max = options.MaxNumberOfSearchPreviews();

    if addon.Options.db.Calendar.FirstWeekDay < 1 or addon.Options.db.Calendar.FirstWeekDay > 7 then
        if not IsAddOnLoaded("Blizzard_Calendar") then -- This is to make sure we get the 1st day of the week correct
            LoadAddOn("Blizzard_Calendar"); -- breaks Blizzard_Calendar
        end
        addon.Options.db.Calendar.FirstWeekDay = CALENDAR_FIRST_WEEKDAY;
    end

    diagnostics.Debug("Options loaded");
    -- diagnostics.DebugTable(addon.Options.db, 1);
end