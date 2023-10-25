local _, addon = ...;
addon.Gui.AchievementsObjectives = {};
local achievementsObjectives = addon.Gui.AchievementsObjectives;

function achievementsObjectives:Load()
	CreateFrame("Frame", "KrowiAF_AchievementsObjectives", nil, "KrowiAF_AchievementsObjectives_Template");
	ACHIEVEMENTBUTTON_METAROWHEIGHT = addon.Util.IsWrathClassic and 28 or ACHIEVEMENTBUTTON_METAROWHEIGHT;
	addon.Gui.AchievementsObjectives = nil;
end