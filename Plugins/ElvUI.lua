-- [[ Disclaimer ]] --
-- A lot of code in this file is copied from ElvUI to make it compatible with their skin.

-- [[ Namespaces ]] --
local _, addon = ...;
local plugins = addon.Plugins;
plugins.ElvUI = {};
local elvUI = plugins.ElvUI;
tinsert(plugins.Plugins, elvUI);

local function SkinTabs(skins)
    for _, addonTabs in next, addon.GUI.Tabs do
        for _, tab in next, addonTabs do
            skins:HandleTab(tab)
            tab:SetFrameLevel(tab:GetFrameLevel() + 2);
        end
    end
end

local function SkinCategoriesFrame(frame, skins)
    -- Frame
    frame:StripTextures();
    frame.ScrollFrame.ScrollBar.trackBG:SetAlpha(0);
    frame.ScrollFrame:CreateBackdrop("Transparent");
	frame.ScrollFrame.backdrop:Point("TOPLEFT", 0, 4);
	frame.ScrollFrame.backdrop:Point("BOTTOMRIGHT", -2, -3);

    -- Buttons
    local buttons = frame.ScrollFrame.buttons;
    for _, button in next, buttons do
        button:StripTextures(true);
		button:StyleButton();
    end

    -- Scrollbar
    skins:HandleScrollBar(frame.ScrollFrame.ScrollBar, 5);
end

local function SkinGameTooltipProgressBar(progressBar, engine)
    progressBar.BorderLeftTop:StripTextures();
    progressBar.BorderLeftMiddle:StripTextures();
    progressBar.BorderLeftBottom:StripTextures();
    progressBar.BorderRightTop:StripTextures();
    progressBar.BorderRightMiddle:StripTextures();
    progressBar.BorderRightBottom:StripTextures();
    progressBar.BorderMiddleTop:StripTextures();
    progressBar.BorderMiddleMiddle:StripTextures();
    progressBar.BorderMiddleBottom:StripTextures();
    progressBar.Background:Hide();
    local fills = progressBar.Fill;
    for _, fill in next, fills do
        fill:SetTexture(engine.media.normTex);
    end
    progressBar:CreateBackdrop();
    progressBar.backdrop:Point("TOPLEFT", 7, -5);
    progressBar.backdrop:Point("BOTTOMRIGHT", -5, 5);
    progressBar:SetColors({R = 4/255, G = 179/255, B = 30/255}, {R = 179/255, G = 4/255, B = 30/255});
end

local function SkinAchievementButton(button, engine, skins)
	button:SetFrameLevel(button:GetFrameLevel() + 2)
	button:StripTextures(true)
	button:CreateBackdrop(nil, true)
	button.backdrop:SetInside()
	button.Icon:CreateBackdrop(nil, nil, nil, nil, nil, nil, true)
	button.Icon:Size(button.Compact and 36 or 54, button.Compact and 36 or 54)
	button.Icon:ClearAllPoints()
	button.Icon:Point("TOPLEFT", button.Compact and 6 or 8, button.Compact and -6 or -8)
	button.Icon.Border:Kill()
	button.Icon.Texture:SetTexCoord(unpack(engine.TexCoords))
	button.Icon.Texture:SetInside()

	if button.Highlight then
		button.Highlight:StripTextures()
		button:HookScript("OnEnter", function(self) self.backdrop:SetBackdropBorderColor(1, 1, 0) end)
		button:HookScript("OnLeave", function(self) self.backdrop:SetBackdropBorderColor(unpack(engine.media.bordercolor)) end)
	end

	if button.Header then
		button.Header:SetTextColor(1, 1, 1)
	end

	if button.Description then
		button.Description:SetTextColor(.6, .6, .6)
		hooksecurefunc(button.Description, "SetTextColor", function(_, r, g, b)
			if r == 0 and g == 0 and b == 0 then
				button.Description:SetTextColor(.6, .6, .6)
			end
		end)
	end

	if button.HiddenDescription then
		button.HiddenDescription:SetTextColor(1, 1, 1)
	end

	if button.Tracked then
		button.Tracked:GetRegions():SetTextColor(1, 1, 1)
		skins:HandleCheckBox(button.Tracked)
		button.Tracked:Size(18)
		button.Tracked:ClearAllPoints()
		button.Tracked:Point("TOPLEFT", button.Icon, "BOTTOMLEFT", 0, -2)
	end
