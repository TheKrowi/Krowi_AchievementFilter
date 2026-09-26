local _, addon = ...
addon.BrowsingHistory = {}
local browsingHistory = addon.BrowsingHistory

-- The history lives for one session only: category ids are generated at load time and shift between
-- releases, so a record from an earlier session would resolve to the wrong category
local records = {}

function browsingHistory:Load()
    KrowiAF_SavedData = KrowiAF_SavedData or {}
    KrowiAF_SavedData.BrowsingHistory = nil -- Versions up to 100.3 wrote the records here without ever reading them back
    self.Index = #records
end

local lastAddedRecord, lock
function browsingHistory:Add(category, achievement)
    if lock then
        lock = nil
        return
    end

    if not achievement then
        return
    end

    if lastAddedRecord and lastAddedRecord.CategoryId == category.Id and lastAddedRecord.AchievementId == achievement.Id then
        return
    end

    if category.HasFlexibleData then
        category = achievement.Category
    end

    lastAddedRecord = {
        CategoryId = category.Id,
        AchievementId = achievement.Id
    }

    if self.Index ~= #records then
        for i = self.Index + 1, #records do
            records[i] = nil
        end
    end

    tinsert(records, lastAddedRecord)

    self.Index = #records
end

function browsingHistory:GetMinIndex()
    return min(#records, 1)
end

function browsingHistory:GetMaxIndex()
    return #records
end

function browsingHistory:GetCurrentIndex()
    return self.Index
end

function browsingHistory:SetIndexOffset(historyOffset)
    self.Index = self.Index + historyOffset
end

function browsingHistory:GetCurrentRecord()
    lock = true
    return records[self.Index]
end

function browsingHistory:Unlock()
    lock = nil
end

function browsingHistory:GetAllRecords()
    return records
end