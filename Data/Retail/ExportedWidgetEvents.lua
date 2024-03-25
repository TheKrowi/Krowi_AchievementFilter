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

-- [[ Exported at 2024-03-25 05-55-12 ]] --
tasks = {
    {N, 4729, 1393, 4240492, a.L["Community Feast: Next"]}, -- Community Feast: Next
    {N, 4731, 1393, 4240492, a.L["Community Feast: Active"]}, -- Community Feast: Active
    {N, 4987, 1454, 236387, a.L["Time Rift: Active"]}, -- Time Rift: Active
    {N, 4992, 1454, 236387, a.L["Time Rift: Next"]}, -- Time Rift: Next
    {N, 5157, 1552, 3939983, a.L["Superbloom: Next"]}, -- Superbloom: Next
    {N, 5323, 1552, 3939983, a.L["Superbloom: Active"]}, -- Superbloom: Active
    {N, 5584, 1564, 5341597, a.L["The Big Dig: Next"]}, -- The Big Dig: Next
    {N, 5585, 1564, 5341597, a.L["The Big Dig: Soon"]}, -- The Big Dig: Soon
    {N, 5592, 1564, 5341597, a.L["The Big Dig: Active"]}, -- The Big Dig: Active
};

function exportedWidgetEvents.InjectDynamicOptions()
    KrowiAF_RegisterEventOptions("Widget", {4729}, a.L["Community Feast: Next"], a.L["Community Feast"], 5, a.L["Dragonflight"]);
    KrowiAF_RegisterEventOptions("Widget", {4731}, a.L["Community Feast: Active"], a.L["Community Feast"], 5, a.L["Dragonflight"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Widget", {4729, 4731}, a.L["Community Feast"], a.L["Dragonflight"]);
    KrowiAF_RegisterEventOptions("Widget", {4987}, a.L["Time Rift: Active"], a.L["Time Rifts"], 13, a.L["Dragonflight"]);
    KrowiAF_RegisterEventOptions("Widget", {4992}, a.L["Time Rift: Next"], a.L["Time Rifts"], 13, a.L["Dragonflight"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Widget", {4987, 4992}, a.L["Time Rifts"], a.L["Dragonflight"]);
    KrowiAF_RegisterEventOptions("Widget", {5157}, a.L["Superbloom: Next"], a.L["Superbloom"], 15, a.L["Dragonflight"]);
    KrowiAF_RegisterEventOptions("Widget", {5323}, a.L["Superbloom: Active"], a.L["Superbloom"], 15, a.L["Dragonflight"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Widget", {5157, 5323}, a.L["Superbloom"], a.L["Dragonflight"]);
    KrowiAF_RegisterEventOptions("Widget", {5584}, a.L["The Big Dig: Next"], a.L["Azerothian Archives"], 16, a.L["Dragonflight"]);
    KrowiAF_RegisterEventOptions("Widget", {5585}, a.L["The Big Dig: Soon"], a.L["Azerothian Archives"], 16, a.L["Dragonflight"]);
    KrowiAF_RegisterEventOptions("Widget", {5592}, a.L["The Big Dig: Active"], a.L["Azerothian Archives"], 16, a.L["Dragonflight"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Widget", {5584, 5585, 5592}, a.L["Azerothian Archives"], a.L["Dragonflight"]);
end