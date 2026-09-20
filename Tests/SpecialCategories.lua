local _, addon = ...
addon.Tests.SpecialCategories = {}
local special = addon.Tests.SpecialCategories

-- Membership of the Watch List, Excluded and Tracking Achievements categories and the rebuilds their
-- layout options trigger. A scenario adds fake achievements to one of those categories, drives the
-- code paths a user reaches from the layout options (Show Sub Categories, Show Excluded Category, the
-- character-specific reload) and records how one fake achievement sits in the category tree afterwards:
-- where it is placed under the enabled roots, whether every root has it exactly once, how many mirror
-- nodes of its own category chain exist, and whether the back references the achievement keeps
-- (WatchListCategories, ExcludedCategories, or Category/MoreCategories for tracking) all point at live
-- nodes. Recorded is the behaviour of the current code, verified in game (Retail 12.1.0, 2026-09-20, every
-- line identical to the headless run); Target the desired behaviour.
-- The same scenarios run in game (/kaftest special) through the real option setters in Options/Layout.lua,
-- and headlessly (.claude/tools/headless/run-tests.lua) against the real Objects/, Data/SpecialCategories.lua,
-- Data/SpecialCategoryAchievements.lua and Data/SavedData/AchievementData.lua with the frames stubbed; there
-- the rebuild is the reset-and-reload pair the option setters call, without the frame updates.
--
-- The fakes are three Achievement objects with ids no client has, registered in addon.Data.Achievements
-- for the duration of the run: A and B sit in a three-level category chain of their own (Tab > Expansion >
-- Zone, so a mirrored sub-category tree has three nodes), N has no category, which is how an uncategorized
-- tracking achievement looks. Every scenario starts and ends with the fakes removed from the saved
-- variables and the trees rebuilt, and the in-game run snapshots the player's watched and excluded
-- achievements and the four layout options first and restores them afterwards, so nothing of the
-- player's own state changes. The observation only looks at the fakes, so the player's own watched,
-- excluded and tracking achievements do not show up in the lines.
--
-- Until 100.5 the option setters called two functions that no longer existed (see the changelog), so the
-- in-game side of every rebuild scenario raised a Lua error after emptying the tree. With the reset
-- functions doing only what the old inline loops did (roots emptied, nothing else), 15 of these scenarios
-- fail headlessly with stale or doubled back references (links=stale:N, links=4/2, refs=4/2; checked
-- 2026-09-19 by mutating the two cleanup calls). The two uncategorized-tree scenarios found a second defect
-- while being written: with sub-categories on, the first root's AddAchievement made itself the Category of
-- an uncategorized tracking achievement and the next root then mirrored that root's chain under itself
-- (placed=[.;Achievements/Tracking Achievements] nested=yes); fixed in the same change.

local namePrefix = "KAF Test "
local fakeIds = {A = 999999001, B = 999999002, N = 999999003}
local fakes, fakeCategories

