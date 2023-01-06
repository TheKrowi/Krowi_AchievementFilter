--[[
	Krowi's Util License
		Copyright ©2020-2022 The contents of this library, excluding third-party resources, are
		copyrighted to their authors with all rights reserved.

		This library is free to use and the authors hereby grants you the following rights:

		1. 	You may make modifications to this library for private use only, you
			may not publicize any portion of this library. The only exception being you may
			upload to the github website.

		2. 	Do not modify the name of this library, including the library folders.

		3. 	This copyright notice shall be included in all copies or substantial
			portions of the Software.

		All rights not explicitly addressed in this license are reserved by
		the copyright holders.
]]

local lib = LibStub:NewLibrary("Krowi_Util-1.0", 1);

if not lib then
	return;
end

function lib.ConcatTables(t1, t2)
    if t2 then
        for _, e in next, t2 do
            tinsert(t1, e);
        end
    end
    return t1;
end

function lib.InjectMetatable(tbl, meta)
    return setmetatable(tbl, setmetatable(meta, getmetatable(tbl)));
end

function lib.ReplaceVars(str, vars)
    -- Allow ReplaceVars{str, vars} syntax as well as ReplaceVars(str, {vars})
    if not vars then
        vars = str;
        str = vars[1];
    end
    return string.gsub(str, "({([^}]+)})", function(whole, i)
        if type(vars) == "table" then
            return vars[i] or whole;
        else
            return vars;
        end
    end);
end

function lib.DeepCopyTable(src, dest)
	for index, value in pairs(src) do
		if type(value) == "table" then
			dest[index] = {};
			lib.DeepCopyTable(value, dest[index]);
		else
			dest[index] = value;
		end
	end
end

function lib.ReadNestedKeys(tbl, keys)
    for _, k in ipairs(keys) do
       tbl = tbl[k];
       if tbl == nil then
          break;
       end
    end
    return tbl;
 end

function lib.WriteNestedKeys(tbl, keys, value)
    local prev_tbl, last_k;
    for _, k in ipairs(keys) do
       last_k, prev_tbl, tbl = k, tbl, tbl[k];
       if tbl == nil then
          tbl = {};
          prev_tbl[k] = tbl;
       end
    end
    prev_tbl[last_k] = value;
 end

function lib.Enum(table)
    for i, element in next, table do
        local tmp = element;
        table[tmp] = i;
    end
    return table;
end

function lib.SplitString(sre, sep)
    sep = sep or " ";
    local fields = {};
    for s in string.gmatch(sre, "([^"..sep.."]+)") do
        tinsert(fields, s);
    end
    return fields;
end