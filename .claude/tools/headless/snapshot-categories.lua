---@diagnostic disable: lowercase-global, undefined-global, need-check-nil
-- Category tree snapshot: builds the category tree for a client in the shared headless environment
-- (client-env.lua) and records it as text, so a refactor of the data files can be proved to have
-- changed nothing. Written for the V1 -> V2 CategoryData migration; see
-- docs/how-to/migrate-category-data.md.
--
-- Nodes are keyed by PATH, not by id, on purpose: category ids are parse positions, nothing
-- persists them (BrowsingHistory.lua documents the invariant), and they legitimately shift whenever
-- a file is reordered. An id-keyed snapshot would produce thousands of meaningless diffs and be
-- ignored within a day. A path is stable under id reallocation and sensitive to every real
-- structural change.
--
-- Names come from the headless stubs, which are deterministic and encode the id
-- (GetMapName(123) -> "MapName 123"), so the snapshot records map and instance IDS, never
-- locale-dependent strings, and does not churn when Blizzard renames a zone.
--
-- Three sections per client, because the tree alone would not have caught the 19 dropped subtrees
-- of 2026-09-20: a node that is silently dropped simply is not there to differ against a baseline
-- that never had it.
--   Tree        ordered paths with their flags and their ordered achievement ids - structure,
--               sibling ordering, flags
--   Orphans     achievement ids in no category at all - a dropped subtree, directly
--   Placements  every achievement placed in other than exactly one category, plus a histogram -
--               lost placements and accidental double-placement
--
-- Usage: lua.exe snapshot-categories.lua <repoRoot> [Retail|Classic|Both] [-write|-check|-stdout]
--   -write   (default) regenerate the baselines under .claude/tools/headless/snapshots/
--   -check   compare against the committed baselines, print "<file>:<line>: <message>" per
--            difference and exit 1 - what Check-Repo.ps1 runs as the category-snapshot rule
--   -stdout  print the snapshot instead of writing it (used by the determinism gate)
--
-- The baseline is RECORDED behaviour, following the Tests/ convention: an intended change is a
-- reviewed diff committed alongside the code that caused it, never a silent regenerate.

local root, clientArg, mode = ...
assert(root, "usage: snapshot-categories.lua <repoRoot> [Retail|Classic|Both] [-write|-check|-stdout]")
if clientArg and clientArg:sub(1, 1) == "-" then mode, clientArg = clientArg, nil end
clientArg = clientArg or "Both"
mode = mode or "-write"
assert(clientArg == "Retail" or clientArg == "Classic" or clientArg == "Both", "client must be Retail, Classic or Both")
assert(mode == "-write" or mode == "-check" or mode == "-stdout", "mode must be -write, -check or -stdout")

local scriptDir = ((arg and arg[0]) or ""):gsub("\\", "/"):match("^(.*)/") or "."
local clientEnv = assert(loadfile(scriptDir .. "/client-env.lua"))()
root = clientEnv.NormaliseRoot(root)

local SNAPSHOT_DIR = ".claude/tools/headless/snapshots"
local AUTO_ID_BASE = 9000   -- Api/CategoryDataApi.lua: nextCategoryId

local function snapshotPath(client)
    return SNAPSHOT_DIR .. "/CategoryTree." .. client .. ".txt"
end

-------------------------------------------------------------------------------------------------
-- Deterministic rendering helpers
-------------------------------------------------------------------------------------------------
local escapes = { ["\r"] = "\\r", ["\n"] = "\\n", ["\t"] = "\\t" }

local function escape(s)
    return (tostring(s):gsub("[\r\n\t]", escapes))
end

