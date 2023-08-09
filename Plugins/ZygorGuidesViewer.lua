-- [[ Namespaces ]] --
local _, addon = ...;
local plugins = addon.Plugins;
plugins.ZygorGuidesViewer = {};
local zygorGuidesViewer = plugins.ZygorGuidesViewer;
tinsert(plugins.Plugins, zygorGuidesViewer);

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

local function UpdateIcons()
	ZGV.SearchIconPool:ReleaseAll();

    for _, button in ipairs(addon.GUI.AchievementsFrame.ScrollView.frames) do
		local icon = ZGV.SearchIconPool:Acquire();
		icon:SetParent(button);
		icon:SetPoint("TOPRIGHT", button, "TOPRIGHT", -5, -5);
		icon:SetFrameLevel(button.Shield:GetFrameLevel() + 1);
		icon.tooltiptext = ZGV.L['achieveframe_button']:format(button.Header:GetText());
		icon:SetScript("OnClick", function(...)
            Icon_OnClick(...);
        end);

		local achievementId = button.Achievement and button.Achievement.Id;

		if achievementId and ZGV.Achievement.AvailGuides[achievementId] and button:IsShown() then
			icon:Show()
		else
			icon:Hide()
		end
	end
end

local function ScheduleUpdate()
	ZGV:ScheduleTimer(function()
        UpdateIcons();
    end,
    0.0001);
end

plugins.LoadHelper:RegisterEvent("ADDON_LOADED");
function zygorGuidesViewer:OnEvent(event, arg1, arg2)
    if event == "ADDON_LOADED" then
        if arg1 == "ZygorGuidesViewer" then
            hooksecurefunc(addon.GUI, "ToggleAchievementFrame", function(_addonName, tabName, resetView, forceOpen)
                ZGV.Achievement:IconSetup();

                if ZGV.Achievement.KrowiAF_Loaded then
                    return;
                end
                ZGV.SearchIconPool = ZGV.SearchIconPool or CreateFramePool("BUTTON", nil, "ZygorSearchButton");
                hooksecurefunc(addon.GUI.AchievementsFrame, "Update", function()
                    ScheduleUpdate();
                end);
                ZGV.Achievement.KrowiAF_Loaded = true;
            end);
        end
    end
end

function zygorGuidesViewer.InjectOptions()
    addon.InjectOptions:AddPluginTable("ZygorGuidesViewer", addon.L["Zygor Guides Viewer"], addon.L["Zygor Guides Viewer Desc"], function()
        return IsAddOnLoaded("ZygorGuidesViewer");
    end);
end