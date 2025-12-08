local _, addon = ...;
local shared = addon.Data.CustomCriteriaData.Shared;

KrowiAF.CustomCriteriaData.Dragonflight = {
    { -- Plunderkind
        20509,
        {
            NumCriteria = 1,
            QuantityFunc = function()
                return tonumber(C_CurrencyInfo.GetCurrencyInfo(2922).quantity);
            end,
            ReqQuantity = 1000000,
        }
    },
};