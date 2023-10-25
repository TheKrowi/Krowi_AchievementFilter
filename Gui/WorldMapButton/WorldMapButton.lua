local _, addon = ...;
addon.Gui.WorldMapButton = {};
local worldMapButton = addon.Gui.WorldMapButton;

addon.WorldMapButtons = LibStub("Krowi_WorldMapButtons-1.4"); -- Global world map buttons object

function worldMapButton:Load()
    addon.Gui.WorldMapButton = LibStub("Krowi_WorldMapButtons-1.4"):Add("KrowiAF_WorldMapButton_Template", "BUTTON");
end