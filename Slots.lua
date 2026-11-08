local _, addon = ...
addon.Slots = {}
local slots = addon.Slots

-- The core's extension points for the features under Features/ (docs/work/2026-11-08-feature-split-poc). A feature adds
-- its entries from its Start, which the registry (Features.lua) runs only while the feature is on, so a feature that is
-- off holds no entry; each entry carries the feature that added it (Owner), which the features suite reads. The core
-- reads the slots and never names a feature.

local owned = {}

local function Add(list, entry)
    entry.Owner = addon.Features and addon.Features.Starting
    if entry.Owner then
        owned[entry.Owner] = owned[entry.Owner] or {}
        tinsert(owned[entry.Owner], entry)
    end
    tinsert(list, entry)
    table.sort(list, function(a, b) return (a.Order or 0) < (b.Order or 0) end)
    return entry
end

-- The entries a feature added; empty for a feature that never started
function slots.Owned(name)
    return owned[name] or {}
end

-- Achievement data fields: the builder (Api/AchievementDataBuilder.lua) writes fields the core does not process itself
-- (the reward ids); KrowiAF.AddAchievementData hands each to the handler added for it, handler(achievementId, value),
-- and drops it when none was
slots.AchievementData = {}
local dataFields = {}

function slots.AchievementData.AddField(field, handler)
    local entry = Add({}, {Field = field, Handler = handler})
    dataFields[field] = entry
end

function slots.AchievementData.Handle(field, achievementId, value)
    local entry = dataFields[field]
    if entry then
        entry.Handler(achievementId, value)
    end
end

-- Row icons: after the icons the row draws itself, each provider by Order:
-- Set(row, achievement, getIcon), where getIcon(row) hands out a pooled extra icon
-- (Gui/WindowFrames/AchievementButton/AchievementButtonExtraIconFactory.lua); a provider keeps what its callbacks need in
-- icon.Data, which the row clears with the icon
slots.RowIcons = {Entries = {}}

function slots.RowIcons.Add(entry)
    return Add(slots.RowIcons.Entries, entry)
end

-- Achievement menu entries: merged by Order with the menu's own sections
-- (Gui/RightClickMenu/AchievementMenu/AchievementMenu.lua); an entry is a section, CheckAdd(achievement) and
-- Add(menu, achievement, menuBuilder, caller)
slots.AchievementMenu = {Entries = {}}

function slots.AchievementMenu.Add(entry)
    return Add(slots.AchievementMenu.Entries, entry)
end