local _, addon = ...
KrowiAF_RewardPreviewMixin = {}

KrowiAF_RewardPreviewCloseButtonMixin = {}

function KrowiAF_RewardPreviewCloseButtonMixin:OnClick()
    self:GetParent():Hide()
end

KrowiAF_RewardPreviewResizeButtonMixin = {}

function KrowiAF_RewardPreviewResizeButtonMixin:OnMouseDown()
    self:GetParent():StartSizing("BOTTOMRIGHT")
end

function KrowiAF_RewardPreviewResizeButtonMixin:OnMouseUp()
    local frame = self:GetParent()
    frame:StopMovingOrSizing()
    addon.Options.db.profile.Achievements.RewardPreviewDefaultWidth = frame:GetWidth()
    addon.Options.db.profile.Achievements.RewardPreviewDefaultHeight = frame:GetHeight()
end

KrowiAF_RewardPreviewPrevButtonMixin = {}

function KrowiAF_RewardPreviewPrevButtonMixin:OnClick()
    self:GetParent():ShowRelative(-1)
end

function KrowiAF_RewardPreviewPrevButtonMixin:OnEnter()
    local frame = self:GetParent()
    frame:SetControlRowAlpha(1)
    Krowi_Tooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip_SetTitle(Krowi_Tooltip, PREVIOUS)
    Krowi_Tooltip:Show()
end

function KrowiAF_RewardPreviewPrevButtonMixin:OnLeave()
    self:GetParent():SetControlRowAlpha(0.5)
    Krowi_Tooltip:Hide()
end

KrowiAF_RewardPreviewNextButtonMixin = {}

function KrowiAF_RewardPreviewNextButtonMixin:OnClick()
    self:GetParent():ShowRelative(1)
end

function KrowiAF_RewardPreviewNextButtonMixin:OnEnter()
    local frame = self:GetParent()
    frame:SetControlRowAlpha(1)
    Krowi_Tooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip_SetTitle(Krowi_Tooltip, NEXT)
    Krowi_Tooltip:Show()
end

function KrowiAF_RewardPreviewNextButtonMixin:OnLeave()
    self:GetParent():SetControlRowAlpha(0.5)
    Krowi_Tooltip:Hide()
end

-- Mirrors Khamul's EnsureDecorPreviewFrame default-scene fallback
local function GetDefaultSceneId()
    if Constants and Constants.HousingCatalogConsts and Constants.HousingCatalogConsts.HOUSING_CATALOG_DECOR_MODELSCENEID_DEFAULT then
        return Constants.HousingCatalogConsts.HOUSING_CATALOG_DECOR_MODELSCENEID_DEFAULT
    end
    return 859
end

local function BuildSceneCandidates(data)
    local sceneIds, seen = {}, {}
    local function AddScene(sceneId)
        if type(sceneId) == "number" and sceneId > 0 and not seen[sceneId] then
            seen[sceneId] = true
            tinsert(sceneIds, sceneId)
        end
    end

    AddScene(data.SceneId)
    if type(data.SpeciesId) == "number" and data.SpeciesId > 0 and C_PetJournal and C_PetJournal.GetPetModelSceneInfoBySpeciesID then
        local ok, petSceneId = pcall(C_PetJournal.GetPetModelSceneInfoBySpeciesID, data.SpeciesId)
        if ok then
            AddScene(petSceneId)
        end
    end
    AddScene(GetDefaultSceneId())
    AddScene(290)
    return sceneIds
end

local function ResetActorView(camera, actor, scale)
    if actor then
        pcall(actor.SetPosition, actor, 0, 0, 0)
        pcall(actor.SetYaw, actor, 0)
        pcall(actor.SetPitch, actor, 0)
        pcall(actor.SetRoll, actor, 0)
        pcall(actor.SetScale, actor, scale or 1)
    end

    if camera then
        if camera.SetNormalizedZoom then
            pcall(camera.SetNormalizedZoom, camera, 0)
        elseif camera.SetZoom then
            pcall(camera.SetZoom, camera, 0)
        end
        if camera.SetTargetOffsets then
            pcall(camera.SetTargetOffsets, camera, 0, 0, 0)
        end
    end
end

-- Model assets stream in async, so anything set right after SetModelByCreatureDisplayID/SetModelByFileID can get reset once loading finishes; reapply then too
local function ResetActorViewOnLoad(camera, actor, scale)
    ResetActorView(camera, actor, scale)
    if actor and actor.SetScript then
        pcall(actor.SetScript, actor, "OnModelLoaded", function()
            ResetActorView(camera, actor, scale)
        end)
    end
