local _, addon = ...

-- The per-event toggles of the Reminder events section: one per event of the data files (KrowiAF.EventData), under its
-- expansion and group, with All and None per group. Built from the data, which loads after the feature's files, so the
-- registry runs InjectEventDataDynamicOptions in its options build (Features.lua, Late); the toggles exist, greyed,
-- while the feature is off. The public names stay for plugins (docs/work/2026-11-12-event-reminders, moved here from
-- Api/EventDataApi.lua).

local settingsPath = addon.Features.Path("EventReminders") .. ".args.Settings.args."

local function InjectOptionsDefaults(eventType, eventIds, hideByDefault)
    if hideByDefault == nil then
        hideByDefault = false
    end
    if not addon.InjectOptions:DefaultsExists("EventReminders." .. eventType .. "Events") then
        addon.InjectOptions:AddDefaults("EventReminders", eventType .. "Events", { })
    end
    for _, eventId in next, eventIds do
        addon.InjectOptions:AddDefaults("EventReminders." .. eventType .. "Events", eventId, not hideByDefault)
    end
end

local function GetExpansionNameFromId(expansionId)
    return expansionId and ("EXPANSION_NAME" .. tostring(expansionId))
end

local function GetGroupNameFromDisplayName(groupDisplayName)
    return groupDisplayName:gsub("[%p%c%s]", "_")
end

local OrderPP = addon.InjectOptions.AutoOrderPlusPlus
local AdjustedWidth = addon.InjectOptions.AdjustedWidth
local function InjectOptionsTable(eventTypeGroup, eventType, eventIds, eventDisplayName, groupDisplayName, order, expansionId)
    local path = settingsPath .. eventTypeGroup .. "Events.args"
    local expansionName = GetExpansionNameFromId(expansionId)
    if expansionName then
        if not addon.InjectOptions:TableExists(path .. "." .. expansionName) then
            addon.InjectOptions:AddTable(path, expansionName, {
                order = expansionId, type = "group",
                name = _G[expansionName],
                args = {}
            })
        end
        path = path .. "." .. expansionName .. ".args"
    end
    local groupName = GetGroupNameFromDisplayName(groupDisplayName)
    if not addon.InjectOptions:TableExists(path .. "." .. groupName) then
        addon.InjectOptions:AddTable(path, groupName, {
            order = order, type = "group",
            name = groupDisplayName,
            args = {}
        })
    end
    path = path .. "." .. groupName .. ".args"
    addon.InjectOptions:AddTable(path, tostring(eventIds[1]), {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = eventDisplayName,
        get = function() return addon.Options.db.profile.EventReminders[eventType .. "Events"][eventIds[1]]; end,
        set = function(_, value)
            for _, eventId in next, eventIds do
                addon.Options.db.profile.EventReminders[eventType .. "Events"][eventId] = value
            end
            addon.Gui.EventReminderSideButtonSystem:Refresh()
        end
    })
end

local function RegisterEventOptions(eventTypeGroup, eventType, eventIds, eventDisplayName, groupDisplayName, order, expansionId, hideByDefault)
    InjectOptionsDefaults(eventType, eventIds, hideByDefault)
    InjectOptionsTable(eventTypeGroup, eventType, eventIds, eventDisplayName, groupDisplayName, order, expansionId)
end

-- Sets every toggle of the group at path, a dotted path into the options table
local function SetEvents(path, value)
    local events = addon.Options.OptionsTable.args
    for part in path:gmatch("[^%.]+") do
        events = events[part]
    end
    for _, event in next, events do
        if event.set then
            event.set(nil, value)
        end
    end
end

local function RegisterDynamicDeSelectAllEventOptions(eventType, groupDisplayName, expansionId)
    local groupName = GetGroupNameFromDisplayName(groupDisplayName)
    local expansionName = GetExpansionNameFromId(expansionId)
    local path = settingsPath .. eventType .. "Events.args." .. (expansionName and (expansionName .. ".args.") or "") .. groupName .. ".args"
    if addon.InjectOptions:TableExists(path .. ".SelectAll") then
        return
    end

    addon.InjectOptions:AddTable(path, "Blank1", {
        order = 1000, type = "description", width = "full", name = ""
    })
    if not expansionName then
        addon.InjectOptions:AddTable(path, "Blank2", {
            order = 1001, type = "description", width = AdjustedWidth(), name = ""
        })
    end
    addon.InjectOptions:AddTable(path, "SelectAll", {
        order = 1002, type = "execute", width = AdjustedWidth(),
        name = addon.L["Select All"],
        func = function()
            SetEvents(path, true)
        end
    })
    addon.InjectOptions:AddTable(path, "DeselectAll", {
        order = 1003, type = "execute", width = AdjustedWidth(),
        name = addon.L["Deselect All"],
        func = function()
            SetEvents(path, false)
        end
    })
end

function KrowiAF.InjectEventDataDynamicOptions()
    for _, v1 in next, KrowiAF.EventData do
        for _, v2 in next, v1 do
            KrowiAF.RegisterEventDataOptions(select(2, unpack(v2)))
        end
    end
end

-- A scheduler event's toggle shows the game's name for its POI, which the game knows before the event is on; the same
-- name its reminders show (Features/EventReminders/Data/EventScheduler.lua)
local function GetSchedulerEventDisplayName(eventId, fallback)
    return function()
        return addon.EventReminders.EventScheduler.GetName(eventId) or fallback
    end
end

function KrowiAF.RegisterEventDataOptions(eventIds, eventType, categoryId, icon, eventName, eventGroup, groupOrder, expansionId, hideByDefault, mapId, source)
    if not addon.Util.IsTable(eventIds) then
        eventIds = {eventIds}
    end
    if addon.Util.IsTable(eventName) then
        eventName = eventName[2]
    end
    if source == KrowiAF.Enum.EventSource.Scheduler then
        eventName = GetSchedulerEventDisplayName(eventIds[1], eventName)
    end

    local eventTypeGroup
    if eventType == KrowiAF.Enum.EventType.Calendar then
        eventType = "Calendar"
    elseif eventType == KrowiAF.Enum.EventType.Widget then
        eventType = "Widget"
        eventTypeGroup = "World"
    elseif eventType == KrowiAF.Enum.EventType.World then
        eventType = "World"
    end

    RegisterEventOptions(eventTypeGroup or eventType, eventType, eventIds, eventName, eventGroup, groupOrder, expansionId, hideByDefault)
    RegisterDynamicDeSelectAllEventOptions(eventTypeGroup or eventType, eventGroup, expansionId)
end