-- [[ Namespaces ]] --
local addonName, addon = ...;
local gui = addon.GUI;
gui.WorldMapButton = {};
local worldMapButton = gui.WorldMapButton;

addon.WorldMapButtons = LibStub("Krowi_WorldMapButtons-1.3"); -- Global world map buttons object

function worldMapButton.Load()
    worldMapButton = addon.WorldMapButtons:Add("KrowiAF_WorldMapButton_Template", "BUTTON");
    if addon.IsWrathClassic() then
        worldMapButton:SetFrameStrata("TOOLTIP");
    end
    addon.GUI.WorldMapButton = worldMapButton;
end