local _, addon = ...

-- The migration runner for every saved variable (docs/work/2026-11-25-settings-store, requirements 11-15), which
-- replaces Data/DataIntegrityManager.lua. KrowiAF_Settings.Version (absent is 0) counts the migrations run; migration
-- 1 moves AceDB's three databases into the settings store and carries the DataIntegrityManager's steps over.
-- It reads and writes raw tables only and calls nothing that reads a setting: Diagnostics is not loaded yet, and its
-- debug switch is one of the values being moved. Its messages wait in Log until Diagnostics.Load prints them.
addon.Settings.Migrations = {}
local migrations = addon.Settings.Migrations
local check = addon.Settings.Check

-- Off until the headless proof and the dry run on real files are green (plan step 11): the migration then runs at
-- every load and the addon runs on its result, but Version is not set and the old tables are not cleared, so a
-- half-built branch never clears a real account and the old tables stay the source.
migrations.ClearOld = false

migrations.Log = {}       -- the runner's messages, printed by Diagnostics.Load when debug info is on
migrations.Failed = nil   -- KrowiAF_Settings.MigrationFailed when the check failed: the chat line's cue

local function Log(text)
    migrations.Log[#migrations.Log + 1] = text
end

local function Copy(value)
    if type(value) ~= "table" then return value end
    local copy = {}
    for k, v in next, value do copy[k] = Copy(v) end
    return copy
end

local function Traceback(err)
    return tostring(err)
end

-- Legion Assaults became one reminder on 5175 (docs/work/2026-10-21-fixed-event-schedules); today's solution 1 of the
-- DataIntegrityManager, run on a copy of the old options profiles. It runs once, marked in fixes; a first install has
-- nothing to merge. AceDB saved a toggle only when it differed from its default, on, so in each profile the one toggle
-- is on if any of the four zones' was, and the other three ids go. On is written as true, not nil.
local legionAssaultZones = { 5177, 5178, 5210 } -- Highmountain, Stormheim, Val'sharah; 5175 Azsuna is the one kept
function migrations.MergeLegionAssaultToggles(profiles, fixes, firstTime)
    if fixes.MergeLegionAssaultToggles then return end
    fixes.MergeLegionAssaultToggles = true
    if firstTime then return end
    for _, profile in next, profiles or {} do
        local world = type(profile) == "table" and type(profile.EventReminders) == "table" and profile.EventReminders.WorldEvents
        if type(world) == "table" then
            local anyOn = world[5175] ~= false
            for _, id in ipairs(legionAssaultZones) do
                anyOn = anyOn or world[id] ~= false
                world[id] = nil
            end
            if anyOn then world[5175] = true end
        end
    end
end

-- KrowiAF_SavedData keys no code reads any more (renames.md, Not carried over)
local deadSavedDataKeys = { "CalendarEventsCache", "CalendarEventsCacheTest", "DFHashVerify", "VerifyHash", "ElvUISkin",
    "GW2_UISkin", "FeaturesTutorial", "WatchedAchievements", "ActiveEvents", "DebugTable" }

-- Migration 1's steps on KrowiAF_SavedData and KrowiAF_Achievements (12.5, 12.6): in place, not copied (the records
-- are 7 MB on a large account), and safe to run twice. Their run-once marks (Verifications) go only with the clear.
local function SavedDataSteps(sv, context)
    local savedData = sv.SavedData
    if type(savedData) ~= "table" then return end
    savedData.AlertSystem = nil -- the copy of the pop-ups' grow direction the game's toasts read before #188
    for _, key in ipairs(deadSavedDataKeys) do savedData[key] = nil end
    -- a character's missing name and realm, from its GUID (Player-<server id>-<hex id>)
    if type(savedData.CharacterList) == "table" then
        for guid, character in next, savedData.CharacterList do
            if type(guid) == "string" and type(character) == "table" then
                local _, realm, name = guid:match("^([^-]*)-([^-]*)-([^-]*)")
                if character.Name == nil then character.Name = name end
                if character.Realm == nil then character.Realm = realm end
            end
        end
    end
    -- on Retail, the account-wide achievements out of the per-character records, once
    local achievements, verifications = sv.Achievements, savedData.Verifications
    if context.IsMainline and type(achievements) == "table"
        and not (type(verifications) == "table" and verifications.AchievementsData) then
        for id, record in next, type(achievements.Completed) == "table" and achievements.Completed or {} do
            if type(record) == "table" and context.IsAccountWide(id) then record.EarnedBy = nil end
        end
        local notCompleted = type(achievements.NotCompleted) == "table" and achievements.NotCompleted or {}
        for id in next, notCompleted do
            if context.IsAccountWide(id) then notCompleted[id] = nil end
        end
        if type(verifications) ~= "table" then
            verifications = {}
            savedData.Verifications = verifications
        end
        verifications.AchievementsData = true
        Log("migration 1: account-wide achievements dropped from the character records")
    end
