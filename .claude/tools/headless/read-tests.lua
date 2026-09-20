---@diagnostic disable: lowercase-global, undefined-global, need-check-nil
-- Reads the addon's saved variables file (WTF\Account\<account>\SavedVariables\Krowi_AchievementFilter.lua),
-- plain Lua assigning KrowiAF_DebugTable and the other saved tables, and prints the last in-game
-- test run (/kaftest) next to the lines the headless runner produced for the same suite.
--
-- Usage: lua.exe read-tests.lua <path to Krowi_AchievementFilter.lua> [<file with the headless lines>]
-- Exit code 0 when the game run has no FAIL and matches the headless lines, 1 otherwise, 2 when unreadable.

local path, headlessPath = ...

local chunk, err = loadfile(path)
if not chunk then
    io.stderr:write("cannot load ", tostring(path), ": ", tostring(err), "\n")
    os.exit(2)
end
chunk()
local run = KrowiAF_DebugTable and KrowiAF_DebugTable.Tests and KrowiAF_DebugTable.Tests.LastRun
if type(run) ~= "table" then
    io.stdout:write("no test run stored in ", path, " (run /kaftest <suite> in game, then /reload)\n")
    os.exit(2)
end
local onLogin = KrowiAF_DebugTable.Tests.RunOnLogin

io.stdout:write(("suite %s, run %s in game, addon %s, build %s: %d passed, %d failed, %d skipped; %d open against the target behaviour%s\n\n"):format(
    tostring(run.Suite), tostring(run.Time), tostring(run.Version), tostring(run.Build), run.Passed or 0, run.Failed or 0, run.Skipped or 0, run.Open or 0,
    onLogin and ("; '" .. tostring(onLogin) .. "' runs on every login") or ""))

local headless
local f = headlessPath and io.open(headlessPath, "rb")
if f then
    headless = {}
    for line in f:read("*a"):gmatch("[^\r\n]+") do
        local scenario, suite = line:match("^(([%w_%-]+)/[%w_%-]+): ") -- "<suite>/<scenario>: ..."; summary and observation lines do not match
        if scenario and suite == tostring(run.Suite) then headless[scenario] = line end -- the headless file holds every suite, the game run one
    end
    f:close()
end

local differences, seen = 0, {}
for i, line in ipairs(run.Lines or {}) do
    local scenario = line:match("^(.-): ")
    seen[scenario] = true
    local mark = "   "
    if headless then
        if headless[scenario] == line then
            mark = " = "
        else
            mark = " ! "
            differences = differences + 1
        end
    end
    io.stdout:write(mark, line, "\n")
    if mark == " ! " and headless[scenario] then io.stdout:write("     headless: ", headless[scenario], "\n") end
    if run.Notes and run.Notes[i] then io.stdout:write("     outside state before the press: ", run.Notes[i], "\n") end
end
for _, observation in ipairs(run.Observations or {}) do
    io.stdout:write("observed in game: ", observation, "\n")
end
if headless then
    for scenario, line in pairs(headless) do
        if not seen[scenario] then
            differences = differences + 1
            io.stdout:write(" ! not run in game: ", line, "\n")
        end
    end
    io.stdout:write(("\n%d difference(s) between the game and the headless run (= same, ! differs)\n"):format(differences))
end
os.exit((differences > 0 or (run.Failed or 0) > 0) and 1 or 0)