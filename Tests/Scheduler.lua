local _, addon = ...

-- What Blizzard's event scheduler (C_EventScheduler, behind the world map's Events tab) gives an addon, and whether
-- reading it from addon code taints Blizzard's own reminder code (docs/work/2026-10-21-event-scheduler). Game only and
-- all observations, no scenarios: Read-GameTests.ps1 prints them. It changes nothing in the scheduler or in Blizzard's
-- frames.
-- The taint question: Blizzard's EventSchedulerReminderManager handles EVENT_SCHEDULER_UPDATE at all times, through
-- EventRegistry (Blizzard_UIPanels_Game/Mainline/EventScheduler.lua:849), and the event is synchronous
-- (Blizzard_APIDocumentationGenerated/EventSchedulerUIDocumentation.lua). If an addon's read fires it inside the
-- addon's own call, Blizzard's handler runs tainted: its chat announcements, ClearReminder and the timer it keeps. The
-- probe therefore records, for each call, whether its own frame got EVENT_SCHEDULER_UPDATE during the call, and whether
-- the reminder manager's fields are still secure after it.
-- Run it with the world map closed (the Events tab registers the same event while shown), out of combat, as the first
-- suite after a /reload, never after /kaftest worldmap, which opens the map, and /reload after it, since a tainted
-- manager stays tainted. A reminder set on one event in the Events tab beforehand (right-click, Set
-- Reminder) makes Blizzard's handler go past its early return, so the field check means more.

local waitSeconds = 10
local managerFields = {"timer", "warnings", "blockRefresh"}

local function SecureText(ok, isSecure, source)
    if not ok then
        return "unreadable"
    end
    return isSecure and "secure" or ("tainted by " .. tostring(source))
end

local function ObserveManager(observations, label)
    local manager = EventSchedulerReminderManager
    if type(manager) ~= "table" then
        tinsert(observations, label .. ": EventSchedulerReminderManager does not exist on this client")
        return
    end
    local parts = {"global " .. SecureText(pcall(issecurevariable, "EventSchedulerReminderManager"))}
    for _, field in ipairs(managerFields) do
        if rawget(manager, field) == nil then
            tinsert(parts, field .. " unset")
        else
            tinsert(parts, field .. " " .. SecureText(pcall(issecurevariable, manager, field)))
        end
    end
    tinsert(observations, label .. ": reminder manager " .. table.concat(parts, ", "))
end

local function TimeText(t)
    return t and date("%Y-%m-%d %H:%M:%S", t) or "nil"
end

-- The API functions below may return no value at all, which tostring rejects, so each call is wrapped in parentheses
local function PoiText(areaPoiID)
    local poi = C_AreaPoiInfo.GetAreaPOIInfo(nil, areaPoiID)
    return ("poi %s %q, zone %q, map %s"):format(tostring(areaPoiID), tostring(poi and poi.name), tostring((C_EventScheduler.GetEventZoneName(areaPoiID))),
        tostring((C_EventScheduler.GetEventUiMapID(areaPoiID))))
end

local rawLines = 12 -- the first scheduled entries listed as they come; the rest only in the per-POI summary