end

local blueAchievement = { r = 0.1, g = 0.2, b = 0.3 }
local function BlueBackdrop(self)
	self:SetBackdropColor(blueAchievement.r, blueAchievement.g, blueAchievement.b)
end

local redAchievement = { r = 0.3, g = 0, b = 0 }
local function RedBackdrop(self)
	self:SetBackdropColor(redAchievement.r, redAchievement.g, redAchievement.b)
end

local function SetAchievementButtonColor(frame, engine)
	if not frame or not frame.backdrop or not frame.Achievement then
        return;
    end
    local achievement = frame.Achievement;
	local state;
	if achievement.TemporaryObtainable then
		state = achievement.TemporaryObtainable.Obtainable();
	end
    if state and (state == false or state == "Past" or state == "Future") then
	    frame.backdrop.callbackBackdropColor = RedBackdrop;
        frame.backdrop:SetBackdropColor(redAchievement.r, redAchievement.g, redAchievement.b);
    elseif frame.accountWide then
        frame.backdrop.callbackBackdropColor = BlueBackdrop;
        frame.backdrop:SetBackdropColor(blueAchievement.r, blueAchievement.g, blueAchievement.b);
    else
        frame.backdrop.callbackBackdropColor = nil;
        frame.backdrop:SetBackdropColor(unpack(engine.media.backdropcolor));
    end
end

local function SkinAchievementsFrame(frame, engine, skins)
    -- Frame
    select(2, frame:GetChildren()):Hide();
    frame.Background:Hide();
    frame.Artwork:Hide();

    local numChildren = frame:GetNumChildren();
    for i = 1, numChildren do
        local child = select(i, frame:GetChildren());
        if child and not child:GetName() then
            child:SetBackdrop();
        end
    end

	frame.ScrollFrame:CreateBackdrop("Transparent");
	frame.ScrollFrame.backdrop:Point("TOPLEFT", -2, 2);
	frame.ScrollFrame.backdrop:Point("BOTTOMRIGHT", -2, -3);

    -- Buttons
    local buttons = frame.ScrollFrame.buttons;
    for _, button in next, buttons do
        SkinAchievementButton(button, engine, skins);
    end

    hooksecurefunc(frame, "Update", function(frame)
        for _, button in next, buttons do
            if button:IsShown() then
                SetAchievementButtonColor(button, engine);
            else
                return;
            end
        end
    end);

    local preHookFunction = addon.GUI.AchievementsObjectives.DisplayCriteria;
	function addon.GUI.AchievementsObjectives:DisplayCriteria(id)
        preHookFunction(self, id);
		local numCriteria = GetAchievementNumCriteria(id);
		local textStrings, metas = 0, 0;
        local criteria, object;
		for i = 1, numCriteria do
			local _, criteriaType, completed, _, _, _, _, assetID = GetAchievementCriteriaInfo(id, i);
			if assetID and criteriaType == _G.CRITERIA_TYPE_ACHIEVEMENT then
				metas = metas + 1;
				criteria, object = self:GetMeta(metas), 'Label';
			elseif criteriaType ~= 1 then
				textStrings = textStrings + 1;
				criteria, object = self:GetTextCriteria(textStrings), 'Label';
			end

			local text = criteria and criteria[object];
			if text then
				local r, g, b, x, y;
				if completed then
					if self.Completed then
						r, g, b, x, y = 1, 1, 1, 0, 0;
					else
						r, g, b, x, y = 0, 1, 0, 1, -1;
					end
				else
					r, g, b, x, y = .6, .6, .6, 1, -1;
				end
				text:SetTextColor(r, g, b);
				text:SetShadowOffset(x, y);
			end
		end
    end

    -- Scrollbar
    skins:HandleScrollBar(frame.ScrollFrame.ScrollBar, 5);
end

