-- [[ Namespaces ]] --
local _, addon = ...;
local search = addon.GUI.Search;
search.OptionsMenuButton = {};
local optionsMenuButton = search.OptionsMenuButton;

function optionsMenuButton:Load()
    local button = CreateFrame("DropDownToggleButton", "KrowiAF_SearchOptionsMenuButton", addon.GUI.Search.BoxFrame, "KrowiAF_SearchOptionsMenuButton_Template");
	button:SetFrameLevel(button:GetParent():GetFrameLevel() + 7);
	-- if addon.IsWrathClassic then
		-- frame:SetSize(107, 30);
		-- frame:SetPoint("TOPLEFT", AchievementFrame.Header.RightDDLInset, "TOPLEFT", 12, 2);
	-- else
		-- button:SetPoint("TOPLEFT", AchievementFrame.SearchBox);
		button:SetPoint("LEFT", addon.GUI.Search.BoxFrame, "LEFT", -6, 0);
	-- end

    addon.SearchOptions:Load();
    -- addon.Filters:ResetFilters();

	-- tinsert(addon.GUI.SubFrames, button);

    -- if addon.IsWrathClassic then
    --     button:SetScript("OnShow", filterButton.OnShow);
    --     button:SetScript("OnHide", filterButton.OnHide);
    -- else -- We don't need this in retail
    --     filterButton.OnShow = nil;
    --     filterButton.OnHide = nil;
    -- end

	addon.GUI.Search.OptionsMenuButton = button; -- Overwrite with the actual frame since all functions are injected to it
end