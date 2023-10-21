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
    {N, 398, 133168}, -- Pirates' Day
    {N, 404, 250626}, -- Pilgrim's Bounty
    {N, 409, 237272}, -- Day of the Dead
    {N, 423, 236709}, -- Love is in the Air
    {N, 479, 134481}, -- Darkmoon Faire
    {N, 1262, 133783}, -- WoW's 18th Anniversary
    {N, 1395, 1100022}, -- Kalimdor Cup
    {N, 1396, 4419345}, -- Secrets of Azeroth
    {N, 1398, 4419345}, -- Secrets of Azeroth
    {N, 1399, 4419345}, -- Secrets of Azeroth
    {N, 1397, 133783}, -- WoW's 19th Anniversary
    {N, 1400, 1100022}, -- Eastern Kingdoms Cup
    {N, 1425, 4630413}, -- Turbulent Timeways
    {N, 1458, 4630413}, -- Turbulent Timeways
    {N, 1459, 4630413}, -- Turbulent Timeways
    {N, 1460, 4630413}, -- Turbulent Timeways
};

function exportedCalendarEvents.LoadCategories(e)
    e[141].Category = addon.Tabs["Events"].Categories[6].Children[11]; -- Winter Veil
    e[181].Category = addon.Tabs["Events"].Categories[6].Children[3]; -- Noblegarden
    e[201].Category = addon.Tabs["Events"].Categories[6].Children[4]; -- Children's Week
    e[324].Category = addon.Tabs["Events"].Categories[6].Children[8]; -- Hallow's End
    e[327].Category = addon.Tabs["Events"].Categories[6].Children[1]; -- Lunar Festival
    e[341].Category = addon.Tabs["Events"].Categories[6].Children[5]; -- Midsummer
    e[372].Category = addon.Tabs["Events"].Categories[6].Children[7]; -- Brewfest
    e[398].Category = addon.Tabs["Events"].Categories[6].Children[6]; -- Pirates' Day
    e[404].Category = addon.Tabs["Events"].Categories[6].Children[10]; -- Pilgrim's Bounty
    e[409].Category = addon.Tabs["Events"].Categories[6].Children[9]; -- Day of the Dead
    e[423].Category = addon.Tabs["Events"].Categories[6].Children[2]; -- Love is in the Air
    e[479].Category = addon.Tabs["Events"].Categories[8]; -- Darkmoon Faire
    e[1262].Category = addon.Tabs["Events"].Categories[7]; -- WoW's Anniversary
    e[1395].Category = addon.Tabs["Events"].Categories[9].Children[1]; -- Kalimdor Cup
    e[1396].Category = addon.Tabs["Events"].Categories[10]; -- Secrets of Azeroth
    e[1398].Category = addon.Tabs["Events"].Categories[10]; -- Secrets of Azeroth
    e[1399].Category = addon.Tabs["Events"].Categories[10]; -- Secrets of Azeroth
    e[1397].Category = addon.Tabs["Events"].Categories[7]; -- WoW's Anniversary
    e[1400].Category = addon.Tabs["Events"].Categories[9].Children[2]; -- Eastern Kingdoms Cup
    e[1425].Category = addon.Tabs["Events"].Categories[11].Children[2]; -- Turbulent Timeways
    e[1458].Category = addon.Tabs["Events"].Categories[11].Children[2]; -- Turbulent Timeways
    e[1459].Category = addon.Tabs["Events"].Categories[11].Children[2]; -- Turbulent Timeways
    e[1460].Category = addon.Tabs["Events"].Categories[11].Children[2]; -- Turbulent Timeways
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
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], {479}, addon.L["Darkmoon Faire"]);
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], {1262}, addon.L["WoW's 18th Anniversary"], false);
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], {1395}, addon.L["Kalimdor Cup"]);
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], {1396, 1398, 1399}, addon.L["Secrets of Azeroth"]);
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], {1397}, addon.L["WoW's 19th Anniversary"]);
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], {1400}, addon.L["Eastern Kingdoms Cup"]);
    KrowiAF_RegisterEventOptions("Calendar", "Other", addon.L["Other"], {1425, 1458, 1459, 1460}, addon.L["Turbulent Timeways"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Calendar", "Other", { 479, 1262, 1395, 1396, 1398, 1399, 1397, 1400, 1425, 1458, 1459, 1460 });
end