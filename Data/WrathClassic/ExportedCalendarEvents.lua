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

-- [[ Exported at 2023-12-25 15-48-20 ]] --
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
    KrowiAF_RegisterEventOptions("Calendar", {141}, a.L["Feast of Winter Veil"], a.L["Holidays"], 1);
    KrowiAF_RegisterEventOptions("Calendar", {181}, a.L["Noblegarden"], a.L["Holidays"], 1);
    KrowiAF_RegisterEventOptions("Calendar", {201}, a.L["Children's Week"], a.L["Holidays"], 1);
    KrowiAF_RegisterEventOptions("Calendar", {324}, a.L["Hallow's End"], a.L["Holidays"], 1);
    KrowiAF_RegisterEventOptions("Calendar", {327}, a.L["Lunar Festival"], a.L["Holidays"], 1);
    KrowiAF_RegisterEventOptions("Calendar", {341}, a.L["Midsummer Fire Festival"], a.L["Holidays"], 1);
    KrowiAF_RegisterEventOptions("Calendar", {372}, a.L["Brewfest"], a.L["Holidays"], 1);
    KrowiAF_RegisterEventOptions("Calendar", {398}, a.L["Pirates' Day"], a.L["Holidays"], 1);
    KrowiAF_RegisterEventOptions("Calendar", {404}, a.L["Pilgrim's Bounty"], a.L["Holidays"], 1);
    KrowiAF_RegisterEventOptions("Calendar", {409}, a.L["Day of the Dead"], a.L["Holidays"], 1);
    KrowiAF_RegisterEventOptions("Calendar", {423}, a.L["Love is in the Air"], a.L["Holidays"], 1);
    KrowiAF_RegisterDeSelectAllEventOptions("Calendar", {141, 181, 201, 324, 327, 341, 372, 398, 404, 409, 423}, a.L["Holidays"]);
    KrowiAF_RegisterEventOptions("Calendar", {374}, a.L["Darkmoon Faire"], a.L["Other"], 2);
    KrowiAF_RegisterDeSelectAllEventOptions("Calendar", {374}, a.L["Other"]);
end