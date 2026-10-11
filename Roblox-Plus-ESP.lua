local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local PREMIUM_IMAGE = "rbxassetid://112351619369374"

local function clearESP(character)
    if not character then return end
    local highlight = character:FindFirstChild("PremiumHighlight")
    if highlight then highlight:Destroy() end
    local billboard = character:FindFirstChild("PremiumBillboard")
    if billboard then billboard:Destroy() end
end

local function applyESP(player)
    if player == LocalPlayer then return end
    if player.MembershipType ~= Enum.MembershipType.Premium then return end

    local character = player.Character
    if not character then return end

    local hrp = character:FindFirstChild("HumanoidRootPart")
    local head = character:FindFirstChild("Head")
    if not hrp or not head then return end

    clearESP(character)

    local highlight = Instance.new("Highlight")
    highlight.Name = "PremiumHighlight"
    highlight.Adornee = character
    highlight.FillTransparency = 1
    highlight.OutlineTransparency = 0
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = character

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "PremiumBillboard"
    billboard.Adornee = head
    billboard.Size = UDim2.new(0, 40, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 2.8, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = math.huge
    billboard.Parent = character

    local image = Instance.new("ImageLabel")
    image.Size = UDim2.new(1, 0, 1, 0)
    image.BackgroundTransparency = 1
    image.Image = PREMIUM_IMAGE
    image.Parent = billboard
end

local function watchPlayer(player)
    if player == LocalPlayer then return end

    local function onCharacter(character)
        task.wait(0.5)
        applyESP(player)
    end

    if player.Character then
        task.spawn(onCharacter, player.Character)
    end

    player.CharacterAdded:Connect(onCharacter)

    player:GetPropertyChangedSignal("MembershipType"):Connect(function()
        if player.Character then
            applyESP(player)
        end
    end)
end

for _, player in ipairs(Players:GetPlayers()) do
    watchPlayer(player)
end

Players.PlayerAdded:Connect(watchPlayer)

Players.PlayerRemoving:Connect(function(player)
    if player.Character then
        clearESP(player.Character)
    end
end)
