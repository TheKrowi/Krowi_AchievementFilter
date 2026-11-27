local _, addon = ...
local L = addon.L

-- Event reminders' settings and its two sections of the options window, Event reminders and Reminder events, whether the
-- feature is on or off; the registry puts the switch on top of the first and greys every row while it is off
-- (Features.lua). The saved keys stay where they always were, EventReminders.*, and the switch is the setting reminders
-- always had, EventReminders.Enabled (docs/work/2026-11-12-event-reminders). After a profile switch, copy or reset the
-- reload prompt shows, as for every options-profile action; the reminders redraw after the reload.

local OrderPP = addon.InjectOptions.AutoOrderPlusPlus
local AdjustedWidth = addon.InjectOptions.AdjustedWidth
local path = addon.Features.Path("EventReminders")
local settings = path .. ".args.Settings.args."
local enum = addon.EventReminders.Enum -- the numbers its dropdowns save, by name (EventReminders.lua)

-- Its defaults, merged into the profile defaults by the registry (Features.lua BuildOptions); the switch's own default
-- is the registry's
-- The settings this feature declares (docs/work/2026-11-25-settings-store): a value's default, or a table that declares a
-- map; the per-event maps' entries come from the event data (EventOptions.lua)
local defaults = {
    ["eventReminders.chatMessages.onEventStart.show"] = false,
    ["eventReminders.chatMessages.onEventStart.showInInstances"] = false,
    ["eventReminders.chatMessages.onEventStart.showOnlyWhenTimeDataIsAvailable"] = true,
    ["eventReminders.chatMessages.onEventStartUpcoming.show"] = true,
    ["eventReminders.chatMessages.onEventStartUpcoming.showInInstances"] = false,
    ["eventReminders.chatMessages.onLogin.show"] = false,
    ["eventReminders.chatMessages.onLogin.showInInstances"] = false,
    ["eventReminders.chatMessages.onLogin.showOnlyWhenTimeDataIsAvailable"] = true,
    ["eventReminders.chatMessages.onLoginUpcoming.show"] = true,
    ["eventReminders.chatMessages.onLoginUpcoming.showInInstances"] = false,
    ["eventReminders.chatMessages.onReload.show"] = false,
    ["eventReminders.chatMessages.onReload.showInInstances"] = false,
    ["eventReminders.chatMessages.onReload.showOnlyWhenTimeDataIsAvailable"] = true,
    ["eventReminders.chatMessages.onReloadUpcoming.show"] = true,
    ["eventReminders.chatMessages.onReloadUpcoming.showInInstances"] = false,
    ["eventReminders.compact"] = false,
    ["eventReminders.dateTimeFormat.startTimeAndEndTime"] = "%d/%m/%Y %R",
    ["eventReminders.onLoginDelay"] = {Type = "number", Default = 5, Min = 1, Max = 600, Step = 1},
    ["eventReminders.onLoginUpcomingDelay"] = {Type = "number", Default = 6, Min = 1, Max = 600, Step = 1},
    ["eventReminders.popUps.appliesTo"] = enum.PopUpsAppliesTo.EveryAlert,
    ["eventReminders.popUps.fadeDelay"] = {Type = "number", Default = 10, Min = 1, Max = 120, Step = 1},
    ["eventReminders.popUps.growDirection"] = enum.PopUpsGrowDirection.Up,
    ["eventReminders.popUps.maxAlerts"] = {Type = "number", Default = 5, Min = 1, Max = 100, Step = 1},
    ["eventReminders.popUps.offsetX"] = {Type = "number", Default = 0, Min = -2000, Max = 2000, Step = 1},
    ["eventReminders.popUps.offsetY"] = {Type = "number", Default = 128, Min = 0, Max = 2000, Step = 1},
    ["eventReminders.popUps.onEventStart.show"] = true,
    ["eventReminders.popUps.onEventStart.showInInstances"] = false,
    ["eventReminders.popUps.onEventStart.showOnlyWhenTimeDataIsAvailable"] = true,
    ["eventReminders.popUps.onEventStartUpcoming.show"] = true,
    ["eventReminders.popUps.onEventStartUpcoming.showInInstances"] = false,
    ["eventReminders.popUps.onLogin.show"] = true,
    ["eventReminders.popUps.onLogin.showInInstances"] = false,
    ["eventReminders.popUps.onLogin.showOnlyWhenTimeDataIsAvailable"] = true,
    ["eventReminders.popUps.onLoginUpcoming.show"] = true,
    ["eventReminders.popUps.onLoginUpcoming.showInInstances"] = false,
    ["eventReminders.popUps.onReload.show"] = true,
    ["eventReminders.popUps.onReload.showInInstances"] = false,
    ["eventReminders.popUps.onReload.showOnlyWhenTimeDataIsAvailable"] = true,
    ["eventReminders.popUps.onReloadUpcoming.show"] = true,
    ["eventReminders.popUps.onReloadUpcoming.showInInstances"] = false,
    ["eventReminders.popUps.spacing"] = {Type = "number", Default = 10, Min = 0, Max = 100, Step = 1},
    ["eventReminders.refreshInterval"] = {Type = "number", Default = 60, Min = 1, Max = 3600, Step = 1},
    ["eventReminders.sideButtonsAnchor"] = enum.SideButtonsAnchor.AchievementWindow,
    ["eventReminders.timeDisplay.line1"] = enum.TimeDisplayLine1.EndTime,
    ["eventReminders.timeDisplay.line2"] = enum.TimeDisplayLine2.TimeLeft,
    ["eventReminders.upcomingCalendarEvents.days"] = {Type = "number", Default = 14, Min = 1, Max = 60, Step = 1},
    ["eventReminders.upcomingCalendarEvents.enabled"] = true,
    ["eventReminders.calendarEvents"] = { Kind = "map" },
    ["eventReminders.worldEvents"] = { Kind = "map" },
    ["eventReminders.widgetEvents"] = { Kind = "map" },
}

