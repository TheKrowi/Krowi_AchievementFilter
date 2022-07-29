-- [[ Namespaces ]] --
local _, addon = ...;
local search = addon.GUI.Search;
search.ResultsFrame = {};
local resultsFrame = search.ResultsFrame;

function resultsFrame:Load()
	local frame = CreateFrame("Frame", "KrowiAF_SearchResultsFrame", AchievementFrame, "KrowiAF_SearchResultsFrame_Template");
	frame:SetPoint("TOP", 0, -112);
	frame:SetPoint("BOTTOM", 0, 7);

	local scrollFrame = frame.Container;
	local scrollBar = scrollFrame.ScrollBar;
	local scrollBarShow = getmetatable(scrollBar).__index.Show;
	scrollBar.Show = function()
		frame.Show_Hide(frame, scrollBarShow, 575, -24);
	end;
	local scrollBarHide = getmetatable(scrollBar).__index.Hide;
	scrollBar.Hide = function()
		frame.Show_Hide(frame, scrollBarHide, 597, 0);
	end;

    scrollFrame.update = function()
		frame:Update();
    end

    HybridScrollFrame_CreateButtons(scrollFrame, "KrowiAF_SearchResultsButton_Template", 0, 0);

	addon.GUI.Search.ResultsFrame = frame;
end