local _, addon = ...
local feature = addon.Gui.RightClickMenu

-- The menu button in an achievement row's top right corner, the feature's part of the core's row slot (Slots.lua,
-- RowParts), made when the row is made while "Show Right Click Menu" is on (a reload setting). GW2_UI skins it through
-- the row's RightClickMenuButton field (Plugins/GW2_UI/GW2_UI.lua).
function feature.AddRowButton(row)
    if not addon.Options.db.profile.RightClickMenu.ShowButtonOnAchievement then
        return
    end
    local button = CreateFrame("Button", "$parentRightClickMenuButton", row, "KrowiAF_RightClickMenuButton_Template")
    button:SetPoint("TOPRIGHT", -1, -1)
    button:SetScript("OnClick", function(self)
        feature.AchievementMenu:Open(self, row.Achievement)
    end)
    row.RightClickMenuButton = button
end