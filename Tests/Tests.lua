local _, addon = ...
addon.Tests = {
    Suites = {},
    Ready = {}, -- optional per suite: function() -> ok[, reason]; a login run waits for it, a manual run reports the reason
    Async = {} -- optional per suite: true when the suite takes done(results, observations) and reports later (a measured wait)
}
local tests = addon.Tests

-- In-game test runner for behaviour the offline tooling can only model. Each suite file registers
-- itself in tests.Suites and shares its scenarios with .claude/tools/headless/run-tests.lua, so the
-- same lines come out of the game and out of the headless model and can be diffed.
--   /kaftest <suite>        runs a suite now
--   /kaftest login <suite>  runs it after every login or reload until /kaftest login off, so an
--                           iteration is Deploy.ps1, /reload, Read-GameTests.ps1 with nothing typed
-- Results go to chat and to KrowiAF_DebugTable.Tests.LastRun, which the game writes to disk on the
-- next /reload or logout; .claude/tools/Read-GameTests.ps1 prints them and diffs them against the
-- headless run. Needs debug mode (Options > General > Debug) and refuses to run in combat.
-- A result with GameOnly set is a step only the game runs (the /kevutest way of Krowi_ExtendedVendorUI):
-- the reader shows it without diffing it. One with Screenshot = {Time = "YYYY-MM-DD HH:MM:SS", Failed = true|nil}
-- names the screenshot its step took, which the reader pairs with the file. The last runs of every suite are kept
-- in History, oldest first, so several runs in a row can be read after one /reload (Read-GameTests.ps1 -Run).

local prefix = "|cFF88CCFFKrowiAF Tests:|r "
local loginDelay = 5 -- seconds after PLAYER_ENTERING_WORLD before the first attempt
local loginWait = 120 -- seconds a login run keeps waiting for a suite's Ready check (the data load can take a while on a cold cache)
local retryDelay = 2
local keepRuns = 10 -- runs kept in History

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

local function Report(name, results, observations)
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
        Observations = observations and CopyTable(observations) or nil
    }
    -- the latest run of every suite, for the release preflight (.claude/release-gate.ps1)
    GetDb().Runs = GetDb().Runs or {}
    GetDb().Runs[name] = GetDb().LastRun
    GetDb().History = GetDb().History or {}
    tinsert(GetDb().History, GetDb().LastRun)
    while #GetDb().History > keepRuns do
        tremove(GetDb().History, 1)
    end
end

-- waitSeconds: how long to keep retrying the suite's Ready check (login runs); nil runs once
-- onDone(ran, reason): called once the suite reported, or could not run and why
-- requested: a run the maintainer asked for from outside the game (RunRequest below), which needs no debug mode
function tests.Run(name, waitSeconds, onDone, requested)
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
                    tests.Run(name, waitSeconds - retryDelay, onDone, requested)
                end)
            else
                NotRun("cannot run '" .. name .. "': " .. tostring(reason))
            end
            return
        end
    end

    if tests.Async[name] then
        suite(function(results, observations)
            Report(name, results, observations)
            if onDone then
                onDone(true)
            end
        end)
        return
    end
    Report(name, suite())
    if onDone then
        onDone(true)
    end
end

-- [[ Runs the maintainer asks for from outside the game ]] --

-- .claude/tools/Request-GameTests.ps1 writes KrowiAF_DebugTable.TestRequest = {Suites = {...}, NotAfter = <unix time>}
-- into the saved variables while the client is closed, then starts the client; the maintainer only enters the world.
-- The login that reads the request clears it before anything runs, so the next save drops it and it never runs again
-- while the player plays; one past NotAfter (a crash kept it on disk) is dropped unrun. The saved variables reach disk
-- only at the next /reload or logout, so when the suites are done a panel shows each one's counts and its failed and skipped lines and
-- a screenshot is taken, which Read-GameScreenshot.ps1 finds while the game still runs.

local summaryPanel

local function ShowSummary(lines)
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
        print(prefix .. "requested run done; the full results reach the saved variables at the next /reload or logout")
    end)
    C_Timer.After(20, function()
        summaryPanel:Hide()
    end)
end

local function RunRequest(suites)
    local lines = {("Krowi's Achievement Filter test request, %s, build %s"):format(date("%Y-%m-%d %H:%M:%S"), (GetBuildInfo()))}
    local index, ranAny = 0, false
    local function Next()
        index = index + 1
        local name = suites[index]
        if not name then
            if ranAny then -- the suites drive Blizzard's frames and API from addon code, some of it taints until a reload
                tinsert(lines, "/reload before entering combat")
            end
            ShowSummary(lines)
            return
        end
        tests.Run(name, loginWait, function(ran, reason)
            local run = GetDb().LastRun
            ranAny = ranAny or ran
            if ran and run and run.Suite == name then
                tinsert(lines, ("%s: %d passed, %d failed, %d skipped; %d open"):format(name, run.Passed, run.Failed, run.Skipped, run.Open))
                for _, line in ipairs(run.Lines) do
                    if line:find(": FAIL ", 1, true) or line:find(": SKIP ", 1, true) then
                        tinsert(lines, "    " .. line:sub(1, 180))
                    end
                end
            else
                tinsert(lines, ("%s: did not run, %s"):format(tostring(name), tostring(reason)))
            end
            Next()
        end, true)
    end
    Next()
end

SLASH_KAFTEST1 = "/kaftest"
SlashCmdList.KAFTEST = function(msg)
    local command, argument = strsplit(" ", strtrim(msg or ""))
    if command == "login" then
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
        tests.Run(command)
    else
        print(prefix .. "/kaftest <suite> | /kaftest login <suite|off>; suites: " .. tests.List())
    end
end

addon.Event:RegisterEvent("PLAYER_ENTERING_WORLD", function(_, isLogin, isReload)
    if not (isLogin or isReload) then
        return
    end
    local request = KrowiAF_DebugTable and KrowiAF_DebugTable.TestRequest
    if request ~= nil then
        KrowiAF_DebugTable.TestRequest = nil
        if type(request) == "table" and type(request.Suites) == "table" and (tonumber(request.NotAfter) or 0) >= time() then
            print(prefix .. "running the requested suites in " .. loginDelay .. " s: " .. table.concat(request.Suites, ", "))
            C_Timer.After(loginDelay, function()
                RunRequest(request.Suites)
            end)
            return
        end
        print(prefix .. "dropped a test request that had expired")
    end
    local name = KrowiAF_DebugTable and KrowiAF_DebugTable.Tests and KrowiAF_DebugTable.Tests.RunOnLogin
    if not name then
        return
    end
    C_Timer.After(loginDelay, function()
        tests.Run(name, loginWait)
    end)
end)