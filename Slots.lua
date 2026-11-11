local _, addon = ...
addon.Slots = {}
local slots = addon.Slots

-- The core's extension points for the features under Features/ (docs/work/2026-11-08-feature-split-poc). A feature adds
-- its entries from its Start, which the registry (Features.lua) runs only while the feature is on, so a feature that is
-- off holds no entry; each entry carries the feature that added it (Owner), which the features suite reads. The core
-- reads the slots and never names a feature. A slot may have a host feature that reads its entries instead (the
-- right-click menu reads AchievementMenu's); the core then reaches the host only through the slot. A part of the core
-- not split into a feature yet may add its entry when its file loads; it has no owner.

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

-- Row parts: what a feature adds to an achievement row of the list when the row is made, each by Order:
-- OnLoad(row), from the row's OnLoad (Gui/WindowFrames/AchievementButton/AchievementButton.lua)
slots.RowParts = {Entries = {}}

function slots.RowParts.Add(entry)
    return Add(slots.RowParts.Entries, entry)
end

function slots.RowParts.Load(row)
    for _, entry in ipairs(slots.RowParts.Entries) do
        entry.OnLoad(row)
    end
end

-- Row modifiers: a modifier click on an achievement row of the list, after the core's own modifier actions
-- (Gui/WindowFrames/AchievementButton/AchievementButtonMixin.lua, ProcessModifiers), each entry by Order:
-- Handle(row), which returns true when it took the click; the first that does ends the walk
slots.RowModifiers = {Entries = {}}

function slots.RowModifiers.Add(entry)
    return Add(slots.RowModifiers.Entries, entry)
end

function slots.RowModifiers.Handle(row)
    for _, entry in ipairs(slots.RowModifiers.Entries) do
        if entry.Handle(row) then
            return true
        end
    end
    return false
end

-- The achievement's right-click menu. Its host, the feature that draws it, sets the opener from its Start and merges
-- Entries by Order with its own sections when it opens; an entry is a section, CheckAdd(achievement) and
-- Add(menu, achievement, menuBuilder, caller), and closes the menu through menuBuilder:Close(). The core opens the menu
-- through Open, which does nothing while no host started, or for an achievement the addon does not register: the openers
-- pass addon.Data.Achievements[id], nil for a guild achievement or a statistic linked in chat
-- (docs/work/2026-11-09-right-click-menu).
slots.AchievementMenu = {Entries = {}}

function slots.AchievementMenu.Add(entry)
    return Add(slots.AchievementMenu.Entries, entry)
end

function slots.AchievementMenu.SetOpener(open)
    Add({}, {Opener = open})
    slots.AchievementMenu.Opener = open
end

function slots.AchievementMenu.Open(caller, achievement)
    local open = slots.AchievementMenu.Opener
    if open and achievement then
        open(caller, achievement)
    end
end