local localPlayer = game:GetService("Players").LocalPlayer

local oldNamecallHook
oldNamecallHook = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    
    if (method == "FireServer" or method == "Fire") and (self.Name == "spellEvent" or self.Name == "abilityEvent" or self.Name == "localEvent") then
        local parentTool = self:FindFirstAncestorOfClass("Tool")
        if parentTool then
            local token = args[1]
            if type(token) == "string" then
                if self.Name == "spellEvent" or self.Name == "abilityEvent" then
                    self:FireServer(token)
                elseif self.Name == "localEvent" then
                    self:Fire(token)
                end
                return
            end
        end
    end
    
    return oldNamecallHook(self, ...)
end)
