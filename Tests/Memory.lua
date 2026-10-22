local addonName, addon = ...
addon.Tests.Memory = {}
local memory = addon.Tests.Memory

-- What the addon's background jobs allocate and keep (docs/work/2026-10-18-memory-growth). A background job is code
-- that runs on its own, with every addon window closed: an OnUpdate, a ticker, a frequent event. Every one is listed
-- in .claude/tools/Check-Repo.jobs, with its scenario here or the reason it is not one (the background-jobs lint rule).
-- A memory display (GetAddOnMemoryUsage: the Krowi System broker, Blizzard's AddOn list) counts what the addon
-- allocated and the garbage collector has not freed yet, and the game can go an hour without collecting, so a job that
-- allocates on every run makes the addon's number climb for as long as the game runs, even when it keeps nothing.
-- Each scenario runs one job many times in a row, synchronously, so no other code runs in between, and buckets the result:
--   PerMinute: the bytes one run allocates times the runs a minute; "none" below 1 KB a minute, "small" below
--     64 KB a minute, "large" from there. In game C_AddOnProfiler.MeasureCall counts the bytes (Retail and Classic
--     have it), headlessly (.claude/tools/headless/run-tests.lua) the garbage counter with the collector stopped.
--     The first run is not counted, so what a job fills once is not a cost of every run.
--   Kept: what the heap still holds after a full collection, after Minutes' worth of runs; "none" below 1 KB,
--     "grows" from there. The first run is not counted, so a cache the job fills once is not growth.
-- The bytes themselves go to the observations, so the lines of the game and of the headless run stay comparable.
-- The game run also observes, without a scenario, what depends on the session: how much of the addon's memory a full
-- collection frees, what each event read allocates, what a CRITERIA_UPDATE costs per open popout, and at the end an
-- idle minute: what the whole addon allocated in 60 s with nothing touched, next to what the jobs above account for.
-- Every full collection is a short freeze in game.

-- Job: a key of env.Jobs. The event-reminder jobs are the reads the refresh ticker makes on every tick (memory.RefreshEvents),
-- in the state the job's name says; in game a job SKIPs when the session is not in that state.
-- Until 2026-10-19:
-- - the taint probe's sweep (TaintDiagnostics.lua) built a list of every string key of GameTooltip and its widget
--   container, plus a few tables and closures, on every run, twice a second (3872 bytes a run in game on 12.1.5);
-- - the event-reminder refresh (Data/EventData.lua) read the widget of a widget-timed world event before checking its
--   POI was there, so five inactive Theater Troupe events read widget 6264 on every refresh (9320 bytes a run)
-- Both now allocate nothing on a run where no world event's POI is on its map. Two costs stay, as open targets for the
-- event reminders' move to Blizzard's event scheduler and fixed schedules (docs/backlog.md), because players should see
-- no change before then (Krowi, 2026-10-19 and 2026-10-21):
-- - event-refresh-poi-on-map: a world event whose POI is on its map has the POI asked on every refresh, a new table each
--   time, since only the POI tells events apart that share a widget (the Dreamsurges, the Theater Troupe shows);
-- - event-refresh-widget-active: a widget-timed event active in its zone has its widget read on every refresh, so its
--   countdown stays as it was
memory.Scenarios = {
    {Name = "taint-sweep", Kind = "PerMinute", Job = "TaintSweep",
        Recorded = "none", Target = "none"},
    {Name = "taint-sweep-kept", Kind = "Kept", Job = "TaintSweep", Minutes = 5,
        Recorded = "none", Target = "none"},
    {Name = "event-refresh", Kind = "PerMinute", Job = "EventRefreshNoPoiOnMap",
        Recorded = "none", Target = "none"},
    {Name = "event-refresh-kept", Kind = "Kept", Job = "EventRefresh", Minutes = 5,
        Recorded = "none", Target = "none"},
    {Name = "event-refresh-poi-on-map", Kind = "PerMinute", Job = "EventRefreshPoiOnMap", RetailOnly = true,
        Recorded = "large", Target = "none"},
    {Name = "event-refresh-widget-active", Kind = "PerMinute", Job = "ActiveWidgetTimers", RetailOnly = true,
        Recorded = "large", Target = "none"},
    -- Blizzard's event scheduler (Data/EventScheduler.lua): an update the addon did not ask for returns at once
    {Name = "scheduler-update-ignored", Kind = "PerMinute", Job = "SchedulerUpdate",
        Recorded = "none", Target = "none"},
    -- The watcher that learns the older events' starts from their POIs (Data/EventObserver.lua): a run in which no POI
    -- appeared or went
    {Name = "observer-run", Kind = "PerMinute", Job = "ObserverRun", RetailOnly = true,
        Recorded = "none", Target = "none"}
}
-- RetailOnly: left out on Classic, whose event data has calendar events only (the world and widget events are
-- DataAddons/Retail data), so the lines of the game match the headless Classic run

local kilobyte = 1024
local perMinuteBuckets = {{Below = kilobyte, Name = "none"}, {Below = 64 * kilobyte, Name = "small"}}
local refreshesPerMinute = 60 -- the Refresh interval option's minimum, 1 s: the worst case, whatever the player set

local function PerMinuteBucket(bytesPerMinute)
    for _, bucket in ipairs(perMinuteBuckets) do
        if bytesPerMinute < bucket.Below then
            return bucket.Name
        end
    end
    return "large"
end

local function KeptBucket(bytes)
    return bytes < kilobyte and "none" or "grows"
end

local function HeapBytes()
    return collectgarbage("count") * kilobyte
end

local function RunCalls(call, calls)
    for _ = 1, calls do
        call()
    end
end

-- Bytes one call of call() allocates, over calls calls, with the collector stopped where the client allows it, so no
-- collection step frees anything in between; an error still restarts it before it is raised again
function memory.AllocatedByCounting(call, calls)
    collectgarbage("collect")
    local stopped = pcall(collectgarbage, "stop")
    local before = HeapBytes()
    local ok, err = pcall(RunCalls, call, calls)
    local after = HeapBytes()
    if stopped then
        collectgarbage("restart")
    end
    if not ok then
        error(err, 0)
    end
    return (after - before) / calls, stopped and "garbage counter" or "garbage counter, collector running"
end

-- Bytes the heap still holds after calls calls and a full collection; the first call is not counted
function memory.Kept(call, calls)
    call()
    collectgarbage("collect")
    local before = HeapBytes()
    for _ = 1, calls do
        call()
    end
    collectgarbage("collect")
    return HeapBytes() - before
end

-- env: IsRetail() -> bool; Jobs(name) -> {Call, PerMinute, Note} or nil, reason; Allocated(call, calls) -> bytes per call, method
-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line
local function RunScenario(env, scenario, observations)
    local job, reason = env.Jobs(scenario.Job)
    local got
    if job then
        if scenario.Kind == "PerMinute" then
            local calls = math.max(1, math.floor(job.PerMinute))
            job.Call() -- not counted: what a job fills once (a POI it confirms, a key it reports) is not a cost of every run
            local perCall, method = env.Allocated(job.Call, calls)
            local perMinute = perCall * job.PerMinute
            got = PerMinuteBucket(perMinute)
            tinsert(observations, ("%s: %.0f bytes a run, %g runs a minute, %.1f KB a minute (%s)%s"):format(
                scenario.Name, perCall, job.PerMinute, perMinute / kilobyte, method, job.Note and ("; " .. job.Note) or ""))
        elseif scenario.Kind == "Kept" then
            local calls = math.max(1, math.floor(job.PerMinute * scenario.Minutes))
            local kept = memory.Kept(job.Call, calls)
            got = KeptBucket(kept)
            tinsert(observations, ("%s: %.0f bytes kept after %d runs (%g minutes)"):format(scenario.Name, kept, calls, scenario.Minutes))
        else
            reason = "unknown kind " .. tostring(scenario.Kind)
        end
    end

    local status, targetMet, tail
    if not got then
        status, tail = "SKIP", reason or "the job did not run"
    else
        status = got == scenario.Recorded and "PASS" or "FAIL"
        targetMet = got == scenario.Target
        tail = ("got=%s target=%s %s"):format(got, scenario.Target, targetMet and "met" or "open")
    end
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("memory/%s: %s recorded=%s %s"):format(scenario.Name, status, scenario.Recorded, tail)
    }
