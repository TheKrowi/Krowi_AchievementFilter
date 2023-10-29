local _, addon = ...;
local data = addon.Data;
data.ExportedWidgetEvents = {};
local exportedWidgetEvents = data.ExportedWidgetEvents;
local objects = addon.Objects;
local eventType = objects.EventType;
local event = objects.Event;

local tasks, widgetEvents;
function exportedWidgetEvents.RegisterTasks(_widgetEvents)
    widgetEvents = _widgetEvents;
    wipe(widgetEvents);

    local name = "Widget Events";
    data.InjectLoadingDebug(tasks, name);

    tinsert(data.TasksGroups, 1, tasks);
end

local function N(id, ...)
    widgetEvents[id] = event:New(id, eventType.Widget, ...);
end

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2023-10-29 15-19-49 ]] --
tasks = {
    {N, 4729, 4240492, addon.L["Community Feast: Starting Soon"]}, -- Community Feast: Starting Soon
    {N, 4731, 4240492, addon.L["Community Feast: Active"]}, -- Community Feast: Active
    {N, 4987, 236387, addon.L["Time Rift: Active"]}, -- Time Rift: Active
    {N, 4992, 236387, addon.L["Time Rift: Starting Soon"]}, -- Time Rift: Starting Soon
    {N, 5323, 3939983, addon.L["Superbloom: Active"]}, -- Superbloom: Active
};

function exportedWidgetEvents.LoadCategories(e)
    e[4729].Category = addon.Tabs["Events"].Categories[15].Children[3]; -- Community Feast
    e[4731].Category = addon.Tabs["Events"].Categories[15].Children[3]; -- Community Feast
    e[4987].Category = addon.Tabs["Events"].Categories[15].Children[6]; -- Time Rifts
    e[4992].Category = addon.Tabs["Events"].Categories[15].Children[6]; -- Time Rifts
    e[5323].Category = addon.Tabs["Events"].Categories[15].Children[8]; -- Superbloom
end

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