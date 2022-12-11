-- [[ Exported at 2022-12-11 18-14-39 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local objects = addon.Objects;
local event = objects.Event;
local widthMultiplier = addon.Options.WidthMultiplier;
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
    e[374] = event:New(374, 134481); -- Darkmoon Faire
    e[398] = event:New(398, 133168); -- Pirates' Day
    e[404] = event:New(404, 250626); -- Pilgrim's Bounty
    e[409] = event:New(409, 237272); -- Day of the Dead
    e[423] = event:New(423, 236709); -- Love is in the Air
end

function exportedCalendarEvents.LoadCategories(e)
    if e[141] == nil or e[181] == nil or e[201] == nil or e[324] == nil or e[327] == nil or e[341] == nil or e[372] == nil or e[374] == nil or e[398] == nil or e[404] == nil or e[409] == nil or e[423] == nil then
        exportedCalendarEvents.Load(e);
    end

    e[141].Category = addon.Tabs["Events"].Categories[5].Children[11]; -- Winter Veil
    e[181].Category = addon.Tabs["Events"].Categories[5].Children[3]; -- Noblegarden
    e[201].Category = addon.Tabs["Events"].Categories[5].Children[4]; -- Children's Week
    e[324].Category = addon.Tabs["Events"].Categories[5].Children[8]; -- Hallow's End
    e[327].Category = addon.Tabs["Events"].Categories[5].Children[1]; -- Lunar Festival
    e[341].Category = addon.Tabs["Events"].Categories[5].Children[5]; -- Midsummer
    e[372].Category = addon.Tabs["Events"].Categories[5].Children[7]; -- Brewfest
    e[374].Category = addon.Tabs["Events"].Categories[7]; -- Darkmoon Faire
    e[398].Category = addon.Tabs["Events"].Categories[5].Children[6]; -- Pirates' Day
    e[404].Category = addon.Tabs["Events"].Categories[5].Children[10]; -- Pilgrim's Bounty
    e[409].Category = addon.Tabs["Events"].Categories[5].Children[9]; -- Day of the Dead
    e[423].Category = addon.Tabs["Events"].Categories[5].Children[2]; -- Love is in the Air
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
    defaults[374] = true;
    defaults[398] = true;
    defaults[404] = true;
    defaults[409] = true;
    defaults[423] = true;

    addon.Options.InjectDefaults(defaults, "CalendarEvents", "EventReminders");

    local optionsTable = {
        order = 2, type = "group",
        name = addon.L["Calendar Events"],
        args = {
            Holidays = {
                order = 1, type = "group",
                name = addon.L["Holidays"],
                args = {
                    E141 = {
                        order = 2, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Feast of Winter Veil"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[141]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[141] = not addon.Options.db.EventReminders.CalendarEvents[141];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Feast of Winter Veil"], addon.Options.db.EventReminders.CalendarEvents[141]);
                        end
                    },
                    E181 = {
                        order = 3, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Noblegarden"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[181]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[181] = not addon.Options.db.EventReminders.CalendarEvents[181];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Noblegarden"], addon.Options.db.EventReminders.CalendarEvents[181]);
                        end
                    },
                    E201 = {
                        order = 4, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Children's Week"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[201]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[201] = not addon.Options.db.EventReminders.CalendarEvents[201];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Children's Week"], addon.Options.db.EventReminders.CalendarEvents[201]);
                        end
                    },
                    E324 = {
                        order = 5, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Hallow's End"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[324]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[324] = not addon.Options.db.EventReminders.CalendarEvents[324];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Hallow's End"], addon.Options.db.EventReminders.CalendarEvents[324]);
                        end
                    },
                    E327 = {
                        order = 6, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Lunar Festival"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[327]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[327] = not addon.Options.db.EventReminders.CalendarEvents[327];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Lunar Festival"], addon.Options.db.EventReminders.CalendarEvents[327]);
                        end
                    },
                    E341 = {
                        order = 7, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Midsummer Fire Festival"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[341]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[341] = not addon.Options.db.EventReminders.CalendarEvents[341];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Midsummer Fire Festival"], addon.Options.db.EventReminders.CalendarEvents[341]);
                        end
                    },
                    E372 = {
                        order = 8, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Brewfest"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[372]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[372] = not addon.Options.db.EventReminders.CalendarEvents[372];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Brewfest"], addon.Options.db.EventReminders.CalendarEvents[372]);
                        end
                    },
                    E398 = {
                        order = 9, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Pirates' Day"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[398]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[398] = not addon.Options.db.EventReminders.CalendarEvents[398];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Pirates' Day"], addon.Options.db.EventReminders.CalendarEvents[398]);
                        end
                    },
                    E404 = {
                        order = 10, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Pilgrim's Bounty"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[404]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[404] = not addon.Options.db.EventReminders.CalendarEvents[404];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Pilgrim's Bounty"], addon.Options.db.EventReminders.CalendarEvents[404]);
                        end
                    },
                    E409 = {
                        order = 11, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Day of the Dead"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[409]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[409] = not addon.Options.db.EventReminders.CalendarEvents[409];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Day of the Dead"], addon.Options.db.EventReminders.CalendarEvents[409]);
                        end
                    },
                    E423 = {
                        order = 12, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Love is in the Air"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[423]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[423] = not addon.Options.db.EventReminders.CalendarEvents[423];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Love is in the Air"], addon.Options.db.EventReminders.CalendarEvents[423]);
                        end
                    },
                    Blank13 = {order = 13, type = "description", width = "full", name = ""},
                    SelectAll14 = {
                        order = 14, type = "execute", width = 1 * widthMultiplier,
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
                        end
                    },
                    DeselectAll15 = {
                        order = 15, type = "execute",
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
                        end
                    },
                }
            },
            Other = {
                order = 16, type = "group",
                name = addon.L["Other"],
                args = {
                    E374 = {
                        order = 17, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Darkmoon Faire"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[374]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[374] = not addon.Options.db.EventReminders.CalendarEvents[374];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Darkmoon Faire"], addon.Options.db.EventReminders.CalendarEvents[374]);
                        end
                    },
                    Blank18 = {order = 18, type = "description", width = "full", name = ""},
                    SelectAll19 = {
                        order = 19, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.CalendarEvents[374] = true;
                        end
                    },
                    DeselectAll20 = {
                        order = 20, type = "execute",
                        name = addon.L["Deselect All"],
                        func = function()
                            addon.Options.db.EventReminders.CalendarEvents[374] = false;
                        end
                    },
                }
            },
        }
    };

    addon.Options.InjectOptionsTable(optionsTable, "CalendarEvents", "EventReminders", "args");
end

