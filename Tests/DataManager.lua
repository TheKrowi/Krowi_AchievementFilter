local _, addon = ...

-- The Data Manager's text boxes (docs/work/2026-11-25-leave-acegui), game only: what a player copies out of them and
-- pastes into them arrives whole, and the log tab can't be edited. Each check goes through the same functions as the
-- buttons (Gui/DataManager/DataManager.lua: GatherCharacter, EncodeCharacter, ImportCharacter), so it checks the text a
-- player gets. The import writes saved data, so it imports only a made-up character and puts back every entry it
-- touched, also when a check fails.

local dataManager = {}
local testGuid = "Player-0-KAFTEST"

dataManager.Scenarios = {
    -- The player's own export, set into the text window's box and read back: whether every byte came back
    {Name = "export-roundtrip", Recorded = "equal=yes", Target = "equal=yes"},
    -- A made-up character with one earned and one unearned achievement, encoded, set into the box, read back and imported:
    -- whether the character list and the achievement data then hold it, then all of it removed again
    {Name = "import-roundtrip", Recorded = "imported=yes list=yes earned=yes progress=yes", Target = "imported=yes list=yes earned=yes progress=yes"},
    -- Retail with a log tab: a letter put into the log's box is taken out again
    {Name = "log-read-only", Recorded = "kept=yes", Target = "kept=yes", RetailOnly = true},
}

local function DeepCopy(value)
    if type(value) ~= "table" then
        return value
    end
    local copy = {}
    for k, v in next, value do
        copy[k] = DeepCopy(v)
    end
    return copy
end

local function TextBox()
    local frame = addon.Gui.DataManager:GetTextFrame("Data Manager test")
    return frame, frame.Input
end

local observe = {}

