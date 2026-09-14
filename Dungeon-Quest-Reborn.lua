local oldNamecallHook
oldNamecallHook = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    
    if (method == "FireServer" or method == "Fire") then
        if self.Name == "spellEvent" or self.Name == "abilityEvent" then
            local currentToken = args[1]
            if type(currentToken) == "string" then
                self:FireServer(currentToken)
                return
            end
        elseif self.Name == "localEvent" then
            local currentToken = args[1]
            if type(currentToken) == "string" then
                self:Fire(currentToken)
                return
            end
        end
    end
    
    return oldNamecallHook(self, ...)
end)
