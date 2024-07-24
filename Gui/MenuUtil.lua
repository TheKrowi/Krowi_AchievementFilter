local _, addon = ...;
addon.Gui.MenuUtil = {};
local menuUtil = addon.Gui.MenuUtil;

do -- Modern
    function menuUtil:CreateTitle(menu, text)
        menu:CreateTitle(text);
    end

    function menuUtil:CreateButton(menu, text, func)
        return menu:CreateButton(text, func);
    end

    function menuUtil:CreateDivider(menu)
        menu:CreateDivider();
    end

    function menuUtil:AddChildMenu(menu, child)

    end

    function menuUtil:CreateButtonAndAdd(menu, text, func)
        return self:CreateButton(menu, text, func);
    end
end

if addon.Util.IsTheWarWithin then
    return;
end

do -- Classic
    function menuUtil:CreateTitle(menu, text)
        menu:AddTitle(text);
    end

    function menuUtil:CreateButton(menu, text, func)
        return addon.Objects.MenuItem:New({
            Text = text,
            Func = func
        });
    end

    function menuUtil:CreateDivider(menu)
        menu:AddSeparator();
    end

    function menuUtil:AddChildMenu(menu, child)
        if not menu or not child then
            return;
        end
        menu:Add(child);
    end

    function menuUtil:CreateButtonAndAdd(menu, text, func)
        self:AddChildMenu(menu, self:CreateButton(nil, text, func));
    end
end