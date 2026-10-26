-- Headless load of Krowi_AchievementFilter's options tables for one client, walked into a plain Lua tree.
-- Usage: lua.exe dump-options.lua <repoRoot> <Retail|Classic> <out.lua> <globalstrings enUS.js>
-- Read-only on the repo. Writes only <out.lua>.

local root, client, outPath, gsPath = ...
root = root:gsub("\\", "/"):gsub("/$", "")
assert(client == "Retail" or client == "Classic")

local log = {}
local function Log(fmt, ...) log[#log + 1] = string.format(fmt, ...) end

local function readFile(p)
    local f = io.open(p, "rb")
    if not f then return nil end
    local s = f:read("*a")
    f:close()
    if s:sub(1, 3) == "\239\187\191" then s = s:sub(4) end
    return s
end

-------------------------------------------------------------------------------------------------
-- Blizzard GlobalStrings (enUS) from the ketho.wow-api extension
-------------------------------------------------------------------------------------------------
local GS = {}
do
    local s = assert(readFile(gsPath), "globalstrings not found")
    local n = 0
    for k, v in s:gmatch('\n%s+"?([%w_]+)"?: String%.raw `(.-)`,') do
        GS[k] = v
        n = n + 1
    end
    Log("globalstrings: %d", n)
end

-------------------------------------------------------------------------------------------------
-- Environment
-------------------------------------------------------------------------------------------------
local stubCount = {}
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
    mt.__lt = function() return false end
    mt.__le = function() return false end
    mt.IsStub = true
    return setmetatable({}, mt)
end
local function IsStub(v)
    local mt = type(v) == "table" and getmetatable(v)
    return mt and rawget(mt, "IsStub") == true
end

local env = {}
env._G = env
local nilGlobals = { ElvUI = true, GW2_ADDON = true, EllesmereUI = true, ZGV = true, IAT_HasAchievement = true,
    IAT_DisplayAchievement = true, BetterWardrobeCollectionFrame = true, WOW_PROJECT_CAMELOT = true, LIBSTUB_MAJOR = true,
    KROWI_LIBMAN = true, BINDING_HEADER_KrowiAF = true, GAME_LOCALE = true, LibStub = true }

setmetatable(env, {
    __index = function(t, k)
        local base = rawget(_G, k)
        if base ~= nil then return base end
        if type(k) ~= "string" then return nil end
        if nilGlobals[k] then return nil end
        if GS[k] ~= nil then
            rawset(t, k, GS[k])
            return GS[k]
        end
        if k:match("^KrowiAF_") or k:match("^BINDING_") then return nil end
        if k == "FONT_COLOR_CODE_CLOSE" then return "|r" end
        if k:match("_FONT_COLOR_CODE$") then return "|cffffffff" end
        if k:match("^%u") then
            local s = Stub(k)
            rawset(t, k, s)
            stubCount[k] = true
            return s
        end
        return nil
    end,
})

env.print = function() end
env.tinsert, env.tremove, env.sort = table.insert, table.remove, table.sort
env.format, env.strupper, env.strlower, env.strlen, env.strsub, env.strfind, env.strmatch, env.gsub, env.strrep, env.strbyte, env.strchar, env.strrev =
    string.format, string.upper, string.lower, string.len, string.sub, string.find, string.match, string.gsub, string.rep, string.byte, string.char, string.reverse
env.gmatch = string.gmatch
env.floor, env.ceil, env.abs, env.max, env.min, env.sqrt, env.mod = math.floor, math.ceil, math.abs, math.max, math.min, math.sqrt, math.fmod
env.random = math.random
env.wipe = function(t) for k in pairs(t) do t[k] = nil end return t end
env.strtrim = function(s) return (s:gsub("^%s+", ""):gsub("%s+$", "")) end
local function splitPlain(sep, s)
    local out, start = {}, 1
    while true do
        local i, j = string.find(s, sep, start, true)
        if not i then out[#out + 1] = s:sub(start) break end
        out[#out + 1] = s:sub(start, i - 1)
        start = j + 1
    end
    return out
end
env.strsplit = function(sep, s) return unpack(splitPlain(sep, s)) end
env.strsplittable = function(sep, s) return splitPlain(sep, s) end
env.strjoin = function(sep, ...) return table.concat({ ... }, sep) end
env.strconcat = function(...) return table.concat({ ... }) end
env.tostringall = function(...) local r = {} for i = 1, select("#", ...) do r[i] = tostring((select(i, ...))) end return unpack(r, 1, select("#", ...)) end
env.tContains = function(t, v) for _, x in pairs(t) do if x == v then return true end end return false end
env.tIndexOf = function(t, v) for i, x in ipairs(t) do if x == v then return i end end end
env.tDeleteItem = function(t, v) local i = 1 while t[i] do if t[i] == v then table.remove(t, i) else i = i + 1 end end end
env.tInvert = function(t) local r = {} for k, v in pairs(t) do r[v] = k end return r end
env.GetKeysArray = function(t) local r = {} for k in pairs(t) do r[#r + 1] = k end return r end
env.CopyTable = function(t) local r = {} for k, v in pairs(t) do r[k] = type(v) == "table" and env.CopyTable(v) or v end return r end
env.Mixin = function(o, ...) for i = 1, select("#", ...) do local m = select(i, ...) if type(m) == "table" then for k, v in pairs(m) do o[k] = v end end end return o end
env.CreateFromMixins = function(...) return env.Mixin({}, ...) end
env.securecall = function(f, ...) if type(f) == "function" then return f(...) end end
env.securecallfunction = env.securecall
env.hooksecurefunc = function() end
env.issecurevariable = function() return true end
env.issecretvalue = function() return false end
env.canaccesstable = function() return true end
env.canaccessvalue = function() return true end
env.geterrorhandler = function() return function(e) Log("errorhandler: %s", tostring(e)) end end
env.seterrorhandler = function() end
env.GetLocale = function() return "enUS" end
env.UnitName = function() return "Player" end
env.GetRealmName = function() return "Realm" end
env.GetNormalizedRealmName = function() return "Realm" end
env.UnitClass = function() return "Warrior", "WARRIOR", 1 end
env.UnitRace = function() return "Human", "Human", 1 end
env.UnitFactionGroup = function() return "Alliance", "Alliance" end
env.UnitLevel = function() return 80 end
env.UnitGUID = function() return "Player-1-00000001" end
env.GetCurrentRegion = function() return 3 end
env.GetCurrentRegionName = function() return "EU" end
env.InCombatLockdown = function() return false end
env.IsLoggedIn = function() return false end
env.GetBindingKey = function() return nil end
env.GetCurrentBindingSet = function() return 1 end
env.SetBinding = function() end
env.SaveBindings = function() end
env.GetTime = function() return os.clock() end
env.GetServerTime = function() return os.time() end
env.debugprofilestop = function() return os.clock() * 1000 end
local fixedNow = os.time({ year = 2026, month = 10, day = 25, hour = 21, min = 30, sec = 0 })
env.time = function(t) if t then return os.time(t) end return fixedNow end
local safeDate = function(fmt, t)
    fmt = fmt or "%c"
    fmt = fmt:gsub("%%R", "%%H:%%M")
    if fmt:find("%%[^aAbBcdHIjmMpSUwWxXyYZ%%]") then return fmt end
    return os.date(fmt, t)
end
env.date = safeDate
env.GetBuildInfo = function()
    if client == "Retail" then return "12.1.5", "65000", "Oct 1 2026", 120105 end
    return "5.5.4", "65000", "Oct 1 2026", 50504
end
env.WOW_PROJECT_MAINLINE, env.WOW_PROJECT_CLASSIC, env.WOW_PROJECT_BURNING_CRUSADE_CLASSIC = 1, 2, 5
env.WOW_PROJECT_WRATH_CLASSIC, env.WOW_PROJECT_CATACLYSM_CLASSIC, env.WOW_PROJECT_MISTS_CLASSIC = 11, 14, 19
env.WOW_PROJECT_ID = client == "Retail" and 1 or 19
env.CALENDAR_WEEKDAY_NAMES = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
env.CALENDAR_FULLDATE_MONTH_NAMES = { "January", "February", "March", "April", "May", "June", "July", "August", "September",
    "October", "November", "December" }
env.CALENDAR_FIRST_WEEKDAY = 1
local covenants = { "Kyrian", "Venthyr", "Night Fae", "Necrolord" }
local C_Covenants = Stub("C_Covenants")
rawset(C_Covenants, "GetCovenantData", function(id) return { name = covenants[id] or ("Covenant " .. tostring(id)) } end)
env.C_Covenants = C_Covenants
env.EnumUtil = {
    MakeEnum = function(...) local e = {} for i = 1, select("#", ...) do e[(select(i, ...))] = i end return e end,
    GenerateNameTranslation = function(e) local names = {} for k, v in pairs(e) do names[v] = k end return function(v) return names[v] end end,
}

-- toc metadata
local toc = readFile(root .. "/Krowi_AchievementFilter.toc")
local tocMeta = {}
for line in toc:gmatch("[^\r\n]+") do
    local k, v = line:match("^##%s*([^:]+):%s*(.-)%s*$")
    if k then tocMeta[k] = v end
end
local C_AddOns = Stub("C_AddOns")
rawset(C_AddOns, "GetAddOnMetadata", function(name, field)
    if name == "Krowi_AchievementFilter" then return tocMeta[field] end
    return nil
end)
rawset(C_AddOns, "IsAddOnLoaded", function(name) return name == "Krowi_AchievementFilter" end)
rawset(C_AddOns, "GetAddOnEnableState", function() return 0 end)
env.C_AddOns = C_AddOns
env.GetAddOnMetadata = C_AddOns.GetAddOnMetadata
env.IsAddOnLoaded = C_AddOns.IsAddOnLoaded

-------------------------------------------------------------------------------------------------
-- Fake AceConfig family: records registrations
-------------------------------------------------------------------------------------------------
local registry, blizOptions = {}, {}
local function InstallFakes(LibStub)
    local function fallback(lib, name)
        return setmetatable(lib, { __index = function(t, k) local s = Stub(name .. "." .. tostring(k)) rawset(t, k, s) return s end })
    end
    local aceConfig = LibStub:NewLibrary("AceConfig-3.0", 999999)
    aceConfig.RegisterOptionsTable = function(self, appName, options) registry[appName] = options end
    fallback(aceConfig, "AceConfig-3.0")
    local aceReg = LibStub:NewLibrary("AceConfigRegistry-3.0", 999999)
    aceReg.RegisterOptionsTable = aceConfig.RegisterOptionsTable
    aceReg.GetOptionsTable = function(self, appName, uiType, uiName)
        local t = registry[appName]
        if type(t) == "function" then t = t(uiType or "dialog", uiName or "x", appName) end
        return t
    end
    aceReg.NotifyChange = function() end
    fallback(aceReg, "AceConfigRegistry-3.0")
    local aceDialog = LibStub:NewLibrary("AceConfigDialog-3.0", 999999)
    aceDialog.BlizOptionsIDMap = {}
    aceDialog.AddToBlizOptions = function(self, appName, name, parent)
        blizOptions[#blizOptions + 1] = { AppName = appName, Name = name, Parent = parent }
        return Stub("BlizPanel." .. appName), appName
    end
    fallback(aceDialog, "AceConfigDialog-3.0")
end

local fakeLibs = {}
local function PatchLibStub()
    local LS = rawget(env, "LibStub")
    if not LS or LS.__patched then return end
    LS.__patched = true
    local orig = LS.GetLibrary
    function LS:GetLibrary(major, silent)
        if self.libs[major] then return self.libs[major], self.minors[major] end
        if not fakeLibs[major] then
            fakeLibs[major] = Stub("Lib:" .. tostring(major))
            Log("stub library: %s", tostring(major))
        end
        return fakeLibs[major]
    end
    getmetatable(LS).__call = function(self, major, silent) return self:GetLibrary(major, silent) end
    InstallFakes(LS)
end

-------------------------------------------------------------------------------------------------
-- File list in load order
-------------------------------------------------------------------------------------------------
local gameType = client == "Retail" and "mainline" or "mists"
local files = {}
local function exists(rel) local f = io.open(root .. "/" .. rel, "rb") if f then f:close() return true end return false end
local function addFromXml(rel)
    local text = readFile(root .. "/" .. rel)
    if not text then Log("missing xml: %s", rel) return end
    local xml = text:gsub("<!%-%-.-%-%->", "")
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
for line in toc:gmatch("[^\r\n]+") do
    if not line:match("^##") then
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
end

local skip = { "^Libs/AceGUI%-3%.0/", "^Libs/AceConfig%-3%.0/", "^Libs/TaintLess/", "^Libs/LibSerialize/", "^Libs/LibDeflate/",
    "^Libs/AceSerializer%-3%.0/", "^Tests/" }
local function skipped(rel)
    for _, p in ipairs(skip) do if rel:match(p) then return true end end
    -- localization: only enUS and the Shared helpers
    if rel:match("Localization/") then
        local base = rel:match("([^/]+)%.lua$")
        if not (base:match("^enUS") or base == "Shared") then return true end
    end
    return false
end

-- normalise ".." segments
local function normalise(p)
    local parts = {}
    for part in p:gmatch("[^/]+") do
        if part == ".." then parts[#parts] = nil elseif part ~= "." then parts[#parts + 1] = part end
    end
    return table.concat(parts, "/")
end

local addon = {}
local loaded, failed = 0, 0
for _, rel in ipairs(files) do
    rel = normalise(rel)
    if not skipped(rel) then
        local text = readFile(root .. "/" .. rel)
        if not text then
            Log("missing file: %s", rel)
        else
            local chunk, err = loadstring(text, "@" .. rel)
            if not chunk then
                Log("PARSE %s: %s", rel, err)
                failed = failed + 1
            else
                setfenv(chunk, env)
                local ok, runErr = pcall(chunk, "Krowi_AchievementFilter", addon)
                if ok then loaded = loaded + 1 else failed = failed + 1 Log("LOAD %s: %s", rel, tostring(runErr)) end
            end
            if rel:match("LibStub%.lua$") then PatchLibStub() end
        end
    end
end
Log("files loaded %d, failed %d", loaded, failed)

-------------------------------------------------------------------------------------------------
-- The ADDON_LOADED sequence of Krowi_AchievementFilter.lua, each step guarded
-------------------------------------------------------------------------------------------------
local KrowiAF = rawget(env, "KrowiAF")
local function Step(label, fn)
    local ok, err = pcall(fn)
    if not ok then Log("STEP %s: %s", label, tostring(err)) end
end
-- Blizzard's event scheduler names: none headless, so the data's own names are used
pcall(function() addon.Data.EventScheduler.GetName = function() return nil end end)

Step("Diagnostics.Load", function() addon.Diagnostics.Load() end)
Step("LoadTabs", function() KrowiAF.LoadTabs() end)
Step("SpecialCategories.InjectDynamicOptions", function() addon.SpecialCategories.InjectDynamicOptions() end)
Step("InjectEventDataDynamicOptions", function() KrowiAF.InjectEventDataDynamicOptions() end)
Step("InjectTabDataDynamicOptions", function() KrowiAF.InjectTabDataDynamicOptions() end)
Step("AchievementFrameHeader:InjectDynamicOptions", function() addon.Gui.AchievementFrameHeader:InjectDynamicOptions() end)
Step("Filters:InjectDefaults", function() addon.Filters:InjectDefaults() end)
-- plugins in registration-table order, each guarded
local pluginOrder = {}
for name, plugin in next, KrowiAF.PluginsApi.Plugins do
    pluginOrder[#pluginOrder + 1] = name
    if type(plugin.InjectOptions) == "function" then
        Step("InjectOptions " .. name, function() plugin:InjectOptions() end)
    end
end
-- addon.Options:Load(true), each options table guarded
local options = addon.Options
Step("AceDB:New", function()
    options.db = env.LibStub("AceDB-3.0"):New(addon.Metadata.Prefix .. "_Options", options.Defaults, true)
end)
if not (options and options.OptionsTables) then
    io.stderr:write(table.concat(log, "\n"), "\n")
    error("addon.Options.OptionsTables missing")
end
for i, ot in ipairs(options.OptionsTables) do
    if type(ot.RegisterOptionsTable) == "function" then Step("RegisterOptionsTable #" .. i, ot.RegisterOptionsTable) end
    if type(ot.PostLoad) == "function" then Step("PostLoad #" .. i, ot.PostLoad) end
end

-- what the real flow runs right after Options:Load, as far as the options read it
for name, plugin in next, KrowiAF.PluginsApi.Plugins do
    if type(plugin.Load) == "function" then Step("Load plugin " .. name, function() plugin:Load() end) end
end
Step("Tutorials.Load", function() addon.Tutorials.Load() end)

do
    local d = {}
    for k, v in pairs(options.Defaults.profile.Tabs) do
        local sub = {}
        for k2 in pairs(v) do sub[#sub + 1] = tostring(k2) end
        d[#d + 1] = k .. "{" .. table.concat(sub, ",") .. "}"
    end
    Log("Defaults.Tabs: %s", table.concat(d, " "))
    local ok, err = pcall(function()
        local p = {}
        for k in pairs(options.db.profile.Tabs) do p[#p + 1] = tostring(k) end
        Log("db.Tabs: %s", table.concat(p, " "))
    end)
    if not ok then Log("db.Tabs error %s", tostring(err)) end
end

if not (addon.Tutorials and addon.Tutorials.FeaturesTutorial) then
    pcall(function() addon.Tutorials.FeaturesTutorial = { HasUnviewedPages = function() return false end, Pages = {} } end)
end
-- for the walk: no achievement data headless, so a desc built from one keeps its {placeholders}
rawset(env, "GetAchievementInfo", function() return nil end)
rawset(env, "GetAchievementCriteriaInfo", function() return nil end)

-------------------------------------------------------------------------------------------------
-- Known string values, to tell a plain localized string from a computed one
-------------------------------------------------------------------------------------------------
local known = {}
local function addKnown(t)
    if type(t) ~= "table" then return end
    for k, v in pairs(t) do
        if type(v) == "string" then known[v] = true end
        if v == true and type(k) == "string" then known[k] = true end
    end
end
addKnown(addon.L)
pcall(function() addKnown(addon.Util.L) end)
for _, v in pairs(GS) do known[v] = true end

-------------------------------------------------------------------------------------------------
-- Function source, to read which saved setting a get/disabled/hidden function looks at
-------------------------------------------------------------------------------------------------
local fileLines = {}
local function lines(rel)
    if not fileLines[rel] then
        local t = {}
        local text = readFile(root .. "/" .. rel) or ""
        for l in (text .. "\n"):gmatch("([^\n]*)\n") do t[#t + 1] = (l:gsub("\r$", "")) end
        fileLines[rel] = t
    end
    return fileLines[rel]
end
local function FuncSource(f)
    if type(f) ~= "function" then return nil end
    local info = debug.getinfo(f, "S")
    if not info or not info.source or info.source:sub(1, 1) ~= "@" then return nil end
    local rel = info.source:sub(2)
    local ls = lines(rel)
    local out = {}
    for i = info.linedefined, info.lastlinedefined do out[#out + 1] = ls[i] end
    return table.concat(out, "\n"), rel, info.linedefined
end
local function ProfilePaths(src)
    local out, seen = {}, {}
    if not src then return out end
    for p in src:gmatch("addon%.Options%.db%.profile%.([%w_%.]+)") do
        p = p:gsub("%.$", "")
        if not seen[p] then seen[p] = true out[#out + 1] = p end
    end
    return out
end
-- the expression a one-expression function returns
local function ReturnExpr(src)
    if not src then return nil end
    local body = src:match("function%s*%b()%s*(.-)%s*end[%s,;%)]*$") or src
    local expr = body:match("^return%s+(.-)%s*;?%s*$")
    if not expr then expr = body:match("return%s+(.-)%s*;?%s*$") end
    return expr
end

-------------------------------------------------------------------------------------------------
-- Walk
-------------------------------------------------------------------------------------------------
local widthUnit = (options.WidthMultiplier or 1)
local function Clean(s)
    if type(s) ~= "string" then return s end
    s = s:gsub("|c[nN][%w_]*:", "")
    s = s:gsub("|c%x%x%x%x%x%x%x%x", "")
    s = s:gsub("|r", "")
    s = s:gsub("|T.-|t", "")
    s = s:gsub("|A.-|a", "")
    s = s:gsub("|n", "\n")
    return s
end

local function Resolve(v, info, methodField)
    if methodField and type(v) == "string" and type(info.handler) == "table" and type(info.handler[v]) == "function" then
        local ok, r = pcall(info.handler[v], info.handler, info)
        if not ok then return nil, true, "error: " .. tostring(r) end
        return r, true
    end
    if type(v) == "function" then
        local ok, r = pcall(v, info)
        if not ok then return nil, true, "error: " .. tostring(r) end
        if IsStub(r) then return nil, true, "stub: " .. tostring(r) end
        return r, true
    end
    if IsStub(v) then return nil, false, "stub: " .. tostring(v) end
    return v, false
end

local function MakeInfo(path, node, appName, rootTable, handler)
    local info = {}
    for i, k in ipairs(path) do info[i] = k end
    info.option = node
    info.options = rootTable
    info.appName = appName
    info.type = node.type
    info.arg = node.arg
    info.handler = handler
    return info
end

local function SortedArgs(args, info)
    local list = {}
    for k, v in pairs(args) do
        if type(v) == "table" and not IsStub(v) then
            local order = v.order
            if type(order) == "function" then local ok, r = pcall(order, info) order = ok and r or 100 end
            if type(order) ~= "number" then order = 100 end
            local name = v.name
            if type(name) == "function" then local ok, r = pcall(name, info) name = ok and r or "" end
            if type(name) ~= "string" then name = "" end
            list[#list + 1] = { key = k, node = v, order = order, sname = name }
        end
    end
    table.sort(list, function(a, b)
        local oa, ob = a.order, b.order
        if oa == ob then
            if a.sname:upper() == b.sname:upper() then return tostring(a.key) < tostring(b.key) end
            return a.sname:upper() < b.sname:upper()
        end
        if oa < 0 then
            if ob >= 0 then return false end
        elseif ob < 0 then
            return true
        end
        return oa < ob
    end)
    return list
end

local function Walk(key, node, path, appName, rootTable, handler)
    handler = node.handler or handler
    local info = MakeInfo(path, node, appName, rootTable, handler)
    local out = { key = tostring(key), type = node.type, order = node.order }

    local name, nameFn, nameErr = Resolve(node.name, info)
    if nameErr then out.nameError = nameErr end
    out.rawName = name
    out.name = Clean(name)
    out.nameIsFunction = nameFn
    out.nameKnown = type(name) == "string" and (known[name] or name == "") or false

    local desc, descFn, descErr = Resolve(node.desc, info)
    if descErr then out.descError = descErr end
    out.desc = Clean(desc)
    out.descIsFunction = descFn

    if node.type == "group" then
        out.inline = node.inline and true or nil
        out.childGroups = node.childGroups
    end
    if type(node.width) == "number" then
        out.width = math.floor(node.width / widthUnit * 100 + 0.5) / 100
    elseif type(node.width) == "string" then
        out.width = node.width
    end
    out.descStyle = node.descStyle
    out.fontSize = node.fontSize
    out.dialogControl = node.dialogControl
    out.style = node.style
    for _, f in ipairs({ "min", "max", "softMin", "softMax", "step", "bigStep", "isPercent", "multiline", "hasAlpha", "tristate" }) do
        local v = node[f]
        if type(v) == "function" then local ok, r = pcall(v, info) v = ok and r or nil end
        if not IsStub(v) then out[f] = v end
    end

    -- values
    if node.values ~= nil then
        local values, valuesFn, valuesErr = Resolve(node.values, info, true)
        if valuesErr then out.valuesError = valuesErr end
        out.valuesIsFunction = valuesFn
        if type(values) == "table" then
            local list = {}
            local keys = {}
            if type(node.sorting) == "table" then
                for _, k in ipairs(node.sorting) do keys[#keys + 1] = k end
            else
                for k in pairs(values) do keys[#keys + 1] = k end
                table.sort(keys, function(a, b)
                    if type(a) == type(b) and (type(a) == "number" or type(a) == "string") then return a < b end
                    return tostring(a) < tostring(b)
                end)
            end
            for _, k in ipairs(keys) do
                local text = values[k]
                if IsStub(text) then text = tostring(text) end
                list[#list + 1] = { key = k, text = Clean(tostring(text)) }
            end
            out.values = list
        end
    end

    -- get / default
    if node.get ~= nil then
        local src = FuncSource(node.get)
        out.getPaths = ProfilePaths(src)
        if out.getPaths[1] then
            local v = options.Defaults.profile
            for part in out.getPaths[1]:gmatch('[^%.]+') do
                if type(v) ~= 'table' then v = nil break end
                local nv = v[tonumber(part) or part]
                if nv == nil then nv = v[part] end
                v = nv
            end
            if v ~= nil and type(v) ~= 'table' then
                out.defaultFromDefaults = v
                out.hasDefaultFromDefaults = true
            end
        end
        if type(node.get) == "function" or type(node.get) == "string" then
            local r, _, err = Resolve(node.get, info, true)
            local ok = err == nil
            if not ok then r = err end
            if ok and not IsStub(r) and type(r) ~= "table" and type(r) ~= "function" then
                out.current = r
                out.hasCurrent = true
            elseif not ok then
                out.getError = tostring(r)
            end
        end
    end

    -- disabled
    if node.disabled ~= nil then
        if type(node.disabled) == "function" then
            local src = FuncSource(node.disabled)
            out.disabledSrc = ReturnExpr(src) or src
            out.disabledPaths = ProfilePaths(src)
        elseif type(node.disabled) == "string" then
            local r = Resolve(node.disabled, info, true)
            out.disabledSrc = "handler:" .. node.disabled .. "()"
            out.disabledNow = r and true or false
        elseif not IsStub(node.disabled) then
            out.disabledStatic = node.disabled and true or false
        end
    end
    -- hidden
    if node.hidden ~= nil then
        if type(node.hidden) == "function" then
            local src = FuncSource(node.hidden)
            out.hiddenSrc = ReturnExpr(src) or src
            local ok, r = pcall(node.hidden, info)
            out.hiddenNow = ok and r and true or false
        elseif not IsStub(node.hidden) then
            out.hiddenNow = node.hidden and true or false
            out.hiddenStatic = true
        end
    end

    if node.type == "group" and type(node.args) == "table" then
        out.children = {}
        local childPath = {}
        for i, k in ipairs(path) do childPath[i] = k end
        for _, item in ipairs(SortedArgs(node.args, info)) do
            childPath[#path + 1] = item.key
            local copy = {}
            for i, k in ipairs(childPath) do copy[i] = k end
            out.children[#out.children + 1] = Walk(item.key, item.node, copy, appName, rootTable, handler)
        end
    end
    return out
end

local pages = {}
for _, b in ipairs(blizOptions) do
    local t = registry[b.AppName]
    if type(t) == "function" then t = t("dialog", "x", b.AppName) end
    if type(t) == "table" then
        local page = Walk(b.AppName, t, {}, b.AppName, t)
        page.appName = b.AppName
        page.blizName = Clean(b.Name)
        page.blizParent = b.Parent and Clean(b.Parent) or nil
        pages[#pages + 1] = page
    else
        Log("page %s not registered", b.AppName)
    end
end

-------------------------------------------------------------------------------------------------
-- Serialise
-------------------------------------------------------------------------------------------------
local function ser(v, indent)
    indent = indent or ""
    local t = type(v)
    if t == "string" then return string.format("%q", v) end
    if t == "number" or t == "boolean" or t == "nil" then return tostring(v) end
    if t == "table" then
        local parts = {}
        local n = #v
        for i = 1, n do parts[#parts + 1] = indent .. "  " .. ser(v[i], indent .. "  ") end
        local keys = {}
        for k in pairs(v) do if not (type(k) == "number" and k >= 1 and k <= n and k % 1 == 0) then keys[#keys + 1] = k end end
        table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
        for _, k in ipairs(keys) do
            local kv = v[k]
            if type(kv) ~= "function" and type(kv) ~= "userdata" and type(kv) ~= "thread" then
                parts[#parts + 1] = indent .. "  [" .. ser(k) .. "] = " .. ser(kv, indent .. "  ")
            end
        end
        return "{\n" .. table.concat(parts, ",\n") .. "\n" .. indent .. "}"
    end
    return "nil"
end

local f = assert(io.open(outPath, "wb"))
local strings = {}
for _, k in ipairs({ 'Alert System Overwrite Desc', 'Calendar Button Position Overwrite Desc', 'Tab Spacing Overwrite Desc', 'ElvUI', 'GW2_UI', 'EllesmereUI' }) do
    strings[k] = addon.L[k]
end
f:write("return ", ser({ client = client, pages = pages, log = log, pluginOrder = pluginOrder, strings = strings,
    widthUnit = widthUnit }), "\n")
f:close()
io.stderr:write(table.concat(log, "\n"), "\n")