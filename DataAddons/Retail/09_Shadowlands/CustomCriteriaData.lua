local _, addon = ...;
local shared = addon.Data.CustomCriteriaData.Shared;

KrowiAF.CustomCriteriaData.Shadowlands = {
    { -- Synthesized!
        15406,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                return tonumber((GetStatistic(15406)));
            end,
            ReqQuantity = 1,
        }
    },
    { -- Synthe-fived!
        15407,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                return tonumber((GetStatistic(15407)));
            end,
            ReqQuantity = 5,
        }
    },
    { -- Synthe-superfived!
        15410,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                return tonumber((GetStatistic(15410)));
            end,
            ReqQuantity = 25,
        }
    },
    { -- Synthe-supersized!
        15411,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                return tonumber((GetStatistic(15411)));
            end,
            ReqQuantity = 50,
        }
    },
};