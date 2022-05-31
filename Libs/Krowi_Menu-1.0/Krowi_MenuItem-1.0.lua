--[[
	Krowi's Menu License
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

local lib = LibStub:NewLibrary("Krowi_MenuItem-1.0", 1);

if not lib then
	return;
end

local popupDialog = LibStub("Krowi_PopopDialog-1.0");

-- [[ Constructors ]] --
lib.__index = lib;
function lib:New(info)
    local self = {};
    setmetatable(self, lib);

    for k, v in next, info do
        self[k] = v;
    end

    return self;
end

function lib:NewExtLink(text, externalLink)
    return lib:New({Text = text, Func = function() popupDialog.ShowExternalLink(externalLink); end});
end

-- [[ Other ]] --
function lib:Add(item)
    if self.Children == nil then
        self.Children = {}; -- By creating the children table here we reduce memory usage because not every category has children
    end

    tinsert(self.Children, item);

    return item;
end

function lib:AddFull(info)
    return self:Add(lib:New(info));
end

function lib:AddSeparator()
    return self:AddFull({IsSeparator = true});
end

function lib:AddExtLinkFull(text, externalLink)
    return self:Add(lib:NewExtLink(text, externalLink));
end