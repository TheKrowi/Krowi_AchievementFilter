-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.CompareFunc = {};
local compareFunc = objects.CompareFunc;

local function StringToLower(a, b)
    return a:lower(), b:lower();
end

local function DoNothing(a, b)
    return a, b;
end

local function NilToFalse(x)
    if x == nil then
        return false;
    end
    return x;
end

local function NilToNil(x)
    return x
end

local function CompareNormal(a, b, reverse)
    if reverse then
        return a > b;
    end
    return a < b;
end

local function CompareBool(a, b, reverse)
    if reverse then
        return a and not b;
    end
    return b and not a;
end

compareFunc.__index = compareFunc;
function compareFunc:New(type, property)
    -- if type(func) ~= "function" then
    --     error("Usage: New(func)", 2);
    -- end

    local self = {};
    setmetatable(self, compareFunc);

    self.ToLower = type == "string" and StringToLower or DoNothing;
    self.NilTo = type == "bool" and NilToFalse or NilToNil;
    self.DoCompare = type =="bool" and CompareBool or CompareNormal;
    self.Property = property;
    self:SetDefaultFallback();

    return self;
end

function compareFunc:Compare(a, b)
    local propA, propB = self.NilTo(a[self.Property]), self.NilTo(b[self.Property]);
    if propA == nil then
        return false;
    end
    if propB == nil then
        return true;
    end

    propA, propB = self.ToLower(propA, propB);
    if propA == propB then
        return self.Fallback:Compare(a, b);
    end

    return self.DoCompare(propA, propB, self.Reverse);
end

function compareFunc:SetDefaultFallback()
    self.Fallback = {
        Compare = function(selfFunc, a, b)
            return false;
        end
    };
end