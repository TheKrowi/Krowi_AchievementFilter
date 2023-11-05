local _, addon = ...;
addon.Data.ExportedWidgetEvents = {};
local exportedWidgetEvents = addon.Data.ExportedWidgetEvents;

local tasks, widgetEvents, categories;
function exportedWidgetEvents.RegisterTasks(_widgetEvents, _categories)
    widgetEvents, categories = _widgetEvents, _categories;
    wipe(widgetEvents);

    local name = "Widget Events";
    addon.Data.InjectLoadingDebug(tasks, name);

    tinsert(addon.Data.TasksGroups, 1, tasks);
end

local event = addon.Objects.Event;
local eventType = addon.Objects.EventType;
local function N(id, cId, ...)
    widgetEvents[id] = event:New(id, categories[cId], eventType.Widget, ...);
end

local a = addon; -- Saves some characters and file size as we use this a lot in the tasks

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2023-11-05 19-29-28 ]] --
tasks = {
    {N, 4729, 1393, 4240492, a.L["Community Feast: Starting Soon"]}, -- Community Feast: Starting Soon
    {N, 4731, 1393, 4240492, a.L["Community Feast: Active"]}, -- Community Feast: Active
    {N, 4987, 1454, 236387, a.L["Time Rift: Active"]}, -- Time Rift: Active
    {N, 4992, 1454, 236387, a.L["Time Rift: Starting Soon"]}, -- Time Rift: Starting Soon
    {N, 5157, 1552, 3939983, a.L["Superbloom: Next"]}, -- Superbloom: Next
    {N, 5323, 1552, 3939983, a.L["Superbloom: Active"]}, -- Superbloom: Active
};

function exportedWidgetEvents.InjectDynamicOptions()
    KrowiAF_RegisterEventOptions("Widget", "Community_Feast", a.L["Community Feast"], {4729}, a.L["Community Feast: Starting Soon"]);
    KrowiAF_RegisterEventOptions("Widget", "Community_Feast", a.L["Community Feast"], {4731}, a.L["Community Feast: Active"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Widget", "Community_Feast", { 4729, 4731 });
    KrowiAF_RegisterEventOptions("Widget", "Time_Rifts", a.L["Time Rifts"], {4987}, a.L["Time Rift: Active"]);
    KrowiAF_RegisterEventOptions("Widget", "Time_Rifts", a.L["Time Rifts"], {4992}, a.L["Time Rift: Starting Soon"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Widget", "Time_Rifts", { 4987, 4992 });
    KrowiAF_RegisterEventOptions("Widget", "Superbloom", a.L["Superbloom"], {5157}, a.L["Superbloom: Next"]);
    KrowiAF_RegisterEventOptions("Widget", "Superbloom", a.L["Superbloom"], {5323}, a.L["Superbloom: Active"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Widget", "Superbloom", { 5157, 5323 });
end