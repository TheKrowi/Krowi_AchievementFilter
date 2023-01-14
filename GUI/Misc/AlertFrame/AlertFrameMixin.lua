-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_AlertFrameMixin = {};

function KrowiAF_AlertFrameMixin:UpdateEventRuntime()
    local runtime = addon.GUI.AlertSystem.GetRuntimeText(self.Event);
    self.Unlocked:SetText(runtime);
end