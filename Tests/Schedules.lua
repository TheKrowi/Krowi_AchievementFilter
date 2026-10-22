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
--   PoiState: the reminders' details of Event with the POIs, POI maps and widgets of Pois, PoiMaps and Widgets
--     (headless only: the game cannot set them)
--   Learn: what the watcher learns in the story Story
--   Merge: what the saved-data solution makes of the Legion Assault toggles of four model profiles: per profile whether
--     the one toggle left is on, and how many of the other three ids remain
--   MergeCase: the solution in the case Case: run again after the player changed the toggle, on a profile holding
--     AceDB's copied defaults, or on a first install
-- Until 2026-10-21 these families came from their POIs (read live, so a scenario SKIPs in game while its family's POI
-- is up) or their widgets (only in their zone); the Recorded values are that code's answers with them absent.

local regions = {US = 1, KR = 2, EU = 3, TW = 4, CN = 5}
local factionT0 = 1800396000 -- a Drustvar start on EU realms: 1548000000 + 3690 cycles of 68400 s
local factionUsT0 = 1800428400 -- the same cycle's Drustvar start on US realms
local factionIds = {5964, 5973, 5896, 5969, 5966, 5970} -- Drustvar, Zuldazar, Tiragarde Sound, Nazmir, Stormsong Valley, Vol'dun
local mawReset = 1792555200 -- EU's weekly reset of 2026-10-21 04:00 UTC, when Kyrian started (/kaftest sources)
local mawUsReset = 1792508400 -- US's weekly reset of 2026-10-20 15:00 UTC
local mawIds = {6991, 6990, 6992, 6989} -- Kyrian, Venthyr, Night Fae, Necrolord
local hour = 1800000000 -- 2027-01-15 08:00:00 UTC: an even hour, on the hour
local legionT0 = 1800018000 -- a Legion Assault start on EU realms: 1762434000 + 720 cycles of 52200 s
local week, halfWeek = 604800, 302400

