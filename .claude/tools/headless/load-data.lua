---@diagnostic disable: lowercase-global, undefined-global, need-check-nil
-- Headless data pipeline: evaluates the addon's API layer, object classes, data registry and every
-- data file for both clients in plain Lua 5.1, then drives the real task groups the way
-- Data.lua:LoadOnPlayerLogin does, with WoW globals stubbed. Catches what the syntax checker
-- cannot: unknown builder methods, misspelled enum members, malformed entries, duplicate
-- registrations (including AutoFactionSplit pairs), unregistered build versions, category
-- injection targets that do not exist, and category/zone/tooltip references to achievement ids
-- that no data file registers.
--
-- Usage: lua.exe load-data.lua <repoRoot> [Retail|Classic|Both] [-v]
-- Output: one "<path>:<line>: <message>" per problem, a summary line per client, exit 1 on any problem.

local root, clientArg, verbose = ...
assert(root, "usage: load-data.lua <repoRoot> [Retail|Classic|Both] [-v]")
if clientArg == "-v" then verbose, clientArg = "-v", nil end
clientArg = clientArg or "Both"
assert(clientArg == "Retail" or clientArg == "Classic" or clientArg == "Both", "client must be Retail, Classic or Both")
verbose = verbose == "-v"
root = root:gsub("\\", "/"):gsub("/$", "")