end

-- A cold model cache can take well over a frame to finish streaming in, and ModelSceneActor has no reliable "finished loading" callback, so keep nudging the scale back for a bit; PreviewToken guards against a stale retry clobbering a newer ShowEntry
local RETRY_DELAYS = {0, 0.1, 0.2, 0.4, 0.8, 1.5}
local function ScheduleScaleRetries(previewFrame, camera, actor, scale, token)
    if not scale or not C_Timer then
        return
    end
    for _, delay in next, RETRY_DELAYS do
        C_Timer.After(delay, function()
            if previewFrame.PreviewToken == token then
                ResetActorView(camera, actor, scale)
            end
        end)
    end
end

local function TryApplyActorModel(actor, data)
    if not actor then
        return false
    end
    if data.DisplayId and actor.SetModelByCreatureDisplayID and pcall(actor.SetModelByCreatureDisplayID, actor, data.DisplayId) then
        return true
    end
    if data.Asset and actor.SetModelByFileID then
        if actor.SetPreferModelCollisionBounds then
            pcall(actor.SetPreferModelCollisionBounds, actor, true)
        end
        if pcall(actor.SetModelByFileID, actor, data.Asset) then
            return true
        end
    end
    return false
end

function KrowiAF_RewardPreviewMixin:OnLoad()
    TooltipBackdropTemplateMixin.TooltipBackdropOnLoad(self)
    self:SetClampedToScreen(true)
    if self.SetResizeBounds then
        self:SetResizeBounds(200, 220)
    else
        self:SetMinResize(200, 220)
    end
    if addon.Util.IsMainline then
        self.ModelBackground:SetAtlas("catalog-list-preview-bg")
    else
        self.ModelBackground:SetTexture("Interface/AchievementFrame/UI-Achievement-AchievementBackground")
        self.ModelBackground:SetTexCoord(0, 1, 0.5, 1)
    end
    self:EnsureModelScene()
end

-- Created dynamically (not in XML) so a missing template on this client build falls back gracefully, same as Khamul's plugin
function KrowiAF_RewardPreviewMixin:EnsureModelScene()
    if self.ModelScene then
        return self.ModelScene
    end

    local ok, modelScene = pcall(CreateFrame, "ModelScene", nil, self, "PanningModelSceneMixinTemplate")
    if not ok or not modelScene then
        modelScene = CreateFrame("ModelScene", nil, self)
    end
    modelScene:SetPoint("TOPLEFT", 6, -46)
    modelScene:SetPoint("BOTTOMRIGHT", -6, 6)
    modelScene:Hide()
    self.ModelScene = modelScene

    local controlOk, controlFrame = pcall(CreateFrame, "Frame", nil, self, "ModelSceneControlFrameTemplate")
    if controlOk and controlFrame then
        controlFrame:SetPoint("BOTTOM", self, "BOTTOM", 0, 6)
        pcall(controlFrame.SetModelScene, controlFrame, modelScene)
        controlFrame:Hide()
        self.Controls = controlFrame

        -- controlFrame.zoomInButton/resetButton only exist once this template's own OnLoad has run, i.e. after CreateFrame returns
        if controlFrame.zoomInButton then
            self.PrevButton:ClearAllPoints()
            self.PrevButton:SetPoint("RIGHT", controlFrame.zoomInButton, "LEFT", -4, 0)
        end
        if controlFrame.resetButton then
            self.NextButton:ClearAllPoints()
            self.NextButton:SetPoint("LEFT", controlFrame.resetButton, "RIGHT", 4, 0)
        end

        -- Controls and its own buttons already dim/undim themselves (ModelSceneControlButtonMixin) and show a tooltip, but at the default HUD anchor;
        -- fully override OnEnter/OnLeave so the tooltip shows above the icon instead, reusing the title/body Init() already stored on the button (self.tooltip/self.tooltipText)
        local previewFrame = self
        controlFrame:HookScript("OnEnter", function() previewFrame:SetControlRowAlpha(1) end)
        controlFrame:HookScript("OnLeave", function() previewFrame:SetControlRowAlpha(0.5) end)
        for _, buttonKey in next, {"zoomInButton", "zoomOutButton", "rotateLeftButton", "rotateRightButton", "resetButton"} do
            local button = controlFrame[buttonKey]
            if button then
                button:SetScript("OnEnter", function(btn)
                    previewFrame:SetControlRowAlpha(1)
                    Krowi_Tooltip:SetOwner(btn, "ANCHOR_TOP")
                    GameTooltip_SetTitle(Krowi_Tooltip, btn.tooltip)
                    if btn.tooltipText then
                        GameTooltip_AddNormalLine(Krowi_Tooltip, btn.tooltipText)
                    end
                    Krowi_Tooltip:Show()
                end)
                button:SetScript("OnLeave", function()
                    previewFrame:SetControlRowAlpha(0.5)
                    Krowi_Tooltip:Hide()
                end)
            end
        end
    end

    -- ModelScene/Controls are created after the XML children exist, so raise the corner buttons above them
    self.CloseButton:SetFrameLevel(modelScene:GetFrameLevel() + 10)
    self.ResizeButton:SetFrameLevel(modelScene:GetFrameLevel() + 10)
    self.PrevButton:SetFrameLevel(modelScene:GetFrameLevel() + 10)
    self.NextButton:SetFrameLevel(modelScene:GetFrameLevel() + 10)

    return modelScene
