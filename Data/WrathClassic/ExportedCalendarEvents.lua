-- [[ Exported at 2023-08-23 19-51-31 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
local event = objects.Event;
local data = addon.Data;
data.ExportedCalendarEvents = {};
local exportedCalendarEvents = data.ExportedCalendarEvents;

local t;
local workload = {
    function() t[141] = event:New(141, 236705); end, -- Feast of Winter Veil
    function() t[181] = event:New(181, 237000); end, -- Noblegarden
    function() t[201] = event:New(201, 134508); end, -- Children's Week
    function() t[324] = event:New(324, 236552); end, -- Hallow's End
    function() t[327] = event:New(327, 236704); end, -- Lunar Festival
    function() t[341] = event:New(341, 135268); end, -- Midsummer Fire Festival
    function() t[372] = event:New(372, 236701); end, -- Brewfest
    function() t[374] = event:New(374, 134481); end, -- Darkmoon Faire
    function() t[398] = event:New(398, 133168); end, -- Pirates' Day
    function() t[404] = event:New(404, 250626); end, -- Pilgrim's Bounty
    function() t[409] = event:New(409, 237272); end, -- Day of the Dead
    function() t[423] = event:New(423, 236709); end, -- Love is in the Air
};

function exportedCalendarEvents.Load(tbl)
    t = tbl;
    wipe(t);
    local name = "Calendar Events";
    addon.Diagnostics.Debug(name .. ": Start loading data");
    addon.StartWork(name, workload, name .. ": Finished loading data", true);
end

function exportedCalendarEvents.LoadCategories(e)
    if e[141] == nil or e[181] == nil or e[201] == nil or e[324] == nil or e[327] == nil or e[341] == nil or e[372] == nil or e[374] == nil or e[398] == nil or e[404] == nil or e[409] == nil or e[423] == nil then
        exportedCalendarEvents.Load(e);
    end

    e[141].Category = addon.Tabs["Events"].Categories[6].Children[11]; -- Winter Veil
    e[181].Category = addon.Tabs["Events"].Categories[6].Children[3]; -- Noblegarden
    e[201].Category = addon.Tabs["Events"].Categories[6].Children[4]; -- Children's Week
    e[324].Category = addon.Tabs["Events"].Categories[6].Children[8]; -- Hallow's End
    e[327].Category = addon.Tabs["Events"].Categories[6].Children[1]; -- Lunar Festival
    e[341].Category = addon.Tabs["Events"].Categories[6].Children[5]; -- Midsummer
    e[372].Category = addon.Tabs["Events"].Categories[6].Children[7]; -- Brewfest
    e[374].Category = addon.Tabs["Events"].Categories[8]; -- Darkmoon Faire
    e[398].Category = addon.Tabs["Events"].Categories[6].Children[6]; -- Pirates' Day
    e[404].Category = addon.Tabs["Events"].Categories[6].Children[10]; -- Pilgrim's Bounty
    e[409].Category = addon.Tabs["Events"].Categories[6].Children[9]; -- Day of the Dead
    e[423].Category = addon.Tabs["Events"].Categories[6].Children[2]; -- Love is in the Air
end

function exportedCalendarEvents.InjectDynamicOptions()
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 141, addon.L["Feast of Winter Veil"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 181, addon.L["Noblegarden"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 201, addon.L["Children's Week"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 324, addon.L["Hallow's End"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 327, addon.L["Lunar Festival"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 341, addon.L["Midsummer Fire Festival"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 372, addon.L["Brewfest"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 398, addon.L["Pirates' Day"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 404, addon.L["Pilgrim's Bounty"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 409, addon.L["Day of the Dead"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], 423, addon.L["Love is in the Air"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Calendar", "Holidays", { 141, 181, 201, 324, 327, 341, 372, 398, 404, 409, 423 });
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], 374, addon.L["Darkmoon Faire"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Calendar", "Other", { 374 });
end

