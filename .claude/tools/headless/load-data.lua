---@diagnostic disable: lowercase-global, undefined-global, need-check-nil
-- Headless data pipeline: evaluates the addon's API layer, object classes, data registry and every
-- data file for both clients in plain Lua 5.1, then drives the real task groups the way
-- Data.lua:LoadOnPlayerLogin does, with WoW globals stubbed. Catches what the syntax checker
-- cannot: unknown builder methods, misspelled enum members, malformed entries, duplicate
-- registrations (including AutoFactionSplit pairs), unregistered build versions, category
-- injection targets that do not exist, and category/zone/tooltip references to achievement ids
-- that no data file registers.
--
-- The sandboxed environment, the file list and the pipeline drive live in client-env.lua, shared
-- with snapshot-categories.lua; everything below is this tool's own reporting.
--
-- Usage: lua.exe load-data.lua <repoRoot> [Retail|Classic|Both] [-v]
-- Output: one "<path>:<line>: <message>" per problem, a summary line per client, exit 1 on any problem.

local root, clientArg, verbose = ...
assert(root, "usage: load-data.lua <repoRoot> [Retail|Classic|Both] [-v]")
if clientArg == "-v" then verbose, clientArg = "-v", nil end
clientArg = clientArg or "Both"
assert(clientArg == "Retail" or clientArg == "Classic" or clientArg == "Both", "client must be Retail, Classic or Both")
verbose = verbose == "-v"

local scriptDir = ((arg and arg[0]) or ""):gsub("\\", "/"):match("^(.*)/") or "."
local clientEnv = assert(loadfile(scriptDir .. "/client-env.lua"))()
root = clientEnv.NormaliseRoot(root)

