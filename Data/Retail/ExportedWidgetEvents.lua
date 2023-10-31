local _, addon = ...;
local data = addon.Data;
data.ExportedWidgetEvents = {};
local exportedWidgetEvents = data.ExportedWidgetEvents;
local objects = addon.Objects;
local eventType = objects.EventType;
local event = objects.Event;

local tasks, widgetEvents, categories;
function exportedWidgetEvents.RegisterTasks(_widgetEvents, _categories)
    widgetEvents, categories = _widgetEvents, _categories;
    wipe(widgetEvents);

    local name = "Widget Events";
    data.InjectLoadingDebug(tasks, name);

    tinsert(data.TasksGroups, 1, tasks);
end

local function N(id, cId, ...)
    widgetEvents[id] = event:New(id, categories[cId], eventType.Widget, ...);
end

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2023-10-31 20-52-17 ]] --
tasks = {
    {N, 4729, 1393, 4240492, addon.L["Community Feast: Starting Soon"]}, -- Community Feast: Starting Soon
    {N, 4731, 1393, 4240492, addon.L["Community Feast: Active"]}, -- Community Feast: Active
    {N, 4987, 1454, 236387, addon.L["Time Rift: Active"]}, -- Time Rift: Active
    {N, 4992, 1454, 236387, addon.L["Time Rift: Starting Soon"]}, -- Time Rift: Starting Soon
    {N, 5323, 1552, 3939983, addon.L["Superbloom: Active"]}, -- Superbloom: Active
};

function exportedWidgetEvents.InjectDynamicOptions()
    KrowiAF_RegisterEventOptions("Widget", "Community_Feast", addon.L["Community Feast"], {4729}, addon.L["Community Feast: Starting Soon"]);
    KrowiAF_RegisterEventOptions("Widget", "Community_Feast", addon.L["Community Feast"], {4731}, addon.L["Community Feast: Active"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Widget", "Community_Feast", { 4729, 4731 });
    KrowiAF_RegisterEventOptions("Widget", "Time_Rifts", addon.L["Time Rifts"], {4987}, addon.L["Time Rift: Active"]);
    KrowiAF_RegisterEventOptions("Widget", "Time_Rifts", addon.L["Time Rifts"], {4992}, addon.L["Time Rift: Starting Soon"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Widget", "Time_Rifts", { 4987, 4992 });
    KrowiAF_RegisterEventOptions("Widget", "Superbloom", addon.L["Superbloom"], {5323}, addon.L["Superbloom: Active"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Widget", "Superbloom", { 5323 });
end