-- Steps: add:<fake> | remove:<fake> (not for tracking) | sub:on|off (Show Sub Categories, rebuilds) |
-- rebuild (the sub-categories setter with its current value) | reload (ReloadWatchedAchievements, the
-- character-specific path, Watch List only) | show:on|off (Show Excluded Category, Excluded only).
-- Observe: the fake whose placement is recorded, A when omitted.
special.Scenarios = {
    -- Watch List
    {Kind = "WatchList", Name = "watch-flat", Steps = {"add:A"},
        Recorded = "placed=[.] roots=all perroot=1 testnodes=0 links=ok saved=yes flag=on"},
    {Kind = "WatchList", Name = "watch-tree", Steps = {"sub:on", "add:A"},
        Recorded = "placed=[Tab/Expansion/Zone] roots=all perroot=1 testnodes=3 links=ok saved=yes flag=on"},
    {Kind = "WatchList", Name = "watch-unwatch-flat", Steps = {"add:A", "remove:A"},
        Recorded = "placed=[-] roots=none perroot=0 testnodes=0 links=none saved=no flag=off"},
    {Kind = "WatchList", Name = "watch-unwatch-tree", Steps = {"sub:on", "add:A", "remove:A"},
        Recorded = "placed=[-] roots=none perroot=0 testnodes=0 links=none saved=no flag=off"}, -- the emptied chain is pruned
    {Kind = "WatchList", Name = "watch-rebuild-tree", Steps = {"sub:on", "add:A", "rebuild"},
        Recorded = "placed=[Tab/Expansion/Zone] roots=all perroot=1 testnodes=3 links=ok saved=yes flag=on"},
    {Kind = "WatchList", Name = "watch-rebuild-then-unwatch", Steps = {"sub:on", "add:A", "add:B", "rebuild", "remove:A"}, Observe = "B",
        Recorded = "placed=[Tab/Expansion/Zone] roots=all perroot=1 testnodes=3 links=ok saved=yes flag=on"}, -- the 100.4 RemoveCategory case: B's chain survives A's unwatch after a rebuild
    {Kind = "WatchList", Name = "watch-sub-off", Steps = {"sub:on", "add:A", "sub:off"},
        Recorded = "placed=[.] roots=all perroot=1 testnodes=0 links=ok saved=yes flag=on"},
    {Kind = "WatchList", Name = "watch-sub-on-after-flat", Steps = {"add:A", "sub:on"},
        Recorded = "placed=[Tab/Expansion/Zone] roots=all perroot=1 testnodes=3 links=ok saved=yes flag=on"},
    {Kind = "WatchList", Name = "watch-reload", Steps = {"sub:on", "add:A", "reload"},
        Recorded = "placed=[Tab/Expansion/Zone] roots=all perroot=1 testnodes=3 links=ok saved=yes flag=on"},
    -- Excluded (Show Excluded Category is on unless a step turns it off)
    {Kind = "Excluded", Name = "excluded-flat", Steps = {"add:A"},
        Recorded = "placed=[.] roots=all perroot=1 testnodes=0 links=ok saved=yes flag=on"},
    {Kind = "Excluded", Name = "excluded-tree", Steps = {"sub:on", "add:A"},
        Recorded = "placed=[Tab/Expansion/Zone] roots=all perroot=1 testnodes=3 links=ok saved=yes flag=on"},
    {Kind = "Excluded", Name = "excluded-include-tree", Steps = {"sub:on", "add:A", "remove:A"},
        Recorded = "placed=[-] roots=none perroot=0 testnodes=0 links=none saved=no flag=off"},
    {Kind = "Excluded", Name = "excluded-rebuild-tree", Steps = {"sub:on", "add:A", "rebuild"},
        Recorded = "placed=[Tab/Expansion/Zone] roots=all perroot=1 testnodes=3 links=ok saved=yes flag=on"},
    {Kind = "Excluded", Name = "excluded-rebuild-then-include", Steps = {"sub:on", "add:A", "add:B", "rebuild", "remove:A"}, Observe = "B",
        Recorded = "placed=[Tab/Expansion/Zone] roots=all perroot=1 testnodes=3 links=ok saved=yes flag=on"},
    {Kind = "Excluded", Name = "excluded-sub-off", Steps = {"sub:on", "add:A", "sub:off"},
        Recorded = "placed=[.] roots=all perroot=1 testnodes=0 links=ok saved=yes flag=on"},
    {Kind = "Excluded", Name = "excluded-hidden", Steps = {"add:A", "show:off"},
        Recorded = "placed=[-] roots=none perroot=0 testnodes=0 links=none saved=yes flag=on"}, -- still excluded, only the category is gone
    {Kind = "Excluded", Name = "excluded-hidden-then-shown", Steps = {"add:A", "show:off", "show:on"},
        Recorded = "placed=[.] roots=all perroot=1 testnodes=0 links=ok saved=yes flag=on"},
    {Kind = "Excluded", Name = "excluded-added-while-hidden", Steps = {"show:off", "add:A", "show:on"},
        Recorded = "placed=[.] roots=all perroot=1 testnodes=0 links=ok saved=yes flag=on"},
    -- Tracking Achievements
    {Kind = "TrackingAchievements", Name = "tracking-flat", Steps = {"add:A"},
        Recorded = "placed=[.] roots=all perroot=1 testnodes=0 category=own refs=1/root nested=no"},
    {Kind = "TrackingAchievements", Name = "tracking-tree", Steps = {"sub:on", "add:A"},
        Recorded = "placed=[Tab/Expansion/Zone] roots=all perroot=1 testnodes=3 category=own refs=1/root nested=no"},
    {Kind = "TrackingAchievements", Name = "tracking-uncategorized", Steps = {"add:N"}, Observe = "N",
        Recorded = "placed=[.] roots=all perroot=1 testnodes=0 category=root refs=1/root nested=no"}, -- AddAchievement makes the first root the achievement's Category
    {Kind = "TrackingAchievements", Name = "tracking-rebuild-flat", Steps = {"add:A", "rebuild"},
        Recorded = "placed=[.] roots=all perroot=1 testnodes=0 category=own refs=1/root nested=no"},
    {Kind = "TrackingAchievements", Name = "tracking-rebuild-tree", Steps = {"sub:on", "add:A", "rebuild"},
        Recorded = "placed=[Tab/Expansion/Zone] roots=all perroot=1 testnodes=3 category=own refs=1/root nested=no"},
    {Kind = "TrackingAchievements", Name = "tracking-rebuild-uncategorized", Steps = {"add:N", "rebuild"}, Observe = "N",
        Recorded = "placed=[.] roots=all perroot=1 testnodes=0 category=root refs=1/root nested=no"},
    {Kind = "TrackingAchievements", Name = "tracking-uncategorized-tree", Steps = {"sub:on", "add:N"}, Observe = "N",
        Recorded = "placed=[.] roots=all perroot=1 testnodes=0 category=root refs=1/root nested=no"}, -- no category, so nothing to mirror: it stays on the root
    {Kind = "TrackingAchievements", Name = "tracking-rebuild-uncategorized-tree", Steps = {"sub:on", "add:N", "rebuild"}, Observe = "N",
        Recorded = "placed=[.] roots=all perroot=1 testnodes=0 category=root refs=1/root nested=no"}, -- before 100.5 the root, now the achievement's Category, was mirrored under itself
    {Kind = "TrackingAchievements", Name = "tracking-sub-off", Steps = {"sub:on", "add:A", "sub:off"},
        Recorded = "placed=[.] roots=all perroot=1 testnodes=0 category=own refs=1/root nested=no"}
}