local problems, reported = {}, {}
local function report(path, line, message)
    local text = string.format("%s:%s: %s", path, line or 1, message)
    if not reported[text] then
        reported[text] = true
        problems[#problems + 1] = text
    end
end

local function findIdLine(rel, id) return clientEnv.FindIdLine(root, rel, id) end

-- the vocabulary Data/TemporaryObtainable.lua understands
local obtainableWords = { From = true, Until = true, Date = true, Event = true, Patch = true, Version = true, Before = true, After = true, Once = true, Never = true, Reset = true, ["PvP Season"] = true, ["PvE Season"] = true }

-- registries whose KrowiAF.<name>[key] tables become task groups, and the loaders that process them
local registries = { "AchievementData", "CustomCriteriaData", "EventData", "TooltipData", "PetBattleLinkData", "TransmogSetData", "ZoneData" }

-------------------------------------------------------------------------------------------------
-- One client
-------------------------------------------------------------------------------------------------
local function runClient(client)
    local result = { client = client, registered = {}, missing = {}, files = 0, achievements = 0, keys = 0, tasks = 0 }
    local prefix = "[" .. client .. "] "
    local ctx = clientEnv.New(root, client)

    -- --- builder argument checks -------------------------------------------------------------
    local function installBuilderChecks()
        local KrowiAF = ctx:KrowiAF()
        if type(KrowiAF) ~= "table" or type(KrowiAF.Ach) ~= "function" then return end
        local AchBuilder = getmetatable(KrowiAF.Ach(0))
        if type(AchBuilder) ~= "table" then return end
        local factionValues = {}
        for _, v in pairs(type(KrowiAF.Enum) == "table" and KrowiAF.Enum.Faction or {}) do factionValues[v] = true end
        local function wrap(name, validate)
            local original = AchBuilder[name]
            if type(original) ~= "function" then return end
            AchBuilder[name] = function(self, ...)
                local problem = validate(...)
                if problem then report(ctx.CurrentFile, findIdLine(ctx.CurrentFile, self[2]), prefix .. string.format("achievement %s: %s", tostring(self[2]), problem)) end
                return original(self, ...)
            end
        end
        local function numbers(name)
            return function(...)
                for i = 1, select("#", ...) do
                    if type((select(i, ...))) ~= "number" then return name .. "() arguments must be numeric ids, got " .. tostring((select(i, ...))) end
                end
            end
        end
        local function factionSplit(name)
            return function(f, altId)
                if not factionValues[f] then return name .. "() faction is not a KrowiAF.Enum.Faction value (misspelled member?)" end
                if altId ~= nil and type(altId) ~= "number" then return name .. "() alternate id must be a number, got " .. tostring(altId) end
            end
        end
        wrap("FactionSplit", factionSplit("FactionSplit"))
        wrap("AutoFactionSplit", factionSplit("AutoFactionSplit"))
        wrap("PvE", function(s) if type(s) ~= "number" then return "PvE() needs a numeric season, got " .. tostring(s) end end)
        wrap("PvP", function(s) if type(s) ~= "number" then return "PvP() needs a numeric season, got " .. tostring(s) end end)
        wrap("Weeks", function(first) if type(first) ~= "number" then return "Weeks() needs a numeric first week, got " .. tostring(first) end end)
        wrap("Obtainable", function(...)
            for i = 1, select("#", ...) do
                local word = select(i, ...)
                if type(word) == "string" and not obtainableWords[word] then return string.format("Obtainable() uses unknown word %q", word) end
            end
        end)
        wrap("Mount", numbers("Mount"))
        wrap("Pet", numbers("Pet"))
        wrap("HousingDecor", numbers("HousingDecor"))
        wrap("CreatureDisplay", numbers("CreatureDisplay"))
        local originalAch = KrowiAF.Ach
        KrowiAF.Ach = function(id)
            if type(id) ~= "number" or id <= 0 or id % 1 ~= 0 then report(ctx.CurrentFile, 1, prefix .. "Ach() needs a positive integer id, got " .. tostring(id)) end
            return originalAch(id)
        end
    end

    -- --- load every file, tracking which file introduced each registry key ------------------
    local origin = {}   -- origin[registry][key] = file
    for _, r in ipairs(registries) do origin[r] = {} end
    local function snapshotKeys()
        local snap = {}
        local KrowiAF = ctx:KrowiAF()
        for _, r in ipairs(registries) do
            snap[r] = {}
            if type(KrowiAF) == "table" and type(KrowiAF[r]) == "table" then for k in pairs(KrowiAF[r]) do snap[r][k] = true end end
        end
        return snap
    end
    local function recordNewKeys(before, rel)
        local KrowiAF = ctx:KrowiAF()
        for _, r in ipairs(registries) do
            if type(KrowiAF) == "table" and type(KrowiAF[r]) == "table" then
                for k in pairs(KrowiAF[r]) do if not before[r][k] then origin[r][k] = rel end end
            end
        end
    end

    local before
    ctx:LoadFiles{
        BeforeFile = function() before = snapshotKeys() end,
        AfterFile = function(rel)
            if rel == "Api/AchievementDataBuilder.lua" then installBuilderChecks() end
            recordNewKeys(before, rel)
        end,
        ParseError = function(rel, err)
            report(rel, err:match(":(%d+):"), prefix .. "parse error: " .. (err:match(":%d+: (.*)$") or err))
        end,
        RuntimeError = function(rel, runErr)
            local msg = ctx:RealPath(tostring(runErr.msg))
            local file, line, text = msg:match("^(.-):(%d+): (.*)$")
            report(file or rel, line, prefix .. "runtime error while loading: " .. (text or msg))
            if verbose then io.stderr:write(ctx:RealPath(runErr.trace), "\n") end
        end,
    }
    result.files = ctx.FilesLoaded

    local KrowiAF = ctx:KrowiAF()
    local data = ctx.addon.Data
    if type(KrowiAF) ~= "table" or type(KrowiAF.AchievementData) ~= "table" or type(data.Achievements) ~= "table" then
        report("Api/API.lua", 1, prefix .. "the API layer or Data.lua did not initialise; pipeline not run")
        return result
    end

    -- --- structural checks on the achievement registry ---------------------------------------
    local sortedKeys = {}
    for k in pairs(KrowiAF.AchievementData) do sortedKeys[#sortedKeys + 1] = k end
    table.sort(sortedKeys)
    result.keys = #sortedKeys
    for _, key in ipairs(sortedKeys) do
        local file = origin.AchievementData[key] or "?"
        local isShared = file:match("^DataAddons/Shared/") ~= nil
        local major, _, _, suffix = tostring(key):match("^(%d%d)_(%d%d)_(%d%d)(.*)$")
        if not major then
            report(file, 1, prefix .. string.format("AchievementData key %q is not EE_PP_SS or EE_PP_SS_S", tostring(key)))
        elseif isShared and suffix ~= "_S" then
            report(file, 1, prefix .. string.format("AchievementData key %q lives in a Shared file but lacks the _S suffix", key))
        elseif not isShared and suffix ~= "" then
            report(file, 1, prefix .. string.format("AchievementData key %q has the Shared suffix but lives in a %s file", key, client))
        end
        local entries = KrowiAF.AchievementData[key]
        if type(entries) ~= "table" then
            report(file, 1, prefix .. string.format("AchievementData[%q] is not a table", tostring(key)))
        else
            for i, entry in ipairs(entries) do
                if type(entry) ~= "table" or entry[1] ~= KrowiAF.AddAchievementData or type(entry[2]) ~= "number" then
                    report(file, 1, prefix .. "entry " .. i .. " of key " .. key .. " is not an Ach(id) builder result")
                end
            end
        end
    end

    -- --- drive the real pipeline --------------------------------------------------------------
    local groupInfo = {}   -- task group table -> { Registry, Key, File }
    for _, r in ipairs(registries) do
        if type(KrowiAF[r]) == "table" then
            for k, group in pairs(KrowiAF[r]) do
                if type(group) == "table" then groupInfo[group] = { Registry = r, Key = tostring(k), File = origin[r][k] or "?" } end
            end
        end
    end

    -- Once the achievement groups have run, record every lookup of an unregistered id
    local proxyInstalled = false
    local function installMissingProxy()
        proxyInstalled = true
        setmetatable(data.Achievements, { __index = function(_, id)
            if type(id) == "number" then
                local info = ctx.CurrentGroup and groupInfo[ctx.CurrentGroup]
                local label = info and (info.Registry .. " " .. info.Key) or "CategoryData"
                local file = info and info.File or nil
                result.missing[id] = result.missing[id] or {}
                result.missing[id][label] = file or true
            end
            return nil
        end })
    end

    ctx:RunPipeline{
        StepError = function(label, file, err)
            local msg = ctx:RealPath(tostring(err))
            local eFile, eLine, text = msg:match("^(.-):(%d+): (.*)$")
            report(file or eFile or "?", (file == nil and eLine) or nil, prefix .. label .. ": " .. (text or msg))
        end,
        BeforeGroup = function(tasks)
            local info = groupInfo[tasks]
            if not proxyInstalled and not (info and info.Registry == "AchievementData") then installMissingProxy() end
            ctx.CurrentFile = info and info.File or "?"
        end,
        TaskError = function(tasks, err)
            local info = groupInfo[tasks]
            local msg = ctx:RealPath(tostring(err))
            local eFile, eLine, text = msg:match("^(.-):(%d+): (.*)$")
            local label = info and (info.Registry .. " " .. info.Key) or "CategoryData"
            local idInMsg = (text or msg):match("[Aa]chievement (%d+)")
            local line = idInMsg and info and findIdLine(info.File, idInMsg) or nil
            report(info and info.File or eFile or "?", line or (not info and eLine) or nil, prefix .. label .. ": " .. (text or msg))
        end,
    }
    result.tasks = ctx.TasksRun
    if not proxyInstalled then installMissingProxy() end

    -- Tooltip data stores achievement ids without looking them up, so check those explicitly
    for _, entries in pairs(data.TooltipData or {}) do
        if type(entries) == "table" then
            for _, e in ipairs(entries) do
                if type(e) == "table" and type(e.AchievementId) == "number" and rawget(data.Achievements, e.AchievementId) == nil then
                    result.missing[e.AchievementId] = result.missing[e.AchievementId] or {}
                    result.missing[e.AchievementId]["TooltipData"] = true
                end
            end
        end
    end

    for id in pairs(data.Achievements) do result.registered[id] = true; result.achievements = result.achievements + 1 end

    if verbose then
        io.stdout:write(prefix .. "stubbed globals: ", table.concat(ctx:SortedStubbedGlobals(), ", "), "\n")
    end
    return result
end

-------------------------------------------------------------------------------------------------
-- Run both clients, then cross-check dangling references
-------------------------------------------------------------------------------------------------
local clients = clientArg == "Both" and { "Retail", "Classic" } or { clientArg }
local results = {}
for _, c in ipairs(clients) do results[c] = runClient(c) end

local function registeredAnywhere(id)
    for _, r in pairs(results) do if r.registered[id] then return true end end
    return false
end

-- files that can hold a category reference for this client
local function categoryFiles(client)
    local out = {}
    local function walk(dir)
        local p = io.popen('dir /b /s "' .. (root .. "/" .. dir):gsub("/", "\\") .. '\\*CategoryData*.lua" 2>nul')
        if p then
            for line in p:lines() do out[#out + 1] = line:gsub("\\", "/"):sub(#root + 2) end
            p:close()
        end
    end
    walk("DataAddons/Shared")
    walk("DataAddons/" .. client)
    return out
end

for _, c in ipairs(clients) do
    local r = results[c]
    local ids = {}
    for id in pairs(r.missing) do ids[#ids + 1] = id end
    table.sort(ids)
    local catFiles
    for _, id in ipairs(ids) do
        local everywhere = not registeredAnywhere(id)
        for label, file in pairs(r.missing[id]) do
            local clientSpecific = type(file) == "string" and file:match("^DataAddons/" .. c .. "/") ~= nil
            -- an id that exists on the other client and is referenced from a Shared file is skipped by design;
            -- report only ids no client registers, or client-specific files referencing ids that client lacks
            if everywhere or clientSpecific then
                local where, line = file, nil
                if type(file) == "string" then
                    line = findIdLine(file, id)
                else
                    catFiles = catFiles or categoryFiles(c)
                    for _, cf in ipairs(catFiles) do
                        line = findIdLine(cf, id)
                        if line then where = cf break end
                    end
                    if not where or where == true then where = "DataAddons/" .. c .. "/CategoryData.lua" end
                end
                local why = everywhere and "no AchievementData file registers it on any client" or ("it is not registered for " .. c)
                report(where, line, string.format("[%s] %s references achievement %d but %s", c, label, id, why))
            end
        end
    end
end

table.sort(problems)
for _, p in ipairs(problems) do io.stderr:write(p, "\n") end
for _, c in ipairs(clients) do
    local r = results[c]
    io.stdout:write(string.format("load-data %s: %d files, %d patch keys, %d achievements registered, %d tasks run\n", c, r.files, r.keys, r.achievements, r.tasks))
end
io.stdout:write(string.format("load-data: %d problem(s)\n", #problems))
os.exit(#problems == 0 and 0 or 1)