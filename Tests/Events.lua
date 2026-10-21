local _, addon = ...
addon.Tests.Events = {}
local events = addon.Tests.Events

-- Event reminders from Blizzard's event scheduler and from fixed schedules (docs/work/2026-10-21-event-scheduler). The
-- scenarios run at fixed times on a fixture shaped like what C_EventScheduler returned in game on 2026-10-21
-- (Tests/Scheduler.lua): the five Curse Surge variants of The Coiled Isle, area POIs 8936-8940, one every 1800 s in
-- the order the game showed, each lasting 1800 s plus a few seconds, and one occurrence listed twice under its key, as
-- the game lists every Aqir Invasion. In game the fixture replaces the scheduler cache for the run and the real data
-- is read again after it; headlessly (.claude/tools/headless/run-tests.lua) the same fixture comes from a model of the
-- scheduler, on the real data load. The soup's scenarios read Community Feast: Next (4729) and Active (4731) at fixed
-- UTC times, with the widget absent, as anywhere outside the Azure Span. They read the player's region, so in game they
-- SKIP outside Europe; the schedule of the other regions is checked directly on its own function.
-- Kind:
--   Surge: GetWorldEventDetails of Event at T0 + At; "no event" when no event is registered for the POI, "not active",
--     or "ends at T0+<seconds>" and whether its name is the game's
--   Surges: which of the five Curse Surge events is going on at T0 + At
--   Duplicates: how many occurrences the scheduler cache keeps for Poi after the fixture
--   Soup: GetWidgetEventDetails of Event at At; "not shown", or "ends in <seconds>"
--   FeastTimes: the soup schedule of Region at At: "next start in <seconds>, active <seconds> left | not active"
-- Until 2026-10-21 no Curse Surge event existed, nothing kept scheduler data, and the soup was only shown while its
-- widget was there, in its zone (the Recorded values of the before-run, verified in game on Retail 12.1.5).

local surgeOrder = {8938, 8936, 8939, 8937, 8940}
local surgeT0 = 1800000000 -- 2027-01-15 08:00:00 UTC, on the half hour
local surgeLength, surgeJitter, surgeCount = 1800, 28, 10
local duplicatedIndex = 3 -- the third occurrence is listed twice, as the game lists every Aqir Invasion
local soupAt = 1800000000 -- 08:00 UTC: Europe's soups start at 01:00 and every 90 minutes, so the next at 08:30
events.Scenarios = {
    {Name = "curse-surge-active", Kind = "Surge", Event = 8938, At = 100, RetailOnly = true,
        Recorded = "ends at T0+1828, game name", Target = "ends at T0+1828, game name"},
    {Name = "curse-surge-rotation", Kind = "Surges", At = 1840, RetailOnly = true, -- past the first one's end, start plus its 28 s
        Recorded = "8936", Target = "8936"},
    {Name = "curse-surge-after-last", Kind = "Surges", At = surgeCount * surgeLength + 100, RetailOnly = true,
        Recorded = "none", Target = "none"},
    {Name = "curse-surge-duplicate-key", Kind = "Duplicates", Poi = 8939, RetailOnly = true,
        Recorded = "2", Target = "2"},
    {Name = "soup-next-eu", Kind = "Soup", Event = 4729, At = soupAt, RetailOnly = true,
        Recorded = "ends in 1800", Target = "ends in 1800"},
    {Name = "soup-active-eu", Kind = "Soup", Event = 4731, At = soupAt + 1800 + 300, RetailOnly = true,
        Recorded = "ends in 600", Target = "ends in 600"},
    {Name = "soup-between-eu", Kind = "Soup", Event = 4731, At = soupAt, RetailOnly = true,
        Recorded = "not shown", Target = "not shown"},
    {Name = "feast-times-na", Kind = "FeastTimes", Region = 1, At = soupAt,
        Recorded = "next start in 3600, not active", Target = "next start in 3600, not active"},
    {Name = "feast-times-kr", Kind = "FeastTimes", Region = 2, At = soupAt + 60, -- Korea's soups start at 00:30 and every 90 minutes: 08:00 here
        Recorded = "next start in 5340, active 840 left", Target = "next start in 5340, active 840 left"},
    {Name = "feast-times-unknown-region", Kind = "FeastTimes", Region = 99, At = soupAt,
        Recorded = "no schedule", Target = "no schedule"}
}
-- RetailOnly: the Curse Surges and the soup are DataAddons/Retail events; FeastTimes runs on every client
local europe = 3 -- GetCurrentRegion

