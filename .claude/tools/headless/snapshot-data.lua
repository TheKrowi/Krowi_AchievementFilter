---@diagnostic disable: lowercase-global, undefined-global, need-check-nil
-- Data snapshot: builds the data for a client in the shared headless environment (client-env.lua) and
-- records as text every data-derived achievement property, every zone placement and the registries the
-- achievement data resolves against, so a data change - obtainability, seasons, build versions,
-- faction, rewards, zone assignment - is a reviewable diff instead of something to reason out. The
-- sibling of snapshot-categories.lua, which records the category tree; nothing here repeats it.
--
-- What is recorded is what the pipeline BUILT, not what the files say: a builder that stores the wrong
-- field or a loader that drops an entry shows, while a refactor that builds the same objects - an
-- AutoFactionSplit written out as two FactionSplits, a patch block moved to Shared - is a zero diff.
-- That is why the file and registry key an entry came from are not recorded.
--
-- Anchors are recorded as declared, never resolved to Past/Current/Future: that state depends on
-- today's date and would churn. What is recorded is where a Version anchor lands on this client
-- (5.4.0=>5.5.4 on Classic, =>none where the client has not reached that content) and an Event anchor
-- naming no registered calendar event (=>none), because both follow from the data alone and are what
-- a ContentTimeline or EventData edit changes.
--
-- Ids, never locale strings: patch, event and pet battle link names come from addon.L and are left
-- out; the rest is ids, enum member names and the deterministic headless stubs.
--
-- Three files per client, one concern each, so the file a diff lands in names the kind of data that
-- moved and a reviewer reads one short hunk:
--   Achievements  one ACH line per achievement the client registers, sorted by id: patch, faction and
--                 the other faction's id, reward types, PvP and realm-first flags, the temporary-
--                 obtainable records, reward previews, custom criteria, the events whose category
--                 holds it, and any field a future loader hangs on it; then the stores keyed by
--                 achievement id, one line per entry: tooltip entries, transmog sets, pet battle links,
--                 guide steps
--   Zones        one ZONE line per placement, per uiMapId in stored order - an id added to or dropped
--                 from a zone, a zone gained or lost, a reordering within a ZoneData file
--   Registries    build versions, the content timeline, season anchors and events: what the
--                 achievement data resolves against, so a change there shows at its source
--
-- Usage: lua.exe snapshot-data.lua <repoRoot> [Retail|Classic|Both] [-write|-check|-stdout]
--   -write   (default) regenerate the baselines under .claude/tools/headless/snapshots/
--   -check   compare against the committed baselines, print "<file>:<line>: <message>" per
--            difference and exit 1 - what Check-Repo.ps1 runs as the data-snapshot rule
--   -stdout  print the snapshot instead of writing it (used by the determinism gate)
--
-- The baseline is RECORDED behaviour, following the Tests/ convention: an intended change is a
-- reviewed diff committed alongside the data that caused it, never a silent regenerate.

local root, clientArg, mode = ...
assert(root, "usage: snapshot-data.lua <repoRoot> [Retail|Classic|Both] [-write|-check|-stdout]")
if clientArg and clientArg:sub(1, 1) == "-" then mode, clientArg = clientArg, nil end
clientArg = clientArg or "Both"
mode = mode or "-write"
assert(clientArg == "Retail" or clientArg == "Classic" or clientArg == "Both", "client must be Retail, Classic or Both")
assert(mode == "-write" or mode == "-check" or mode == "-stdout", "mode must be -write, -check or -stdout")

local scriptDir = ((arg and arg[0]) or ""):gsub("\\", "/"):match("^(.*)/") or "."
local clientEnv = assert(loadfile(scriptDir .. "/client-env.lua"))()
root = clientEnv.NormaliseRoot(root)

local SNAPSHOT_DIR = ".claude/tools/headless/snapshots"
local KINDS = { "Achievements", "Zones", "Registries" }
-- the three lists Api/ZoneDataApi.lua fills per map; the raid-size forms only exist for old raids
local ZONE_LISTS = { { Field = "Achievements", Tag = "" }, { Field = "Achievements10", Tag = " (10)" }, { Field = "Achievements25", Tag = " (25)" } }

local function snapshotPath(kind, client)
    return SNAPSHOT_DIR .. "/" .. kind .. "." .. client .. ".txt"
end

-------------------------------------------------------------------------------------------------
-- Deterministic rendering helpers
-------------------------------------------------------------------------------------------------
-- The separators -check splits on, " | " between fields and " # " before a list entry, can never
-- occur inside a value
local escapes = { ["\r"] = "\\r", ["\n"] = "\\n", ["\t"] = "\\t", ["|"] = "\\|", ["#"] = "\\#" }

local function escape(s)
    return (tostring(s):gsub("[\r\n\t|#]", escapes))
end

-- A headless stub renders as the global path it stands for (PLAYER_FACTION_GROUP.Alliance): stable,
-- and exactly what the data file named
local function stubName(v)
    local mt = type(v) == "table" and getmetatable(v)
    if mt and mt.__tostring then return tostring(v):match("^<stub (.*)>$") end
end

local serialize

-- a total order over mixed keys that never compares addresses: a table key is ordered by its rendering
local function lessThan(a, b)
    local ta, tb = type(a), type(b)
    if ta == tb and (ta == "number" or ta == "string") then return a < b end
    if ta ~= tb then return ta < tb end
    return serialize(a) < serialize(b)
end

