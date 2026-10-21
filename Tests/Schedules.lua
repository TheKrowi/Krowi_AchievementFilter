local _, addon = ...
addon.Tests.Schedules = {}
local schedules = addon.Tests.Schedules

-- The older expansions' events on the fixed schedules KAF carries (docs/work/2026-10-21-fixed-event-schedules), and
-- what the addon learns from the POIs it sees. The scenarios read the reminders' own details at fixed times and regions;
-- the clock, the region and the weekly reset reach the schedules through a model in place of the game
-- (Data/EventSchedules.lua UseSourceForTest), so they run the same in game and headlessly. The learning stories tell
-- Data/EventObserver.lua a sequence of POIs through a model of the POI API, with a model of its saved data.
-- Kind:
--   Window: GetWorldEventDetails or GetWidgetEventDetails of Event at At in Region: "ends in <seconds>", "no time" or
--     "not shown"
--   Family: which of Ids is going on at At in Region and until when: "<id> ends in <seconds>", or "none"
--   PoiState: the reminders' details of Event with the POIs and widgets of Pois and Widgets (headless only: the game
--     cannot set them)
--   Learn: what the watcher learns in the story Story
-- Until 2026-10-21 these families came from their POIs (read live, so a scenario SKIPs in game while its family's POI
-- is up) or their widgets (only in their zone); the Recorded values are that code's answers with them absent.

local regions = {US = 1, KR = 2, EU = 3, CN = 5}
local factionT0 = 1800396000 -- a Drustvar start on EU realms: 1548000000 + 3690 cycles of 68400 s
local factionUsT0 = 1800428400 -- the same cycle's Drustvar start on US realms
local factionIds = {5964, 5973, 5896, 5969, 5966, 5970} -- Drustvar, Zuldazar, Tiragarde Sound, Nazmir, Stormsong Valley, Vol'dun
local mawReset = 1792555200 -- EU's weekly reset of 2026-10-21 04:00 UTC, when Kyrian started (/kaftest sources)
local mawUsReset = 1792508400 -- US's weekly reset of 2026-10-20 15:00 UTC
local mawIds = {6991, 6990, 6992, 6989} -- Kyrian, Venthyr, Night Fae, Necrolord
local hour = 1800000000 -- 2027-01-15 08:00:00 UTC: an even hour, on the hour
local week, halfWeek = 604800, 302400