-- The dropdowns' choices, each text under the number it saves
local timeDisplaysLine1 = {
    [enum.TimeDisplayLine1.EndTime] = addon.L["End Time"],
    [enum.TimeDisplayLine1.TimeLeft] = addon.L["Time Left"]
}

local timeDisplaysLine2 = {
    [enum.TimeDisplayLine2.None] = addon.L["None"],
    [enum.TimeDisplayLine2.EndTime] = addon.L["End Time"],
    [enum.TimeDisplayLine2.TimeLeft] = addon.L["Time Left"]
}

local sideButtonsAnchor = {
    [enum.SideButtonsAnchor.AchievementWindow] = addon.L["Achievement Window"],
    [enum.SideButtonsAnchor.WorldMap] = addon.L["World Map"]
}

local growDirection = {
    [enum.PopUpsGrowDirection.Up] = addon.L["Up"],
    [enum.PopUpsGrowDirection.Down] = addon.L["Down"]
}

local appliesTo = {
    [enum.PopUpsAppliesTo.EveryAlert] = addon.L["Every alert"],
    [enum.PopUpsAppliesTo.EventReminders] = addon.L["Only event reminders"]
}

local startTimeAndEndTimeDateTimeFormats, startTimeAndEndTimeDateTimeValues = {}, {}

local function AddFormat(formats, values, format)
    tinsert(formats, format)
    tinsert(values, date(format, GetServerTime())) -- the realm's clock, as every event time (the event-clock rule)
end

local function AddStartTimeAndEndTimeFormat(format)
    AddFormat(startTimeAndEndTimeDateTimeFormats, startTimeAndEndTimeDateTimeValues, format)
end

AddStartTimeAndEndTimeFormat(defaults["eventReminders.dateTimeFormat.startTimeAndEndTime"])
AddStartTimeAndEndTimeFormat(addon.L["%d/%m/%Y %I:%M %p"])
AddStartTimeAndEndTimeFormat(addon.L["%m/%d/%Y %R"])
AddStartTimeAndEndTimeFormat(addon.L["%m/%d/%Y %I:%M %p"])
AddStartTimeAndEndTimeFormat(addon.L["%Y/%m/%d %R"])
AddStartTimeAndEndTimeFormat(addon.L["%Y/%m/%d %I:%M %p"])
AddStartTimeAndEndTimeFormat(addon.L["%c"])
tinsert(startTimeAndEndTimeDateTimeValues, "Custom")
tinsert(startTimeAndEndTimeDateTimeFormats, addon.L["%m/%d/%Y %R"])

local function TimeDisplayLine1Set(_, value)
    if addon.Settings.Get("eventReminders.timeDisplay.line1") == value then return; end
    addon.Settings.Set("eventReminders.timeDisplay.line1", value)
    addon.Gui.EventReminderSideButtonSystem:Refresh()
end

local function TimeDisplayLine2Set(_, value)
    if addon.Settings.Get("eventReminders.timeDisplay.line2") == value then return; end
    addon.Settings.Set("eventReminders.timeDisplay.line2", value)
    addon.Gui.EventReminderSideButtonSystem:Refresh()
end

local function SideButtonsAnchorSet(_, value)
    if addon.Settings.Get("eventReminders.sideButtonsAnchor") == value then return; end
    addon.Settings.Set("eventReminders.sideButtonsAnchor", value)
    addon.Gui.EventReminderSideButtonSystem:Reload()
end

-- The alert system places the pop-ups by the options (Features/EventReminders/AlertSystem.lua); it never moves anything while
-- another addon places the game's alerts
local function ApplyLocation()
    addon.Gui.EventReminderAlertSystem:ApplyLocation()
end

local function IsFollowing()
    return addon.Gui.EventReminderAlertSystem:IsFollowing()
end

local function PopUpsAppliesToSet(_, value)
    if addon.Settings.Get("eventReminders.popUps.appliesTo") == value then return; end
    addon.Settings.Set("eventReminders.popUps.appliesTo", value)
    ApplyLocation()
end

local function PopUpsGrowDirectionSet(_, value)
    if addon.Settings.Get("eventReminders.popUps.growDirection") == value then return; end
    addon.Settings.Set("eventReminders.popUps.growDirection", value)
    ApplyLocation()
end

local function PopUpsSpacingSet(_, value)
    if addon.Settings.Get("eventReminders.popUps.spacing") == value then return; end
    addon.Settings.Set("eventReminders.popUps.spacing", value)
    ApplyLocation()
end

local function PopUpsOffsetXSet(_, value)
    if addon.Settings.Get("eventReminders.popUps.offsetX") == value then return; end
    addon.Settings.Set("eventReminders.popUps.offsetX", value)
    ApplyLocation()
end

local function PopUpsOffsetYSet(_, value)
    if addon.Settings.Get("eventReminders.popUps.offsetY") == value then return; end
    addon.Settings.Set("eventReminders.popUps.offsetY", value)
    ApplyLocation()
