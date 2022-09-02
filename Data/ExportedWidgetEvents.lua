-- [[ Exported at 2022-08-31 18-43-06 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local objects = addon.Objects;
local event = objects.Event;
local data = addon.Data;
data.ExportedWidgetEvents = {};
local exportedWidgetEvents = data.ExportedWidgetEvents;

function exportedWidgetEvents.Load(e)
    if addon.IsWrathClassic() then
        return;
    end

    for i, _ in next, e do
        e[i] = nil;
    end

    e[2924] = event:New(2924, 3642306, addon.L["Soulforges"], nil, 604800); -- Soulforges
    e[2925] = event:New(2925, 3642306, addon.L["Fracture Chambers"], nil, 604800); -- Fracture Chambers
    e[2926] = event:New(2926, 3642306, addon.L["Skoldus Hall"], nil, 604800); -- Skoldus Hall
    e[2927] = event:New(2927, 3642306, addon.L["Coldheart Interstitia"], nil, 604800); -- Coldheart Interstitia
    e[2928] = event:New(2928, 3642306, addon.L["Mort'regar"], nil, 604800); -- Mort'regar
    e[2929] = event:New(2929, 3642306, addon.L["Upper Reaches"], nil, 604800); -- Upper Reaches
end

function exportedWidgetEvents.LoadCategories(e, a)
    if addon.IsWrathClassic() then
        return;
    end

    if e[2924] == nil or e[2925] == nil or e[2926] == nil or e[2927] == nil or e[2928] == nil or e[2929] == nil then
        exportedWidgetEvents.Load(e);
    end

    e[2924].Category = addon.Tabs["Expansions"].Categories[13].Children[6]; -- Torghast
    e[2925].Category = addon.Tabs["Expansions"].Categories[13].Children[6]; -- Torghast
    e[2926].Category = addon.Tabs["Expansions"].Categories[13].Children[6]; -- Torghast
    e[2927].Category = addon.Tabs["Expansions"].Categories[13].Children[6]; -- Torghast
    e[2928].Category = addon.Tabs["Expansions"].Categories[13].Children[6]; -- Torghast
    e[2929].Category = addon.Tabs["Expansions"].Categories[13].Children[6]; -- Torghast
end

function exportedWidgetEvents.InjectOptions()
    if addon.IsWrathClassic() then
        return;
    end

    local defaults = {};
    defaults[2924] = false;
    defaults[2925] = false;
    defaults[2926] = false;
    defaults[2927] = false;
    defaults[2928] = false;
    defaults[2929] = false;

    addon.Options.InjectDefaults(defaults, "WidgetEvents", "EventReminders");

    local optionsTable = {
        order = 3, type = "group",
        name = addon.L["Widget Events"],
        args = {
            Torghast = {
                order = 1, type = "header",
                name = addon.L["Torghast"]
            },
            E2924 = {
                order = 2, type = "toggle",
                name = addon.L["Soulforges"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.WidgetEvents[2924]; end,
                set = function()
                    addon.Options.db.EventReminders.WidgetEvents[2924] = not addon.Options.db.EventReminders.WidgetEvents[2924];
                    diagnostics.Debug(addon.L["Soulforges"], addon.Options.db.EventReminders.WidgetEvents[2924]);
                end
            },
            E2925 = {
                order = 3, type = "toggle",
                name = addon.L["Fracture Chambers"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.WidgetEvents[2925]; end,
                set = function()
                    addon.Options.db.EventReminders.WidgetEvents[2925] = not addon.Options.db.EventReminders.WidgetEvents[2925];
                    diagnostics.Debug(addon.L["Fracture Chambers"], addon.Options.db.EventReminders.WidgetEvents[2925]);
                end
            },
            E2926 = {
                order = 4, type = "toggle",
                name = addon.L["Skoldus Hall"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.WidgetEvents[2926]; end,
                set = function()
                    addon.Options.db.EventReminders.WidgetEvents[2926] = not addon.Options.db.EventReminders.WidgetEvents[2926];
                    diagnostics.Debug(addon.L["Skoldus Hall"], addon.Options.db.EventReminders.WidgetEvents[2926]);
                end
            },
            E2927 = {
                order = 5, type = "toggle",
                name = addon.L["Coldheart Interstitia"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.WidgetEvents[2927]; end,
                set = function()
                    addon.Options.db.EventReminders.WidgetEvents[2927] = not addon.Options.db.EventReminders.WidgetEvents[2927];
                    diagnostics.Debug(addon.L["Coldheart Interstitia"], addon.Options.db.EventReminders.WidgetEvents[2927]);
                end
            },
            E2928 = {
                order = 6, type = "toggle",
                name = addon.L["Mort'regar"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.WidgetEvents[2928]; end,
                set = function()
                    addon.Options.db.EventReminders.WidgetEvents[2928] = not addon.Options.db.EventReminders.WidgetEvents[2928];
                    diagnostics.Debug(addon.L["Mort'regar"], addon.Options.db.EventReminders.WidgetEvents[2928]);
                end
            },
            E2929 = {
                order = 7, type = "toggle",
                name = addon.L["Upper Reaches"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.EventReminders.WidgetEvents[2929]; end,
                set = function()
                    addon.Options.db.EventReminders.WidgetEvents[2929] = not addon.Options.db.EventReminders.WidgetEvents[2929];
                    diagnostics.Debug(addon.L["Upper Reaches"], addon.Options.db.EventReminders.WidgetEvents[2929]);
                end
            },
            Blank8 = {order = 8, type = "description", width = "full", name = ""},
            Blank9 = {order = 9, type = "description", width = "normal", name = ""},
            SelectAll10 = {
                order = 10, type = "execute",
                name = addon.L["Select All"],
                func = function()
                    addon.Options.db.EventReminders.WidgetEvents[2924] = true;
                    addon.Options.db.EventReminders.WidgetEvents[2925] = true;
                    addon.Options.db.EventReminders.WidgetEvents[2926] = true;
                    addon.Options.db.EventReminders.WidgetEvents[2927] = true;
                    addon.Options.db.EventReminders.WidgetEvents[2928] = true;
                    addon.Options.db.EventReminders.WidgetEvents[2929] = true;
                end
            },
            DeselectAll11 = {
                order = 11, type = "execute",
                name = addon.L["Deselect All"],
                func = function()
                    addon.Options.db.EventReminders.WidgetEvents[2924] = false;
                    addon.Options.db.EventReminders.WidgetEvents[2925] = false;
                    addon.Options.db.EventReminders.WidgetEvents[2926] = false;
                    addon.Options.db.EventReminders.WidgetEvents[2927] = false;
                    addon.Options.db.EventReminders.WidgetEvents[2928] = false;
                    addon.Options.db.EventReminders.WidgetEvents[2929] = false;
                end
            },
            Blank12 = {order = 12, type = "description", width = "full", name = ""},
            Blank13 = {order = 13, type = "description", width = "double", name = ""},
            RefreshEvents14 = {
                order = 14, type = "execute",
                name = addon.L["Refresh Events"],
                desc = addon.L["Requires a reload"],
                func = function()
                    EventDetails.WidgetEvents = nil;
                    addon.EventData.Load();
                end
            },
        }
    };

    addon.Options.InjectOptionsTable(optionsTable, "WidgetEvents", "EventReminders", "args");
end

