-- Syntax-checks Lua files with the same Lua 5.1 parser World of Warcraft uses.
-- Usage: lua.exe check-syntax.lua <file> [<file> ...]
--        <list of paths, one per line> | lua.exe check-syntax.lua -
-- Prints one "<file>:<line>: <message>" per failing file and exits 1 if any file fails.
-- Strips a UTF-8 byte order mark first, because WoW tolerates it and stock Lua 5.1 does not.

local paths = {}
if select("#", ...) == 1 and select(1, ...) == "-" then
    for line in io.stdin:lines() do
        line = line:gsub("\r$", "")
        if line ~= "" then
            paths[#paths + 1] = line
        end
    end
else
    for i = 1, select("#", ...) do
        paths[#paths + 1] = select(i, ...)
    end
end

local failures = 0

for _, path in ipairs(paths) do
    local file, openError = io.open(path, "rb")
    if not file then
        io.stderr:write(path, ": cannot open: ", tostring(openError), "\n")
        failures = failures + 1
    else
        local source = file:read("*a")
        file:close()
        if source:sub(1, 3) == "\239\187\191" then
            source = source:sub(4)
        end
        -- Lua truncates long chunk names, so load under a short name and put the real path back
        local chunk, loadError = loadstring(source, "=src")
        if not chunk then
            io.stderr:write((loadError:gsub("^src:", path .. ":")), "\n")
            failures = failures + 1
        end
    end
end

io.stdout:write(string.format("checked %d file(s), %d with syntax errors\n", #paths, failures))
os.exit(failures == 0 and 0 or 1)