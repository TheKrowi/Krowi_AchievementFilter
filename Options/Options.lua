local _, addon = ...;
local options = addon.Options;

function options.SetMaxNumberOfSearchPreviews()
    local numberOfSearchPreviews = KrowiAF_GetOptions.GetTable(addon.Metadata.Title, "args.Search.args.SearchPreview.args.NumberOfSearchPreviews");
    numberOfSearchPreviews.max = 17 + math.floor(addon.Options.db.profile.Window.AchievementFrameHeightOffset / 29);
    return numberOfSearchPreviews;
end