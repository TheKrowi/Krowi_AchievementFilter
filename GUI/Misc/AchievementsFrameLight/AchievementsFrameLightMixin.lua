-- [[ Namespaces ]] --
local _, addon = ...;

AchievementsFrameLightMixin = {};

local function ReskinHybridScrollFrame(scrollFrame)
    local scrollBar = scrollFrame.ScrollBar;
    scrollBar.ScrollBarTop:Hide();
    scrollBar.ScrollBarMiddle:Hide();
    scrollBar.ScrollBarBottom:Hide();
    scrollBar.trackBG:SetPoint("TOPLEFT", scrollBar.ScrollUpButton, "BOTTOMLEFT", 0, 10);
    scrollBar.trackBG:SetPoint("BOTTOMRIGHT", scrollBar.ScrollDownButton, "TOPRIGHT", -1, -10);
end

local alwaysHideBorder, cachedAchievements;
function AchievementsFrameLightMixin:Build(point, relativeTo, relativePoint, offsetXShow, offsetYShow, offsetXHide, offsetYHide, _alwaysHideBorder)
    alwaysHideBorder = _alwaysHideBorder;
    if alwaysHideBorder then
        self.NineSlice:Hide();
    end

    local scrollFrame = self.ScrollFrame;
    local scrollBar = scrollFrame.ScrollBar;

    ReskinHybridScrollFrame(scrollFrame);

    local scrollBarShow = getmetatable(scrollBar).__index.Show;
    scrollBar.Show = function(selfFunc)
        self:SetPoint(point, relativeTo, relativePoint, offsetXShow, offsetYShow);
        scrollBarShow(selfFunc);
    end
    local scrollBarHide = getmetatable(scrollBar).__index.Hide;
    scrollBar.Hide = function(selfFunc)
        self:SetPoint(point, relativeTo, relativePoint, offsetXHide, offsetYHide);
        scrollBarHide(selfFunc);
    end

    scrollFrame.update = function()
		self:Update(cachedAchievements);
	end

    HybridScrollFrame_CreateButtons(scrollFrame, "KrowiAF_AchievementButton_Light_Template", 4, 0);
    local buttons = scrollFrame.buttons;
    for _, button in next, buttons do
        button:PostLoad(scrollFrame);
    end
end

local function ShowEmptyText(self)
    self.EmptyText:Show();
    self.ScrollFrame:Hide();
    self.NineSlice:Hide();
end

local function HideEmptyText(self)
    self.EmptyText:Hide();
    self.ScrollFrame:Show();
    if not alwaysHideBorder then
        self.NineSlice:Show();
    end
end

function AchievementsFrameLightMixin:Update(achievements, refreshAchievements)
    local numAchievements = achievements and #achievements or 0;
    HideEmptyText(self);
    if numAchievements <= 0 then
        ShowEmptyText(self);
        return;
    end
    cachedAchievements = achievements;

    local scrollFrame = self.ScrollFrame;
    local offset = HybridScrollFrame_GetOffset(scrollFrame);
    local buttons = scrollFrame.buttons;

    local buttonHeight = buttons[1]:GetHeight();
    local numButtons = min(math.ceil(scrollFrame:GetHeight() / buttonHeight) + 1, #buttons);

	local displayedHeight = 0;
    local id;
    for i = 1, numButtons do
        local button = buttons[i];
        id = achievements[i + offset];
        if id ~= nil then
            displayedHeight = displayedHeight + buttonHeight;
            button:SetAchievement(addon.Data.Achievements[id], refreshAchievements);
            button:Show();
        else
            button:Hide();
        end
        if button:IsMouseOver() then
            KrowiAF_AchievementButton_Light_OnEnter(button);
        end
    end

    local totalHeight = numAchievements * buttonHeight;
    HybridScrollFrame_Update(scrollFrame, totalHeight, displayedHeight);
end