local _, addon = ...
addon.Tests.Tracking = {}
local tracking = addon.Tests.Tracking

-- What the addon's Track button does when the character already tracks as many achievements as the game allows
-- (docs/work/2026-10-22-free-tracking-slots). An achievement this character earned can stay tracked, after a crash before
-- the game saved or when another character completed it; Blizzard's tracker hides it, but it keeps one of the slots. A
-- scenario runs addon.Gui.TrackingSlots.MakeRoom, the checks the Track button makes before it tracks, on a model of the
-- game's tracking (UseSourceForTest) with a fixture of tracked achievements, in game (/kaftest tracking) and headlessly
-- (.claude/tools/headless/run-tests.lua) alike, and records:
--   result: room (the button may track), full (too many tracked) or completed (the clicked achievement is completed)
--   untracked: the ids the checks stopped tracking; printed: what they named in chat; error: whether an error showed
-- The game's error texts are localized, so the line holds these codes, not the texts.

local maxTracked = 10
local unknownId = 999999 -- an id the game no longer knows
local accountWideFlag = 0x00020000 -- ACHIEVEMENT_FLAGS_ACCOUNT
local defaultClick = 100 -- an achievement nobody completed

-- [id] = what GetAchievementInfo says about it; any other id but unknownId is an achievement nobody completed
local earned = {Completed = true, EarnedByMe = true}
local fixture = {
    [3] = earned, [7] = earned, [200] = earned,
    [11] = {Completed = true, AccountWide = true}, -- another character completed this account-wide achievement
    [12] = {Completed = true, Guild = true}, -- a completed guild achievement
    [13] = {Completed = true} -- another character completed this character achievement; this one can still earn it
}

-- Tracked: ids tracked before the click, topped up with achievements nobody completed (21, 22, ...) to Count (default
--   the cap); Click: the achievement the player tracks (default an achievement nobody completed)
-- Recorded / Target: "result=<room|full|completed> untracked=[ids] printed=[links or ids] error=<yes|no>"
-- Recorded is the button before the change: the cap checked first, nothing freed
tracking.Scenarios = {
    {Name = "two-earned", Tracked = {3, 7},
        Recorded = "result=full untracked=[] printed=[] error=yes",
        Target = "result=room untracked=[3,7] printed=[A3,A7] error=no"},
    {Name = "account-wide-done", Tracked = {11},
        Recorded = "result=full untracked=[] printed=[] error=yes",
        Target = "result=room untracked=[11] printed=[A11] error=no"},
    {Name = "guild-done", Tracked = {12},
        Recorded = "result=full untracked=[] printed=[] error=yes",
        Target = "result=room untracked=[12] printed=[A12] error=no"},
    {Name = "character-done-elsewhere", Tracked = {13},
        Recorded = "result=full untracked=[] printed=[] error=yes",
        Target = "result=full untracked=[] printed=[] error=yes"},
    {Name = "unknown-id", Tracked = {unknownId},
        Recorded = "result=full untracked=[] printed=[] error=yes",
        Target = "result=room untracked=[999999] printed=[999999] error=no"},
    {Name = "none-done", Tracked = {},
        Recorded = "result=full untracked=[] printed=[] error=yes",
        Target = "result=full untracked=[] printed=[] error=yes"},
    {Name = "below-cap", Tracked = {3}, Count = 9,
        Recorded = "result=room untracked=[] printed=[] error=no",
        Target = "result=room untracked=[] printed=[] error=no"},
    {Name = "click-completed-at-cap", Tracked = {3}, Click = 200,
        Recorded = "result=full untracked=[] printed=[] error=yes",
        Target = "result=completed untracked=[] printed=[] error=yes"},
    {Name = "click-completed-below-cap", Tracked = {}, Count = 9, Click = 200,
        Recorded = "result=completed untracked=[] printed=[] error=yes",
        Target = "result=completed untracked=[] printed=[] error=yes"}
}

