-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;
options.EventReminders = {};
local eventReminders = options.EventReminders;
tinsert(options.OptionsTables, eventReminders);

local OrderPP = KrowiAF_InjectOptions.AutoOrderPlusPlus;
local AdjustedWidth = KrowiAF_InjectOptions.AdjustedWidth;

function eventReminders.RegisterOptionsTable()
    LibStub("AceConfig-3.0"):RegisterOptionsTable(options.OptionsTable.args.EventReminders.name, options.OptionsTable.args.EventReminders);
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(options.OptionsTable.args.EventReminders.name, options.OptionsTable.args.EventReminders.name, addon.MetaData.Title);
end

function eventReminders.PostLoad()

end

local timeDisplaysLine1 = {
    addon.L["End Time"],
    addon.L["Time Left"]
};

local timeDisplaysLine2 = {
    addon.L["None"],
    addon.L["End Time"],
    addon.L["Time Left"]
};

local growDirection = {
    addon.L["Up"],
    addon.L["Down"]
};

local startTimeAndEndTimeDateTimeFormats, startTimeAndEndTimeDateTimeValues = {}, {};

local function AddFormat(formats, values, format)
    tinsert(formats, format);
    tinsert(values, date(format, time()));
end

local function AddStartTimeAndEndTimeFormat(format)
    AddFormat(startTimeAndEndTimeDateTimeFormats, startTimeAndEndTimeDateTimeValues, format);
end

AddStartTimeAndEndTimeFormat(options.Defaults.profile.EventReminders.DateTimeFormat.StartTimeAndEndTime);
AddStartTimeAndEndTimeFormat(addon.L["%d/%m/%Y %I:%M %p"]);
AddStartTimeAndEndTimeFormat(addon.L["%m/%d/%Y %R"]);
AddStartTimeAndEndTimeFormat(addon.L["%m/%d/%Y %I:%M %p"]);
AddStartTimeAndEndTimeFormat(addon.L["%Y/%m/%d %R"]);
AddStartTimeAndEndTimeFormat(addon.L["%Y/%m/%d %I:%M %p"]);
AddStartTimeAndEndTimeFormat(addon.L["%c"]);
tinsert(startTimeAndEndTimeDateTimeValues, "Custom");
tinsert(startTimeAndEndTimeDateTimeFormats, addon.L["%m/%d/%Y %R"]);

local function PopUpsGrowDirectionSet(_, value)
    if addon.Options.db.EventReminders.PopUps.GrowDirection == value then return; end;
    addon.Options.db.EventReminders.PopUps.GrowDirection = value;
    addon.GUI.AlertSystem.UpdateGrowDirection();
    AlertFrame:UpdateAnchors();
end

local function PopUpsSpavingSet(_, value)
    if addon.Options.db.EventReminders.PopUps.Spacing == value then return; end;
    addon.Options.db.EventReminders.PopUps.Spacing = value;
    addon.GUI.AlertSystem.UpdateGrowDirection();
    AlertFrame:UpdateAnchors();
end

local function PopUpsOffsetXSet(_, value)
    if addon.Options.db.EventReminders.PopUps.OffsetX == value then return; end;
    addon.Options.db.EventReminders.PopUps.OffsetX = value;
    AlertFrame:ClearAllPoints();
    AlertFrame:SetPoint("BOTTOM", UIParent, "BOTTOM", addon.Options.db.EventReminders.PopUps.OffsetX, addon.Options.db.EventReminders.PopUps.OffsetY);
end

local function PopUpsOffsetYSet(_, value)
    if addon.Options.db.EventReminders.PopUps.OffsetY == value then return; end;
    addon.Options.db.EventReminders.PopUps.OffsetY = value;
    AlertFrame:ClearAllPoints();
    AlertFrame:SetPoint("BOTTOM", UIParent, "BOTTOM", addon.Options.db.EventReminders.PopUps.OffsetX, addon.Options.db.EventReminders.PopUps.OffsetY);
end