local function SkinStatusBar(statusBar, engine)
    statusBar.BorderLeftTop:StripTextures();
    statusBar.BorderLeftMiddle:StripTextures();
    statusBar.BorderLeftBottom:StripTextures();
    statusBar.BorderRightTop:StripTextures();
    statusBar.BorderRightMiddle:StripTextures();
    statusBar.BorderRightBottom:StripTextures();
    statusBar.BorderMiddleTop:StripTextures();
    statusBar.BorderMiddleMiddle:StripTextures();
    statusBar.BorderMiddleBottom:StripTextures();
    statusBar.Background:Hide();
    local fills = statusBar.Fill;
    for _, fill in next, fills do
        fill:SetTexture(engine.media.normTex);
    end
    statusBar:AdjustOffsets(8, 8);
    statusBar:CreateBackdrop();
    statusBar.backdrop:Point("TOPLEFT", 14, -14);
    statusBar.backdrop:Point("BOTTOMRIGHT", -12, 14);
    statusBar:SetColors({R = 4/255, G = 179/255, B = 30/255}, {R = 179/255, G = 4/255, B = 30/255});
    if statusBar.Button then
        local button = statusBar.Button;
        button:StripTextures();

        local htex = button:CreateTexture();
        htex:SetColorTexture(1, 1, 1, 0.3);
        htex:SetAllPoints(statusBar.backdrop);
        button:SetHighlightTexture(htex);

        button:SetScript("OnLeave", function(self)
        end);
        button:SetScript("OnEnter", function(self)
        end);
    end
end

local function SkinAchievementSummary(frame, engine, skins)
    frame:StripTextures();
	frame.Background:Hide();
	frame:GetChildren():Hide();

    frame.Achievements.Header.Texture:Hide();
	frame.Categories.Header.Texture:Hide();

    local numChildren = frame:GetNumChildren();
    for i = 1, numChildren do
        local child = select(i, frame:GetChildren());
        if child and not child:GetName() then
            child:SetBackdrop();
        end
    end

    frame.ScrollFrameBorder.NineSlice:SetAlpha(0);
    frame.ScrollFrameBorder.ScrollFrame.ScrollBar.trackBG:SetAlpha(0);
    frame.ScrollFrameBorder.ScrollFrame:CreateBackdrop("Transparent");
	frame.ScrollFrameBorder.ScrollFrame.backdrop:Point("TOPLEFT", 1, 2);
	frame.ScrollFrameBorder.ScrollFrame.backdrop:Point("BOTTOMRIGHT", -2, -3);

    -- Buttons
    local buttons = frame.ScrollFrameBorder.ScrollFrame.buttons;
    for _, button in next, buttons do
        SkinAchievementButton(button, engine, skins);
    end

    hooksecurefunc(frame.ScrollFrameBorder.ScrollFrame, "update", function(frame)
        for _, button in next, buttons do
            if button:IsShown() then
                SetAchievementButtonColor(button, engine);
            else
                return;
            end
        end
    end);

    hooksecurefunc(frame, "Show", function(frame)
        for _, button in next, buttons do
            if button:IsShown() then
                SetAchievementButtonColor(button, engine);
            else
                return;
            end
        end
    end);

    SkinStatusBar(frame.TotalStatusBar, engine);
    local statusBars = frame.StatusBars;
    for _, statusBar in next, statusBars do
        SkinStatusBar(statusBar, engine);
    end

    -- Scrollbar
    skins:HandleScrollBar(frame.ScrollFrameBorder.ScrollFrame.ScrollBar, 5);
end

local function SkinFilterButton(button, achievementsFrame, skins)
    skins:HandleButton(button);

    local highlightTex = button.GetHighlightTexture and button:GetHighlightTexture()
    if highlightTex then
        highlightTex:SetTexture();
    else
        button:StripTextures();
    end

	button:ClearAllPoints();
	button:Point("BOTTOMLEFT", achievementsFrame, "TOPLEFT", 3, 1);
end

local function SkinSearchBoxFrame(frame, achievementsFrame, skins)
    skins:HandleEditBox(frame);
	frame.backdrop:Point('TOPLEFT', frame, 'TOPLEFT', -3, -3);
	frame.backdrop:Point('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', 0, 3);
	frame:ClearAllPoints();
	frame:Point('BOTTOMRIGHT', achievementsFrame, 'TOPRIGHT', -20, -2);
	frame:Size(114, 27);
end

local function SkinSearchButton(self, engine, skins)
	self:StripTextures()

	if self.Icon then
		skins:HandleIcon(self.Icon);
	end

	self:CreateBackdrop('Transparent');
	self:SetHighlightTexture(engine.media.normTex);

	local hl = self:GetHighlightTexture();
	hl:SetVertexColor(1, 1, 1, 0.3);
	hl:Point('TOPLEFT', 1, -1);
	hl:Point('BOTTOMRIGHT', -1, 1);
