local _, addon = ...
local feature = addon.Gui.RightClickMenu

-- The button's art, the quest tracker button of Retail's interface. The menu suite checks that each picture loads
-- (Tests/Menu.lua, row-button-picture).
feature.RowButtonArt = {
    Normal = {File = "Interface\\Buttons\\QuestTrackerButtons", Coords = {0.40625, 0.53125, 0.25, 0.5}},
    Pushed = {File = "Interface\\Buttons\\QuestTrackerButtons", Coords = {0.40625, 0.53125, 0, 0.25}},
    Highlight = {File = "Interface\\Buttons\\QuestTrackerButtons", Coords = {0, 0.265625, 0, 0.53125}}
}

local function SetArt(button)
    local art = feature.RowButtonArt
    button:SetNormalTexture(art.Normal.File)
    button:GetNormalTexture():SetTexCoord(unpack(art.Normal.Coords))
    button:SetPushedTexture(art.Pushed.File)
    button:GetPushedTexture():SetTexCoord(unpack(art.Pushed.Coords))
    button:SetHighlightTexture(art.Highlight.File, "ADD")
    if art.Highlight.Coords then
        button:GetHighlightTexture():SetTexCoord(unpack(art.Highlight.Coords))
    end
end

-- The menu button in an achievement row's top right corner, the feature's part of the core's row slot (Slots.lua,
-- RowParts), made when the row is made while "Show Menu Button" is on (a reload setting). GW2_UI skins it through
-- the row's RightClickMenuButton field (Plugins/GW2_UI/GW2_UI.lua).
function feature.AddRowButton(row)
    if not addon.Options.db.profile.RightClickMenu.ShowButtonOnAchievement then
        return
    end
    local button = CreateFrame("Button", "$parentRightClickMenuButton", row, "KrowiAF_RightClickMenuButton_Template")
    button:SetPoint("TOPRIGHT", -1, -1)
    SetArt(button)
    button:SetScript("OnClick", function(self)
        addon.Slots.AchievementMenu.Open(self, row.Achievement) -- the core's opener, with its guard for no achievement
    end)
    row.RightClickMenuButton = button
end