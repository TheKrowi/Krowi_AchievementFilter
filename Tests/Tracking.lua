local addonName, addon = ...
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
-- Before the change (verified in game on Retail 12.1.5, 2026-10-22) the button checked the cap first and freed nothing:
-- every scenario at the cap gave result=full untracked=[] printed=[] error=yes, a completed click at the cap too
tracking.Scenarios = {
    {Name = "two-earned", Tracked = {3, 7},
        Recorded = "result=room untracked=[3,7] printed=[A3,A7] error=no",
        Target = "result=room untracked=[3,7] printed=[A3,A7] error=no"},
    {Name = "account-wide-done", Tracked = {11},
        Recorded = "result=room untracked=[11] printed=[A11] error=no",
        Target = "result=room untracked=[11] printed=[A11] error=no"},
    {Name = "guild-done", Tracked = {12},
        Recorded = "result=room untracked=[12] printed=[A12] error=no",
        Target = "result=room untracked=[12] printed=[A12] error=no"},
    {Name = "character-done-elsewhere", Tracked = {13},
        Recorded = "result=full untracked=[] printed=[] error=yes",
        Target = "result=full untracked=[] printed=[] error=yes"},
    {Name = "unknown-id", Tracked = {unknownId},
        Recorded = "result=room untracked=[999999] printed=[999999] error=no",
        Target = "result=room untracked=[999999] printed=[999999] error=no"},
    {Name = "none-done", Tracked = {},
        Recorded = "result=full untracked=[] printed=[] error=yes",
        Target = "result=full untracked=[] printed=[] error=yes"},
    {Name = "below-cap", Tracked = {3}, Count = 9,
        Recorded = "result=room untracked=[] printed=[] error=no",
        Target = "result=room untracked=[] printed=[] error=no"},
    {Name = "click-completed-at-cap", Tracked = {3}, Click = 200,
        Recorded = "result=completed untracked=[] printed=[] error=yes",
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

-- [[ Game only: the steps ]] --

-- After the scenarios the suite presses the Track button for real, the /kevutest way (Krowi_ExtendedVendorUI): each step
-- sets a state through the addon's own functions, names itself in a banner over the achievement window, checks what the
-- window shows and takes a screenshot, which Read-GameTests.ps1 pairs with its file.
--   at-the-cap: 10 tracked with completed ones among them, the player's own or one the run tracks; the achievement to
--     track is selected in the window
--   track-at-the-cap: its row's Track pressed through ToggleTracking: the completed ones are untracked and named in chat,
--     the clicked one is tracked and its row checked
--   untracked-elsewhere: the clicked one untracked the way Blizzard's own tracker does it, C_ContentTracking.StopTracking
--     on Retail (Blizzard_AchievementObjectiveTracker.lua UntrackAchievement), RemoveTrackedAchievement on Classic
--     (WatchFrame.lua WatchFrame_StopTrackingAchievement): its row's Track check clears
-- At the end the tracked achievements are put back as they were, as far as the game takes completed ones back, and the
-- addon's Lua errors of the session are reported from BugGrabber. Combat stops the run; they are put back once it ends. On Retail the
-- steps also record whether the objective tracker's dirty flags stay secure: the tracking calls fire
-- CONTENT_TRACKING_UPDATE inside the addon's call and the tracker marks itself dirty from there; the container clears its
-- own flag to nil, which reads as secure whoever cleared it, so the modules' isDirty, which each layout sets to false
-- (Blizzard_ObjectiveTrackerModule.lua BeginLayout), shows whether the layout after the call ran tainted. The run calls
-- the game's tracking from addon code: /reload before combat, and do not leave this suite on /kaftest login.

local settle = 1.5 -- a state change -> its check and screenshot
local afterShot = 1 -- a screenshot -> the next step

local live -- the run in progress
local runToken = 0 -- bumped by every stop, so a stopped run's timers do nothing
local banner
local steps, SetBanner

local function TrackedIds()
    return addon.Gui.TrackingSlots.GetTrackedIds()
end

-- C completed, E earned by this character, G guild, A account-wide, ? unknown to the game
local function DescribeAchievement(id)
    local knownId, _, _, completed, _, _, _, _, flags, _, _, isGuild, wasEarnedByMe = GetAchievementInfo(id)
    if not knownId then
        return id .. "?"
    end
    return id .. (completed and "C" or "") .. (wasEarnedByMe and "E" or "") .. (isGuild and "G" or "")
        .. (addon.Objects.Flags:New(flags).IsAccountWide and "A" or "")
end

local function ObserveTracker(label)
    if not addon.Util.IsMainline then
        return
    end
    local parts = {}
    for _, probe in ipairs({{ObjectiveTrackerFrame, "ObjectiveTrackerFrame", "dirty"}, {AchievementObjectiveTracker, "AchievementObjectiveTracker", "isDirty"},
        {QuestObjectiveTracker, "QuestObjectiveTracker", "isDirty"}, {ScenarioObjectiveTracker, "ScenarioObjectiveTracker", "isDirty"}}) do
        local frame, name, field = probe[1], probe[2], probe[3]
        if type(frame) ~= "table" then
            tinsert(parts, name .. " does not exist")
        else
            local ok, isSecure, taintedBy = pcall(issecurevariable, frame, field)
            local security = not ok and "unreadable" or isSecure and "secure" or ("tainted by " .. tostring(taintedBy))
            tinsert(parts, ("%s.%s %s %s"):format(name, field, tostring(rawget(frame, field)), security))
        end
    end
    tinsert(live.Observations, label .. ": " .. table.concat(parts, ", "))
end

local function Add(status, text)
    tinsert(live.Results, {
        Name = "live-" .. live.StepName,
        Status = status,
        GameOnly = true,
        Line = ("tracking/live-%s: %s %s"):format(live.StepName, status, text)
    })
end

local function After(seconds, func)
    local token = runToken
    C_Timer.After(seconds, function()
        if live and token == runToken then
            func()
        end
    end)
end

-- Achievements nobody completed that the window can show as themselves, not tracked yet: with Collapse Series the window
-- selects the series' next achievement instead when that one is completed (Filters.lua GetHighestAchievementWhenCollapseSeries)
local function Candidates(count)
    local found = {}
    if count <= 0 then
        return found
    end
    for id, achievement in next, addon.Data.Achievements do
        if achievement.Category and not achievement.IsTracking and not IsTrackedAchievement(id) and not select(2, addon.GetNextAchievement(achievement)) then
            local knownId, _, _, completed, _, _, _, _, _, _, _, isGuild, wasEarnedByMe, _, isStatistic = GetAchievementInfo(id)
            if knownId and not completed and not wasEarnedByMe and not isGuild and not isStatistic then
                tinsert(found, id)
                if #found == count then
                    break
                end
            end
        end
    end
    return found
end

-- An achievement this character earned and does not track, to leave tracked as a crash would
local function EarnedCandidate()
    for id in next, addon.Data.Achievements do
        if not IsTrackedAchievement(id) then
            local knownId, _, _, _, _, _, _, _, _, _, _, isGuild, wasEarnedByMe, _, isStatistic = GetAchievementInfo(id)
            if knownId and wasEarnedByMe and not isGuild and not isStatistic then
                return id
            end
        end
    end
end

local function Row()
    local achievement = addon.Data.Achievements[live.Clicked]
    return achievement and KrowiAF_AchievementsFrame.ScrollBox:FindFrame(achievement)
end

local function RowShowsTracked(row)
    return row.Tracked:GetChecked() and row.Check:IsShown() and true or false
end

local function Join(ids)
    return table.concat(ids, ",")
end

steps = {
    {
        Name = "at-the-cap",
        Text = "10 tracked, completed ones among them",
        Run = function()
            local done = {}
            for _, id in ipairs(TrackedIds()) do
                if addon.Gui.TrackingSlots.IsDone(id) then
                    tinsert(done, id)
                end
            end
            if #done == 0 then
                local id = EarnedCandidate()
                if id then
                    local ok, err = pcall(AddTrackedAchievement, id) -- Classic 5.5.4 raises a usage error for an earned one
                    tinsert(live.Observations, ("none of the tracked achievements was done; tracking %d, earned: %s"):format(id,
                        IsTrackedAchievement(id) and "the game took it" or ("the game refused it" .. (ok and "" or (": " .. tostring(err))))))
                    if IsTrackedAchievement(id) then
                        tinsert(done, id)
                    end
                end
            end
            live.Done = done
            -- Without a done achievement the button is pressed below the cap: it frees nothing then, and the row's Track
            -- check is still checked; the freeing itself is the scenarios' then
            live.Target = #done > 0 and MAX_TRACKED_ACHIEVEMENTS or MAX_TRACKED_ACHIEVEMENTS - 1
            if #done == 0 then
                SetBanner(("%d tracked, none done: the game would not track a completed one"):format(live.Target))
            end
            local room = live.Target - #TrackedIds()
            if room < 0 then
                return ("%d tracked and none done: untrack one to run the steps"):format(#TrackedIds())
            end
            local picked = Candidates(room + 1)
            if #picked <= room then
                return "not enough achievements nobody completed to fill the tracker"
            end
            live.Clicked = tremove(picked)
            for _, id in ipairs(picked) do
                AddTrackedAchievement(id)
            end
            KrowiAF_SelectAchievementFromID(live.Clicked)
        end,
        Check = function()
            local count = #TrackedIds()
            Add(count == live.Target and "PASS" or "FAIL", ("%d of %d tracked, done among them: [%s]"):format(count, MAX_TRACKED_ACHIEVEMENTS, Join(live.Done)))
            local row = Row()
            if not row then
                Add("FAIL", ("the row of %d, the achievement to track, is not on screen"):format(live.Clicked))
                return
            end
            Add(not RowShowsTracked(row) and "PASS" or "FAIL", ("the row of %d shows it untracked"):format(live.Clicked))
        end
    },
    {
        Name = "track-at-the-cap",
        Text = "Track pressed with 10 tracked: the completed ones untracked and named in chat",
        Run = function()
            local row = Row()
            if not row then
                return "the row of the achievement to track is not on screen"
            end
            if #live.Done == 0 then
                SetBanner(("Track pressed with %d tracked: tracked, nothing done to free"):format(#TrackedIds()))
            end
            row:ToggleTracking()
        end,
        Check = function()
            local stillTracked = {}
            for _, id in ipairs(live.Done) do
                if IsTrackedAchievement(id) then
                    tinsert(stillTracked, id)
                end
            end
            if #live.Done > 0 then
                Add(#stillTracked == 0 and "PASS" or "FAIL", ("the done ones untracked: [%s]%s"):format(Join(live.Done),
                    #stillTracked > 0 and (", still tracked: [" .. Join(stillTracked) .. "]") or ""))
            end
            Add(IsTrackedAchievement(live.Clicked) and "PASS" or "FAIL", ("%d tracked"):format(live.Clicked))
            local row = Row()
            Add(row and RowShowsTracked(row) and "PASS" or "FAIL", ("the row of %d shows it tracked"):format(live.Clicked))
            ObserveTracker("after the press")
        end
    },
    {
        Name = "untracked-elsewhere",
        Text = "untracked the way Blizzard's tracker does: the Track check clears",
        Run = function()
            if not IsTrackedAchievement(live.Clicked) then
                return "the clicked achievement is not tracked"
            end
            if GetTrackedAchievements then
                RemoveTrackedAchievement(live.Clicked)
            else
                C_ContentTracking.StopTracking(Enum.ContentTrackingType.Achievement, live.Clicked, Enum.ContentTrackingStopType.Manual)
            end
        end,
        Check = function()
            local row = Row()
            Add(row and not RowShowsTracked(row) and "PASS" or "FAIL", ("the row of %d shows it untracked"):format(live.Clicked))
            ObserveTracker("after the untrack")
        end
    }
}

function SetBanner(text)
    banner.Text:SetText(("Krowi's Achievement Filter test %d/%d: %s"):format(live.StepIndex, #steps, text))
end

-- Every achievement the run tracked is untracked, and every one the player tracked before is tracked again; returns the
-- ones the game would not take back
local function Restore()
    local before = {}
    for _, id in ipairs(live.Before) do
        before[id] = true
    end
    for _, id in ipairs(TrackedIds()) do
        if not before[id] then
            RemoveTrackedAchievement(id)
        end
    end
    local refused = {}
    for _, id in ipairs(live.Before) do
        if not IsTrackedAchievement(id) then
            pcall(AddTrackedAchievement, id) -- Classic raises an error for an earned one
            if not IsTrackedAchievement(id) then
                tinsert(refused, id)
            end
        end
    end
    return refused
end

-- This addon's Lua errors in this session, also from before the run, as BugGrabber caught them
local function CheckErrors()
    if not (BugGrabber and type(BugGrabber.GetDB) == "function" and type(BugGrabber.GetSessionId) == "function") then
        tinsert(live.Observations, "no BugGrabber, so Lua errors are not checked")
        return
    end
    local session = BugGrabber:GetSessionId()
    local found = 0
    for _, err in ipairs(BugGrabber:GetDB()) do
        if err.session == session and ((type(err.message) == "string" and err.message:find(addonName, 1, true))
            or (type(err.stack) == "string" and err.stack:find(addonName, 1, true))) then
            found = found + 1
            Add("FAIL", ("Lua error x%d: %s"):format(err.counter or 1, tostring(err.message):sub(1, 300)))
        end
    end
    if found == 0 then
        Add("PASS", "no Lua error from this addon this session (BugGrabber)")
    end
end

-- Puts the tracked achievements back, reports the Lua errors and hands the results to the runner
local function Finish()
    banner:UnregisterAllEvents()
    live.StepName = "restore"
    local ok, refused = pcall(Restore)
    if not ok then
        Add("FAIL", "could not put the tracked achievements back: " .. tostring(refused))
    else
        local notBack = {}
        for _, id in ipairs(refused) do
            if addon.Gui.TrackingSlots.IsDone(id) then
                tinsert(live.Observations, ("%d, done, stays untracked: the game would not track it again"):format(id))
            else
                tinsert(notBack, id)
            end
        end
        Add(#notBack == 0 and "PASS" or "FAIL", "the tracked achievements are as before the run"
            .. (#notBack > 0 and (", except [" .. Join(notBack) .. "]") or ""))
    end

    live.StepName = "lua-errors"
    local checked, err = pcall(CheckErrors)
    if not checked then
        Add("FAIL", "test error: " .. tostring(err))
    end
    tinsert(live.Observations, "the run called the game's tracking from addon code: /reload before entering combat")

    local finish, results, observations = live.Finish, live.Results, live.Observations
    live = nil
    finish(results, observations)
end

-- Ends the steps. In combat the tracked achievements are put back only once it ends: every tracking call from addon code
-- marks the objective tracker dirty from the addon's execution, and its next layout would run tainted in the fight.
local function Stop(reason, combatStarted)
    runToken = runToken + 1
    banner:Hide()
    if reason then
        tinsert(live.Observations, "stopped: " .. reason)
    end
    if combatStarted or InCombatLockdown() then
        banner:UnregisterAllEvents()
        banner:RegisterEvent("PLAYER_REGEN_ENABLED")
        print("|cFF88CCFFKrowiAF Tests:|r tracking: stopped for combat; your tracked achievements are put back when it ends")
        return
    end
    Finish()
end

local RunStep

local function Capture()
    local ok, err = pcall(steps[live.StepIndex].Check)
    if not ok then
        Add("FAIL", "test error: " .. tostring(err))
    end
    live.Shot = {Time = date("%Y-%m-%d %H:%M:%S")}
    live.Results[#live.Results].Screenshot = live.Shot
    Screenshot()
    After(afterShot, function()
        RunStep(live.StepIndex + 1)
    end)
end

RunStep = function(n)
    local step = steps[n]
    if not step then
        Stop()
        return
    end
    live.StepIndex, live.StepName = n, step.Name
    SetBanner(step.Text)
    local ok, skip = pcall(step.Run)
    if not ok then
        Add("FAIL", "test error: " .. tostring(skip))
        Stop("step " .. step.Name .. " errored")
        return
    end
    if skip then -- every later step builds on this one
        Add("SKIP", skip)
        Stop()
        return
    end
    After(settle, Capture)
end

local function CreateBanner()
    banner = CreateFrame("Frame", nil, UIParent)
    banner:SetFrameStrata("DIALOG")
    banner:SetSize(620, 26)
    local background = banner:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints()
    background:SetColorTexture(0, 0, 0, 0.85)
    banner.Text = banner:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    banner.Text:SetPoint("CENTER")
    banner:SetScript("OnEvent", function(_, event)
        if not live then
            return
        end
        if event == "SCREENSHOT_FAILED" and live.Shot then
            live.Shot.Failed = true
        elseif event == "PLAYER_REGEN_DISABLED" then
            Stop("combat started", true)
        elseif event == "PLAYER_REGEN_ENABLED" then
            Finish()
        end
    end)
    banner:Hide()
end

addon.Tests.Ready.tracking = function()
    if live then
        return false, "the previous tracking run is still going"
    end
    if not addon.Data.IsLoaded then -- categories and series are set only at the end of the login data load (Data/Data.lua)
        return false, "the achievement data is not loaded yet"
    end
    return true
end

addon.Tests.Async.tracking = true
addon.Tests.Suites.tracking = function(done)
    if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then -- the tracking calls and the window load with it
        C_AddOns.LoadAddOn("Blizzard_AchievementUI")
    end
    live = {Results = tracking.Run(), Observations = {}, Finish = done, Before = TrackedIds()}
    local described = {}
    for _, id in ipairs(live.Before) do
        tinsert(described, DescribeAchievement(id))
    end
    tinsert(live.Observations, ("tracked before the run, %d of %d: [%s]"):format(#described, MAX_TRACKED_ACHIEVEMENTS, table.concat(described, ",")))

    if not banner then
        CreateBanner()
    end
    banner:ClearAllPoints()
    banner:SetPoint("BOTTOM", AchievementFrame, "TOP", 0, 6)
    banner:RegisterEvent("SCREENSHOT_FAILED")
    banner:RegisterEvent("PLAYER_REGEN_DISABLED")
    banner:Show()
    print(("|cFF88CCFFKrowiAF Tests:|r tracking: %d steps, about 10 s; it tracks up to %d achievements and puts them back"):format(#steps, MAX_TRACKED_ACHIEVEMENTS))
    RunStep(1)
end