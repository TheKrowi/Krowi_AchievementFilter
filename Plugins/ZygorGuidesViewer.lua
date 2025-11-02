local _, addon = ...;
local zgv = {};
KrowiAF.PluginsApi:RegisterPlugin("ZygorGuidesViewer", zgv);
KrowiAF.PluginsApi:RegisterEvent("ADDON_LOADED");

local function IsLoaded()
    return C_AddOns.IsAddOnLoaded("ZygorGuidesViewer");
end

local function Icon_OnClick(self)
	local button = self:GetParent();
	local achievementId = button.Achievement.Id;
	if achievementId and ZGV.Achievement.AvailGuides[achievementId] then
		ZGV.Tabs:LoadGuideToTab(ZGV.Achievement.AvailGuides[achievementId], 1, "achieveid");
        if not ZGV:IsVisible() then
            ZGV:ToggleFrame();
        end
		return;
	end
	ZGV:Error("How odd. Achievement Zygor Button clicked, but we don't seem to have a guide for %s", button.Header:GetText());
end

local function UpdateIcon(button)
    local icon = ZGV.SearchIconPool:Acquire();
    icon:SetParent(button);
    icon:SetPoint("TOPRIGHT", button, "TOPRIGHT", -5, -5);
    icon:SetFrameLevel(button.Shield:GetFrameLevel() + 1);
    icon.tooltiptext = ZGV.L['achieveframe_button']:format(button.Header:GetText());
    icon:SetScript("OnClick", Icon_OnClick);

    local achievementId = button.Achievement and button.Achievement.Id;

    if achievementId and ZGV.Achievement.AvailGuides[achievementId] and button:IsShown() then
        icon:Show()
    else
        icon:Hide()
    end
end

local function UpdateIcons()
	ZGV.SearchIconPool:ReleaseAll();

    for _, button in ipairs(KrowiAF_AchievementsFrame.ScrollView.frames) do
		UpdateIcon(button);
	end
end

local function ScheduleUpdate()
	ZGV:ScheduleTimer(UpdateIcons, 0.0001);
end

local function IconSetup()
    ZGV.Achievement:IconSetup();

    if ZGV.Achievement.KrowiAF_Loaded then
        return;
    end

    ZGV.SearchIconPool = ZGV.SearchIconPool or CreateFramePool("BUTTON", nil, "ZygorSearchButton");
    hooksecurefunc(KrowiAF_AchievementsFrame.ScrollBox, "Update", ScheduleUpdate);
    ZGV.Achievement.KrowiAF_Loaded = true;
end

function zgv:OnEvent(event, arg1, arg2)
    if event ~= "ADDON_LOADED" or arg1 ~= "ZygorGuidesViewer" then
        return;
    end

    hooksecurefunc("KrowiAF_ToggleAchievementFrame", IconSetup);
end

function zgv:InjectOptions()
    KrowiAF.UtilApi.InjectOptions:AddPluginTable(
        "ZygorGuidesViewer",
        addon.L["Zygor Guides Viewer"],
        addon.L["Zygor Guides Viewer Desc"]:K_ReplaceVars(addon.Metadata.Title),
        function()
            return IsLoaded();
        end
    );
end