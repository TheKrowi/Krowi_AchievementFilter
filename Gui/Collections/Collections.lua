local _, addon = ...;

local loadHelper = CreateFrame("Frame");
loadHelper:RegisterEvent("ADDON_LOADED");

local function SetTabSelected(button, isSelected)
    if isSelected then
        PanelTemplates_SelectTab(button);
    else
        PanelTemplates_DeselectTab(button);
    end
end

local function SetTab(button, tabId)
    local isSelected = tabId == button:GetID();
    SetTabSelected(button, isSelected);
    KrowiAF_Collections_AchievementFrame:SetShown(isSelected);

    if not isSelected then
        return;
    end

    RunNextFrame(function()
        CollectionsJournal:SetTitle(addon.L["Achievements"]);
        CollectionsJournal:SetPortraitToAsset(addon.Metadata.Icon);
    end);
end

local function CreateAchievementsTabButton()
    local numTabs = CollectionsJournal.numTabs;
    local id = numTabs + 1;
    local button = CreateFrame("Button", CollectionsJournal:GetName() .. "Tab" .. id, CollectionsJournal, "CollectionsJournalTab", id);
    PanelTemplates_SetNumTabs(CollectionsJournal, id);
    PanelTemplates_SetTab(CollectionsJournal, tonumber(GetCVar("petJournalTab")) or 1);

    button:SetPoint("LEFT", _G[(CollectionsJournal:GetName() .. "Tab" .. numTabs)], "RIGHT", -16, 0);
    button:SetText(addon.L["Achievements"]);

    hooksecurefunc("CollectionsJournal_SetTab", function(_, tabId)
        SetTab(button, tabId);
    end);

    return button;
end

local function CreateAchievementFrame()
    CreateFrame("Frame", "KrowiAF_Collections_AchievementFrame", CollectionsJournal, "KrowiAF_Collections_AchievementFrame_Template");
end

local function LoadCollections()
    if addon.Options.db and not addon.Options.db.profile.Experimental.CollectionsAchievementWindow then
        return;
    end

    local button = CreateAchievementsTabButton();
    CreateAchievementFrame();

    -- Make sure we display everything when we are the selected tab on load
    if button:GetID() == CollectionsJournal_GetTab(CollectionsJournal) then
        SetTab(button, button:GetID());
    end
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