end

-- A preview of the pop-ups where they show: as many as fit at once, for a minute, on copies of the player's events
local function PopUpsShowPlaceholderFunc()
    addon.Gui.EventReminderAlertSystem:ShowPlaceholders(false, 60)
end

local function PopUpsHidePlaceholderFunc()
    addon.Gui.EventReminderAlertSystem:HideAlerts()
end

local function StartTimeAndEndTimePresetsGet()
    for i, format in next, startTimeAndEndTimeDateTimeFormats do
        if format == addon.Settings.Get("eventReminders.dateTimeFormat.startTimeAndEndTime") then
            return i
        end
    end
    return #startTimeAndEndTimeDateTimeFormats
end

local function StartTimeAndEndTimeCustomSet(_, value)
    if addon.Settings.Get("eventReminders.dateTimeFormat.startTimeAndEndTime") == value then return; end
    addon.Settings.Set("eventReminders.dateTimeFormat.startTimeAndEndTime", value)
    addon.Gui.EventReminderSideButtonSystem:Refresh()
end

-- The rows, built when the registry asks for them (Features.lua BuildOptions), after the defaults went in
local function Rows()
    local generalOptions = {
        order = OrderPP(), type = "group",
        name = addon.Util.L["General"],
        args = {
            Style = {
                order = OrderPP(), type = "group", inline = true,
                name = addon.L["Style"],
                args = {
                    EnableUpcomingCalendarEvents = addon.Settings.Row("eventReminders.upcomingCalendarEvents.enabled", {
                        order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                        name = addon.L["Upcoming Holidays"],
                        desc = addon.L["Upcoming Holidays Desc"]:KAF_AddDefaultValueText("eventReminders.upcomingCalendarEvents.enabled"):K_AddReloadRequired(),
                    }),
                    Compact = addon.Settings.Row("eventReminders.compact", {
                        order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                        name = addon.L["Compact Reminders"],
                        desc = addon.L["Compact Reminders Desc"]:KAF_AddDefaultValueText("eventReminders.compact"):K_AddReloadRequired(),
                    }),
                    -- Where the side buttons sit, with the other settings of how the reminders look (Krowi, 2026-11-12)
                    SideButtonsAnchor = addon.Settings.Row("eventReminders.sideButtonsAnchor", {
                        order = OrderPP(), type = "select", width = AdjustedWidth(1.45),
                        name = addon.L["Side Buttons Beside"],
                        desc = addon.L["Side Buttons Beside Desc"]:KAF_AddDefaultValueText("eventReminders.sideButtonsAnchor", sideButtonsAnchor),
                        values = sideButtonsAnchor,
                        set = SideButtonsAnchorSet,
                    })
                }
            },
            TimeDisplay = {
                order = OrderPP(), type = "group",
                name = addon.L["Time display"],
                inline = true,
                args = {
                    Line1 = addon.Settings.Row("eventReminders.timeDisplay.line1", {
                        order = OrderPP(), type = "select", width = AdjustedWidth(1.45),
                        name = addon.L["First Line"],
                        desc = addon.L["First Line Desc"]:KAF_AddDefaultValueText("eventReminders.timeDisplay.line1", timeDisplaysLine1),
                        values = timeDisplaysLine1,
                        set = TimeDisplayLine1Set
                    }),
                    Line2 = addon.Settings.Row("eventReminders.timeDisplay.line2", {
                        order = OrderPP(), type = "select", width = AdjustedWidth(1.45),
                        name = addon.L["Second Line"],
                        desc = addon.L["Second Line Desc"]:KAF_AddDefaultValueText("eventReminders.timeDisplay.line2", timeDisplaysLine2),
                        values = timeDisplaysLine2,
                        set = TimeDisplayLine2Set,
                        disabled = function() return addon.Settings.Get("eventReminders.compact"); end
                    })
                }
            },
            Other = {
                order = OrderPP(), type = "group", inline = true,
                name = addon.L["Other"],
                args = {
                    ShowPopUpsOnLoginDelay = addon.Settings.Row("eventReminders.onLoginDelay", {
                        order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                        name = addon.L["Delay for Active Events"],
                        desc = addon.L["Delay for Active Events Desc"]:KAF_AddDefaultValueText("eventReminders.onLoginDelay"),
                    }),
                    ShowPopUpsOnLoginUpcomingDelay = addon.Settings.Row("eventReminders.onLoginUpcomingDelay", {
                        order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                        name = addon.L["Delay for Upcoming Holidays"],
                        desc = addon.L["Delay for Upcoming Holidays Desc"]:KAF_AddDefaultValueText("eventReminders.onLoginUpcomingDelay"),
                    }),
                    RefreshInterval = addon.Settings.Row("eventReminders.refreshInterval", {
                        order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                        name = addon.L["Refresh Every"],
                        desc = addon.L["Refresh Every Desc"]:KAF_AddDefaultValueText("eventReminders.refreshInterval"),
                    }),
                    UpcomingCalendarEventsDays = addon.Settings.Row("eventReminders.upcomingCalendarEvents.days", {
                        order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                        name = addon.L["Days Ahead"],
                        desc = addon.L["Days Ahead Desc"]:KAF_AddDefaultValueText("eventReminders.upcomingCalendarEvents.days"):K_AddReloadRequired(),
                    }),
                }
            }
        }
    }

    local popUpsOptions = {
        order = OrderPP(), type = "group",
        name = addon.L["Pop ups"],
        args = {
            ActiveEvents = {
                order = OrderPP(), type = "group", inline = true,
                name = addon.L["Active Events"],
                args = {
                    OnLogin = {
                        order = OrderPP(), type = "group", inline = true,
                        name = addon.L["On Login"],
                        args = {
                            Show = addon.Settings.Row("eventReminders.popUps.onLogin.show", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.65),
                                name = addon.L["Show"],
                                desc = addon.L["Pop-Up Active Login Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.onLogin.show"),
                            }),
                            ShowInInstances = addon.Settings.Row("eventReminders.popUps.onLogin.showInInstances", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                                name = addon.L["In instances"],
                                desc = addon.L["In Instances Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.onLogin.showInInstances"),
                                disabled = function() return not addon.Settings.Get("eventReminders.popUps.onLogin.show") end
                            }),
                            ShowOnlyWhenTimeDataIsAvailable = addon.Settings.Row("eventReminders.popUps.onLogin.showOnlyWhenTimeDataIsAvailable", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                                name = addon.L["Only when time data is available"],
                                desc = addon.L["Only With a Time Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.onLogin.showOnlyWhenTimeDataIsAvailable"),
                                disabled = function() return not addon.Settings.Get("eventReminders.popUps.onLogin.show") end
                            })
                        }
                    },
                    OnReload = {
                        order = OrderPP(), type = "group", inline = true,
                        name = addon.L["On Reload"],
                        args = {
                            Show = addon.Settings.Row("eventReminders.popUps.onReload.show", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.65),
                                name = addon.L["Show"],
                                desc = addon.L["Pop-Up Active Reload Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.onReload.show"),
                            }),
                            ShowInInstances = addon.Settings.Row("eventReminders.popUps.onReload.showInInstances", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                                name = addon.L["In instances"],
                                desc = addon.L["In Instances Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.onReload.showInInstances"),
                                disabled = function() return not addon.Settings.Get("eventReminders.popUps.onReload.show") end
                            }),
                            ShowOnlyWhenTimeDataIsAvailable = addon.Settings.Row("eventReminders.popUps.onReload.showOnlyWhenTimeDataIsAvailable", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                                name = addon.L["Only when time data is available"],
                                desc = addon.L["Only With a Time Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.onReload.showOnlyWhenTimeDataIsAvailable"),
                                disabled = function() return not addon.Settings.Get("eventReminders.popUps.onReload.show") end
                            })
                        }
                    },
                    OnEventStart = {
                        order = OrderPP(), type = "group", inline = true,
                        name = addon.L["On Event Start"],
                        args = {
                            Show = addon.Settings.Row("eventReminders.popUps.onEventStart.show", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.65),
                                name = addon.L["Show"],
                                desc = addon.L["Pop-Up Active Start Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.onEventStart.show"),
                            }),
                            ShowInInstances = addon.Settings.Row("eventReminders.popUps.onEventStart.showInInstances", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                                name = addon.L["In instances"],
                                desc = addon.L["In Instances Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.onEventStart.showInInstances"),
                                disabled = function() return not addon.Settings.Get("eventReminders.popUps.onEventStart.show") end
                            }),
                            ShowOnlyWhenTimeDataIsAvailable = addon.Settings.Row("eventReminders.popUps.onEventStart.showOnlyWhenTimeDataIsAvailable", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                                name = addon.L["Only when time data is available"],
                                desc = addon.L["Only With a Time Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.onEventStart.showOnlyWhenTimeDataIsAvailable"),
                                disabled = function() return not addon.Settings.Get("eventReminders.popUps.onEventStart.show") end
                            })
                        }
                    },
                }
            },
            UpcomingCalendarEvents = {
                order = OrderPP(), type = "group", inline = true,
                name = addon.L["Upcoming Calendar Events"],
                args = {
                    OnLogin = {
                        order = OrderPP(), type = "group", inline = true,
                        name = addon.L["On Login"],
                        args = {
                            Show = addon.Settings.Row("eventReminders.popUps.onLoginUpcoming.show", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.65),
                                name = addon.L["Show"],
                                desc = addon.L["Pop-Up Upcoming Login Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.onLoginUpcoming.show"),
                            }),
                            ShowInInstances = addon.Settings.Row("eventReminders.popUps.onLoginUpcoming.showInInstances", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                                name = addon.L["In instances"],
                                desc = addon.L["In Instances Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.onLoginUpcoming.showInInstances"),
                                disabled = function() return not addon.Settings.Get("eventReminders.popUps.onLoginUpcoming.show") end
                            })
                        }
                    },
                    OnReload = {
                        order = OrderPP(), type = "group", inline = true,
                        name = addon.L["On Reload"],
                        args = {
                            Show = addon.Settings.Row("eventReminders.popUps.onReloadUpcoming.show", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.65),
                                name = addon.L["Show"],
                                desc = addon.L["Pop-Up Upcoming Reload Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.onReloadUpcoming.show"),
                            }),
                            ShowInInstances = addon.Settings.Row("eventReminders.popUps.onReloadUpcoming.showInInstances", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                                name = addon.L["In instances"],
                                desc = addon.L["In Instances Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.onReloadUpcoming.showInInstances"),
                                disabled = function() return not addon.Settings.Get("eventReminders.popUps.onReloadUpcoming.show") end
                            })
                        }
                    },
                    OnEventStart = {
                        order = OrderPP(), type = "group", inline = true,
                        name = addon.L["On Event Start"],
                        args = {
                            Show = addon.Settings.Row("eventReminders.popUps.onEventStartUpcoming.show", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.65),
                                name = addon.L["Show"],
                                desc = addon.L["Pop-Up Upcoming Start Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.onEventStartUpcoming.show"),
                            }),
                            ShowInInstances = addon.Settings.Row("eventReminders.popUps.onEventStartUpcoming.showInInstances", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                                name = addon.L["In instances"],
                                desc = addon.L["In Instances Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.onEventStartUpcoming.showInInstances"),
                                disabled = function() return not addon.Settings.Get("eventReminders.popUps.onEventStartUpcoming.show") end
                            })
                        }
                    },
                }
            },
            Location = {
                order = OrderPP(), type = "group", inline = true,
                name = addon.L["Location"],
                args = {
                    AppliesTo = addon.Settings.Row("eventReminders.popUps.appliesTo", {
                        order = OrderPP(), type = "select", width = "full",
                        name = addon.L["Position Applies To"],
                        desc = addon.L["Position applies to Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.appliesTo", appliesTo),
                        values = appliesTo,
                        set = PopUpsAppliesToSet,
                        disabled = IsFollowing
                    }),
                    GrowDirection = addon.Settings.Row("eventReminders.popUps.growDirection", {
                        order = OrderPP(), type = "select", width = AdjustedWidth(1.45),
                        name = addon.L["Grow Direction"],
                        desc = addon.L["Grow Direction Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.growDirection", growDirection),
                        values = growDirection,
                        set = PopUpsGrowDirectionSet,
                        disabled = IsFollowing
                    }),
                    Spacing = addon.Settings.Row("eventReminders.popUps.spacing", {
                        order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                        name = addon.L["Spacing"],
                        desc = addon.L["Pop-Up Spacing Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.spacing"),
                        set = PopUpsSpacingSet,
                        disabled = IsFollowing
                    }),
                    OffsetX = addon.Settings.Row("eventReminders.popUps.offsetX", {
                        order = OrderPP(), type = "range", width = "full",
                        name = addon.L["Horizontal Position"],
                        desc = addon.L["Horizontal Position Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.offsetX"),
                        set = PopUpsOffsetXSet,
                        disabled = IsFollowing
                    }),
                    OffsetY = addon.Settings.Row("eventReminders.popUps.offsetY", {
                        order = OrderPP(), type = "range", width = "full",
                        name = addon.L["Vertical Position"],
                        desc = addon.L["Vertical Position Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.offsetY"),
                        set = PopUpsOffsetYSet,
                        disabled = IsFollowing
                    }),
                    -- Shown only while another addon places the game's alerts, so the settings above do nothing
                    FollowNote = {
                        order = OrderPP(), type = "description", width = "full",
                        name = function() return IsFollowing() and addon.L["Alerts placed by another addon Desc"] or ""; end
                    },
                    ShowPlaceholder = {
                        order = OrderPP(), type = "execute", width = AdjustedWidth(),
                        name = addon.L["Show Samples"],
                        desc = addon.L["Show Samples Desc"],
                        func = PopUpsShowPlaceholderFunc
                    },
                    HidePlaceholder = {
                        order = OrderPP(), type = "execute", width = AdjustedWidth(),
                        name = addon.L["Hide Samples"],
                        desc = addon.L["Hide Samples Desc"],
                        func = PopUpsHidePlaceholderFunc
                    }
                }
            },
            Other = {
                order = OrderPP(), type = "group", inline = true,
                name = addon.L["Other"],
                args = {
                    MaxAlerts = addon.Settings.Row("eventReminders.popUps.maxAlerts", {
                        order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                        name = addon.L["Pop-Ups at Once"],
                        desc = addon.L["Pop-Ups at Once Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.maxAlerts"),
                    }),
                    FadeDelay = addon.Settings.Row("eventReminders.popUps.fadeDelay", {
                        order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                        name = addon.L["Fade After"],
                        desc = addon.L["Fade After Desc"]:KAF_AddDefaultValueText("eventReminders.popUps.fadeDelay"),
                    })
                }
            }
        }
    }

    local chatMessagesOptions = {
        order = OrderPP(), type = "group",
        name = addon.L["Chat messages"],
        args = {
            ActiveEvents = {
                order = OrderPP(), type = "group", inline = true,
                name = addon.L["Active Events"],
                args = {
                    OnLogin = {
                        order = OrderPP(), type = "group", inline = true,
                        name = addon.L["On Login"],
                        args = {
                            Show = addon.Settings.Row("eventReminders.chatMessages.onLogin.show", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.65),
                                name = addon.L["Show"],
                                desc = addon.L["Chat Active Login Desc"]:KAF_AddDefaultValueText("eventReminders.chatMessages.onLogin.show"),
                            }),
                            ShowInInstances = addon.Settings.Row("eventReminders.chatMessages.onLogin.showInInstances", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                                name = addon.L["In instances"],
                                desc = addon.L["In Instances Desc"]:KAF_AddDefaultValueText("eventReminders.chatMessages.onLogin.showInInstances"),
                                disabled = function() return not addon.Settings.Get("eventReminders.chatMessages.onLogin.show") end
                            }),
                            ShowOnlyWhenTimeDataIsAvailable = addon.Settings.Row("eventReminders.chatMessages.onLogin.showOnlyWhenTimeDataIsAvailable", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                                name = addon.L["Only when time data is available"],
                                desc = addon.L["Only With a Time Desc"]:KAF_AddDefaultValueText("eventReminders.chatMessages.onLogin.showOnlyWhenTimeDataIsAvailable"),
                                disabled = function() return not addon.Settings.Get("eventReminders.chatMessages.onLogin.show") end
                            })
                        }
                    },
                    OnReload = {
                        order = OrderPP(), type = "group", inline = true,
                        name = addon.L["On Reload"],
                        args = {
                            Show = addon.Settings.Row("eventReminders.chatMessages.onReload.show", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.65),
                                name = addon.L["Show"],
                                desc = addon.L["Chat Active Reload Desc"]:KAF_AddDefaultValueText("eventReminders.chatMessages.onReload.show"),
                            }),
                            ShowInInstances = addon.Settings.Row("eventReminders.chatMessages.onReload.showInInstances", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                                name = addon.L["In instances"],
                                desc = addon.L["In Instances Desc"]:KAF_AddDefaultValueText("eventReminders.chatMessages.onReload.showInInstances"),
                                disabled = function() return not addon.Settings.Get("eventReminders.chatMessages.onReload.show") end
                            }),
                            ShowOnlyWhenTimeDataIsAvailable = addon.Settings.Row("eventReminders.chatMessages.onReload.showOnlyWhenTimeDataIsAvailable", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                                name = addon.L["Only when time data is available"],
                                desc = addon.L["Only With a Time Desc"]:KAF_AddDefaultValueText("eventReminders.chatMessages.onReload.showOnlyWhenTimeDataIsAvailable"),
                                disabled = function() return not addon.Settings.Get("eventReminders.chatMessages.onReload.show") end
                            })
                        }
                    },
                    OnEventStart = {
                        order = OrderPP(), type = "group", inline = true,
                        name = addon.L["On Event Start"],
                        args = {
                            Show = addon.Settings.Row("eventReminders.chatMessages.onEventStart.show", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.65),
                                name = addon.L["Show"],
                                desc = addon.L["Chat Active Start Desc"]:KAF_AddDefaultValueText("eventReminders.chatMessages.onEventStart.show"),
                            }),
                            ShowInInstances = addon.Settings.Row("eventReminders.chatMessages.onEventStart.showInInstances", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                                name = addon.L["In instances"],
                                desc = addon.L["In Instances Desc"]:KAF_AddDefaultValueText("eventReminders.chatMessages.onEventStart.showInInstances"),
                                disabled = function() return not addon.Settings.Get("eventReminders.chatMessages.onEventStart.show") end
                            }),
                            ShowOnlyWhenTimeDataIsAvailable = addon.Settings.Row("eventReminders.chatMessages.onEventStart.showOnlyWhenTimeDataIsAvailable", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                                name = addon.L["Only when time data is available"],
                                desc = addon.L["Only With a Time Desc"]:KAF_AddDefaultValueText("eventReminders.chatMessages.onEventStart.showOnlyWhenTimeDataIsAvailable"),
                                disabled = function() return not addon.Settings.Get("eventReminders.chatMessages.onEventStart.show") end
                            })
                        }
                    },
                }
            },
            UpcomingCalendarEvents = {
                order = OrderPP(), type = "group", inline = true,
                name = addon.L["Upcoming Calendar Events"],
                args = {
                    OnLogin = {
                        order = OrderPP(), type = "group", inline = true,
                        name = addon.L["On Login"],
                        args = {
                            Show = addon.Settings.Row("eventReminders.chatMessages.onLoginUpcoming.show", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.65),
                                name = addon.L["Show"],
                                desc = addon.L["Chat Upcoming Login Desc"]:KAF_AddDefaultValueText("eventReminders.chatMessages.onLoginUpcoming.show"),
                            }),
                            ShowInInstances = addon.Settings.Row("eventReminders.chatMessages.onLoginUpcoming.showInInstances", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                                name = addon.L["In instances"],
                                desc = addon.L["In Instances Desc"]:KAF_AddDefaultValueText("eventReminders.chatMessages.onLoginUpcoming.showInInstances"),
                                disabled = function() return not addon.Settings.Get("eventReminders.chatMessages.onLoginUpcoming.show") end
                            })
                        }
                    },
                    OnReload = {
                        order = OrderPP(), type = "group", inline = true,
                        name = addon.L["On Reload"],
                        args = {
                            Show = addon.Settings.Row("eventReminders.chatMessages.onReloadUpcoming.show", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.65),
                                name = addon.L["Show"],
                                desc = addon.L["Chat Upcoming Reload Desc"]:KAF_AddDefaultValueText("eventReminders.chatMessages.onReloadUpcoming.show"),
                            }),
                            ShowInInstances = addon.Settings.Row("eventReminders.chatMessages.onReloadUpcoming.showInInstances", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                                name = addon.L["In instances"],
                                desc = addon.L["In Instances Desc"]:KAF_AddDefaultValueText("eventReminders.chatMessages.onReloadUpcoming.showInInstances"),
                                disabled = function() return not addon.Settings.Get("eventReminders.chatMessages.onReloadUpcoming.show") end
                            })
                        }
                    },
                    OnEventStart = {
                        order = OrderPP(), type = "group", inline = true,
                        name = addon.L["On Event Start"],
                        args = {
                            Show = addon.Settings.Row("eventReminders.chatMessages.onEventStartUpcoming.show", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.65),
                                name = addon.L["Show"],
                                desc = addon.L["Chat Upcoming Start Desc"]:KAF_AddDefaultValueText("eventReminders.chatMessages.onEventStartUpcoming.show"),
                            }),
                            ShowInInstances = addon.Settings.Row("eventReminders.chatMessages.onEventStartUpcoming.showInInstances", {
                                order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                                name = addon.L["In instances"],
                                desc = addon.L["In Instances Desc"]:KAF_AddDefaultValueText("eventReminders.chatMessages.onEventStartUpcoming.showInInstances"),
                                disabled = function() return not addon.Settings.Get("eventReminders.chatMessages.onEventStartUpcoming.show") end
                            })
                        }
                    },
                }
            },
        }
    }

    local calendarEventsOptions = {
        order = OrderPP(), type = "group", childGroups = "tab",
        name = addon.L["Calendar Events"],
        args = { --[[ Automatically generated ]] }
    }

    local worldOptions = {
        order = OrderPP(), type = "group", childGroups = "tab",
        name = addon.L["World Events"],
        args = { --[[ Automatically generated ]] }
    }

    local dateTimeFormatOptions = {
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
                            StartTimeAndEndTimeCustomSet(nil, startTimeAndEndTimeDateTimeFormats[value])
                        end
                    },
                    Custom = addon.Settings.Row("eventReminders.dateTimeFormat.startTimeAndEndTime", {
                        order = OrderPP(), type = "input", width = AdjustedWidth(1.5),
                        name = addon.L["Custom"],
                        set = StartTimeAndEndTimeCustomSet
                    })
                }
            },
            DateTimeFormattingGuideLine = {
                order = OrderPP(), type = "group", inline = true,
                name = addon.L["Date and Time formatting guide"],
                args = {
                    DateTimeFormattingGuide = {
                        order = OrderPP(), type = "description",
                        name = addon.L["Date and Time formatting guide Desc"]:K_ReplaceVars {
                            addon.L["Date and Time formatting guide Desc"],
                            a = string.format(addon.Util.Colors.Yellow, "%a"),
                            A = string.format(addon.Util.Colors.Yellow, "%A"),
                            b = string.format(addon.Util.Colors.Yellow, "%b"),
                            B = string.format(addon.Util.Colors.Yellow, "%B"),
                            c = string.format(addon.Util.Colors.Yellow, "%c"),
                            C = string.format(addon.Util.Colors.Yellow, "%C"),
                            d = string.format(addon.Util.Colors.Yellow, "%d"),
                            D = string.format(addon.Util.Colors.Yellow, "%D"),
                            e = string.format(addon.Util.Colors.Yellow, "%e"),
                            H = string.format(addon.Util.Colors.Yellow, "%H"),
                            I = string.format(addon.Util.Colors.Yellow, "%I"),
                            j = string.format(addon.Util.Colors.Yellow, "%j"),
                            k = string.format(addon.Util.Colors.Yellow, "%k"),
                            l = string.format(addon.Util.Colors.Yellow, "%l"),
                            m = string.format(addon.Util.Colors.Yellow, "%m"),
                            M = string.format(addon.Util.Colors.Yellow, "%M"),
                            p = string.format(addon.Util.Colors.Yellow, "%p"),
                            P = string.format(addon.Util.Colors.Yellow, "%P"),
                            R = string.format(addon.Util.Colors.Yellow, "%R"),
                            s = string.format(addon.Util.Colors.Yellow, "%s"),
                            S = string.format(addon.Util.Colors.Yellow, "%S"),
                            u = string.format(addon.Util.Colors.Yellow, "%u"),
                            U = string.format(addon.Util.Colors.Yellow, "%U"),
                            w = string.format(addon.Util.Colors.Yellow, "%w"),
                            W = string.format(addon.Util.Colors.Yellow, "%W"),
                            x = string.format(addon.Util.Colors.Yellow, "%x"),
                            X = string.format(addon.Util.Colors.Yellow, "%X"),
                            y = string.format(addon.Util.Colors.Yellow, "%y"),
                            Y = string.format(addon.Util.Colors.Yellow, "%Y"),
                            z = string.format(addon.Util.Colors.Yellow, "%z"),
                            Z = string.format(addon.Util.Colors.Yellow, "%Z")
                        }
                    }
                }
            }
        }
    }

    return {
        General = generalOptions,
        PopUps = popUpsOptions,
        ChatMessages = chatMessagesOptions,
        CalendarEvents = calendarEventsOptions,
        WorldEvents = worldOptions,
        DateTimeFormat = dateTimeFormatOptions
    }