-- The fixture, as C_EventScheduler.GetScheduledEvents returns it: one table per occurrence
function events.Fixture()
    local list = {}
    for i = 1, surgeCount do
        local poi = surgeOrder[(i - 1) % #surgeOrder + 1]
        local start = surgeT0 + (i - 1) * surgeLength
        local info = {areaPoiID = poi, eventID = 41 + poi - 8935, eventKey = "fixture" .. i, startTime = start, endTime = start + surgeLength + surgeJitter, duration = surgeLength}
        tinsert(list, info)
        if i == duplicatedIndex then
            tinsert(list, {areaPoiID = poi, eventID = 99, eventKey = info.eventKey, startTime = start, endTime = info.endTime, duration = surgeLength})
        end
    end
    return list
end

local function WorldEvent(id)
    return addon.Data.Events[KrowiAF.Enum.EventType.World][id]
end

local function WidgetEvent(id)
    return addon.Data.Events[KrowiAF.Enum.EventType.Widget][id]
end

local function DescribeSurge(env, scenario)
    local event = WorldEvent(scenario.Event)
    if not event then
        return "no event"
    end
    local details = addon.EventData.GetWorldEventDetails(event, surgeT0 + scenario.At)
    if not details or not details.EndTime then
        return "not active"
    end
    return ("ends at T0+%d, %s name"):format(details.EndTime - surgeT0, details.Name == env.PoiName(scenario.Event) and "game" or "fallback")
end

local function DescribeSurges(scenario)
    local active = {}
    for _, poi in ipairs(surgeOrder) do
        local event = WorldEvent(poi)
        if event and addon.EventData.GetWorldEventDetails(event, surgeT0 + scenario.At) then
            tinsert(active, tostring(poi))
        end
    end
    sort(active)
    return #active > 0 and table.concat(active, ",") or "none"
end

local function DescribeDuplicates(scenario)
    local scheduler = addon.Data.EventScheduler
    if not scheduler then
        return "no scheduler"
    end
    return tostring(scheduler.CountOccurrences(scenario.Poi))
end

local function DescribeSoup(scenario)
    local event = WidgetEvent(scenario.Event)
    if not event then
        return "no event"
    end
    local details = addon.EventData.GetWidgetEventDetails(event, scenario.At)
    if not details or not details.EndTime then
        return "not shown"
    end
    return ("ends in %d"):format(details.EndTime - scenario.At)
end

local function DescribeFeastTimes(scenario)
    local timers = addon.Data.CustomWidgetEventTimers
    if not timers.FeastTimes then
        return "no schedule"
    end
    local secondsToNext, secondsLeft = timers.FeastTimes(scenario.At, scenario.Region)
    if not secondsToNext then
        return "no schedule"
    end
    return ("next start in %d, %s"):format(secondsToNext, secondsLeft and ("active " .. secondsLeft .. " left") or "not active")
end

-- env: IsRetail() -> bool; Region() -> GetCurrentRegion(); PoiName(id) -> the game's name for an area POI
-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line
local function RunScenario(env, scenario)
    local got, blocked
    if scenario.Kind == "Surge" then
        got = DescribeSurge(env, scenario)
    elseif scenario.Kind == "Surges" then
        got = DescribeSurges(scenario)
    elseif scenario.Kind == "Duplicates" then
        got = DescribeDuplicates(scenario)
    elseif scenario.Kind == "Soup" then
        if env.Region() ~= europe then
            blocked = "the soup scenarios read the player's region, Europe; the other regions are the feast-times scenarios"
        else
            got = DescribeSoup(scenario)
        end
    elseif scenario.Kind == "FeastTimes" then
        got = DescribeFeastTimes(scenario)
    else
        blocked = "unknown kind " .. tostring(scenario.Kind)
    end

    local status, targetMet, tail
    if blocked then
        status, tail = "SKIP", blocked
    else
        status = got == scenario.Recorded and "PASS" or "FAIL"
        targetMet = got == scenario.Target
        tail = ("got=[%s] target=[%s] %s"):format(got, scenario.Target, targetMet and "met" or "open")
    end
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("events/%s: %s recorded=[%s] %s"):format(scenario.Name, status, scenario.Recorded, tail)
    }