local problems, reported = {}, {}
local function report(path, line, message)
    local text = string.format("%s:%s: %s", path, line or 1, message)
    if not reported[text] then
        reported[text] = true
        problems[#problems + 1] = text
    end
end

local function readFile(path)
    local f = assert(io.open(path, "rb"))
    local s = f:read("*a")
    f:close()
    if s:sub(1, 3) == "\239\187\191" then s = s:sub(4) end
    return s
end

local fileCache = {}
local function fileText(rel)
    if not fileCache[rel] then fileCache[rel] = readFile(root .. "/" .. rel) end
    return fileCache[rel]
end

-- first line in rel where the integer id appears as a whole number
local function findIdLine(rel, id)
    local n = 0
    for line in fileText(rel):gmatch("[^\n]*\n?") do
        n = n + 1
        if line:find("%f[%d]" .. id .. "%f[%D]") then return n end
        if line == "" then break end
    end
    return nil
end

-- the vocabulary Data/TemporaryObtainable.lua understands
local obtainableWords = { From = true, Until = true, Date = true, Event = true, Patch = true, Version = true, Before = true, After = true, Once = true, Never = true, Reset = true, ["PvP Season"] = true, ["PvE Season"] = true }

-- registries whose KrowiAF.<name>[key] tables become task groups, and the loaders that process them
local registries = { "AchievementData", "CustomCriteriaData", "EventData", "TooltipData", "PetBattleLinkData", "TransmogSetData", "ZoneData" }

-------------------------------------------------------------------------------------------------
-- One client, one sandboxed global environment
-------------------------------------------------------------------------------------------------
local function runClient(client)
    local result = { client = client, registered = {}, missing = {}, files = 0, achievements = 0, keys = 0, tasks = 0 }
    local prefix = "[" .. client .. "] "
    local gameType = client == "Retail" and "mainline" or "mists"

    -- --- stubs -------------------------------------------------------------------------------
    local stubbedGlobals = {}
    local function Stub(name)
        local mt = {}
        mt.__index = function(t, k)
            local child = Stub(name .. "." .. tostring(k))
            rawset(t, k, child)
            return child
        end
        mt.__call = function() return Stub(name .. "()") end
        mt.__tostring = function() return "<stub " .. name .. ">" end
        mt.__concat = function(a, b) return tostring(a) .. tostring(b) end
        local zero = function() return 0 end
        mt.__add, mt.__sub, mt.__mul, mt.__div, mt.__mod, mt.__pow, mt.__unm = zero, zero, zero, zero, zero, zero, zero
        return setmetatable({}, mt)
    end

    local env = {}
    env._G = env
    -- WoW's Lua extensions used at load time, implemented for real
    env.tinsert, env.tremove, env.sort = table.insert, table.remove, table.sort
    env.format, env.strupper, env.strlower, env.strlen, env.strsub, env.strfind, env.strmatch, env.gsub, env.strrep = string.format, string.upper, string.lower, string.len, string.sub, string.find, string.match, string.gsub, string.rep
    env.floor, env.ceil, env.abs, env.max, env.min = math.floor, math.ceil, math.abs, math.max, math.min
    env.wipe = function(t) for k in pairs(t) do t[k] = nil end return t end
    env.strtrim = function(s) return (s:gsub("^%s+", ""):gsub("%s+$", "")) end
    env.strsplit = function(sep, s) local out = {} for piece in (s .. sep):gmatch("(.-)" .. sep:gsub("%p", "%%%0")) do out[#out + 1] = piece end return unpack(out) end
    env.strjoin = function(sep, ...) return table.concat({ ... }, sep) end
    env.tContains = function(t, v) for _, x in pairs(t) do if x == v then return true end end return false end
    env.tInvert = function(t) local r = {} for k, v in pairs(t) do r[v] = k end return r end
    env.CopyTable = function(t) local r = {} for k, v in pairs(t) do r[k] = type(v) == "table" and env.CopyTable(v) or v end return r end
    env.Mixin = function(o, ...) for i = 1, select("#", ...) do for k, v in pairs((select(i, ...))) do o[k] = v end end return o end
    env.CreateFromMixins = function(...) return env.Mixin({}, ...) end
    env.securecall = function(f, ...) return f(...) end
    env.hooksecurefunc = function() end
    env.issecurevariable = function() return true end
    env.GetLocale = function() return "enUS" end
    env.GetDifficultyInfo = function(id) return "Difficulty " .. tostring(id), "raid", false, false, false, false, id end
    env.GetTitleName = function(id) return "Title " .. tostring(id) end
    env.UnitName = function() return "Player" end
    env.GetBuildInfo = function() return client == "Retail" and "12.1.0" or "5.5.3", "69587", "Sep 4 2026", client == "Retail" and 120100 or 50503 end
    env.EnumUtil = {
        MakeEnum = function(...)
            local e = {}
            for i = 1, select("#", ...) do e[(select(i, ...))] = i end
            return e
        end,
        GenerateNameTranslation = function(e)
            local names = {}
            for k, v in pairs(e) do names[v] = k end
            return function(v) return names[v] end
        end,
    }
    env.WOW_PROJECT_MAINLINE, env.WOW_PROJECT_CLASSIC, env.WOW_PROJECT_MISTS_CLASSIC = 1, 2, 19
    env.WOW_PROJECT_ID = client == "Retail" and 1 or 19

    -- Only names that look like WoW API surface are stubbed; anything else stays nil so typos surface
    local knownGlobals = { CreateFrame = true, LibStub = true, GameTooltip = true, UIParent = true, Enum = true, SlashCmdList = true,
        GetAchievementInfo = true, GetAchievementNumCriteria = true, GetAchievementCriteriaInfo = true, GetAchievementCriteriaInfoByID = true,
        GetCategoryInfo = true, GetCategoryList = true, UnitFactionGroup = true, UnitLevel = true, UnitGUID = true, GetRealmName = true,
        IsAddOnLoaded = true, GetAddOnMetadata = true, GetTime = true, GetServerTime = true, InCombatLockdown = true, GetCurrentArenaSeason = true,
        GetLFGDungeonInfo = true, GetRealZoneText = true, EJ_GetInstanceInfo = true, GetItemInfo = true, GetSpellInfo = true, GetCurrentRegion = true,
        ScrollBoxConstants = true, MenuUtil = true, MenuResponse = true, Settings = true, EventRegistry = true, ChatFrame1 = true, DEFAULT_CHAT_FRAME = true,
        TooltipDataProcessor = true, GameTooltip_AddBlankLineToTooltip = true, GameTooltip_AddNormalLine = true, GameTooltip_AddHighlightLine = true,
        GetCVar = true, SetCVar = true, GetFrameRate = true, debugprofilestop = true, CreateColor = true, CreateColorFromHexString = true,
        WrapTextInColorCode = true, GetAchievementCategory = true, GetPreviousAchievement = true, GetNextAchievement = true, GetAchievementLink = true,
        time = true, date = true, GetCurrentBindingSet = true, GetBindingKey = true, SetBinding = true, SaveBindings = true }
    setmetatable(env, {
        __index = function(t, k)
            local base = rawget(_G, k)
            if base ~= nil then return base end
            if type(k) ~= "string" then return nil end
            if knownGlobals[k] or k:match("^C_%u") or k:match("^LE_") or k:match("^KrowiAF_") or k:match("^[A-Z][A-Z0-9_]+$") or k:match("^Blizzard_") then
                local s = Stub(k)
                rawset(t, k, s)
                stubbedGlobals[#stubbedGlobals + 1] = k
                return s
            end
            return nil
        end,
    })

    -- --- the private addon namespace ----------------------------------------------------------
    local addon = {}
    local function ensureDataTables()
        addon.Data = addon.Data or {}
        for _, name in ipairs({ "AchievementData", "BuildVersionData", "CategoryData", "CustomCriteriaData", "EventData", "PetBattleLinkData", "TabData", "TooltipData", "TransmogSetData", "ZoneData" }) do
            addon.Data[name] = addon.Data[name] or {}
        end
    end
    ensureDataTables()
    addon.L = setmetatable({}, { __index = function(_, k) return k end })
    addon.Metadata = { Title = "Krowi's Achievement Filter", Version = "0.0", Prefix = "KrowiAF" }
    addon.Diagnostics = { TraceEnabled = function() return false end, DebugEnabled = function() return false end, Trace = function() end, Debug = function() end }
    addon.Util = {
        IsMainline = client == "Retail",
        IsClassicWithAchievements = client == "Classic",
        IsMistsClassic = client == "Classic",
        IsWrathClassic = false,
        IsCataClassic = false,
        IsTable = function(v) return type(v) == "table" end,
        IsFunction = function(v) return type(v) == "function" end,
        IsString = function(v) return type(v) == "string" end,
        IsNumber = function(v) return type(v) == "number" end,
        IsBoolean = function(v) return type(v) == "boolean" end,
        TableRemoveByValue = function(t, value)
            for k, v in pairs(t) do
                if v == value then table.remove(t, k) return true end
            end
            return false
        end,
        Colors = Stub("addon.Util.Colors"),
    }
    for _, fn in ipairs({ "GetMapName", "GetInstanceInfoName", "GetLFGDungeonInfo", "GetAreaPoiNameName", "GetAchievmentName", "GetCovenantName" }) do
        addon[fn] = function(id) return fn:gsub("^Get", "") .. " " .. tostring(id) end
    end
    setmetatable(addon, { __index = function(t, k) local s = Stub("addon." .. tostring(k)); rawset(t, k, s); return s end })

    -- --- file list in game load order, honouring [AllowLoadGameType] gates -------------------
    local files = {}
    local function addFromXml(rel)
        local xml = fileText(rel):gsub("<!%-%-.-%-%->", "")
        local dir = rel:match("^(.*)/") or ""
        for tag, file in xml:gmatch("<(%a+)%s+file%s*=%s*[\"']([^\"']+)[\"']") do
            local child = (dir ~= "" and dir .. "/" or "") .. file:gsub("\\", "/")
            if tag == "Include" or child:match("%.xml$") then
                addFromXml(child)
            elseif tag == "Script" then
                files[#files + 1] = child
            end
        end
    end
    for line in fileText("Krowi_AchievementFilter.toc"):gmatch("[^\r\n]+") do
        local entry = line:gsub("#.*$", "")
        local gate = entry:match("%[AllowLoadGameType%s+([^%]]+)%]")
        entry = env.strtrim((entry:gsub("%[.-%]", "")))
        local allowed = true
        if gate then
            allowed = false
            for g in gate:gmatch("[%a_]+") do if g == gameType then allowed = true end end
        end
        if entry ~= "" and allowed then
            entry = entry:gsub("\\", "/")
            if entry:match("%.xml$") then addFromXml(entry) else files[#files + 1] = entry end
        end
    end
    local selected = {}
    for _, rel in ipairs(files) do
        if rel:match("^Api/") or rel:match("^Objects/") or rel == "Data/Data.lua" or rel:match("^DataAddons/") then
            selected[#selected + 1] = rel
        end
    end

    -- --- builder argument checks -------------------------------------------------------------
    local currentFile = "?"
    local function installBuilderChecks()
        local KrowiAF = rawget(env, "KrowiAF")
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
                if problem then report(currentFile, findIdLine(currentFile, self[2]), prefix .. string.format("achievement %s: %s", tostring(self[2]), problem)) end
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
            if type(id) ~= "number" or id <= 0 or id % 1 ~= 0 then report(currentFile, 1, prefix .. "Ach() needs a positive integer id, got " .. tostring(id)) end
            return originalAch(id)
        end
    end

    -- --- load every file, tracking which file introduced each registry key ------------------
    local origin = {}   -- origin[registry][key] = file
    for _, r in ipairs(registries) do origin[r] = {} end
    local function realPath(message)
        return (message:gsub("#(%d+):", function(i) return (selected[tonumber(i)] or ("#" .. i)) .. ":" end))
    end
    local function snapshotKeys()
        local snap = {}
        local KrowiAF = rawget(env, "KrowiAF")
        for _, r in ipairs(registries) do
            snap[r] = {}
            if type(KrowiAF) == "table" and type(KrowiAF[r]) == "table" then for k in pairs(KrowiAF[r]) do snap[r][k] = true end end
        end
        return snap
    end
    local function recordNewKeys(before, rel)
        local KrowiAF = rawget(env, "KrowiAF")
        for _, r in ipairs(registries) do
            if type(KrowiAF) == "table" and type(KrowiAF[r]) == "table" then
                for k in pairs(KrowiAF[r]) do if not before[r][k] then origin[r][k] = rel end end
            end
        end
    end
    for index, rel in ipairs(selected) do
        currentFile = rel
        local chunk, err = loadstring(fileText(rel), "=#" .. index)
        if not chunk then
            report(rel, err:match(":(%d+):"), prefix .. "parse error: " .. (err:match(":%d+: (.*)$") or err))
        else
            setfenv(chunk, env)
            local before = snapshotKeys()
            local ok, runErr = xpcall(function() return chunk("Krowi_AchievementFilter", addon) end, function(e) return { msg = e, trace = debug.traceback("", 2) } end)
            if ok then
                result.files = result.files + 1
                if rel == "Api/AchievementDataBuilder.lua" then installBuilderChecks() end
                if rel == "Data/Data.lua" then ensureDataTables() end   -- Data.lua replaces addon.Data
                recordNewKeys(before, rel)
            else
                local msg = realPath(tostring(runErr.msg))
                local file, line, text = msg:match("^(.-):(%d+): (.*)$")
                report(file or rel, line, prefix .. "runtime error while loading: " .. (text or msg))
                if verbose then io.stderr:write(realPath(runErr.trace), "\n") end
            end
        end
    end

    local KrowiAF = rawget(env, "KrowiAF")
    if type(KrowiAF) ~= "table" or type(KrowiAF.AchievementData) ~= "table" or type(addon.Data.Achievements) ~= "table" then
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

    -- --- drive the real pipeline the way Data.lua:LoadOnPlayerLogin does -----------------------
    local data = addon.Data
    local groupInfo = {}   -- task group table -> { Registry, Key, File }
    for _, r in ipairs(registries) do
        if type(KrowiAF[r]) == "table" then
            for k, group in pairs(KrowiAF[r]) do
                if type(group) == "table" then groupInfo[group] = { Registry = r, Key = tostring(k), File = origin[r][k] or "?" } end
            end
        end
    end
    local currentGroup
    local function runStep(label, file, fn, ...)
        local ok, err = pcall(fn, ...)
        if not ok then
            local msg = realPath(tostring(err))
            local eFile, eLine, text = msg:match("^(.-):(%d+): (.*)$")
            report(file or eFile or "?", (file == nil and eLine) or nil, prefix .. label .. ": " .. (text or msg))
        end
        return ok
    end

    runStep("LoadTabs", "Api/TabDataApi.lua", KrowiAF.LoadTabs)
    runStep("CreateBuildVersions", "Api/BuildVersionDataApi.lua", KrowiAF.CreateBuildVersions)
    for _, fn in ipairs({ "RegisterAchievementDataTasks", "RegisterCustomCriteriaDataTasks", "RegisterCategoryDataTasks", "RegisterEventDataTasks",
        "RegisterTooltipDataTasks", "RegisterPetBattleLinkDataTasks", "RegisterTransmogSetDataTasks", "RegisterZoneDataTasks" }) do
        if type(data[fn]) == "function" then runStep(fn, "Data/Data.lua", data[fn], data) end
    end

    -- Once the achievement groups have run, record every lookup of an unregistered id
    local proxyInstalled = false
    local function installMissingProxy()
        proxyInstalled = true
        setmetatable(data.Achievements, { __index = function(_, id)
            if type(id) == "number" then
                local info = currentGroup and groupInfo[currentGroup]
                local label = info and (info.Registry .. " " .. info.Key) or "CategoryData"
                local file = info and info.File or nil
                result.missing[id] = result.missing[id] or {}
                result.missing[id][label] = file or true
            end
            return nil
        end })
    end

    local groups = data.TasksGroups or {}
    while #groups > 0 do
        local tasks = table.remove(groups)
        currentGroup = tasks
        local info = groupInfo[tasks]
        if not proxyInstalled and not (info and info.Registry == "AchievementData") then installMissingProxy() end
        currentFile = info and info.File or "?"
        for _, task in ipairs(tasks) do
            result.tasks = result.tasks + 1
            local ok, err = pcall(function()
                if type(task) == "function" then task() elseif type(task) == "table" then task[1](unpack(task, 2, #task)) end
            end)
            if not ok then
                local msg = realPath(tostring(err))
                local eFile, eLine, text = msg:match("^(.-):(%d+): (.*)$")
                local label = info and (info.Registry .. " " .. info.Key) or "CategoryData"
                local idInMsg = (text or msg):match("[Aa]chievement (%d+)")
                local line = idInMsg and info and findIdLine(info.File, idInMsg) or nil
                report(info and info.File or eFile or "?", line or (not info and eLine) or nil, prefix .. label .. ": " .. (text or msg))
            end
        end
    end
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
        table.sort(stubbedGlobals)
        io.stdout:write(prefix .. "stubbed globals: ", table.concat(stubbedGlobals, ", "), "\n")
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