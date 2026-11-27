local _, addon = ...
local options = addon.Options

-- The option tables by name: the six pages register here (General, Layout, Profiles, Plugins, Credits, Features) and
-- KrowiAF_GetOptions, the plugins and a few options read them back. It replaced AceConfig's registry, which handed back
-- the very table it was given (docs/work/2026-11-25-leave-aceconfig); the options window reads the tables itself
-- (Options/Window/Source.lua).
options.Registry = {}
local registry = options.Registry
local registered = {}

function registry.Register(appName, optionsTable)
    registered[appName] = optionsTable
end

function registry.Get(appName)
    return registered[appName]
end

-- A description's "Default value" line, from a setting's declared default (docs/work/2026-11-25-settings-store,
-- requirement 10): key, the select's values, and for a map entry its keys a and b (for an object, a is the field).
-- Replaces Krowi_Util's version, which read a path in the AceDB defaults; Krowi_Util still writes the line, so the
-- text is the same.
string[addon.Metadata.Acronym .. "_AddDefaultValueText"] = function(str, key, values, a, b)
    local declaration = addon.Settings.Declaration(key)
    if not declaration then error("no setting " .. tostring(key) .. " for a default value line", 2) end
    local default = declaration.Default
    if declaration.Kind == "map" then
        default = addon.Settings.EntryDefault(key, a, b)
    elseif declaration.Kind == "object" then
        default = default[a] -- an element of the object (a sort list's place)
    end
    return str:K_AddDefaultValueText({ value = default }, "value", values)
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
    numberOfSearchPreviews.max = 17 + math.floor(addon.Settings.Get("window.achievementFrameHeightOffset") / 29)
    return numberOfSearchPreviews
end