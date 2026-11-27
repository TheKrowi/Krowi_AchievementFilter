-- [[ Namespaces ]] --
local _, addon = ...
addon.Diagnostics = {}
local diagnostics = addon.Diagnostics

diagnostics.DebugEnabled = nil -- Determines if printing debug messages is allowed
diagnostics.TraceEnabled = nil -- Determines if printing trace messages is allowed

function diagnostics.Debug(value, forced) -- Print the value to the DEFAULT_CHAT_FRAME
    if diagnostics.DebugEnabled() or forced then
        DEFAULT_CHAT_FRAME:AddMessage(addon.Metadata.Title .. " - " .. tostring(value))
    end
end

function diagnostics.DebugTable(table, charactersPerLine, forced) -- Print the table to the DEFAULT_CHAT_FRAME
    if diagnostics.DebugEnabled() or forced then
        if type(charactersPerLine) ~= "number" then
            charactersPerLine = 100
        end
		for line in TableToString(table, charactersPerLine):gmatch("[^\r\n]+") do
			DEFAULT_CHAT_FRAME:AddMessage(line)
		end
    end
end

function diagnostics.Trace(value) -- Print the value to the DEFAULT_CHAT_FRAME
    if diagnostics.TraceEnabled() then
        DEFAULT_CHAT_FRAME:AddMessage(addon.Metadata.Title .. " - " .. tostring(value))
    end
end

function diagnostics.Load() -- Load the diagnostics
    diagnostics.DebugEnabled = function()
        return addon.Settings.Get("advanced.debugInfo") -- Needs a function because these change during run time
    end
    diagnostics.TraceEnabled = function()
        return addon.Settings.Get("advanced.traceInfo") -- Needs a function because these change during run time
    end
    -- What the migrations did at this load, kept until now: they ran before this switch could be read
    -- (Settings/Migrations.lua, docs/work/2026-11-25-settings-store)
    for _, line in ipairs(addon.Settings.Migrations.Log) do
        diagnostics.Debug(line)
    end
end

function diagnostics.Print(...)
    if diagnostics.DebugEnabled() then
        print(addon.Metadata.Title, ...)
    end
end