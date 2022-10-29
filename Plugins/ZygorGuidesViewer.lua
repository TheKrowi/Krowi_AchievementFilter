-- [[ Namespaces ]] --
local _, addon = ...;
local plugins = addon.Plugins;
plugins.ZygorGuidesViewer = {};
local zygorGuidesViewer = plugins.ZygorGuidesViewer;
tinsert(plugins.Plugins, zygorGuidesViewer);

local function Icon_OnClick(self, but)
	local achievebut = self:GetParent();
	local achieveID = achievebut.Achievement.Id;
	if achieveID and ZGV.Achievement.AvailGuides[achieveID] then
		ZGV.Tabs:LoadGuideToTab(ZGV.Achievement.AvailGuides[achieveID], 1, "achieveid");
        if not ZGV:IsVisible() then
            ZGV:ToggleFrame();
        end
		return;
	end
	ZGV:Error("How odd. Achievement Zygor Button clicked, but we don't seem to have a guide for %s", achievebut.label:GetText());
end

local function UpdateIcons()
	ZGV.SearchIconPool:ReleaseAll();

	for i, blizzbutton in ipairs(addon.GUI.AchievementsFrame.ScrollFrame.buttons) do
		local button = ZGV.SearchIconPool:Acquire();
		button:SetParent(blizzbutton);
		button:SetPoint("TOPRIGHT", blizzbutton, "TOPRIGHT", -5, -5);
		button:SetFrameLevel(blizzbutton.Shield:GetFrameLevel() + 1);
		button.tooltiptext = ZGV.L['achieveframe_button']:format(blizzbutton.Header:GetText());
		button:SetScript("OnClick", function(...)
            Icon_OnClick(...);
        end);

		local achieveID = blizzbutton.Achievement.Id;

		if achieveID and ZGV.Achievement.AvailGuides[achieveID] and blizzbutton:IsShown() then
			button:Show()
		else
			button:Hide()
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

function zygorGuidesViewer.LoadLocalization(L)
    L["Zygor Guides Viewer"] = "Zygor Guides Viewer";
    L["Zygor Guides Viewer Desc"] = "This plugin adds the magnifying glasses again to the Blizzard Achievements tab.\n\nThere are no options.";
end

function zygorGuidesViewer.InjectOptions()
    local optionsTable = {
        type = "group",
        name = addon.L["Zygor Guides Viewer"],
        args = {
            Loaded = {
                order = 1, type = "toggle", width = "full",
                name = addon.L["Loaded"],
                desc = addon.L["Loaded Desc"],
                descStyle = "inline",
                get = function() return IsAddOnLoaded("ZygorGuidesViewer") end,
                disabled = true
            },
            Line = {
                order = 2, type = "header", width = "full",
                name = ""
            },
            Description = {
                order = 3, type = "description", width = "full",
                name = addon.L["Zygor Guides Viewer Desc"],
                fontSize = "medium"
            }
        }
    };

    addon.Options.InjectOptionsTable(optionsTable, "ZygorGuidesViewer", "Plugins", "args");
end