end

function memory.Run(env, observations)
    local results = {}
    local isRetail = env.IsRetail()
    for _, scenario in ipairs(memory.Scenarios) do
        if isRetail or not scenario.RetailOnly then
            tinsert(results, RunScenario(env, scenario, observations))
        end
    end
    return results
end

-- The reads of one event-reminder refresh, as the ticker makes them (Gui/EventReminder/AlertSystem.lua: Refresh)
function memory.RefreshEvents()
    addon.EventData.GetActiveEvents(true)
    addon.EventData.GetUpcomingCalendarEvents()
end

-- [[ Environment: the real jobs; the headless runner provides a model of what they read ]] --

local gameEnv = {}
memory.GameEnv = gameEnv

function gameEnv.IsRetail()
    return addon.Util.IsMainline
end

local function EventRemindersNote()
    return ("the player's Refresh interval is %g s"):format(addon.Options.db.profile.EventReminders.RefreshInterval or 0)
end

-- How many world event POIs the refresh asks for and finds on their maps in this session, asked directly: a widget-timed
-- event's POI on every refresh, another event's once it reports time left (Data/EventData.lua: GetWorldEventDetails)
local function AskedPoisOnMap()
    local count = 0
    local enabled = addon.Options.db.profile.EventReminders.WorldEvents
    for _, event in next, addon.Data.Events[KrowiAF.Enum.EventType.World] or {} do
        -- an event from Blizzard's event scheduler or on a fixed schedule is never asked (Data/EventScheduler.lua,
        -- Data/EventSchedules.lua)
        local asked = event.Source == nil
            and (addon.Data.CustomWorldEventTimers.HasCustomTimer(event.Id) or C_AreaPoiInfo.GetAreaPOISecondsLeft(event.Id) ~= nil)
        if enabled[event.Id] and asked and C_AreaPoiInfo.GetAreaPOIInfo(event.MapId, event.Id) then
            count = count + 1
        end
    end
    return count
