-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.Search = {};
local search = gui.Search;

function search:Load()
    self.ResultsFrame:Load();
    self.PreviewFrame:Load();
    self.BoxFrame:Load();
end