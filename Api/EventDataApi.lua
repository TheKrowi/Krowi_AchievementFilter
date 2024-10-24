local _, addon = ...;

KrowiAF.EventData = {};

local function InjectOptionsDefaults(eventType, eventIds, hideByDefault)
    if hideByDefault == nil then
        hideByDefault = false;
    end
    if not addon.InjectOptions:DefaultsExists("EventReminders." .. eventType .. "Events") then
        addon.InjectOptions:AddDefaults("EventReminders", eventType .. "Events", { });
    end
    for _, eventId in next, eventIds do
        addon.InjectOptions:AddDefaults("EventReminders." .. eventType .. "Events", eventId, not hideByDefault);
    end
end

local function GetExpansionNameFromId(expansionId)
    return expansionId and ("EXPANSION_NAME" .. tostring(expansionId));
end

local function GetGroupNameFromDisplayName(groupDisplayName)
    return groupDisplayName:gsub("[%p%c%s]", "_");
end

local OrderPP = addon.InjectOptions.AutoOrderPlusPlus;
local AdjustedWidth = addon.InjectOptions.AdjustedWidth;
local function InjectOptionsTable(eventTypeGroup, eventType, eventIds, eventDisplayName, groupDisplayName, order, expansionId)
    local path = "EventReminders.args." .. eventTypeGroup .. "Events.args";
    local expansionName = GetExpansionNameFromId(expansionId);
    if expansionName then
        if not addon.InjectOptions:TableExists(path .. "." .. expansionName) then
            addon.InjectOptions:AddTable(path, expansionName, {
                order = expansionId, type = "group",
                name = _G[expansionName],
                args = {}
            });
        end
        path = path .. "." .. expansionName .. ".args";
    end
    local groupName = GetGroupNameFromDisplayName(groupDisplayName);
    if not addon.InjectOptions:TableExists(path .. "." .. groupName) then
        addon.InjectOptions:AddTable(path, groupName, {
            order = order, type = "group",
            name = groupDisplayName,
            args = {}
        });
    end
    path = path .. "." .. groupName .. ".args";
    addon.InjectOptions:AddTable(path, tostring(eventIds[1]), {
        order = OrderPP(), type = "toggle", width = AdjustedWidth(),
        name = eventDisplayName,
        get = function() return addon.Options.db.profile.EventReminders[eventType .. "Events"][eventIds[1]]; end,
        set = function(_, value)
            for _, eventId in next, eventIds do
                addon.Options.db.profile.EventReminders[eventType .. "Events"][eventId] = value;
            end
            addon.Gui.EventReminderSideButtonSystem:Refresh();
        end
    });
end

local function RegisterEventOptions(eventTypeGroup, eventType, eventIds, eventDisplayName, groupDisplayName, order, expansionId, hideByDefault)
    InjectOptionsDefaults(eventType, eventIds, hideByDefault);
    InjectOptionsTable(eventTypeGroup, eventType, eventIds, eventDisplayName, groupDisplayName, order, expansionId);
end

local function SetEvents(path, value)
    local appName = addon.Metadata.Prefix .. "_EventReminders";
    local events = KrowiAF_GetOptions.GetTable(appName, path);
    for _, event in next, events do
        if event.set then
            event.set(_, value);
        end
    end
end

local function RegisterDynamicDeSelectAllEventOptions(eventType, groupDisplayName, expansionId)
    local groupName = GetGroupNameFromDisplayName(groupDisplayName);
    local expansionName = GetExpansionNameFromId(expansionId);
    local tablePath = "args." .. eventType .. "Events.args." .. (expansionName and (expansionName .. ".args.") or "") .. groupName .. ".args";
    local path = "EventReminders." .. tablePath;
    if addon.InjectOptions:TableExists(path .. ".SelectAll") then
        return;
    end

    addon.InjectOptions:AddTable(path, "Blank1", {
        order = 1000, type = "description", width = "full", name = ""
    });
    if not expansionName then
        addon.InjectOptions:AddTable(path, "Blank2", {
            order = 1001, type = "description", width = AdjustedWidth(), name = ""
        });
    end
    addon.InjectOptions:AddTable(path, "SelectAll", {
        order = 1002, type = "execute", width = AdjustedWidth(),
        name = addon.L["Select All"],
        func = function()
            SetEvents(tablePath, true);
        end
    });
    addon.InjectOptions:AddTable(path, "DeselectAll", {
        order = 1003, type = "execute", width = AdjustedWidth(),
        name = addon.L["Deselect All"],
        func = function()
            SetEvents(tablePath, false);
        end
    });
end

function KrowiAF.InjectEventDataDynamicOptions()
    for _, v1 in next, KrowiAF.EventData do
        for _, v2 in next, v1 do
            KrowiAF.RegisterEventDataOptions(select(2, unpack(v2)));
        end
    end
end

function KrowiAF.RegisterEventDataOptions(eventIds, eventType, categoryId, icon, eventName, eventGroup, groupOrder, expansionId, hideByDefault, mapId)
    if not addon.Util.IsTable(eventIds) then
        eventIds = {eventIds};
    end
    if addon.Util.IsTable(eventName) then
        eventName = eventName[2];
    end

    local eventTypeGroup;
    if eventType == addon.Objects.EventType.Calendar then
        eventType = "Calendar";
    elseif eventType == addon.Objects.EventType.Widget then
        eventType = "Widget";
        eventTypeGroup = "World";
    elseif eventType == addon.Objects.EventType.World then
        eventType = "World";
    end

    RegisterEventOptions(eventTypeGroup or eventType, eventType, eventIds, eventName, eventGroup, groupOrder, expansionId, hideByDefault);
    RegisterDynamicDeSelectAllEventOptions(eventTypeGroup or eventType, eventGroup, expansionId);
end

function KrowiAF.AddEventData(eventIds, eventType, categoryId, icon, eventName, eventGroup, groupOrder, expansionId, hideByDefault, mapId)
    if not addon.Util.IsTable(eventIds) then
        eventIds = {eventIds};
    end
    if addon.Util.IsTable(eventName) then
        eventName = eventName[1] .. ": " .. eventName[2];
    end

    if addon.Util.IsTable(eventIds) then
        for _, eventId in next, eventIds do
            addon.Data.Events[eventType][eventId] = addon.Objects.Event:New(eventId, eventIds, addon.Data.Categories[categoryId], eventType, icon, eventName, mapId);
        end
    end
end