end

-- The widget-timed world events whose POI is there and the widget events whose widget is there, read as the refresh
-- reads them; nil when none is, which is anywhere outside those events' zones
local function ActiveWidgetTimerReads()
    local eventType = KrowiAF.Enum.EventType
    local reads = {}
    for _, event in next, addon.Data.Events[eventType.World] or {} do
        if addon.Data.CustomWorldEventTimers.HasCustomTimer(event.Id) and addon.EventData.GetWorldEventDetails(event) then
            tinsert(reads, function() addon.EventData.GetWorldEventDetails(event) end)
        end
    end
    for _, event in next, addon.Data.Events[eventType.Widget] or {} do
        -- a timer that computes its times reads no widget (the soup's, those on a fixed schedule), so it is not this cost
        if event.Source == nil and not addon.Data.CustomWidgetEventTimers.IsComputed(event.Id) and addon.EventData.GetWidgetEventDetails(event) then
            tinsert(reads, function() addon.EventData.GetWidgetEventDetails(event) end)
        end
    end
    if #reads == 0 then
        return nil
    end
    return function()
        for _, read in ipairs(reads) do
            read()
        end
    end
end

function gameEnv.Jobs(name)
    if name == "SchedulerUpdate" then
        return {Call = addon.Data.EventScheduler.OnSchedulerUpdate, PerMinute = refreshesPerMinute}
    end
    if name == "ObserverRun" then
        return {Call = addon.Data.EventObserver.RunOnce, PerMinute = 60 / 300, Note = "every 300 s while event reminders are on"}
    end
    if name == "TaintSweep" then
        local probe = addon.Diagnostics.TaintProbe
        return {
            Call = probe.SweepOnce,
            PerMinute = probe.SweepsPerMinute,
            Note = not addon.Options.db.profile.EnableTaintDiagnostics and "taint diagnostics are off, so the sweep does not run in this session" or nil
        }
    end
    if name == "EventRefresh" or name == "EventRefreshNoPoiOnMap" or name == "EventRefreshPoiOnMap" or name == "ActiveWidgetTimers" then
        if not addon.Options.db.profile.EventReminders.Enabled then
            return nil, "event reminders are off"
        end
        local call = memory.RefreshEvents
        if name == "EventRefreshNoPoiOnMap" or name == "EventRefreshPoiOnMap" then
            local poisOnMap = AskedPoisOnMap()
            if name == "EventRefreshNoPoiOnMap" and poisOnMap > 0 then
                return nil, ("%d world event POIs the refresh asks for are on their maps here; that cost is event-refresh-poi-on-map"):format(poisOnMap)
            elseif name == "EventRefreshPoiOnMap" and poisOnMap == 0 then
                return nil, "no world event POI the refresh asks for is on its map here"
            end
            -- nor where a widget is read: seen in the Dragon Isles with the Azerothian Archives' widgets (2026-10-21)
            if name == "EventRefreshNoPoiOnMap" and ActiveWidgetTimerReads() then
                return nil, "a widget-timed event is active here; that cost is event-refresh-widget-active"
            end
        elseif name == "ActiveWidgetTimers" then
            call = ActiveWidgetTimerReads()
            if not call then
                return nil, "no widget-timed event is active here; they only are in their own zones"
            end
        end
        return {Call = call, PerMinute = refreshesPerMinute, Note = EventRemindersNote()}
    end
    return nil, "no job " .. tostring(name)
end

function gameEnv.Allocated(call, calls)
    local profiler = C_AddOnProfiler
    if profiler and profiler.MeasureCall and (not profiler.IsEnabled or profiler.IsEnabled()) then
        local results = profiler.MeasureCall(function()
            for _ = 1, calls do
                call()
            end
        end)
        return results.allocatedBytes / calls, ("profiler, %.3f ms a run"):format(results.elapsedMilliseconds / calls)
    end
    return memory.AllocatedByCounting(call, calls)
end

-- After one run that is not counted, so a cache the call fills once (the calendar's on the first event read) is not in it
local function AllocatedWarm(call, calls)
    call()
    return gameEnv.Allocated(call, calls)
end

-- Which events the event-reminder refresh's bytes come from: each widget and world event read on its own, as the
-- refresh reads them (Data/EventData.lua); the calendar events are cache lookups
local function ObserveEventParts(observations)
    local eventType = KrowiAF.Enum.EventType
    local parts = {}
    for _, kind in ipairs({{"widget", eventType.Widget, addon.EventData.GetWidgetEventDetails}, {"world", eventType.World, addon.EventData.GetWorldEventDetails}}) do
        local label, typeId, read = kind[1], kind[2], kind[3]
        local total, count, allocating = 0, 0, 0
        for _, event in next, addon.Data.Events[typeId] or {} do
            local active = read(event) ~= nil -- also the uncounted first read
            local bytes = gameEnv.Allocated(function()
                read(event)
            end, 3)
            total, count = total + bytes, count + 1
            if bytes >= 16 then
                allocating = allocating + 1
                tinsert(parts, {Label = label, Id = event.Id, Name = event.Name, Active = active, Bytes = bytes})
            end
        end
        tinsert(observations, ("event-reminder refresh, %s events: %.0f bytes a run over %d events, %d of them allocating"):format(label, total, count, allocating))
    end
    sort(parts, function(a, b) return a.Bytes > b.Bytes end)
    for i = 1, math.min(#parts, 12) do
        local part = parts[i]
        tinsert(observations, ("  %s event %s (%s, %s): %.0f bytes a read"):format(part.Label, tostring(part.Id), tostring(part.Name), part.Active and "active" or "inactive", part.Bytes))
    end
end

-- Session-dependent costs, observed before the scenarios run (the first one before anything else allocates)
local function ObserveSession(observations)
    UpdateAddOnMemoryUsage()
    local before = GetAddOnMemoryUsage(addonName)
    collectgarbage("collect")
    UpdateAddOnMemoryUsage()
    local live = GetAddOnMemoryUsage(addonName)
    tinsert(observations, ("the addon held %.0f KB; a full collection freed %.0f KB of garbage, %.0f KB is live"):format(before, before - live, live))

    local eventReminders = addon.Options.db.profile.EventReminders
    if eventReminders.Enabled then
        local perCall, method = AllocatedWarm(memory.RefreshEvents, 3)
        local interval = math.max(1, eventReminders.RefreshInterval or 1)
        tinsert(observations, ("event-reminder refresh: %.0f bytes a run, every %g s, %.1f KB a minute (%s)"):format(perCall, interval, perCall * 60 / interval / kilobyte, method))
        ObserveEventParts(observations)
        if addon.Util.IsMainline and C_EventScheduler and WorldMapFrame and WorldMapFrame:IsShown() then
            -- the addon never reads the scheduler while the map, whose Events tab listens to it, is shown
            tinsert(observations, "event scheduler: not read, the world map is open")
        elseif addon.Util.IsMainline and C_EventScheduler then
            -- through the cache's own read, under its guards; it leaves the real times in the cache
            local read = addon.Data.EventScheduler.ReadForTest
            if read() then
                local rebuild, rebuildMethod = gameEnv.Allocated(read, 3)
                tinsert(observations, ("event scheduler: %.0f bytes a read, after login and when its times run low (%s)"):format(rebuild, rebuildMethod))
            else
                tinsert(observations, "event scheduler: not read, the cache cannot ask it now")
            end
        end
    else
        tinsert(observations, "event-reminder refresh: event reminders are off")
    end

    local open = 0
    for id, popout in next, addon.Gui.AchievementPopout.OpenPopouts do
        local objectives = popout.Button and popout.Button.Objectives
        if objectives and objectives:IsVisible() then
            open = open + 1
            local perCall, method = AllocatedWarm(function()
                objectives:OnEvent("CRITERIA_UPDATE")
            end, 3)
            tinsert(observations, ("popout %d: %.0f bytes per CRITERIA_UPDATE (%s)"):format(id, perCall, method))
        end
    end
    if open == 0 then
        tinsert(observations, "popouts: none open")
    end
end

-- What the background jobs allocate a minute at the player's own settings, for comparison with the idle minute
local function JobsPerMinute()
    local total = 0
    if addon.Options.db.profile.EnableTaintDiagnostics then
        local probe = addon.Diagnostics.TaintProbe
        total = total + AllocatedWarm(probe.SweepOnce, 10) * probe.SweepsPerMinute
    end
    local eventReminders = addon.Options.db.profile.EventReminders
    if eventReminders.Enabled then
        total = total + AllocatedWarm(memory.RefreshEvents, 10) * 60 / math.max(1, eventReminders.RefreshInterval or 1)
    end
    return total
end

local idleSeconds = 60
local idleEvents = {"AREA_POIS_UPDATED", "PLAYER_ENTERING_WORLD", "UPDATE_ALL_UI_WIDGETS", "ZONE_CHANGED_NEW_AREA", "CRITERIA_UPDATE", "EVENT_SCHEDULER_UPDATE"}
local idleFrame -- one frame for every run, so a repeated run adds none

-- What the whole addon allocates in a minute with nothing touched: a full collection, then the addon's memory again
-- after idleSeconds. A frame watches the heap each frame: when it drops, the game collected in between and the
-- number is a lower bound. It also counts the client events that move the event-reminder state.
local function ObserveIdleMinute(observations, finish)
    local expected = JobsPerMinute()
    print("|cFF88CCFFKrowiAF Tests:|r memory: measuring an idle minute; leave every window closed and do nothing until the result prints")
    idleFrame = idleFrame or CreateFrame("Frame")
    local counts = {}
    for _, event in ipairs(idleEvents) do
        counts[event] = 0
        idleFrame:RegisterEvent(event)
    end
    idleFrame:SetScript("OnEvent", function(_, event)
        counts[event] = counts[event] + 1
    end)
    collectgarbage("collect")
    UpdateAddOnMemoryUsage()
    local before = GetAddOnMemoryUsage(addonName)
    local previousHeap, collected = collectgarbage("count"), false
    idleFrame:SetScript("OnUpdate", function()
        local heap = collectgarbage("count")
        if heap < previousHeap - 64 then
            collected = true
        end
        previousHeap = heap
    end)
    C_Timer.After(idleSeconds, function()
        UpdateAddOnMemoryUsage()
        local allocated = GetAddOnMemoryUsage(addonName) - before
        idleFrame:SetScript("OnUpdate", nil)
        idleFrame:SetScript("OnEvent", nil)
        idleFrame:UnregisterAllEvents()
        tinsert(observations, ("idle minute: the addon allocated %.0f KB in %d s, %.1f KB a minute; the jobs above account for %.1f KB a minute at this profile's settings%s"):format(
            allocated, idleSeconds, allocated * 60 / idleSeconds, expected / kilobyte, collected and " (the game collected during the minute, so this is a lower bound)" or ""))
        local fired = {}
        for _, event in ipairs(idleEvents) do
            tinsert(fired, event .. " " .. counts[event])
        end
        tinsert(observations, "idle minute, client events: " .. table.concat(fired, ", "))
        finish()
    end)
end

local measuring -- a run's idle minute is going on; a second run would share its frame and disturb its numbers

addon.Tests.Ready.memory = function()
    if measuring then
        return false, "the previous memory run is still measuring its idle minute"
    end
    if not addon.Data.IsLoaded then -- the login load's garbage would swamp the idle minute
        return false, "the data load has not finished"
    end
    return true
end

addon.Tests.Async.memory = true
addon.Tests.Suites.memory = function(done)
    local observations = {}
    ObserveSession(observations)
    local results = memory.Run(gameEnv, observations)
    measuring = true -- only the idle minute can overlap another run; what comes before it runs in one go
    ObserveIdleMinute(observations, function()
        measuring = nil
        done(results, observations)
    end)
end