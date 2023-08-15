-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.FilterButton = {};
local filterButton = gui.FilterButton;

function filterButton:Load()
    local button = CreateFrame("DropDownToggleButton", "KrowiAF_AchievementFrameFilterButton", AchievementFrame, "KrowiAF_AchievementFrameFilterButton_Template");
	button:SetFrameLevel(button:GetParent():GetFrameLevel() + 7);

    -- addon.Filters:Load();
    addon.Filters:ResetFilters();

	tinsert(addon.GUI.SubFrames, button);

    -- if addon.IsWrathClassic then
    --     button:SetScript("OnShow", filterButton.OnShow);
    --     button:SetScript("OnHide", filterButton.OnHide);
    -- else -- We don't need this in retail
    --     filterButton.OnShow = nil;
    --     filterButton.OnHide = nil;
    -- end

	addon.GUI.FilterButton = button; -- Overwrite with the actual frame since all functions are injected to it
end

-- function filterButton.OnShow(self)
--     AchievementFrameHeaderLeftDDLInset:Show();
-- end

-- function filterButton.OnHide(self)
--     AchievementFrameHeaderLeftDDLInset:Hide();
-- end

local menu = LibStub("Krowi_Menu-1.0");
function KrowiAF_AchievementFrameFilterButton_OnMouseDown(self)
    -- UIMenuButtonStretchMixin.OnMouseDown(self);
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);

    -- Reset menu
	menu:Clear();

    -- Category Filters
    menu:AddFull({  Text = addon.L["Categories"],
                    IsTitle = true
                });

    self:AddCheckBox(menu, addon.L["Merge Small Categories"], addon.Filters.db.profile, {"MergeSmallCategories"});

    menu:AddSeparator();

    -- Achievement Filters
    menu:AddFull({  Text = addon.L["Achievements"],
                    IsTitle = true
                });

    self:AddAchievementFilters(menu, nil, addon.Filters.db.profile);
    local earnedBy = addon.Objects.MenuItem:New({Text = addon.L["Earned By"]});
    self:AddRadioButton(menu, earnedBy, addon.Filters.Account, addon.Filters.db, {"EarnedBy"}, false);
    self:AddRadioButton(menu, earnedBy, addon.Filters.CharacterAccount, addon.Filters.db, {"EarnedBy"}, false);
    self:AddRadioButton(menu, earnedBy, addon.Filters.CharacterOnly, addon.Filters.db, {"EarnedBy"}, false);
    menu:Add(earnedBy);

    menu:AddSeparator();

    -- Filters per Tab
    menu:AddFull({  Text = addon.L["Tabs"],
                    IsTitle = true
                });

    for _, t in next, addon.TabsOrder do
        self:AddAchievementFilters(menu, addon.Objects.MenuItem:New({Text = addon.Tabs[t].Text}), addon.Tabs[t].Filters);
    end
    menu:AddSeparator();

    -- Special Categories Filters
    menu:AddFull({  Text = addon.L["Special Categories"],
                    IsTitle = true
                });

    self:AddAchievementFilters(menu, addon.Objects.MenuItem:New({Text = addon.L["Current Zone"]}), addon.Filters.db.profile.CurrentZone);
    self:AddAchievementFilters(menu, addon.Objects.MenuItem:New({Text = addon.L["Selected Zone"]}), addon.Filters.db.profile.SelectedZone);
    self:AddAchievementFilters(menu, addon.Objects.MenuItem:New({Text = addon.L["Tracking Achievements"]}), addon.Filters.db.profile.TrackingAchievements);

    menu:AddSeparator();

    -- Other
    local help = addon.Objects.MenuItem:New({
        Text = (addon.Tutorials.FeaturesTutorial:HasUnviewedPages() and "|T132049:0|t" or "") .. addon.L["Help"]
    });

    local pages = addon.Tutorials.FeaturesTutorial.Pages;

    help:AddFull({Text = addon.L["View Tutorial"], IsTitle = true});
    for i, _ in next, pages do
        help:AddFull({ Text = (pages[i].IsViewed and "" or "|T132049:0|t") .. string.format(addon.Util.Colors.White, addon.Util.Colors.RemoveColor(pages[i].SubTitle)),
                        Func = function()
                            menu:Close();
                            addon.Tutorials.FeaturesTutorial:ShowTutorial(i);
                        end
                    });
    end
    menu:Add(help);

    menu:AddFull({  Text = addon.L["Options"],
                    Func = function()
                        addon.Options.Open();
                    end
                });

    if addon.Options.db.profile.ShowPlaceholdersFilter then
        menu:AddSeparator();
        self:AddCheckBox(menu, addon.L["Show placeholders"], addon.Filters.db, {"ShowPlaceholders"});
    end
	menu:Toggle(self, 96, 15);
end