end

local function NewStore()
    return { Account = {}, Options = { Profiles = {}, ProfileOf = {} }, Filters = { Profiles = {}, ProfileOf = {} } }
end

-- The old tables, with the Legion Assaults merge on a copy of the options profiles unless it ran before
local function ReadOld(sv, context, legionMerged)
    local options = type(sv.Options) == "table" and type(sv.Options.profiles) == "table" and Copy(sv.Options.profiles) or {}
    if not legionMerged then migrations.MergeLegionAssaultToggles(options, {}, false) end
    return check.Old(sv, options, context)
end

-- Migration 1, built aside: every old value moved by the rename table, every old profile kept (also an empty one)
local function Build(old)
    local new = NewStore()
    for name in next, old.OptionsProfiles do new.Options.Profiles[name] = {} end
    for _, name in ipairs(old.FilterProfileNames) do new.Filters.Profiles[name] = {} end
    check.Records(old, function(record, value) check.Move(new, record, value, old) end)
    return new
end

-- The old variables out of the saved file, and the DataIntegrityManager's marks with them (12.5)
local function Clear(sv)
    sv.Options, sv.Filters, sv.SearchOptions = nil, nil, nil
    if type(sv.SavedData) == "table" then
        sv.SavedData.Build, sv.SavedData.Version, sv.SavedData.Fixes, sv.SavedData.Verifications = nil, nil, nil, nil
    end
end

local function LogNotCarried(notCarried)
    for _, line in ipairs(notCarried) do Log("migration 1: not carried, " .. line) end
end

-- Whether the player set a failed record's key since the failure (the store records them in Touched)
local function Touched(record, touched)
    if record.Section ~= "options" then return false end
    local _, key = check.Home(record.Path)
    return key ~= nil and touched[key] == true
end