function observe.ExportRoundtrip(observations)
    local text = addon.Gui.DataManager.EncodeCharacter(addon.Gui.DataManager.GatherCharacter(UnitGUID("player")))
    local frame, box = TextBox()
    local wasShown = frame:IsShown()
    frame:Show()
    box:SetText(text)
    local got = box:GetText()
    box:SetText("")
    frame:SetShown(wasShown)
    tinsert(observations, ("export-roundtrip: %d characters set, %d read back"):format(#text, #got))
    return got == text and "equal=yes" or "equal=no"
end

-- Two achievements the made-up character can take: one the player earned on this character (the import keeps an
-- earned one only then, AchievementData.SetEarnedBy) and one that is not account-wide (SetNotEarnedBy skips those)
local function PickAchievements()
    local earnedId, unearnedId
    for _, id in ipairs(addon.Data.AchievementIds) do
        local info = addon.GetAchievementInfoTable(id)
        if info.Id and info.Flags and not info.Flags.IsAccountWide then
            if not earnedId and info.WasEarnedByMe then
                earnedId = id
            elseif not unearnedId and id ~= earnedId then
                unearnedId = id
            end
        end
        if earnedId and unearnedId then
            break
        end
    end
    return earnedId, unearnedId
end

function observe.ImportRoundtrip(observations)
    local earnedId, unearnedId = PickAchievements()
    if not (earnedId and unearnedId) then
        return nil, "no earned, non account-wide achievement on this character to import"
    end
    local saved = {
        Character = KrowiAF_SavedData.CharacterList[testGuid],
        Completed = DeepCopy(KrowiAF_Achievements.Completed[earnedId]),
        NotCompleted = DeepCopy(KrowiAF_Achievements.NotCompleted[unearnedId]),
    }
    local own = KrowiAF_SavedData.CharacterList[UnitGUID("player")]
    local character = DeepCopy(own) or {}
    character.Guid, character.Name, character.Realm, character.Ignore = testGuid, "KAF Test", "Test", nil
    local text = addon.Gui.DataManager.EncodeCharacter({
        Guid = testGuid,
        Character = character,
        Completed = { { Id = earnedId, Date = time() } },
        NotCompleted = { { Id = unearnedId, Progress = { 7 } } },
    })
    local frame, box = TextBox()
    local wasShown = frame:IsShown()
    frame:Show()
    box:SetText(text)
    local ok, imported = pcall(addon.Gui.DataManager.ImportCharacter, box:GetText())
    box:SetText("")
    frame:SetShown(wasShown)

    local list = KrowiAF_SavedData.CharacterList[testGuid]
    local completed = KrowiAF_Achievements.Completed[earnedId]
    local notCompleted = KrowiAF_Achievements.NotCompleted[unearnedId]
    local got = ("imported=%s list=%s earned=%s progress=%s"):format(
        ok and imported and "yes" or "no",
        list and list.Name == "KAF Test" and "yes" or "no",
        completed and completed.EarnedBy and completed.EarnedBy[testGuid] and "yes" or "no",
        notCompleted and notCompleted[testGuid] and notCompleted[testGuid][1] == 7 and "yes" or "no")

    -- Every entry the import touched goes back as it was before
    KrowiAF_SavedData.CharacterList[testGuid] = saved.Character
    KrowiAF_Achievements.Completed[earnedId] = saved.Completed
    KrowiAF_Achievements.NotCompleted[unearnedId] = saved.NotCompleted
    tinsert(observations, ("import-roundtrip: achievements %d (earned) and %d (unearned), %d characters%s"):format(
        earnedId, unearnedId, #text, ok and "" or (", import error: " .. tostring(imported))))
    return got
end

function observe.LogReadOnly(observations)
    -- The Data Manager is made with Blizzard's achievement window (Gui/Gui.lua), which loads on demand: loaded here as
    -- the escape suite loads it (Tests/Escape.lua, Show)
    if not KrowiAF_DataManagerFrame and not AchievementFrame then
        AchievementFrame_LoadUI()
    end
    local frame = KrowiAF_DataManagerFrame
    if not (frame and frame.Log and frame.Tabs) then
        return nil, "no log tab: Retail with a feature that adds one (Event reminders), in debug mode"
    end
    local wasShown = frame:IsShown()
    local tab = PanelTemplates_GetSelectedTab(frame) or 1
    frame:Show()
    frame:SelectTab(2)
    local before = frame.LogText or ""
    local editBox = frame.Log:GetEditBox()
    editBox:SetCursorPosition(0)
    editBox:Insert("x")
    -- Typing reaches the box as OnTextChanged with userInput true; whether Insert says so is not documented, so the
    -- script is called as typing calls it while the letter is still there
    local script = editBox:GetScript("OnTextChanged")
    if script and editBox:GetText() ~= before then
        script(editBox, true)
    end
    local after = frame.Log:GetText()
    frame:SelectTab(tab)
    frame:SetShown(wasShown)
    tinsert(observations, ("log-read-only: %d characters in the log"):format(#before))
    return after == before and "kept=yes" or "kept=no"
end

local steps = {
    ["export-roundtrip"] = observe.ExportRoundtrip,
    ["import-roundtrip"] = observe.ImportRoundtrip,
    ["log-read-only"] = observe.LogReadOnly,
}

addon.Tests.Suites.datamanager = function()
    local results, observations = {}, {}
    for _, scenario in ipairs(dataManager.Scenarios) do
        local status, tail, targetMet
        if scenario.RetailOnly and not addon.Util.IsMainline then
            status, tail = "SKIP", "Retail only"
        else
            local ok, got, reason = pcall(steps[scenario.Name], observations)
            if not ok then
                status, tail = "FAIL", "error: " .. tostring(got)
            elseif got == nil then
                status, tail = "SKIP", tostring(reason)
            else
                status = got == scenario.Recorded and "PASS" or "FAIL"
                targetMet = got == scenario.Target
                tail = ("got=[%s] target=[%s] %s"):format(got, scenario.Target, targetMet and "met" or "open")
            end
        end
        tinsert(results, {
            Name = scenario.Name,
            Status = status,
            TargetMet = targetMet,
            GameOnly = true,
            Line = ("datamanager/%s: %s recorded=[%s] %s"):format(scenario.Name, status, scenario.Recorded, tail),
        })
    end
    return results, observations
end

addon.Tests.Ready.datamanager = function()
    if not addon.Data.IsLoaded then
        return false, "the data load has not finished"
    end
    return true
end