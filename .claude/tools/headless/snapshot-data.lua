---@diagnostic disable: lowercase-global, undefined-global, need-check-nil
-- Data snapshot: builds the data for a client in the shared headless environment (client-env.lua) and
-- records as text every data-derived achievement property, every zone placement and the registries the
-- achievement data resolves against, so a data change - obtainability, seasons, build versions,
-- faction, rewards, zone assignment - is a reviewable diff instead of something to reason out. The
-- sibling of snapshot-categories.lua, which records the category tree; nothing here repeats it. The
-- per-achievement lines (ACH, TIP, TRANSMOG, PETBATTLE, GUIDE, EVENT) come from data-format.lua, which
-- show-achievement.lua prints too, so Show-Achievement.ps1 shows the very line recorded here.
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

local dataFormat = assert(loadfile(scriptDir .. "/data-format.lua"))()

local SNAPSHOT_DIR = ".claude/tools/headless/snapshots"
local KINDS = { "Achievements", "Zones", "Registries" }
local ZONE_LISTS = dataFormat.ZONE_LISTS

local function snapshotPath(kind, client)
    return SNAPSHOT_DIR .. "/" .. kind .. "." .. client .. ".txt"
end

-- The rendering helpers and the per-achievement lines live in data-format.lua, shared with
-- show-achievement.lua, so the line Show-Achievement.ps1 prints is the line recorded here
local escape, serialize, sortList, sortedKeys = dataFormat.Escape, dataFormat.Serialize, dataFormat.SortList, dataFormat.SortedKeys
local extras, dotted, dateOf = dataFormat.Extras, dataFormat.Dotted, dataFormat.DateOf

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

    -- --- the per-achievement lines, shared with show-achievement.lua --------------------------------
    local fmt = dataFormat.New(ctx)
    local eventsOf, eventRows, previews = fmt.EventsOf, fmt.EventRows, fmt.Previews

    local achievementIds = {}
    for id, ach in pairs(data.Achievements) do
        if type(ach) == "table" then achievementIds[#achievementIds + 1] = id end
    end
    sortList(achievementIds)

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
        emit(fmt.AchievementLine(id, ach))
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
    local tooltipIds, tooltipEntries = fmt.TooltipIds, 0
    for _, id in ipairs(tooltipIds) do
        local tips = fmt.TooltipLines(id)
        for _, l in ipairs(tips) do emit(l) end
        tooltipEntries = tooltipEntries + #tips
    end
    emit("")

    emit("== Transmog sets ==")
    emit("# per achievement, in stored order")
    local transmogAchievements, transmogSets = 0, 0
    for _, id in ipairs(achievementIds) do
        local sets = fmt.TransmogLines(id)
        if sets then
            transmogAchievements = transmogAchievements + 1
            for _, l in ipairs(sets) do emit(l) end
            transmogSets = transmogSets + #sets
        end
    end
    emit("")

    emit("== Pet battle links ==")
    emit("# per achievement: the link, then its criteria links in stored order; link texts are names, left out")
    local petBattleLinks, petBattleCriteria = fmt.PetBattleLinkIds, 0
    for _, id in ipairs(petBattleLinks) do
        local links, criteria = fmt.PetBattleLines(id)
        for _, l in ipairs(links) do emit(l) end
        petBattleCriteria = petBattleCriteria + criteria
    end
    emit("")

    emit("== Guides ==")
    emit("# per achievement, the steps in stored order; an NPC's name is the data's English one, a tip a locale string, left out")
    local guideAchievements, guideSteps = 0, 0
    for _, id in ipairs(achievementIds) do
        local steps = fmt.GuideLines(id)
        if steps then
            guideAchievements = guideAchievements + 1
            for _, l in ipairs(steps) do emit(l) end
            guideSteps = guideSteps + #steps
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
        emit(fmt.EventLine(row))
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
        if family.Anchor then fields[#fields + 1] = "anchor elsewhere=" .. serialize(family.Anchor) end
        if family.Requires then fields[#fields + 1] = "requires quest=" .. serialize(family.Requires) end
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