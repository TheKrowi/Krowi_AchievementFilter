---@diagnostic disable: lowercase-global, undefined-global
-- Writes Settings/Renames.lua, the rename table migration 1 moves the old options with (docs/work/2026-11-25-settings-store,
-- requirement 13): one explicit row per old value path, and the few map and object specs. No catch-all reaches the
-- file: the naming rules below are applied here only, to the paths the old code was proven to write (the frozen
-- fixtures/settings-option-paths-<client>.lua of plan step 1) and the hand rows, so an old path nobody listed has no
-- row and is left behind (and logged), never given a guessed key.
--
--   lua.exe .claude\tools\headless\generate-renames.lua <repo root>
--
-- It refuses (and writes nothing) when two old paths would share a key, a path under a map's prefix has the wrong
-- depth, or the rows differ from docs/work/2026-11-25-settings-store/renames.md, the table Krowi approved.

local root = arg[1]
assert(root, "usage: generate-renames.lua <repo root>")
root = root:gsub("\\", "/"):gsub("/$", "")
local dir = root .. "/.claude/tools/headless"

-- Maps: old subtrees whose entries are keyed by an id (kept as the old file keys it), one or two levels deep; Leaf:
-- the field under each entry that the map takes (the tabs keep their Show and Order in one table today)
local maps = {
    { Path = { "EventReminders", "CalendarEvents" }, Key = "eventReminders.calendarEvents", Depth = 1 },
    { Path = { "EventReminders", "WorldEvents" }, Key = "eventReminders.worldEvents", Depth = 1 },
    { Path = { "EventReminders", "WidgetEvents" }, Key = "eventReminders.widgetEvents", Depth = 1 },
    { Path = { "AdjustableCategories" }, Key = "categories.shownOnTab", Depth = 2 },
    { Path = { "Tabs" }, Key = "tabs.show", Depth = 2, Leaf = "Show" },
    { Path = { "Tabs" }, Key = "tabs.order", Depth = 2, Leaf = "Order" },
}

-- Objects: old subtrees moved whole, as the live table's saved difference
local objects = {
    { Path = { "AchievementPoints", "Tooltip", "Sort", "Priority" }, Key = "tooltips.points.sortPriority" },
    { Path = { "AchievementPoints", "Tooltip", "Sort", "Reverse" }, Key = "tooltips.points.sortReverse" },
    { Path = { "Minimap" }, Key = "minimap.icon" },
}

-- Value paths no option the proof sets writes (renames.md, Rows no option writes)
local handRows = { "Experimental.CollectionsAchievementWindow" }

