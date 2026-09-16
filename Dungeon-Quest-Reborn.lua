local localPlayer = game:GetService("Players").LocalPlayer
local runService = game:GetService("RunService")

local function enforceHealthConstraint(humanoid)
    if humanoid then
        humanoid.Health = humanoid.MaxHealth
    end
end

local function applyPartChannelSecurity(part)
    if part:IsA("BasePart") then
        part.CanTouch = false
        part.Massless = true
    end
end

local function applyGlobalCollisionOverride(character)
    for _, part in pairs(character:GetChildren()) do
        applyPartChannelSecurity(part)
    end
end

local function monitorCharacterNode(character)
    if not character then return end
    local humanoid = character:WaitForChild("Humanoid", 10)
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 10)
    
    if humanoid and humanoidRootPart then
        enforceHealthConstraint(humanoid)
        
        humanoid:GetPropertyChangedSignal("Health"):Connect(function()
            if humanoid.Health < humanoid.MaxHealth then
                enforceHealthConstraint(humanoid)
            end
        end)
        
        humanoid:GetPropertyChangedSignal("MaxHealth"):Connect(function()
            enforceHealthConstraint(humanoid)
        end)
        
        runService.Stepped:Connect(function()
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
        
        runService.Heartbeat:Connect(function()
            if humanoid.Health > 0 and humanoidRootPart then
                local currentVelocity = humanoidRootPart.AssemblyLinearVelocity
                humanoidRootPart.AssemblyLinearVelocity = Vector3.new(currentVelocity.X, 0, currentVelocity.Z)
                humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            end
        end)
        
        character.ChildAdded:Connect(function(child)
            if child:IsA("BasePart") then
                applyPartChannelSecurity(child)
            end
        end)
    end
end

local oldMetatableIndex
oldMetatableIndex = hookmetamethod(game, "__index", function(self, key)
    if self:IsA("Humanoid") and self.Parent == localPlayer.Character then
        if key == "Health" then
            return self.MaxHealth
        end
    end
    return oldMetatableIndex(self, key)
end)

local oldMetatableNewIndex
oldMetatableNewIndex = hookmetamethod(game, "__newindex", function(self, key, value)
    if self:IsA("Humanoid") and self.Parent == localPlayer.Character then
        if key == "Health" and value < self.Health then
            return
        end
    end
    return oldMetatableNewIndex(self, key, value)
end)

localPlayer.CharacterAdded:Connect(function(newCharacter)
    task.wait(0.5)
    applyGlobalCollisionOverride(newCharacter)
    monitorCharacterNode(newCharacter)
end)

runService.RenderStepped:Connect(function()
    local character = localPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            enforceHealthConstraint(humanoid)
        end
    end
end)

if localPlayer.Character then
    applyGlobalCollisionOverride(localPlayer.Character)
    monitorCharacterNode(localPlayer.Character)
end
