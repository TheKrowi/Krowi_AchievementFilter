local _, addon = ...;
local shared = addon.Data.CustomCriteriaData.Shared;

KrowiAF.CustomCriteriaData.TheWarWithin = {
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