schedules.Scenarios = {
    -- BfA Faction Assaults: 68400 s, 25200 s on, one zone further each cycle
    {Name = "faction-assault-eu", Kind = "Family", Ids = factionIds, At = factionT0 + 100, Region = "EU", RetailOnly = true,
        Recorded = "none", Target = "5964 ends in 25100"},
    {Name = "faction-assault-next-zone", Kind = "Family", Ids = factionIds, At = factionT0 + 68400 + 100, Region = "EU", RetailOnly = true,
        Recorded = "none", Target = "5973 ends in 25100"},
    {Name = "faction-assault-between", Kind = "Family", Ids = factionIds, At = factionT0 + 25200 + 100, Region = "EU", RetailOnly = true,
        Recorded = "none", Target = "none"},
    {Name = "faction-assault-us", Kind = "Family", Ids = factionIds, At = factionUsT0 + 100, Region = "US", RetailOnly = true,
        Recorded = "none", Target = "5964 ends in 25100"},
    {Name = "faction-assault-kr", Kind = "Family", Ids = factionIds, At = factionT0 + 100, Region = "KR", RetailOnly = true, -- no start known there
        Recorded = "none", Target = "none"},
    -- The Maw's covenant assaults: half a week each from the weekly reset, Kyrian, Venthyr, Night Fae, Necrolord
    {Name = "covenant-assault-eu", Kind = "Family", Ids = mawIds, At = mawReset + 1000, Region = "EU", RetailOnly = true,
        Recorded = "none", Target = "6991 ends in 301400"},
    {Name = "covenant-assault-eu-half-week", Kind = "Family", Ids = mawIds, At = mawReset + halfWeek + 1000, Region = "EU", RetailOnly = true,
        Recorded = "none", Target = "6990 ends in 301400"},
    {Name = "covenant-assault-eu-next-week", Kind = "Family", Ids = mawIds, At = mawReset + week + 1000, Region = "EU", RetailOnly = true,
        Recorded = "none", Target = "6992 ends in 301400"},
    {Name = "covenant-assault-us", Kind = "Family", Ids = mawIds, At = mawUsReset + 1000, Region = "US", RetailOnly = true, -- no phase known there
        Recorded = "none", Target = "none"},
    -- Siege on Dragonbane Keep: every two hours, EU on even hours, the others on odd ones
    {Name = "siege-active-eu", Kind = "Window", Event = 7104, At = hour + 100, Region = "EU", RetailOnly = true,
        Recorded = "not shown", Target = "ends in 3500"},
    {Name = "siege-gathering-eu", Kind = "Window", Event = 7267, At = hour - 1000, Region = "EU", RetailOnly = true,
        Recorded = "not shown", Target = "ends in 1000"},
    {Name = "siege-gathering-us", Kind = "Window", Event = 7267, At = hour + 100, Region = "US", RetailOnly = true,
        Recorded = "not shown", Target = "ends in 3500"},
    -- Time Rift: every hour at :00; Next in the 5 minutes before, Active up to 15 minutes
    {Name = "time-rift-next", Kind = "Window", Widget = true, Event = 4992, At = hour - 200, Region = "EU", RetailOnly = true,
        Recorded = "not shown", Target = "ends in 200"},
    {Name = "time-rift-active", Kind = "Window", Widget = true, Event = 4987, At = hour + 100, Region = "EU", RetailOnly = true,
        Recorded = "not shown", Target = "ends in 800"},
    {Name = "time-rift-between", Kind = "Window", Widget = true, Event = 4987, At = hour + 1000, Region = "EU", RetailOnly = true,
        Recorded = "not shown", Target = "not shown"},
    -- Superbloom: every hour at :00; Next in the 15 minutes before, Active up to 20 minutes
    {Name = "superbloom-next", Kind = "Window", Widget = true, Event = 5157, At = hour - 600, Region = "EU", RetailOnly = true,
        Recorded = "not shown", Target = "ends in 600"},
    {Name = "superbloom-active", Kind = "Window", Widget = true, Event = 5323, At = hour + 100, Region = "EU", RetailOnly = true,
        Recorded = "no time", Target = "ends in 1100"},
    -- The Big Dig (Azerothian Archives): every hour at :30; Next, then Soon in the last 5 minutes, Active up to 15 minutes
    {Name = "big-dig-next", Kind = "Window", Widget = true, Event = 5584, At = hour + 1800 - 600, Region = "EU", RetailOnly = true,
        Recorded = "not shown", Target = "ends in 300"},
    {Name = "big-dig-soon", Kind = "Window", Widget = true, Event = 5585, At = hour + 1800 - 100, Region = "EU", RetailOnly = true,
        Recorded = "not shown", Target = "ends in 100"},
    {Name = "big-dig-active", Kind = "Window", Widget = true, Event = 5592, At = hour + 1800 + 100, Region = "EU", RetailOnly = true,
        Recorded = "not shown", Target = "ends in 800"},
    -- Researchers Under Fire stays on its POI and widget, in its zone; its POI reports time but is not on map 2133
    {Name = "researchers-in-zone", Kind = "PoiState", Event = 7461, Pois = {[7461] = 600}, Widgets = {[4826] = "10 min"}, RetailOnly = true,
        Recorded = "not shown", Target = "ends in 600"},
    -- What every player's addon learns from the POIs it sees
    {Name = "learn-kr-faction-assault", Kind = "Learn", Story = "KoreaLearns", RetailOnly = true,
        Recorded = "no watcher", Target = "after one: none; after two: 5973 ends in 25000"},
    {Name = "learn-late-poi", Kind = "Learn", Story = "LatePoi", RetailOnly = true,
        Recorded = "no watcher", Target = "start at T0+0"},
    {Name = "learn-moved-schedule", Kind = "Learn", Story = "MovedSchedule", RetailOnly = true,
        Recorded = "no watcher", Target = "reported; 5973 ends in 1700"},
    {Name = "learn-us-maw-phase", Kind = "Learn", Story = "UsMawPhase", RetailOnly = true,
        Recorded = "no watcher", Target = "after one: none; after two: 6992 ends in 301400"},
    {Name = "learn-hunt-order", Kind = "Learn", Story = "HuntOrder", RetailOnly = true,
        Recorded = "no watcher", Target = "7343,7344,7342"},
    {Name = "learn-nothing-changed", Kind = "Learn", Story = "NothingChanged", RetailOnly = true,
        Recorded = "no watcher", Target = "observations 1"}
}
-- RetailOnly: every family is DataAddons/Retail data; Classic has no world or widget events

