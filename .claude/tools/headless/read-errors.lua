---@diagnostic disable: lowercase-global, undefined-global, need-check-nil
-- Reads BugGrabber's saved variables file (WTF\Account\<account>\SavedVariables\!BugGrabber.lua),
-- which is plain Lua assigning BugGrabberDB, and prints the errors that mention this addon.
--
-- Usage: lua.exe read-errors.lua <path to !BugGrabber.lua> <since unix time> <filter | all> [max] [-]
--   since   only errors at or after this time (0 for all)
--   filter  substring the message or stack must contain; "all" disables the filter
--   -       read the addon's own file paths from stdin, one per line: an error also matches when it names a
--           shortened path ("...r/Gui/RightClickMenu/AchievementMenu/FirstCategory.lua:3") that ends one of them, because
--           the game cuts long paths from the front and the addon's folder name is the first thing to go
-- Exit code 0 always; the caller decides what to do with the count.

local path, since, filter, maxShown, ownFiles = ...
since = tonumber(since) or 0
maxShown = tonumber(maxShown) or 20
if filter == "all" then filter = nil end

-- Each own file as the game names it, under the addon's folder (the filter), because the cut can fall inside the folder
-- name itself ("...r/Gui/...")
local paths = {}
if ownFiles == "-" then
    for line in io.stdin:lines() do
        line = line:gsub("\r$", ""):gsub("\\", "/")
        if line ~= "" then paths[#paths + 1] = (filter or "") .. "/" .. line end
    end
end

-- A shortened path of one of the addon's own files; the tail must keep a folder so a bare file name cannot match
local function NamesOwnFile(text)
    for tail in text:gmatch("%.%.%.([^%s:%[%]\"']+%.[lx][um][al])") do
        if tail:find("/", 1, true) then
            for _, own in ipairs(paths) do
                if #own >= #tail and own:sub(-#tail) == tail then return true end
            end
        end
    end
    return false
end

local chunk, err = loadfile(path)
if not chunk then
    io.stderr:write("cannot load ", tostring(path), ": ", tostring(err), "\n")
    os.exit(2)
end
chunk()
local db = BugGrabberDB
if type(db) ~= "table" or type(db.errors) ~= "table" then
    io.stdout:write("no BugGrabberDB.errors table in ", path, "\n")
    os.exit(0)
end

-- Retail BugGrabber stores a unix time; the Classic build a "YYYY/MM/DD HH:MM:SS" string
local function Time(e)
    if type(e.time) == "number" then return e.time end
    if type(e.time) == "string" then
        local y, mo, d, h, mi, s = e.time:match("(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)")
        if y then return os.time({ year = tonumber(y), month = tonumber(mo), day = tonumber(d), hour = tonumber(h), min = tonumber(mi), sec = tonumber(s) }) end
    end
    return 0
end

local matches = {}
for _, e in ipairs(db.errors) do
    local text = (e.message or "") .. "\n" .. (e.stack or "")
    if Time(e) >= since and (not filter or text:find(filter, 1, true) or NamesOwnFile(text)) then
        matches[#matches + 1] = e
    end
end
table.sort(matches, function(a, b) return Time(a) > Time(b) end)

io.stdout:write(string.format("%d of %d errors match (%s, since %s); most recent first\n\n", #matches, #db.errors,
    filter and ("containing '" .. filter .. "'") or "unfiltered", since > 0 and os.date("%Y-%m-%d %H:%M", since) or "the beginning"))

for i = 1, math.min(#matches, maxShown) do
    local e = matches[i]
    io.stdout:write(string.format("[%d] %s  x%d  session %s\n", i, os.date("%Y-%m-%d %H:%M:%S", Time(e)), e.counter or 1, tostring(e.session)))
    io.stdout:write("    ", (e.message or ""):gsub("\n", "\n    "), "\n")
    if e.stack and e.stack ~= "" then
        local shown = 0
        for line in e.stack:gmatch("[^\n]+") do
            shown = shown + 1
            if shown > 12 then io.stdout:write("      ...\n") break end
            io.stdout:write("      ", line, "\n")
        end
    end
    if e.locals and e.locals ~= "" then
        local first = e.locals:match("^[^\n]*")
        io.stdout:write("    locals: ", first, (e.locals:find("\n") and " ..." or ""), "\n")
    end
    io.stdout:write("\n")
end
if #matches > maxShown then io.stdout:write(string.format("(%d more not shown)\n", #matches - maxShown)) end