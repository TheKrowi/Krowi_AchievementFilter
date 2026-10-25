-- Prints the help pictures that /kaftest pictures recorded (Tests/Pictures.lua), for .claude/tools/Make-HelpPictures.ps1:
-- the saved variables file is plain Lua, so it runs in an empty environment and KrowiAF_DebugTable.Pictures is read
-- from it. Newest run first, one tab-separated line per run and per shot:
--   RUN   <n> <time> <client> <build> <screen width> <screen height>
--   SHOT  <n> <picture> <time> <left> <top> <right> <bottom> <width> <height>
-- Pixels are from the screen's top left; width and height are the natural size in UI units.
-- Usage: lua.exe read-pictures.lua <SavedVariables\Krowi_AchievementFilter.lua>

local path = ...
assert(path, "usage: read-pictures.lua <saved variables file>")
local chunk = assert(loadfile(path))
local env = {}
setfenv(chunk, env)
chunk()

local runs = env.KrowiAF_DebugTable and env.KrowiAF_DebugTable.Pictures or {}
for n = #runs, 1, -1 do
    local run = runs[n]
    local screen = run.Screen or {}
    io.write(table.concat({"RUN", n, run.Time or "", run.Client or "", run.Build or "", screen.Width or 0, screen.Height or 0}, "\t"), "\n")
    for _, shot in ipairs(run.Shots or {}) do
        io.write(table.concat({"SHOT", n, shot.Name, shot.Time, shot.Left, shot.Top, shot.Right, shot.Bottom, shot.Width, shot.Height}, "\t"), "\n")
    end
end