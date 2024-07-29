local _, addon = ...;
local section = {};
tinsert(addon.Gui.RightClickMenu.AchievementMenu.Sections, section);

local popupDialog = LibStub("Krowi_PopopDialog-1.0");
local relatedTabs = {
    "",
	"#criteria-of",
	"#guides",
	"#news",
	"#comments",
	"#screenshots"
};

function section:CheckAdd(achievement)
    return not achievement.HasNoWowheadLink;
end

function section:Add(menu, achievement)
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
	local expansion = "";
	if addon.Util.IsWrathClassic then
		expansion = "wotlk/";
	elseif addon.Util.IsCataClassic then
		expansion = "cata/";
	end

	local externalLink = "https://" .. locale .. "wowhead.com/" .. expansion .. "achievement=" .. achievement.Id .. relatedTab;
    addon.MenuUtil:CreateButtonAndAdd(
		menu,
		addon.L["Wowhead"],
		function()
			popupDialog.ShowExternalLink(externalLink);
		end
	);
end