end

-- Fades Controls (Blizzard zoom/rotate/reset row) together with our own Prev/Next buttons, so the whole row dims/brightens as one unit
function KrowiAF_RewardPreviewMixin:SetControlRowAlpha(alpha)
    if self.Controls then
        self.Controls:SetAlpha(alpha)
    end
    self.PrevButton:SetAlpha(alpha)
    self.NextButton:SetAlpha(alpha)
end

function KrowiAF_RewardPreviewMixin:ShowEntry(entry)
    self.PreviewToken = (self.PreviewToken or 0) + 1
    local token = self.PreviewToken
    local data = addon.RewardPreviewData.BuildPreviewData(entry)
    local modelScene = self:EnsureModelScene()
    modelScene:Hide()
    if self.Controls then
        self.Controls:Hide()
    end

    if not data then
        return
    end

    for _, sceneId in next, BuildSceneCandidates(data) do
        local sceneOk = pcall(function()
            modelScene:TransitionToModelSceneID(sceneId, CAMERA_TRANSITION_TYPE_IMMEDIATE, CAMERA_MODIFICATION_TYPE_DISCARD, true)
        end)
        if sceneOk then
            local camera = modelScene.GetActiveCamera and modelScene:GetActiveCamera()
            if camera and camera.SetLeftMouseButtonYMode then
                local invert = addon.Options.db.profile.Achievements.RewardPreviewInvertVerticalRotation
                camera:SetLeftMouseButtonYMode(ORBIT_CAMERA_MOUSE_MODE_PITCH_ROTATION, invert)
            end

            local actor
            if modelScene.GetActorByTag then
                actor = modelScene:GetActorByTag("unwrapped")
                    or modelScene:GetActorByTag("mount")
                    or modelScene:GetActorByTag("pet")
                    or modelScene:GetActorByTag("npc")
                    or modelScene:GetActorByTag("decor")
                    or modelScene:GetActorByTag("player")
            end
            if not actor and modelScene.GetPlayerActor then
                actor = modelScene:GetPlayerActor()
            end

            if actor and TryApplyActorModel(actor, data) then
                modelScene:Show()
                if self.Controls then
                    self.Controls:Show()
                end
                -- Show() re-fits the camera/actor to the scene's default framing, so (re)apply after it
                ResetActorViewOnLoad(camera, actor, data.Scale)
                ScheduleScaleRetries(self, camera, actor, data.Scale, token)
                break
            end
        end
    end
end

function KrowiAF_RewardPreviewMixin:OnMouseDown()
    if self.Pinned then
        self:StartMoving()
    end
end

function KrowiAF_RewardPreviewMixin:OnMouseUp()
    self:StopMovingOrSizing()
end

-- Steps to the next/previous option within the current collapsed reward group (wraps around); no-op if not browsing a group
function KrowiAF_RewardPreviewMixin:ShowRelative(offset)
    local list = self.EntryList
    if not list or #list < 2 then
        return
    end

    local index
    for i, entry in next, list do
        if entry == self.OwnerEntry then
            index = i
            break
        end
    end
    index = ((index or 1) - 1 + offset) % #list + 1

    addon.Gui.RewardPreview:ShowUnpinned(self.OwnerButton, self.OwnerAchievementId, list[index], list)
    self.Pinned = true
end

-- Every close forgets the pin/anchor state, so the next open always snaps back to the triggering button
function KrowiAF_RewardPreviewMixin:OnHide()
    self:StopMovingOrSizing()
    self.Pinned = nil
    self.OwnerButton = nil
    self.OwnerEntry = nil
    self.OwnerAchievementId = nil
    self.EntryList = nil
    self.OwnerWindow = nil
end