-- The naming rules (renames.md): {pattern, key with %n for the captures, scope}; the first that matches wins
local rules = {
    { "^Features%.PopOut$", "popOut.enabled" },
    { "^Features%.RewardPreview$", "rewardPreview.enabled" },
    { "^Features%.RightClickMenu$", "rightClickMenu.enabled" },
    { "^Achievements%.Modifiers%.PopOut$", "popOut.modifier" },
    { "^Achievements%.Modifiers%.(.+)$", "keys.modifiers.%1" },
    { "^Achievements%.ShowRewardPreviewIcon$", "rewardPreview.showIcon" },
    { "^Achievements%.RewardPreview(.+)$", "rewardPreview.%1" },
    { "^Achievements%.Guide%.(.+)$", "guides.%1" },
    { "^Achievements%.EnableTabPriority$", "window.tabPriority.enabled" },
    { "^Achievements%.TabPriority$", "window.tabPriority.tab" },
    { "^Achievements%.(.+)$", "achievements.%1" },
    { "^Popout%.(.+)$", "popOut.%1" },
    { "^RightClickMenu%.(.+)$", "rightClickMenu.%1" },
    { "^EventReminders%.(.+)$", "eventReminders.%1" },
    { "^TabsGeneral%.Spacing$", "tabs.spacing" },
    { "^Experimental%.(.+)$", "advanced.experimental.%1", "account" },
    { "^Window%.MergeSmallCategoriesThreshold$", "categories.mergeSmallThreshold" },
    { "^Window%.RememberLastPosition%.(.+)$", "window.rememberPosition.%1" },
    { "^Window%.(.+)$", "window.%1" },
    { "^ResetViewOnOpen$", "window.resetViewOnOpen" },
    { "^ToggleWindow$", "window.toggleWindow" },
    { "^MicroButtonTab$", "window.microButtonTab" },
    { "^CenterHeader$", "window.centerHeader" },
    { "^TrackAchievementBrowserHistory$", "window.trackBrowsingHistory" },
    { "^AchievementPoints%.Format$", "window.pointsFormat" },
    { "^Calendar%.ButtonOffset(.)$", "window.calendarButton.offset%1" },
    { "^Calendar%.(.+)$", "calendar.%1" },
    { "^DataManager%.(.+)$", "dataManager.%1" },
    { "^Tooltip%.Categories%.(.+)$", "categories.tooltip.%1" },
    { "^Categories%.(.+)$", "categories.%1" },
    { "^Summary%.(.+)$", "summary.%1" },
    { "^Filters%.(.+)$", "filtering.%1" },
    { "^SearchBox%.(.+)$", "searchBox.%1" },
    { "^Tooltip%.Achievements%.(.+)$", "tooltips.%1" },
    { "^AchievementPoints%.Tooltip%.(.+)$", "tooltips.points.%1" },
    { "^Tooltip%.Criteria%.(.+)$", "unitTooltips.criteria.%1" },
    { "^ShowWorldmapIcon$", "worldMap.showIcon" },
    { "^AddAddonNameToWorldMapIcon$", "worldMap.addAddonName" },
    { "^ShowMinimapIcon$", "minimap.showIcon" },
    { "^Plugins%.(.+)$", "plugins.%1" },
    { "^EnableDebugInfo$", "advanced.debugInfo", "account" },
    { "^EnableTraceInfo$", "advanced.traceInfo", "account" },
    { "^EnableTaintDiagnostics$", "advanced.taintDiagnostics", "account" },
    { "^PrintMapInfo$", "advanced.printMapInfo", "account" },
    { "^ShowPlaceholdersFilter$", "advanced.placeholdersFilter", "account" },
}