end

-- Next to the switch, outside the greyed rows: the button the Reminder events section points at the switch with, which
-- never greys, so the way to the switch stays open (Krowi, 2026-11-12)
local function Beside()
    local section = L["Event reminders"]
    return {
        GoToEvents = {
            order = 3, type = "execute",
            name = L["Go to {section}"]:K_ReplaceVars({section = section}),
            desc = L["Go to {section} Desc"]:K_ReplaceVars({section = section}),
            func = function() addon.Options.Open(nil, "events") end
        }
    }
end

-- The two sections of the options window, in the Around the game group after Criteria on units (Options/Window/Map.lua);
-- the registry puts the switch on top of the first
local function Sections()
    local goTo = L["Go to {section}"]:K_ReplaceVars({section = L["Event reminders"]})
    return {
        { Id = "events", Name = L["Event reminders"], Card = L["Card Events"], NavGroup = "world", Order = 30, Groups = {
            { Header = L["Reminders"], Entries = {
                { Group = settings .. "General.args.Style" },
            } },
            { Header = L["Time display"], Entries = {
                { Group = settings .. "General.args.TimeDisplay" },
            } },
            { Header = L["Pop ups for active events"], Kind = "Grid", Columns = { L["Show"], L["In instances"], L["Only with a time"] }, Rows = {
                { Label = L["On login"], Group = settings .. "PopUps.args.ActiveEvents.args.OnLogin" },
                { Label = L["On reload"], Group = settings .. "PopUps.args.ActiveEvents.args.OnReload" },
                { Label = L["When an event starts"], Group = settings .. "PopUps.args.ActiveEvents.args.OnEventStart" },
            } },
            { Header = L["Pop ups for upcoming calendar events"], Kind = "Grid", Columns = { L["Show"], L["In instances"] }, Rows = {
                { Label = L["On login"], Group = settings .. "PopUps.args.UpcomingCalendarEvents.args.OnLogin" },
                { Label = L["On reload"], Group = settings .. "PopUps.args.UpcomingCalendarEvents.args.OnReload" },
                { Label = L["When an event starts"], Group = settings .. "PopUps.args.UpcomingCalendarEvents.args.OnEventStart" },
            } },
            { Header = L["Pop up position"], Entries = {
                { Group = settings .. "PopUps.args.Location", Buttons = { ShowPlaceholder = L["Show"], HidePlaceholder = addon.Util.L["Hide"] } },
            } },
            { Header = L["Pop up behaviour"], Entries = {
                { Group = settings .. "PopUps.args.Other" },
            } },
            { Header = L["Chat messages for active events"], Kind = "Grid", Columns = { L["Show"], L["In instances"], L["Only with a time"] }, Rows = {
                { Label = L["On login"], Group = settings .. "ChatMessages.args.ActiveEvents.args.OnLogin" },
                { Label = L["On reload"], Group = settings .. "ChatMessages.args.ActiveEvents.args.OnReload" },
                { Label = L["When an event starts"], Group = settings .. "ChatMessages.args.ActiveEvents.args.OnEventStart" },
            } },
            { Header = L["Chat messages for upcoming calendar events"], Kind = "Grid", Columns = { L["Show"], L["In instances"] }, Rows = {
                { Label = L["On login"], Group = settings .. "ChatMessages.args.UpcomingCalendarEvents.args.OnLogin" },
                { Label = L["On reload"], Group = settings .. "ChatMessages.args.UpcomingCalendarEvents.args.OnReload" },
                { Label = L["When an event starts"], Group = settings .. "ChatMessages.args.UpcomingCalendarEvents.args.OnEventStart" },
            } },
            { Header = L["Timing"], Entries = {
                { Group = settings .. "General.args.Other" },
            } },
            { Header = L["Date and time format"], Entries = {
                { Group = settings .. "DateTimeFormat.args.StartTimeAndEndTime" },
            } },
        } },
        { Id = "eventlist", Name = L["Reminder events"], Card = L["Card Eventlist"], CardIcon = "Interface\\Icons\\INV_Misc_Note_01", ChangedIn = "104.0", NavGroup = "world", Order = 40, Groups = {
            -- This section has no switch of its own: a line and a button to the one on Event reminders (Krowi, 2026-11-12)
            { Header = L["Event reminders"], Note = L["Feature Controls Desc"]:K_ReplaceVars({feature = L["Event reminders"]}), Entries = {
                { Path = path .. ".args.GoToEvents", Label = L["Turn On or Off"], Button = goTo },
            } },
            { Header = L["Holidays"], AllNone = L["All holidays"], Entries = {
                { Group = settings .. "CalendarEvents.args.Holidays" },
            } },
            { Header = L["Other calendar events"], AllNone = L["All other calendar events"], Retail = true, Entries = {
                { Group = settings .. "CalendarEvents.args.Other" },
            } },
            { Header = L["World Events"] .. ": " .. L["Midnight"], Retail = true, Entries = {
                { Families = settings .. "WorldEvents.args.EXPANSION_NAME11" },
            } },
            { Header = L["World Events"] .. ": " .. L["The War Within"], Retail = true, Entries = {
                { Families = settings .. "WorldEvents.args.EXPANSION_NAME10" },
            } },
            { Header = L["World Events"] .. ": " .. L["Dragonflight"], Retail = true, Entries = {
                { Families = settings .. "WorldEvents.args.EXPANSION_NAME9" },
            } },
            { Header = L["World Events"] .. ": " .. L["Shadowlands"], Retail = true, Entries = {
                { Families = settings .. "WorldEvents.args.EXPANSION_NAME8" },
            } },
            { Header = L["World Events"] .. ": " .. L["Battle for Azeroth"], Retail = true, Entries = {
                { Families = settings .. "WorldEvents.args.EXPANSION_NAME7" },
            } },
            { Header = L["World Events"] .. ": " .. L["Legion"], Retail = true, Entries = {
                { Families = settings .. "WorldEvents.args.EXPANSION_NAME6" },
            } },
        } },
    }
end

addon.Features.AddOptions("EventReminders", {
    Defaults = defaults,
    Rows = Rows,
    Beside = Beside,
    Late = KrowiAF.InjectEventDataDynamicOptions, -- the per-event toggles, from the data files (EventOptions.lua)
    Sections = Sections
})
