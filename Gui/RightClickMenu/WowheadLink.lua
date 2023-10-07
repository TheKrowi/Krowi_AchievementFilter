-- [[ Namespaces ]] --
local _, addon = ...;
local section = {};

local popupDialog = LibStub("Krowi_PopopDialog-1.0");
local relatedTabs = {
    "",
	"#criteria-of",
	"#guides",
	"#news",
	"#comments",
	"#screenshots"
};

function section.CheckAdd(achievement)
    return not achievement.HasNoWowheadLink;
end

function section.Add(menu, achievement)
	local locale = "";
	if addon.Options.db.profile.RightClickMenu.WowheadLink.AddLocale then
		locale = GetLocale();
		locale = locale:sub(1, 2);
		if locale == "zh" then
			locale = "cn"
		end
		locale = locale .. ".";
	end

	local addRelatedTab = addon.Options.db.profile.RightClickMenu.WowheadLink.AddRelatedTab;
	local relatedTab = relatedTabs[addRelatedTab];
	local wotlk = addon.IsWrathClassic and "wotlk/" or "";

	local externalLink = "https://" .. locale .. "wowhead.com/" .. wotlk .. "achievement=" .. achievement.Id .. relatedTab;
	menu:AddFull({Text = addon.L["Wowhead"], Func = function() popupDialog.ShowExternalLink(externalLink); end});
end

tinsert(addon.GUI.RightClickMenu.AchievementMenu.Sections, section);