local function Camel(key)
    local parts = {}
    for segment in key:gmatch("[^%.]+") do parts[#parts + 1] = segment:sub(1, 1):lower() .. segment:sub(2) end
    return table.concat(parts, ".")
end

local function Split(path)
    local segments = {}
    for segment in path:gmatch("[^%.]+") do segments[#segments + 1] = segment end
    return segments
end

local function Under(segments, prefix)
    for i, name in ipairs(prefix) do
        if segments[i] ~= name then return false end
    end
    return true
end

local problems = {}
local function Problem(text) problems[#problems + 1] = text end

-- A path's home: "map", "object" or "value" with its key and scope
local function Classify(path)
    local segments = Split(path)
    for _, object in ipairs(objects) do
        if Under(segments, object.Path) then return "object", object.Key end
    end
    for _, map in ipairs(maps) do
        if Under(segments, map.Path) then
            local rest = #segments - #map.Path
            local want = map.Depth + (map.Leaf and 1 or 0)
            if not map.Leaf or segments[#segments] == map.Leaf then
                if rest ~= want then Problem("depth: " .. path .. " under the map " .. map.Key) end
                if map.Depth == 1 and not segments[#segments]:match("^%d+$") then Problem("not an id: " .. path) end
                return "map", map.Key
            end
        end
    end
    for _, rule in ipairs(rules) do
        local captures = { path:match(rule[1]) }
        if captures[1] ~= nil then
            local key = rule[2]:gsub("%%(%d)", function(n) return captures[tonumber(n)] end)
            return "value", Camel(key), rule[3] or "profile"
        end
    end
end

-- The known paths: every path an option of the old code writes, on either client, and the hand rows
local values, accountKeys, mapKeys = {}, {}, {}
local function Add(path)
    local kind, key, scope = Classify(path)
    if kind == nil then
        Problem("no rule: " .. path)
    elseif kind == "value" then
        values[path] = key
        if scope == "account" then accountKeys[key] = true end
    else
        mapKeys[key] = kind
    end
end
for _, client in ipairs({ "Retail", "Classic" }) do
    local optionPaths = assert(loadfile(dir .. "/fixtures/settings-option-paths-" .. client .. ".lua"))()
    for _, paths in next, optionPaths do
        for _, path in ipairs(paths) do
            local short = path:match("^KrowiAF_Options%.profiles%.%*%.(.+)$")
            if short then Add(short) else Problem("not an options path: " .. path) end
        end
    end
end
for _, path in ipairs(handRows) do Add(path) end

-- No two old paths on one key, and no value key that is also a map's or object's
local byKey = {}
for path, key in next, values do
    if byKey[key] then Problem("shared key " .. key .. ": " .. byKey[key] .. " and " .. path) end
    byKey[key] = path
end
for _, list in ipairs({ maps, objects }) do
    for _, spec in ipairs(list) do
        if byKey[spec.Key] then Problem("value key " .. spec.Key .. " is also a map or object") end
    end
end

-- The same rows as renames.md
local md = assert(io.open(root .. "/docs/work/2026-11-25-settings-store/renames.md", "rb")):read("*a")
local mdValues, mdOthers = {}, {}
for line in md:gmatch("[^\r\n]+") do
    local old, key, kind, scope = line:match("^| `([^`]+)`[^|]* | `([^`]+)` | (%a+) | (%a+) |")
    if old and kind == "value" then
        mdValues[old] = key
        if (scope == "account") ~= (accountKeys[key] == true) then Problem("scope differs from renames.md: " .. old) end
    elseif old then
        mdOthers[key] = kind
    end
end
for path, key in next, values do
    if mdValues[path] ~= key then Problem(("%s: %s here, %s in renames.md"):format(path, key, tostring(mdValues[path]))) end
end
for path, key in next, mdValues do
    if values[path] == nil then Problem(("%s: %s in renames.md, no row here"):format(path, key)) end
end
for _, list in ipairs({ maps, objects }) do
    for _, spec in ipairs(list) do
        if not mdOthers[spec.Key] then Problem("not in renames.md: " .. spec.Key) end
    end
end

if #problems > 0 then
    table.sort(problems)
    io.stderr:write(table.concat(problems, "\n"), "\n")
    os.exit(1)
end

-- The file
local function Quote(s) return ("%q"):format(s) end
local function PathList(path)
    local parts = {}
    for i, name in ipairs(path) do parts[i] = Quote(name) end
    return "{ " .. table.concat(parts, ", ") .. " }"
end
local out = {}
local function P(line) out[#out + 1] = line end
P("local _, addon = ...")
P("")
P("-- Generated by .claude/tools/headless/generate-renames.lua from the old code's option paths (docs/work/2026-11-25-settings-store,")
P("-- renames.md); do not edit. Migration 1 and its check move each options profile's old values with it: an old value path")
P("-- with no row is left behind and logged, never given a guessed key.")
P("addon.Settings.Renames = {")
P("    -- old value path (in each options profile) -> new key")
P("    Values = {")
local paths, valueCount = {}, 0
for path in next, values do paths[#paths + 1] = path end
table.sort(paths)
for _, path in ipairs(paths) do
    P(("        [%s] = %s,"):format(Quote(path), Quote(values[path])))
    valueCount = valueCount + 1
end
P("    },")
P("    -- the new keys of account scope: their value comes from the profile of the character that logs in first")
P("    Account = {")
local account = {}
for key in next, accountKeys do account[#account + 1] = key end
table.sort(account)
for _, key in ipairs(account) do P(("        [%s] = true,"):format(Quote(key))) end
P("    },")
P("    -- old subtrees whose entries keep their old keys (numbers stay numbers); Leaf: the field each entry gives the map")
P("    Maps = {")
for _, map in ipairs(maps) do
    P(("        { Path = %s, Key = %s, Depth = %d%s },"):format(PathList(map.Path), Quote(map.Key), map.Depth,
        map.Leaf and (", Leaf = " .. Quote(map.Leaf)) or ""))
end
P("    },")
P("    -- old subtrees moved whole into an object")
P("    Objects = {")
for _, object in ipairs(objects) do P(("        { Path = %s, Key = %s },"):format(PathList(object.Path), Quote(object.Key))) end
P("    },")
P("}")
local f = assert(io.open(root .. "/Settings/Renames.lua", "wb"))
f:write(table.concat(out, "\r\n"))
f:close()
print(("Settings/Renames.lua: %d value rows (%d account), %d maps, %d objects"):format(valueCount, #account, #maps, #objects))