-- the built-in < when every element is a number, or every one a string: much faster than a Lua
-- comparator on the 8000-odd achievement ids, and the same order
local function sortList(list)
    local first = type(list[1])
    for i = 2, #list do
        if type(list[i]) ~= first then
            table.sort(list, lessThan)
            return list
        end
    end
    if first == "number" or first == "string" then table.sort(list) else table.sort(list, lessThan) end
    return list
end

local function sortedKeys(t)
    local keys = {}
    for k in pairs(t) do keys[#keys + 1] = k end
    return sortList(keys)
end

-- Deterministic for any value a loader can store: keys sorted, an object shown by its Id, a function
-- by kind only, so it can never leak a hash order or an address into the snapshot
function serialize(v, depth)
    local t = type(v)
    if t == "string" then return escape(v) end
    if t == "number" or t == "boolean" or t == "nil" then return tostring(v) end
    if t ~= "table" then return "<" .. t .. ">" end
    local stub = stubName(v)
    if stub then return stub end
    if getmetatable(v) and v.Id ~= nil then return "<object " .. serialize(v.Id) .. ">" end
    depth = depth or 0
    if depth >= 3 then return "{...}" end
    local parts = {}
    for i, k in ipairs(sortedKeys(v)) do
        parts[#parts + 1] = (k == i and "" or (escape(k) .. "=")) .. serialize(v[k], depth + 1)
    end
    return "{" .. table.concat(parts, ",") .. "}"
end

-- the fields of t no rendering below knows about, so a property a future loader adds shows up
-- instead of being silently left out
local function unhandledKeys(t, handled)
    local keys = {}
    for k in pairs(t) do
        if not handled[k] then keys[#keys + 1] = k end
    end
    return sortList(keys)
end

local function extras(t, handled)
    local parts = {}
    for i, k in ipairs(unhandledKeys(t, handled)) do parts[i] = " " .. escape(k) .. "=" .. serialize(t[k]) end
    return table.concat(parts)
end

local function reverse(enum)
    local r = {}
    for name, value in pairs(type(enum) == "table" and enum or {}) do r[value] = name end
    return r
end

local function nameOf(names, v)
    return names[v] or serialize(v)
end

-- "050400" -> "5.4.0"
local dottedCache = {}
local function dotted(id)
    local s = tostring(id)
    if not dottedCache[s] then
        dottedCache[s] = s:match("^%d%d%d%d%d%d$") and (tonumber(s:sub(1, 2)) .. "." .. tonumber(s:sub(3, 4)) .. "." .. tonumber(s:sub(5, 6))) or escape(s)
    end
    return dottedCache[s]
end

-- {2024, 11, 4} -> "2024-11-04"
local function dateOf(v)
    local s = serialize(v)
    local y, m, d = s:match("^{(%d+),(%d+),(%d+)}$")
    if not y then return s end
    return string.format("%04d-%02d-%02d", tonumber(y), tonumber(m), tonumber(d))
end

-------------------------------------------------------------------------------------------------
-- Build one client's three snapshots
-------------------------------------------------------------------------------------------------
local function buildSnapshot(client)
    local ctx = clientEnv.New(root, client)
    local failures = {}
    ctx:LoadFiles{
        ParseError = function(rel, err) failures[#failures + 1] = rel .. ": parse error: " .. tostring(err) end,
        RuntimeError = function(rel, runErr) failures[#failures + 1] = rel .. ": " .. ctx:RealPath(tostring(runErr.msg)) end,
    }
    local KrowiAF = ctx:KrowiAF()
    local data = ctx.addon.Data
    assert(type(KrowiAF) == "table" and type(KrowiAF.Enum) == "table", "the API layer did not initialise for " .. client)
    assert(type(data.Achievements) == "table" and type(data.Maps) == "table", "addon.Data did not initialise for " .. client)

    -- --- zone attribution -----------------------------------------------------------------------
    -- Data.lua schedules the ZoneData groups in pairs() order over KrowiAF.ZoneData, so where two
    -- ZoneData keys feed one map (a city in two expansions) the order between their runs is a hash
    -- order, not data. Each run of a list is attributed to the group that appended it, and runs from
    -- different keys are recorded sorted by key; within a key the stored order is kept exactly.
    local zoneKeyOf = {}
    for k, group in pairs(type(KrowiAF.ZoneData) == "table" and KrowiAF.ZoneData or {}) do
        if type(group) == "table" then zoneKeyOf[group] = tostring(k) end
    end
    local runs, seenLength, currentZoneKey = {}, {}, ""
    local function attribute()
        for _, entry in pairs(data.Maps) do
            for _, l in ipairs(ZONE_LISTS) do
                local list = type(entry) == "table" and entry[l.Field]
                if type(list) == "table" then
                    local from = (seenLength[list] or 0) + 1
                    if #list >= from then
                        runs[list] = runs[list] or {}
                        runs[list][#runs[list] + 1] = { Key = currentZoneKey, From = from, To = #list }
                    end
                    seenLength[list] = #list
                end
            end
        end
    end

    ctx:RunPipeline{
        StepError = function(label, file, err) failures[#failures + 1] = (file or "?") .. ": " .. label .. ": " .. ctx:RealPath(tostring(err)) end,
        TaskError = function(_, err) failures[#failures + 1] = ctx:RealPath(tostring(err)) end,
        BeforeGroup = function(tasks)
            -- only the ZoneData groups write addon.Data.Maps, so the walk is needed around them only
            if currentZoneKey ~= "" or zoneKeyOf[tasks] then attribute() end
            currentZoneKey = zoneKeyOf[tasks] or ""
        end,
    }
    attribute()

    local function canonical(list)
        local listRuns = runs[list]
        if not listRuns or #listRuns < 2 then return list end
        local ordered = {}
        for i, run in ipairs(listRuns) do ordered[i] = run end
        table.sort(ordered, function(a, b)
            if a.Key ~= b.Key then return a.Key < b.Key end
            return a.From < b.From
        end)
        local out = {}
        for _, run in ipairs(ordered) do
            for i = run.From, run.To do out[#out + 1] = list[i] end
        end
        return out
    end

    -- --- names for enum values -------------------------------------------------------------------
    local factionName = reverse(KrowiAF.Enum.Faction)
    local rewardName = reverse(KrowiAF.Enum.RewardType)
    local previewName = reverse(KrowiAF.Enum.RewardPreviewType)
    local eventTypeName = reverse(KrowiAF.Enum.EventType)
    local tooltipTypeName = reverse(ctx.env.Enum.TooltipDataType)
    local calendarEvents = type(data.Events) == "table" and KrowiAF.Enum.EventType and data.Events[KrowiAF.Enum.EventType.Calendar] or {}

    -- --- event membership ------------------------------------------------------------------------
    -- An event binds to a category (Event.Category, the one its reminder opens); the achievements in
    -- that category's subtree are the event's achievements
    local eventsOf = {}   -- achievement id -> type name -> { event id = true }
    local eventRows = {}
    for eventType, events in pairs(type(data.Events) == "table" and data.Events or {}) do
        for id, event in pairs(events) do
            local typeName = nameOf(eventTypeName, eventType)
            eventRows[#eventRows + 1] = { TypeName = typeName, Id = id, Event = event }
            local visited = {}
            local function walk(cat)
                if type(cat) ~= "table" or visited[cat] then return end
                visited[cat] = true
                for _, ach in ipairs(cat.Achievements or {}) do
                    local byType = eventsOf[ach.Id] or {}
                    eventsOf[ach.Id] = byType
                    byType[typeName] = byType[typeName] or {}
                    byType[typeName][id] = true
                end
                for _, child in ipairs(cat.Children or {}) do walk(child) end
            end
            if type(event) == "table" then walk(event.Category) end
        end
    end
    table.sort(eventRows, function(a, b)
        if a.TypeName ~= b.TypeName then return a.TypeName < b.TypeName end
        return lessThan(a.Id, b.Id)
    end)

    -- --- temporary-obtainable records, as declared ------------------------------------------------
    local function versionAnchor(id)
        local text = dotted(id)
        local target = KrowiAF.ResolveVersionAnchor(id)
        if not target then return text .. "=>none" end
        if target.Id ~= id then return text .. "=>" .. dotted(target.Id) end
        return text
    end

    local function anchor(fn, value)
        if value == nil then return "" end
        if fn == "Version" then return " " .. versionAnchor(value) end
        if fn == "Event" then return " " .. serialize(value) .. (calendarEvents[tonumber(value)] and "" or "=>none") end
        if fn == "Date" or fn == "Reset" then return " " .. dateOf(value) end
        return " " .. serialize(value)
    end

    local sideFields = { Inclusion = true, Function = true, Value = true, Implicit = true }
    local function side(s)
        local text = (s.Inclusion ~= nil and (serialize(s.Inclusion) .. " ") or "") .. serialize(s.Function) .. anchor(s.Function, s.Value)
        if s.Implicit then text = text .. " (own patch)" end
        return text .. extras(s, sideFields)
    end

    -- [From Version 11.0.0 (own patch) .. Before Version 11.1.0], [Once], [] for a bare Obtainable()
    local recordFields = { Start = true, End = true, Weeks = true, IsNotObtainable = true }
    local function record(r)
        local parts = {}
        if type(r.Start) == "table" then parts[#parts + 1] = side(r.Start) end
        if type(r.End) == "table" then parts[#parts + 1] = side(r.End) end
        local text = table.concat(parts, " .. ")
        if r.Weeks then text = text .. " weeks " .. serialize(r.Weeks[1]) .. "-" .. (r.Weeks[2] ~= nil and serialize(r.Weeks[2]) or "end") end
        if r.IsNotObtainable then text = text .. " not obtainable" end
        return "[" .. text .. extras(r, recordFields) .. "]"
    end

    -- the table Api/CustomCriteriaApi.lua closed over; its functions are code, so only their names
    local function customCriteria(fn)
        for i = 1, 50 do
            local name, value = debug.getupvalue(fn, i)
            if not name then break end
            if name == "customCriteria" and type(value) == "table" then
                local parts = {}
                for _, k in ipairs(sortedKeys(value)) do
                    parts[#parts + 1] = type(value[k]) == "function" and escape(k) or (escape(k) .. " " .. serialize(value[k]))
                end
                return table.concat(parts, ", ")
            end
        end
        return "present"
    end

    -- --- achievements -----------------------------------------------------------------------------
    -- Category and MoreCategories are snapshot-categories.lua's; TransmogSetIds and Guide have their own sections
    local achievementFields = { Id = true, BuildVersion = true, Faction = true, OtherFactionAchievementId = true, RewardType = true,
        IsPvP = true, IsRealmFirst = true, TemporaryObtainable = true, GetCustomCriteria = true, TransmogSetIds = true,
        Guide = true, Category = true, MoreCategories = true }
    local previews = type(data.RewardPreviewData) == "table" and data.RewardPreviewData or {}

    local function achievementLine(id, ach)
        local fields = {}
        local function add(s) fields[#fields + 1] = s end
        -- truthiness, not the literal value: every reader tests these with a plain `if`
        local function flag(name, v) if v then add(v == true and name or (name .. "=" .. serialize(v))) end end

        add("patch=" .. (type(ach.BuildVersion) == "table" and dotted(ach.BuildVersion.Id) or serialize(ach.BuildVersion)))
        if ach.Faction ~= nil then add("faction=" .. nameOf(factionName, ach.Faction)) end
        if ach.OtherFactionAchievementId ~= nil then add("otherFaction=" .. serialize(ach.OtherFactionAchievementId)) end
        if ach.RewardType ~= nil then
            local names = {}
            for _, v in ipairs(type(ach.RewardType) == "table" and ach.RewardType or { ach.RewardType }) do names[#names + 1] = nameOf(rewardName, v) end
            add("reward=" .. table.concat(names, ","))
        end
        flag("pvp", ach.IsPvP)
        flag("realmFirst", ach.IsRealmFirst)
        if type(ach.TemporaryObtainable) == "table" then
            local records = {}
            for _, r in ipairs(ach.TemporaryObtainable) do records[#records + 1] = record(r) end
            -- an empty list still reads as Past in Data/TemporaryObtainable.lua, so it is recorded
            add("obtainable=" .. (#records > 0 and table.concat(records, " ") or "(empty)"))
        end
        if type(previews[id]) == "table" then
            local parts = {}
            for _, p in ipairs(previews[id]) do
                parts[#parts + 1] = nameOf(previewName, p.RewardPreviewType) .. " " .. serialize(p.RewardId)
                    .. (p.SpellId ~= nil and (" spell " .. serialize(p.SpellId)) or "") .. (p.Name ~= nil and " named" or "")
            end
            add("preview=" .. table.concat(parts, ", "))
        end
        if ach.GetCustomCriteria then add("custom=" .. customCriteria(ach.GetCustomCriteria)) end
        if eventsOf[id] then
            local parts = {}
            for _, typeName in ipairs(sortedKeys(eventsOf[id])) do
                local ids = sortedKeys(eventsOf[id][typeName])
                for i, eventId in ipairs(ids) do ids[i] = serialize(eventId) end
                parts[#parts + 1] = typeName .. " " .. table.concat(ids, ",")
            end
            add("events=" .. table.concat(parts, "; "))
        end
        for _, k in ipairs(unhandledKeys(ach, achievementFields)) do add(escape(k) .. "=" .. serialize(ach[k])) end
        return "ACH " .. serialize(id) .. " | " .. table.concat(fields, " | ")
    end

    local achievementIds = {}
    for id, ach in pairs(data.Achievements) do
        if type(ach) == "table" then achievementIds[#achievementIds + 1] = id end
    end
    sortList(achievementIds)

    -- --- the stores keyed by achievement id ---------------------------------------------------------
    -- TooltipData is keyed by object id; regrouped per achievement and sorted by criteria, because the
    -- order across TooltipData keys is the pairs() order Data.lua schedules them in
    local tooltips = {}
    for objectId, entries in pairs(type(data.TooltipData) == "table" and data.TooltipData or {}) do
        if type(objectId) == "number" and type(entries) == "table" then
            for _, e in ipairs(entries) do
                local list = tooltips[e.AchievementId] or {}
                tooltips[e.AchievementId] = list
                local typeName = nameOf(tooltipTypeName, e.ObjectType)
                list[#list + 1] = {
                    Criteria = tonumber(e.CriteriaIndex) or 0,
                    Type = typeName,
                    Object = objectId,
                    Text = "criteria " .. serialize(e.CriteriaIndex) .. ": " .. typeName .. " " .. serialize(objectId)
                        .. (e.Faction ~= nil and (" faction " .. serialize(e.Faction)) or ""),
                }
            end
        end
    end

    local petBattleLinks = {}
    for id, link in pairs(type(data.PetBattleLinkData) == "table" and data.PetBattleLinkData or {}) do
        if type(id) == "number" and type(link) == "table" then petBattleLinks[#petBattleLinks + 1] = id end
    end
    sortList(petBattleLinks)

    -- --- Achievements file ---------------------------------------------------------------------------
    local texts = {}
    local lines
    local function emit(s) lines[#lines + 1] = s end
    local function header(kind, about)
        lines = {}
        emit("# " .. kind .. " " .. client)
        emit("# Generated by " .. SNAPSHOT_DIR:gsub("/snapshots$", "") .. "/snapshot-data.lua - do not edit by hand.")
        emit("# Recorded behaviour: an intended change is a reviewed diff committed with the data that")
        emit("# caused it, never a silent regenerate. Ids only; names come from addon.L and are left out.")
        for _, l in ipairs(about) do emit("# " .. l) end
        emit("")
    end

    header("Achievements", {
        "Anchors are recorded as declared, never resolved against today's date. A=>B is where a",
        "Version anchor lands on this client, A=>none an anchor that resolves to nothing here.",
    })
    if #failures > 0 then
        emit("== Load failures ==")
        table.sort(failures)
        for _, f in ipairs(failures) do emit("FAIL " .. escape(f)) end
        emit("")
    end

    local counts = { Faction = 0, Obtainable = 0, Records = 0, Rewards = 0, Previews = 0, Custom = 0, Events = 0 }
    emit("== Achievements ==")
    for _, id in ipairs(achievementIds) do
        local ach = data.Achievements[id]
        emit(achievementLine(id, ach))
        if ach.Faction ~= nil then counts.Faction = counts.Faction + 1 end
        if type(ach.TemporaryObtainable) == "table" then
            counts.Obtainable = counts.Obtainable + 1
            counts.Records = counts.Records + #ach.TemporaryObtainable
        end
        if ach.RewardType ~= nil then counts.Rewards = counts.Rewards + 1 end
        if previews[id] then counts.Previews = counts.Previews + 1 end
        if ach.GetCustomCriteria then counts.Custom = counts.Custom + 1 end
        if eventsOf[id] then counts.Events = counts.Events + 1 end
    end
    emit("")

    emit("== Tooltips ==")
    emit("# per achievement, sorted: criteria <index>: <tooltip data type> <object id> [faction <faction>]")
    local tooltipIds, tooltipEntries = sortedKeys(tooltips), 0
    for _, id in ipairs(tooltipIds) do
        local list = tooltips[id]
        table.sort(list, function(a, b)
            if a.Criteria ~= b.Criteria then return a.Criteria < b.Criteria end
            if a.Type ~= b.Type then return a.Type < b.Type end
            if a.Object ~= b.Object then return a.Object < b.Object end
            return a.Text < b.Text
        end)
        for _, e in ipairs(list) do emit("TIP " .. serialize(id) .. " # " .. e.Text) end
        tooltipEntries = tooltipEntries + #list
    end
    emit("")

    emit("== Transmog sets ==")
    emit("# per achievement, in stored order")
    local transmogAchievements, transmogSets = 0, 0
    for _, id in ipairs(achievementIds) do
        local sets = data.Achievements[id].TransmogSetIds
        if sets ~= nil then
            transmogAchievements = transmogAchievements + 1
            for _, setId in ipairs(type(sets) == "table" and sets or { sets }) do
                emit("TRANSMOG " .. serialize(id) .. " # " .. serialize(setId))
                transmogSets = transmogSets + 1
            end
        end
    end
    emit("")

    emit("== Pet battle links ==")
    emit("# per achievement: the link, then its criteria links in stored order; link texts are names, left out")
    local petBattleCriteria = 0
    for _, id in ipairs(petBattleLinks) do
        local link = data.PetBattleLinkData[id]
        emit("PETBATTLE " .. serialize(id) .. " | link=" .. serialize(link.Link) .. extras(link, { Link = true, Criteria = true }))
        for _, c in ipairs(type(link.Criteria) == "table" and link.Criteria or {}) do
            local head = c.CriteriaIndex ~= nil and ("criteria " .. serialize(c.CriteriaIndex)) or "text"
            emit("PETBATTLE " .. serialize(id) .. " # " .. head .. ": " .. serialize(c.Link))
            for _, child in ipairs(type(c.Children) == "table" and c.Children or {}) do
                emit("PETBATTLE " .. serialize(id) .. " # " .. head .. " child: " .. serialize(child.Link))
            end
            petBattleCriteria = petBattleCriteria + 1
        end
    end
    emit("")

    emit("== Guides ==")
    emit("# per achievement, the steps in stored order; an NPC's name is the data's English one, a tip a locale string, left out")
    local guideAchievements, guideSteps = 0, 0
    for _, id in ipairs(achievementIds) do
        local steps = data.Achievements[id].Guide
        if steps ~= nil then
            guideAchievements = guideAchievements + 1
            for i, step in ipairs(type(steps) == "table" and steps or { steps }) do
                local stepType = type(step) == "table" and step.Type or step
                local fields = type(step) == "table" and extras(step, { Type = true, Text = true }) or ""
                emit("GUIDE " .. serialize(id) .. " # " .. i .. " " .. serialize(stepType) .. fields)
                guideSteps = guideSteps + 1
            end
        end
    end
    emit("")

    emit("== Summary ==")
    emit("achievements           " .. #achievementIds)
    emit("  with a faction       " .. counts.Faction)
    emit("  with a reward type   " .. counts.Rewards)
    emit("  temporarily obtain.  " .. counts.Obtainable .. "   (" .. counts.Records .. " records)")
    emit("  with a preview       " .. counts.Previews)
    emit("  with custom criteria " .. counts.Custom)
    emit("  in an event          " .. counts.Events)
    emit("tooltip entries        " .. tooltipEntries .. "   (" .. #tooltipIds .. " achievements)")
    emit("transmog sets          " .. transmogSets .. "   (" .. transmogAchievements .. " achievements)")
    emit("pet battle links       " .. #petBattleLinks .. "   (" .. petBattleCriteria .. " criteria)")
    emit("guides                 " .. guideAchievements .. "   (" .. guideSteps .. " steps)")
    texts.Achievements = table.concat(lines, "\r\n")

    -- --- Zones file ----------------------------------------------------------------------------------
    header("Zones", {
        "One line per placement, per uiMapId in stored order; (10) and (25) are the raid-size lists.",
        "Runs from different ZoneData keys on one map are sorted by key: the game's order between them",
        "is the pairs() order Data.lua schedules the groups in, not data.",
    })
    emit("== Zones ==")
    local mapIds = sortedKeys(data.Maps)
    local listFields = {}
    for _, l in ipairs(ZONE_LISTS) do listFields[l.Field] = true end
    local placements, multiSource = 0, 0
    for _, mapId in ipairs(mapIds) do
        local entry = data.Maps[mapId]
        local placed = 0
        for _, l in ipairs(ZONE_LISTS) do
            local list = entry[l.Field]
            if type(list) == "table" then
                local prefix = "ZONE " .. serialize(mapId) .. l.Tag .. " # "
                for _, ach in ipairs(canonical(list)) do
                    local achId = type(ach) == "table" and ach.Id or ach
                    lines[#lines + 1] = prefix .. (type(achId) == "number" and achId or serialize(achId))
                    placed = placed + 1
                end
                -- a group appends one contiguous run per list, so two runs are two ZoneData keys
                if runs[list] and #runs[list] > 1 then multiSource = multiSource + 1 end
            end
        end
        local more = extras(entry, listFields)
        if placed == 0 or more ~= "" then
            emit("ZONE " .. serialize(mapId) .. " |" .. (placed == 0 and " no achievements" or "") .. more)
        end
        placements = placements + placed
    end
    emit("")
    emit("== Summary ==")
    emit("maps                   " .. #mapIds)
    emit("placements             " .. placements)
    emit("lists fed by >1 key    " .. multiSource)
    texts.Zones = table.concat(lines, "\r\n")

    -- --- Registries file -----------------------------------------------------------------------------
    header("Registries", {
        "What the achievement data resolves against: patches, the content timeline, season anchors, events.",
    })

    emit("== Build versions ==")
    emit("# expansion is the BuildVersionData key; used means some achievement was added in that patch")
    local expansionOf = {}
    for key, major in pairs(type(KrowiAF.BuildVersionData) == "table" and KrowiAF.BuildVersionData or {}) do
        for _, minor in ipairs(major.Minors or {}) do
            for _, patch in ipairs(minor.Patches or {}) do
                expansionOf[KrowiAF.GetBuildVersionId(major.Major, minor.Minor, patch.Patch)] = key
            end
        end
    end
    local buildVersionIds = sortedKeys(data.BuildVersions)
    local used = 0
    for _, id in ipairs(buildVersionIds) do
        local bv = data.BuildVersions[id]
        emit("VERSION " .. dotted(id) .. " | expansion=" .. serialize(expansionOf[id]) .. (bv.InUse and " | used" or "")
            .. extras(bv, { Id = true, Major = true, Minor = true, Patch = true, Name = true, Description = true, InUse = true }))
        if bv.InUse then used = used + 1 end
    end
    emit("")

    emit("== Content timeline ==")
    local timelineIds = {}
    if type(data.ContentTimeline) == "table" then
        emit("# the Retail patch a Version anchor names -> the patch where this client reached that content")
        timelineIds = sortedKeys(data.ContentTimeline)
        for _, id in ipairs(timelineIds) do
            local target = data.ContentTimeline[id]
            emit("TIMELINE " .. dotted(id) .. " | target=" .. (type(target) == "table" and dotted(target.Id) or serialize(target)))
        end
    else
        emit("# none: this client is the reference timeline, so every Version anchor names its own patch")
    end
    emit("")

    emit("== Seasons ==")
    emit("# KrowiAF.AddSeasonData anchors; a season without one resolves through the game's season API")
    local seasonCount = 0
    local seasons = type(data.Seasons) == "table" and data.Seasons or {}
    for _, fn in ipairs(sortedKeys(seasons)) do
        for _, number in ipairs(sortedKeys(seasons[fn])) do
            local season = seasons[fn][number]
            emit("SEASON " .. escape(fn) .. " " .. serialize(number) .. " | start=" .. (season.Start ~= nil and dateOf(season.Start) or "none")
                .. " | end=" .. (season.End ~= nil and dateOf(season.End) or "none") .. extras(season, { Start = true, End = true }))
            seasonCount = seasonCount + 1
        end
    end
    emit("")

    emit("== Events ==")
    emit("# category is the id of the category the event's reminder opens; linked are the event's other ids")
    local eventCounts = {}
    for _, row in ipairs(eventRows) do
        local event = row.Event
        local fields = { "category=" .. (type(event.Category) == "table" and serialize(event.Category.Id) or "none"), "icon=" .. serialize(event.Icon) }
        if type(event.LinkedEventIds) == "table" then
            local ids = {}
            for i, linked in ipairs(event.LinkedEventIds) do ids[i] = serialize(linked) end
            fields[#fields + 1] = "linked=" .. table.concat(ids, ",")
        end
        if event.MapId ~= nil then fields[#fields + 1] = "map=" .. serialize(event.MapId) end
        emit("EVENT " .. row.TypeName .. " " .. serialize(row.Id) .. " | " .. table.concat(fields, " | ")
            .. extras(event, { Id = true, Type = true, Name = true, Category = true, Icon = true, LinkedEventIds = true, MapId = true }))
        eventCounts[row.TypeName] = (eventCounts[row.TypeName] or 0) + 1
    end
    emit("")

    emit("== Event schedules ==")
    emit("# KrowiAF.EventSchedules (Data/EventSchedules.lua): the cycle, the window per event relative to a cycle's start,")
    emit("# the rotation, the start per GetCurrentRegion(); fixed families run the reminders, observed ones are watched")
    local schedules = type(KrowiAF.EventSchedules) == "table" and KrowiAF.EventSchedules or {}
    local scheduleCount = 0
    local function pairsList(t)
        local parts = {}
        for _, k in ipairs(sortedKeys(t or {})) do
            local v = t[k]
            parts[#parts + 1] = serialize(k) .. ":" .. (type(v) == "table" and ("{" .. serialize(v[1]) .. "," .. serialize(v[2]) .. "}") or serialize(v))
        end
        return table.concat(parts, ",")
    end
    local function idList(t)
        local parts = {}
        for i, id in ipairs(t or {}) do parts[i] = serialize(id) end
        return table.concat(parts, ",")
    end
    for _, key in ipairs(sortedKeys(schedules)) do
        local family = schedules[key]
        local fields = { "cycle=" .. (family.Reset or serialize(family.Interval)) }
        if family.Fixed then fields[#fields + 1] = "fixed" end
        if family.Observe then fields[#fields + 1] = family.ByInfo and "observed (debug for POIs without time)" or "observed" end
        if family.Window then fields[#fields + 1] = "window={" .. serialize(family.Window[1]) .. "," .. serialize(family.Window[2]) .. "}" end
        if family.Windows then fields[#fields + 1] = "windows=" .. pairsList(family.Windows) end
        if family.Rotation then fields[#fields + 1] = "rotation=" .. idList(family.Rotation) end
        if family.Variants then fields[#fields + 1] = "variants=" .. idList(family.Variants) end
        if family.Anchors then fields[#fields + 1] = "anchors=" .. pairsList(family.Anchors) end
        if family.RotationAnchors then fields[#fields + 1] = "rotation anchors=" .. pairsList(family.RotationAnchors) end
        emit("SCHEDULE " .. escape(key) .. " | " .. table.concat(fields, " | "))
        scheduleCount = scheduleCount + 1
    end
    emit("")

    emit("== Summary ==")
    emit("build versions         " .. #buildVersionIds .. "   (" .. used .. " used)")
    emit("content timeline       " .. #timelineIds)
    emit("season anchors         " .. seasonCount)
    for _, typeName in ipairs(sortedKeys(eventCounts)) do
        emit(string.format("%-22s %d", "events " .. typeName, eventCounts[typeName]))
    end
    emit(string.format("%-22s %d", "event schedules", scheduleCount))
    texts.Registries = table.concat(lines, "\r\n")

    return texts
end

-------------------------------------------------------------------------------------------------
-- Comparison: keyed, so a difference is reported as what changed, not as a moved line
-------------------------------------------------------------------------------------------------
local function readBaseline(rel)
    local f = io.open(root .. "/" .. rel, "rb")
    if not f then return nil end
    local s = f:read("*a")
    f:close()
    if s:sub(1, 3) == "\239\187\191" then s = s:sub(4) end
    return s
end

-- Every data line is a record, "<KEY> | <field> | <field>", or a list entry, "<KEY> # <entry>", whose
-- entries are gathered in order under their key. Comments, headings and the summary only count as a
-- whole: the summary is derived from the entries and would only repeat their differences.
local function parse(text)
    local entries, order, other = {}, {}, {}
    local section, n = "", 0
    for line in (text .. "\n"):gmatch("(.-)\r?\n") do
        n = n + 1
        if line:sub(1, 3) == "== " then
            section = line
            other[#other + 1] = line
        elseif line == "" or line:sub(1, 1) == "#" or section == "== Summary ==" then
            other[#other + 1] = line
        else
            local key, item = line:match("^(.-) # (.*)$")
            if key then
                key = key .. " #"
                local e = entries[key]
                if not e then
                    e = { Line = n, Items = {} }
                    entries[key] = e
                    order[#order + 1] = key
                end
                e.Items[#e.Items + 1] = item
            else
                key = line:match("^(.-) | ") or line
                local unique, dup = key, 1
                while entries[unique] do dup = dup + 1; unique = key .. " @" .. dup end
                entries[unique] = { Line = n, Fields = line:match("^.- | (.*)$") or "" }
                order[#order + 1] = unique
            end
        end
    end
    return entries, order, table.concat(other, "\n")
end

local labels = { ACH = "achievement %s", TIP = "achievement %s tooltip", TRANSMOG = "achievement %s transmog sets",
    PETBATTLE = "achievement %s pet battle link", ZONE = "zone %s", VERSION = "build version %s", TIMELINE = "content timeline %s",
    SEASON = "season %s", EVENT = "event %s", SCHEDULE = "event schedule %s", FAIL = "load failure %s" }

local function label(key)
    local kind, rest = key:match("^(%u+) (.*)$")
    if not kind or not labels[kind] then return key end
    return labels[kind]:format((rest:gsub(" #$", "")))
end

local function shorten(s)
    s = tostring(s)
    if #s > 300 then return s:sub(1, 300) .. "..." end
    return s
end

local function listed(t)
    local shown = {}
    for i = 1, math.min(#t, 10) do shown[i] = t[i] end
    return table.concat(shown, ", ") .. (#t > 10 and string.format(" and %d more", #t - 10) or "")
end

local function fieldMap(s)
    local names, values = {}, {}
    if s == "" then return names, values end
    for token in (s .. " | "):gmatch("(.-) | ") do
        local name, value = token:match("^(%w+)=(.*)$")
        if not name then name, value = token, true end
        if values[name] == nil then names[#names + 1] = name end
        values[name] = value
    end
    return names, values
end

-- "faction Alliance -> Horde; now pvp; reward (none) -> Mount"
local function describeFields(was, now)
    local wasNames, wasValues = fieldMap(was)
    local nowNames, nowValues = fieldMap(now)
    local names, seen = {}, {}
    for _, list in ipairs({ nowNames, wasNames }) do
        for _, name in ipairs(list) do
            if not seen[name] then seen[name], names[#names + 1] = true, name end
        end
    end
    local parts = {}
    for _, name in ipairs(names) do
        local a, b = wasValues[name], nowValues[name]
        if a ~= b then
            if a == true and b == nil then parts[#parts + 1] = "no longer " .. name
            elseif a == nil and b == true then parts[#parts + 1] = "now " .. name
            else
                local function shown(v) return v == nil and "(none)" or (v == true and "(set)" or shorten(v)) end
                parts[#parts + 1] = name .. " " .. shown(a) .. " -> " .. shown(b)
            end
        end
    end
    return table.concat(parts, "; ")
end

-- "gone 12345; new 12346", or the first moved position when only the order changed; the second
-- result is the index in the baseline list of the first entry concerned, so the message points at it
local function describeItems(was, now)
    local left = {}
    for _, v in ipairs(was) do left[v] = (left[v] or 0) + 1 end
    for _, v in ipairs(now) do left[v] = (left[v] or 0) - 1 end
    local gone, new, at = {}, {}, nil
    for i, v in ipairs(was) do
        if left[v] > 0 then gone[#gone + 1], left[v], at = v, left[v] - 1, at or i end
    end
    for i, v in ipairs(now) do
        if left[v] < 0 then new[#new + 1], left[v], at = v, left[v] + 1, at or math.min(i, #was) end
    end
    if #gone == 0 and #new == 0 then
        for i = 1, #now do
            if was[i] ~= now[i] then
                return string.format("the same %d entries in a different order, from position %d: was %s, now %s", #now, i, was[i], now[i]), i
            end
        end
        return nil
    end
    local parts = {}
    if #gone > 0 then parts[#parts + 1] = "gone " .. listed(gone) end
    if #new > 0 then parts[#parts + 1] = "new " .. listed(new) end
    return table.concat(parts, "; "), at
end

-- One message per key that differs, at its line in the baseline (the file on disk); a new key is
-- placed at the line of the key before it
local function compare(baseline, current)
    local was, wasOrder, wasOther = parse(baseline)
    local now, nowOrder, nowOther = parse(current)
    local messages = {}
    local lastLine = 1
    for _, key in ipairs(nowOrder) do
        local a, b = was[key], now[key]
        if a then
            lastLine = a.Line + (a.Items and (#a.Items - 1) or 0)
            local text, at
            if b.Items then text, at = describeItems(a.Items, b.Items) elseif a.Fields ~= b.Fields then text = describeFields(a.Fields, b.Fields) end
            if text and text ~= "" then messages[#messages + 1] = { Line = a.Line + math.max((at or 1) - 1, 0), Text = label(key) .. ": " .. text } end
        elseif b.Items then
            messages[#messages + 1] = { Line = lastLine, Text = label(key) .. ": new, " .. listed(b.Items) }
        else
            messages[#messages + 1] = { Line = lastLine, Text = label(key) .. ": new" .. (b.Fields ~= "" and (", " .. shorten(b.Fields)) or "") }
        end
    end
    for _, key in ipairs(wasOrder) do
        local a = was[key]
        if not now[key] then
            local had = a.Items and listed(a.Items) or shorten(a.Fields)
            messages[#messages + 1] = { Line = a.Line, Text = label(key) .. ": gone" .. (had ~= "" and (", was " .. had) or "") }
        end
    end
    if #messages == 0 then
        messages[1] = { Line = 1, Text = wasOther ~= nowOther
            and "every entry matches but a header, heading or summary line differs: the generator changed, so regenerate with -write"
            or "every line matches but the bytes differ: line endings or encoding changed, so regenerate with -write" }
    end
    table.sort(messages, function(a, b)
        if a.Line ~= b.Line then return a.Line < b.Line end
        return a.Text < b.Text
    end)
    return messages
end

-------------------------------------------------------------------------------------------------
-- Modes
-------------------------------------------------------------------------------------------------
local clients = clientArg == "Both" and { "Retail", "Classic" } or { clientArg }
local problems = 0

for _, client in ipairs(clients) do
    local texts = buildSnapshot(client)
    for _, kind in ipairs(KINDS) do
        local text, rel = texts[kind], snapshotPath(kind, client)

        if mode == "-stdout" then
            io.stdout:write("---------- ", rel, " ----------\r\n", text, "\r\n")
        elseif mode == "-write" then
            os.execute('if not exist "' .. (root .. "/" .. SNAPSHOT_DIR):gsub("/", "\\") .. '" mkdir "' .. (root .. "/" .. SNAPSHOT_DIR):gsub("/", "\\") .. '"')
            local f = assert(io.open(root .. "/" .. rel, "wb"))
            f:write(text)
            f:close()
            io.stdout:write(string.format("snapshot-data: wrote %s (%d bytes)\n", rel, #text))
        else -- -check
            local baseline = readBaseline(rel)
            if not baseline then
                io.stderr:write(string.format("%s:1: no committed baseline for %s; run snapshot-data.lua with -write and commit it\n", rel, client))
                problems = problems + 1
            elseif baseline == text then
                io.stdout:write(string.format("snapshot-data %s %s: matches the baseline\n", kind, client))
            else
                local messages = compare(baseline, text)
                io.stderr:write(string.format("%s:%d: the %s %s data no longer matches the recorded baseline: %d difference(s). Review them; if they are intended, regenerate with -write and commit the diff with the data that caused it\n",
                    rel, messages[1].Line, client, kind:lower(), #messages))
                local shown = math.min(#messages, 40)
                for i = 1, shown do io.stderr:write(string.format("%s:%d:   %s\n", rel, messages[i].Line, messages[i].Text)) end
                if #messages > shown then io.stderr:write(string.format("%s:%d:   ... and %d more\n", rel, messages[shown].Line, #messages - shown)) end
                problems = problems + 1
            end
        end
    end
end

if mode == "-check" then
    io.stdout:write(string.format("snapshot-data: %d mismatch(es)\n", problems))
    os.exit(problems == 0 and 0 or 1)
end