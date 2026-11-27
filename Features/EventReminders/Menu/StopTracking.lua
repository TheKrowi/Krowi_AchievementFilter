local _, addon = ...
local section = {}
tinsert(addon.Gui.EventReminderMenu.Sections, section)

function section:CheckAdd()
    return true
end

local function GetTypeAsString(type)
    local eventType = KrowiAF.Enum.EventType
    for typeAsString, typeAsValue in next, eventType do
        if type == typeAsValue then
            return typeAsString
        end
    end
end

function section:Add(menu, event, menuBuilder)
    menuBuilder:CreateButtonAndAdd(
        menu,
        addon.L["Stop tracking"],
		function()
            local typeAsString = GetTypeAsString(event.Type)
            local key = "eventReminders." .. typeAsString:sub(1, 1):lower() .. typeAsString:sub(2) .. "Events" -- Calendar: eventReminders.calendarEvents
            addon.Settings.SetEntry(key, event.Id, false)
            if event.LinkedEventIds then
                for _, id in next, event.LinkedEventIds do
                    addon.Settings.SetEntry(key, id, false)
                end
            end
            addon.Gui.EventReminderSideButtonSystem:Refresh()
		end
	)
end