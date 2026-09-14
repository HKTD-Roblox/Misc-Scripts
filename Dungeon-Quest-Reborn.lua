local localPlayer = game:GetService("Players").LocalPlayer

local function forceTriggerSpellMechanic()
    local character = localPlayer.Character
    if not character then return end
    
    local toolList = {}
    for _, item in pairs(localPlayer.Backpack:GetChildren()) do
        if item:IsA("Tool") then
            table.insert(toolList, item)
        end
    end
    for _, item in pairs(character:GetChildren()) do
        if item:IsA("Tool") then
            table.insert(toolList, item)
        end
    end
    
    for _, tool in pairs(toolList) do
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid and tool.Parent == localPlayer.Backpack then
            humanoid:EquipTool(tool)
            task.wait(0.02)
        end
        
        local spellScript = tool:FindFirstChild("SpellScript") or tool:FindFirstChildOfClass("LocalScript")
        if spellScript then
            local scriptEnvironment = getsenv(spellScript)
            if scriptEnvironment then
                for functionName, functionObject in pairs(scriptEnvironment) do
                    if string.lower(functionName):find("cast") or string.lower(functionName):find("use") or string.lower(functionName):find("fire") then
                        if type(functionObject) == "function" then
                            task.spawn(functionObject)
                        end
                    end
                end
            end
        end
    end
end

local oldNamecallHook
oldNamecallHook = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    
    if (method == "FireServer" or method == "Fire") and (self.Name == "spellEvent" or self.Name == "abilityEvent") then
        task.spawn(forceTriggerSpellMechanic)
    end
    
    return oldNamecallHook(self, ...)
end)