end

-- The fixture goes into the scheduler cache for the run; Restore() puts the real data back after it
function events.Run(env, observations)
    local scheduler = addon.Data.EventScheduler
    if scheduler then
        scheduler.LoadForTest(events.Fixture())
    end
    local results = {}
    local isRetail = env.IsRetail()
    local ok, err = pcall(function()
        for _, scenario in ipairs(events.Scenarios) do
            if isRetail or not scenario.RetailOnly then
                tinsert(results, RunScenario(env, scenario))
            end
        end
    end)
    if scheduler then
        env.Restore()
    end
    if not ok then
        error(err, 0)
    end
    if not scheduler then
        tinsert(observations, "no scheduler cache (Data/EventScheduler.lua) on this build")
    end
    return results
end

-- [[ Environment: the game's own scheduler, POI names and region; the headless runner provides a model of them ]] --

local gameEnv = {}
events.GameEnv = gameEnv

function gameEnv.IsRetail()
    return addon.Util.IsMainline
end

function gameEnv.Region()
    return GetCurrentRegion()
end

function gameEnv.PoiName(id)
    local poi = C_AreaPoiInfo and C_AreaPoiInfo.GetAreaPOIInfo(nil, id)
    return poi and poi.name
end

function gameEnv.Restore()
    local scheduler = addon.Data.EventScheduler
    scheduler.Reset()
    scheduler.EnsureData()
end

-- What is going on now, from the real data: the Curse Surge and its end, and the soup; standing in the Azure Span, the
-- widget's own reading next to the schedule's, which checks the region offsets (Data/CustomWidgetEventTimers.lua)
local function ObserveLive(observations)
    local now = GetServerTime()
    local surge
    for _, poi in ipairs(surgeOrder) do
        local event = WorldEvent(poi)
        local details = event and addon.EventData.GetWorldEventDetails(event)
        if details and details.EndTime then
            surge = ("%s (%d) until %s"):format(tostring(details.Name), poi, date("%H:%M:%S", details.EndTime))
        end
    end
    tinsert(observations, "Curse Surge now: " .. (surge or "none known"))
    local timers = addon.Data.CustomWidgetEventTimers
    if timers.FeastTimes then
        local secondsToNext, secondsLeft = timers.FeastTimes(now, GetCurrentRegion())
        tinsert(observations, ("soup by the schedule: next start in %s s, %s"):format(tostring(secondsToNext), secondsLeft and ("active, " .. secondsLeft .. " s left") or "not active"))
    end
    for _, widgetId in ipairs({4729, 4731}) do
        local info = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(widgetId)
        tinsert(observations, ("soup widget %d: %s"):format(widgetId, info and ("%q"):format(tostring(info.text)) or "not here (only in the Azure Span)"))
    end
end

addon.Tests.Ready.events = function()
    if not addon.Data.IsLoaded then
        return false, "the data load has not finished"
    end
    return true
end

addon.Tests.Suites.events = function()
    local observations = {}
    local results = events.Run(gameEnv, observations)
    if addon.Util.IsMainline then
        ObserveLive(observations)
    end
    return results, observations
end