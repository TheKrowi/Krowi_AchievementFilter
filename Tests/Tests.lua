local _, addon = ...
addon.Tests = {
    Suites = {},
    Ready = {}, -- optional per suite: function() -> ok[, reason]; a login run waits for it, a manual run reports the reason
    Async = {}, -- optional per suite: true when the suite takes done(results, observations) and reports later (a measured wait)
    FirstDraw = {} -- optional per suite: true when the suite needs the achievement window's first draw of the session; /kaftest run runs it first
}
local tests = addon.Tests

-- In-game test runner for behaviour the offline tooling can only model. Each suite file registers
-- itself in tests.Suites and shares its scenarios with .claude/tools/headless/run-tests.lua, so the
-- same lines come out of the game and out of the headless model and can be diffed.
--   /kaftest <suite>        runs a suite now
--   /kaftest run <entry>[, <entry> ...]
--                           runs several in order (an entry is a suite, or a suite and what to run of it),
--                           then shows a summary; .claude/tools/Run-GameTests.ps1 types it (see RunEntries below)
--   /kaftest login <suite>  runs it after every login or reload until /kaftest login off, so an
--                           iteration is Deploy.ps1, /reload, Read-GameTests.ps1 with nothing typed
-- Results go to chat and to KrowiAF_DebugTable.Tests.LastRun, which the game writes to disk on the
-- next /reload or logout; .claude/tools/Read-GameTests.ps1 prints them and diffs them against the
-- headless run. Needs debug mode (Options > General > Debug) and refuses to run in combat.
-- A result with GameOnly set is a step only the game runs (the /kevutest way of Krowi_ExtendedVendorUI):
-- the reader shows it without diffing it. One with Screenshot = {Time = "YYYY-MM-DD HH:MM:SS", Failed = true|nil}
-- names the screenshot its step took, which the reader pairs with the file. The last 10 runs are kept in History, oldest
-- first, so several runs in a row can be read after one /reload (Read-GameTests.ps1 -Run); a /kaftest run keeps every run
-- it made, however many entries it has, and the next run outside one trims History back to 10.

local prefix = "|cFF88CCFFKrowiAF Tests:|r "
local loginDelay = 5 -- seconds after PLAYER_ENTERING_WORLD before the first attempt
local loginWait = 120 -- seconds a login run keeps waiting for a suite's Ready check (the data load can take a while on a cold cache)
local retryDelay = 2
local keepRuns = 10 -- runs kept in History outside a /kaftest run
local keep = keepRuns -- what Report trims History to: keepRuns, or keepRuns plus the entries while a /kaftest run runs (RunEntries)
local matrixStep -- the step of /kaftest matrix whose suites run now (below), or nil

local function GetDb()
    KrowiAF_DebugTable = KrowiAF_DebugTable or {}
    KrowiAF_DebugTable.Tests = KrowiAF_DebugTable.Tests or {}
    return KrowiAF_DebugTable.Tests
end

function tests.List()
    local names = {}
    for name in next, tests.Suites do
        tinsert(names, name)
    end
    sort(names)
    return table.concat(names, ", ")
end

local statusColors = {
    PASS = "|cFF00FF00",
    FAIL = "|cFFFF0000",
    SKIP = "|cFFFFFF00"
}