-- What each kind is made of. Roots: the special category per tab; Enabled: the tab shows that category;
-- ListName: the per-achievement list of mirror nodes (none for tracking, which uses Category/MoreCategories)
local kinds = {
    WatchList = {
        Roots = function() return addon.SpecialCategories.WatchList end,
        Enabled = function(i) return addon.Options.db.profile.AdjustableCategories.WatchList[i] end,
        Options = function() return addon.Options.db.profile.Categories.WatchList end,
        ListName = "WatchListCategories",
        Add = function(achievement) addon.WatchAchievement(achievement, false) end,
        Remove = function(achievement) addon.ClearWatchAchievement(achievement, false) end,
        Saved = function(achievement) return KrowiAF_Achievements.Watched[achievement.Id] ~= nil end,
        Flag = function(achievement) return achievement.IsWatched == true end
    },
    Excluded = {
        Roots = function() return addon.SpecialCategories.Excluded end,
        Enabled = function(i) return addon.Options.db.profile.AdjustableCategories.Excluded[i] end,
        Options = function() return addon.Options.db.profile.Categories.Excluded end,
        ListName = "ExcludedCategories",
        Add = function(achievement) addon.ExcludeAchievement(achievement, false) end,
        Remove = function(achievement) addon.IncludeAchievement(achievement, false) end,
        Saved = function(achievement) return KrowiAF_SavedData.ExcludedAchievements ~= nil and KrowiAF_SavedData.ExcludedAchievements[achievement.Id] ~= nil end,
        Flag = function(achievement) return achievement.IsExcluded == true end
    },
    TrackingAchievements = {
        Roots = function() return addon.SpecialCategories.TrackingAchievements end,
        Enabled = function(i) return addon.Options.db.profile.AdjustableCategories.TrackingAchievements[i] end,
        Options = function() return addon.Options.db.profile.Categories.TrackingAchievements end,
        Add = function(achievement)
            addon.TrackingAchievements[achievement.Id] = true -- what the cache build records, so the reload finds it
            addon.AddToTrackingAchievementsCategories(achievement, false)
        end
    }
}
special.Kinds = kinds