end

local function SkinSearchPreviewFrame(frame, achievementsFrame, engine, skins)
    frame:StripTextures();
	frame:ClearAllPoints();
	frame:Point('TOPLEFT', achievementsFrame, 'TOPRIGHT', 22, 25);

    for _, button in next, frame.Buttons do
		SkinSearchButton(button, engine, skins);
	end
	SkinSearchButton(frame.ShowFullSearchResultsButton, engine, skins);
end

local function SkinSearchResultsFrame(frame, skins)
    frame:StripTextures();
    frame:CreateBackdrop('Transparent');

    for _, button in next, frame.Container.buttons do
        button:SetNormalTexture('');
        button:SetPushedTexture('');
        button:GetRegions():Hide();

        button.resultType:SetTextColor(1, 1, 1);
        button.path:SetTextColor(1, 1, 1);
    end

    skins:HandleCloseButton(frame.closeButton);
	skins:HandleScrollBar(frame.Container.ScrollBar);
end

local function ForceAlpha(self, alpha, forced)
	if alpha ~= 1 and forced ~= true then
		self:SetAlpha(1, true)
	end
end

local function SkinAlertFrameTemplate(frame, engine)
    frame:SetAlpha(1);

    if not frame.hooked then
        hooksecurefunc(frame, 'SetAlpha', ForceAlpha);
        frame.hooked = true;
    end

    if not frame.backdrop then
        frame:CreateBackdrop('Transparent');
        frame.backdrop:Point('TOPLEFT', frame.Background, 'TOPLEFT', -2, -6);
        frame.backdrop:Point('BOTTOMRIGHT', frame.Background, 'BOTTOMRIGHT', -2, 6);
    end

    -- Background
    frame.Background:SetTexture();
    frame.glow:Kill();
    frame.shine:Kill();

    -- Text
    frame.Unlocked:FontTemplate(nil, 12);
    frame.Unlocked:SetTextColor(1, 1, 1);
    frame.Name:FontTemplate(nil, 12);

    -- Icon
    frame.Icon.Texture:SetTexCoord(unpack(engine.TexCoords));
    frame.Icon.Overlay:Kill();

    frame.Icon.Texture:ClearAllPoints();
    frame.Icon.Texture:Point('LEFT', frame, 7, 0);

    if not frame.Icon.Texture.b then
        frame.Icon.Texture.b = CreateFrame('Frame', nil, frame);
        frame.Icon.Texture.b:SetTemplate();
        frame.Icon.Texture.b:SetOutside(frame.Icon.Texture);
        frame.Icon.Texture:SetParent(frame.Icon.Texture.b);
    end
end

local function SkinSideButtons(sideButtons, engine)
    for i, button in next, sideButtons do
        SkinAlertFrameTemplate(button, engine);
        if i == 1 then
            button:ClearAllPoints();
            button:SetPoint("TOPLEFT", AchievementFrame, "TOPRIGHT", 5, 13); -- Make the 2nd button anchor like the 1st one
        else
            button:ClearAllPoints();
            button:SetPoint("TOPLEFT", sideButtons[i - 1], "BOTTOMLEFT", 0, 9); -- Make the 2nd button anchor like the 1st one
        end
    end
end

local function SkinHeader()
    hooksecurefunc(AchievementFrameHeaderPoints, "SetText", function()
        AchievementFrameHeaderPointBorder:ClearAllPoints();
	    AchievementFrameHeaderPointBorder:Point('CENTER', AchievementFrameHeaderTitle, 'CENTER', 100, 0);
        AchievementFrameHeaderPointBorder:SetSize(150, 20);
        AchievementFrameHeaderPoints:ClearAllPoints();
	    AchievementFrameHeaderPoints:Point('CENTER', AchievementFrameHeaderPointBorder);
    end);
end

local function ReskinBlizzard(skins)
    if not addon.IsWrathClassic then
        SkinSearchBoxFrame(AchievementFrame.SearchBox, AchievementFrameAchievements, skins);
    end
    AchievementFrameFilterDropDown:ClearAllPoints();
	AchievementFrameFilterDropDown:Point('TOPLEFT', AchievementFrameAchievements, 'TOPLEFT', -18, 26);
    AchievementFrameFilterDropDown:Size(AchievementFrameFilterDropDown:GetWidth(), AchievementFrameFilterDropDown:GetHeight() - 1);
