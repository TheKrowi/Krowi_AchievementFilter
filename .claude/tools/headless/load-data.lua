---@diagnostic disable: lowercase-global
-- Headless data loader: evaluates the addon's API layer and every data file for one client in plain
-- Lua 5.1, the way the game would, with WoW globals stubbed. Catches what the syntax checker cannot:
-- unknown builder methods, bad enum references, malformed entries, duplicate achievement IDs and
-- malformed patch keys, all before the game ever loads the files.
--
-- Usage: lua.exe load-data.lua <repoRoot> <Retail|Classic> [-v]
-- Output: one "<path>:<line>: <message>" per problem, a summary line, exit 1 on any problem.

local root, client, verbose = ...
assert(root and (client == "Retail" or client == "Classic"), "usage: load-data.lua <repoRoot> <Retail|Classic> [-v]")
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

-------------------------------------------------------------------------------------------------
-- WoW environment stubs
-------------------------------------------------------------------------------------------------
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

-- WoW's Lua extensions that data and API code use at load time, implemented for real
tinsert, tremove = table.insert, table.remove
format, strupper, strlower, strlen, strsub, strfind, strmatch, gsub, strrep = string.format, string.upper, string.lower, string.len, string.sub, string.find, string.match, string.gsub, string.rep
floor, ceil, abs, max, min = math.floor, math.ceil, math.abs, math.max, math.min
function wipe(t) for k in pairs(t) do t[k] = nil end return t end
function strtrim(s) return (s:gsub("^%s+", ""):gsub("%s+$", "")) end
function strsplit(sep, s) local out = {} for piece in (s .. sep):gmatch("(.-)" .. sep:gsub("%p", "%%%0")) do out[#out + 1] = piece end return unpack(out) end
function strjoin(sep, ...) return table.concat({...}, sep) end
function tContains(t, v) for _, x in pairs(t) do if x == v then return true end end return false end
function tInvert(t) local r = {} for k, v in pairs(t) do r[v] = k end return r end
function CopyTable(t) local r = {} for k, v in pairs(t) do r[k] = type(v) == "table" and CopyTable(v) or v end return r end
function Mixin(o, ...) for i = 1, select("#", ...) do for k, v in pairs((select(i, ...))) do o[k] = v end end return o end
function CreateFromMixins(...) return Mixin({}, ...) end
function securecall(f, ...) return f(...) end
function hooksecurefunc() end
function issecurevariable() return true end
function GetLocale() return "enUS" end
function GetDifficultyInfo(id) return "Difficulty " .. tostring(id), "raid", false, false, false, false, id end
function GetTitleName(id) return "Title " .. tostring(id) end
function UnitName() return "Player" end
function GetBuildInfo() return client == "Retail" and "12.1.0" or "5.5.3", "69587", "Sep 4 2026", client == "Retail" and 120100 or 50503 end
EnumUtil = {
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
WOW_PROJECT_MAINLINE, WOW_PROJECT_CLASSIC, WOW_PROJECT_MISTS_CLASSIC = 1, 2, 19
WOW_PROJECT_ID = client == "Retail" and WOW_PROJECT_MAINLINE or WOW_PROJECT_MISTS_CLASSIC

-- Only names that look like WoW API surface are stubbed; anything else stays nil so typos surface
local knownGlobals = { CreateFrame = true, LibStub = true, GameTooltip = true, UIParent = true, Enum = true, SlashCmdList = true,
    GetAchievementInfo = true, GetAchievementNumCriteria = true, GetAchievementCriteriaInfo = true, GetAchievementCriteriaInfoByID = true,
    GetCategoryInfo = true, GetCategoryList = true, UnitFactionGroup = true, UnitLevel = true, UnitName = true, UnitGUID = true, GetRealmName = true,
    IsAddOnLoaded = true, GetAddOnMetadata = true, GetTime = true, GetServerTime = true, InCombatLockdown = true, GetCurrentArenaSeason = true,
    GetLFGDungeonInfo = true, GetRealZoneText = true, EJ_GetInstanceInfo = true, GetItemInfo = true, GetSpellInfo = true, GetCurrentRegion = true,
    ScrollBoxConstants = true, MenuUtil = true, MenuResponse = true, Settings = true, EventRegistry = true, ChatFrame1 = true, DEFAULT_CHAT_FRAME = true,
    TooltipDataProcessor = true, GameTooltip_AddBlankLineToTooltip = true, GameTooltip_AddNormalLine = true, GameTooltip_AddHighlightLine = true }
setmetatable(_G, {
    __index = function(t, k)
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

-------------------------------------------------------------------------------------------------
-- The private addon namespace as the data files see it
-------------------------------------------------------------------------------------------------
local addon = {}
addon.Data = {}
for _, name in ipairs({ "AchievementData", "BuildVersionData", "CategoryData", "CustomCriteriaData", "EventData", "PetBattleLinkData", "TabData", "TooltipData", "TransmogSetData", "ZoneData" }) do
    addon.Data[name] = {}
end
addon.L = setmetatable({}, { __index = function(_, k) return k end })
addon.Metadata = { Title = "Krowi's Achievement Filter", Version = "0.0" }
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
}
for _, fn in ipairs({ "GetMapName", "GetInstanceInfoName", "GetLFGDungeonInfo", "GetAreaPoiNameName", "GetAchievmentName", "GetCovenantName" }) do
    addon[fn] = function(id) return fn:gsub("^Get", "") .. " " .. tostring(id) end
end
setmetatable(addon, { __index = function(t, k) local s = Stub("addon." .. tostring(k)); rawset(t, k, s); return s end })

-------------------------------------------------------------------------------------------------
-- File list in game load order, honouring [AllowLoadGameType] gates, limited to Api + DataAddons
-------------------------------------------------------------------------------------------------
local gameType = client == "Retail" and "mainline" or "mists"

local function readFile(path)
    local f = assert(io.open(path, "rb"))
    local s = f:read("*a")
    f:close()
    if s:sub(1, 3) == "\239\187\191" then s = s:sub(4) end
    return s
end

local files = {}
local function addFromXml(rel)
    local xml = readFile(root .. "/" .. rel):gsub("<!%-%-.-%-%->", "")
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
for line in readFile(root .. "/Krowi_AchievementFilter.toc"):gmatch("[^\r\n]+") do
    local entry = line:gsub("#.*$", "")
    local gate = entry:match("%[AllowLoadGameType%s+([^%]]+)%]")
    entry = strtrim((entry:gsub("%[.-%]", "")))
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
    if rel:match("^Api/") or rel:match("^DataAddons/") then selected[#selected + 1] = rel end
end

-------------------------------------------------------------------------------------------------
-- Load, tracking which file introduced each AchievementData key
-------------------------------------------------------------------------------------------------
local keyOrigin = {}
local loaded = 0
local currentFile = "?"

-- The builder accepts nil arguments silently (a misspelled enum member is just nil), so once the
-- API layer is up, wrap the methods whose arguments have a known shape and report bad ones
local function installBuilderChecks()
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
            if problem then report(currentFile, 1, string.format("achievement %s: %s", tostring(self[2]), problem)) end
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
    wrap("Mount", numbers("Mount"))
    wrap("Pet", numbers("Pet"))
    wrap("HousingDecor", numbers("HousingDecor"))
    wrap("CreatureDisplay", numbers("CreatureDisplay"))
    local originalAch = KrowiAF.Ach
    KrowiAF.Ach = function(id)
        if type(id) ~= "number" or id <= 0 or id % 1 ~= 0 then report(currentFile, 1, "Ach() needs a positive integer id, got " .. tostring(id)) end
        return originalAch(id)
    end
end
-- Lua truncates chunk names longer than 60 characters, so files load under "=#<index>" and error
-- messages are mapped back to the real path here
local function realPath(message)
    return (message:gsub("#(%d+):", function(i) return selected[tonumber(i)] .. ":" end))
end
for index, rel in ipairs(selected) do
    currentFile = rel
    local source = readFile(root .. "/" .. rel)
    local chunk, err = loadstring(source, "=#" .. index)
    if not chunk then
        report(rel, err:match(":(%d+):"), "parse error: " .. (err:match(":%d+: (.*)$") or err))
    else
        local before = {}
        if KrowiAF and KrowiAF.AchievementData then for k in pairs(KrowiAF.AchievementData) do before[k] = true end end
        local ok, runErr = xpcall(function() return chunk("Krowi_AchievementFilter", addon) end, function(e) return { msg = e, trace = debug.traceback("", 2) } end)
        if ok then
            loaded = loaded + 1
            if rel == "Api/AchievementDataBuilder.lua" then installBuilderChecks() end
            if KrowiAF and KrowiAF.AchievementData then
                for k in pairs(KrowiAF.AchievementData) do if not before[k] then keyOrigin[k] = rel end end
            end
        else
            local msg = realPath(tostring(runErr.msg))
            local file, line, text = msg:match("^(.-):(%d+): (.*)$")
            report(file or rel, line, "runtime error while loading: " .. (text or msg))
            if verbose then io.stderr:write(realPath(runErr.trace), "\n") end
        end
    end
end

-------------------------------------------------------------------------------------------------
-- Data checks on what was registered
-------------------------------------------------------------------------------------------------
local totalEntries, seen = 0, {}
if type(KrowiAF) ~= "table" or type(KrowiAF.AchievementData) ~= "table" or type(KrowiAF.Enum) ~= "table" or type(KrowiAF.Enum.RewardType) ~= "table" then
    report("Api/API.lua", 1, "the API layer did not initialise KrowiAF.AchievementData and KrowiAF.Enum.RewardType; data checks skipped")
    KrowiAF = { AchievementData = {}, Enum = { RewardType = {} } }
end
local validRewardTypes = {}
for _, v in pairs(KrowiAF.Enum.RewardType) do validRewardTypes[v] = true end
-- the vocabulary Data/TemporaryObtainable.lua understands
local obtainableWords = { From = true, Until = true, Date = true, Event = true, Patch = true, Version = true, Before = true, After = true, Once = true, Never = true, Reset = true, ["PvP Season"] = true, ["PvE Season"] = true }

local sortedKeys = {}
for k in pairs(KrowiAF.AchievementData) do sortedKeys[#sortedKeys + 1] = k end
table.sort(sortedKeys)
for _, key in ipairs(sortedKeys) do
    local origin = keyOrigin[key] or "?"
    local isShared = origin:match("^DataAddons/Shared/") ~= nil
    local major, minor, patch, suffix = tostring(key):match("^(%d%d)_(%d%d)_(%d%d)(.*)$")
    if not major then
        report(origin, 1, string.format("AchievementData key %q is not EE_PP_SS or EE_PP_SS_S", tostring(key)))
    elseif isShared and suffix ~= "_S" then
        report(origin, 1, string.format("AchievementData key %q lives in a Shared file but lacks the _S suffix", key))
    elseif not isShared and suffix ~= "" then
        report(origin, 1, string.format("AchievementData key %q has the Shared suffix but lives in a %s file", key, client))
    end
    local entries = KrowiAF.AchievementData[key]
    if type(entries) ~= "table" then
        report(origin, 1, string.format("AchievementData[%q] is not a table", tostring(key)))
    else
        for i, entry in ipairs(entries) do
            totalEntries = totalEntries + 1
            if type(entry) ~= "table" or entry[1] ~= KrowiAF.AddAchievementData or type(entry[2]) ~= "number" then
                report(origin, 1, "entry " .. i .. " of key " .. key .. " is not an Ach(id) builder result")
            else
                local id, extras = entry[2], entry[3]
                if seen[id] then
                    report(origin, 1, string.format("achievement %d registered twice for %s: also in %s", id, client, seen[id]))
                else
                    seen[id] = origin
                end
                if extras then
                    if extras.RewardType then
                        for _, rt in ipairs(extras.RewardType) do
                            if not validRewardTypes[rt] then report(origin, 1, string.format("achievement %d has unknown RewardType %s", id, tostring(rt))) end
                        end
                    end
                    for _, item in ipairs(extras) do
                        if type(item) == "table" then
                            local head = item[1]
                            if head == "PvE Season" or head == "PvP Season" then
                                if type(item[2]) ~= "number" then report(origin, 1, string.format("achievement %d: %s needs a numeric season, got %s", id, head, tostring(item[2]))) end
                            elseif type(head) == "string" then
                                for _, word in ipairs(item) do
                                    if type(word) == "string" and not obtainableWords[word] then
                                        report(origin, 1, string.format("achievement %d: Obtainable() uses unknown word %q", id, word))
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

-------------------------------------------------------------------------------------------------
-- Report
-------------------------------------------------------------------------------------------------
table.sort(problems)
for _, p in ipairs(problems) do io.stderr:write(p, "\n") end
if verbose then
    table.sort(stubbedGlobals)
    io.stdout:write("stubbed globals: ", table.concat(stubbedGlobals, ", "), "\n")
end
local keyCount = #sortedKeys
io.stdout:write(string.format("load-data %s: %d files loaded, %d patch keys, %d achievements, %d problem(s)\n", client, loaded, keyCount, totalEntries, #problems))
os.exit(#problems == 0 and 0 or 1)