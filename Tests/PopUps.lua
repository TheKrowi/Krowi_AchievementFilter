local addonName, addon = ...
addon.Tests.PopUps = {}
local popUps = addon.Tests.PopUps

-- The event reminder pop-ups and Blizzard's alert frame (issues #188 and #364, docs/work/188-event-reminder-popups):
-- where the location options put the pop-ups, whether the addon changes how the game's own toasts stack, whether it
-- follows another addon that places the game's alerts, and what Show placeholders and Hide placeholders do. Every
-- scenario goes through the options' own setters (Options/EventReminders.lua) and puts back what it changed; it hides
-- and dequeues only the addon's own pop-ups, so a run also clears the reminders showing at the time.
--
-- In game (/kaftest popups) the scenarios read the real AlertFrame; headlessly (.claude/tools/headless/run-tests.lua)
-- they read a model of Blizzard's alert container, queue and frame pool (Blizzard_FrameXML/Mainline/AlertFrames.lua,
-- Classic/AlertFrames.lua). The headless env can also load the addon again (Reload), show one of the game's toasts and
-- hold the game's alerts back, which the game cannot do from addon code without tainting Blizzard's alerts, so those
-- scenarios SKIP in game. After the scenarios the game run shows the placeholders and hides them, each step with a
-- banner and a screenshot, then reports the addon's Lua errors of the session from BugGrabber.

local location = "EventReminders.PopUps.Location."

local function System()
    return addon.Gui.EventReminderAlertSystem
end

-- An option as the player's click reaches it: its node in the AceConfig tables, by its path below the pages
local function Node(path)
    local node = addon.Options.OptionsTable
    for key in path:gmatch("[^%.]+") do
        node = node and node.args and node.args[key]
    end
    return node
end

local function SetOption(path, value)
    Node(path).set(nil, value)
end

local function GetOption(path)
    return Node(path).get()
end