end

local function SkinCalendarButton(button, skins)
    skins:HandleButton(button);
    button:ClearAllPoints();
    button:Point("LEFT", AchievementFrameHeaderPoints, "RIGHT", 30, -1);
    button:Size(22, 22);
    local fs = button:CreateFontString(nil, nil, "GameFontHighlightSmall");
    fs:SetPoint("CENTER", 0, -2);
    button:SetFontString(fs);
    local currentCalendarTime = C_DateAndTime.GetCurrentCalendarTime();
	button:SetText(currentCalendarTime.monthDay);
end

local function SkinCalendarDayButton(button, engine, skins)
    button.DarkFrame:SetAlpha(.5);

    if SavedData.ElvUISkin.NoParchment then
        button:DisableDrawLayer('BACKGROUND');
    end

    button:SetTemplate(nil, nil, nil, true);
    button:SetBackdropColor(0,0,0,0);
    button:SetHighlightTexture(engine.media.glossTex);
    button:SetFrameLevel(button:GetFrameLevel() + 1);

    local hl = button:GetHighlightTexture();
    hl:SetVertexColor(1, 1, 1, 0.3);
    hl:Point('TOPLEFT', -1, 1);
    hl:Point('BOTTOMRIGHT');
    hl.SetAlpha = engine.noop;
end

local function SkinCalendarFrame(frame, engine, skins)
    frame:DisableDrawLayer("BORDER");
	frame:CreateBackdrop("Transparent");

    local closeButton = frame.CloseButton;
	skins:HandleCloseButton(closeButton);
	closeButton:Point("TOPRIGHT", -4, -4);

	for i = 1, 7 do
		frame.WeekDayBackgrounds[i]:SetAlpha(0);
	end

    frame.MonthBackground:SetAlpha(0);
	frame.YearBackground:SetAlpha(0);

    skins:HandleNextPrevButton(frame.PrevMonthButton, nil, nil, true)
	skins:HandleNextPrevButton(frame.NextMonthButton, nil, nil, true)

	for i = 1, 42 do
        SkinCalendarDayButton(frame.DayButtons[i], engine, skins);
	end

    local weekdaySelectedTexture = frame.WeekdaySelectedTexture;
    weekdaySelectedTexture:SetDesaturated(true);
	weekdaySelectedTexture:SetVertexColor(1, 1, 1, 0.6);

    local todayFrame = frame.TodayFrame;
	todayFrame.Texture:Hide()
	todayFrame.Glow:Hide()

	todayFrame:SetTemplate();
	todayFrame:SetBackdropBorderColor(_G.NORMAL_FONT_COLOR:GetRGB());
	todayFrame:SetBackdropColor(0, 0, 0, 0);
	todayFrame:SetScript("OnUpdate", nil);

	hooksecurefunc(frame, "SetToday", function()
		todayFrame:SetAllPoints();
	end);

    frame.MonthAchievementsAndPoints:SetPoint("TOPRIGHT", -40, -13);
end

local function SkinCalendarSideFrame(frame, engine, skins)
    frame:StripTextures(true);
	frame:SetTemplate('Transparent');
	frame:Point('TOPLEFT', frame:GetParent(), 'TOPRIGHT', 3, -24);
	frame.Header:StripTextures();
	skins:HandleCloseButton(frame.CloseButton);

    frame.ScrollFrameBorder.ScrollFrame.ScrollBar.trackBG:SetAlpha(0);
    frame.ScrollFrameBorder.ScrollFrame:CreateBackdrop("Transparent");
	frame.ScrollFrameBorder.ScrollFrame.backdrop:Point("TOPLEFT", 1, 2);
	frame.ScrollFrameBorder.ScrollFrame.backdrop:Point("BOTTOMRIGHT", -2, -3);

    -- Buttons
    for _, button in next, frame.ScrollFrameBorder.ScrollFrame.buttons do
        SkinAchievementButton(button, engine, skins);
    end

    hooksecurefunc(frame.ScrollFrameBorder.ScrollFrame, "update", function(frame)
        for _, button in next, frame.buttons do
            if button:IsShown() then
                SetAchievementButtonColor(button, engine);
            else
                return;
            end
        end
    end);

    hooksecurefunc(frame, "Show", function(frame)
        for _, button in next, frame.ScrollFrameBorder.ScrollFrame.buttons do
            if button:IsShown() then
                SetAchievementButtonColor(button, engine);
            else
                return;
            end
        end
    end);

    -- Scrollbar
    if frame.ScrollFrameBorder.ScrollFrame.ScrollBar then
        skins:HandleScrollBar(frame.ScrollFrameBorder.ScrollFrame.ScrollBar, 5);
    end
