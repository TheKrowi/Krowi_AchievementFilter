-- [[ Namespaces ]] --
local _, addon = ...;

function KrowiAF_AlertFrame_OnClick(self, button, down)
    if AlertFrame_OnClick(self, button, down) then
		return; -- Handle right-click and close the alert
	end

    if not IsAddOnLoaded("Blizzard_AchievementUI") then
        LoadAddOn("Blizzard_AchievementUI");
    end

    local category = KrowiAF_SelectCategory(self.Event.Category);
    if category.NumOfAch == 0 then
        addon.GUI.AchievementsFrame.Text:Show();
        addon.GUI.AchievementsFrame.Text:SetText(addon.Util.ReplaceVars
        {
            addon.L["Category shown temporarily"],
            eventName = self.Event.EventDetails.Name;
        });
    end
end

function KrowiAF_AlertFrame_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if self.TimeSinceLastUpdate > 1 then
        self:UpdateEventRuntime();
        self.TimeSinceLastUpdate = 0;
    end
end

local function LoadIfWrathClassic(self)
    if addon.IsWrathClassic then
        self.glow:SetTexture("Interface/AddOns/Krowi_AchievementFilter/Media/AchievementToast");
        self.glow:SetTexCoord(0.0009765625, 0.3076171875, 0.169921875, 0.302734375);
        self.shine:SetTexture("Interface/AddOns/Krowi_AchievementFilter/Media/AchievementToast");
        self.shine:SetTexCoord(0.9296875, 0.9951171875, 0.169921875, 0.2529296875);
        self.Icon.Overlay:SetTexture("Interface/AddOns/Krowi_AchievementFilter/Media/AchievementToast");
        self.Icon.Overlay:SetTexCoord(0.107421875, 0.1796875, 0.505859375, 0.578125);
    end
end

function KrowiAF_AlertFrame_Small_OnLoad(self)
    LoadIfWrathClassic(self);
    self.Background:SetTexture("Interface/AddOns/Krowi_AchievementFilter/Media/AlertFrameCompact");
    self.Background:SetTexCoord(0, 1, 0, 1);
    self.Name:SetPoint("LEFT", 50, 0);
    self.Unlocked:SetPoint("TOP", 0, -35);
    self.Unlocked:SetPoint("LEFT", 50, 0);
    self.glow:SetHeight(116);
    self.shine:SetHeight(65);
    self.Icon:SetSize(50, 50);
    self.Icon:SetPoint("LEFT", 5, -1);
    self.Icon.Texture:SetSize(36, 36);
    self.Icon.Overlay:SetSize(50, 50);
end

function KrowiAF_AlertFrame_Normal_OnLoad(self)
    LoadIfWrathClassic(self);
end