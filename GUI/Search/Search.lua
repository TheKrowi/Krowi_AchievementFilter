-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.Search = {};
local search = gui.Search;

function search.Load()
    gui.Search.FullSearchResultsFrame:Load();
    gui.Search.SearchPreviewFrame:Load();
    gui.Search.SearchBoxFrame:Load();
end