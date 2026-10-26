-- Issue #197: what GetBindingByKey("Y") returns at each step of loading, compared with Krowi_AchievementFilter's ADDON_LOADED,
-- where its first-run setup moves Y. A standalone addon (the "!" makes it load before Krowi_AchievementFilter), copied by hand
-- into AddOns\!KrowiBindingProbe and removed after the check. Results go to KrowiBindingProbe_Log, written on /reload or logout.
local probeName = ...
local maxRuns, maxBindingUpdates = 10, 10
local run = { Steps = {} }
local startMs = debugprofilestop()
local bindingUpdates = 0

local function Safe(func, ...)
    if not func then
        return "<no API>"
    end
    local ok, result = pcall(func, ...)
    return ok and tostring(result) or ("<error " .. tostring(result) .. ">")
end

local function Record(step)
    run.Steps[#run.Steps + 1] = format("%9.1f ms | %-45s | Y=%s | set=%s | TOGGLEACHIEVEMENT key=%s | loggedIn=%s",
        debugprofilestop() - startMs, step, Safe(GetBindingByKey, "Y"), Safe(GetCurrentBindingSet),
        Safe(GetBindingKey, "TOGGLEACHIEVEMENT"), tostring(IsLoggedIn()))
end

Record("file load")

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("VARIABLES_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("UPDATE_BINDINGS")
frame:SetScript("OnEvent", function(_, event, arg1, arg2)
    if event == "ADDON_LOADED" then
        if arg1 == probeName then
            KrowiBindingProbe_Log = KrowiBindingProbe_Log or {}
            tinsert(KrowiBindingProbe_Log, run)
            while #KrowiBindingProbe_Log > maxRuns do
                tremove(KrowiBindingProbe_Log, 1)
            end
            Record("ADDON_LOADED " .. arg1)
        elseif arg1 == "Krowi_AchievementFilter" then
            local firstTime = KrowiAF_SavedData and KrowiAF_SavedData.FirstTimeSetUp
            Record("ADDON_LOADED " .. arg1)
            run.AchievementTabsSwitched = tostring(firstTime and firstTime.AchievementTabsSwitched)
        end
    elseif event == "UPDATE_BINDINGS" then
        bindingUpdates = bindingUpdates + 1
        if bindingUpdates <= maxBindingUpdates then
            Record("UPDATE_BINDINGS #" .. bindingUpdates)
        end
    elseif event == "PLAYER_LOGIN" then
        run.Character = UnitName("player") .. "-" .. GetRealmName()
        run.Time = date("%Y-%m-%d %H:%M:%S")
        Record(event)
    elseif event == "PLAYER_ENTERING_WORLD" then
        run.InitialLogin, run.ReloadingUi = tostring(arg1), tostring(arg2)
        Record(event .. " initial=" .. tostring(arg1) .. " reload=" .. tostring(arg2))
        C_Timer.After(5, function()
            Record("5 s after PLAYER_ENTERING_WORLD")
            print("|cff00ff00Krowi Binding Probe|r recorded " .. #run.Steps .. " steps; Y is now " .. Safe(GetBindingByKey, "Y") .. ".")
        end)
    else
        Record(event)
    end
end)