end

local engine, skins;
local function SkinAll()
	addon.Diagnostics.Trace("elvUISkin.Apply");

    -- local enabled, engine, skins = elvUISkin.Load();

    if SavedData.ElvUISkin.Achievements then
        SkinTabs(skins);
        SkinCategoriesFrame(addon.GUI.CategoriesFrame, skins);
        SkinGameTooltipProgressBar(addon.GUI.GameTooltipProgressBar, engine);
        SkinAchievementsFrame(addon.GUI.AchievementsFrame, engine, skins);
        SkinAchievementSummary(addon.GUI.SummaryFrame, engine, skins);
        SkinFilterButton(addon.GUI.FilterButton, addon.GUI.AchievementsFrame, skins);
        SkinSearchBoxFrame(addon.GUI.Search.BoxFrame, addon.GUI.AchievementsFrame, skins);
        SkinSearchPreviewFrame(addon.GUI.Search.PreviewFrame, addon.GUI.AchievementsFrame, engine, skins);
        SkinSearchResultsFrame(addon.GUI.Search.ResultsFrame, skins);
        SkinSideButtons(addon.GUI.SideButtons, engine);
        SkinHeader();
        ReskinBlizzard(skins);
        SkinCalendarButton(addon.GUI.Calendar.Button, skins);
    end
    if SavedData.ElvUISkin.Calendar then
        SkinCalendarFrame(addon.GUI.Calendar.Frame, engine, skins);
        SkinCalendarSideFrame(addon.GUI.Calendar.SideFrame, engine, skins);
    end
end

local function SkinAlertFrames()
    if not SavedData.ElvUISkin.AlertFrames then
        return;
    end

    hooksecurefunc(addon.GUI.AlertSystem, "setUpFunction", function(frame)
        SkinAlertFrameTemplate(frame, engine);
    end);
end

plugins.LoadHelper:RegisterEvent("ADDON_LOADED");
plugins.LoadHelper:RegisterEvent("PLAYER_LOGIN");
function elvUI:OnEvent(event, arg1, arg2)
    if event == "PLAYER_LOGIN" then
        SkinAlertFrames();
    end
end

function elvUI.LoadLocalization(L)
    L["ElvUI"] = "ElvUI";
    L["ElvUI Desc"] = "Each of the options below are controlled by ElvUI and are just informational.\n\n" ..
                        "To change these, go to Game Menu -> ElvUI -> Skins and check the desired options. See each option below for what to check.\n ";
    L["Skin Achievements"] = "Skin Achievements";
    L["Skin Achievements Desc"] = "Applies the ElvUI skin to the Achievements Window.\n-> Blizzard + Achievements";
    L["Skin Misc Frames"] = "Skin Misc Frames";
    L["Skin Misc Frames Desc"] = "Applies the ElvUI skin to the Filter Menu, Right Click Menu and Popup Dialog.\n-> Blizzard + Misc Frames";
    L["Skin Tooltip"] = "Skin Tooltip";
    L["Skin Tooltip Desc"] = "Applies the ElvUI skin to the Tooltip.\n-> Blizzard + Tooltip";
    L["Skin Tutorials"] = "Skin Tutorials";
    L["Skin Tutorials Desc"] = "Applies the ElvUI skin to the Tutorials.\n-> Blizzard + Tutorials";
    L["Skin Alert Frames"] = "Skin Alert Frames";
    L["Skin Alert Frames Desc"] = "Applies the ElvUI skin to the Alert Frames.\n-> Blizzard + Alert Frames";
    L["Skin Calendar"] = "Skin Calendar";
    L["Skin Calendar Desc"] = "Applies the ElvUI skin to the Calendar.\n-> Blizzard + Calendar Frame";
    L["Remove Parchment"] = "Remove Parchment";
    L["Remove Parchment Desc"] = "Remove the parchment background from the Calendar Days.\n-> Parchment Remover";
    L["Skin Ace3"] = "Skin Ace3";
    L["Skin Ace3 Desc"] = "Applies the ElvUI skin to the Options.\n-> Ace3";
