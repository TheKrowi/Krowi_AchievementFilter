local _, addon = ...

local function MakeStatic(frame, rememberLastPositionOption, target)
    if not frame or not frame.ClearAllPoints or not frame:IsMovable() then
        return
    end

    if rememberLastPositionOption then
        addon.Gui:SetFrameToLastPosition(target or frame, rememberLastPositionOption)
    end

    frame:SetMovable(false)
    frame:EnableMouse(false)
    frame:SetScript("OnMouseDown", function() end)
    frame:SetScript("OnMouseUp", function() end)
end

function addon.MakeWindowStatic()
    if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
        return
    end
    MakeStatic(AchievementFrame, "AchievementWindow")
    MakeStatic(AchievementFrame.Header, "AchievementWindow", AchievementFrame)
    MakeStatic(KrowiAF_AchievementCalendarFrame, "Calendar")
    MakeStatic(KrowiAF_DataManagerFrame, "DataManager")
end

function addon.MakeMovable(frame, rememberLastPositionOption, target, point)
    if not frame or not frame.ClearAllPoints or frame:IsMovable() then -- Do not make it movable multiple times if another addon already did it
        return
    end

    if not target then
        addon.Gui:SetFrameToLastPosition(frame, rememberLastPositionOption)
    end

    target = target or frame

    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:SetScript("OnMouseDown", function(_, button)
        if button == "LeftButton" then
            target:StartMoving()
        end
    end)
    frame:SetScript("OnMouseUp", function()
        target:StopMovingOrSizing()
        if addon.Options.db.profile.Window.RememberLastPosition[rememberLastPositionOption] then
            KrowiAF_SavedData.RememberLastPosition = KrowiAF_SavedData.RememberLastPosition or {}
            KrowiAF_SavedData.RememberLastPosition[rememberLastPositionOption] = {
                X = target:GetLeft(),
                Y = target:GetTop() - UIParent:GetTop(),
                Point = point
            }
        end
    end)
end

function addon.MakeWindowMovable()
    if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
        return
    end
    addon.MakeMovable(AchievementFrame, "AchievementWindow")
    addon.MakeMovable(AchievementFrame.Header, "AchievementWindow", AchievementFrame)
    addon.MakeMovable(KrowiAF_AchievementCalendarFrame, "Calendar")
    addon.MakeMovable(KrowiAF_DataManagerFrame, "DataManager")
end