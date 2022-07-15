-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.CompareFunc = {};
local compareFunc = objects.CompareFunc;

local function stringToLower(a, b)
    return a:lower(), b:lower();
end

local function doNothing(a, b)
    return a, b;
end

compareFunc.__index = compareFunc;
function compareFunc:New(type, property)
    -- if type(func) ~= "function" then
    --     error("Usage: New(func)", 2);
    -- end

    local self = {};
    setmetatable(self, compareFunc);

    self.ToLower = type == "string" and stringToLower or doNothing;
    self.Property = property;
    self:SetDefaultFallback();

    return self;
end

function compareFunc:Compare(a, b)
    local propA, propB = a[self.Property], b[self.Property];
    if propA == nil then
        return false;
    end
    if propB == nil then
        return true;
    end

    propA, propB = self.ToLower(propA, propB);
    if propA == propB then
        print("equal", propA, propB, a, b, self.Fallback.Property)
        return self.Fallback:Compare(a, b);
    end

    if self.Reverse then
        return propA > propB;
    end
    return propA < propB;
end

function compareFunc:SetDefaultFallback()
    self.Fallback = {
        Compare = function(selfFunc, a, b)
            return false;
        end
    };
end