-- A model of what the checks read from and do in the game; it records what was untracked, printed and shown
local function NewModel(trackedIds)
    local model = {Tracked = trackedIds, Untracked = {}, Printed = {}, Errors = 0}
    model.Source = {
        GetTrackedIds = function()
            local copy = {}
            for i, id in ipairs(model.Tracked) do
                copy[i] = id
            end
            return copy
        end,
        GetNumTracked = function() return #model.Tracked end,
        GetMaxTracked = function() return maxTracked end,
        GetAchievementInfo = function(id)
            if id == unknownId then
                return
            end
            local info = fixture[id] or {}
            return id, "Achievement " .. id, 10, info.Completed or false, nil, nil, nil, "", info.AccountWide and accountWideFlag or 0, 0, "",
                info.Guild or false, info.EarnedByMe or false
        end,
        GetAchievementLink = function(id)
            if id ~= unknownId then
                return "A" .. id
            end
        end,
        GetEarnedByFilter = function() return "Account" end, -- the default, Filters.lua
        Untrack = function(id)
            for i, trackedId in ipairs(model.Tracked) do
                if trackedId == id then
                    table.remove(model.Tracked, i)
                    break
                end
            end
            tinsert(model.Untracked, id)
        end,
        ShowError = function() model.Errors = model.Errors + 1 end,
        Print = function(...) tinsert(model.Printed, tostring((select(select("#", ...), ...)))) end -- the last argument names the achievement
    }
    return model
end

local function Describe(scenario)
    local tracked = {}
    for _, id in ipairs(scenario.Tracked) do
        tinsert(tracked, id)
    end
    local filler = 21
    while #tracked < (scenario.Count or maxTracked) do
        tinsert(tracked, filler)
        filler = filler + 1
    end

    local slots = addon.Gui.TrackingSlots
    local model = NewModel(tracked)
    slots.UseSourceForTest(model.Source)
    local ok, refused = pcall(slots.MakeRoom, scenario.Click or defaultClick)
    slots.UseSourceForTest(nil)
    if not ok then
        error(refused, 0)
    end
    return ("result=%s untracked=[%s] printed=[%s] error=%s"):format(refused or "room", table.concat(model.Untracked, ","),
        table.concat(model.Printed, ","), model.Errors > 0 and "yes" or "no")
end

-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs), TargetMet, Line
local function RunScenario(scenario)
    local got = Describe(scenario)
    local status = got == scenario.Recorded and "PASS" or "FAIL"
    local targetMet = got == scenario.Target
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("tracking/%s: %s recorded=[%s] got=[%s] target=[%s] %s"):format(scenario.Name, status, scenario.Recorded, got, scenario.Target,
            targetMet and "met" or "open")
    }
end

function tracking.Run()
    local results = {}
    for _, scenario in ipairs(tracking.Scenarios) do
        tinsert(results, RunScenario(scenario))
    end
    return results
end

-- [[ Game only: the real tracking ]] --

-- Observations, no scenarios: the player's real tracked achievements and which of them the checks call done, then a
-- probe that tracks and untracks one achievement nobody completed through the calls the Track button makes. The probe
-- records whether the tracked count changes inside the call (the checks count again right after they free slots),
-- whether TRACKED_ACHIEVEMENT_LIST_CHANGED fires (the rows of the achievement window redraw their Track check from it),
-- and on Retail whether the objective tracker's dirty flags stay secure: the untrack fires CONTENT_TRACKING_UPDATE inside
-- the addon's call, and the tracker marks itself dirty from there (Blizzard_SharedXML/MixinUtil.lua, DirtiableMixin).

local function TrackedIds()
    if C_ContentTracking then
        return C_ContentTracking.GetTrackedIDs(Enum.ContentTrackingType.Achievement)
    end
    return {GetTrackedAchievements()}
end

-- C completed, E earned by this character, G guild, A account-wide, ? unknown to the game
local function DescribeAchievement(id)
    local knownId, _, _, completed, _, _, _, _, flags, _, _, isGuild, wasEarnedByMe = GetAchievementInfo(id)
    if not knownId then
        return id .. "?"
    end
    return id .. (completed and "C" or "") .. (wasEarnedByMe and "E" or "") .. (isGuild and "G" or "")
        .. (bit.band(flags, accountWideFlag) == accountWideFlag and "A" or "")
end

local function ObserveTracked(observations)
    local described, done = {}, {}
    local isDone = addon.Gui.TrackingSlots.IsDone
    for _, id in ipairs(TrackedIds()) do
        tinsert(described, DescribeAchievement(id))
        if isDone and isDone(id) then
            tinsert(done, id)
        end
    end
    tinsert(observations, ("tracked %d of %d: [%s]; done by the checks: %s"):format(#described, MAX_TRACKED_ACHIEVEMENTS, table.concat(described, ","),
        isDone and ("[" .. table.concat(done, ",") .. "]") or "no rule yet"))
end

local function ProbeCandidate()
    if #TrackedIds() >= MAX_TRACKED_ACHIEVEMENTS then
        return nil, "at the tracking cap; untrack one achievement to run the probe"
    end
    for id in pairs(addon.Data.Achievements) do
        local knownId, _, _, completed, _, _, _, _, _, _, _, isGuild, wasEarnedByMe, _, isStatistic = GetAchievementInfo(id)
        -- No C_ContentTracking.IsTrackable here: with it no achievement passed on Retail 12.1.5 (2026-10-22), so it
        -- answers for collectables only; whether the game takes the candidate shows in what the track call returns
        if knownId and not completed and not wasEarnedByMe and not isGuild and not isStatistic and not IsTrackedAchievement(id) then
            return id
        end
    end
    return nil, "no achievement nobody completed"
