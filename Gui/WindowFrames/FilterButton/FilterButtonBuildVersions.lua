local _, addon = ...
addon.FilterButtonBuildVersions = {}
local buildVersions = addon.FilterButtonBuildVersions

local versionNodes
local majorLabelFormat = "%s.x.x"
local minorLabelFormat = "%s.%s.x"
local patchLabelFormat = "%s.%s.%s"

local function BuildNodes()
    versionNodes = {
        majors = {},
        hasMultipleMajors = addon.Data.BuildVersionsGrouped and #addon.Data.BuildVersionsGrouped > 1 or false
    }

    if not addon.Data.BuildVersionsGrouped then
        return
    end

    for _, major in next, addon.Data.BuildVersionsGrouped do
        local majorNode = {
            label = string.format(majorLabelFormat, major.Major),
            minors = {}
        }

        for _, minor in next, major.Minors do
            local minorNode = {
                label = string.format(minorLabelFormat, major.Major, minor.Minor),
                patches = {}
            }

            for _, patch in next, minor.Patches do
                table.insert(minorNode.patches, {
                    id = patch.BuildVersionId,
                    label = string.format(patchLabelFormat, major.Major, minor.Minor, patch.Patch)
                })
            end

            table.insert(majorNode.minors, minorNode)
        end

        table.insert(versionNodes.majors, majorNode)
    end
end

local function GetNodes()
    if not versionNodes or (#versionNodes.majors == 0 and addon.Data.BuildVersionsGrouped and #addon.Data.BuildVersionsGrouped > 0) then
        BuildNodes()
    end
    return versionNodes
end

local function IsPatchChecked(filters, patchId)
    return addon.Util.ReadNestedKeys(filters, {"BuildVersion", patchId})
end

local function IsMinorChecked(filters, minorNode)
    for _, patch in next, minorNode.patches do
        if not IsPatchChecked(filters, patch.id) then
            return false
        end
    end
    return true
end

local function IsMajorChecked(filters, majorNode)
    for _, minorNode in next, majorNode.minors do
        if not IsMinorChecked(filters, minorNode) then
            return false
        end
    end
    return true
end

local function OnPatchSelect(owner, filters, patches, checked)
    for _, patch in next, patches do
        owner:SetSelected(filters, {"BuildVersion", patch.id}, not checked, true, true)
    end
end

local function OnMinorSelect(owner, filters, minorNode)
    local checked = IsMinorChecked(filters, minorNode)
    OnPatchSelect(owner, filters, minorNode.patches, checked)
    owner:UpdateAchievementFrame()
end

local function OnMajorSelect(owner, filters, majorNode)
    local checked = IsMajorChecked(filters, majorNode)
    for _, minorNode in next, majorNode.minors do
        OnPatchSelect(owner, filters, minorNode.patches, checked)
    end
    owner:UpdateAchievementFrame()
end

local function CreateMinorVersionGroup(owner, majorGroup, filters, minorNode)
    return owner.menuBuilder:CreateCustomCheckbox(
        majorGroup,
        minorNode.label,
        function()
            return IsMinorChecked(filters, minorNode)
        end,
        function()
            OnMinorSelect(owner, filters, minorNode)
        end
    )
end

local function CreateMinorVersion(owner, majorGroup, filters, minorNode)
    local mb = owner.menuBuilder
    if #minorNode.patches <= 1 then
        mb:CreateCheckbox(majorGroup, minorNode.patches[1].label, filters, {"BuildVersion", minorNode.patches[1].id}, true)
        return
    end

    local minorGroup = CreateMinorVersionGroup(owner, majorGroup, filters, minorNode)
    for _, patch in next, minorNode.patches do
        mb:CreateCheckbox(minorGroup, patch.label, filters, {"BuildVersion", patch.id}, true)
    end
end

local function CreateMajorVersion(owner, versionMenu, filters, majorNode)
    local majorGroup = owner.menuBuilder:CreateCustomCheckbox(
        versionMenu,
        majorNode.label,
        function()
            return IsMajorChecked(filters, majorNode)
        end,
        function()
            OnMajorSelect(owner, filters, majorNode)
        end
    )

    for _, minorNode in next, majorNode.minors do
        CreateMinorVersion(owner, majorGroup, filters, minorNode)
    end
end

local function OnAllVersionsSelect(owner, filters, value)
    local nodes = GetNodes()
    if not nodes or not nodes.majors then
        return
    end

    for _, majorNode in next, nodes.majors do
        for _, minorNode in next, majorNode.minors do
            for _, patch in next, minorNode.patches do
                owner:SetSelected(filters, {"BuildVersion", patch.id}, value, true, true)
            end
        end
    end
    owner:UpdateAchievementFrame()
end

local function CreateSelectDeselectAllVersions(owner, versionMenu, filters)
    local mb = owner.menuBuilder
    mb:CreateDivider(versionMenu)
    mb:CreateSelectDeselectAllButtons(versionMenu, filters, nil, function(_, callbackFilters, _, value)
        OnAllVersionsSelect(owner, callbackFilters, value)
    end)
end

function buildVersions.CreateBuildVersionFilter(owner, menu, filters)
    local mb = owner.menuBuilder
    local versionMenu = mb:CreateSubmenuButton(menu, addon.L["Version"])
    local nodes = GetNodes()

    if nodes then
        if nodes.hasMultipleMajors then
            for _, majorNode in next, nodes.majors do
                CreateMajorVersion(owner, versionMenu, filters, majorNode)
            end
        else
            local majorNode = nodes.majors[1]
            if majorNode then
                for _, minorNode in next, majorNode.minors do
                    CreateMinorVersion(owner, versionMenu, filters, minorNode)
                end
            end
        end
    end

    CreateSelectDeselectAllVersions(owner, versionMenu, filters)
    mb:AddChildMenu(menu, versionMenu)
end