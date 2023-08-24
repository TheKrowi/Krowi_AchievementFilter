-- [[ Exported at 2023-08-23 19-51-31 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
local event = objects.Event;
local data = addon.Data;
data.ExportedWidgetEvents = {};
local exportedWidgetEvents = data.ExportedWidgetEvents;

local t;
local workload = {
    function() t[4729] = event:New(4729, 4240492, addon.L["Community Feast: Starting Soon"]); end, -- Community Feast: Starting Soon
    function() t[4731] = event:New(4731, 4240492, addon.L["Community Feast: Active"]); end, -- Community Feast: Active
    function() t[4987] = event:New(4987, 236387, addon.L["Time Rift: Active"]); end, -- Time Rift: Active
    function() t[4992] = event:New(4992, 236387, addon.L["Time Rift: Starting Soon"]); end, -- Time Rift: Starting Soon
};

function exportedWidgetEvents.Load(tbl)
    if addon.IsWrathClassic then
        return;
    end

    t = tbl;
    wipe(t);
    local name = "Widget Events";
    addon.Diagnostics.Debug(name .. ": Start loading data");
    addon.StartWork(name, workload, name .. ": Finished loading data", true);
end

function exportedWidgetEvents.LoadCategories(e)
    if addon.IsWrathClassic then
        return;
    end

    if e[4729] == nil or e[4731] == nil or e[4987] == nil or e[4992] == nil then
        exportedWidgetEvents.Load(e);
    end

    e[4729].Category = addon.Tabs["Events"].Categories[15].Children[3]; -- Community Feast
    e[4731].Category = addon.Tabs["Events"].Categories[15].Children[3]; -- Community Feast
    e[4987].Category = addon.Tabs["Events"].Categories[15].Children[6]; -- Time Rifts
    e[4992].Category = addon.Tabs["Events"].Categories[15].Children[6]; -- Time Rifts
end

function exportedWidgetEvents.InjectDynamicOptions()
    if addon.IsWrathClassic then
        return;
    end

    KrowiAF_RegisterEventOptions("Widget", "Community_Feast", addon.L["Community Feast"], 4729, addon.L["Community Feast: Starting Soon"]);
    KrowiAF_RegisterEventOptions("Widget", "Community_Feast", addon.L["Community Feast"], 4731, addon.L["Community Feast: Active"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Widget", "Community_Feast", { 4729, 4731 });
    KrowiAF_RegisterEventOptions("Widget", "Time_Rifts", addon.L["Time Rifts"], 4987, addon.L["Time Rift: Active"]);
    KrowiAF_RegisterEventOptions("Widget", "Time_Rifts", addon.L["Time Rifts"], 4992, addon.L["Time Rift: Starting Soon"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Widget", "Time_Rifts", { 4987, 4992 });
end

