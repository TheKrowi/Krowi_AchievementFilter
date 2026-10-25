-- Merges the Retail and Classic dumps into options-tree.json.
-- Usage: lua.exe merge.lua retail.lua classic.lua options-tree.json
local retailPath, classicPath, outPath = ...
local R, C = dofile(retailPath), dofile(classicPath)

local stats = { spacersDropped = 0 }

local function trim(s)
    if type(s) ~= "string" then return s end
    return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

-------------------------------------------------------------------------------------------------
-- Stable keys for the runtime-numbered keybinding rows (Binding<N>Name/Key1/Key2)
-------------------------------------------------------------------------------------------------
local function NormaliseBindingKeys(node)
    if node.children then
        local n = 0
        for _, c in ipairs(node.children) do
            local suffix = c.key:match("^Binding%d+(%a+%d?)$")
            if suffix then
                if suffix == "Name" then n = n + 1 end
                c.originalKey = c.key
                c.key = "Binding" .. n .. suffix
            end
        end
        for _, c in ipairs(node.children) do NormaliseBindingKeys(c) end
    end
end
for _, d in ipairs({ R, C }) do
    for _, page in ipairs(d.pages) do NormaliseBindingKeys(page) end
end

-------------------------------------------------------------------------------------------------
-- Merge
-------------------------------------------------------------------------------------------------
local function sameValues(a, b)
    if (a == nil) ~= (b == nil) then return false end
    if not a then return true end
    if #a ~= #b then return false end
    for i = 1, #a do
        if a[i].key ~= b[i].key or a[i].text ~= b[i].text then return false end
    end
    return true
end

local function visible(n) return n and not n.hiddenNow end

