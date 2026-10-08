---@diagnostic disable: lowercase-global, undefined-global
-- Prints the latest in-game run (/kaftest) of every suite stored in the addon's saved variables file
-- (KrowiAF_DebugTable.Tests.Runs, and LastRun for files written before Runs existed), one line per suite:
--   <suite>|<build>|<passed>|<failed>|<skipped>|<time>
-- Used by .claude/skills/release/Check-ReleaseReady.ps1 to require a green run on the newest client.
--
-- Usage: lua.exe read-runs.lua <path to Krowi_AchievementFilter.lua>
-- Exit code 0, or 2 when the file cannot be loaded.

local path = ...
local chunk, err = loadfile(path)
if not chunk then
    io.stderr:write("cannot load ", tostring(path), ": ", tostring(err), "\n")
    os.exit(2)
end
chunk()
local tests = KrowiAF_DebugTable and KrowiAF_DebugTable.Tests or {}
local runs = {}
for suite, run in pairs(type(tests.Runs) == "table" and tests.Runs or {}) do
    runs[suite] = run
end
local last = tests.LastRun
if type(last) == "table" and last.Suite and not runs[last.Suite] then
    runs[last.Suite] = last
end
local suites = {}
for suite in pairs(runs) do suites[#suites + 1] = suite end
table.sort(suites)
for _, suite in ipairs(suites) do
    local run = runs[suite]
    io.stdout:write(("%s|%s|%d|%d|%d|%s\n"):format(suite, tostring(run.Build), run.Passed or 0, run.Failed or 0, run.Skipped or 0, tostring(run.Time)))
end