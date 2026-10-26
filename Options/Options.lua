local _, addon = ...
local options = addon.Options

-- Closes the settings panel before the addon shows a window or page over the game. Close(true) commits and hides it
-- without Blizzard's way back to the game menu, whose ToggleGameMenu calls the protected SpellStopCasting
-- (docs/work/2026-10-11-latent-bugs). With unapplied settings Close asks through a popup whose buttons would then take
-- that way tainted, and in combat HideUIPanel refuses addon code, so the panel then stays open for the player to close.
-- Callers outside the panel (the options window) reach it too, so it does nothing while the panel is closed.
function options.CloseSettingsPanel()
    if not SettingsPanel:IsShown() or InCombatLockdown() or SettingsPanel:HasUnappliedSettings() then
        return
    end
    SettingsPanel:Close(true)
end

-- Binds key to command in slot 1 or 2, the way Blizzard's key bindings page does (Blizzard_Keybindings.lua
-- ProcessInput): both keys come off and go back in order, the new one in its slot, in the command's binding context.
-- SetBinding's third argument is that context, not the slot; passing the slot bound the key in a housing editor context
-- on Retail, so the key never worked and the option showed Not bound. An empty key clears the slot.
local strayContexts = { "HousingEditor", "HousingEditorBasicDecorMode" } -- where the slot as context put keys
function options.SetKeyBinding(key, command, slot)
    local context = C_KeyBindings and C_KeyBindings.GetBindingContextForAction and C_KeyBindings.GetBindingContextForAction(command) or nil
    local keys = { GetBindingKey(command, nil, context) }
    for i = 1, 2 do
        if keys[i] then SetBinding(keys[i], nil, context) end
    end
    keys[slot] = key ~= "" and key or nil
    if keys[1] and keys[1] == keys[2] then keys[2] = nil end
    for i = 1, 2 do
        if keys[i] then SetBinding(keys[i], command, context) end
    end
    if Enum.BindingContext then
        for _, name in ipairs(strayContexts) do
            local stray = Enum.BindingContext[name]
            if stray and stray ~= context then
                for _, strayKey in ipairs({ GetBindingKey(command, nil, stray) }) do SetBinding(strayKey, nil, stray) end
            end
        end
    end
    SaveBindings(GetCurrentBindingSet())
end

function options.SetMaxNumberOfSearchPreviews()
    local numberOfSearchPreviews = KrowiAF_GetOptions.GetTable(addon.Metadata.Prefix .. "_Layout", "args.Search.args.SearchPreview.args.NumberOfSearchPreviews")
    numberOfSearchPreviews.max = 17 + math.floor(addon.Options.db.profile.Window.AchievementFrameHeightOffset / 29)
    return numberOfSearchPreviews
end