-- [[ Namespaces ]] --
local addonName, addon = ...;
local gui = addon.GUI;
gui.WorldMapButton = {};
local worldMapButton = gui.WorldMapButton;

addon.WorldMapButtons = LibStub("Krowi_WorldMapButtons-1.3"); -- Global world map buttons object

function worldMapButton.Load()
    if addon.IsNotWotLKClassic() then -- Added for classic, map button does not yet work
        worldMapButton = addon.WorldMapButtons:Add("KrowiAF_WorldMapButton_Template", "BUTTON");
    end
    addon.GUI.WorldMapButton = worldMapButton;
end