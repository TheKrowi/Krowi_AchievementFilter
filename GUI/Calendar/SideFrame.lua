-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.Calendar.SideFrame = {};
local sideFrame = addon.GUI.Calendar.SideFrame;

sideFrame.__index = sideFrame; -- Used to inject all the namespace functions to the frame
function sideFrame:Load()
    local parent = addon.GUI.Calendar.Frame;
	local frame = CreateFrame("Frame", "KrowiAF_AchievementCalendarSideFrame", parent, "KrowiAF_AchievementCalendarSideFrame_Template");
    frame:SetPoint("TOPLEFT", parent, "TOPRIGHT", 0, -24);
    frame:SetPoint("BOTTOM", parent, "BOTTOM", 0, 0); --320
	addon.Util.InjectMetatable(frame, sideFrame); -- Inject all the namespace functions to the frame

    frame:BuildAchievementsScrollFrame();

	addon.GUI.Calendar.SideFrame = frame; -- Overwrite with the actual frame since all functions are injected to it
end

function KrowiAF_AchievementCalendarSideFrame_OnShow(self)
    local frame = addon.GUI.Calendar.Frame;
    local day, month, year = frame.HighlightedDay, frame.HighlightedMonth, frame.HighlightedYear;
    self:UpdateAchievements();
    self.Header:Setup(FormatShortDate(day, month, year) .. " (" .. #frame.HighlightedAchievements .. " " .. addon.L["Achievements"] .. " - " .. frame.HighlightedPoints .. " " .. addon.L["Points"] .. ")");
end

function KrowiAF_AchievementCalendarSideFrameCloseButton_OnClick(self)
    KrowiAF_AchievementCalendarDayButton_OnClick(addon.GUI.Calendar.Frame.SelectedDayButton);
    self:GetParent():Hide();
	PlaySound(SOUNDKIT.IG_MAINMENU_QUIT);
end

local function ReskinHybridScrollFrame(scrollFrame)
    local scrollBar = scrollFrame.ScrollBar;
    scrollBar.ScrollBarTop:Hide();
    scrollBar.ScrollBarMiddle:Hide();
    scrollBar.ScrollBarBottom:Hide();
    scrollBar.trackBG:SetPoint("TOPLEFT", scrollBar.ScrollUpButton, "BOTTOMLEFT", 0, 10);
    scrollBar.trackBG:SetPoint("BOTTOMRIGHT", scrollBar.ScrollDownButton, "TOPRIGHT", -1, -10);
end

function sideFrame:BuildAchievementsScrollFrame()
    local frame = self.ScrollFrameBorder;
    local scrollFrame = frame.Container;
    local scrollBar = scrollFrame.ScrollBar;

    ReskinHybridScrollFrame(scrollFrame);

    local show = getmetatable(scrollBar).__index.Show;
    scrollBar.Show = function(selfFunc)
        frame:SetPoint("BOTTOMRIGHT", frame:GetParent(), "BOTTOMRIGHT", -31, 10);
        show(selfFunc);
    end
    local hide = getmetatable(scrollBar).__index.Hide;
    scrollBar.Hide = function(selfFunc)
        frame:SetPoint("BOTTOMRIGHT", frame:GetParent(), "BOTTOMRIGHT", -14, 20);
        hide(selfFunc);
    end

    scrollFrame.update = function()
		self:UpdateAchievements();
	end

    HybridScrollFrame_CreateButtons(scrollFrame, "KrowiAF_AchievementFrameSummaryFrameAchievementButton_Template", 4, 0);

    local buttons = scrollFrame.buttons;
    for _, button in next, buttons do
        button:SetPoint("RIGHT", scrollFrame, -5, 0);
        button.label:SetWidth(360);
        button:HookScript("OnClick", function()
            addon.GUI.Calendar.Frame:Hide();
        end);
    end
end

function sideFrame:UpdateAchievements()
    local achievements = addon.GUI.Calendar.Frame.HighlightedAchievements;

    if not achievements then
        self:Hide();
        return;
    end

    local scrollFrame = self.ScrollFrameBorder.Container;
    local offset = HybridScrollFrame_GetOffset(scrollFrame);
    local buttons = scrollFrame.buttons;

    local totalHeight = #achievements * buttons[1]:GetHeight();
	local displayedHeight = 0;

    local id, name, points, completed, description, flags, icon, wasEarnedByMe, earnedBy;
    for i = 1, #buttons do
        local button = buttons[i];
        id = achievements[i + offset];
        displayedHeight = displayedHeight + button:GetHeight();
        if id ~= nil then
            _, name, points, completed, _, _, _, description, flags, icon, _, _, wasEarnedByMe, earnedBy, _ = addon.GetAchievementInfo(id);

            local achievement = addon.Data.Achievements[id];
            button.Achievement = achievement;

            local saturatedStyle;
            if achievement.NotObtainable then
                saturatedStyle = "NotObtainable";
            else
                if bit.band(flags, ACHIEVEMENT_FLAGS_ACCOUNT) == ACHIEVEMENT_FLAGS_ACCOUNT then
                    button.accountWide = true;
                    saturatedStyle = "account";
                else
                    button.accountWide = nil;
                    saturatedStyle = "normal";
                end
            end

            button.label:SetText(name);
            button.description:SetText(description);
            AchievementShield_SetPoints(points, button.shield.points, GameFontNormal, GameFontNormalSmall);
            if points > 0 then
                button.shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields]]);
            else
                button.shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields-NoPoints]]);
            end

            button.shield.wasEarnedByMe = not (completed and not wasEarnedByMe);
            button.shield.earnedBy = earnedBy;

            button.icon.texture:SetTexture(icon);
            button.id = id;

            button.dateCompleted:SetText("");

            if button.saturatedStyle ~= saturatedStyle then
                button:Saturate();
            end
            button.tooltipTitle = nil;

            button:Show();
        else
            button.Achievement = nil;

            button:Hide();
        end
        if button:IsMouseOver() then
            KrowiAF_AchievementFrameSummaryFrameAchievementButton_OnEnter(button);
        end
    end
    HybridScrollFrame_Update(scrollFrame, totalHeight, displayedHeight);
end