-- Deterministic for the value shapes category data can carry; a table is rendered with its keys
-- sorted, so it can never leak a hash order or an address into the snapshot.
local function serialize(v)
    local t = type(v)
    if t == "string" then return escape(v) end
    if t == "number" or t == "boolean" then return tostring(v) end
    if t ~= "table" then return "<" .. t .. ">" end
    local keys = {}
    for k in pairs(v) do keys[#keys + 1] = tostring(k) end
    table.sort(keys)
    local parts = {}
    for _, k in ipairs(keys) do parts[#parts + 1] = k .. "=" .. serialize(v[k] ~= nil and v[k] or v[tonumber(k)]) end
    return "{" .. table.concat(parts, ",") .. "}"
end

-- CanMerge is recorded as truthiness, not as its literal value: the only read of it is
-- `if self.Parent and self.CanMerge` in Objects/Category.lua, and V1 leaves it nil where the V2
-- root builder writes false. Recording nil and false apart would fail the migration on a
-- difference the game cannot observe.
local function flagsOf(cat)
    local parts = {}
    -- A DECLARED id is part of the plugin contract - Api/ApiDocumentation.lua shows plugins
    -- addressing first-party categories as KrowiAF.NewInjection(971) - so it must survive a
    -- refactor unchanged and is recorded. An auto-allocated id (>= AUTO_ID_BASE) is a parse
    -- position that shifts legitimately and is deliberately not recorded.
    if (cat.Id or 0) < AUTO_ID_BASE then parts[#parts + 1] = "id=" .. tostring(cat.Id) end
    if cat.CanMerge then parts[#parts + 1] = "merge" end
    if cat.TabName then parts[#parts + 1] = "tab=" .. escape(cat.TabName) end
    if cat.IgnoreFilters then
        local names = {}
        for k, v in pairs(cat.IgnoreFilters) do if v then names[#names + 1] = tostring(k) end end
        table.sort(names)
        parts[#parts + 1] = "ignore=" .. table.concat(names, ",")
    end
    if cat.Tooltip ~= nil then parts[#parts + 1] = "tooltip=" .. serialize(cat.Tooltip) end
    if cat.AlwaysVisible ~= nil then parts[#parts + 1] = "alwaysVisible=" .. tostring(cat.AlwaysVisible) end
    if cat.HasFlexibleData ~= nil then parts[#parts + 1] = "flexible=" .. tostring(cat.HasFlexibleData) end
    if #parts == 0 then return "" end
    return "  | " .. table.concat(parts, " ")
end

-------------------------------------------------------------------------------------------------
-- Build one client's snapshot
-------------------------------------------------------------------------------------------------
local function buildSnapshot(client)
    local ctx = clientEnv.New(root, client)
    local failures = {}
    ctx:LoadFiles{
        ParseError = function(rel, err) failures[#failures + 1] = rel .. ": parse error: " .. tostring(err) end,
        RuntimeError = function(rel, runErr) failures[#failures + 1] = rel .. ": " .. ctx:RealPath(tostring(runErr.msg)) end,
    }
    ctx:RunPipeline{
        StepError = function(label, file, err) failures[#failures + 1] = (file or "?") .. ": " .. label .. ": " .. ctx:RealPath(tostring(err)) end,
        TaskError = function(_, err) failures[#failures + 1] = ctx:RealPath(tostring(err)) end,
    }

    local data = ctx.addon.Data
    local categories, achievements = data.Categories, data.Achievements
    assert(type(categories) == "table", "addon.Data.Categories did not initialise for " .. client)
    assert(type(achievements) == "table", "addon.Data.Achievements did not initialise for " .. client)

    -- --- roots -------------------------------------------------------------------------------
    -- Everything with no Parent, so a subtree that failed to attach still shows up rather than
    -- vanishing from the snapshot. Sorted by tab, then name, then id: deterministic, and stable
    -- under the id reallocation the migration causes.
    local roots = {}
    for _, cat in pairs(categories) do
        if type(cat) == "table" and cat.Parent == nil then roots[#roots + 1] = cat end
    end
    table.sort(roots, function(a, b)
        local at, bt = tostring(a.TabName or "~"), tostring(b.TabName or "~")
        if at ~= bt then return at < bt end
        local an, bn = tostring(a.Name or ""), tostring(b.Name or "")
        if an ~= bn then return an < bn end
        return (a.Id or 0) < (b.Id or 0)
    end)

    -- --- walk --------------------------------------------------------------------------------
    local out = {}
    local nodeCount, declaredIds, autoIds, achLines = 0, 0, 0, 0
    local seen = {}

    local function walk(cat, path)
        if seen[cat] then
            out[#out + 1] = "CYCLE " .. path
            return
        end
        seen[cat] = true
        nodeCount = nodeCount + 1
        if (cat.Id or 0) >= AUTO_ID_BASE then autoIds = autoIds + 1 else declaredIds = declaredIds + 1 end

        out[#out + 1] = "CAT " .. path .. flagsOf(cat)
        if cat.Achievements then
            for _, ach in ipairs(cat.Achievements) do
                out[#out + 1] = "ACH " .. path .. " # " .. tostring(ach.Id)
                achLines = achLines + 1
            end
        end
        if cat.Children then
            for _, child in ipairs(cat.Children) do
                walk(child, path .. " > " .. escape(child.Name or "Unknown"))
            end
        end
    end

    local lines = {}
    local function emit(s) lines[#lines + 1] = s end

    emit("# CategoryTree " .. client)
    emit("# Generated by " .. SNAPSHOT_DIR:gsub("/snapshots$", "") .. "/snapshot-categories.lua - do not edit by hand.")
    emit("# Recorded behaviour: an intended change is a reviewed diff committed with the code that")
    emit("# caused it, never a silent regenerate. Nodes are keyed by path; ids are parse positions")
    emit("# and shift legitimately. Names come from the deterministic headless stubs, so a name like")
    emit('# "MapName 424" records uiMapId 424 and is locale-independent.')
    emit("")

    if #failures > 0 then
        emit("== Load failures ==")
        table.sort(failures)
        for _, f in ipairs(failures) do emit("FAIL " .. f) end
        emit("")
    end

    emit("== Tree ==")
    for _, r in ipairs(roots) do walk(r, escape(r.Name or "Unknown")) end
    for _, l in ipairs(out) do emit(l) end
    emit("")

    -- --- orphans -----------------------------------------------------------------------------
    -- An achievement no category holds. This is the section that catches a silently dropped
    -- subtree: the tree simply would not contain the node to differ against.
    local orphans, placements, total = {}, {}, 0
    for id, ach in pairs(achievements) do
        if type(id) == "number" and type(ach) == "table" then
            total = total + 1
            local count = 0
            if ach.Category then count = 1 + (ach.MoreCategories and #ach.MoreCategories or 0) end
            if count == 0 then
                orphans[#orphans + 1] = id
            elseif count ~= 1 then
                placements[#placements + 1] = { Id = id, Count = count }
            end
        end
    end
    table.sort(orphans)
    table.sort(placements, function(a, b) return a.Id < b.Id end)

    emit("== Orphans ==")
    emit("# achievement ids registered by a data file but held by no category of the addon's own tree.")
    emit("# A non-zero count is normal, not a defect list: Blizzard's category tree is built in game from")
    emit("# GetCategoryList/GetAchievementCategory, which do not run headlessly, so an achievement placed")
    emit("# only there lands here. What matters is the DIFF - a subtree that stops loading moves its")
    emit("# achievements into this section, which is how the 19 dropped nodes of 2026-09-20 would show.")
    for _, id in ipairs(orphans) do emit("ORPHAN " .. tostring(id)) end
    emit("")

    emit("== Placements ==")
    emit("# every achievement placed in other than exactly one category; the rest are in exactly one")
    for _, p in ipairs(placements) do emit("PLACED " .. tostring(p.Id) .. " x" .. tostring(p.Count)) end
    emit("")

    emit("== Summary ==")
    emit("categories        " .. nodeCount)
    emit("  declared id     " .. declaredIds)
    emit("  auto id         " .. autoIds .. "   (>= " .. AUTO_ID_BASE .. ", allocated in parse order)")
    emit("roots             " .. #roots)
    emit("achievements      " .. total)
    emit("  in a category   " .. (total - #orphans))
    emit("  orphaned        " .. #orphans)
    emit("placement lines   " .. achLines)
    emit("  multi-placed    " .. #placements)

    return table.concat(lines, "\r\n")
end

-------------------------------------------------------------------------------------------------
-- Modes
-------------------------------------------------------------------------------------------------
local function readBaseline(client)
    local f = io.open(root .. "/" .. snapshotPath(client), "rb")
    if not f then return nil end
    local s = f:read("*a")
    f:close()
    if s:sub(1, 3) == "\239\187\191" then s = s:sub(4) end
    return s
end

local function splitLines(s)
    local out = {}
    for line in (s .. "\n"):gmatch("(.-)\r?\n") do out[#out + 1] = line end
    if out[#out] == "" then out[#out] = nil end
    return out
end

-- Compared as a multiset of lines plus their order. A structural change shows as removed and added
-- lines; a change that only moves lines about - a reordered sibling, which is user-visible in the
-- category list - has an identical multiset, so the positional differences are reported instead.
local function compare(baseline, current)
    local was, now = splitLines(baseline), splitLines(current)
    local counts = {}
    for _, l in ipairs(was) do counts[l] = (counts[l] or 0) + 1 end
    for _, l in ipairs(now) do counts[l] = (counts[l] or 0) - 1 end
    local removed, added = {}, {}
    for l, n in pairs(counts) do
        for _ = 1, n do removed[#removed + 1] = l end
        for _ = 1, -n do added[#added + 1] = l end
    end
    table.sort(removed)
    table.sort(added)
    local moved = {}
    for i = 1, math.max(#was, #now) do
        if was[i] ~= now[i] then
            moved[#moved + 1] = { Line = i, Was = was[i], Now = now[i] }
        end
    end
    return removed, added, moved
end

local clients = clientArg == "Both" and { "Retail", "Classic" } or { clientArg }
local problems = 0

for _, client in ipairs(clients) do
    local text = buildSnapshot(client)
    local rel = snapshotPath(client)

    if mode == "-stdout" then
        io.stdout:write("---------- ", rel, " ----------\r\n", text, "\r\n")
    elseif mode == "-write" then
        os.execute('if not exist "' .. (root .. "/" .. SNAPSHOT_DIR):gsub("/", "\\") .. '" mkdir "' .. (root .. "/" .. SNAPSHOT_DIR):gsub("/", "\\") .. '"')
        local f = assert(io.open(root .. "/" .. rel, "wb"))
        f:write(text)
        f:close()
        io.stdout:write(string.format("snapshot-categories: wrote %s (%d bytes)\n", rel, #text))
    else -- -check
        local baseline = readBaseline(client)
        if not baseline then
            io.stderr:write(string.format("%s:1: no committed baseline for %s; run snapshot-categories.lua with -write and commit it\n", rel, client))
            problems = problems + 1
        elseif baseline == text then
            io.stdout:write(string.format("snapshot-categories %s: matches the baseline\n", client))
        else
            local removed, added, moved = compare(baseline, text)
            local at = moved[1] and moved[1].Line or 1
            local what
            if #removed == 0 and #added == 0 then
                what = string.format("the same %d lines in a different order, so a sibling or an achievement moved - that is visible in the category list", #moved)
            else
                what = string.format("%d line(s) gone, %d new", #removed, #added)
            end
            io.stderr:write(string.format("%s:%d: the %s category tree no longer matches the recorded baseline: %s. Review the change; if it is intended, regenerate with -write and commit the diff with the code that caused it\n",
                rel, at, client, what))
            local function dump(label, list, render)
                local shown = math.min(#list, 40)
                for i = 1, shown do io.stderr:write(string.format("%s:%d:   %s\n", rel, at, render(label, list[i]))) end
                if #list > shown then io.stderr:write(string.format("%s:%d:   %s ... and %d more\n", rel, at, label, #list - shown)) end
            end
            if #removed == 0 and #added == 0 then
                dump("~", moved, function(l, m) return string.format("%s line %d: was %q, now %q", l, m.Line, tostring(m.Was), tostring(m.Now)) end)
            else
                dump("-", removed, function(l, v) return l .. " " .. v end)
                dump("+", added, function(l, v) return l .. " " .. v end)
            end
            problems = problems + 1
        end
    end
end

if mode == "-check" then
    io.stdout:write(string.format("snapshot-categories: %d mismatch(es)\n", problems))
    os.exit(problems == 0 and 0 or 1)
end