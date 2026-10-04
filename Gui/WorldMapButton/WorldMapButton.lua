local _, addon = ...
addon.Gui.WorldMapButton = {}
local worldMapButton = addon.Gui.WorldMapButton

addon.WorldMapButtons = LibStub("Krowi_WorldMapButtons-1.4") -- Global world map buttons object

-- On Classic the library makes the button a child of WorldMapFrame, and the map sets its own strata on every resize
-- (FULLSCREEN maximized, MEDIUM small); ElvUI, GW2_UI and Leatrix Maps set it too. The game moves the button along with
-- the map, where the map's canvas covers it, so the button is kept one strata above the map: HIGH over the default
-- MEDIUM map, as its template has it
local strataAbove = {BACKGROUND = "LOW", LOW = "MEDIUM", MEDIUM = "HIGH", HIGH = "DIALOG", DIALOG = "FULLSCREEN",
    FULLSCREEN = "FULLSCREEN_DIALOG", FULLSCREEN_DIALOG = "TOOLTIP", TOOLTIP = "TOOLTIP"}

local function KeepAboveMap(button)
    local strata = strataAbove[WorldMapFrame:GetFrameStrata()]
    if strata then
        button:SetFrameStrata(strata)
    end
end

function worldMapButton:Load()
    local button = LibStub("Krowi_WorldMapButtons-1.4"):Add("KrowiAF_WorldMapButton_Template", "BUTTON")
    addon.Gui.WorldMapButton = button
    if addon.Util.IsMainline or button:GetParent() ~= WorldMapFrame then
        return
    end
    KeepAboveMap(button)
    hooksecurefunc(WorldMapFrame, "SetFrameStrata", function()
        KeepAboveMap(button)
    end)
end