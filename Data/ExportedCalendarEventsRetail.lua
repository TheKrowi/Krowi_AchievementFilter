-- [[ Exported at 2022-11-19 18-21-55 ]] --
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
    e[398] = event:New(398, 133168); -- Pirates' Day
    e[404] = event:New(404, 250626); -- Pilgrim's Bounty
    e[409] = event:New(409, 237272); -- Day of the Dead
    e[423] = event:New(423, 236709); -- Love is in the Air
    e[479] = event:New(479, 134481); -- Darkmoon Faire
    e[1262] = event:New(1262, 133783); -- WoW's 18th Anniversary
    e[1315] = event:New(1315, 3614361); -- Fated Raids: Castle Nathria (US)
    e[1316] = event:New(1316, 4254074); -- Fated Raids: Sepulcher of the First Ones (US)
    e[1317] = event:New(1317, 4062765); -- Fated Raids: Sanctum of Domination (US)
    e[1325] = event:New(1325, 3614361); -- Fated Raids: Castle Nathria (EU)
    e[1326] = event:New(1326, 3614361); -- Fated Raids: Castle Nathria (CN)
    e[1328] = event:New(1328, 4062765); -- Fated Raids: Sanctum of Domination (EU)
    e[1329] = event:New(1329, 4062765); -- Fated Raids: Sanctum of Domination (CN)
    e[1331] = event:New(1331, 4254074); -- Fated Raids: Sepulcher of the First Ones (EU)
    e[1332] = event:New(1332, 4254074); -- Fated Raids: Sepulcher of the First Ones (CN)
end

