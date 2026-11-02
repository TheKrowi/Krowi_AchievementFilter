---@diagnostic disable: lowercase-global, undefined-global, need-check-nil
-- The text form of the data a client builds, shared by snapshot-data.lua (which writes it for every
-- achievement into the baselines under snapshots/) and show-achievement.lua (which prints it for the ids
-- asked about), so the two can never drift apart: the ACH line Show-Achievement.ps1 prints is the line
-- the snapshot holds, byte for byte. Nothing here writes or compares files.
--
--   local dataFormat = assert(loadfile(dir .. "/data-format.lua"))()
--   local fmt = dataFormat.New(ctx)          -- ctx from client-env.lua, after LoadFiles and RunPipeline
--   fmt.AchievementLine(id, ach)             -- "ACH 5313 | patch=4.0.3 | obtainable=[...]"
--   fmt.TooltipLines(id), fmt.TransmogLines(id), fmt.PetBattleLines(id), fmt.GuideLines(id), fmt.EventLine(row)
--
-- The rendering rules (ids not names, anchors as declared, deterministic order) are snapshot-data.lua's;
-- its header explains them.

local M = {}

-- the three lists Api/ZoneDataApi.lua fills per map; the raid-size forms only exist for old raids
M.ZONE_LISTS = { { Field = "Achievements", Tag = "" }, { Field = "Achievements10", Tag = " (10)" }, { Field = "Achievements25", Tag = " (25)" } }

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

M.Escape, M.Serialize, M.LessThan, M.SortList, M.SortedKeys = escape, serialize, lessThan, sortList, sortedKeys
M.Extras, M.Reverse, M.NameOf, M.Dotted, M.DateOf = extras, reverse, nameOf, dotted, dateOf

-------------------------------------------------------------------------------------------------
-- The per-achievement lines of one built client
-------------------------------------------------------------------------------------------------
function M.New(ctx)
    local KrowiAF = ctx:KrowiAF()
    local data = ctx.addon.Data
    local fmt = {}

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
    fmt.EventsOf, fmt.EventRows = eventsOf, eventRows

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
    fmt.Record = record

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
    fmt.Previews = previews

    function fmt.AchievementLine(id, ach)
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
    for _, list in pairs(tooltips) do
        table.sort(list, function(a, b)
            if a.Criteria ~= b.Criteria then return a.Criteria < b.Criteria end
            if a.Type ~= b.Type then return a.Type < b.Type end
            if a.Object ~= b.Object then return a.Object < b.Object end
            return a.Text < b.Text
        end)
    end
    fmt.TooltipIds = sortedKeys(tooltips)

    -- per achievement, sorted: criteria <index>: <tooltip data type> <object id> [faction <faction>]
    function fmt.TooltipLines(id)
        local lines = {}
        for _, e in ipairs(tooltips[id] or {}) do lines[#lines + 1] = "TIP " .. serialize(id) .. " # " .. e.Text end
        return lines
    end

    -- per achievement, in stored order; nil when the achievement has no transmog sets at all
    function fmt.TransmogLines(id)
        local ach = data.Achievements[id]
        if type(ach) ~= "table" or ach.TransmogSetIds == nil then return nil end
        local sets = ach.TransmogSetIds
        local lines = {}
        for _, setId in ipairs(type(sets) == "table" and sets or { sets }) do
            lines[#lines + 1] = "TRANSMOG " .. serialize(id) .. " # " .. serialize(setId)
        end
        return lines
    end

    local petBattleLinks = {}
    for id, link in pairs(type(data.PetBattleLinkData) == "table" and data.PetBattleLinkData or {}) do
        if type(id) == "number" and type(link) == "table" then petBattleLinks[#petBattleLinks + 1] = id end
    end
    fmt.PetBattleLinkIds = sortList(petBattleLinks)

    -- the link, then its criteria links in stored order; link texts are names, left out. The second
    -- result counts the criteria (a child adds a line, not a criterion)
    function fmt.PetBattleLines(id)
        local link = type(data.PetBattleLinkData) == "table" and data.PetBattleLinkData[id]
        if type(link) ~= "table" then return {}, 0 end
        local lines, criteria = {}, 0
        lines[1] = "PETBATTLE " .. serialize(id) .. " | link=" .. serialize(link.Link) .. extras(link, { Link = true, Criteria = true })
        for _, c in ipairs(type(link.Criteria) == "table" and link.Criteria or {}) do
            local head = c.CriteriaIndex ~= nil and ("criteria " .. serialize(c.CriteriaIndex)) or "text"
            lines[#lines + 1] = "PETBATTLE " .. serialize(id) .. " # " .. head .. ": " .. serialize(c.Link)
            for _, child in ipairs(type(c.Children) == "table" and c.Children or {}) do
                lines[#lines + 1] = "PETBATTLE " .. serialize(id) .. " # " .. head .. " child: " .. serialize(child.Link)
            end
            criteria = criteria + 1
        end
        return lines, criteria
    end

    -- the steps in stored order; an NPC's name is the data's English one, a tip a locale string, left
    -- out; nil when the achievement has no guide
    function fmt.GuideLines(id)
        local ach = data.Achievements[id]
        if type(ach) ~= "table" or ach.Guide == nil then return nil end
        local steps = ach.Guide
        local lines = {}
        for i, step in ipairs(type(steps) == "table" and steps or { steps }) do
            local stepType = type(step) == "table" and step.Type or step
            local fields = type(step) == "table" and extras(step, { Type = true, Text = true }) or ""
            lines[#lines + 1] = "GUIDE " .. serialize(id) .. " # " .. i .. " " .. serialize(stepType) .. fields
        end
        return lines
    end

    -- one row of fmt.EventRows: category is the id of the category the event's reminder opens, linked
    -- are the event's other ids
    function fmt.EventLine(row)
        local event = row.Event
        local fields = { "category=" .. (type(event.Category) == "table" and serialize(event.Category.Id) or "none"), "icon=" .. serialize(event.Icon) }
        if type(event.LinkedEventIds) == "table" then
            local ids = {}
            for i, linked in ipairs(event.LinkedEventIds) do ids[i] = serialize(linked) end
            fields[#fields + 1] = "linked=" .. table.concat(ids, ",")
        end
        if event.MapId ~= nil then fields[#fields + 1] = "map=" .. serialize(event.MapId) end
        return "EVENT " .. row.TypeName .. " " .. serialize(row.Id) .. " | " .. table.concat(fields, " | ")
            .. extras(event, { Id = true, Type = true, Name = true, Category = true, Icon = true, LinkedEventIds = true, MapId = true })
    end

    return fmt
end

return M