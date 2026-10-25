local _, addon = ...
local options = addon.Options
local window = options.Window
local L = addon.L

-- The one page the addon keeps in Settings > AddOns: its name, version and the way into the options window, which
-- replaced the six AceConfig pages there (docs/work/2026-10-25-options-revamp). The window has HIGH strata like the
-- settings panel, so it shows above the panel when the panel cannot close (in combat, or with unapplied settings).
local function CreateStub()
    local frame = CreateFrame("Frame")

    local title = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalHuge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText(addon.Metadata.Title)

    local version = frame:CreateFontString(nil, "ARTWORK", "GameFontDisableSmall")
    version:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -6)
    version:SetText(addon.Util.L["Version"] .. " " .. addon.Metadata.Version)

    local text = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    text:SetPoint("TOPLEFT", version, "BOTTOMLEFT", 0, -20)
    text:SetPoint("RIGHT", -16, 0)
    text:SetJustifyH("LEFT")
    text:SetText(L["The options and how each feature works are in the addon's own window."])

    local button = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    button:SetSize(180, 26)
    button:SetPoint("TOPLEFT", text, "BOTTOMLEFT", 0, -16)
    button:SetText(L["Open options"])
    button:SetScript("OnClick", function()
        options.CloseSettingsPanel()
        options.Open()
    end)

    local ways = frame:CreateFontString(nil, "ARTWORK", "GameFontDisable")
    ways:SetPoint("TOPLEFT", button, "BOTTOMLEFT", 0, -16)
    ways:SetPoint("RIGHT", -16, 0)
    ways:SetJustifyH("LEFT")
    ways:SetText(L["It also opens with /kaf, the minimap icon and the Options entry of the achievement window's filter menu."])

    return frame
end

window.StubCategory = Settings.RegisterCanvasLayoutCategory(CreateStub(), addon.Metadata.Title)
Settings.RegisterAddOnCategory(window.StubCategory)