-- After a failure, with a new addon version: the failed records (all, when the first run errored) moved again from the
-- old tables where the player has not set the key since, checked again, cleared on a pass
local function Retry(sv, context, settings, failed, dataError)
    local old = ReadOld(sv, context, failed.LegionMerged)
    settings.Account = type(settings.Account) == "table" and settings.Account or {}
    for _, section in ipairs({ "Options", "Filters" }) do
        local data = type(settings[section]) == "table" and settings[section] or {}
        settings[section] = data
        data.Profiles = type(data.Profiles) == "table" and data.Profiles or {}
        data.ProfileOf = type(data.ProfileOf) == "table" and data.ProfileOf or {}
    end
    local records = failed.Paths
    if records == nil then
        records = {}
        check.Records(old, function(record) records[#records + 1] = record end)
    end
    local touched, again = type(failed.Touched) == "table" and failed.Touched or {}, {}
    for _, record in ipairs(records) do
        if not Touched(record, touched) then
            again[#again + 1] = record
            check.Move(settings, record, check.OldValue(old, record), old)
        end
    end
    local failures = check.Run(old, settings, again)
    Log(("migration 1 again: %d records moved again, %d still failing"):format(#again, #failures))
    if #failures == 0 and not dataError then
        settings.MigrationFailed = nil
        settings.Version = 1
        Clear(sv)
        return "migrated"
    end
    failed.AddonVersion, failed.Paths, failed.Error = context.AddonVersion, failures, dataError
    migrations.Failed = failed
    return "failed"
end

-- sv: the saved variables by short name (Settings, Options, Filters, SearchOptions, SavedData, Achievements), changed
-- in place; the caller assigns them back. context: Character ("<name> - <realm>"), AddonVersion, IsMainline and
-- IsAccountWide(id). Returns what happened: "current", "migrated", "failed", "error" or "waiting" (a failure under
-- this addon version, retried after the next update).
function migrations.Run(sv, context)
    local settings = type(sv.Settings) == "table" and sv.Settings or nil
    if settings and (settings.Version or 0) >= 1 then return "current" end

    local savedData = type(sv.SavedData) == "table" and sv.SavedData or nil
    local legionMerged = savedData ~= nil and type(savedData.Fixes) == "table" and savedData.Fixes.MergeLegionAssaultToggles == true
    local okData, dataError = xpcall(function() SavedDataSteps(sv, context) end, Traceback)
    if okData then dataError = nil else Log("migration 1: the saved-data steps failed: " .. tostring(dataError)) end

    local failed = settings and type(settings.MigrationFailed) == "table" and settings.MigrationFailed or nil
    if failed and migrations.ClearOld then
        if failed.AddonVersion == context.AddonVersion then
            migrations.Failed = failed
            Log("migration 1 failed under this version; it runs again after the next update")
            return "waiting"
        end
        local ok, result = xpcall(function() return Retry(sv, context, settings, failed, dataError) end, Traceback)
        if ok then return result end
        failed.AddonVersion, failed.Error = context.AddonVersion, result
        migrations.Failed = failed
        Log("migration 1 again: error: " .. tostring(result))
        return "error"
    end

    local old, new
    local ok, err = xpcall(function()
        old = ReadOld(sv, context, legionMerged)
        new = Build(old)
    end, Traceback)
    if not ok then
        -- nothing in place: the old tables stay, the failure is recorded, the addon runs on what the store had
        settings = settings or {}
        settings.MigrationFailed = { AddonVersion = context.AddonVersion, Error = err, Touched = {}, LegionMerged = legionMerged }
        sv.Settings = settings
        migrations.Failed = settings.MigrationFailed
        Log("migration 1: error: " .. tostring(err))
        return "error"
    end

    local failures, notCarried
    ok, err = xpcall(function() failures, notCarried = check.Run(old, new) end, Traceback)
    if ok then LogNotCarried(notCarried) end
    if ok and #failures == 0 and not dataError then
        if migrations.ClearOld then new.Version = 1 end
        sv.Settings = new
        if migrations.ClearOld then Clear(sv) end
        Log(("migration 1: passed%s"):format(migrations.ClearOld and ", old tables cleared" or ", old tables kept (clearing off)"))
        return "migrated"
    end
    new.MigrationFailed = { AddonVersion = context.AddonVersion, Paths = ok and failures or nil, Error = (not ok and err) or dataError,
        Touched = {}, LegionMerged = legionMerged }
    sv.Settings = new
    migrations.Failed = new.MigrationFailed
    Log(("migration 1: check failed, %s"):format(ok and (#failures .. " records") or ("error: " .. tostring(err))))
    return "failed"
end

-- At ADDON_LOADED, before anything reads a setting: runs the migrations on the saved variables and puts the result in
-- place, the new store first, then the old variables (nil once cleared)
function migrations.Load()
    local sv = { Settings = KrowiAF_Settings, Options = KrowiAF_Options, Filters = KrowiAF_Filters,
        SearchOptions = KrowiAF_SearchOptions, SavedData = KrowiAF_SavedData, Achievements = KrowiAF_Achievements }
    local context = {
        Character = UnitName("player") .. " - " .. GetRealmName(),
        AddonVersion = addon.Metadata.Version,
        IsMainline = addon.Util.IsMainline,
        IsAccountWide = function(id)
            local info = addon.GetAchievementInfoTable(id)
            return info and info.Flags and info.Flags.IsAccountWide
        end,
    }
    local result = migrations.Run(sv, context)
    KrowiAF_Settings = sv.Settings or {}
    KrowiAF_Options, KrowiAF_Filters, KrowiAF_SearchOptions = sv.Options, sv.Filters, sv.SearchOptions
    return result
end