local subSystems = {}
local function KafSubSystems()
    wipe(subSystems)
    local system = System()
    subSystems[#subSystems + 1] = system.SubSystem
    subSystems[#subSystems + 1] = system.FollowSubSystem
    return subSystems
end

local function IsKaf(subSystem)
    local system = System()
    return subSystem == system.SubSystem or subSystem == system.FollowSubSystem
end

local function Count()
    local shown, queued = 0, 0
    for _, subSystem in ipairs(KafSubSystems()) do
        shown = shown + subSystem:GetNumVisibleAlerts()
        queued = queued + subSystem:GetNumQueuedAlerts()
    end
    return shown, queued
end

local function FirstPopUp()
    for _, subSystem in ipairs(KafSubSystems()) do
        for frame in subSystem.alertFramePool:EnumerateActive() do
            return frame
        end
    end
end

-- The suite's own cleanup: empties the addon's queues and hides its pop-ups, as a right click hides one
local function ClearPopUps()
    local frames = {}
    for _, subSystem in ipairs(KafSubSystems()) do
        subSystem.queuedAlerts = nil
        for frame in subSystem.alertFramePool:EnumerateActive() do
            frames[#frames + 1] = frame
        end
    end
    for _, frame in ipairs(frames) do
        frame:Hide()
    end
end

-- The most pop-ups at a time, 2 for a scenario, on every system of the addon's that exists
local function SetMaxAlerts(max)
    local before = {}
    for _, subSystem in ipairs(KafSubSystems()) do
        before[subSystem] = subSystem.maxAlerts
        subSystem.maxAlerts = max
    end
    return before
end

local function RestoreMaxAlerts(before)
    for subSystem, max in next, before do
        subSystem.maxAlerts = max
    end
end

local function CalendarEvents()
    return addon.Data.Events[KrowiAF.Enum.EventType.Calendar] or {}
end

local function SaveDetails()
    local saved = {}
    for id, event in next, CalendarEvents() do
        saved[id] = event.EventDetails or false
    end
    return saved
end

local function RestoreDetails(saved)
    for id, event in next, CalendarEvents() do
        if saved[id] ~= nil then
            event.EventDetails = saved[id] or nil
        end
    end
end

local function RealEvent()
    for _, event in next, CalendarEvents() do
        if event.Category then
            return event
        end
    end
end

-- A frame's first anchor and how many it has, to tell whether something moved it
local function Anchor(frame)
    if not frame then
        return "none"
    end
    local point, relativeTo, relativePoint, x, y = frame:GetPoint(1)
    local relative = relativeTo == UIParent and "UIParent" or (relativeTo and relativeTo:GetName()) or tostring(relativeTo)
    return ("%s %s %s %d %d #%d"):format(tostring(point), tostring(relative), tostring(relativePoint), floor((x or 0) + 0.5), floor((y or 0) + 0.5), frame:GetNumPoints())
end

-- The last frame of an anchor chain before UIParent: where a pop-up really hangs
local function AnchorRoot(frame)
    for _ = 1, 50 do
        local _, relativeTo = frame:GetPoint(1)
        if not relativeTo or relativeTo == UIParent then
            return frame
        end
        frame = relativeTo
    end
end

local function WhatMoves(change)
    local system = System()
    local alertFrameBefore, holderBefore = Anchor(AlertFrame), Anchor(system.Holder)
    change()
    local moved = {}
    if Anchor(AlertFrame) ~= alertFrameBefore then
        moved[#moved + 1] = "Blizzard's alert frame"
    end
    if Anchor(system.Holder) ~= holderBefore then
        moved[#moved + 1] = "the holder"
    end
    return #moved == 0 and "nothing" or table.concat(moved, " and ")
end

-- What a change of the Y offset moves, through its setter, then the offset back
local function NudgeOffset()
    local offsetY = GetOption(location .. "OffsetY")
    local moves = WhatMoves(function()
        SetOption(location .. "OffsetY", offsetY + 1)
    end)
    SetOption(location .. "OffsetY", offsetY)
    return moves
end

-- Who wrote the stacking function of each of Blizzard's own queued alert systems: Blizzard (secure), the addon, another
local function ToastOwners()
    local owners, labels = {}, {}
    for _, subSystem in ipairs(AlertFrame.alertFrameSubSystems) do
        if subSystem.alertFramePool and not IsKaf(subSystem) then
            local secure, taintedBy = issecurevariable(subSystem, "AdjustAnchors")
            local owner = secure and "Blizzard's" or taintedBy == addonName and "KAF's" or "another addon's"
            if not owners[owner] then
                owners[owner] = true
                labels[#labels + 1] = owner
            end
        end
    end
    table.sort(labels)
    return #labels == 0 and "none" or table.concat(labels, " and ")
end

-- Observe(env) returns the line's value, or nil and why it cannot run here
popUps.Scenarios = {
    {Name = "toast-anchoring",
        Observe = function()
            return ToastOwners()
        end,
        Recorded = "Blizzard's",
        Target = "Blizzard's"},
    {Name = "offset-change",
        Observe = function()
            if not System().SubSystem then
                return nil, "event reminders were off at login"
            end
            return NudgeOffset()
        end,
        Recorded = "Blizzard's alert frame",
        Target = "Blizzard's alert frame"},
    {Name = "only-reminders",
        Observe = function()
            if not System().SubSystem then
                return nil, "event reminders were off at login"
            end
            local appliesTo = Node(location .. "AppliesTo")
            if not appliesTo then
                return "no such setting"
            end
            local before = appliesTo.get()
            appliesTo.set(nil, 2)
            local moves = NudgeOffset()
            appliesTo.set(nil, before)
            return moves
        end,
        Recorded = "the holder",
        Target = "the holder"},
    {Name = "placeholders",
        Observe = function()
            if not System().SubSystem then
                return nil, "event reminders were off at login"
            end
            ClearPopUps()
            local saved, maxAlerts = SaveDetails(), SetMaxAlerts(2)
            Node(location .. "ShowPlaceholder").func()
            local shown, queued = Count()
            ClearPopUps()
            RestoreMaxAlerts(maxAlerts)
            RestoreDetails(saved)
            return ("shown %d, queued %d"):format(shown, queued)
        end,
        Recorded = "shown 2, queued 0",
        Target = "shown 2, queued 0",
        RecordedClassic = "shown 2, queued 0",
        TargetClassic = "shown 2, queued 0"},
    {Name = "placeholder-details",
        Observe = function()
            if not System().SubSystem then
                return nil, "event reminders were off at login"
            end
            ClearPopUps()
            local saved = SaveDetails()
            Node(location .. "ShowPlaceholder").func()
            local changed = 0
            for id, event in next, CalendarEvents() do
                if (event.EventDetails or false) ~= saved[id] then
                    changed = changed + 1
                end
            end
            ClearPopUps()
            RestoreDetails(saved)
            return changed > 0 and "changed" or "unchanged"
        end,
        Recorded = "unchanged",
        Target = "unchanged"},
    {Name = "hide",
        Observe = function()
            if not System().SubSystem then
                return nil, "event reminders were off at login"
            end
            local hide = Node(location .. "HidePlaceholder")
            if not hide then
                return "no Hide"
            end
            ClearPopUps()
            local saved, maxAlerts = SaveDetails(), SetMaxAlerts(2)
            Node(location .. "ShowPlaceholder").func()
            System():AddAlert(RealEvent(), 60)
            hide.func()
            local shown, queued = Count()
            ClearPopUps()
            RestoreMaxAlerts(maxAlerts)
            RestoreDetails(saved)
            return ("%d showing, %d waiting"):format(shown, queued)
        end,
        Recorded = "0 showing, 0 waiting",
        Target = "0 showing, 0 waiting"},
    {Name = "every-alert-grow-down",
        Observe = function(env)
            if not env.ShowGameToast then
                return nil, "headless only: shows one of the game's toasts"
            end
            SetOption(location .. "GrowDirection", 2)
            local toast = env.ShowGameToast()
            local point, relativeTo, relativePoint = toast:GetPoint(1)
            local where = relativeTo ~= AlertFrame and "elsewhere"
                or point == "TOP" and relativePoint == "BOTTOM" and "below the alert frame"
                or point == "BOTTOM" and relativePoint == "TOP" and "above the alert frame"
                or "elsewhere"
            env.HideGameToasts()
            SetOption(location .. "GrowDirection", 1)
            return where
        end,
        Recorded = "below the alert frame",
        Target = "below the alert frame"},
    -- Back to growing up while a toast shows, then another toast: the first must not keep the addon's top point beside
    -- the bottom point Blizzard's pass gives it, which would stretch it
    {Name = "every-alert-grow-back",
        Observe = function(env)
            if not env.ShowGameToast then
                return nil, "headless only: shows one of the game's toasts"
            end
            SetOption(location .. "GrowDirection", 2)
            local toast = env.ShowGameToast()
            SetOption(location .. "GrowDirection", 1)
            env.ShowGameToast()
            local point, relativeTo, relativePoint = toast:GetPoint(1)
            local where = relativeTo == AlertFrame and point == "BOTTOM" and relativePoint == "TOP" and "above the alert frame" or "elsewhere"
            local points = toast:GetNumPoints()
            env.HideGameToasts()
            return ("%d point%s, %s"):format(points, points == 1 and "" or "s", where)
        end,
        Recorded = "1 point, above the alert frame",
        Target = "1 point, above the alert frame"},
    {Name = "every-alert-chain",
        Observe = function(env)
            if not env.ShowGameToast then
                return nil, "headless only: shows one of the game's toasts"
            end
            local toast = env.ShowGameToast()
            System():AddAlert(RealEvent(), 60)
            local frame = FirstPopUp()
            local holder = System().Holder
            repeat
                local _, relativeTo = frame:GetPoint(1)
                frame = relativeTo
            until frame ~= holder
            local on = frame == toast and "on the toast" or frame == AlertFrame and "on the alert frame" or "elsewhere"
            ClearPopUps()
            env.HideGameToasts()
            return on
        end,
        Recorded = "on the toast",
        Target = "on the toast"},
    {Name = "game-holds-alerts",
        Observe = function(env)
            if not env.HoldGameAlerts then
                return nil, "headless only: holds the game's alerts back"
            end
            ClearPopUps()
            env.HoldGameAlerts(true)
            System():AddAlert(RealEvent(), 60)
            local shownHeld, queuedHeld = Count()
            env.HoldGameAlerts(false)
            local shownAfter = Count()
            ClearPopUps()
            return (shownHeld == 0 and queuedHeld == 1 and "waits" or "shows") .. (shownAfter == 1 and ", then shows" or ", then stays queued")
        end,
        Recorded = "waits, then shows",
        Target = "waits, then shows"},
    {Name = "profile-switch",
        Observe = function(env)
            if not env.Reload then
                return nil, "headless only: switches the profile"
            end
            local db = addon.Options.db
            local current = db:GetCurrentProfile()
            local test = "KrowiAF_Tests_PopUps"
            db:SetProfile(test)
            db.profile.EventReminders.PopUps.OffsetY = 400 -- this profile's own position, as a player's saved one
            db:SetProfile(current)
            local before = Anchor(AlertFrame) .. Anchor(System().Holder)
            db:SetProfile(test)
            local after = Anchor(AlertFrame) .. Anchor(System().Holder)
            db:SetProfile(current)
            db:DeleteProfile(test, true)
            return after ~= before and "moves" or "stays"
        end,
        Recorded = "moves",
        Target = "moves"},
    -- A load with another addon placing the game's alerts at load and after every alert, as Dominos Roll's Alerts bar does
    -- (Dominos_Roll/alertsBar.lua): an offset change, then a pop-up
    {Name = "other-addon",
        Observe = function(env)
            if not env.Reload then
                return nil, "headless only: loads the addon again with another addon"
            end
            env.Reload(function(_, model)
                local function Pin()
                    AlertFrame:ClearAllPoints()
                    AlertFrame:SetPoint("TOP", UIParent, "TOP", 0, -100)
                end
                model.OtherAddon[Pin] = true
                Pin()
                hooksecurefunc(AlertFrame, "UpdateAnchors", Pin)
            end)
            local otherSpot = "TOP UIParent TOP 0 -100 #1"
            local offsetY = GetOption(location .. "OffsetY")
            local before = Anchor(AlertFrame)
            SetOption(location .. "OffsetY", offsetY + 50)
            local moved = Anchor(AlertFrame) ~= before and "alert frame moved" or "nothing moved"
            local disabled = Node(location .. "OffsetY").disabled
            if type(disabled) == "function" then
                disabled = disabled()
            end
            local greyed = disabled and "options greyed" or "options open"
            System():AddAlert(RealEvent(), 60)
            local root = AnchorRoot(FirstPopUp())
            local with = root == AlertFrame and Anchor(AlertFrame) == otherSpot and "pop-up with the other addon" or "pop-up elsewhere"
            ClearPopUps()
            SetOption(location .. "OffsetY", offsetY)
            env.Reload()
            return moved .. ", " .. greyed .. ", " .. with
        end,
        Recorded = "nothing moved, options greyed, pop-up with the other addon",
        Target = "nothing moved, options greyed, pop-up with the other addon"},
    {Name = "reminders-off",
        Observe = function(env)
            if not env.Reload then
                return nil, "headless only: loads the addon again with event reminders off"
            end
            local reminders = addon.Options.db.profile.EventReminders
            reminders.Enabled = false
            env.Reload()
            local owners = ToastOwners()
            reminders.Enabled = true
            env.Reload()
            return owners
        end,
        Recorded = "Blizzard's",
        Target = "Blizzard's"},
}

-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line
local function RunScenario(env, scenario)
    local ok, got, why = pcall(scenario.Observe, env)
    local isRetail = addon.Util.IsMainline
    local recorded = (not isRetail and scenario.RecordedClassic) or scenario.Recorded
    local target = (not isRetail and scenario.TargetClassic) or scenario.Target
    if not ok then
        return {Name = scenario.Name, Status = "FAIL", TargetMet = false, Line = ("popups/%s: FAIL error=[%s]"):format(scenario.Name, tostring(got))}
    end
    if got == nil then
        return {Name = scenario.Name, Status = "SKIP", Line = ("popups/%s: SKIP %s"):format(scenario.Name, tostring(why))}
    end
    local status = got == recorded and "PASS" or "FAIL"
    local targetMet = got == target
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("popups/%s: %s got=[%s] target=[%s] %s"):format(scenario.Name, status, got, target, targetMet and "met" or "open")
    }
end

-- env: the headless runner's model, or the game's ({InGame = true}); observations: where the alert frame is, and
-- whether the addon follows another addon that places it
function popUps.Run(env, observations)
    if observations then
        tinsert(observations, "alert frame anchor at the start: " .. Anchor(AlertFrame))
    end
    local results = {}
    for _, scenario in ipairs(popUps.Scenarios) do
        tinsert(results, RunScenario(env, scenario))
    end
    if observations then
        local system = System()
        tinsert(observations, "follows another addon: " .. (system.IsFollowing and (system:IsFollowing() and "yes" or "no") or "no such check"))
    end
    return results
end

-- [[ Game only: the pop-ups on screen ]] --

-- After the scenarios the run shows the placeholders and hides them, the /kevutest way (Krowi_ExtendedVendorUI): each
-- step names itself in a banner, does what the option's button does, checks the pop-ups and takes a screenshot, which
-- Read-GameTests.ps1 pairs with its file. The end hides what is left and reports the addon's Lua errors of the session.

local settle = 1 -- a step -> its check and screenshot
local afterShot = 1 -- a screenshot -> the next step
local live -- the run in progress
local runToken = 0 -- bumped by every stop, so a stopped run's timers do nothing
local banner

local function Add(status, text)
    tinsert(live.Results, {
        Name = "live-" .. live.StepName,
        Status = status,
        GameOnly = true,
        Line = ("popups/live-%s: %s %s"):format(live.StepName, status, text)
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

local steps = {
    {Name = "placeholders", Text = "Show placeholders",
        Run = function()
            ClearPopUps()
            Node(location .. "ShowPlaceholder").func()
        end,
        Check = function()
            local shown, queued = Count()
            Add(shown > 0 and "PASS" or "FAIL", ("%d placeholders showing, %d waiting"):format(shown, queued))
        end},
    {Name = "hidden", Text = "Hide placeholders",
        Run = function()
            local hide = Node(location .. "HidePlaceholder")
            if not hide then
                return "no Hide placeholders button yet"
            end
            hide.func()
        end,
        Check = function()
            local shown, queued = Count()
            Add(shown + queued == 0 and "PASS" or "FAIL", ("%d showing, %d waiting"):format(shown, queued))
        end},
}

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

local function Finish()
    runToken = runToken + 1
    banner:Hide()
    banner:UnregisterAllEvents()
    pcall(ClearPopUps)
    RestoreDetails(live.SavedDetails)
    live.StepName = "lua-errors"
    local checked, err = pcall(CheckErrors)
    if not checked then
        Add("FAIL", "test error: " .. tostring(err))
    end
    local finish, results, observations = live.Finish, live.Results, live.Observations
    live = nil
    finish(results, observations)
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
        Finish()
        return
    end
    live.StepIndex, live.StepName = n, step.Name
    banner.Text:SetText(("Krowi's Achievement Filter test %d/%d: %s"):format(n, #steps, step.Text))
    banner:Show()
    local ok, skip = pcall(step.Run)
    if not ok then
        Add("FAIL", "test error: " .. tostring(skip))
        RunStep(n + 1)
        return
    end
    if skip then
        Add("SKIP", skip)
        RunStep(n + 1)
        return
    end
    After(settle, Capture)
end

local function CreateBanner()
    banner = CreateFrame("Frame", nil, UIParent)
    banner:SetFrameStrata("DIALOG")
    banner:SetSize(620, 26)
    banner:SetPoint("TOP", 0, -120)
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
            tinsert(live.Observations, "stopped: combat started")
            Finish()
        end
    end)
    banner:Hide()
end

addon.Tests.Ready.popups = function()
    if live then
        return false, "the previous popups run is still going"
    end
    if not addon.Data.IsLoaded then -- the placeholders are built from the event data
        return false, "the achievement data is not loaded yet"
    end
    if not System().SubSystem then
        return false, "event reminders were off at login; turn them on and /reload"
    end
    return true
end

addon.Tests.Async.popups = true
addon.Tests.Suites.popups = function(done)
    local observations = {}
    live = {
        Results = popUps.Run({InGame = true}, observations),
        Observations = observations,
        Finish = done,
        SavedDetails = SaveDetails()
    }
    if not banner then
        CreateBanner()
    end
    banner:RegisterEvent("SCREENSHOT_FAILED")
    banner:RegisterEvent("PLAYER_REGEN_DISABLED")
    print(("|cFF88CCFFKrowiAF Tests:|r popups: %d steps, about %d s; it hides the event reminders showing now"):format(#steps, #steps * (settle + afterShot)))
    RunStep(1)
end