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

local function ResetActorView(camera, actor)
    if actor then
        pcall(actor.SetPosition, actor, 0, 0, 0)
        pcall(actor.SetYaw, actor, 0)
        pcall(actor.SetPitch, actor, 0)
        pcall(actor.SetRoll, actor, 0)
        pcall(actor.SetScale, actor, 1)
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
    end

    -- ModelScene/Controls are created after the XML children exist, so raise the corner buttons above them
    self.CloseButton:SetFrameLevel(modelScene:GetFrameLevel() + 10)
    self.ResizeButton:SetFrameLevel(modelScene:GetFrameLevel() + 10)

    return modelScene
end

function KrowiAF_RewardPreviewMixin:ShowEntry(entry)
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
                ResetActorView(camera, actor)
                modelScene:Show()
                if self.Controls then
                    self.Controls:Show()
                end
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

-- Every close forgets the pin/anchor state, so the next open always snaps back to the triggering button
function KrowiAF_RewardPreviewMixin:OnHide()
    self:StopMovingOrSizing()
    self.Pinned = nil
    self.OwnerButton = nil
    self.OwnerWindow = nil
end
