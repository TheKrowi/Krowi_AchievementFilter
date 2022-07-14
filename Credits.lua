-- [[ Namespaces ]] --
local _, addon = ...;
addon.Credits = {};
local credits = addon.Credits;

local specialThanks = {
    {Name = "Bur", Realm = "Frostmane EU", Class = "DRUID", Text = "Continuous support and helpful input and answers on questions that make this addon better; It wouldn't be as good without you :)"},
}

function credits.GetSpecialThanksAsString()
    local text = "";
    for _, specialTnx in next, specialThanks do
        local _, _, _, argbHex = GetClassColor(specialTnx.Class);
        text = text .. "|c" .. argbHex .. specialTnx.Name .. "|r";
        if specialTnx.Realm then
            text = text .. " - " .. specialTnx.Realm;
        end
        if specialTnx.Text then
            text = text .. " - " .. specialTnx.Text;
        end
        text = text .. "\n";
    end
    return text;
end

local donations = {
    {Name = "Bur", Realm = "Frostmane EU", Class = "DRUID"},
    {Name = "Ta", Realm = "Der Rat von Dalaran EU", Class = "SHAMAN"},
    {Name = "Estellar", Realm = "Bronze Dragonflight EU", Class = "PALADIN"},
    {Name = "Seby", Realm = "TwistingNether EU", Class = "HUNTER"},
}

function credits.GetDonationsAsString()
    local text = "";
    for _, donation in next, donations do
        local _, _, _, argbHex = GetClassColor(donation.Class);
        text = text .. "|c" .. argbHex .. donation.Name .. "|r";
        if donation.Realm then
            text = text .. " - " .. donation.Realm;
        end
        text = text .. "\n";
    end
    return text;
end

local localizations = {
    {Name = "Ta", Realm = "Der Rat von Dalaran EU", Class = "SHAMAN", Language = "German"},
    {Name = "牛奶斩", Realm = "格瑞姆巴托 CN", Class = "DRUID", Language = "Chinese (Simplified)"},
}

function credits.GetLocalizationsAsString()
    local text = "";
    for _, localization in next, localizations do
        local _, _, _, argbHex = GetClassColor(localization.Class);
        text = text .. "|c" .. argbHex .. localization.Name .. "|r";
        if localization.Realm then
            text = text .. " - " .. localization.Realm;
        end
        if localization.Language then
            text = text .. " - " .. localization.Language;
        end
        text = text .. "\n";
    end
    return text;
end