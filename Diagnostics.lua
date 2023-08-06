-- [[ Namespaces ]] --
local _, addon = ...;
addon.Diagnostics = {};
local diagnostics = addon.Diagnostics;

diagnostics.DebugEnabled = nil; -- Determines if printing debug messages is allowed
diagnostics.TraceEnabled = nil; -- Determines if printing trace messages is allowed

function diagnostics.Debug(value, forced) -- Print the value to the DEFAULT_CHAT_FRAME
    if diagnostics.DebugEnabled() or forced then
        DEFAULT_CHAT_FRAME:AddMessage(addon.Metadata.Title .. " - " .. tostring(value));
    end
end

function diagnostics.DebugTable(table, charactersPerLine, forced) -- Print the table to the DEFAULT_CHAT_FRAME
    if diagnostics.DebugEnabled() or forced then
        if type(charactersPerLine) ~= "number" then
            charactersPerLine = 100;
        end
		for line in TableToString(table, charactersPerLine):gmatch("[^\r\n]+") do
			DEFAULT_CHAT_FRAME:AddMessage(line);
		end
    end
end

function diagnostics.Trace(value) -- Print the value to the DEFAULT_CHAT_FRAME
    if diagnostics.TraceEnabled() then
        DEFAULT_CHAT_FRAME:AddMessage(addon.Metadata.Title .. " - " .. tostring(value));
    end
end

function diagnostics.Load() -- Load the diagnostics
    diagnostics.DebugEnabled = function()
        return addon.Options.db.profile.EnableDebugInfo; -- Needs a function because these change during run time
    end;
    diagnostics.TraceEnabled = function()
        return addon.Options.db.profile.EnableTraceInfo; -- Needs a function because these change during run time
    end;
end

function diagnostics.Print(...)
    if diagnostics.DebugEnabled() then
        print(addon.Metadata.Title, ...)
    end
end