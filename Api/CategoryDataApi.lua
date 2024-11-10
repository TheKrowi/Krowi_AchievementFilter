local _, addon = ...;

KrowiAF.CategoryData = {};

function KrowiAF.AddCategoryData(id, name, canMerge)
    addon.Data.Categories[id] = addon.Objects.Category:New(id, name, canMerge);
end