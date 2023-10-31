local _, addon = ...;
local data = addon.Data;
data.ExportedCalendarEvents = {};
local exportedCalendarEvents = data.ExportedCalendarEvents;
local objects = addon.Objects;
local eventType = objects.EventType;
local event = objects.Event;

local tasks, calendarEvents, categories;
function exportedCalendarEvents.RegisterTasks(_calendarEvents, _categories)
    calendarEvents, categories = _calendarEvents, _categories;
    wipe(calendarEvents);

    local name = "Calendar Events";
    data.InjectLoadingDebug(tasks, name);

    tinsert(data.TasksGroups, 1, tasks);
end

local function N(id, cId, ...)
    calendarEvents[id] = event:New(id, categories[cId], eventType.Calendar, ...);
end

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2023-10-31 20-52-17 ]] --
tasks = {
    {N, 141, 917, 236705, addon.L["Feast of Winter Veil"]}, -- Feast of Winter Veil
    {N, 181, 911, 237000, addon.L["Noblegarden"]}, -- Noblegarden
    {N, 201, 912, 134508, addon.L["Children's Week"]}, -- Children's Week
    {N, 324, 915, 236552, addon.L["Hallow's End"]}, -- Hallow's End
    {N, 327, 885, 236704, addon.L["Lunar Festival"]}, -- Lunar Festival
    {N, 341, 913, 135268, addon.L["Midsummer Fire Festival"]}, -- Midsummer Fire Festival
    {N, 372, 914, 236701, addon.L["Brewfest"]}, -- Brewfest
    {N, 374, 925, 134481, addon.L["Darkmoon Faire"]}, -- Darkmoon Faire
    {N, 398, 919, 133168, addon.L["Pirates' Day"]}, -- Pirates' Day
    {N, 404, 916, 250626, addon.L["Pilgrim's Bounty"]}, -- Pilgrim's Bounty
    {N, 409, 920, 237272, addon.L["Day of the Dead"]}, -- Day of the Dead
    {N, 423, 910, 236709, addon.L["Love is in the Air"]}, -- Love is in the Air
};

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