local function WorldEvent(id)
    return addon.Data.Events[KrowiAF.Enum.EventType.World][id]
end

local function WidgetEvent(id)
    return addon.Data.Events[KrowiAF.Enum.EventType.Widget][id]
end

-- The schedules' view of the game at the scenario's time and region; the weekly reset is the region's from its last
-- known one (EU Wednesday 04:00 UTC, US Tuesday 15:00 UTC)
local resets = {[regions.EU] = mawReset, [regions.US] = mawUsReset, [regions.KR] = mawReset + 19 * 3600, [regions.CN] = mawReset + 19 * 3600}
-- learned: whether the schedules may use what the watcher learned (the learning stories), or only the shipped starts
local function NewClock(region, now, learned)
    local clock = {Region = region, Now = now}
    clock.Source = {
        Region = function() return clock.Region end,
        Now = function() return clock.Now end,
        SecondsUntilWeeklyReset = function()
            local anchor = resets[clock.Region] or mawReset
            local passed = (clock.Now - anchor) % week
            return week - passed
        end,
        Learned = function(key, forRegion)
            return learned and addon.Data.EventObserver.GetLearned(key, forRegion) or nil
        end,
    }
    return clock
end

local learning -- a learning story is being told: the schedules read what the story's watcher learned

-- Runs read at the scenario's time and region; before Data/EventSchedules.lua exists it runs on today's code
local function WithClock(region, at, read)
    local engine = addon.Data.EventSchedules
    if not engine then
        return read()
    end
    engine.UseSourceForTest(NewClock(region, at, learning).Source)
    local ok, result = pcall(read)
    engine.UseSourceForTest(nil)
    if not ok then
        error(result, 0)
    end
    return result
end

local function Describe(details, at)
    if not details then
        return "not shown"
    end
    if not details.EndTime then
        return "no time"
    end
    return ("ends in %d"):format(details.EndTime - at)
end

local function ReadEvent(id, widget, at)
    local event = widget and WidgetEvent(id) or WorldEvent(id)
    if not event then
        return nil, "no event " .. id
    end
    if widget then
        return addon.EventData.GetWidgetEventDetails(event, at)
    end
    return addon.EventData.GetWorldEventDetails(event, at)
end

local function DescribeWindow(scenario)
    return WithClock(regions[scenario.Region], scenario.At, function()
        local details, missing = ReadEvent(scenario.Event, scenario.Widget, scenario.At)
        return missing or Describe(details, scenario.At)
    end)
end

local function DescribeFamily(scenario)
    return WithClock(regions[scenario.Region], scenario.At, function()
        local found = {}
        for _, id in ipairs(scenario.Ids) do
            local details = ReadEvent(id, false, scenario.At)
            if details and details.EndTime then
                tinsert(found, ("%d ends in %d"):format(id, details.EndTime - scenario.At))
            end
        end
        return #found > 0 and table.concat(found, ", ") or "none"
    end)
end

-- [[ The learning stories: Data/EventObserver.lua told a sequence of POIs through a model of the POI API ]] --

local function NewPoiModel(region, now)
    local model = {Region = region, Now = now, Left = {}, Reports = {}}
    model.Source = {
        Region = function() return model.Region end,
        Now = function() return model.Now end,
        SecondsLeft = function(id) return model.Left[id] end,
        PoiInfo = function() return nil end,
        Debug = function() return true end,
        Report = function(message) tinsert(model.Reports, message) end,
    }
    model.Store = {}
    return model
end

local stories = {}