local Merge
function Merge(r, c)
    local base = r or c
    local m = { src = base, r = r, c = c }
    local rv, cv = visible(r), visible(c)
    if rv and not cv then m.retailOnly = true
    elseif cv and not rv then m.classicOnly = true
    elseif not rv and not cv then m.hidden = true end

    if r and c and rv and cv then
        if trim(r.name) ~= trim(c.name) then m.nameClassic = trim(c.name) end
        if trim(r.desc) ~= trim(c.desc) then m.descClassic = trim(c.desc) end
        if not sameValues(r.values, c.values) then m.valuesClassic = c.values end
    end

    local rc, cc = (r and r.children) or {}, (c and c.children) or {}
    if r and r.children or c and c.children then
        m.children = {}
        local byKey, merged = {}, {}
        for _, x in ipairs(rc) do
            local entry = { key = x.key, r = x }
            merged[#merged + 1] = entry
            byKey[x.key] = entry
        end
        local prev
        for _, x in ipairs(cc) do
            local entry = byKey[x.key]
            if entry then
                entry.c = x
            else
                entry = { key = x.key, c = x }
                byKey[x.key] = entry
                local pos = 0
                if prev then
                    for i, e in ipairs(merged) do if e == prev then pos = i break end end
                end
                table.insert(merged, pos + 1, entry)
            end
            prev = entry
        end
        for _, e in ipairs(merged) do
            m.children[#m.children + 1] = Merge(e.r, e.c)
        end
    end
    return m
end

local pageKeys = {}
local pages = {}
for i, rp in ipairs(R.pages) do
    local cp
    for _, x in ipairs(C.pages) do if x.appName == rp.appName then cp = x end end
    local m = Merge(rp, cp)
    m.appName = rp.appName
    m.blizName = rp.blizName
    m.blizParent = rp.blizParent
    pages[i] = m
end

-------------------------------------------------------------------------------------------------
-- Index of the saved setting each option reads, for disabledBy
-------------------------------------------------------------------------------------------------
local index = {}
local function IndexTree(m, path, parent)
    m.path = path
    m.parent = parent
    local p = m.src.getPaths and m.src.getPaths[1]
    if p and m.src.type ~= "group" then
        index[p] = index[p] or {}
        table.insert(index[p], m)
    end
    for _, ch in ipairs(m.children or {}) do
        local cp = {}
        for i, k in ipairs(path) do cp[i] = k end
        cp[#cp + 1] = ch.src.key
        IndexTree(ch, cp, m)
    end
end
for _, page in ipairs(pages) do IndexTree(page, {}, nil) end

local function commonPrefix(a, b)
    local n = 0
    for i = 1, math.min(#a, #b) do if a[i] == b[i] then n = i else break end end
    return n
end

local function Reference(from, target)
    if from.parent and target.parent == from.parent then return target.src.key end
    return table.concat(target.path, ".")
end

local readable = {
    ["not IsLoaded()"] = "the Instance Achievement Tracker addon is not loaded",
    ["not addon.Diagnostics.TaintProbe.HasData()"] = "no taint diagnostics have been recorded",
    ["handler:HasNoProfiles()"] = "there are no other profiles",
}

local function ResolveDisabled(m)
    local s = m.src
    if not s.disabledSrc then return end
    local refs = {}
    local expr = s.disabledSrc:gsub(";%s*$", "")
    for _, p in ipairs(s.disabledPaths or {}) do
        local best, bestScore
        for _, cand in ipairs(index[p] or {}) do
            if cand ~= m then
                local score = commonPrefix(cand.path, m.path)
                if cand.parent == m.parent then score = score + 1000 end
                if not bestScore or score > bestScore then best, bestScore = cand, score end
            end
        end
        if best then
            local ref = Reference(m, best)
            refs[#refs + 1] = ref
            local pat = ("addon.Options.db.profile." .. p):gsub("%p", "%%%0")
            expr = expr:gsub(pat, ref)
        end
    end
    if #refs > 0 then
        m.disabledBy = table.concat(refs, ", ")
        m.disabledWhen = expr
    else
        m.disabledWhen = readable[expr] or expr
    end
end

-------------------------------------------------------------------------------------------------
-- Plugin-injected notes on other pages (added in the plugin's Load when that addon is loaded)
-------------------------------------------------------------------------------------------------
local function find(page, keys)
    local node = page
    for _, k in ipairs(keys) do
        local nxt
        for _, ch in ipairs(node.children or {}) do if ch.src and ch.src.key == k then nxt = ch end end
        if not nxt then return nil end
        node = nxt
    end
    return node
end
local function pageByApp(app) for _, p in ipairs(pages) do if p.appName == app then return p end end end
local S = R.strings
local function sub(str, name) return (str:gsub("{[^}]+}", name)) end

local injected = {}
local function Inject(app, keys, before, entry)
    local page = pageByApp(app)
    local group = page and find(page, keys)
    if not group then io.stderr:write("inject target missing: " .. app .. " " .. table.concat(keys, ".") .. "\n") return end
    local node = { injected = entry, children = nil }
    if before then
        for i, ch in ipairs(group.children) do
            if ch.src and ch.src.key == before then table.insert(group.children, i, node) return end
        end
    end
    group.children[#group.children + 1] = node
    injected[#injected + 1] = node
end
local function MarkDisabledByPlugins(app, keys, plugins)
    local page = pageByApp(app)
    local node = page and find(page, keys)
    if node then node.disabledByPlugins = plugins end
end

local plugins = {
    { name = "ElvUI", key = "ElvUIComment", locWhen = "ElvUI is loaded", calWhen = "ElvUI is loaded and its achievement skin is on" },
    { name = "GW2_UI", key = "GW2_UIComment", sourceKey = "ElvUIComment", retailOnly = true,
        locWhen = "a supported GW2_UI (6.6.1 or newer) is loaded with its alert frames enabled",
        calWhen = "a supported GW2_UI is loaded with its alert frames and achievement skin enabled" },
    { name = "EllesmereUI", key = "EllesmereUIComment", retailOnly = true,
        locWhen = "EllesmereUI is loaded and skins the achievement window", calWhen = "EllesmereUI is loaded and skins the achievement window" },
}
for _, p in ipairs(plugins) do
    local display = S[p.name] or p.name
    Inject("KrowiAF_EventReminders", { "PopUps", "Location" }, nil, {
        key = p.key, sourceKey = p.sourceKey, type = "description", width = "full", plugin = p.name, retailOnly = p.retailOnly,
        name = sub(S["Alert System Overwrite Desc"], display), shownWhen = p.locWhen, computed = true })
    Inject("KrowiAF_Layout", { "Header", "CalendarButton" }, nil, {
        key = p.key, sourceKey = p.sourceKey, type = "description", width = "full", plugin = p.name, retailOnly = p.retailOnly,
        name = sub(S["Calendar Button Position Overwrite Desc"], display), shownWhen = p.calWhen, computed = true })
end
Inject("KrowiAF_Layout", { "Tabs", "General", "General" }, "Spacing", {
    key = "EllesmereUIComment", type = "description", width = "full", plugin = "EllesmereUI", retailOnly = true,
    name = sub(S["Tab Spacing Overwrite Desc"], S["EllesmereUI"] or "EllesmereUI"), shownWhen = "EllesmereUI is loaded and skins the achievement window", computed = true })
for _, k in ipairs({ "GrowDirection", "Spacing", "OffsetX", "OffsetY" }) do
    MarkDisabledByPlugins("KrowiAF_EventReminders", { "PopUps", "Location", k }, { "ElvUI", "GW2_UI", "EllesmereUI" })
end
for _, k in ipairs({ "OffsetX", "OffsetY" }) do
    MarkDisabledByPlugins("KrowiAF_Layout", { "Header", "CalendarButton", k }, { "ElvUI", "GW2_UI", "EllesmereUI" })
end
MarkDisabledByPlugins("KrowiAF_Layout", { "Tabs", "General", "General", "Spacing" }, { "EllesmereUI" })

-------------------------------------------------------------------------------------------------
-- Output nodes
-------------------------------------------------------------------------------------------------
local notComputed = { MapVerifier = true } -- a hard-coded English literal, not built at runtime
local hiddenNotes = {
    Unsupported = "shown only when GW2_UI is installed but not supported (on Classic, or a Retail version older than 6.6.1)",
}

local typeCounts, pageCounts = {}, {}

local Out
function Out(m, pageApp, depth)
    if m.injected then
        local e = m.injected
        typeCounts[e.type] = (typeCounts[e.type] or 0) + 1
        pageCounts[pageApp] = (pageCounts[pageApp] or 0) + 1
        return { key = e.key, sourceKey = e.sourceKey, type = e.type, name = e.name, computed = e.computed, width = e.width,
            plugin = e.plugin, pluginInjected = true, shownWhen = e.shownWhen, retailOnly = e.retailOnly }
    end
    local s = m.src
    local o = { key = s.key, type = s.type }
    local name = trim(s.name)
    o.name = name or ""
    local isProfiles = pageApp == "KrowiAF_Profiles"
    local computed
    if isProfiles then computed = s.nameIsFunction else computed = s.nameIsFunction or not s.nameKnown end
    if notComputed[s.key] then computed = false end
    if o.name == "" then computed = false end
    if computed then o.computed = true end
    if s.nameError then o.unresolved = s.nameError end
    if m.nameClassic then o.nameClassic = m.nameClassic end
    local desc = trim(s.desc)
    if desc and desc ~= "" then o.desc = desc end
    if m.descClassic and m.descClassic ~= "" then o.descClassic = m.descClassic end
    if s.descStyle then o.descStyle = s.descStyle end
    if s.type == "group" then
        if s.inline then o.inline = true end
        if s.childGroups then o.childGroups = s.childGroups end
    end
    if s.width then o.width = s.width end
    if s.fontSize then o.fontSize = s.fontSize end
    if s.type == "range" then
        o.min, o.max, o.step = s.min, s.max, s.step
        o.softMin, o.softMax, o.bigStep, o.isPercent = s.softMin, s.softMax, s.bigStep, s.isPercent
    end
    if s.type == "input" and s.multiline then o.multiline = s.multiline end
    if s.values then
        o.values = s.values
        if s.valuesIsFunction then o.valuesComputed = true end
        if m.valuesClassic then o.valuesClassic = m.valuesClassic end
    end
    if s.style then o.style = s.style end
    -- default
    local readsSetting = s.getPaths and #s.getPaths > 0
    local default, hasDefault
    if s.hasDefaultFromDefaults then
        default, hasDefault = s.defaultFromDefaults, true
    elseif s.hasCurrent and (readsSetting or (not s.disabledStatic and s.type ~= "keybinding")) and s.type ~= "keybinding" then
        default, hasDefault = s.current, true
    end
    if s.type == "select" and o.values and hasDefault then
        local valid = false
        for _, v in ipairs(o.values) do if v.key == default then valid = true end end
        if not valid and s.hasCurrent then
            default = s.current
            for _, v in ipairs(o.values) do if v.key == default then valid = true end end
        end
        if not valid then hasDefault = false end
    end
    if hasDefault and default ~= nil then
        o.default = default
        if s.type == "select" and o.values then
            for _, v in ipairs(o.values) do if v.key == default then o.defaultText = v.text end end
        end
    end
    if m.c and m.r and m.c.hasDefaultFromDefaults and m.r.hasDefaultFromDefaults and m.c.defaultFromDefaults ~= m.r.defaultFromDefaults then
        o.defaultClassic = m.c.defaultFromDefaults
    end
    -- disabled
    if s.disabledStatic then o.disabled = true end
    if m.disabledBy then o.disabledBy = m.disabledBy end
    if m.disabledWhen then o.disabledWhen = m.disabledWhen end
    if m.disabledByPlugins then o.disabledByPlugins = m.disabledByPlugins end
    -- availability
    if m.retailOnly then o.retailOnly = true end
    if m.classicOnly then o.classicOnly = true end
    if m.hidden then
        o.hidden = true
        if hiddenNotes[s.key] then o.hiddenWhen = hiddenNotes[s.key] end
    end
    if pageApp == "KrowiAF_Plugins" and depth == 1 then o.plugin = s.key end
    if s.originalKey then o.keyGenerated = true end
    if s.disabledStatic and s.type == "toggle" and not readsSetting then
        o.note = "read-only status indicator"
    end
    if s.key == "Presets" and s.type == "select" then
        o.valuesComputed = true
        o.valuesClassic = nil
        o.note = "values are each preset format rendered for the current date (sample date and time shown)"
    end
    if pageApp == "KrowiAF_Profiles" and s.key == "choose" then
        o.note = "values are the existing profiles plus the current character, realm and class (sample names shown)"
    end

    typeCounts[s.type] = (typeCounts[s.type] or 0) + 1
    pageCounts[pageApp] = (pageCounts[pageApp] or 0) + 1

    if m.children then
        o.children = {}
        local allRetailOnly = #m.children > 0
        for _, ch in ipairs(m.children) do
            local cs = ch.src
            local spacer = cs and cs.type == "description" and trim(cs.name) == "" and cs.key:match("^Blank")
            if spacer then
                stats.spacersDropped = stats.spacersDropped + 1
            else
                local co = Out(ch, pageApp, depth + 1)
                o.children[#o.children + 1] = co
                if not co.retailOnly then allRetailOnly = false end
            end
        end
        if allRetailOnly and #o.children > 0 and not o.retailOnly then o.note = "empty on Classic" end
    end
    return o
end

local function Walk(m, fn)
    fn(m)
    for _, ch in ipairs(m.children or {}) do Walk(ch, fn) end
end
for _, page in ipairs(pages) do Walk(page, function(m) if m.src then ResolveDisabled(m) end end) end

local outPages = {}
for _, page in ipairs(pages) do
    local o = Out(page, page.appName, 0)
    o.key = page.appName == R.pages[1].appName and "General" or page.appName:gsub("^KrowiAF_", "")
    o.appName = (page.appName:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""))
    o.settingsCategory = page.blizName
    if page.blizParent then o.settingsParent = page.blizParent end
    outPages[#outPages + 1] = o
end

-------------------------------------------------------------------------------------------------
-- JSON
-------------------------------------------------------------------------------------------------
local fieldOrder = { "key", "sourceKey", "type", "name", "nameClassic", "computed", "unresolved", "desc", "descClassic", "descStyle",
    "appName", "settingsCategory", "settingsParent", "plugin", "pluginInjected", "shownWhen",
    "inline", "childGroups", "width", "fontSize", "style", "multiline",
    "min", "max", "softMin", "softMax", "step", "bigStep", "isPercent",
    "values", "valuesComputed", "valuesClassic", "default", "defaultText", "defaultClassic",
    "disabled", "disabledBy", "disabledWhen", "disabledByPlugins", "hidden", "hiddenWhen", "retailOnly", "classicOnly",
    "keyGenerated", "note", "children" }

local function esc(s)
    return '"' .. s:gsub('[%c"\\]', function(ch)
        if ch == '"' then return '\\"' end
        if ch == "\\" then return "\\\\" end
        if ch == "\n" then return "\\n" end
        if ch == "\r" then return "\\r" end
        if ch == "\t" then return "\\t" end
        return string.format("\\u%04x", ch:byte())
    end) .. '"'
end

local function enc(v, indent)
    local t = type(v)
    if t == "string" then return esc(v) end
    if t == "boolean" then return tostring(v) end
    if t == "number" then
        if v == math.floor(v) and math.abs(v) < 1e15 then return string.format("%d", v) end
        return string.format("%.14g", v)
    end
    if t == "nil" then return "null" end
    if t == "table" then
        local nextIndent = indent .. "  "
        if #v > 0 or next(v) == nil then
            if #v == 0 then return "[]" end
            -- arrays of {key,text} on one line each
            local parts = {}
            for i = 1, #v do parts[i] = nextIndent .. enc(v[i], nextIndent) end
            return "[\n" .. table.concat(parts, ",\n") .. "\n" .. indent .. "]"
        end
        local parts = {}
        local seen = {}
        if v.text ~= nil and v.key ~= nil and v.type == nil then
            return "{ \"key\": " .. enc(v.key, "") .. ", \"text\": " .. enc(v.text, "") .. " }"
        end
        for _, k in ipairs(fieldOrder) do
            if v[k] ~= nil then
                seen[k] = true
                parts[#parts + 1] = nextIndent .. esc(k) .. ": " .. enc(v[k], nextIndent)
            end
        end
        for k, x in pairs(v) do
            if not seen[k] then parts[#parts + 1] = nextIndent .. esc(tostring(k)) .. ": " .. enc(x, nextIndent) end
        end
        return "{\n" .. table.concat(parts, ",\n") .. "\n" .. indent .. "}"
    end
    return "null"
end

local f = assert(io.open(outPath, "wb"))
f:write(enc(outPages, ""), "\n")
f:close()

-- stats
local function countPage(o)
    local n = 0
    Walk(o, function() n = n + 1 end)
    return n - 1
end
print("spacers dropped: " .. stats.spacersDropped)
for _, o in ipairs(outPages) do
    local types = {}
    Walk(o, function(x) if x ~= o then types[x.type] = (types[x.type] or 0) + 1 end end)
    local tl = {}
    for k, v in pairs(types) do tl[#tl + 1] = k .. "=" .. v end
    table.sort(tl)
    print(("%s: %d nodes (%s)"):format(o.key, countPage(o), table.concat(tl, ", ")))
end
local total = {}
for _, o in ipairs(outPages) do Walk(o, function(x) if x ~= o then total[x.type] = (total[x.type] or 0) + 1 end end) end
local tl = {}
for k, v in pairs(total) do tl[#tl + 1] = k .. "=" .. v end
table.sort(tl)
print("total by type: " .. table.concat(tl, ", "))