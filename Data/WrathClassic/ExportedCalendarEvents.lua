local _, addon = ...;
local data = addon.Data;
data.ExportedCalendarEvents = {};
local exportedCalendarEvents = data.ExportedCalendarEvents;
local objects = addon.Objects;
local event = objects.Event;

local tasks, calendarEvents;
function exportedCalendarEvents.RegisterTasks(_calendarEvents)
    calendarEvents = _calendarEvents;
    wipe(calendarEvents);

    local name = "Calendar Events";
    data.InjectLoadingDebug(tasks, name);

    tinsert(data.TasksGroups, 1, tasks);
end

local function N(id, ...)
    calendarEvents[id] = event:New(id, ...);
end

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2023-10-21 20-02-56 ]] --
tasks = {
    {N, 141, 236705}, -- Feast of Winter Veil
    {N, 181, 237000}, -- Noblegarden
    {N, 201, 134508}, -- Children's Week
    {N, 324, 236552}, -- Hallow's End
    {N, 327, 236704}, -- Lunar Festival
    {N, 341, 135268}, -- Midsummer Fire Festival
    {N, 372, 236701}, -- Brewfest
    {N, 374, 134481}, -- Darkmoon Faire
    {N, 398, 133168}, -- Pirates' Day
    {N, 404, 250626}, -- Pilgrim's Bounty
    {N, 409, 237272}, -- Day of the Dead
    {N, 423, 236709}, -- Love is in the Air
};

function exportedCalendarEvents.LoadCategories(e)
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
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], {141}, addon.L["Feast of Winter Veil"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], {181}, addon.L["Noblegarden"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], {201}, addon.L["Children's Week"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], {324}, addon.L["Hallow's End"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], {327}, addon.L["Lunar Festival"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], {341}, addon.L["Midsummer Fire Festival"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], {372}, addon.L["Brewfest"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], {398}, addon.L["Pirates' Day"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], {404}, addon.L["Pilgrim's Bounty"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], {409}, addon.L["Day of the Dead"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", addon.L["Holidays"], {423}, addon.L["Love is in the Air"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Calendar", "Holidays", { 141, 181, 201, 324, 327, 341, 372, 398, 404, 409, 423 });
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], {374}, addon.L["Darkmoon Faire"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Calendar", "Other", { 374 });
end