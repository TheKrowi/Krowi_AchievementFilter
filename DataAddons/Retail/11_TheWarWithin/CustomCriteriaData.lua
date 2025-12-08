local _, addon = ...;
local shared = addon.Data.CustomCriteriaData.Shared;

local baseCriteriaId = 108648;
local criteriaIdOffsets = {-288, -272, 3, 7, 6, 0, 8, 4, 9, 5, 2, 1};

KrowiAF.CustomCriteriaData.TheWarWithin = {
    { -- Lub and Plunder
        41152,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                return tonumber(C_CurrencyInfo.GetCurrencyInfo(2922).quantity);
            end,
            ReqQuantity = 2000,
        }
    },
    { -- Swabbie Swag
        41153,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                return tonumber(C_CurrencyInfo.GetCurrencyInfo(2922).quantity);
            end,
            ReqQuantity = 10000,
        }
    },
    { -- Decked Out
        41154,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                return tonumber(C_CurrencyInfo.GetCurrencyInfo(2922).quantity);
            end,
            ReqQuantity = 25000,
        }
    },
    { -- Buckled Up
        41156,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                return tonumber(C_CurrencyInfo.GetCurrencyInfo(2922).quantity);
            end,
            ReqQuantity = 50000,
        }
    },
    { -- Plunder Siege
        41157,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                return tonumber(C_CurrencyInfo.GetCurrencyInfo(2922).quantity);
            end,
            ReqQuantity = 100000,
        }
    },
    { -- It's a Plunderful Life
        41160,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                return tonumber(C_CurrencyInfo.GetCurrencyInfo(2922).quantity);
            end,
            ReqQuantity = 250000,
        }
    },
    { -- Lord of the Bling
        41163,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                return tonumber(C_CurrencyInfo.GetCurrencyInfo(2922).quantity);
            end,
            ReqQuantity = 150000,
        }
    },
    { -- Bringing Order to the Isles
        42565,
        {
            NumCriteria = 12,
            ReturnFunc = function(criteriaIndex)
                local _, _, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID, eligible, duration, elapsed = KrowiAF_origGetAchievementCriteriaInfoById(42565, baseCriteriaId + criteriaIdOffsets[criteriaIndex]);
                return (GetClassInfo(criteriaIndex)), 0, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID, eligible, duration, elapsed;
            end,
        }
    },
    { -- Argussian Reach
        42627,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                return tonumber(C_Reputation.GetFactionDataByID(2170).currentStanding);
            end,
            ReqQuantity = 42000,
        }
    },
    { -- The Armies of Legionfall
        42655,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                return tonumber(C_Reputation.GetFactionDataByID(2045).currentStanding);
            end,
            ReqQuantity = 42000,
        }
    },
};