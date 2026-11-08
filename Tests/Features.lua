local addonName, addon = ...
addon.Tests.Features = {}
local features = addon.Tests.Features

-- The features that switch off (docs/work/2026-11-08-feature-split-poc): each feature's state against its switch.
-- - A feature that is off never starts: no frame, no data, no entry in a core slot (Slots.lua), nothing made while its
--   files load. One that is on has them all.
-- - A boot is "off" or "on" by the feature's switch in the profile (on while the profile has none), so a run checks the
--   state it finds: in game the switches of the moment (/kaftest matrix sets them for each step), headlessly
--   (.claude/tools/headless/run-tests.lua) two boots of the whole addon through options-env.lua, one per state.
-- - The file-load check (load) watches every file under Features/ while it loads and runs headlessly only; in game it is
--   a SKIP.
-- - In game the suite also records the addon's memory after a full collect, with no threshold.
-- Tests may name features (the feature-boundary lint rule exempts Tests/); a feature's own checks are listed in Known.
-- Before the registry (until 2026-11-08, verified headlessly) there was no switch default and no registry, and the reward
-- preview's frame was made at file load and its data kept whatever the profile said; Recorded is now the spec's Target.

-- Name: the feature's folder under Features/ and its key in the registry
-- Switch: its saved path in the profile; Frame: a frame it makes; Data: what its data load keeps
-- Help: the section id of its help page
features.Known = {
    {Name = "RewardPreview", Switch = {"Features", "RewardPreview"}, Frame = "KrowiAF_RewardPreview", Help = "rewards",
        Data = function() return addon.Data.RewardPreviewData end}
}

-- Check: what is observed; Recorded and Target per boot state
features.Scenarios = {
    {Check = "default", Recorded = {off = "default on", on = "default on"}, Target = {off = "default on", on = "default on"}},
    {Check = "started", Recorded = {off = "not started", on = "started"}, Target = {off = "not started", on = "started"}},
    {Check = "frame", Recorded = {off = "none", on = "frame"}, Target = {off = "none", on = "frame"}},
    {Check = "data", Recorded = {off = "none", on = "data"}, Target = {off = "none", on = "data"}},
    {Check = "slots", Recorded = {off = "owns none", on = "owns entries"}, Target = {off = "owns none", on = "owns entries"}},
    -- its help page in the options window: Show me while started; while off no Show me and the off line on top
    {Check = "help", Recorded = {off = "off line", on = "show me"}, Target = {off = "off line", on = "show me"}},
    {Check = "load", Recorded = {off = "nothing made", on = "nothing made"}, Target = {off = "nothing made", on = "nothing made"}}
}

local function Read(tbl, path)
    for _, key in ipairs(path) do
        if type(tbl) ~= "table" then
            return nil
        end
        tbl = tbl[key]
    end
    return tbl
end

-- "on" or "off" by the feature's switch in the current profile; on while the profile has none
function features.State(feature)
    local db = addon.Options and addon.Options.db
    local value = db and Read(db.profile, feature.Switch)
    return value == false and "off" or "on"
end

local observe = {}

function observe.default(feature)
    local defaults = addon.Options and addon.Options.Defaults and addon.Options.Defaults.profile
    return Read(defaults, feature.Switch) == true and "default on" or "no default"
end

function observe.started(feature)
    local registry = addon.Features
    if type(registry) ~= "table" or type(registry.IsStarted) ~= "function" then
        return "no registry"
    end
    return registry.IsStarted(feature.Name) and "started" or "not started"
end

function observe.frame(feature, env)
    return env.Global(feature.Frame) ~= nil and "frame" or "none"
end

function observe.data(feature)
    local data = feature.Data()
    return type(data) == "table" and next(data) ~= nil and "data" or "none"
end

function observe.slots(feature)
    local slots = addon.Slots
    if type(slots) ~= "table" or type(slots.Owned) ~= "function" then
        return "no slots"
    end
    return #slots.Owned(feature.Name) > 0 and "owns entries" or "owns none"
end

function observe.help(feature)
    local window = addon.Options.Window
    local page = window and window.Help and window.Help[feature.Help]
    if not page then
        return "no page"
    end
    local title
    for _, registered in ipairs(addon.Features.List()) do
        if registered.Name == feature.Name then
            title = registered.Title
        end
    end
    local offLine = title and addon.L["Feature Off Help"]:K_ReplaceVars({feature = title})
    local first = page.Blocks and page.Blocks[1]
    local hasOffLine = offLine ~= nil and first ~= nil and first.Text == offLine
    local hasShowMe = type(page.ShowMe) == "function"
    if hasShowMe and not hasOffLine then
        return "show me"
    elseif hasOffLine and not hasShowMe then
        return "off line"
    end
    return hasShowMe and "show me and off line" or "neither"
end

-- env.LoadCalls: { {File, What} } for everything made while a file loaded; only files under Features/<Name>/ count
function observe.load(feature, env)
    if not env.LoadCalls then
        return nil, "headless only: the file load is watched headlessly"
    end
    local prefix = "Features/" .. feature.Name .. "/"
    local made = {}
    for _, call in ipairs(env.LoadCalls) do
        if call.File:sub(1, #prefix) == prefix then
            made[#made + 1] = call.File .. " " .. call.What
        end
    end
    if #made > 0 then
        return "made " .. table.concat(made, ", ")
    end
    return env.HasFeatureFiles and env.HasFeatureFiles(feature.Name) and "nothing made" or "no feature files"
end

-- env: Global(name) -> value; LoadCalls and HasFeatureFiles(name) headlessly; State(feature) overrides the profile's
-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line
function features.Run(env, observations)
    local results = {}
    for _, feature in ipairs(features.Known) do
        local state = env.State and env.State(feature) or features.State(feature)
        tinsert(observations, ("%s is %s"):format(feature.Name, state))
        for _, scenario in ipairs(features.Scenarios) do
            local name = ("%s/%s-%s"):format(state, feature.Name, scenario.Check)
            local recorded, target = scenario.Recorded[state], scenario.Target[state]
            local ok, got, reason = pcall(observe[scenario.Check], feature, env)
            if not ok then
                got, reason = nil, "raised: " .. tostring(got)
            end
            local status, targetMet, tail
            if not got then
                status, tail = "SKIP", reason or "nothing observed"
            else
                status = got == recorded and "PASS" or "FAIL"
                targetMet = got == target
                tail = ("got=[%s] target=[%s] %s"):format(got, target, targetMet and "met" or "open")
            end
            tinsert(results, {
                Name = name,
                Status = status,
                TargetMet = targetMet,
                Line = ("features/%s: %s recorded=[%s] %s"):format(name, status, recorded, tail)
            })
        end
    end
    return results
end

-- In game ------------------------------------------------------------------------------------------------------------

local gameEnv = {}

function gameEnv.Global(name)
    return _G[name]
end

addon.Tests.Ready.features = function()
    if not addon.Data.IsLoaded then -- the reward ids reach the feature during the data load
        return false, "the data load has not finished"
    end
    return true
end

addon.Tests.Suites.features = function()
    local observations = {}
    local results = features.Run(gameEnv, observations)
    collectgarbage("collect")
    UpdateAddOnMemoryUsage()
    tinsert(observations, ("memory after a full collect: %.0f KB"):format(GetAddOnMemoryUsage(addonName)))
    return results, observations
end