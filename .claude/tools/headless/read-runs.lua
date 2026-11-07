---@diagnostic disable: lowercase-global, undefined-global
-- Prints the latest in-game run (/kaftest) of every suite stored in the addon's saved variables file
-- (KrowiAF_DebugTable.Tests.Runs, and LastRun for files written before Runs existed), one line per suite:
--   <suite>|<build>|<passed>|<failed>|<skipped>|<time>
-- Used by .claude/release-gate.ps1, which the kit's release preflight runs, to require a green run on the newest client.
--
-- Usage: lua.exe read-runs.lua <path to Krowi_AchievementFilter.lua> [<saved table, default KrowiAF_DebugTable>]
-- The second argument reads another addon's file the same way: KrowiOptionsTests_Debug for Krowi_Options' test addon
-- (/kotest keeps its runs under .Tests.Runs too; its full run is the suite "all").
-- Exit code 0, or 2 when the file cannot be loaded.

local path, tableName = ...
tableName = tableName or "KrowiAF_DebugTable"
local chunk, err = loadfile(path)
if not chunk then
    io.stderr:write("cannot load ", tostring(path), ": ", tostring(err), "\n")
    os.exit(2)
end
chunk()
local saved = _G[tableName]
local tests = type(saved) == "table" and type(saved.Tests) == "table" and saved.Tests or {}
local runs = {}
for suite, run in pairs(type(tests.Runs) == "table" and tests.Runs or {}) do
    runs[suite] = run
end
-- A run of some steps only (/kaftest options open) carries its Argument and is never a full run
local last = tests.LastRun
if type(last) == "table" and last.Suite and not last.Argument and not runs[last.Suite] then
    runs[last.Suite] = last
end
local suites = {}
for suite in pairs(runs) do suites[#suites + 1] = suite end
table.sort(suites)
for _, suite in ipairs(suites) do
    local run = runs[suite]
    io.stdout:write(("%s|%s|%d|%d|%d|%s\n"):format(suite, tostring(run.Build), run.Passed or 0, run.Failed or 0, run.Skipped or 0, tostring(run.Time)))
end