local _, addon = ...
addon.Tests = {
    Suites = {},
    Ready = {} -- optional per suite: function() -> ok[, reason]; a login run waits for it, a manual run reports the reason
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

local prefix = "|cFF88CCFFKrowiAF Tests:|r "
local loginDelay = 5 -- seconds after PLAYER_ENTERING_WORLD before the first attempt
local loginWait = 120 -- seconds a login run keeps waiting for a suite's Ready check (the data load can take a while on a cold cache)
local retryDelay = 2

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

-- waitSeconds: how long to keep retrying the suite's Ready check (login runs); nil runs once
function tests.Run(name, waitSeconds)
    local suite = tests.Suites[name]
    if not suite then
        print(prefix .. "unknown suite '" .. tostring(name) .. "'; available: " .. tests.List())
        return
    end
    if InCombatLockdown() then
        print(prefix .. "not while in combat")
        return
    end
    if not addon.Diagnostics.DebugEnabled() then
        print(prefix .. "enable debug mode first (Options > General > Debug)")
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
                    tests.Run(name, waitSeconds - retryDelay)
                end)
            else
                print(prefix .. "cannot run '" .. name .. "': " .. tostring(reason))
            end
            return
        end
    end

    local results, observations = suite()
    local counts = {PASS = 0, FAIL = 0, SKIP = 0}
    local open = 0
    local lines, notes = {}, {}
    for i, result in ipairs(results) do
        counts[result.Status] = counts[result.Status] + 1
        if result.TargetMet == false then
            open = open + 1
        end
        lines[i] = result.Line
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
        Observations = observations and CopyTable(observations) or nil
    }
    -- the latest run of every suite, for the release preflight (.claude/skills/release/Check-ReleaseReady.ps1)
    GetDb().Runs = GetDb().Runs or {}
    GetDb().Runs[name] = GetDb().LastRun
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
    local name = KrowiAF_DebugTable and KrowiAF_DebugTable.Tests and KrowiAF_DebugTable.Tests.RunOnLogin
    if not name then
        return
    end
    C_Timer.After(loginDelay, function()
        tests.Run(name, loginWait)
    end)
end)