-- A Korean player: no start shipped for the region; one Drustvar seen, then the next cycle's Zuldazar
function stories.KoreaLearns(model, observer)
    model.Region = regions.KR
    model.Now = factionT0 + 100
    model.Left[5964] = 25100
    observer.RunOnce()
    local afterOne = WithClock(regions.KR, factionT0 + 200, function() return DescribeFamily({Ids = factionIds, At = factionT0 + 200, Region = "KR"}) end)
    model.Left[5964] = nil
    observer.RunOnce()
    model.Now = factionT0 + 68400 + 100
    model.Left[5973] = 25100
    observer.RunOnce()
    local afterTwo = WithClock(regions.KR, factionT0 + 68400 + 200, function() return DescribeFamily({Ids = factionIds, At = factionT0 + 68400 + 200, Region = "KR"}) end)
    return ("after one: %s; after two: %s"):format(afterOne, afterTwo)
end

-- The POI appears 200 s after its start: the start comes from its seconds left, not from when it was seen
function stories.LatePoi(model, observer)
    model.Region = regions.KR
    model.Now = factionT0 + 200
    model.Left[5964] = 25000
    observer.RunOnce()
    local seen = observer.GetObservationsForTest(model.Store, regions.KR, "FactionAssaults")
    local last = seen and seen[#seen]
    return last and ("start at T0+%d"):format(last.Start - factionT0) or "nothing seen"
end

-- The game runs EU's Faction Assaults half an hour later than the shipped start, seen twice: the game wins, reported.
-- Read 100 s after the shipped window would have ended, inside the moved one.
function stories.MovedSchedule(model, observer)
    model.Region = regions.EU
    model.Now = factionT0 + 1800 + 100
    model.Left[5964] = 25100
    observer.RunOnce()
    model.Left[5964] = nil
    observer.RunOnce()
    model.Now = factionT0 + 68400 + 1800 + 100
    model.Left[5973] = 25100
    observer.RunOnce()
    local at = factionT0 + 68400 + 25200 + 100
    local found = WithClock(regions.EU, at, function() return DescribeFamily({Ids = factionIds, At = at, Region = "EU"}) end)
    return ("%s; %s"):format(#model.Reports > 0 and "reported" or "not reported", found)
end

-- A US player: no phase shipped for the Maw's rotation; Venthyr seen, then Night Fae the next half-week
function stories.UsMawPhase(model, observer)
    model.Region = regions.US
    model.Now = mawUsReset + 1000
    model.Left[6990] = halfWeek - 1000
    observer.RunOnce()
    local afterOne = WithClock(regions.US, mawUsReset + 2000, function() return DescribeFamily({Ids = mawIds, At = mawUsReset + 2000, Region = "US"}) end)
    model.Left[6990] = nil
    model.Now = mawUsReset + halfWeek + 1000
    model.Left[6992] = halfWeek - 1000
    observer.RunOnce()
    local at = mawUsReset + halfWeek + 1000
    local afterTwo = WithClock(regions.US, at, function() return DescribeFamily({Ids = mawIds, At = at, Region = "US"}) end)
    return ("after one: %s; after two: %s"):format(afterOne, afterTwo)
end

-- An observe-only family: the order the Grand Hunts came in, as the watcher keeps it for Krowi's findings
function stories.HuntOrder(model, observer)
    model.Region = regions.EU
    for i, id in ipairs({7343, 7344, 7342}) do
        model.Now = hour + (i - 1) * 7200 + 100
        model.Left = {[id] = 7100}
        observer.RunOnce()
    end
    local seen = observer.GetObservationsForTest(model.Store, regions.EU, "GrandHunts") or {}
    local ids = {}
    for _, observation in ipairs(seen) do
        tinsert(ids, tostring(observation.Id))
    end
    return table.concat(ids, ",")
end

-- The same POI seen on two runs in a row is one observation
function stories.NothingChanged(model, observer)
    model.Region = regions.EU
    model.Now = factionT0 + 100
    model.Left[5964] = 25100
    observer.RunOnce()
    model.Now = factionT0 + 400
    model.Left[5964] = 24800
    observer.RunOnce()
    local seen = observer.GetObservationsForTest(model.Store, regions.EU, "FactionAssaults") or {}
    return ("observations %d"):format(#seen)
end

local function TellStory(scenario)
    local observer = addon.Data.EventObserver
    if not observer or not observer.UseSourceForTest then
        return "no watcher"
    end
    local model = NewPoiModel(regions.EU, factionT0)
    observer.UseSourceForTest(model.Source, model.Store)
    learning = true
    local ok, result = pcall(stories[scenario.Story], model, observer)
    learning = nil
    observer.UseSourceForTest(nil)
    if not ok then
        error(result, 0)
    end
    return result
end

-- env: IsRetail() -> bool; PoiUp(id) -> whether the game shows the POI now; SetPoiState(pois, widgets) -> false when
-- the environment cannot set POIs and widgets (the game)
local function RunScenario(env, scenario)
    local got, blocked
    local before = not addon.Data.EventSchedules -- today's code reads the live POIs of these families
    if scenario.Kind == "Window" or scenario.Kind == "Family" then
        if before and not scenario.Widget then
            for _, id in ipairs(scenario.Ids or {scenario.Event}) do
                if env.PoiUp(id) then
                    blocked = ("POI %d is up now, and today's code reads it live"):format(id)
                    break
                end
            end
        end
        if not blocked then
            got = scenario.Kind == "Window" and DescribeWindow(scenario) or DescribeFamily(scenario)
        end
    elseif scenario.Kind == "PoiState" then
        if not env.SetPoiState(scenario.Pois, scenario.Widgets) then
            blocked = "the game cannot set POIs and widgets; checked in the event's zone instead"
        else
            local at = GetServerTime()
            got = Describe(ReadEvent(scenario.Event, false, at), at)
            env.SetPoiState(nil, nil)
        end
    elseif scenario.Kind == "Learn" then
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
        Line = ("schedules/%s: %s recorded=[%s] %s"):format(scenario.Name, status, scenario.Recorded, tail)
    }
end

-- The toggles the scenarios read, on for the run whatever the player chose, and the player's own back after it, with
-- the events' details read again at the real time
local function ForceToggles()
    local eventReminders = addon.Options.db.profile.EventReminders
    local saved = {}
    for _, scenario in ipairs(schedules.Scenarios) do
        local toggles = scenario.Widget and eventReminders.WidgetEvents or eventReminders.WorldEvents
        for _, id in ipairs(scenario.Ids or {scenario.Event}) do
            if toggles and saved[id] == nil then
                saved[id] = {Toggles = toggles, Value = toggles[id], Widget = scenario.Widget}
                toggles[id] = true
            end
        end
    end
    return saved
end

local function RestoreToggles(saved)
    for id, entry in next, saved do
        entry.Toggles[id] = entry.Value
        local event = entry.Widget and WidgetEvent(id) or WorldEvent(id)
        if event then
            if entry.Widget then
                addon.EventData.GetWidgetEventDetails(event)
            else
                addon.EventData.GetWorldEventDetails(event)
            end
        end
    end
end

function schedules.Run(env, observations)
    local results = {}
    if not env.IsRetail() then
        tinsert(observations, "Retail only: Classic has no world or widget events")
        return results
    end
    local saved = ForceToggles()
    local ok, err = pcall(function()
        for _, scenario in ipairs(schedules.Scenarios) do
            tinsert(results, RunScenario(env, scenario))
        end
    end)
    RestoreToggles(saved)
    if not ok then
        error(err, 0)
    end
    return results
end

-- [[ Environment: the game; the headless runner provides a model ]] --

local gameEnv = {}
schedules.GameEnv = gameEnv

function gameEnv.IsRetail()
    return addon.Util.IsMainline
end

function gameEnv.PoiUp(id)
    return (C_AreaPoiInfo.GetAreaPOISecondsLeft(id)) ~= nil or C_AreaPoiInfo.GetAreaPOIInfo(nil, id) ~= nil
end

function gameEnv.SetPoiState()
    return false
end

addon.Tests.Ready.schedules = function()
    if not addon.Data.IsLoaded then
        return false, "the data load has not finished"
    end
    return true
end

addon.Tests.Suites.schedules = function()
    local observations = {}
    return schedules.Run(gameEnv, observations), observations
end