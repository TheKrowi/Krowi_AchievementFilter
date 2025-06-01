local _, addon = ...;

local loadHelper = CreateFrame("Frame");
loadHelper:RegisterEvent("ADDON_LOADED");

local id;
local function CreateAchievementsTabButton()
    local numTabs = CollectionsJournal.numTabs;
    id = numTabs + 1;
    local button = CreateFrame("Button", CollectionsJournal:GetName() .. "Tab" .. id, CollectionsJournal, "CollectionsJournalTab", id);
    PanelTemplates_SetNumTabs(CollectionsJournal, id);
    PanelTemplates_SetTab(CollectionsJournal, tonumber(GetCVar("petJournalTab")) or 1);

    button:SetPoint("LEFT", _G[(CollectionsJournal:GetName() .. "Tab" .. numTabs)], "RIGHT", -16, 0);
    button:SetText(addon.L["Achievements"]);
end

local function CreateAchievementFrame()
    CreateFrame("Frame", "KrowiAF_Collections_AchievementFrame", CollectionsJournal, "KrowiAF_Collections_AchievementFrame_Template");
end

local function LoadCollections()
    if addon.Options.db and not addon.Options.db.profile.Experimental.CollectionsAchievementWindow then
        return;
    end

    CreateAchievementsTabButton();

    hooksecurefunc("CollectionsJournal_UpdateSelectedTab", function(self)
        local selected = CollectionsJournal_GetTab(self);

        if selected ~= id then
            return;
        end

        KrowiAF_Collections_AchievementFrame:SetShown(selected == id);

        CollectionsJournal:SetTitle(addon.L["Achievements"]);

        EventRegistry:TriggerEvent("CollectionsJournal.TabSet", CollectionsJournal, selected);
    end);

    CreateAchievementFrame();
end

if CollectionsJournal then
    LoadCollections();
else
    function loadHelper:OnEvent(event, arg1, arg2)
        if event == "ADDON_LOADED" then
            if arg1 == "Blizzard_Collections" then
                LoadCollections();
            end
        end
    end
    loadHelper:SetScript("OnEvent", loadHelper.OnEvent);
end