end

local function AddInfo(orderIndex, localizationName, getFunction)
    return {
        order = orderIndex, type = "toggle", width = "full",
        name = addon.L[localizationName],
        desc = addon.L[localizationName .. " Desc"],
        descStyle = "inline",
        get = getFunction,
        disabled = true
    };
end

function elvUI.InjectOptions()
    local optionsTable = {
        type = "group",
        name = addon.L["ElvUI"],
        args = {
            Loaded = {
                order = 1, type = "toggle", width = "full",
                name = addon.L["Loaded"],
                desc = addon.L["Loaded Desc"],
                descStyle = "inline",
                get = function() return ElvUI ~= nil end,
                disabled = true
            },
            Line = {
                order = 2, type = "header", width = "full",
                name = ""
            },
            Description = {
                order = 3, type = "description", width = "full",
                name = addon.L["ElvUI Desc"],
                fontSize = "medium"
            },
            SkinAchievement = AddInfo(4, "Skin Achievements", function() return SavedData.ElvUISkin.Achievements; end),
            SkinMiscFrames = AddInfo(5, "Skin Misc Frames", function() return SavedData.ElvUISkin.MiscFrames; end),
            SkinTooltip = AddInfo(6, "Skin Tooltip", function() return SavedData.ElvUISkin.Tooltip; end),
            SkinTutorials = AddInfo(7, "Skin Tutorials", function() return SavedData.ElvUISkin.Tutorials; end),
            SkinAlertFrames = AddInfo(8, "Skin Alert Frames", function() return SavedData.ElvUISkin.AlertFrames; end),
            SkinCalendar = AddInfo(9, "Skin Calendar", function() return SavedData.ElvUISkin.Calendar; end),
            RemoveParchment = AddInfo(10, "Remove Parchment", function() return SavedData.ElvUISkin.NoParchment; end),
            SkinAce3 = AddInfo(11, "Skin Ace3", function() return SavedData.ElvUISkin.Options; end)
        }
    };

    addon.Options.InjectOptionsTable(optionsTable, "ElvUI", "Plugins", "args");
end

function elvUI.Load()
	addon.Diagnostics.Trace("elvUISkin.Load");

    if not SavedData.ElvUISkin then
        SavedData.ElvUISkin = {}; -- First time creation
    end
    if ElvUI ~= nil then
        engine = unpack(ElvUI);
        skins = engine:GetModule("Skins");
        local privateSkins = engine.private.skins;
        local blizzardSkins = privateSkins.blizzard;

        SavedData.ElvUISkin.Achievements = blizzardSkins.enable and blizzardSkins.achievement;
        SavedData.ElvUISkin.MiscFrames = blizzardSkins.enable and blizzardSkins.misc;
        SavedData.ElvUISkin.Tooltip = blizzardSkins.enable and blizzardSkins.tooltip;
        SavedData.ElvUISkin.Tutorials = blizzardSkins.enable and blizzardSkins.tutorials;
        SavedData.ElvUISkin.AlertFrames = blizzardSkins.enable and blizzardSkins.alertframes;
        SavedData.ElvUISkin.Calendar = blizzardSkins.enable and blizzardSkins.calendar;
        SavedData.ElvUISkin.NoParchment = blizzardSkins.enable and blizzardSkins.calendar and privateSkins.parchmentRemoverEnable;
        SavedData.ElvUISkin.Options = engine.private.skins.ace3Enable;
    else
        SavedData.ElvUISkin = {};
    end

    local preHookFunction = addon.GUI.LoadWithBlizzard_AchievementUI;
    function addon.GUI:LoadWithBlizzard_AchievementUI()
        preHookFunction(self);
        SkinAll();
    end

    -- return SavedData.ElvUISkin.Achievements, engine, skins;
    addon.Diagnostics.Debug("ElvUISkin loaded");
    -- addon.Diagnostics.DebugTable(SavedData.ElvUISkin, 1);
end