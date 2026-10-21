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
--   Scheduler: what Data/EventScheduler.lua does in the story Story, told through a model of the game in place of the
--     game (UseSourceForTest): the scheduler's answers and the calls made to it, combat, the world map and the clock. The
--     model lists the five Curse Surges every 9000 s for three days from its clock, as the game does, so the stories
--     run the same in game and headlessly.
-- Until 2026-10-21 no Curse Surge event existed, nothing kept scheduler data, and the soup was only shown while its
-- widget was there, in its zone (the Recorded values of the before-run, verified in game on Retail 12.1.5). The code
-- review of 2026-10-21 found what the scheduler stories record, and Krowi chose that the soup's Next shows only in the
-- 15 minutes before a cooking, not all the time.

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
    {Name = "soup-next-eu", Kind = "Soup", Event = 4729, At = soupAt, RetailOnly = true, -- 30 minutes before a cooking
        Recorded = "not shown", Target = "not shown"},
    {Name = "soup-next-soon-eu", Kind = "Soup", Event = 4729, At = soupAt + 1200, RetailOnly = true, -- 10 minutes before
        Recorded = "ends in 600", Target = "ends in 600"},
    {Name = "soup-active-eu", Kind = "Soup", Event = 4731, At = soupAt + 1800 + 300, RetailOnly = true,
        Recorded = "ends in 600", Target = "ends in 600"},
    {Name = "soup-between-eu", Kind = "Soup", Event = 4731, At = soupAt, RetailOnly = true,
        Recorded = "not shown", Target = "not shown"},
    {Name = "feast-times-na", Kind = "FeastTimes", Region = 1, At = soupAt,
        Recorded = "next start in 3600, not active", Target = "next start in 3600, not active"},
    {Name = "feast-times-kr", Kind = "FeastTimes", Region = 2, At = soupAt + 60, -- Korea's soups start at 00:30 and every 90 minutes: 08:00 here
        Recorded = "next start in 5340, active 840 left", Target = "next start in 5340, active 840 left"},
    {Name = "feast-times-unknown-region", Kind = "FeastTimes", Region = 99, At = soupAt,
        Recorded = "no schedule", Target = "no schedule"},
    {Name = "scheduler-answer", Kind = "Scheduler", Story = "Answer", RetailOnly = true,
        Recorded = "login with no data: asked 1, read 0; the answer: read 1; an update not asked for: read 0", Target = "login with no data: asked 1, read 0; the answer: read 1; an update not asked for: read 0"},
    {Name = "scheduler-refill", Kind = "Scheduler", Story = "Refill", RetailOnly = true,
        Recorded = "reads 1; times short: reads 2; a lookup after: reads 2", Target = "reads 1; times short: reads 2; a lookup after: reads 2"},
    {Name = "scheduler-refill-mid-lookup", Kind = "Scheduler", Story = "RefillMidLookup", RetailOnly = true,
        Recorded = "going on", Target = "going on"},
    {Name = "scheduler-pending-lapses", Kind = "Scheduler", Story = "PendingLapses", RetailOnly = true,
        Recorded = "answer with the map open: read 0; while pending: calls 0; 301 s after asking: read 1", Target = "answer with the map open: read 0; while pending: calls 0; 301 s after asking: read 1"},
    {Name = "scheduler-combat", Kind = "Scheduler", Story = "Combat", RetailOnly = true,
        Recorded = "in combat: calls 0; after combat: read 1", Target = "in combat: calls 0; after combat: read 1"},
    {Name = "scheduler-fired-inside", Kind = "Scheduler", Story = "FiredInside", RetailOnly = true,
        Recorded = "reported; calls after 0", Target = "reported; calls after 0"},
    {Name = "scheduler-unlisted-variant", Kind = "Scheduler", Story = "Unlisted", RetailOnly = true,
        Recorded = "reads in six hours 1", Target = "reads in six hours 1"},
    {Name = "scheduler-reminders-off", Kind = "Scheduler", Story = "RemindersOff", RetailOnly = true,
        Recorded = "calls 0", Target = "calls 0"},
    {Name = "scheduler-name-arrives", Kind = "Scheduler", Story = "NameArrives", RetailOnly = true,
        Recorded = "before: none; after: game", Target = "before: none; after: game"}
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

