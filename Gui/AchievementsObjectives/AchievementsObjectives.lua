local _, addon = ...;
addon.Gui.AchievementsObjectives = {};
local achievementsObjectives = addon.Gui.AchievementsObjectives;

function achievementsObjectives:Load()
	CreateFrame("Frame", "KrowiAF_AchievementsObjectives", nil, "KrowiAF_AchievementsObjectives_Template");

	if addon.IsWrathClassic then -- 14 by default
		ACHIEVEMENTBUTTON_METAROWHEIGHT = 28;
	end
end