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

local function N(ids, cId, ...)
    for _, id in next, ids do
        widgetEvents[id] = event:New(id, ids, categories[cId], eventType.Widget, ...);
    end
end

local a = addon; -- Saves some characters and file size as we use this a lot in the tasks

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2024-07-21 13-47-15 ]] --
tasks = {
    {N, {4729}, 1393, 4240492, a.L["Community Feast"] .. ": " .. a.L["Next"]},
    {N, {4731}, 1393, 4240492, a.L["Community Feast"] .. ": " .. a.L["Active"]},
    {N, {4987}, 1454, 236387, a.L["Time Rift"] .. ": " .. a.L["Active"]},
    {N, {4992}, 1454, 236387, a.L["Time Rift"] .. ": " .. a.L["Next"]},
    {N, {5157}, 1552, 3939983, a.L["Superbloom"] .. ": " .. a.L["Next"]},
    {N, {5323}, 1552, 3939983, a.L["Superbloom"] .. ": " .. a.L["Active"]},
    {N, {5584}, 1564, 5341597, a.L["Azerothian Archives"] .. ": " .. a.L["Next"]},
    {N, {5585}, 1564, 5341597, a.L["Azerothian Archives"] .. ": " .. a.L["Soon"]},
    {N, {5592}, 1564, 5341597, a.L["Azerothian Archives"] .. ": " .. a.L["Active"]},
};

function exportedWidgetEvents.InjectDynamicOptions()
    KrowiAF_RegisterEventOptions("Widget", {4729}, a.L["Next"], a.L["Community Feast"], 2, 9);
    KrowiAF_RegisterEventOptions("Widget", {4731}, a.L["Active"], a.L["Community Feast"], 2, 9);
    KrowiAF_RegisterDeSelectAllEventOptions("Widget", {4729, 4731}, a.L["Community Feast"], 9);
    KrowiAF_RegisterEventOptions("Widget", {4987}, a.L["Active"], a.L["Time Rift"], 10, 9);
    KrowiAF_RegisterEventOptions("Widget", {4992}, a.L["Next"], a.L["Time Rift"], 10, 9);
    KrowiAF_RegisterDeSelectAllEventOptions("Widget", {4987, 4992}, a.L["Time Rift"], 9);
    KrowiAF_RegisterEventOptions("Widget", {5157}, a.L["Next"], a.L["Superbloom"], 12, 9);
    KrowiAF_RegisterEventOptions("Widget", {5323}, a.L["Active"], a.L["Superbloom"], 12, 9);
    KrowiAF_RegisterDeSelectAllEventOptions("Widget", {5157, 5323}, a.L["Superbloom"], 9);
    KrowiAF_RegisterEventOptions("Widget", {5584}, a.L["Next"], a.L["Azerothian Archives"], 13, 9);
    KrowiAF_RegisterEventOptions("Widget", {5585}, a.L["Soon"], a.L["Azerothian Archives"], 13, 9);
    KrowiAF_RegisterEventOptions("Widget", {5592}, a.L["Active"], a.L["Azerothian Archives"], 13, 9);
    KrowiAF_RegisterDeSelectAllEventOptions("Widget", {5584, 5585, 5592}, a.L["Azerothian Archives"], 9);
end