-- [[ The scheduler stories: Data/EventScheduler.lua driven through a model of the game ]] --

local soonAfterLogin = 26 * surgeLength * 5 + 50 -- 26 rotations on: inside an occurrence, and the kept times short

local function NewModel()
    local scheduler = addon.Data.EventScheduler
    local model = {Now = surgeT0, Data = true, Combat = false, Map = false, FireInside = false, Names = {}, Reads = 0, Requests = 0}
    model.Listed = {}
    for _, poi in ipairs(surgeOrder) do
        model.Listed[poi] = true
    end
    local function Fire()
        if model.FireInside then
            scheduler.HandleEventForTest("EVENT_SCHEDULER_UPDATE")
        end
    end
    model.Source = {
        Available = function() return true end,
        HasData = function() return model.Data end,
        GetScheduledEvents = function()
            model.Reads = model.Reads + 1
            Fire()
            local list = {}
            for poi in next, model.Listed do
                for n = 0, 28 do
                    local start = model.Now - 100 + n * surgeLength * 5
                    tinsert(list, {areaPoiID = poi, eventKey = poi .. ":" .. start, startTime = start, endTime = start + surgeLength + surgeJitter})
                end
            end
            return list
        end,
        RequestEvents = function()
            model.Requests = model.Requests + 1
            Fire()
        end,
        InCombat = function() return model.Combat end,
        MapShown = function() return model.Map end,
        Now = function() return model.Now end,
        PoiName = function(id) return model.Names[id] end,
        Report = function(message) model.Reported = message end,
    }
    return model
end

local function Calls(model)
    return model.Reads + model.Requests
end

local stories = {}

function stories.Answer(model, scheduler)
    model.Data = false
    scheduler.EnsureData()
    local login = ("login with no data: asked %d, read %d"):format(model.Requests, model.Reads)
    model.Data = true
    scheduler.HandleEventForTest("EVENT_SCHEDULER_UPDATE")
    local answered = model.Reads
    scheduler.HandleEventForTest("EVENT_SCHEDULER_UPDATE")
    return ("%s; the answer: read %d; an update not asked for: read %d"):format(login, answered, model.Reads - answered)
end

function stories.Refill(model, scheduler)
    scheduler.EnsureData()
    local login = model.Reads
    model.Now = model.Now + soonAfterLogin
    scheduler.GetOccurrence(8938, model.Now)
    local short = model.Reads
    model.Now = model.Now + 10
    scheduler.GetOccurrence(8938, model.Now)
    return ("reads %d; times short: reads %d; a lookup after: reads %d"):format(login, short, model.Reads)
end

-- The lookup that finds the times short and reads again finds the occurrence going on in what it read
function stories.RefillMidLookup(model, scheduler)
    scheduler.EnsureData()
    model.Now = model.Now + soonAfterLogin
    return scheduler.GetOccurrence(8938, model.Now) and "going on" or "not active"
end

function stories.PendingLapses(model, scheduler)
    model.Data = false
    scheduler.EnsureData()
    model.Data, model.Map = true, true
    scheduler.HandleEventForTest("EVENT_SCHEDULER_UPDATE")
    local mapOpen = model.Reads
    model.Map = false
    local before = Calls(model)
    model.Now = model.Now + 100
    scheduler.GetOccurrence(8938, model.Now)
    local pending = Calls(model) - before
    model.Now = model.Now + 201
    scheduler.GetOccurrence(8938, model.Now)
    return ("answer with the map open: read %d; while pending: calls %d; 301 s after asking: read %d"):format(mapOpen, pending, model.Reads)
end

function stories.Combat(model, scheduler)
    model.Combat = true
    scheduler.EnsureData()
    local during = Calls(model)
    model.Combat = false
    scheduler.HandleEventForTest("PLAYER_REGEN_ENABLED")
    return ("in combat: calls %d; after combat: read %d"):format(during, model.Reads)
end