-- argument: what was typed after the suite's name; a run of some steps only (/kaftest options open) is kept in LastRun
-- and History but not in Runs, so the release preflight never takes it for a full run
local function Report(name, results, observations, argument)
    local counts = {PASS = 0, FAIL = 0, SKIP = 0}
    local open = 0
    local lines, notes, gameOnly, screenshots = {}, {}, {}, {}
    for i, result in ipairs(results) do
        counts[result.Status] = counts[result.Status] + 1
        if result.TargetMet == false then
            open = open + 1
        end
        lines[i] = result.Line
        gameOnly[i] = result.GameOnly
        screenshots[i] = result.Screenshot
        print(prefix .. (statusColors[result.Status] or "") .. result.Line .. "|r")
        if result.Notes then
            notes[i] = result.Notes
            print(prefix .. "    outside state: " .. result.Notes)
        end
    end
    local summary = ("%s: %d passed, %d failed, %d skipped; %d open against the target behaviour"):format(name, counts.PASS, counts.FAIL, counts.SKIP, open)
    print(prefix .. summary)
    for _, observation in ipairs(observations or {}) do
        print(prefix .. "observed: " .. observation)
    end
    print(prefix .. "written to the saved variables on the next /reload; read with .claude/tools/Read-GameTests.ps1")

    GetDb().LastRun = {
        Suite = name,
        Argument = argument,
        Version = addon.Metadata.Version,
        Build = (GetBuildInfo()),
        Time = date("%Y-%m-%d %H:%M:%S"),
        Passed = counts.PASS,
        Failed = counts.FAIL,
        Skipped = counts.SKIP,
        Open = open,
        Lines = lines,
        Notes = notes, -- index = line index; only lines where Blizzard state outside the scenario could have consumed a press
        GameOnly = gameOnly, -- index = line index; steps the headless runner does not model
        Screenshots = screenshots, -- index = line index; the screenshot taken after that line's check
        Observations = observations and CopyTable(observations) or nil,
        MatrixStep = matrixStep -- the /kaftest matrix step it ran in: the features' switches were set for that step
    }
    -- the latest full run of every suite, for the release preflight (.claude/release-gate.ps1); a matrix step's runs ran
    -- with features switched off, so they never stand for one
    GetDb().Runs = GetDb().Runs or {}
    if not argument and not matrixStep then
        GetDb().Runs[name] = GetDb().LastRun
    end
    local plan = matrixStep and GetDb().Matrix and GetDb().Matrix.Pending
    if plan then
        local step = plan.Results[plan.Index]
        step.Runs, step.Passed, step.Failed, step.Skipped = step.Runs + 1, step.Passed + counts.PASS, step.Failed + counts.FAIL, step.Skipped + counts.SKIP
    end
    GetDb().History = GetDb().History or {}
    tinsert(GetDb().History, GetDb().LastRun)
    while #GetDb().History > keep do
        tremove(GetDb().History, 1)
    end
end

