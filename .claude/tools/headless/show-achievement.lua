---@diagnostic disable: lowercase-global, undefined-global, need-check-nil
-- One achievement as each client builds it, for .claude/tools/Show-Achievement.ps1 (run that; it adds the
-- game database and the git history). Loads the client in the shared headless environment (client-env.lua)
-- the way the data snapshot does, then prints per id:
--   source    the file and line of the Ach(<id>) data line, the line itself and its patch key
--   snapshot  the ACH line exactly as Achievements.<client>.txt records it (data-format.lua writes both)
--   state     what the real GetObtainableState (Data/TemporaryObtainable.lua) returns at the given clock and
--             build, and per Obtainable() record the was/is/will be of its tooltip line (GetWasIsWillBe)
--   category, zone, event, tooltip, transmog, petbattle, guide, load: where else the id is named, in the
--             snapshots' line forms, and what the data load reported about it (LoadDiagnostics)
--
-- The clock and the build are set in the sandbox: GetServerTime() and time() return <asOf>, time{...}
-- converts a date as UTC, KrowiAF_GetUtcOffsetSeconds() is 0 (the realm's clock is read as UTC), and the
-- weekly reset is unknown, so a season or Reset anchor is the date at 00:00 UTC, not the region's reset
-- nearest it. The calendar and the season API are not known offline: they are stubs that stop the real
-- code and report what it asked for, so a state is printed exactly when the game would decide one
-- without them, and otherwise the event or season that decides it.
--
-- Usage: lua.exe show-achievement.lua <repoRoot> <Retail|Classic|Both> <asOf> <build> <id>[,<id>...]
--   asOf    the clock, UTC seconds since 1970
--   build   the version GetBuildInfo() returns ("12.1.5"), or "-" for the newest patch the .toc declares
--           for each client (Retail the 10.x and later line, Classic the 5.x line: headless Classic is Mists)

local root, clientArg, asOfArg, buildArg, idsArg = ...
local usage = "usage: show-achievement.lua <repoRoot> <Retail|Classic|Both> <asOf> <build|-> <id>[,<id>...]"
assert(root and clientArg and asOfArg and buildArg and idsArg, usage)
assert(clientArg == "Retail" or clientArg == "Classic" or clientArg == "Both", "client must be Retail, Classic or Both")
local asOf = assert(tonumber(asOfArg), "asOf must be UTC seconds since 1970, got " .. tostring(asOfArg))
assert(buildArg == "-" or buildArg:match("^%d+%.%d+%.%d+$"), "build must be like 12.1.5, or - for the .toc's, got " .. buildArg)
local clients = clientArg == "Both" and { "Retail", "Classic" } or { clientArg }
assert(buildArg == "-" or #clients == 1, "a build is one client's: name Retail or Classic with it")
local ids = {}
for s in idsArg:gmatch("[^,%s]+") do ids[#ids + 1] = assert(tonumber(s), "not an achievement id: " .. s) end
assert(#ids > 0, usage)

local scriptDir = ((arg and arg[0]) or ""):gsub("\\", "/"):match("^(.*)/") or "."
local clientEnv = assert(loadfile(scriptDir .. "/client-env.lua"))()
local dataFormat = assert(loadfile(scriptDir .. "/data-format.lua"))()
root = clientEnv.NormaliseRoot(root)

-------------------------------------------------------------------------------------------------
-- The clock and the build
-------------------------------------------------------------------------------------------------
-- days since 1970-01-01 of a proleptic Gregorian date (H. Hinnant's days_from_civil), so time{...} is UTC
-- on every machine; os.time would read the table in the machine's time zone
local function daysFromCivil(y, m, d)
    if m <= 2 then y = y - 1 end
    local era = math.floor(y / 400)
    local yearOfEra = y - era * 400
    local dayOfYear = math.floor((153 * ((m + 9) % 12) + 2) / 5) + d - 1
    return era * 146097 + yearOfEra * 365 + math.floor(yearOfEra / 4) - math.floor(yearOfEra / 100) + dayOfYear - 719468
end

local function utcTime(t)
    return daysFromCivil(t.year, t.month, t.day) * 86400 + (t.hour or 12) * 3600 + (t.min or 0) * 60 + (t.sec or 0)
end

-- the newest patch the .toc's Interface line declares for a client: 120105 -> "12.1.5", 120105
local function tocBuild(client)
    local line = clientEnv.FileText(root, "Krowi_AchievementFilter.toc"):match("## Interface:%s*([^\r\n]*)") or ""
    local best
    for n in line:gmatch("%d+") do
        n = tonumber(n)
        local major = math.floor(n / 10000)
        if (client == "Retail" and major >= 10 or client == "Classic" and major == 5) and (not best or n > best) then best = n end
    end
    assert(best, "the .toc's Interface line declares no " .. client .. " patch; pass -Build")
    return string.format("%d.%d.%d", math.floor(best / 10000), math.floor(best / 100) % 100, best % 100), best
end

local function interfaceOf(build)
    local major, minor, patch = build:match("^(%d+)%.(%d+)%.(%d+)$")
    return tonumber(major) * 10000 + tonumber(minor) * 100 + tonumber(patch)
end

-------------------------------------------------------------------------------------------------
-- Zone names, from the Map Verifier's canonical file (offline)
-------------------------------------------------------------------------------------------------
local function csvFields(line)
    local fields, i, n = {}, 1, #line
    while i <= n + 1 do
        if line:sub(i, i) == '"' then
            local value, j = {}, i + 1
            while j <= n do
                local c = line:sub(j, j)
                if c == '"' then
                    if line:sub(j + 1, j + 1) ~= '"' then break end
                    j = j + 1
                end
                value[#value + 1] = c
                j = j + 1
            end
            fields[#fields + 1] = table.concat(value)
            i = j + 2
        else
            local j = line:find(",", i, true) or (n + 1)
            fields[#fields + 1] = line:sub(i, j - 1)
            i = j + 1
        end
    end
    return fields
end

local mapNames
local function mapLabel(mapId)
    if not mapNames then
        mapNames = {}
        local ok, text = pcall(clientEnv.FileText, root, "raw/MapVerifier.csv")
        if ok then
            local columns
            for line in text:gmatch("[^\r\n]+") do
                local fields = csvFields(line)
                if not columns then
                    columns = {}
                    for i, name in ipairs(fields) do columns[name] = i end
                else
                    local id = tonumber(fields[columns.id or 1])
                    local override = columns.nameOverride and fields[columns.nameOverride] or ""
                    local name = override ~= "" and override or fields[columns.name or 2]
                    local verdict = columns.verdict and fields[columns.verdict] or ""
                    if id and name and name ~= "" then mapNames[id] = name .. (verdict ~= "" and (" (" .. verdict .. ")") or "") end
                end
            end
        end
    end
    return mapNames[mapId] and (" " .. mapNames[mapId]) or ""
end

-------------------------------------------------------------------------------------------------
-- One client: load, then the lines per id
-------------------------------------------------------------------------------------------------
local catEscapes = { ["\r"] = "\\r", ["\n"] = "\\n", ["\t"] = "\\t" }

-- the path snapshot-categories.lua records the category under
local function categoryPath(cat)
    local names, seen = {}, {}
    while type(cat) == "table" and not seen[cat] do
        seen[cat] = true
        table.insert(names, 1, (tostring(cat.Name or "Unknown"):gsub("[\r\n\t]", catEscapes)))
        cat = cat.Parent
    end
    return table.concat(names, " > ")
end

local function loadClient(client, build)
    local ctx = clientEnv.New(root, client)
    local failures = {}
    -- which file and patch key each KrowiAF.AchievementData table came from; an AutoFactionSplit mirror has no
    -- Ach() line of its own, so it points at its partner's
    local sources, seenTables = {}, {}
    ctx:LoadFiles{
        ParseError = function(rel, err) failures[#failures + 1] = rel .. ": parse error: " .. tostring(err) end,
        RuntimeError = function(rel, runErr) failures[#failures + 1] = rel .. ": " .. ctx:RealPath(tostring(runErr.msg)) end,
        AfterFile = function(rel)
            local KrowiAF = ctx:KrowiAF()
            local registry = rel:match("^DataAddons/") and type(KrowiAF) == "table" and KrowiAF.AchievementData
            if type(registry) ~= "table" then return end
            for key, list in pairs(registry) do
                if type(list) == "table" and not seenTables[list] then
                    seenTables[list] = true
                    for _, entry in ipairs(list) do
                        local id, extras = type(entry) == "table" and entry[2], type(entry) == "table" and entry[3]
                        if type(id) == "number" then
                            sources[id] = sources[id] or { File = rel, Key = key }
                            if type(extras) == "table" and extras.AutoPair and type(extras.AltId) == "number" then
                                sources[extras.AltId] = sources[extras.AltId] or { File = rel, Key = key, Via = id }
                            end
                        end
                    end
                end
            end
        end,
    }
    ctx:RunPipeline{
        StepError = function(label, file, err) failures[#failures + 1] = (file or "?") .. ": " .. label .. ": " .. ctx:RealPath(tostring(err)) end,
        TaskError = function(_, err) failures[#failures + 1] = ctx:RealPath(tostring(err)) end,
    }

    -- the state code on top of the load, as the obtainable suite does, with the clock and build set
    local env, addon = ctx.env, ctx.addon
    local function asked(what, value) error({ Asked = what, Value = value }, 0) end
    env.GetServerTime = function() return asOf end
    env.time = function(t) if t == nil then return asOf end return utcTime(t) end
    env.KrowiAF_GetUtcOffsetSeconds = function() return 0 end
    env.C_DateAndTime = { GetSecondsUntilWeeklyReset = function() return nil end }
    env.GetBuildInfo = function() return build, "0", "", interfaceOf(build) end
    env.C_MythicPlus = { GetCurrentSeason = function() asked("PvE Season") end }
    env.GetCVar = function() asked("PvE Season") end   -- newMythicPlusSeason, the previous PvE season
    env.GetCurrentArenaSeason = function() asked("PvP Season") end
    env.GetPreviousArenaSeason = function() asked("PvP Season") end
    local chunk = assert(loadstring(ctx:FileText("Data/TemporaryObtainable.lua"), "@Data/TemporaryObtainable.lua"))
    setfenv(chunk, env)
    chunk("Krowi_AchievementFilter", addon)
    addon.EventData = { GetNextEventOccurance = function(eventId) asked("Event", eventId) end }

    local KrowiAF = ctx:KrowiAF()
    local data = addon.Data
    local temporaryObtainable = data.TemporaryObtainable
    local fmt = dataFormat.New(ctx)
    local calendar = type(data.Events) == "table" and data.Events[KrowiAF.Enum.EventType.Calendar] or {}
    local rowOf = {}
    for _, row in ipairs(fmt.EventRows) do rowOf[row.TypeName .. " " .. tostring(row.Id)] = row end

    local function eventName(eventId)
        local event = calendar[tonumber(eventId)]
        return type(event) == "table" and type(event.Name) == "string" and (" (" .. event.Name .. ")") or ""
    end

    -- what the stubbed calendar or season API was asked for, as the reason there is no state offline
    local function decidedBy(err, record)
        if type(err) ~= "table" or not err.Asked then return "error: " .. tostring(err) end
        if err.Asked == "Event" then
            return "the in-game calendar decides: event " .. tostring(err.Value) .. eventName(err.Value)
        end
        -- the start is asked first, so it is the start when that side is a season without a start anchor
        local start = type(record) == "table" and record.Start or {}
        local season = type(data.Seasons) == "table" and type(data.Seasons[err.Asked]) == "table" and data.Seasons[err.Asked][start.Value]
        local side, value = "end", type(record) == "table" and type(record.End) == "table" and record.End.Value
        if start.Function == err.Asked and not (type(season) == "table" and season.Start) then side, value = "start", start.Value end
        return "the game's current " .. err.Asked .. " decides: " .. err.Asked .. " " .. tostring(value) .. " has no " .. side .. " anchor"
    end

    local function block(id)
        local lines = {}
        local function row(label, text) lines[#lines + 1] = string.format("  %-9s %s", label, text) end
        local ach = data.Achievements[id]

        local src = sources[id]
        if src then
            local want, n, found = "Ach%(%s*" .. tostring(src.Via or id) .. "%s*%)", 0, nil
            for line in (ctx:FileText(src.File) .. "\n"):gmatch("([^\n]*)\n") do
                n = n + 1
                if line:find(want) then found = (line:gsub("\r$", ""):gsub("^%s+", "")) break end
            end
            row("source", src.File .. ":" .. (found and n or "?") .. ", patch key " .. tostring(src.Key)
                .. (src.Via and (", the AutoFactionSplit mirror of " .. tostring(src.Via)) or ""))
            if found then row("", found) end
        end

        if type(ach) ~= "table" then
            row("snapshot", "not registered on " .. client)
        else
            row("snapshot", fmt.AchievementLine(id, ach))
            local records = type(ach.TemporaryObtainable) == "table" and ach.TemporaryObtainable or nil
            if not records then
                row("state", "none: no Obtainable() record, so simply obtainable")
            else
                local last = records[#records]
                local ok, state = pcall(temporaryObtainable.GetObtainableState, temporaryObtainable, ach)
                if not ok then
                    row("state", decidedBy(state, last))
                elseif state == nil then
                    row("state", "none: obtainable, with no end scheduled on this client")
                else
                    row("state", tostring(state) .. (#records > 1 and " (the last record decides)" or ""))
                end
                -- the tooltip line's was/is/will be; an event's line names the event and its next dates instead
                for i, r in ipairs(records) do
                    local wordOk, word = pcall(temporaryObtainable.GetWasIsWillBe, temporaryObtainable, r)
                    local askedFor = not wordOk and type(word) == "table" and word.Asked
                    row("record " .. i, fmt.Record(r) .. (wordOk and (': tooltip "' .. tostring(word) .. '"')
                        or askedFor == "Event" and "" or askedFor and (": tooltip set by the game's current " .. askedFor)
                        or (": " .. decidedBy(word, r))))
                end
            end

            local categories = {}
            if ach.Category then categories[1] = ach.Category end
            for _, cat in ipairs(type(ach.MoreCategories) == "table" and ach.MoreCategories or {}) do categories[#categories + 1] = cat end
            if #categories == 0 then row("category", "none in the addon's own tree") end
            for _, cat in ipairs(categories) do row("category", categoryPath(cat)) end
        end

        for _, mapId in ipairs(dataFormat.SortedKeys(data.Maps)) do
            local entry = data.Maps[mapId]
            for _, l in ipairs(dataFormat.ZONE_LISTS) do
                local list = type(entry) == "table" and entry[l.Field]
                for _, a in ipairs(type(list) == "table" and list or {}) do
                    if (type(a) == "table" and a.Id or a) == id then
                        row("zone", tostring(mapId) .. l.Tag .. mapLabel(mapId))
                        break
                    end
                end
            end
        end

        for _, typeName in ipairs(dataFormat.SortedKeys(fmt.EventsOf[id] or {})) do
            for _, eventId in ipairs(dataFormat.SortedKeys(fmt.EventsOf[id][typeName])) do
                local event = rowOf[typeName .. " " .. tostring(eventId)]
                if event then
                    row("event", fmt.EventLine(event) .. (typeName == "Calendar" and eventName(eventId) or ""))
                end
            end
        end
        for _, l in ipairs(fmt.TooltipLines(id)) do row("tooltip", l) end
        for _, l in ipairs(fmt.TransmogLines(id) or {}) do row("transmog", l) end
        for _, l in ipairs((fmt.PetBattleLines(id))) do row("petbattle", l) end
        for _, l in ipairs(fmt.GuideLines(id) or {}) do row("guide", l) end

        local diagnostics = data.LoadDiagnostics
        for _, e in ipairs(type(diagnostics) == "table" and type(diagnostics.Entries) == "table" and diagnostics.Entries or {}) do
            if e.Id == id then
                row("load", tostring(e.Kind) .. (e.Detail ~= nil and (": " .. tostring(e.Detail)) or "")
                    .. " (" .. diagnostics.SourceToString(e.Source) .. ")")
            end
        end
        return lines
    end

    local blocks = {}
    for _, id in ipairs(ids) do blocks[id] = block(id) end
    return blocks, failures
end

-------------------------------------------------------------------------------------------------
-- Report
-------------------------------------------------------------------------------------------------
local builds, results, heads = {}, {}, {}
for i, client in ipairs(clients) do
    builds[client] = buildArg ~= "-" and buildArg or tocBuild(client)
    heads[i] = client .. " " .. builds[client] .. (buildArg == "-" and " (the .toc's)" or "")
    results[client] = { loadClient(client, builds[client]) }
end

local out = {}
local function emit(s) out[#out + 1] = s end
emit(table.concat(heads, ", ") .. "; clock " .. os.date("!%Y-%m-%d %H:%M", asOf) .. " UTC")
emit("Dates are days on a UTC realm clock; a season or Reset anchor is not snapped to a region's weekly reset.")
emit("In a category path, MapName <n> and InstanceInfoName <n> are the headless stubs for a uiMapId and a journal instance id.")
for _, client in ipairs(clients) do
    for _, f in ipairs(results[client][2]) do emit("[" .. client .. "] load failure: " .. f) end
end
for _, id in ipairs(ids) do
    emit("")
    emit("== " .. id .. " ==")
    for _, client in ipairs(clients) do
        emit("[" .. client .. "]")
        for _, l in ipairs(results[client][1][id]) do emit(l) end
    end
end
io.stdout:write(table.concat(out, "\n"), "\n")