end

local function ObserveTracker(observations, label)
    if not addon.Util.IsMainline then
        return
    end
    local parts = {}
    for _, probe in ipairs({{ObjectiveTrackerFrame, "ObjectiveTrackerFrame", "dirty"}, {AchievementObjectiveTracker, "AchievementObjectiveTracker", "isDirty"}}) do
        local frame, name, field = probe[1], probe[2], probe[3]
        if type(frame) ~= "table" then
            tinsert(parts, name .. " does not exist")
        else
            local ok, isSecure, taintedBy = pcall(issecurevariable, frame, field)
            local security = not ok and "unreadable" or isSecure and "secure" or ("tainted by " .. tostring(taintedBy))
            tinsert(parts, ("%s.%s %s %s"):format(name, field, tostring(rawget(frame, field)), security))
        end
    end
    tinsert(observations, label .. ": " .. table.concat(parts, ", "))
end

local probeEvents = {"TRACKED_ACHIEVEMENT_LIST_CHANGED", "CONTENT_TRACKING_UPDATE"}
local probeFrame -- one frame for every run
local calling -- a probed call is running, so an event fired inside it is counted
local firedDuring

local function Call(observations, label, func, id)
    local before = #TrackedIds()
    for _, event in ipairs(probeEvents) do
        firedDuring[event] = 0
    end
    calling = true
    local ok, result = pcall(func, id)
    calling = nil
    local fired = {}
    for _, event in ipairs(probeEvents) do
        tinsert(fired, ("%s %d"):format(event, firedDuring[event]))
    end
    tinsert(observations, ("%s %d: %s; tracked %d -> %d inside the call; fired during it: %s"):format(label, id,
        ok and ("returned " .. tostring(result)) or ("errored: " .. tostring(result)), before, #TrackedIds(), table.concat(fired, ", ")))
end

local function StopListening()
    probeFrame:SetScript("OnEvent", nil)
    probeFrame:UnregisterAllEvents()
end

local running -- a run waits for the tracker's next redraw

local function Probe(observations, id)
    ObserveTracker(observations, "before")
    Call(observations, "track", AddTrackedAchievement, id)
    ObserveTracker(observations, "after track")
    Call(observations, "untrack", RemoveTrackedAchievement, id)
    ObserveTracker(observations, "after untrack")
end

addon.Tests.Ready.tracking = function()
    if running then
        return false, "the previous tracking run is still waiting"
    end
    if not addon.Data.Achievements[6] then -- Level 10, registered on every client
        return false, "the achievement data is not loaded yet"
    end
    if not AddTrackedAchievement or not MAX_TRACKED_ACHIEVEMENTS then
        return false, "open the achievement window once first: the tracking calls load with it"
    end
    return true
end

addon.Tests.Async.tracking = true
addon.Tests.Suites.tracking = function(done)
    local results = tracking.Run()
    local observations = {}
    local ok, err = pcall(ObserveTracked, observations)
    if not ok then
        tinsert(observations, "the tracked achievements could not be read: " .. tostring(err))
    end

    local id, reason = ProbeCandidate()
    if not id then
        tinsert(observations, "probe skipped: " .. reason)
        done(results, observations)
        return
    end

    probeFrame = probeFrame or CreateFrame("Frame")
    firedDuring = {}
    for _, event in ipairs(probeEvents) do
        pcall(probeFrame.RegisterEvent, probeFrame, event) -- Classic has no CONTENT_TRACKING_UPDATE
    end
    probeFrame:SetScript("OnEvent", function(_, event)
        if calling then
            firedDuring[event] = firedDuring[event] + 1
        end
    end)

    ok, err = pcall(Probe, observations, id)
    calling = nil
    if not ok then -- reported, not raised, so the frame stops listening and what was observed is kept
        StopListening()
        tinsert(observations, "the probe errored: " .. tostring(err))
        done(results, observations)
        return
    end

    running = true
    C_Timer.After(1, function()
        StopListening()
        ObserveTracker(observations, "1 s later")
        tinsert(observations, ("probe achievement %d still tracked at the end: %s"):format(id, tostring(IsTrackedAchievement(id))))
        tinsert(observations, "the probe called the game's tracking from addon code: /reload before entering combat")
        running = nil
        done(results, observations)
    end)
end