-- waitSeconds: how long to keep retrying the suite's Ready check (login runs); nil runs once
-- onDone(ran, reason): called once the suite reported, or could not run and why
-- requested: part of a /kaftest run (RunEntries below), which settled debug mode before its first suite, so a suite
-- that switches debug mode itself (none does today; the library's tests did, in a step that now lives in Krowi_OptionsTests) cannot stop the next one
-- argument: what was typed after the suite's name (/kaftest pictures colors), handed to the suite as its last argument
function tests.Run(name, waitSeconds, onDone, requested, argument)
    local function NotRun(reason)
        print(prefix .. reason)
        if onDone then
            onDone(false, reason)
        end
    end
    local suite = tests.Suites[name]
    if not suite then
        NotRun("unknown suite '" .. tostring(name) .. "'; available: " .. tests.List())
        return
    end
    if InCombatLockdown() then
        NotRun("not while in combat")
        return
    end
    if not requested and not addon.Diagnostics.DebugEnabled() then
        NotRun("enable debug mode first (Options > General > Debug)")
        return
    end
    if tests.Ready[name] then
        local ready, reason = tests.Ready[name]()
        if not ready then
            if waitSeconds and waitSeconds > 0 then
                if waitSeconds == loginWait then
                    print(prefix .. "waiting for '" .. name .. "': " .. tostring(reason))
                end
                C_Timer.After(retryDelay, function()
                    tests.Run(name, waitSeconds - retryDelay, onDone, requested, argument)
                end)
            else
                NotRun("cannot run '" .. name .. "': " .. tostring(reason))
            end
            return
        end
    end

    if tests.Async[name] then
        suite(function(results, observations)
            Report(name, results, observations, argument)
            if onDone then
                onDone(true)
            end
        end, argument)
        return
    end
    local results, observations = suite(argument)
    Report(name, results, observations, argument)
    if onDone then
        onDone(true)
    end
end

-- [[ Several suites in one go: /kaftest run ]] --

-- /kaftest run options, escape runs the entries in order; an entry is a suite, or a suite and what to run of it after
-- a space ("options open"). The saved variables reach disk only at the next /reload or logout, so when the suites
-- are done a panel shows each one's counts and its failed and skipped lines and a screenshot is taken, which
-- Read-GameScreenshot.ps1 finds while the game still runs. Then the kit's marker addon (KrowiGameInput, dev only,
-- Krowi_ClaudeKit's docs/work/2026-11-05-kit-test-runs) is told the run is done, and the kit's Send-GameInput.ps1
-- -WaitForDone, which .claude/tools/Run-GameTests.ps1 runs, types /reload.
-- The entries whose suite needs the achievement window's first draw of the session (tests.FirstDraw: plugins on Retail) run first,
-- since any suite before them could load the window, the others in the order typed. Until the summary, History keeps
-- keepRuns runs more than the run has entries, so every one of its runs stays there for Run-GameTests.ps1 to read, also
-- with more than keepRuns entries or a run from outside it in between (docs/work/2026-11-08-test-run-history).
-- Debug mode: with the marker loaded and debug mode off, the run turns it on for its suites and back off after the
-- summary (Krowi, 2026-11-05); without the marker it asks for debug mode as /kaftest does, so a player who types it
-- starts nothing.

local summaryPanel

local function ShowSummary(lines, onShown)
    if not summaryPanel then
        summaryPanel = CreateFrame("Frame", nil, UIParent)
        summaryPanel:SetFrameStrata("FULLSCREEN_DIALOG")
        summaryPanel:SetPoint("TOP", 0, -120)
        local background = summaryPanel:CreateTexture(nil, "BACKGROUND")
        background:SetAllPoints()
        background:SetColorTexture(0, 0, 0, 0.9)
        summaryPanel.Text = summaryPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
        summaryPanel.Text:SetPoint("TOPLEFT", 16, -16)
        summaryPanel.Text:SetWidth(1200)
        summaryPanel.Text:SetJustifyH("LEFT")
    end
    summaryPanel.Text:SetText(table.concat(lines, "\n"))
    summaryPanel:SetSize(1232, summaryPanel.Text:GetStringHeight() + 32)
    summaryPanel:Show()
    C_Timer.After(1, function()
        GetDb().RequestSummary = {Time = date("%Y-%m-%d %H:%M:%S"), Lines = lines}
        Screenshot()
        print(prefix .. "run done; the full results reach the saved variables at the next /reload or logout")
        if onShown then
            onShown()
        end
        if KrowiGameInput then
            KrowiGameInput.Done()
        end
    end)
    C_Timer.After(20, function()
        summaryPanel:Hide()
    end)
end

-- debugSwitched: the run turned debug mode on, so it turns it off again once the summary is up
-- onFinished(lines): instead of the summary (a /kaftest matrix step), which then keeps History's room for the whole plan
local function RunEntries(entries, debugSwitched, onFinished)
    -- Every run of this one stays in History until its summary, also when a run from outside it reports in between (a
    -- /kaftest login run 5 s after the reload): room for keepRuns more
    keep = math.max(keep, keepRuns + #entries)
    local lines = {("Krowi's Achievement Filter test run, %s, build %s"):format(date("%Y-%m-%d %H:%M:%S"), (GetBuildInfo()))}
    local index, ranAny = 0, false
    local function Next()
        index = index + 1
        local entry = entries[index]
        if not entry then
            if onFinished then
                onFinished(lines)
                return
            end
            keep = keepRuns -- the next run outside /kaftest run trims History back
            if ranAny then -- the suites drive Blizzard's frames and API from addon code, some of it taints until a reload
                tinsert(lines, "/reload before entering combat")
            end
            ShowSummary(lines, debugSwitched and function()
                addon.Options.db.profile.EnableDebugInfo = false
                GetDb().DebugSwitchedByRun = nil
                print(prefix .. "debug mode is off again, as before the run")
            end)
            return
        end
        local name, argument = strsplit(" ", strtrim(tostring(entry)))
        tests.Run(name, loginWait, function(ran, reason)
            local run = GetDb().LastRun
            ranAny = ranAny or ran
            if ran and run and run.Suite == name then
                tinsert(lines, ("%s: %d passed, %d failed, %d skipped; %d open"):format(entry, run.Passed, run.Failed, run.Skipped, run.Open))
                for _, line in ipairs(run.Lines) do
                    if line:find(": FAIL ", 1, true) or line:find(": SKIP ", 1, true) then
                        tinsert(lines, "    " .. line:sub(1, 180))
                    end
                end
            else
                tinsert(lines, ("%s: did not run, %s"):format(tostring(entry), tostring(reason)))
            end
            Next()
        end, true, argument ~= "" and argument or nil)
    end
    Next()
end

-- The entries of /kaftest run, split on commas: "options toggle, escape" -> {"options toggle", "escape"}
function tests.RunEntriesOf(text)
    local entries = {}
    for entry in (text or ""):gmatch("[^,]+") do
        entry = strtrim(entry)
        if entry ~= "" then
            tinsert(entries, entry)
        end
    end
    return entries
end

-- The entries in the order they run: those whose suite needs the achievement window's first draw (tests.FirstDraw) first,
-- the others in the order typed
local function FirstDrawFirst(entries)
    local ordered, rest = {}, {}
    for _, entry in ipairs(entries) do
        local name = strsplit(" ", entry)
        tinsert(tests.FirstDraw[name] and ordered or rest, entry)
    end
    for _, entry in ipairs(rest) do
        tinsert(ordered, entry)
    end
    return ordered
end

local function StartRun(text)
    local entries = tests.RunEntriesOf(text)
    if #entries == 0 then
        print(prefix .. "/kaftest run <suite>[, <suite> ...]; suites: " .. tests.List())
        return
    end
    entries = FirstDrawFirst(entries)
    local switched = false
    if not addon.Diagnostics.DebugEnabled() then
        if not KrowiGameInput then
            print(prefix .. "enable debug mode first (Options > General > Debug)")
            return
        end
        addon.Options.db.profile.EnableDebugInfo = true -- what the option's own setter does (Options/General.lua)
        -- Noted in the saved variables too: a run that never reaches its summary (a suite that errors in a timer) is
        -- reloaded anyway, and the next login or reload turns debug mode off again (PLAYER_ENTERING_WORLD below)
        GetDb().DebugSwitchedByRun = true
        switched = true
        print(prefix .. "debug mode is on for this run")
    end
    print(prefix .. "running " .. table.concat(entries, ", "))
    -- A "done" left on the kit's marker by an earlier run must not end this one's wait (-WaitForDone)
    if KrowiGameInput then
        KrowiGameInput.Clear()
    end
    RunEntries(entries, switched)
end

-- /kaftest matrix (docs/work/2026-11-08-feature-split-poc): every suite but the probes with every feature on, with every
-- feature off and with each feature alone (with one feature, alone is all on), on the switches of the current profile.
-- A switch takes effect after a reload, and C_UI.Reload is protected outside a key press or click (blocked from a timer
-- on Retail 12.1.5 and Mists 5.5.4, 2026-11-08), so each step ends by asking for a /reload: the kit's marker reports done
-- and Run-GameTests.ps1 -Matrix types it, or a player does. After the last step the switches go back as they were, and
-- the plan's record (Matrix.Last) waits for that last /reload. The plan lives in the saved variables (Matrix.Pending), so
-- it carries over each reload; the runs carry their step (MatrixStep) and stay out of Runs.
tests.Probes = {scheduler = true, sources = true, pictures = true} -- game-only probes, not regression suites

local function MatrixSuites()
    local names = {}
    for name in next, tests.Suites do
        if not tests.Probes[name] then
            tinsert(names, name)
        end
    end
    sort(names)
    return FirstDrawFirst(names)
end

local function MatrixSteps()
    local list = addon.Features.List()
    local steps = {}
    local function Step(name, on)
        local switches = {}
        for _, feature in ipairs(list) do
            switches[feature.Name] = on(feature.Name)
        end
        tinsert(steps, {Name = name, Switches = switches})
    end
    Step("all-on", function() return true end)
    Step("all-off", function() return false end)
    if #list > 1 then
        for _, feature in ipairs(list) do
            Step(feature.Name .. "-alone", function(name) return name == feature.Name end)
        end
    end
    return steps
end

local function ApplySwitches(switches)
    for name, on in next, switches do
        addon.Features.SetSwitch(name, on)
    end
end

-- A step is set: done on the kit's marker after a second, so it stays up long enough to be read before the reload
local function AskForReload(text)
    print(prefix .. text)
    C_Timer.After(1, function()
        if KrowiGameInput then
            KrowiGameInput.Done()
        end
    end)
end

local function StartMatrix()
    local db = GetDb()
    if db.Matrix and db.Matrix.Pending then
        print(prefix .. "a matrix run is waiting for a /reload; /kaftest matrix stop drops it and puts the switches back")
        return
    end
    local switched = false
    if not addon.Diagnostics.DebugEnabled() then
        if not KrowiGameInput then
            print(prefix .. "enable debug mode first (Options > General > Debug)")
            return
        end
        addon.Options.db.profile.EnableDebugInfo = true -- what the option's own setter does (Options/General.lua)
        switched = true
    end
    local restore = {}
    for _, feature in ipairs(addon.Features.List()) do
        restore[feature.Name] = addon.Features.GetSwitch(feature.Name)
    end
    local plan = {Steps = MatrixSteps(), Suites = MatrixSuites(), Index = 1, Restore = restore, DebugSwitched = switched,
        Started = date("%Y-%m-%d %H:%M:%S"), Results = {}, Character = UnitName("player") .. "-" .. GetRealmName()}
    for i, step in ipairs(plan.Steps) do
        plan.Results[i] = {Name = step.Name, Runs = 0, Passed = 0, Failed = 0, Skipped = 0}
    end
    db.Matrix = db.Matrix or {}
    db.Matrix.Pending = plan
    if KrowiGameInput then
        KrowiGameInput.Clear()
    end
    ApplySwitches(plan.Steps[1].Switches)
    AskForReload(("matrix: %d steps of %d suites; step 1 (%s) is set, /reload to run it"):format(#plan.Steps, #plan.Suites, plan.Steps[1].Name))
end

-- Drops a plan: the switches go back as they were, and debug mode off when the plan turned it on
local function DropMatrix(plan, reason)
    ApplySwitches(plan.Restore)
    if plan.DebugSwitched then
        addon.Options.db.profile.EnableDebugInfo = false
    end
    GetDb().Matrix.Pending = nil
    print(prefix .. "matrix run dropped (" .. reason .. "); the switches are back as they were from the next /reload")
end

local function StopMatrix()
    local plan = GetDb().Matrix and GetDb().Matrix.Pending
    if not plan then
        print(prefix .. "no matrix run is waiting")
        return
    end
    DropMatrix(plan, "/kaftest matrix stop")
end

-- After the reload that follows a set step: runs its suites, then sets the next step, or puts the switches back.
-- A step that began and never finished (a /reload or logout during it, a suite that never reported) is not run again on
-- every login: the plan is dropped. A crash writes no saved variables, so after one the step runs once more. So is one in combat or with debug mode off; on another character the plan
-- waits for its own (the switches are that character's profile's).
local function RunMatrixStep()
    local db = GetDb()
    local plan = db.Matrix.Pending
    if not plan then
        return
    end
    if plan.Character ~= UnitName("player") .. "-" .. GetRealmName() then
        print(prefix .. "a matrix run waits for " .. tostring(plan.Character) .. "; /kaftest matrix stop drops it")
        return
    end
    if plan.Running == plan.Index then
        DropMatrix(plan, ("step %d did not finish"):format(plan.Index))
        return
    end
    if InCombatLockdown() or not addon.Diagnostics.DebugEnabled() then
        DropMatrix(plan, InCombatLockdown() and "in combat" or "debug mode is off")
        return
    end
    plan.Running = plan.Index
    local step = plan.Steps[plan.Index]
    matrixStep = step.Name
    print(prefix .. ("matrix step %d of %d (%s)"):format(plan.Index, #plan.Steps, step.Name))
    RunEntries(plan.Suites, false, function()
        matrixStep = nil
        plan.Running = nil
        if plan.Index < #plan.Steps then
            plan.Index = plan.Index + 1
            ApplySwitches(plan.Steps[plan.Index].Switches)
            AskForReload(("matrix: step %d (%s) is set, /reload to run it"):format(plan.Index, plan.Steps[plan.Index].Name))
            return
        end
        ApplySwitches(plan.Restore)
        local last = {Time = date("%Y-%m-%d %H:%M:%S"), Started = plan.Started, Version = addon.Metadata.Version, Build = (GetBuildInfo()),
            Steps = plan.Results, Suites = #plan.Suites, Passed = 0, Failed = 0, Skipped = 0, Complete = true}
        local lines = {("Krowi's Achievement Filter matrix run, %s, build %s"):format(last.Time, last.Build)}
        for _, result in ipairs(plan.Results) do
            last.Passed, last.Failed, last.Skipped = last.Passed + result.Passed, last.Failed + result.Failed, last.Skipped + result.Skipped
            if result.Runs < #plan.Suites then
                last.Complete = false
            end
            tinsert(lines, ("%s: %d of %d suites ran; %d passed, %d failed, %d skipped"):format(result.Name, result.Runs, #plan.Suites, result.Passed, result.Failed, result.Skipped))
        end
        tinsert(lines, "the switches are back as they were from the next /reload")
        db.Matrix.Last = last
        db.Matrix.Pending = nil
        if plan.DebugSwitched then
            addon.Options.db.profile.EnableDebugInfo = false
        end
        ShowSummary(lines)
    end)
end

SLASH_KAFTEST1 = "/kaftest"
SlashCmdList.KAFTEST = function(msg)
    local command, argument = strsplit(" ", strtrim(msg or ""))
    if command == "run" then
        StartRun((strtrim(msg or "")):match("^run%s+(.+)$"))
    elseif command == "matrix" then
        if argument == "stop" then
            StopMatrix()
        else
            StartMatrix()
        end
    elseif command == "login" then
        if not argument or argument == "" or argument == "off" then
            GetDb().RunOnLogin = nil
            print(prefix .. "no suite runs on login")
        elseif tests.Suites[argument] then
            GetDb().RunOnLogin = argument
            print(prefix .. "'" .. argument .. "' runs " .. loginDelay .. " s after every login or reload until /kaftest login off")
        else
            print(prefix .. "unknown suite '" .. argument .. "'; available: " .. tests.List())
        end
    elseif command and command ~= "" then
        tests.Run(command, nil, nil, nil, argument ~= "" and argument or nil)
    else
        print(prefix .. "/kaftest <suite> [what] | /kaftest run <suite>[, <suite> ...] | /kaftest matrix [stop] | /kaftest login <suite|off>; suites: " .. tests.List())
    end
end

addon.Event:RegisterEvent("PLAYER_ENTERING_WORLD", function(_, isLogin, isReload)
    if not (isLogin or isReload) then
        return
    end
    -- A request the retired Request-GameTests.ps1 left in the saved variables is dropped unrun
    if KrowiAF_DebugTable and KrowiAF_DebugTable.TestRequest ~= nil then
        KrowiAF_DebugTable.TestRequest = nil
    end
    -- A /kaftest matrix step is set: it runs now, and History keeps room for the whole plan, as each reload resets keep
    local plan = KrowiAF_DebugTable and KrowiAF_DebugTable.Tests and KrowiAF_DebugTable.Tests.Matrix and KrowiAF_DebugTable.Tests.Matrix.Pending
    if plan then
        keep = keepRuns + #plan.Steps * #plan.Suites
        C_Timer.After(loginDelay, RunMatrixStep)
        return
    end
    -- A /kaftest run that turned debug mode on and never reached its summary
    if KrowiAF_DebugTable and KrowiAF_DebugTable.Tests and KrowiAF_DebugTable.Tests.DebugSwitchedByRun then
        KrowiAF_DebugTable.Tests.DebugSwitchedByRun = nil
        addon.Options.db.profile.EnableDebugInfo = false
        print(prefix .. "debug mode is off again: the last /kaftest run turned it on and did not finish")
    end
    local name = KrowiAF_DebugTable and KrowiAF_DebugTable.Tests and KrowiAF_DebugTable.Tests.RunOnLogin
    if not name then
        return
    end
    C_Timer.After(loginDelay, function()
        tests.Run(name, loginWait)
    end)
end)