function exportedCalendarEvents.LoadCategories(e)
    if e[141] == nil or e[181] == nil or e[201] == nil or e[324] == nil or e[327] == nil or e[341] == nil or e[372] == nil or e[398] == nil or e[404] == nil or e[409] == nil or e[423] == nil or e[479] == nil or e[1262] == nil or e[1315] == nil or e[1316] == nil or e[1317] == nil or e[1325] == nil or e[1326] == nil or e[1328] == nil or e[1329] == nil or e[1331] == nil or e[1332] == nil then
        exportedCalendarEvents.Load(e);
    end

    e[141].Category = addon.Tabs["Events"].Categories[5].Children[11]; -- Winter Veil
    e[181].Category = addon.Tabs["Events"].Categories[5].Children[3]; -- Noblegarden
    e[201].Category = addon.Tabs["Events"].Categories[5].Children[4]; -- Children's Week
    e[324].Category = addon.Tabs["Events"].Categories[5].Children[8]; -- Hallow's End
    e[327].Category = addon.Tabs["Events"].Categories[5].Children[1]; -- Lunar Festival
    e[341].Category = addon.Tabs["Events"].Categories[5].Children[5]; -- Midsummer
    e[372].Category = addon.Tabs["Events"].Categories[5].Children[7]; -- Brewfest
    e[398].Category = addon.Tabs["Events"].Categories[5].Children[6]; -- Pirates' Day
    e[404].Category = addon.Tabs["Events"].Categories[5].Children[10]; -- Pilgrim's Bounty
    e[409].Category = addon.Tabs["Events"].Categories[5].Children[9]; -- Day of the Dead
    e[423].Category = addon.Tabs["Events"].Categories[5].Children[2]; -- Love is in the Air
    e[479].Category = addon.Tabs["Events"].Categories[7]; -- Darkmoon Faire
    e[1262].Category = addon.Tabs["Events"].Categories[6]; -- WoW's Anniversary
    e[1315].Category = addon.Tabs["Events"].Categories[11].Children[2].Children[1]; -- Castle Nathria
    e[1316].Category = addon.Tabs["Events"].Categories[11].Children[2].Children[3]; -- Sepulcher of the First Ones
    e[1317].Category = addon.Tabs["Events"].Categories[11].Children[2].Children[2]; -- Sanctum of Domination
    e[1325].Category = addon.Tabs["Events"].Categories[11].Children[2].Children[1]; -- Castle Nathria
    e[1326].Category = addon.Tabs["Events"].Categories[11].Children[2].Children[1]; -- Castle Nathria
    e[1328].Category = addon.Tabs["Events"].Categories[11].Children[2].Children[2]; -- Sanctum of Domination
    e[1329].Category = addon.Tabs["Events"].Categories[11].Children[2].Children[2]; -- Sanctum of Domination
    e[1331].Category = addon.Tabs["Events"].Categories[11].Children[2].Children[3]; -- Sepulcher of the First Ones
    e[1332].Category = addon.Tabs["Events"].Categories[11].Children[2].Children[3]; -- Sepulcher of the First Ones
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
    defaults[1315] = true;
    defaults[1316] = true;
    defaults[1317] = true;
    defaults[1325] = true;
    defaults[1326] = true;
    defaults[1328] = true;
    defaults[1329] = true;
    defaults[1331] = true;
    defaults[1332] = true;

    addon.Options.InjectDefaults(defaults, "CalendarEvents", "EventReminders");

    local optionsTable = {
        order = 2, type = "group",
        name = addon.L["Calendar Events"],
        args = {
            Fated_Raids = {
                order = 1, type = "group",
                name = addon.L["Fated Raids"],
                args = {
                    E1315 = {
                        order = 2, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Fated Raids: Castle Nathria (US)"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[1315]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[1315] = not addon.Options.db.EventReminders.CalendarEvents[1315];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Fated Raids: Castle Nathria (US)"], addon.Options.db.EventReminders.CalendarEvents[1315]);
                        end
                    },
                    E1316 = {
                        order = 3, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Fated Raids: Sepulcher of the First Ones (US)"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[1316]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[1316] = not addon.Options.db.EventReminders.CalendarEvents[1316];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Fated Raids: Sepulcher of the First Ones (US)"], addon.Options.db.EventReminders.CalendarEvents[1316]);
                        end
                    },
                    E1317 = {
                        order = 4, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Fated Raids: Sanctum of Domination (US)"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[1317]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[1317] = not addon.Options.db.EventReminders.CalendarEvents[1317];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Fated Raids: Sanctum of Domination (US)"], addon.Options.db.EventReminders.CalendarEvents[1317]);
                        end
                    },
                    E1325 = {
                        order = 5, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Fated Raids: Castle Nathria (EU)"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[1325]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[1325] = not addon.Options.db.EventReminders.CalendarEvents[1325];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Fated Raids: Castle Nathria (EU)"], addon.Options.db.EventReminders.CalendarEvents[1325]);
                        end
                    },
                    E1326 = {
                        order = 6, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Fated Raids: Castle Nathria (CN)"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[1326]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[1326] = not addon.Options.db.EventReminders.CalendarEvents[1326];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Fated Raids: Castle Nathria (CN)"], addon.Options.db.EventReminders.CalendarEvents[1326]);
                        end
                    },
                    E1328 = {
                        order = 7, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Fated Raids: Sanctum of Domination (EU)"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[1328]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[1328] = not addon.Options.db.EventReminders.CalendarEvents[1328];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Fated Raids: Sanctum of Domination (EU)"], addon.Options.db.EventReminders.CalendarEvents[1328]);
                        end
                    },
                    E1329 = {
                        order = 8, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Fated Raids: Sanctum of Domination (CN)"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[1329]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[1329] = not addon.Options.db.EventReminders.CalendarEvents[1329];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Fated Raids: Sanctum of Domination (CN)"], addon.Options.db.EventReminders.CalendarEvents[1329]);
                        end
                    },
                    E1331 = {
                        order = 9, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Fated Raids: Sepulcher of the First Ones (EU)"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[1331]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[1331] = not addon.Options.db.EventReminders.CalendarEvents[1331];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Fated Raids: Sepulcher of the First Ones (EU)"], addon.Options.db.EventReminders.CalendarEvents[1331]);
                        end
                    },
                    E1332 = {
                        order = 10, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Fated Raids: Sepulcher of the First Ones (CN)"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[1332]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[1332] = not addon.Options.db.EventReminders.CalendarEvents[1332];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Fated Raids: Sepulcher of the First Ones (CN)"], addon.Options.db.EventReminders.CalendarEvents[1332]);
                        end
                    },
                    Blank11 = {order = 11, type = "description", width = "full", name = ""},
                    SelectAll12 = {
                        order = 12, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.CalendarEvents[1315] = true;
                            addon.Options.db.EventReminders.CalendarEvents[1316] = true;
                            addon.Options.db.EventReminders.CalendarEvents[1317] = true;
                            addon.Options.db.EventReminders.CalendarEvents[1325] = true;
                            addon.Options.db.EventReminders.CalendarEvents[1326] = true;
                            addon.Options.db.EventReminders.CalendarEvents[1328] = true;
                            addon.Options.db.EventReminders.CalendarEvents[1329] = true;
                            addon.Options.db.EventReminders.CalendarEvents[1331] = true;
                            addon.Options.db.EventReminders.CalendarEvents[1332] = true;
                        end
                    },
                    DeselectAll13 = {
                        order = 13, type = "execute",
                        name = addon.L["Deselect All"],
                        func = function()
                            addon.Options.db.EventReminders.CalendarEvents[1315] = false;
                            addon.Options.db.EventReminders.CalendarEvents[1316] = false;
                            addon.Options.db.EventReminders.CalendarEvents[1317] = false;
                            addon.Options.db.EventReminders.CalendarEvents[1325] = false;
                            addon.Options.db.EventReminders.CalendarEvents[1326] = false;
                            addon.Options.db.EventReminders.CalendarEvents[1328] = false;
                            addon.Options.db.EventReminders.CalendarEvents[1329] = false;
                            addon.Options.db.EventReminders.CalendarEvents[1331] = false;
                            addon.Options.db.EventReminders.CalendarEvents[1332] = false;
                        end
                    },
                }
            },
            Holidays = {
                order = 14, type = "group",
                name = addon.L["Holidays"],
                args = {
                    E141 = {
                        order = 15, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Feast of Winter Veil"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[141]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[141] = not addon.Options.db.EventReminders.CalendarEvents[141];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Feast of Winter Veil"], addon.Options.db.EventReminders.CalendarEvents[141]);
                        end
                    },
                    E181 = {
                        order = 16, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Noblegarden"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[181]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[181] = not addon.Options.db.EventReminders.CalendarEvents[181];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Noblegarden"], addon.Options.db.EventReminders.CalendarEvents[181]);
                        end
                    },
                    E201 = {
                        order = 17, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Children's Week"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[201]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[201] = not addon.Options.db.EventReminders.CalendarEvents[201];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Children's Week"], addon.Options.db.EventReminders.CalendarEvents[201]);
                        end
                    },
                    E324 = {
                        order = 18, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Hallow's End"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[324]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[324] = not addon.Options.db.EventReminders.CalendarEvents[324];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Hallow's End"], addon.Options.db.EventReminders.CalendarEvents[324]);
                        end
                    },
                    E327 = {
                        order = 19, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Lunar Festival"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[327]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[327] = not addon.Options.db.EventReminders.CalendarEvents[327];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Lunar Festival"], addon.Options.db.EventReminders.CalendarEvents[327]);
                        end
                    },
                    E341 = {
                        order = 20, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Midsummer Fire Festival"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[341]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[341] = not addon.Options.db.EventReminders.CalendarEvents[341];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Midsummer Fire Festival"], addon.Options.db.EventReminders.CalendarEvents[341]);
                        end
                    },
                    E372 = {
                        order = 21, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Brewfest"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[372]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[372] = not addon.Options.db.EventReminders.CalendarEvents[372];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Brewfest"], addon.Options.db.EventReminders.CalendarEvents[372]);
                        end
                    },
                    E398 = {
                        order = 22, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Pirates' Day"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[398]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[398] = not addon.Options.db.EventReminders.CalendarEvents[398];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Pirates' Day"], addon.Options.db.EventReminders.CalendarEvents[398]);
                        end
                    },
                    E404 = {
                        order = 23, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Pilgrim's Bounty"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[404]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[404] = not addon.Options.db.EventReminders.CalendarEvents[404];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Pilgrim's Bounty"], addon.Options.db.EventReminders.CalendarEvents[404]);
                        end
                    },
                    E409 = {
                        order = 24, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Day of the Dead"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[409]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[409] = not addon.Options.db.EventReminders.CalendarEvents[409];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Day of the Dead"], addon.Options.db.EventReminders.CalendarEvents[409]);
                        end
                    },
                    E423 = {
                        order = 25, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Love is in the Air"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[423]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[423] = not addon.Options.db.EventReminders.CalendarEvents[423];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Love is in the Air"], addon.Options.db.EventReminders.CalendarEvents[423]);
                        end
                    },
                    Blank26 = {order = 26, type = "description", width = "full", name = ""},
                    SelectAll27 = {
                        order = 27, type = "execute", width = 1 * widthMultiplier,
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
                    DeselectAll28 = {
                        order = 28, type = "execute",
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
                order = 29, type = "group",
                name = addon.L["Other"],
                args = {
                    E479 = {
                        order = 30, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["Darkmoon Faire"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[479]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[479] = not addon.Options.db.EventReminders.CalendarEvents[479];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["Darkmoon Faire"], addon.Options.db.EventReminders.CalendarEvents[479]);
                        end
                    },
                    Blank31 = {order = 31, type = "description", width = "full", name = ""},
                    SelectAll32 = {
                        order = 32, type = "execute", width = 1 * widthMultiplier,
                        name = addon.L["Select All"],
                        func = function()
                            addon.Options.db.EventReminders.CalendarEvents[479] = true;
                        end
                    },
                    DeselectAll33 = {
                        order = 33, type = "execute",
                        name = addon.L["Deselect All"],
                        func = function()
                            addon.Options.db.EventReminders.CalendarEvents[479] = false;
                        end
                    },
                }
            },
            WoW_s_Anniversary = {
                order = 34, type = "group",
                name = addon.L["WoW's Anniversary"],
                args = {
                    E1262 = {
                        order = 35, type = "toggle", width = 1 * widthMultiplier,
                        name = addon.L["WoW's 18th Anniversary"],
                        get = function() return addon.Options.db.EventReminders.CalendarEvents[1262]; end,
                        set = function()
                            addon.Options.db.EventReminders.CalendarEvents[1262] = not addon.Options.db.EventReminders.CalendarEvents[1262];
                            addon.GUI.SideButtonSystem.Refresh();
                            diagnostics.Debug(addon.L["WoW's 18th Anniversary"], addon.Options.db.EventReminders.CalendarEvents[1262]);
                        end
                    },
            Blank36 = {order = 36, type = "description", width = "full", name = ""},
            SelectAll37 = {
                order = 37, type = "execute", width = 1 * widthMultiplier,
                name = addon.L["Select All"],
                func = function()
                    addon.Options.db.EventReminders.CalendarEvents[1262] = true;
                end
            },
            DeselectAll38 = {
                order = 38, type = "execute",
                name = addon.L["Deselect All"],
                func = function()
                    addon.Options.db.EventReminders.CalendarEvents[1262] = false;
                end
            },
                }
            },
            Blank39 = {order = 39, type = "description", width = 2 * widthMultiplier, name = ""},
            RefreshEvents40 = {
                order = 40, type = "execute", width = 1 * widthMultiplier,
                name = addon.L["Refresh Events"],
                desc = addon.L["Requires a reload"],
                func = function()
                    EventDetails.CalendarEvents = nil;
                    addon.EventData.Load();
                end
            },
        }
    };

    addon.Options.InjectOptionsTable(optionsTable, "CalendarEvents", "EventReminders", "args");
end

