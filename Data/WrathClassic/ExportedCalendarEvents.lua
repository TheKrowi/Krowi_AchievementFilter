local _, addon = ...;
addon.Data.ExportedCalendarEvents = {};
local exportedCalendarEvents = addon.Data.ExportedCalendarEvents;

local tasks, calendarEvents, categories;
function exportedCalendarEvents.RegisterTasks(_calendarEvents, _categories)
    calendarEvents, categories = _calendarEvents, _categories;
    wipe(calendarEvents);

    local name = "Calendar Events";
    addon.Data.InjectLoadingDebug(tasks, name);

    tinsert(addon.Data.TasksGroups, 1, tasks);
end

local event = addon.Objects.Event;
local eventType = addon.Objects.EventType;
local function N(id, cId, ...)
    calendarEvents[id] = event:New(id, categories[cId], eventType.Calendar, ...);
end

local a = addon; -- Saves some characters and file size as we use this a lot in the tasks

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2023-11-09 21-46-29 ]] --
tasks = {
    {N, 141, 917, 236705, a.L["Feast of Winter Veil"]}, -- Feast of Winter Veil
    {N, 181, 911, 237000, a.L["Noblegarden"]}, -- Noblegarden
    {N, 201, 912, 134508, a.L["Children's Week"]}, -- Children's Week
    {N, 324, 915, 236552, a.L["Hallow's End"]}, -- Hallow's End
    {N, 327, 885, 236704, a.L["Lunar Festival"]}, -- Lunar Festival
    {N, 341, 913, 135268, a.L["Midsummer Fire Festival"]}, -- Midsummer Fire Festival
    {N, 372, 914, 236701, a.L["Brewfest"]}, -- Brewfest
    {N, 374, 925, 134481, a.L["Darkmoon Faire"]}, -- Darkmoon Faire
    {N, 398, 919, 133168, a.L["Pirates' Day"]}, -- Pirates' Day
    {N, 404, 916, 250626, a.L["Pilgrim's Bounty"]}, -- Pilgrim's Bounty
    {N, 409, 920, 237272, a.L["Day of the Dead"]}, -- Day of the Dead
    {N, 423, 910, 236709, a.L["Love is in the Air"]}, -- Love is in the Air
};

function exportedCalendarEvents.InjectDynamicOptions()
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", a.L["Holidays"], {141}, a.L["Feast of Winter Veil"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", a.L["Holidays"], {181}, a.L["Noblegarden"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", a.L["Holidays"], {201}, a.L["Children's Week"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", a.L["Holidays"], {324}, a.L["Hallow's End"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", a.L["Holidays"], {327}, a.L["Lunar Festival"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", a.L["Holidays"], {341}, a.L["Midsummer Fire Festival"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", a.L["Holidays"], {372}, a.L["Brewfest"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", a.L["Holidays"], {398}, a.L["Pirates' Day"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", a.L["Holidays"], {404}, a.L["Pilgrim's Bounty"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", a.L["Holidays"], {409}, a.L["Day of the Dead"]);
    KrowiAF_RegisterEventOptions("Calendar", "Holidays", a.L["Holidays"], {423}, a.L["Love is in the Air"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Calendar", "Holidays", { 141, 181, 201, 324, 327, 341, 372, 398, 404, 409, 423 });
    KrowiAF_RegisterEventOptions("Calendar", "Other", a.L["Other"], {374}, a.L["Darkmoon Faire"]);
    KrowiAF_RegisterDeSelectAllEventOptions("Calendar", "Other", { 374 });
end