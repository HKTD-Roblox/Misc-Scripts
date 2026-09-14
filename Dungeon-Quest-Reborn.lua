local localPlayer = game:GetService("Players").LocalPlayer

local function freezeHealthBar()
    local character = localPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = humanoid.MaxHealth
            humanoid:GetPropertyChangedSignal("Health"):Connect(function()
                humanoid.Health = humanoid.MaxHealth
            end)
        end
    end
end

local oldNamecallHook
oldNamecallHook = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    
    if (method == "FireServer" or method == "Fire") then
        if self.Name == "spellEvent" or self.Name == "abilityEvent" then
            local token = args
            if type(token) == "string" then
                self:FireServer(token)
                return
            end
        elseif self.Name == "localEvent" then
            local token = args
            if type(token) == "string" then
                self:Fire(token)
                return
            end
        end
    end
    
    return oldNamecallHook(self, ...)
end)

localPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    freezeHealthBar()
end)

task.spawn(function()
    while true do
        task.wait(0.1)
        freezeHealthBar()
    end
end)