local function PopUpsShowPlaceholderFunc()
    local calendarEvents = addon.Data.CalendarEvents;
    for _, event in next, calendarEvents do
        event.EventDetails = {EndTime = time() + 60, Name = addon.L["Placeholder"]};
        addon.GUI.AlertSystem:AddAlert(event, 60);
    end
end

local function TimeDisplayLine1Set(_, value)
    if addon.Options.db.EventReminders.TimeDisplay.Line1 == value then return; end;
    addon.Options.db.EventReminders.TimeDisplay.Line1 = value;
    addon.GUI.SideButtonSystem.Refresh();
end

local function TimeDisplayLine2Set(_, value)
    if addon.Options.db.EventReminders.TimeDisplay.Line2 == value then return; end;
    addon.Options.db.EventReminders.TimeDisplay.Line2 = value;
    addon.GUI.SideButtonSystem.Refresh();
end

local function StartTimeAndEndTimePresetsGet()
    for i, format in next, startTimeAndEndTimeDateTimeFormats do
        if format == addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime then
            return i;
        end
    end
    return #startTimeAndEndTimeDateTimeFormats;
end

local function StartTimeAndEndTimeCustomSet(_, value)
    if addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime == value then return; end;
    addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime = value;
    addon.GUI.SideButtonSystem.Refresh();
end