-- [[ Fakes ]] --

local function CreateFakes()
    local category = addon.Objects.Category
    local tab = category:New(-9990001, namePrefix .. "Tab")
    local expansion = tab:AddCategory(category:New(-9990002, namePrefix .. "Expansion"))
    local zone = expansion:AddCategory(category:New(-9990003, namePrefix .. "Zone"))
    fakeCategories = {tab, expansion, zone}
    fakes = {}
    for key, id in next, fakeIds do
        local achievement = addon.Objects.Achievement:New(id)
        if key ~= "N" then
            zone:AddAchievement(achievement)
        end
        fakes[key] = achievement
        addon.Data.Achievements[id] = achievement
    end
end

local function DestroyFakes()
    for _, id in next, fakeIds do
        addon.Data.Achievements[id] = nil
    end
    fakes, fakeCategories = nil, nil
end

-- Back to the state right after CreateFakes: no flags, no back references, nothing in the saved variables
local function ResetFake(achievement)
    achievement.IsWatched, achievement.IsExcluded = nil, nil
    achievement.WatchListCategories, achievement.ExcludedCategories, achievement.MoreCategories = nil, nil, nil
    achievement.Category = achievement ~= fakes.N and fakeCategories[3] or nil
    KrowiAF_Achievements.Watched[achievement.Id] = nil
    if KrowiAF_SavedData.ExcludedAchievements then
        KrowiAF_SavedData.ExcludedAchievements[achievement.Id] = nil
    end
    addon.TrackingAchievements[achievement.Id] = nil
end

