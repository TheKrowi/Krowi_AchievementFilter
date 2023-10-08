local _, addon = ...;
addon.Gui.Search = {};
local search = addon.Gui.Search;

function search:Load()
    self.BoxFrame:Load();
    -- addon.Gui.Search = nil;
end