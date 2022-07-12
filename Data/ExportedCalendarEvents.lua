-- [[ Exported at 2022-07-01 10-05-01 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local objects = addon.Objects;
local event = objects.Event;
local data = addon.Data;
data.ExportedCalendarEvents = {};
local exportedCalendarEvents = data.ExportedCalendarEvents;

function exportedCalendarEvents.Load(e)
    for i, _ in next, e do
        e[i] = nil;
    end

    e[141] = event:New(141, 236705); -- Feast of Winter Veil
    e[181] = event:New(181, 237000); -- Noblegarden
    e[201] = event:New(201, 134508); -- Children's Week
    e[324] = event:New(324, 236552); -- Hallow's End
    e[327] = event:New(327, 236704); -- Lunar Festival
    e[341] = event:New(341, 135268); -- Midsummer Fire Festival
    e[372] = event:New(372, 236701); -- Brewfest
    e[398] = event:New(398, 133168); -- Pirates' Day
    e[404] = event:New(404, 250626); -- Pilgrim's Bounty
    e[409] = event:New(409, 237272); -- Day of the Dead
    e[423] = event:New(423, 236709); -- Love is in the Air
    e[479] = event:New(479, 134481); -- Darkmoon Faire
    e[1262] = event:New(1262, 133783); -- WoW's 18th Anniversary
end

function exportedCalendarEvents.LoadCategories(e, a)
    if e[141] == nil or e[181] == nil or e[201] == nil or e[324] == nil or e[327] == nil or e[341] == nil or e[372] == nil or e[398] == nil or e[404] == nil or e[409] == nil or e[423] == nil or e[479] == nil or e[1262] == nil then
        exportedCalendarEvents.Load(e);
    end

    e[141].Category = addon.Tabs["Events"].Categories[2].Children[11]; -- Winter Veil
    e[181].Category = addon.Tabs["Events"].Categories[2].Children[3]; -- Noblegarden
    e[201].Category = addon.Tabs["Events"].Categories[2].Children[4]; -- Children's Week
    e[324].Category = addon.Tabs["Events"].Categories[2].Children[8]; -- Hallow's End
    e[327].Category = addon.Tabs["Events"].Categories[2].Children[1]; -- Lunar Festival
    e[341].Category = addon.Tabs["Events"].Categories[2].Children[5]; -- Midsummer
    e[372].Category = addon.Tabs["Events"].Categories[2].Children[7]; -- Brewfest
    e[398].Category = addon.Tabs["Events"].Categories[2].Children[6]; -- Pirates' Day
    e[404].Category = addon.Tabs["Events"].Categories[2].Children[10]; -- Pilgrim's Bounty
    e[409].Category = addon.Tabs["Events"].Categories[2].Children[9]; -- Day of the Dead
    e[423].Category = addon.Tabs["Events"].Categories[2].Children[2]; -- Love is in the Air
    e[479].Category = addon.Tabs["Events"].Categories[4]; -- Darkmoon Faire
    e[1262].Category = addon.Tabs["Events"].Categories[3]; -- WoW's Anniversary
end

function exportedCalendarEvents.InjectOptions()
    local defaults = {};
    defaults[141] = true;
    defaults[181] = true;
    defaults[201] = true;
    defaults[324] = true;
    defaults[327] = true;
    defaults[341] = true;
    defaults[372] = true;
    defaults[398] = true;
    defaults[404] = true;
    defaults[409] = true;
    defaults[423] = true;
    defaults[479] = true;
    defaults[1262] = true;

    addon.Options.InjectDefaults(defaults, "CalendarEvents", "EventReminders");

    local optionsTable = {
        order = 2, type = "group",
        name = addon.L["Calendar Events"],
        args = {
            E141 = {
                order = 1, type = "toggle",
                name = addon.L["Feast of Winter Veil"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.CalendarEvents[141]; end,
                set = function()
                    addon.Options.db.EventReminders.CalendarEvents[141] = not addon.Options.db.EventReminders.CalendarEvents[141];
                    diagnostics.Debug(addon.L["Feast of Winter Veil"], addon.Options.db.EventReminders.CalendarEvents[141]);
                end
            },
            E181 = {
                order = 2, type = "toggle",
                name = addon.L["Noblegarden"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.CalendarEvents[181]; end,
                set = function()
                    addon.Options.db.EventReminders.CalendarEvents[181] = not addon.Options.db.EventReminders.CalendarEvents[181];
                    diagnostics.Debug(addon.L["Noblegarden"], addon.Options.db.EventReminders.CalendarEvents[181]);
                end
            },
            E201 = {
                order = 3, type = "toggle",
                name = addon.L["Children's Week"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.CalendarEvents[201]; end,
                set = function()
                    addon.Options.db.EventReminders.CalendarEvents[201] = not addon.Options.db.EventReminders.CalendarEvents[201];
                    diagnostics.Debug(addon.L["Children's Week"], addon.Options.db.EventReminders.CalendarEvents[201]);
                end
            },
            E324 = {
                order = 4, type = "toggle",
                name = addon.L["Hallow's End"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.CalendarEvents[324]; end,
                set = function()
                    addon.Options.db.EventReminders.CalendarEvents[324] = not addon.Options.db.EventReminders.CalendarEvents[324];
                    diagnostics.Debug(addon.L["Hallow's End"], addon.Options.db.EventReminders.CalendarEvents[324]);
                end
            },
            E327 = {
                order = 5, type = "toggle",
                name = addon.L["Lunar Festival"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.CalendarEvents[327]; end,
                set = function()
                    addon.Options.db.EventReminders.CalendarEvents[327] = not addon.Options.db.EventReminders.CalendarEvents[327];
                    diagnostics.Debug(addon.L["Lunar Festival"], addon.Options.db.EventReminders.CalendarEvents[327]);
                end
            },
            E341 = {
                order = 6, type = "toggle",
                name = addon.L["Midsummer Fire Festival"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.CalendarEvents[341]; end,
                set = function()
                    addon.Options.db.EventReminders.CalendarEvents[341] = not addon.Options.db.EventReminders.CalendarEvents[341];
                    diagnostics.Debug(addon.L["Midsummer Fire Festival"], addon.Options.db.EventReminders.CalendarEvents[341]);
                end
            },
            E372 = {
                order = 7, type = "toggle",
                name = addon.L["Brewfest"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.CalendarEvents[372]; end,
                set = function()
                    addon.Options.db.EventReminders.CalendarEvents[372] = not addon.Options.db.EventReminders.CalendarEvents[372];
                    diagnostics.Debug(addon.L["Brewfest"], addon.Options.db.EventReminders.CalendarEvents[372]);
                end
            },
            E398 = {
                order = 8, type = "toggle",
                name = addon.L["Pirates' Day"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.CalendarEvents[398]; end,
                set = function()
                    addon.Options.db.EventReminders.CalendarEvents[398] = not addon.Options.db.EventReminders.CalendarEvents[398];
                    diagnostics.Debug(addon.L["Pirates' Day"], addon.Options.db.EventReminders.CalendarEvents[398]);
                end
            },
            E404 = {
                order = 9, type = "toggle",
                name = addon.L["Pilgrim's Bounty"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.CalendarEvents[404]; end,
                set = function()
                    addon.Options.db.EventReminders.CalendarEvents[404] = not addon.Options.db.EventReminders.CalendarEvents[404];
                    diagnostics.Debug(addon.L["Pilgrim's Bounty"], addon.Options.db.EventReminders.CalendarEvents[404]);
                end
            },
            E409 = {
                order = 10, type = "toggle",
                name = addon.L["Day of the Dead"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.CalendarEvents[409]; end,
                set = function()
                    addon.Options.db.EventReminders.CalendarEvents[409] = not addon.Options.db.EventReminders.CalendarEvents[409];
                    diagnostics.Debug(addon.L["Day of the Dead"], addon.Options.db.EventReminders.CalendarEvents[409]);
                end
            },
            E423 = {
                order = 11, type = "toggle",
                name = addon.L["Love is in the Air"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.CalendarEvents[423]; end,
                set = function()
                    addon.Options.db.EventReminders.CalendarEvents[423] = not addon.Options.db.EventReminders.CalendarEvents[423];
                    diagnostics.Debug(addon.L["Love is in the Air"], addon.Options.db.EventReminders.CalendarEvents[423]);
                end
            },
            E479 = {
                order = 12, type = "toggle",
                name = addon.L["Darkmoon Faire"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.CalendarEvents[479]; end,
                set = function()
                    addon.Options.db.EventReminders.CalendarEvents[479] = not addon.Options.db.EventReminders.CalendarEvents[479];
                    diagnostics.Debug(addon.L["Darkmoon Faire"], addon.Options.db.EventReminders.CalendarEvents[479]);
                end
            },
            E1262 = {
                order = 13, type = "toggle",
                name = addon.L["WoW's 18th Anniversary"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.CalendarEvents[1262]; end,
                set = function()
                    addon.Options.db.EventReminders.CalendarEvents[1262] = not addon.Options.db.EventReminders.CalendarEvents[1262];
                    diagnostics.Debug(addon.L["WoW's 18th Anniversary"], addon.Options.db.EventReminders.CalendarEvents[1262]);
                end
            },
            Blank14 = {order = 14, type = "description", width = "full", name = ""},
            Blank15 = {order = 15, type = "description", width = "normal", name = ""},
            SelectAll16 = {
                order = 16, type = "execute",
                name = addon.L["Select All"],
                func = function()
                    addon.Options.db.EventReminders.CalendarEvents[141] = true;
                    addon.Options.db.EventReminders.CalendarEvents[181] = true;
                    addon.Options.db.EventReminders.CalendarEvents[201] = true;
                    addon.Options.db.EventReminders.CalendarEvents[324] = true;
                    addon.Options.db.EventReminders.CalendarEvents[327] = true;
                    addon.Options.db.EventReminders.CalendarEvents[341] = true;
                    addon.Options.db.EventReminders.CalendarEvents[372] = true;
                    addon.Options.db.EventReminders.CalendarEvents[398] = true;
                    addon.Options.db.EventReminders.CalendarEvents[404] = true;
                    addon.Options.db.EventReminders.CalendarEvents[409] = true;
                    addon.Options.db.EventReminders.CalendarEvents[423] = true;
                    addon.Options.db.EventReminders.CalendarEvents[479] = true;
                    addon.Options.db.EventReminders.CalendarEvents[1262] = true;
                end
            },
            DeselectAll17 = {
                order = 17, type = "execute",
                name = addon.L["Deselect All"],
                func = function()
                    addon.Options.db.EventReminders.CalendarEvents[141] = false;
                    addon.Options.db.EventReminders.CalendarEvents[181] = false;
                    addon.Options.db.EventReminders.CalendarEvents[201] = false;
                    addon.Options.db.EventReminders.CalendarEvents[324] = false;
                    addon.Options.db.EventReminders.CalendarEvents[327] = false;
                    addon.Options.db.EventReminders.CalendarEvents[341] = false;
                    addon.Options.db.EventReminders.CalendarEvents[372] = false;
                    addon.Options.db.EventReminders.CalendarEvents[398] = false;
                    addon.Options.db.EventReminders.CalendarEvents[404] = false;
                    addon.Options.db.EventReminders.CalendarEvents[409] = false;
                    addon.Options.db.EventReminders.CalendarEvents[423] = false;
                    addon.Options.db.EventReminders.CalendarEvents[479] = false;
                    addon.Options.db.EventReminders.CalendarEvents[1262] = false;
                end
            },
        }
    };

    addon.Options.InjectOptionsTable(optionsTable, "CalendarEvents", "EventReminders", "args");
end