-- One line per area POI: how often it comes, how long it lasts and how far apart its starts are, which is what a
-- schedule needs; event ids and keys as seen, a key shared by two entries counted once (Blizzard's tab drops duplicates)
local function ObserveScheduledSummary(observations, scheduled)
    local byPoi, order = {}, {}
    for _, info in ipairs(scheduled) do
        local poi = byPoi[info.areaPoiID]
        if not poi then
            poi = {Starts = {}, Durations = {}, EventIds = {}, Keys = {}, Duplicates = 0}
            byPoi[info.areaPoiID] = poi
            tinsert(order, info.areaPoiID)
        end
        poi.EventIds[tostring(info.eventID)] = true
        if poi.Keys[info.eventKey] then
            poi.Duplicates = poi.Duplicates + 1
        else
            poi.Keys[info.eventKey] = true
            tinsert(poi.Starts, info.startTime)
            poi.Durations[tostring(info.duration)] = true
        end
    end
    for _, areaPoiID in ipairs(order) do
        local poi = byPoi[areaPoiID]
        sort(poi.Starts)
        local gaps = {}
        for i = 2, #poi.Starts do
            gaps[tostring(poi.Starts[i] - poi.Starts[i - 1])] = true
        end
        local function Keys(t)
            local list = {}
            for key in next, t do
                tinsert(list, key)
            end
            sort(list)
            return table.concat(list, "/")
        end
        tinsert(observations, ("  summary %s; event ids %s; %d occurrences from %s to %s; durations %s s; gaps between starts %s s; %d duplicate keys"):format(
            PoiText(areaPoiID), Keys(poi.EventIds), #poi.Starts, TimeText(poi.Starts[1]), TimeText(poi.Starts[#poi.Starts]), Keys(poi.Durations), Keys(gaps), poi.Duplicates))
    end
end

local function ObserveEvents(observations, label, scheduled, ongoing, countsOnly)
    if not scheduled then
        tinsert(observations, label .. ": GetScheduledEvents returned nothing")
    elseif countsOnly then
        tinsert(observations, ("%s: %d scheduled events"):format(label, #scheduled))
    else
        tinsert(observations, ("%s: %d scheduled events"):format(label, #scheduled))
        for i = 1, math.min(#scheduled, rawLines) do
            local info = scheduled[i]
            tinsert(observations, ("  scheduled %s; eventID %s, key %s; %s to %s (%s s); reminder %s, rewards claimed %s, hide time left %s"):format(
                PoiText(info.areaPoiID), tostring(info.eventID), tostring(info.eventKey), TimeText(info.startTime), TimeText(info.endTime), tostring(info.duration),
                tostring(info.hasReminder), tostring(info.rewardsClaimed), tostring(info.displayInfo and info.displayInfo.hideTimeLeft)))
        end
        ObserveScheduledSummary(observations, scheduled)
    end
    if not ongoing then
        tinsert(observations, label .. ": GetOngoingEvents returned nothing")
    else
        tinsert(observations, ("%s: %d ongoing events"):format(label, #ongoing))
        for _, info in ipairs(ongoing) do
            tinsert(observations, ("  ongoing %s; seconds left %s; rewards claimed %s, hide time left %s"):format(
                PoiText(info.areaPoiID), tostring((C_AreaPoiInfo.GetAreaPOISecondsLeft(info.areaPoiID))), tostring(info.rewardsClaimed),
                tostring(info.displayInfo and info.displayInfo.hideTimeLeft)))
        end
    end
end

local probeFrame -- one frame for every run
local calling -- the label of the scheduler call in progress, so a synchronous EVENT_SCHEDULER_UPDATE is attributed to it
local firedDuring, firedAfter

local function Call(observations, label, func)
    firedDuring[label] = 0
    calling = label
    local ok, result = pcall(func)
    calling = nil
    tinsert(observations, ("%s: %s; EVENT_SCHEDULER_UPDATE fired %d time(s) during the call"):format(label, ok and "returned" or ("errored: " .. tostring(result)), firedDuring[label]))
    return ok and result or nil
end

local running -- a run is waiting for the scheduler's answer

addon.Tests.Ready.scheduler = function()
    if running then
        return false, "the previous scheduler run is still waiting"
    end
    if not C_EventScheduler then
        return false, "this client has no C_EventScheduler"
    end
    if WorldMapFrame and WorldMapFrame:IsShown() then
        return false, "close the world map first: its Events tab handles the same event while shown"
    end
    return true
end

local function StopListening()
    probeFrame:SetScript("OnEvent", nil)
    probeFrame:UnregisterAllEvents()
end

local function ObserveFirstReads(observations)
    tinsert(observations, ("can show events %s, has data %s, has saved reminders %s, active continent %q"):format(tostring(C_EventScheduler.CanShowEvents()),
        tostring(C_EventScheduler.HasData()), tostring(C_EventScheduler.HasSavedReminders()), tostring((C_EventScheduler.GetActiveContinentName()))))
    ObserveManager(observations, "before")
    local scheduled = Call(observations, "GetScheduledEvents", C_EventScheduler.GetScheduledEvents)
    local ongoing = Call(observations, "GetOngoingEvents", C_EventScheduler.GetOngoingEvents)
    ObserveManager(observations, "after the reads")
    ObserveEvents(observations, "first read", scheduled, ongoing)
    Call(observations, "RequestEvents", C_EventScheduler.RequestEvents)
    ObserveManager(observations, "after RequestEvents")
end

addon.Tests.Async.scheduler = true
addon.Tests.Suites.scheduler = function(done)
    local observations = {}
    probeFrame = probeFrame or CreateFrame("Frame")
    firedDuring, firedAfter = {}, 0
    probeFrame:RegisterEvent("EVENT_SCHEDULER_UPDATE")
    probeFrame:SetScript("OnEvent", function()
        if calling then
            firedDuring[calling] = firedDuring[calling] + 1
        else
            firedAfter = firedAfter + 1
        end
    end)

    local ok, err = pcall(ObserveFirstReads, observations)
    calling = nil
    if not ok then -- reported, not raised, so the frame stops listening and what was observed is kept
        StopListening()
        tinsert(observations, "the probe errored: " .. tostring(err))
        done({}, observations)
        return
    end

    running = true
    print(("|cFF88CCFFKrowiAF Tests:|r scheduler: waiting %d s for the scheduler's answer"):format(waitSeconds))
    C_Timer.After(waitSeconds, function()
        StopListening()
        tinsert(observations, ("EVENT_SCHEDULER_UPDATE fired %d time(s) in the %d s after the calls"):format(firedAfter, waitSeconds))
        local scheduled = Call(observations, "GetScheduledEvents again", C_EventScheduler.GetScheduledEvents)
        local ongoing = Call(observations, "GetOngoingEvents again", C_EventScheduler.GetOngoingEvents)
        pcall(ObserveEvents, observations, "after the wait", scheduled, ongoing, true)
        ObserveManager(observations, "at the end")
        running = nil
        done({}, observations)
    end)
end