-- [[ Observation: the state of one fake in one kind's trees, as a single line ]] --

local function Strip(name)
    if name:find(namePrefix, 1, true) == 1 then
        return name:sub(#namePrefix + 1)
    end
    return name
end

local function Contains(category, achievement)
    for _, entry in next, category.Achievements or {} do
        if entry == achievement then
            return true
        end
    end
    return false
end

local function FindPlacements(category, achievement, path, found)
    if Contains(category, achievement) then
        tinsert(found, path == "" and "." or path)
    end
    for _, child in next, category.Children or {} do
        FindPlacements(child, achievement, path == "" and Strip(child.Name) or (path .. "/" .. Strip(child.Name)), found)
    end
    return found
end

local function IsWithin(root, node)
    while node do
        if node == root then
            return true
        end
        node = node.Parent
    end
    return false
end

local function CountTestNodes(category) -- mirror nodes of the fakes' own category chain
    local count = 0
    for _, child in next, category.Children or {} do
        if child.Name:find(namePrefix, 1, true) == 1 then
            count = count + 1
        end
        count = count + CountTestNodes(child)
    end
    return count
end

local function HasNestedRoot(root, category) -- a node anywhere below the root carrying the root's own name
    for _, child in next, (category or root).Children or {} do
        if child.Name == root.Name or HasNestedRoot(root, child) then
            return true
        end
    end
    return false
end

local function EnabledRoots(kind)
    local roots = {}
    for i, root in ipairs(kind.Roots()) do
        if kind.Enabled(i) then
            tinsert(roots, root)
        end
    end
    return roots
end

local function Ratio(count, total)
    if count == 0 then
        return "none"
    elseif count == total then
        return "all"
    end
    return ("%d/%d"):format(count, total)
end

function special.Observe(kindName, achievement)
    local kind = kinds[kindName]
    local roots = EnabledRoots(kind)
    local paths, seen = {}, {}
    local placedIn, perRoot, testNodes = 0, 0, 0
    for _, root in ipairs(roots) do
        local found = FindPlacements(root, achievement, "", {})
        if #found > 0 then
            placedIn = placedIn + 1
        end
        perRoot = max(perRoot, #found)
        for _, path in ipairs(found) do
            if not seen[path] then
                seen[path] = true
                tinsert(paths, path)
            end
        end
        testNodes = max(testNodes, CountTestNodes(root))
    end
    sort(paths)
    local text = ("placed=[%s] roots=%s perroot=%d testnodes=%d"):format(#paths > 0 and table.concat(paths, ";") or "-", Ratio(placedIn, #roots), perRoot, testNodes)

    if kind.ListName then
        local list = achievement[kind.ListName]
        local links
        if not list or #list == 0 then
            links = placedIn == 0 and "none" or "missing"
        else
            local stale = 0
            for _, node in ipairs(list) do
                local live = Contains(node, achievement)
                if live then
                    live = false
                    for _, root in ipairs(roots) do
                        if IsWithin(root, node) then
                            live = true
                        end
                    end
                end
                if not live then
                    stale = stale + 1
                end
            end
            if stale > 0 then
                links = "stale:" .. stale
            elseif #list == placedIn then
                links = "ok"
            else
                links = ("%d/%d"):format(#list, placedIn)
            end
        end
        return text .. (" links=%s saved=%s flag=%s"):format(links, kind.Saved(achievement) and "yes" or "no", kind.Flag(achievement) and "on" or "off")
    end

    -- Tracking: AddAchievement wires the node into Category or MoreCategories instead of a list
    local categoryText, refs = "none", 0
    if achievement.Category then
        categoryText = achievement.Category == fakeCategories[3] and "own" or "other"
        for _, root in ipairs(roots) do
            if achievement.Category == root then
                categoryText, refs = "root", 1
            elseif IsWithin(root, achievement.Category) then
                categoryText, refs = "mirror", 1
            end
        end
    end
    for _, node in next, achievement.MoreCategories or {} do
        for _, root in ipairs(roots) do
            if IsWithin(root, node) then
                refs = refs + 1
                break
            end
        end
    end
    local nested = false
    for _, root in ipairs(roots) do
        if HasNestedRoot(root) then
            nested = true
        end
    end
    local refsText = refs == 0 and "none" or (refs == #roots and "1/root" or ("%d/%d"):format(refs, #roots))
    return text .. (" category=%s refs=%s nested=%s"):format(categoryText, refsText, nested and "yes" or "no")
end

-- [[ Scenarios ]] --

-- env: Setup() -> ok[, reason], Teardown(), SetSubCategories(kindName, on) (sets Show Sub Categories and
-- rebuilds), SetExcludedShown(on), Rebuild(kindName) (the sub-categories setter with its current value)
local function RunStep(env, kindName, step)
    local verb, argument = step:match("^(%a+):?(%w*)$")
    local kind = kinds[kindName]
    if verb == "add" then
        kind.Add(fakes[argument])
    elseif verb == "remove" then
        kind.Remove(fakes[argument])
    elseif verb == "sub" then
        env.SetSubCategories(kindName, argument == "on")
    elseif verb == "show" then
        env.SetExcludedShown(argument == "on")
    elseif verb == "rebuild" then
        env.Rebuild(kindName)
    elseif verb == "reload" then
        addon.Data.SavedData.AchievementData.ReloadWatchedAchievements()
    else
        error("unknown step " .. step)
    end
end

-- Fakes out of the saved variables and the flags, then the kind's tree rebuilt without them
local function ResetKind(env, kindName)
    for _, achievement in next, fakes do
        ResetFake(achievement)
    end
    env.SetSubCategories(kindName, false)
    if kindName == "Excluded" then
        env.SetExcludedShown(true)
    end
end

local function RunScenario(env, scenario)
    ResetKind(env, scenario.Kind)
    local ok, err = pcall(function()
        for _, step in ipairs(scenario.Steps) do
            RunStep(env, scenario.Kind, step)
        end
    end)
    local got
    if ok then
        got = special.Observe(scenario.Kind, fakes[scenario.Observe or "A"])
    else
        got = "error: " .. (tostring(err):gsub("^.-:%d+: ", ""))
    end
    pcall(ResetKind, env, scenario.Kind)

    local target = scenario.Target or scenario.Recorded
    local status = got == scenario.Recorded and "PASS" or "FAIL"
    local targetMet = got == target
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("special/%s: %s steps=[%s] observe=%s recorded=[%s] got=[%s] %s"):format(scenario.Name, status, table.concat(scenario.Steps, ","), scenario.Observe or "A", scenario.Recorded, got, targetMet and "target met" or ("target=[%s] open"):format(target))
    }
end

function special.Run(env)
    local results = {}
    local ready, reason = env.Setup()
    if not ready then
        for _, scenario in ipairs(special.Scenarios) do
            tinsert(results, {Name = scenario.Name, Status = "SKIP", Line = ("special/%s: SKIP %s"):format(scenario.Name, reason)})
        end
        return results
    end
    CreateFakes()
    for _, scenario in ipairs(special.Scenarios) do
        tinsert(results, RunScenario(env, scenario))
    end
    DestroyFakes()
    env.Teardown()
    return results
end

-- [[ In-game environment: the real option setters, the real frames ]] --

local gameEnv = {}
special.GameEnv = gameEnv
local observations = {}
special.Observations = observations

-- The AceConfig tables Options/Layout.lua injects; their set functions are the code paths under test
local optionPaths = {
    WatchList = "Layout.args.AdjustableCategories.args.WatchList.args.ShowWatchedSubCategories",
    Excluded = "Layout.args.AdjustableCategories.args.Excluded.args.ShowExcludedSubCategories",
    TrackingAchievements = "Layout.args.AdjustableCategories.args.TrackingAchievements.args.ShowTrackingSubCategories",
    ExcludedShow = "Layout.args.AdjustableCategories.args.Excluded.args.Show"
}

local function Option(key)
    return addon.InjectOptions:GetTable(optionPaths[key])
end

local snapshot, frameWasShown

function gameEnv.Setup()
    if not addon.Data.IsLoaded then
        return false, "the data load has not finished"
    end
    for key in next, optionPaths do
        if not Option(key) then
            return false, "layout option " .. key .. " is not injected"
        end
    end
    frameWasShown = AchievementFrame and AchievementFrame:IsShown()
    KrowiAF_ToggleAchievementFrame("Krowi_AchievementFilter", "Achievements", nil, true) -- the setters do nothing while no tab of the addon is selected
    if not addon.Gui.SelectedTab then
        return false, "could not select the addon's Achievements tab"
    end
    local profile = addon.Options.db.profile
    snapshot = {
        Watched = CopyTable(KrowiAF_Achievements.Watched),
        Excluded = KrowiAF_SavedData.ExcludedAchievements and CopyTable(KrowiAF_SavedData.ExcludedAchievements) or nil,
        WatchListSub = profile.Categories.WatchList.ShowSubCategories,
        ExcludedSub = profile.Categories.Excluded.ShowSubCategories,
        ExcludedShow = profile.Categories.Excluded.Show,
        TrackingSub = profile.Categories.TrackingAchievements.ShowSubCategories
    }
    for kindName, kind in next, kinds do
        tinsert(observations, ("%s: %d of %d tabs enabled"):format(kindName, #EnabledRoots(kind), #kind.Roots()))
    end
    tinsert(observations, "character-specific watch list: " .. tostring(profile.Categories.WatchList.CharacterSpecific == true))
    return true
end

function gameEnv.Teardown()
    KrowiAF_Achievements.Watched = snapshot.Watched
    KrowiAF_SavedData.ExcludedAchievements = snapshot.Excluded
    gameEnv.SetSubCategories("WatchList", snapshot.WatchListSub)
    gameEnv.SetSubCategories("TrackingAchievements", snapshot.TrackingSub)
    gameEnv.SetExcludedShown(snapshot.ExcludedShow)
    gameEnv.SetSubCategories("Excluded", snapshot.ExcludedSub)
    snapshot = nil
    if not frameWasShown and AchievementFrame and AchievementFrame:IsShown() then
        AchievementFrame:Hide()
    end
end

function gameEnv.SetSubCategories(kindName, on)
    if kindName == "Excluded" then -- this setter flips the value instead of taking it
        addon.Options.db.profile.Categories.Excluded.ShowSubCategories = not on
        Option(kindName).set()
        return
    end
    Option(kindName).set(nil, on)
end

function gameEnv.SetExcludedShown(on)
    Option("ExcludedShow").set(nil, on)
end

function gameEnv.Rebuild(kindName)
    gameEnv.SetSubCategories(kindName, kinds[kindName].Options().ShowSubCategories)
end

addon.Tests.Suites.special = function()
    wipe(observations)
    return special.Run(gameEnv), observations
end

addon.Tests.Ready.special = function()
    if not addon.Data.IsLoaded then
        return false, "the data load has not finished"
    end
    return true
end