options.OptionsTable.args["EventReminders"] = {
    type = "group", childGroups = "tab",
    name = addon.L["Event Reminders"],
    args = {
        General = {
            order = OrderPP(), type = "group",
            name = addon.L["General"],
            args = {
                Style = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Style"],
                    args = {
                        Compact = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                            name = addon.L["Compact"],
                            desc = addon.L["Compact Desc"]:AddDefaultValueText("EventReminders.Compact"):AddReloadRequired(),
                            get = function() return addon.Options.db.EventReminders.Compact; end,
                            set = function(_, value) addon.Options.db.EventReminders.Compact = value; end
                        }
                    }
                },
                TimeDisplay = {
                    order = OrderPP(), type = "group",
                    name = addon.L["Time display"],
                    inline = true,
                    args = {
                        Line1 = {
                            order = OrderPP(), type = "select", width = AdjustedWidth(1.45),
                            name = addon.L["Line"] .. " 1",
                            desc = (""):AddDefaultValueText("EventReminders.TimeDisplay.Line1", timeDisplaysLine1),
                            values = timeDisplaysLine1,
                            get = function() return addon.Options.db.EventReminders.TimeDisplay.Line1; end,
                            set = TimeDisplayLine1Set
                        },
                        Line2 = {
                            order = OrderPP(), type = "select", width = AdjustedWidth(1.45),
                            name = addon.L["Line"] .. " 2",
                            desc = (""):AddDefaultValueText("EventReminders.TimeDisplay.Line2", timeDisplaysLine2),
                            values = timeDisplaysLine2,
                            get = function() return addon.Options.db.EventReminders.TimeDisplay.Line2; end,
                            set = TimeDisplayLine2Set,
                            disabled = function() return addon.Options.db.EventReminders.Compact; end
                        }
                    }
                },
                Other = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Other"],
                    args = {
                        RefreshInterval = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                            name = addon.L["Refresh interval"],
                            desc = addon.L["Refresh interval Desc"]:AddDefaultValueText("EventReminders.RefreshInterval"),
                            min = 1, max = 3600, step = 1,
                            get = function() return addon.Options.db.EventReminders.RefreshInterval; end,
                            set = function(_, value) addon.Options.db.EventReminders.RefreshInterval = value; end
                        },
                        ShowPopUpsOnLoginDelay = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                            name = addon.L["Delay"],
                            desc = addon.L["Show pop ups on login delay Desc"]:AddDefaultValueText("EventReminders.OnLoginDelay"),
                            min = 1, max = 600, step = 1,
                            get = function() return addon.Options.db.EventReminders.OnLoginDelay; end,
                            set = function(_, value) addon.Options.db.EventReminders.OnLoginDelay = value; end
                        }
                    }
                }
            }
        },
        PopUps = {
            order = OrderPP(), type = "group",
            name = addon.L["Pop ups"],
            args = {
                OnLoginReload = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["On Login / Reload"],
                    args = {
                        ShowPopUpsOnLogin = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                            name = addon.L["Show"],
                            desc = addon.L["Show alertSystem on login Desc"]:ReplaceVars(addon.L["Pop ups"]):AddDefaultValueText("EventReminders.PopUps.Show.OnLogin"),
                            get = function() return addon.Options.db.EventReminders.PopUps.Show.OnLogin; end,
                            set = function(_, value) addon.Options.db.EventReminders.PopUps.Show.OnLogin = value; end
                        },
                        ShowPopUpsOnLoginInInstances = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(0.75),
                            name = addon.L["In instances"],
                            desc = addon.L["Show alertSystem on login in instances Desc"]:ReplaceVars(addon.L["Pop ups"]):AddDefaultValueText("EventReminders.PopUps.Show.OnLoginInInstances"),
                            get = function() return addon.Options.db.EventReminders.PopUps.Show.OnLoginInInstances; end,
                            set = function(_, value) addon.Options.db.EventReminders.PopUps.Show.OnLoginInInstances = value; end,
                            disabled = function() return not addon.Options.db.EventReminders.PopUps.Show.OnLogin end
                        }
                    }
                },
                OnEventStart = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["On Event Start"],
                    args = {
                        ShowPopUpsOnEventStart = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                            name = addon.L["Show"],
                            desc = addon.L["Show alertSystem on event start Desc"]:ReplaceVars(addon.L["Pop ups"]):AddDefaultValueText("EventReminders.PopUps.Show.OnEventStart"),
                            get = function() return addon.Options.db.EventReminders.PopUps.Show.OnEventStart; end,
                            set = function(_, value) addon.Options.db.EventReminders.PopUps.Show.OnEventStart = value; end
                        },
                        ShowPopUpsOnEventStartInInstances = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(0.75),
                            name = addon.L["In instances"],
                            desc = addon.L["Show alertSystem on event start in instances Desc"]:ReplaceVars(addon.L["Pop ups"]):AddDefaultValueText("EventReminders.PopUps.Show.OnEventStartInInstances"),
                            get = function() return addon.Options.db.EventReminders.PopUps.Show.OnEventStartInInstances; end,
                            set = function(_, value) addon.Options.db.EventReminders.PopUps.Show.OnEventStartInInstances = value; end,
                            disabled = function() return not addon.Options.db.EventReminders.PopUps.Show.OnEventStart end
                        }
                    }
                },
                Location = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Location"],
                    args = {
                        GrowDirection = {
                            order = OrderPP(), type = "select", width = AdjustedWidth(1.45),
                            name = addon.L["Grow direction"],
                            desc = addon.L["Grow direction Desc"]:AddDefaultValueText("EventReminders.PopUps.GrowDirection", growDirection),
                            values = growDirection,
                            get = function() return addon.Options.db.EventReminders.PopUps.GrowDirection; end,
                            set = PopUpsGrowDirectionSet
                        },
                        Spacing = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                            name = addon.L["Spacing"],
                            desc = addon.L["Spacing Desc"]:AddDefaultValueText("EventReminders.PopUps.Spacing"),
                            min = 0, max = 100, step = 1,
                            get = function() return addon.Options.db.EventReminders.PopUps.Spacing; end,
                            set = PopUpsSpavingSet
                        },
                        OffsetX = {
                            order = OrderPP(), type = "range", width = "full",
                            name = addon.L["XYZ offset"]:ReplaceVars("X"),
                            desc = addon.L["X offset Desc"]:AddDefaultValueText("EventReminders.PopUps.OffsetX"),
                            min = -2000, max = 2000, step = 1,
                            get = function() return addon.Options.db.EventReminders.PopUps.OffsetX; end,
                            set = PopUpsOffsetXSet
                        },
                        OffsetY = {
                            order = OrderPP(), type = "range", width = "full",
                            name = addon.L["XYZ offset"]:ReplaceVars("Y"),
                            desc = addon.L["Y offset Desc"]:AddDefaultValueText("EventReminders.PopUps.OffsetY"),
                            min = 0, max = 2000, step = 1,
                            get = function() return addon.Options.db.EventReminders.PopUps.OffsetY; end,
                            set = PopUpsOffsetYSet
                        },
                        ShowPlaceholder = {
                            order = OrderPP(), type = "execute", width = AdjustedWidth(),
                            name = addon.L["Show placeholders"],
                            desc = addon.L["Show placeholders Desc"],
                            func = PopUpsShowPlaceholderFunc
                        }
                    }
                },
                Other = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Other"],
                    args = {
                        MaxAlerts = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                            name = addon.L["Max number of alerts"],
                            desc = addon.L["Max number of alerts Desc"]:AddDefaultValueText("EventReminders.PopUps.MaxAlerts"),
                            min = 1, max = 100, step = 1,
                            get = function() return addon.Options.db.EventReminders.PopUps.MaxAlerts; end,
                            set = function(_, value) addon.Options.db.EventReminders.PopUps.MaxAlerts = value; end
                        },
                        FadeDelay = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                            name = addon.L["Fade delay"],
                            desc = addon.L["Fade delay Desc"]:AddDefaultValueText("EventReminders.PopUps.FadeDelay"),
                            min = 1, max = 120, step = 1,
                            get = function() return addon.Options.db.EventReminders.PopUps.FadeDelay; end,
                            set = function(_, value) addon.Options.db.EventReminders.PopUps.FadeDelay = value; end
                        }
                    }
                }
            }
        },
        ChatMessages = {
            order = OrderPP(), type = "group",
            name = addon.L["Chat messages"],
            args = {
                OnLoginReload = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["On Login / Reload"],
                    args = {
                        ShowChatMessagesOnLogin = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                            name = addon.L["Show"],
                            desc = addon.L["Show alertSystem on login Desc"]:ReplaceVars(addon.L["Chat messages"]):AddDefaultValueText("EventReminders.ChatMessages.Show.OnLogin"),
                            get = function() return addon.Options.db.EventReminders.ChatMessages.Show.OnLogin; end,
                            set = function(_, value) addon.Options.db.EventReminders.ChatMessages.Show.OnLogin = value; end
                        },
                        ShowChatMessagesOnLoginInInstances = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(0.75),
                            name = addon.L["In instances"],
                            desc = addon.L["Show alertSystem on login in instances Desc"]:ReplaceVars(addon.L["Chat messages"]):AddDefaultValueText("EventReminders.ChatMessages.Show.OnLoginInInstances"),
                            get = function() return addon.Options.db.EventReminders.ChatMessages.Show.OnLoginInInstances; end,
                            set = function(_, value) addon.Options.db.EventReminders.ChatMessages.Show.OnLoginInInstances = value; end,
                            disabled = function() return not addon.Options.db.EventReminders.ChatMessages.Show.OnLogin end
                        }
                    }
                },
                OnEventStart = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["On Event Start"],
                    args = {
                        ShowChatMessagesOnEventStart = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                            name = addon.L["Show"],
                            desc = addon.L["Show alertSystem on event start Desc"]:ReplaceVars(addon.L["Chat messages"]):AddDefaultValueText("EventReminders.ChatMessages.Show.OnEventStart"),
                            get = function() return addon.Options.db.EventReminders.ChatMessages.Show.OnEventStart; end,
                            set = function(_, value) addon.Options.db.EventReminders.ChatMessages.Show.OnEventStart = value; end
                        },
                        ShowChatMessagesOnEventStartInInstances = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(0.75),
                            name = addon.L["In instances"],
                            desc = addon.L["Show alertSystem on event start in instances Desc"]:ReplaceVars(addon.L["Chat messages"]):AddDefaultValueText("EventReminders.ChatMessages.Show.OnEventStartInInstances"),
                            get = function() return addon.Options.db.EventReminders.ChatMessages.Show.OnEventStartInInstances; end,
                            set = function(_, value) addon.Options.db.EventReminders.ChatMessages.Show.OnEventStartInInstances = value; end,
                            disabled = function() return not addon.Options.db.EventReminders.ChatMessages.Show.OnEventStart end
                        }
                    }
                }
            }
        },
        CalendarEvents = {
            order = OrderPP(), type = "group", childGroups = "tab",
            name = addon.L["Calendar Events"],
            args = { --[[ Automatically generated ]] }
        },
        WorldEvents = {
            order = OrderPP(), type = "group", childGroups = "tab",
            name = addon.L["World Events"],
            args = { --[[ Automatically generated ]] }
        },
        DateTimeFormat = {
            order = OrderPP(), type = "group",
            name = addon.L["Date and Time format"],
            args = {
                StartTimeAndEndTime = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Start Time"] .. " & " .. addon.L["End Time"],
                    args = {
                        Presets = {
                            order = OrderPP(), type = "select", width = AdjustedWidth(1.5),
                            name = addon.L["Presets"],
                            values = startTimeAndEndTimeDateTimeValues,
                            get = StartTimeAndEndTimePresetsGet,
                            set = function(_, value)
                                local custom = LibStub("AceConfigRegistry-3.0"):GetOptionsTable(addon.L["Event Reminders"], "cmd", "KROWIAF-0.0").args.DateTimeFormat.args.StartTimeAndEndTime.args.Custom;
                                custom.set(nil, startTimeAndEndTimeDateTimeFormats[value]);
                            end
                        },
                        Custom = {
                            order = OrderPP(), type = "input", width = AdjustedWidth(1.5),
                            name = addon.L["Custom"],
                            get = function() return addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime; end,
                            set = StartTimeAndEndTimeCustomSet
                        }
                    }
                },
                DateTimeFormattingGuideLine = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Date and Time formatting guide"],
                    args = {
                        DateTimeFormattingGuide = {
                            order = OrderPP(), type = "description",
                            name = addon.L["Date and Time formatting guide Desc"]:ReplaceVars {
                                addon.L["Date and Time formatting guide Desc"],
                                a = string.format(addon.Colors.Yellow, "%a"),
                                A = string.format(addon.Colors.Yellow, "%A"),
                                b = string.format(addon.Colors.Yellow, "%b"),
                                B = string.format(addon.Colors.Yellow, "%B"),
                                c = string.format(addon.Colors.Yellow, "%c"),
                                C = string.format(addon.Colors.Yellow, "%C"),
                                d = string.format(addon.Colors.Yellow, "%d"),
                                D = string.format(addon.Colors.Yellow, "%D"),
                                e = string.format(addon.Colors.Yellow, "%e"),
                                H = string.format(addon.Colors.Yellow, "%H"),
                                I = string.format(addon.Colors.Yellow, "%I"),
                                j = string.format(addon.Colors.Yellow, "%j"),
                                k = string.format(addon.Colors.Yellow, "%k"),
                                l = string.format(addon.Colors.Yellow, "%l"),
                                m = string.format(addon.Colors.Yellow, "%m"),
                                M = string.format(addon.Colors.Yellow, "%M"),
                                p = string.format(addon.Colors.Yellow, "%p"),
                                P = string.format(addon.Colors.Yellow, "%P"),
                                R = string.format(addon.Colors.Yellow, "%R"),
                                s = string.format(addon.Colors.Yellow, "%s"),
                                S = string.format(addon.Colors.Yellow, "%S"),
                                u = string.format(addon.Colors.Yellow, "%u"),
                                U = string.format(addon.Colors.Yellow, "%U"),
                                w = string.format(addon.Colors.Yellow, "%w"),
                                W = string.format(addon.Colors.Yellow, "%W"),
                                x = string.format(addon.Colors.Yellow, "%x"),
                                X = string.format(addon.Colors.Yellow, "%X"),
                                y = string.format(addon.Colors.Yellow, "%y"),
                                Y = string.format(addon.Colors.Yellow, "%Y"),
                                z = string.format(addon.Colors.Yellow, "%z"),
                                Z = string.format(addon.Colors.Yellow, "%Z")
                            }
                        }
                    }
                }
            }
        }
    }
};