-- The update fires inside the addon's read: the scheduler is left alone after it, also after a Reset
function stories.FiredInside(model, scheduler)
    model.FireInside = true
    scheduler.EnsureData()
    model.FireInside = false
    local before = Calls(model)
    model.Now = model.Now + soonAfterLogin
    scheduler.GetOccurrence(8938, model.Now)
    scheduler.Reset()
    scheduler.EnsureData()
    return ("%s; calls after %d"):format(model.Reported and "reported" or "not reported", Calls(model) - before)
end

-- One variant the game does not list, looked up every minute for six hours with the others
function stories.Unlisted(model, scheduler)
    model.Listed[8936] = nil
    scheduler.EnsureData()
    for _ = 1, 360 do
        model.Now = model.Now + 60
        scheduler.GetOccurrence(8936, model.Now)
        scheduler.GetOccurrence(8938, model.Now)
    end
    return ("reads in six hours %d"):format(model.Reads)
end

-- The login with event reminders turned off
function stories.RemindersOff(model, scheduler)
    local eventReminders = addon.Options.db.profile.EventReminders
    local enabled = eventReminders.Enabled
    eventReminders.Enabled = false
    local ok, err = pcall(scheduler.EnsureData)
    eventReminders.Enabled = enabled
    if not ok then
        error(err, 0)
    end
    return ("calls %d"):format(Calls(model))
end

-- The game does not know the POI's name at the first lookup, and does at the next
function stories.NameArrives(model, scheduler)
    local before = scheduler.GetName(8938)
    model.Names[8938] = "Curse Surge: The Broodmother's Nest"
    local after = scheduler.GetName(8938)
    return ("before: %s; after: %s"):format(before and "game" or "none", after and "game" or "none")
end

-- The story runs on a model; then the game is the source again, and the fixture back in the cache for the next scenario
local function TellStory(scenario)
    local scheduler = addon.Data.EventScheduler
    if not scheduler or not scheduler.UseSourceForTest then
        return "no scheduler"
    end
    local model = NewModel()
    scheduler.UseSourceForTest(model.Source)
    local ok, result = pcall(stories[scenario.Story], model, scheduler)
    scheduler.UseSourceForTest(nil)
    scheduler.LoadForTest(events.Fixture())
    if not ok then
        error(result, 0)
    end
    return result
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
    elseif scenario.Kind == "Scheduler" then
        got = TellStory(scenario)
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

-- The toggles the scenarios read, on for the run whatever the player chose, and put back after it. A client has a
-- type's toggles only when it has events of that type: Classic has neither world nor widget event toggles.
local function ForceToggles()
    local eventReminders = addon.Options.db.profile.EventReminders
    local saved = {Enabled = eventReminders.Enabled, World = {}, Widget = {}}
    eventReminders.Enabled = true
    if eventReminders.WorldEvents then
        for _, poi in ipairs(surgeOrder) do
            saved.World[poi] = eventReminders.WorldEvents[poi]
            eventReminders.WorldEvents[poi] = true
        end
    end
    if eventReminders.WidgetEvents then
        for _, id in ipairs({4729, 4731}) do
            saved.Widget[id] = eventReminders.WidgetEvents[id]
            eventReminders.WidgetEvents[id] = true
        end
    end
    return saved
end

-- The player's toggles back, and the events' details read again at the real time, which the scenarios' times replaced
local function RestoreToggles(saved)
    local eventReminders = addon.Options.db.profile.EventReminders
    eventReminders.Enabled = saved.Enabled
    for poi, value in next, saved.World do
        eventReminders.WorldEvents[poi] = value
        local event = WorldEvent(poi)
        if event then
            addon.EventData.GetWorldEventDetails(event)
        end
    end
    for id, value in next, saved.Widget do
        eventReminders.WidgetEvents[id] = value
        local event = WidgetEvent(id)
        if event then
            addon.EventData.GetWidgetEventDetails(event)
        end
    end
end

-- The fixture goes into the scheduler cache for the run; Restore() puts the real data back after it
function events.Run(env, observations)
    local scheduler = addon.Data.EventScheduler
    local saved = ForceToggles()
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
    RestoreToggles(saved)
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