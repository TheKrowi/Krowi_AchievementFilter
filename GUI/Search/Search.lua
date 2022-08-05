-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.Search = {};
local search = gui.Search;

function search:Load()
    self.BoxFrame:Load();
    self.PreviewFrame:Load();
    self.ResultsFrame:Load();
end