schedules.Scenarios = {
    -- BfA Faction Assaults: 68400 s, 25200 s on, one zone further each cycle
    {Name = "faction-assault-eu", Kind = "Family", Ids = factionIds, At = factionT0 + 100, Region = "EU", RetailOnly = true,
        Recorded = "5964 ends in 25100", Target = "5964 ends in 25100"},
    {Name = "faction-assault-next-zone", Kind = "Family", Ids = factionIds, At = factionT0 + 68400 + 100, Region = "EU", RetailOnly = true,
        Recorded = "5973 ends in 25100", Target = "5973 ends in 25100"},
    {Name = "faction-assault-between", Kind = "Family", Ids = factionIds, At = factionT0 + 25200 + 100, Region = "EU", RetailOnly = true,
        Recorded = "none", Target = "none"},
    {Name = "faction-assault-us", Kind = "Family", Ids = factionIds, At = factionUsT0 + 100, Region = "US", RetailOnly = true,
        Recorded = "5964 ends in 25100", Target = "5964 ends in 25100"},
    {Name = "faction-assault-kr", Kind = "Family", Ids = factionIds, At = factionT0 + 100, Region = "KR", RetailOnly = true, -- no start known there
        Recorded = "none", Target = "none"},
    -- The Maw's covenant assaults: half a week each from the weekly reset, Kyrian, Venthyr, Night Fae, Necrolord
    {Name = "covenant-assault-eu", Kind = "Family", Ids = mawIds, At = mawReset + 1000, Region = "EU", RetailOnly = true,
        Recorded = "6991 ends in 301400", Target = "6991 ends in 301400"},
    {Name = "covenant-assault-eu-half-week", Kind = "Family", Ids = mawIds, At = mawReset + halfWeek + 1000, Region = "EU", RetailOnly = true,
        Recorded = "6990 ends in 301400", Target = "6990 ends in 301400"},
    {Name = "covenant-assault-eu-next-week", Kind = "Family", Ids = mawIds, At = mawReset + week + 1000, Region = "EU", RetailOnly = true,
        Recorded = "6992 ends in 301400", Target = "6992 ends in 301400"},
    {Name = "covenant-assault-us", Kind = "Family", Ids = mawIds, At = mawUsReset + 1000, Region = "US", RetailOnly = true, -- no phase known there
        Recorded = "none", Target = "none"},
    -- A character who has not finished Chains of Domination chapter 2 (quest 64556) has no Maw assaults (Krowi, 2026-10-22)
    {Name = "covenant-assault-locked", Kind = "Family", Ids = mawIds, At = mawReset + 1000, Region = "EU", Locked = true, RetailOnly = true,
        Recorded = "none", Target = "none"},
    -- Siege on Dragonbane Keep: every two hours, EU on even hours, the others on odd ones
    {Name = "siege-active-eu", Kind = "Window", Event = 7104, At = hour + 100, Region = "EU", RetailOnly = true,
        Recorded = "ends in 3500", Target = "ends in 3500"},
    {Name = "siege-gathering-eu", Kind = "Window", Event = 7267, At = hour - 1000, Region = "EU", RetailOnly = true,
        Recorded = "ends in 1000", Target = "ends in 1000"},
    {Name = "siege-gathering-us", Kind = "Window", Event = 7267, At = hour + 100, Region = "US", RetailOnly = true,
        Recorded = "ends in 3500", Target = "ends in 3500"},
    -- GetCurrentRegion() 4, Taiwan, which no family names: the families with one start everywhere, or one outside EU, show
    {Name = "siege-gathering-tw", Kind = "Window", Event = 7267, At = hour + 100, Region = "TW", RetailOnly = true,
        Recorded = "ends in 3500", Target = "ends in 3500"},
    {Name = "time-rift-tw", Kind = "Window", Widget = true, Event = 4987, At = hour + 100, Region = "TW", RetailOnly = true,
        Recorded = "ends in 800", Target = "ends in 800"},
    -- Time Rift: every hour at :00; Next in the 5 minutes before, Active up to 15 minutes
    {Name = "time-rift-next", Kind = "Window", Widget = true, Event = 4992, At = hour - 200, Region = "EU", RetailOnly = true,
        Recorded = "ends in 200", Target = "ends in 200"},
    {Name = "time-rift-active", Kind = "Window", Widget = true, Event = 4987, At = hour + 100, Region = "EU", RetailOnly = true,
        Recorded = "ends in 800", Target = "ends in 800"},
    {Name = "time-rift-between", Kind = "Window", Widget = true, Event = 4987, At = hour + 1000, Region = "EU", RetailOnly = true,
        Recorded = "not shown", Target = "not shown"},
    -- Superbloom: every hour at :00; Next in the 15 minutes before, Active up to 20 minutes
    {Name = "superbloom-next", Kind = "Window", Widget = true, Event = 5157, At = hour - 600, Region = "EU", RetailOnly = true,
        Recorded = "ends in 600", Target = "ends in 600"},
    {Name = "superbloom-active", Kind = "Window", Widget = true, Event = 5323, At = hour + 100, Region = "EU", RetailOnly = true, -- up to 22 minutes
        Recorded = "ends in 1220", Target = "ends in 1220"},
    -- The Big Dig (Azerothian Archives): every hour at :30; Next, then Soon in the last 5 minutes, Active up to 15 minutes
    {Name = "big-dig-next", Kind = "Window", Widget = true, Event = 5584, At = hour + 1800 - 600, Region = "EU", RetailOnly = true,
        Recorded = "ends in 300", Target = "ends in 300"},
    {Name = "big-dig-soon", Kind = "Window", Widget = true, Event = 5585, At = hour + 1800 - 100, Region = "EU", RetailOnly = true,
        Recorded = "ends in 100", Target = "ends in 100"},
    {Name = "big-dig-active", Kind = "Window", Widget = true, Event = 5592, At = hour + 1800 + 100, Region = "EU", RetailOnly = true,
        Recorded = "ends in 800", Target = "ends in 800"},
    -- Legion Assaults: 6 hours every 14.5 hours, one reminder without the zone (confirmed in game on 2026-10-21: the
    -- Stormheim assault ended at 00:00:33 UTC, the cycle's 00:00:00); the four zones' toggles become one
    {Name = "legion-assault-eu", Kind = "Family", Ids = {5175}, At = legionT0 + 100, Region = "EU", RetailOnly = true,
        Recorded = "5175 ends in 21500", Target = "5175 ends in 21500"},
    {Name = "legion-assault-between", Kind = "Family", Ids = {5175}, At = legionT0 + 21600 + 100, Region = "EU", RetailOnly = true,
        Recorded = "none", Target = "none"},
    {Name = "legion-toggles-merge", Kind = "Merge", RetailOnly = true,
        Recorded = "AllOff off; Azsuna on; Others on; Untouched on", Target = "AllOff off; Azsuna on; Others on; Untouched on"},
    -- The taint review of 2026-10-21: the merge ran on every update, turning a Legion toggle the player had turned off
    -- back on, and left the active profile's toggle nil, which AceDB's copied defaults read as off
    {Name = "legion-toggles-merge-again", Kind = "MergeCase", Case = "Again", RetailOnly = true, -- turned off after the first merge, then an update
        Recorded = "off", Target = "off"},
    {Name = "legion-toggles-active-profile", Kind = "MergeCase", Case = "ActiveProfile", RetailOnly = true, -- the value 5175 holds after the merge
        Recorded = "true", Target = "true"},
    {Name = "legion-toggles-first-install", Kind = "MergeCase", Case = "FirstInstall", RetailOnly = true,
        Recorded = "marked, untouched", Target = "marked, untouched"},
    -- Researchers Under Fire stays on its POI and widget, in its zone. Its POI is on Zaralek Cavern's map (2133) only while
    -- the player is in the cavern; from Silvermoon it reports time but is on no map (/kaftest sources, 2026-10-22), which
    -- read as a defect until Krowi checked in the cavern
    {Name = "researchers-in-zone", Kind = "PoiState", Event = 7461, Pois = {[7461] = 600}, PoiMaps = {[7461] = 2133}, Widgets = {[4826] = "10 min"}, RetailOnly = true,
        Recorded = "ends in 600", Target = "ends in 600"},
    -- A Dreamsurge in its zone: its POI is on the zone's map (7602 on 2025, Thaldraszus; /kaftest sources, 2026-10-22), not
    -- on the Dragon Isles' 1978 its row gave
    {Name = "dreamsurge-in-zone", Kind = "PoiState", Event = 7602, Pois = {[7602] = 462000}, PoiMaps = {[7602] = 2025}, Widgets = {[4993] = "12 min"}, RetailOnly = true,
        Recorded = "ends in 720", Target = "ends in 720"},
    -- What every player's addon learns from the POIs it sees
    {Name = "learn-kr-faction-assault", Kind = "Learn", Story = "KoreaLearns", RetailOnly = true,
        Recorded = "after one: none; after two: 5973 ends in 25000", Target = "after one: none; after two: 5973 ends in 25000"},
    {Name = "learn-late-poi", Kind = "Learn", Story = "LatePoi", RetailOnly = true,
        Recorded = "start at T0+0", Target = "start at T0+0"},
    {Name = "learn-moved-schedule", Kind = "Learn", Story = "MovedSchedule", RetailOnly = true,
        Recorded = "reported; 5973 ends in 1700", Target = "reported; 5973 ends in 1700"},
    {Name = "learn-us-maw-phase", Kind = "Learn", Story = "UsMawPhase", RetailOnly = true,
        Recorded = "after one: none; after two: 6992 ends in 301400", Target = "after one: none; after two: 6992 ends in 301400"},
    {Name = "learn-hunt-order", Kind = "Learn", Story = "HuntOrder", RetailOnly = true,
        Recorded = "7343,7344,7342", Target = "7343,7344,7342"},
    {Name = "learn-nothing-changed", Kind = "Learn", Story = "NothingChanged", RetailOnly = true,
        Recorded = "observations 1", Target = "observations 1"},
    -- The taint review of 2026-10-21: the findings printed for every player, and a saved id no longer in a rotation errored
    {Name = "learn-quiet-without-debug", Kind = "Learn", Story = "QuietWithoutDebug", RetailOnly = true,
        Recorded = "reports 0; learned", Target = "reports 0; learned"},
    {Name = "learn-old-id", Kind = "Learn", Story = "OldId", RetailOnly = true,
        Recorded = "no error", Target = "no error"},
    -- The code review of 2026-10-22: a start learned under an older schedule outlived the schedule's correction, and a
    -- relog recorded the occurrence going on again
    {Name = "learn-schedule-changed", Kind = "Learn", Story = "ScheduleChanged", RetailOnly = true,
        Recorded = "5964 ends in 25100", Target = "5964 ends in 25100"},
    {Name = "learn-relog", Kind = "Learn", Story = "Relog", RetailOnly = true,
        Recorded = "observations 1", Target = "observations 1"},
    -- In game on 2026-10-22: a storm, whose POI reports no time, seen at 19:37 and again after a /reload at 19:49, was
    -- recorded twice; its start is only when it was first seen, so the same storm within its window is one occurrence
    {Name = "learn-untimed-relog", Kind = "Learn", Story = "UntimedRelog", RetailOnly = true,
        Recorded = "observations 1", Target = "observations 1"},
    -- The watcher's log on the Data Manager's second tab (Krowi, 2026-10-22): one line per family with what was learned,
    -- then what was seen, newest first
    {Name = "log-text", Kind = "Learn", Story = "LogText", RetailOnly = true,
        Recorded = "Faction Assaults: learned, cycle start 2027-01-20 17:00, the same as the addon's schedule / Grand Hunts: watched only, 1 seen", Target = "Faction Assaults: learned, cycle start 2027-01-20 17:00, the same as the addon's schedule / Grand Hunts: watched only, 1 seen"}
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
-- learned: whether the schedules may use what the watcher learned (the learning stories), or only the shipped starts;
-- locked: the character has not done the quest a family requires
local function NewClock(region, now, learned, locked)
    local clock = {Region = region, Now = now}
    clock.Source = {
        QuestDone = function() return not locked end,
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
local function WithClock(region, at, read, locked)
    local engine = addon.Data.EventSchedules
    if not engine then
        return read()
    end
    engine.UseSourceForTest(NewClock(region, at, learning, locked).Source)
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
    end, scenario.Locked)
end

-- Model profiles, as AceDB keeps them in KrowiAF_Options.profiles: a toggle is only saved when it differs from the default
local function DescribeMerge()
    local manager = addon.Data.DataIntegrityManager
    if not manager or not manager.MergeLegionAssaultToggles then
        return "no merge"
    end
    local profiles = {
        AllOff = {EventReminders = {WorldEvents = {[5175] = false, [5177] = false, [5178] = false, [5210] = false}}},
        Azsuna = {EventReminders = {WorldEvents = {[5175] = false}}}, -- only Azsuna off: the others were on
        Others = {EventReminders = {WorldEvents = {[5177] = false}}}, -- Azsuna on, Highmountain off
        Untouched = {},
    }
    manager.MergeLegionAssaultToggles(profiles, {}, false)
    local parts = {}
    for _, name in ipairs({"AllOff", "Azsuna", "Others", "Untouched"}) do
        local world = profiles[name].EventReminders and profiles[name].EventReminders.WorldEvents or {}
        local left = 0
        for _, id in ipairs({5177, 5178, 5210}) do
            if world[id] ~= nil then
                left = left + 1
            end
        end
        tinsert(parts, ("%s %s%s"):format(name, world[5175] == false and "off" or "on", left > 0 and (", " .. left .. " left") or ""))
    end
    return table.concat(parts, "; ")
end

-- The solution as DataIntegrityManager runs it, on model profiles and a model of KrowiAF_SavedData.Fixes
local mergeCases = {}

-- Merged on one update; the player turns Legion Assaults off; the next update must leave it off
function mergeCases.Again(merge)
    local fixes = {}
    local profiles = {Default = {EventReminders = {WorldEvents = {[5175] = false}}}}
    merge(profiles, fixes, false)
    profiles.Default.EventReminders.WorldEvents[5175] = false
    merge(profiles, fixes, false)
    return profiles.Default.EventReminders.WorldEvents[5175] == false and "off" or "on"
end

-- The active profile: AceDB copied the defaults into it raw, so a nil reads as off; Val'sharah was turned off
function mergeCases.ActiveProfile(merge)
    local profiles = {Default = {EventReminders = {WorldEvents = {[5175] = true, [5177] = true, [5178] = true, [5210] = false}}}}
    merge(profiles, {}, false)
    return tostring(profiles.Default.EventReminders.WorldEvents[5175])
end

-- A first install has nothing to merge: the solution is marked done and touches nothing
function mergeCases.FirstInstall(merge)
    local fixes = {}
    local profiles = {Default = {EventReminders = {WorldEvents = {[5175] = false}}}}
    merge(profiles, fixes, true)
    return ("%s, %s"):format(fixes.MergeLegionAssaultToggles and "marked" or "not marked",
        profiles.Default.EventReminders.WorldEvents[5175] == false and "untouched" or "changed")
end

local function DescribeMergeCase(scenario)
    local manager = addon.Data.DataIntegrityManager
    if not manager or not manager.MergeLegionAssaultToggles then
        return "no merge"
    end
    return mergeCases[scenario.Case](manager.MergeLegionAssaultToggles)
end

-- [[ The learning stories: Data/EventObserver.lua told a sequence of POIs through a model of the POI API ]] --

local function NewPoiModel(region, now)
    local model = {Region = region, Now = now, Left = {}, Reports = {}, Debug = true}
    model.Source = {
        Region = function() return model.Region end,
        Now = function() return model.Now end,
        SecondsLeft = function(id) return model.Left[id] end,
        PoiInfo = function(_, id) return model.Info and model.Info[id] end,
        Debug = function() return model.Debug end,
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

-- A Korean player without debug mode: the watcher learns, and prints nothing
function stories.QuietWithoutDebug(model, observer)
    model.Debug = false
    model.Region = regions.KR
    model.Now = factionT0 + 100
    model.Left[5964] = 25100
    observer.RunOnce()
    model.Left[5964] = nil
    observer.RunOnce()
    model.Now = factionT0 + 68400 + 100
    model.Left[5973] = 25100
    observer.RunOnce()
    local learned = observer.GetLearned("FactionAssaults", regions.KR)
    return ("reports %d; %s"):format(#model.Reports, learned and "learned" or "not learned")
end

-- An observation saved by an older release, of an id no longer in the Faction Assaults' rotation, then a new one
function stories.OldId(model, observer)
    model.Region = regions.EU
    model.Store[regions.EU] = {FactionAssaults = {Seen = {{Start = factionT0 - 68400, Id = 1}}}}
    model.Now = factionT0 + 100
    model.Left[5964] = 25100
    local ok = pcall(observer.RunOnce)
    return ok and "no error" or "error"
end

-- EU's Faction Assaults start learned under an older schedule, 30 minutes off; the shipped schedule has been corrected
-- since, so the start learned under the old one is not used
function stories.ScheduleChanged(model)
    model.Store[regions.EU] = {FactionAssaults = {Seen = {}, Anchor = factionT0 + 1800, RotationAnchor = factionT0 + 1800, Definition = "an older schedule"}}
    local at = factionT0 + 100
    return WithClock(regions.EU, at, function() return DescribeFamily({Ids = factionIds, At = at, Region = "EU"}) end)
end

-- The Drustvar assault seen, then a /reload during it: the occurrence is the same, so it is one observation
function stories.Relog(model, observer)
    model.Region = regions.EU
    model.Now = factionT0 + 100
    model.Left[5964] = 25100
    observer.RunOnce()
    observer.UseSourceForTest(model.Source, model.Store) -- a new session: nothing is known to be up yet
    model.Now = factionT0 + 400
    model.Left[5964] = 24800
    observer.RunOnce()
    local seen = observer.GetObservationsForTest(model.Store, regions.EU, "FactionAssaults") or {}
    return ("observations %d"):format(#seen)
end

-- The log of an EU account that learned the Faction Assaults (as shipped) and saw one Grand Hunt: its family lines
function stories.LogText(model, observer)
    if not observer.FormatLog then
        return "no log"
    end
    model.Store[regions.EU] = {
        FactionAssaults = {Seen = {{Start = factionT0, Id = 5964}, {Start = factionT0 + 68400, Id = 5973}}, Anchor = factionT0 + 68400,
            RotationAnchor = factionT0, Definition = addon.Data.EventSchedules.GetDefinition(KrowiAF.EventSchedules.FactionAssaults)},
        GrandHunts = {Seen = {{Start = hour, Id = 7343}}},
    }
    local lines = {}
    for line in observer.FormatLog(model.Store, regions.EU):gmatch("[^\n]+") do
        if line:match("^%S") and not line:match("^Event schedules") and not line:match("^Nothing seen") then
            tinsert(lines, line)
        end
    end
    return table.concat(lines, " / ")
end

-- A Firestorm at Nokhudon Hold, a POI with no time seen in debug mode, then again 12 minutes later after a /reload
function stories.UntimedRelog(model, observer)
    model.Region = regions.EU
    model.Info = {[7223] = {name = "Firestorm"}}
    model.Now = hour + 600
    observer.RunOnce()
    observer.UseSourceForTest(model.Source, model.Store) -- a new session: nothing is known to be up yet
    model.Now = hour + 600 + 720
    observer.RunOnce()
    local seen = observer.GetObservationsForTest(model.Store, regions.EU, "PrimalStorms") or {}
    return ("observations %d"):format(#seen)
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
        if not env.SetPoiState(scenario.Pois, scenario.Widgets, scenario.PoiMaps) then
            blocked = "the game cannot set POIs and widgets; checked in the event's zone instead"
        else
            local at = GetServerTime()
            got = Describe(ReadEvent(scenario.Event, false, at), at)
            env.SetPoiState(nil, nil)
        end
    elseif scenario.Kind == "Learn" then
        got = TellStory(scenario)
    elseif scenario.Kind == "Merge" then
        got = DescribeMerge()
    elseif scenario.Kind == "MergeCase" then
        got = DescribeMergeCase(scenario)
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